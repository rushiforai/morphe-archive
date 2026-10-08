/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 *
 * Built on icysymmetra/tiktok-patches-for-morphe (GPL-3.0).
 */
package app.morphe.extension.tiktok.feed;

import android.app.Activity;
import android.app.Application;
import android.graphics.Rect;
import android.os.Bundle;
import android.text.Layout;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import app.morphe.extension.shared.GlobalLayoutHook;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.tiktok.blockauthor.CurrentVideoAuthor;
import app.morphe.extension.tiktok.blockauthor.FeedVisibility;
import app.morphe.extension.tiktok.blockauthor.Reflect;
import app.morphe.extension.tiktok.interaction.GestureActions;
import app.morphe.extension.tiktok.settings.Settings;
import app.morphe.extension.tiktok.settings.SettingsStatus;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Objects;

/**
 * Puts the country a video was posted from next to the creator's name on the feed, and on a
 * video opened from search, a profile or a sound, which plays in a detail pager of its own.
 *
 * The name lives in a {@code title} button, which is a generic id the comment rows use as
 * well, so the row is identified structurally instead: the feed's author row is the parent
 * that holds both {@code title} and {@code tv_post_time}. The region comes from the Aweme
 * that {@link CurrentVideoAuthor} says is on screen, so it follows the player rather than
 * the feed's prefetch.
 */
public final class AuthorRegion {
    private static final String NAME_ID = "title";
    private static final String POST_TIME_ID = "tv_post_time";

    /** Separates the name from the country, matching the row's own middle dot. */
    private static final String SEPARATOR = " · ";

    private static int nameViewId;
    private static int postTimeViewId;

    private static WeakReference<Activity> activityReference = new WeakReference<>(null);
    private static final GlobalLayoutHook LAYOUT_HOOK = new GlobalLayoutHook();

    /** The name as TikTok wrote it, before a country was appended to it. */
    private static WeakReference<TextView> decoratedName = new WeakReference<>(null);
    private static CharSequence originalName;

    /** Exactly what was written over it, so a row TikTok has since rebound is left alone. */
    private static CharSequence decoratedText;

    /** What that text was asked to say, so a name shortened to fit still counts as settled. */
    private static String decoratedHandle;
    private static String decoratedRegion;

    private static WeakReference<Application> followed = new WeakReference<>(null);

    /** The region is read by reflection, so it is resolved once per video, not per frame. */
    private static WeakReference<Object> regionAweme = new WeakReference<>(null);
    private static String regionValue;

    private static WeakReference<Object> handleAweme = new WeakReference<>(null);
    private static String handleValue;

    private AuthorRegion() {
    }

    /** Called from the patched {@code MainActivity.onCreate} and {@code DetailActivity.onCreate}; the work is posted. */
    public static void install(Activity activity) {
        if (activity == null) {
            return;
        }
        Utils.runOnMainThread(() -> {
            follow(activity.getApplication());
            installNow(activity);
        });
    }

    /**
     * A video opened from search, a profile or a sound plays in its own activity, with the same
     * author row, and the hook only watched the main feed's window, so those videos never got a
     * country (#75). The hook moves to whichever feed window comes to the front.
     */
    private static void follow(Application application) {
        if (application == null || followed.get() == application) {
            return;
        }
        followed = new WeakReference<>(application);
        application.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
            @Override public void onActivityResumed(Activity resumed) {
                if (FeedVisibility.isFeedWindow(resumed) && resumed != activityReference.get()) {
                    installNow(resumed);
                }
            }

            @Override public void onActivityCreated(Activity created, Bundle state) { }
            @Override public void onActivityStarted(Activity started) { }
            @Override public void onActivityPaused(Activity paused) { }
            @Override public void onActivityStopped(Activity stopped) { }
            @Override public void onActivitySaveInstanceState(Activity activity, Bundle state) { }
            @Override public void onActivityDestroyed(Activity destroyed) { }
        });
    }

    private static void installNow(Activity activity) {
        try {
            if (activity.isFinishing()) {
                // Only the window the hook is on is torn down. A detail page whose posted install
                // runs after the user has already gone back would otherwise strip the feed's row
                // and take its hook, and the feed has resumed by then, so nothing reinstalls it.
                if (activity == activityReference.get()) {
                    stop();
                }
                return;
            }
            if (activity != activityReference.get()) {
                // The row in the window left behind gets its own name back.
                restore();
            }
            ViewGroup root = activity.findViewById(android.R.id.content);
            if (root == null) {
                stop();
                Logger.printInfo(() -> "Author region found no content view to watch");
                return;
            }
            // The running package, not TikTok's: a cloned build renames it, resource table and all (#59).
            // Both windows share it, so once found the ids hold for the process.
            if (nameViewId == 0 || postTimeViewId == 0) {
                nameViewId = activity.getResources().getIdentifier(NAME_ID, "id", activity.getPackageName());
                postTimeViewId = activity.getResources().getIdentifier(POST_TIME_ID, "id", activity.getPackageName());
            }
            if (nameViewId == 0 || postTimeViewId == 0) {
                stop();
                Logger.printInfo(() -> "Author region could not resolve the feed name row");
                return;
            }

            boolean installed = LAYOUT_HOOK.install(root, AuthorRegion::apply);
            activityReference = new WeakReference<>(activity);
            if (installed) {
                Logger.printDebug(() -> "Author region installed");
            }
            // A window coming back from behind a detail page need not lay out again, and its video
            // can be the one the detail page played, so no video change follows either.
            Utils.runOnMainThread(AuthorRegion::apply);
        } catch (Throwable ex) {
            Logger.printException(() -> "Could not install the author region", ex);
        }
    }

    /**
     * Takes the hook off and forgets the window it was on. Remembering it would leave the feed
     * bare: a detail page that finishes as it resumes takes the hook, and when the feed comes
     * back it still looks like the window the hook is on, so nothing installs it again.
     */
    private static void stop() {
        LAYOUT_HOOK.detach();
        restore();
        activityReference = new WeakReference<>(null);
    }

    /**
     * The player moved on to another video. A layout pass usually follows and does this anyway,
     * but a detail page lays out first while the feed's video is still the current one, and
     * nothing on it may lay out again once its own video starts.
     */
    public static void onVideoChanged() {
        if (!SettingsStatus.authorRegionEnabled || activityReference.get() == null) {
            return;
        }
        Utils.runOnMainThread(AuthorRegion::apply);
    }

    private static void apply() {
        try {
            Activity activity = activityReference.get();
            if (activity == null) {
                LAYOUT_HOOK.detach();
                return;
            }
            if (activity.isFinishing()) {
                stop();
                return;
            }

            if (!FeedVisibility.isOnFeed(activity)) {
                restore();
                return;
            }

            // Resolving the text first keeps the view tree search off the layout path for
            // every video that has nothing to show.
            String[] wanted = decoration(CurrentVideoAuthor.getAweme());
            if (wanted == null) {
                restore();
                return;
            }

            decorate(findName(activity.findViewById(android.R.id.content)), wanted[0], wanted[1]);
        } catch (Throwable ex) {
            Logger.printException(() -> "Could not show the author region", ex);
        }
    }

    /**
     * The feed's author row is the one holding both the name and the post time. A comment
     * row carries the same {@code title} id but no post time, which is what keeps this off
     * the comment panel.
     *
     * <p>The pager keeps the cells either side of the video attached, so there is a row per
     * cell, and the first one in the tree is the cell above once you have swiped down. Taking
     * it put the country on the video off screen, and it only showed after swiping back up
     * (#75). With more than one row, the one whose cell shows most is the video's.
     */
    static TextView findName(View root) {
        if (root == null) {
            return null;
        }
        List<TextView> names = new ArrayList<>(3);
        collectNames(root, names);
        if (names.isEmpty()) {
            return null;
        }
        // Outside the pager there is no neighbour to mistake it for. Inside, a lone row still
        // has to be on screen: on a LIVE preview or an ad with no author row, the only row left
        // can be the cell beside it, and it would take this video's country.
        if (names.size() == 1 && GestureActions.cellOf(names.get(0)) == names.get(0)) {
            return names.get(0);
        }
        Rect visible = new Rect();
        TextView best = null;
        float bestShare = 0;
        for (TextView name : names) {
            float share = GestureActions.onScreenShare(GestureActions.cellOf(name), visible);
            if (share > bestShare) {
                best = name;
                bestShare = share;
            }
        }
        return best;
    }

    /** Every author row's name under {@code view}, skipping whatever is hidden. */
    private static void collectNames(View view, List<TextView> names) {
        // The post time marks the row even while it's hidden: TikTok keeps it GONE in the feed
        // unless the publish date is shown, and the name beside it still needs the country.
        if (view.getId() == postTimeViewId && view.getParent() instanceof ViewGroup) {
            View name = ((ViewGroup) view.getParent()).findViewById(nameViewId);
            if (name instanceof TextView && name.getVisibility() == View.VISIBLE) {
                names.add((TextView) name);
            }
        }
        if (view.getVisibility() != View.VISIBLE) {
            return;
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0, count = group.getChildCount(); i < count; i++) {
                collectNames(group.getChildAt(i), names);
            }
        }
    }

    /**
     * Writes the row once. The handle replaces the display name; the country is appended
     * after whichever of the two is showing. TikTok rewrites the row's text on every bind,
     * so whatever is read here is its own text unless this already ran against the view.
     */
    static void decorate(TextView name, String handle, String region) {
        if (name == null || (handle == null && region == null)) {
            restore();
            return;
        }

        CharSequence current = name.getText();
        CharSequence written = decoratedText;
        boolean ours = name == decoratedName.get() && current != null && written != null
                && current.toString().equals(written.toString());

        if (ours && Objects.equals(handle, decoratedHandle) && Objects.equals(region, decoratedRegion)) {
            // Already saying this. Every layout pass lands here, and the first one after the
            // write is when a name TikTok cut short can be fitted.
            refit(name, originalName, handle, region);
            return;
        }

        // Put back whatever was written before, then read the name again: on a video
        // change the text read a moment ago belonged to the previous video, and building
        // on that is how a row ends up reading "creator - US - GB".
        restore();

        CharSequence text = name.getText();
        CharSequence updated = build(text, handle, region);
        if (text == null || updated == null || updated.toString().equals(text.toString())) {
            return;
        }

        decoratedName = new WeakReference<>(name);
        originalName = text;
        decoratedText = updated;
        decoratedHandle = handle;
        decoratedRegion = region;
        name.setText(updated);
        // A row with a fixed width takes the new text without a layout pass, so no later pass
        // would come to fit it. Its layout is already rebuilt here; a wrap_content row has none
        // yet and is fitted on the pass it asked for.
        refit(name, text, handle, region);
    }

    private static void refit(TextView name, CharSequence original, String handle, String region) {
        CharSequence fitted = fit(name, label(original, handle), region);
        if (fitted != null && !fitted.toString().equals(String.valueOf(name.getText()))) {
            decoratedText = fitted;
            name.setText(fitted);
        }
    }

    /**
     * TikTok cuts a long name short with an ellipsis, and the country after it went with it
     * (#75). Once the row has been laid out cut, the name itself is shortened so the country
     * reads whole. Null when the row fits, isn't laid out yet, or has no room for the country.
     */
    static CharSequence fit(TextView name, CharSequence label, String region) {
        if (label == null || region == null) {
            return null;
        }
        Layout layout = name.getLayout();
        if (layout == null || layout.getLineCount() != 1 || layout.getEllipsisCount(0) == 0) {
            return null;
        }
        String tail = SEPARATOR + region;
        float room = name.getWidth() - name.getCompoundPaddingLeft() - name.getCompoundPaddingRight()
                - name.getPaint().measureText(tail);
        if (room <= 0) {
            return null;
        }
        CharSequence shortened = TextUtils.ellipsize(label, name.getPaint(), room, TextUtils.TruncateAt.END);
        return shortened.length() == 0 ? null : TextUtils.concat(shortened, tail);
    }

    /**
     * What the row should say. The handle replaces the display name outright; the country
     * follows whichever of the two is showing. concat rather than string addition, so a
     * styled name keeps its spans.
     */
    private static CharSequence build(CharSequence original, String handle, String region) {
        CharSequence text = label(original, handle);
        if (text == null) {
            return null;
        }
        return region == null ? text : TextUtils.concat(text, SEPARATOR + region);
    }

    /** The name part of the row: the handle when asked for, otherwise TikTok's own name. */
    private static CharSequence label(CharSequence original, String handle) {
        if (original == null) {
            return null;
        }
        return handle == null ? original : "@" + handle;
    }

    /** Lets a test drive the ids the activity's resources would otherwise supply. */
    static void setViewIds(int nameId, int postTimeId) {
        nameViewId = nameId;
        postTimeViewId = postTimeId;
    }

    /** The two letter country the current video was posted from, upper case. */
    private static String region(Object aweme) {
        if (aweme == null) {
            regionAweme = new WeakReference<>(null);
            regionValue = null;
            return null;
        }
        if (aweme == regionAweme.get()) {
            return regionValue;
        }

        String region = Reflect.string(aweme, "getRegion", "region");
        String trimmed = region == null ? null : region.trim();
        regionValue = trimmed == null || trimmed.isEmpty() ? null : trimmed.toUpperCase(Locale.ROOT);
        regionAweme = new WeakReference<>(aweme);
        return regionValue;
    }

    /**
     * The handle and the country to show for the video on screen, in that order, or null
     * when neither switch asks for anything this video can supply. Each switch only ever
     * reads its own value: turning the country on must not start showing handles.
     */
    static String[] decoration(Object aweme) {
        String handle = Settings.SHOW_AUTHOR_HANDLE.get() ? handle(aweme) : null;
        String region = Settings.SHOW_AUTHOR_REGION.get() ? region(aweme) : null;
        return handle == null && region == null ? null : new String[]{handle, region};
    }

    /** The creator's @name for the current video, without the at sign. */
    private static String handle(Object aweme) {
        if (aweme == null) {
            handleAweme = new WeakReference<>(null);
            handleValue = null;
            return null;
        }
        if (aweme == handleAweme.get()) {
            return handleValue;
        }

        Object author = Reflect.property(aweme, "getAuthor", "author");
        String unique = Reflect.string(author, "getUniqueId", "uniqueId");
        String trimmed = unique == null ? null : unique.trim();
        handleValue = trimmed == null || trimmed.isEmpty() ? null : trimmed;
        handleAweme = new WeakReference<>(aweme);
        return handleValue;
    }

    static void restore() {
        TextView name = decoratedName.get();
        CharSequence previous = originalName;
        CharSequence written = decoratedText;
        decoratedName = new WeakReference<>(null);
        originalName = null;
        decoratedText = null;
        decoratedHandle = null;
        decoratedRegion = null;

        if (name == null || previous == null || written == null) {
            return;
        }

        // Only undo the exact edit made here. A row TikTok has rebound since carries its
        // own text, and a new creator's name can begin with the old one, so a prefix test
        // would truncate a genuine name.
        CharSequence now = name.getText();
        if (now != null && now.toString().equals(written.toString())) {
            name.setText(previous);
        }
    }
}
