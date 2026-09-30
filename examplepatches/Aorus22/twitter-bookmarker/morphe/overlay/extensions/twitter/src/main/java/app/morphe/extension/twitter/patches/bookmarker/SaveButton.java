/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 *
 * Part of the Twitter Bookmarker overlay: see morphe/README.md. The button
 * plumbing mirrors Piko's InlineDownloadButton, which already solves "put a
 * clickable icon on the tweet inline action bar" for this app version.
 */

package app.morphe.extension.twitter.patches.bookmarker;

import android.content.Context;
import android.content.res.ColorStateList;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.ConcurrentHashMap;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.ResourceType;
import app.morphe.extension.shared.ResourceUtils;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.twitter.entity.Tweet;

/**
 * The save button on the tweet inline action bar: a sibling of the native
 * bookmark action, never a replacement for it.
 *
 * <p>A tap saves the tweet into one of the collections the backend knows; a
 * long press edits the backend address and token. The app's own bookmark state
 * is never read and never written — the two bookmarks are independent by design,
 * so nothing here can damage the account's real bookmarks.
 *
 * <p>Three things about the button are deliberate, because the first version of
 * it got them wrong on a real phone:
 *
 * <ul>
 *   <li><b>It is a 48 dp touch target with a gap.</b> The icon matches its
 *       neighbours, but the clickable box around it does not: at icon size it sat
 *       flush against the native bookmark on one side and Piko's download button
 *       on the other, and taps landed on the wrong control.</li>
 *   <li><b>The sheet opens from {@link BookmarkerCache}, not from the network.</b>
 *       Fetching the collection list before showing anything cost a round trip on
 *       every tap.</li>
 *   <li><b>An already-saved tweet is marked, and says where.</b> The mark comes
 *       from the same cache, and the tap then explains itself instead of offering
 *       a save the backend would reject with 409.</li>
 * </ul>
 */
@SuppressWarnings("unused")
public class SaveButton {

    private static final String WRAPPER_TAG = "twb_save_wrapper";
    private static final String ICON_NAME = "ic_twb_bookmark";
    private static final String SAVED_ICON_NAME = "ic_twb_bookmark_saved";

    /** Last-resort icon, borrowed from the app, if our own resource is missing. */
    private static final String FALLBACK_ICON_NAME = "ic_vector_incoming";

    /** Neutral grey that reads on both X themes, used when no sibling tint is found. */
    private static final int FALLBACK_TINT = 0xFF536471;

    /**
     * The saved state's tint: the app's own accent blue, so "already in my
     * archive" reads as an active state rather than as another grey action.
     */
    private static final int SAVED_TINT = 0xFF1D9BF0;

    /**
     * Minimum size of the clickable box. The Android accessibility guideline is
     * 48 dp; the glyph inside stays the size of its neighbours.
     */
    private static final int TOUCH_TARGET_DP = 48;

    /** Space between our box and the action bar, so the two are not one target. */
    private static final int BUTTON_GAP_DP = 8;

    /**
     * Our live buttons, keyed by the container we added, valued by the tint the
     * unsaved state uses.
     *
     * <p>Weak keys and a value that cannot reach its key: the value is a colour,
     * so a recycled row is collected instead of pinning its view. Only the main
     * thread touches this map.
     */
    private static final Map<View, ColorStateList> LIVE_BUTTONS = new WeakHashMap<>();

    private static boolean listeningForCache = false;

    private static final Map<Class<?>, Field> FIELD_CACHE = new ConcurrentHashMap<>();

    /**
     * Placeholder rewritten at patch time to the field name the app really uses.
     * Never call this expecting the literal back.
     */
    private static String getTweetFieldName() {
        return "mTweet";
    }

    /**
     * Called from the patched {@code InlineActionBar.onFinishInflate}.
     *
     * <p>Posted rather than run inline: the bar has no children until it is laid
     * out, and the sibling styling below needs a child to copy from.
     */
    public static void onFinishInflate(ViewGroup inlineActionBar) {
        if (inlineActionBar == null) return;
        inlineActionBar.post(() -> {
            try {
                addSaveButton(inlineActionBar);
            } catch (Exception e) {
                Logger.printException(() -> "twb: could not add the save button", e);
            }
        });
    }

    private static void addSaveButton(ViewGroup inlineActionBar) {
        // One action bar scrolling in is one reason to check whether what we know
        // about the backend is still fresh: this is the only clock the overlay has,
        // and it returns immediately unless the cache is missing or past its TTL.
        BookmarkerCache.warmUp();

        ViewParent currentParent = inlineActionBar.getParent();
        if (currentParent instanceof LinearLayout
                && WRAPPER_TAG.equals(((LinearLayout) currentParent).getTag())) {
            // The bar is recycled by the list; the button is already ours, but the
            // tweet behind it may be a different one, so repaint for whatever this
            // row now holds.
            repaint((ViewGroup) currentParent);
            return;
        }
        if (!(currentParent instanceof ViewGroup)) return;

        ViewGroup parent = (ViewGroup) currentParent;
        int index = parent.indexOfChild(inlineActionBar);
        ViewGroup.LayoutParams originalLayoutParams = inlineActionBar.getLayoutParams();
        Context context = inlineActionBar.getContext();

        parent.removeView(inlineActionBar);

        LinearLayout wrapper = new LinearLayout(context);
        wrapper.setOrientation(LinearLayout.HORIZONTAL);
        wrapper.setGravity(Gravity.CENTER_VERTICAL);
        wrapper.setTag(WRAPPER_TAG);

        // The bar keeps the width of the actions it holds; the button adds one
        // more, so on a focal tweet the row stays evenly distributed.
        float barWeight = Math.max(1, visibleActionCount(inlineActionBar));
        wrapper.addView(
                inlineActionBar,
                new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.MATCH_PARENT, barWeight));

        ImageView icon = new ImageView(context);
        icon.setImageResource(iconResourceId());
        icon.setScaleType(ImageView.ScaleType.CENTER);

        FrameLayout container = new FrameLayout(context);
        container.setClickable(true);
        container.setLongClickable(true);
        container.setFocusable(true);
        container.setContentDescription("Save to Twitter Bookmarker");

        int touchTarget = dp(context, TOUCH_TARGET_DP);
        container.setMinimumWidth(touchTarget);
        container.setMinimumHeight(touchTarget);
        container.addView(
                icon,
                new FrameLayout.LayoutParams(
                        ViewGroup.LayoutParams.WRAP_CONTENT,
                        ViewGroup.LayoutParams.WRAP_CONTENT,
                        Gravity.CENTER));
        container.setOnClickListener(v -> onSaveClicked(inlineActionBar));
        container.setOnLongClickListener(v -> {
            // The only discoverable place for the address fields: the gesture is
            // on the button that needs them.
            BookmarkerSettingsDialog.show(v.getContext(), null);
            return true;
        });

        LinearLayout.LayoutParams containerParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.MATCH_PARENT);
        containerParams.setMarginStart(dp(context, BUTTON_GAP_DP));
        wrapper.addView(container, containerParams);

        parent.addView(wrapper, index, originalLayoutParams);

        // Copy the look of the action next to us once the bar has real children,
        // so the button is not a differently sized odd one out — then paint the
        // saved state, which is the one thing that may differ from that action.
        wrapper.post(() -> {
            ColorStateList neutralTint = styleFromNeighbour(inlineActionBar, container, icon);
            trackButton(container, neutralTint);
            paintSavedState(container, inlineActionBar, neutralTint);
            repaintWhenReattached(container);
        });
    }

    /**
     * Saves the tweet the tapped bar belongs to.
     *
     * <p>When it is already in the archive, the tap explains where instead of
     * offering a save that cannot succeed (the backend answers 409). Otherwise the
     * picker is drawn from {@link BookmarkerCache}, so nothing here waits on the
     * network except the very first tap of a fresh install.
     */
    private static void onSaveClicked(ViewGroup inlineActionBar) {
        Object rawTweet;
        try {
            rawTweet = readField(inlineActionBar, getTweetFieldName());
        } catch (Exception e) {
            Logger.printException(() -> "twb: could not read the tweet", e);
            toast("Twitter Bookmarker: could not read the tweet");
            return;
        }

        if (rawTweet == null) {
            toast("Twitter Bookmarker: no tweet data");
            return;
        }

        Context context = inlineActionBar.getContext();
        if (!BookmarkerPrefs.isConfigured()) {
            // Nothing to save into yet, so the first tap is the one that asks.
            toast("Twitter Bookmarker: set the backend URL to start saving");
            BookmarkerSettingsDialog.show(context, null);
            return;
        }

        String tweetId = tweetIdOf(rawTweet);
        String savedSlug = BookmarkerCache.savedSlug(tweetId);
        if (savedSlug != null) {
            Logger.printInfo(() -> "twb: tapped an already saved tweet (" + savedSlug + ")");
            BookmarkerSheets.showSavedInfo(context, BookmarkerCache.nameFor(savedSlug), savedSlug);
            return;
        }

        BookmarkerApi.Draft draft;
        try {
            draft = TweetDraft.from(rawTweet);
        } catch (Exception e) {
            Logger.printException(() -> "twb: could not read the tweet", e);
            toast("Twitter Bookmarker: could not read the tweet");
            return;
        }

        String missing = TweetDraft.missingField(draft);
        if (missing != null) {
            toast("Twitter Bookmarker: " + missing + " is not available for this tweet");
            return;
        }

        List<BookmarkerApi.Collection> cached = BookmarkerCache.collectionsOrNull();
        if (cached != null) {
            showPicker(context, tweetId, draft, cached);
            return;
        }

        // A fresh install has nothing cached, so this one fetch is unavoidable —
        // but it is announced, because a tap that does nothing for a second is
        // indistinguishable from a patch that did not apply.
        Utils.showToastShort("Twitter Bookmarker: loading collections\u2026");
        Utils.runOnBackgroundThread(() -> {
            try {
                List<BookmarkerApi.Collection> fetched = BookmarkerApi.collections(
                        BookmarkerPrefs.backendUrl(), BookmarkerPrefs.backendToken());
                Utils.runOnMainThread(() -> showPicker(context, tweetId, draft, fetched));
            } catch (Exception e) {
                Logger.printException(() -> "twb: could not list collections", e);
                toast("Twitter Bookmarker: " + reason(e));
            }
        });
    }

    private static void showPicker(Context context, String tweetId, BookmarkerApi.Draft draft,
                                   List<BookmarkerApi.Collection> collections) {
        Logger.printInfo(() -> "twb: tapped " + draft.url);
        BookmarkerSheets.showCollectionPicker(
                context, draft, collections,
                (slug, name) -> save(tweetId, draft, slug, name));
    }

    /**
     * The save itself, off the main thread. A 409 is reported in the backend's
     * own words ("already saved in …"), because the tweet may well be in a
     * different collection than the one just picked — and either way the mark is
     * now correct, with no refetch.
     */
    private static void save(String tweetId, BookmarkerApi.Draft draft, String slug, String name) {
        Utils.runOnBackgroundThread(() -> {
            BookmarkerApi.Result result = BookmarkerApi.save(
                    BookmarkerPrefs.backendUrl(), BookmarkerPrefs.backendToken(), slug, name, draft);

            if (result.ok) {
                BookmarkerCache.remember(tweetId, slug, name);
            } else if (result.duplicate && result.slug != null) {
                // It is in the archive after all: mark it, and only claim a name for
                // the collection we know the name of.
                BookmarkerCache.remember(tweetId, result.slug, result.slug.equals(slug) ? name : "");
            }

            toast("Twitter Bookmarker: " + result.message);
        });
    }

    /* ---------------------------------------------------------------------- */
    /* the saved mark                                                         */
    /* ---------------------------------------------------------------------- */

    /** Register a container so a cache change repaints it, and start listening. */
    private static void trackButton(View container, ColorStateList neutralTint) {
        LIVE_BUTTONS.put(container, neutralTint);
        if (listeningForCache) return;

        listeningForCache = true;
        BookmarkerCache.addListener(SaveButton::repaintAll);
    }

    /** Repaint every live button; the cache runs this on the main thread. */
    private static void repaintAll() {
        for (Map.Entry<View, ColorStateList> entry : new ArrayList<>(LIVE_BUTTONS.entrySet())) {
            repaint(entry.getKey(), entry.getValue());
        }
    }

    /** Repaint one wrapper's button, for whatever tweet its bar now holds. */
    private static void repaint(ViewGroup wrapper) {
        View container = ourContainerIn(wrapper);
        if (container == null) return;

        ColorStateList neutralTint = LIVE_BUTTONS.get(container);
        repaint(container, neutralTint);
    }

    private static void repaint(View container, ColorStateList neutralTint) {
        ViewGroup bar = barOf(container);
        if (bar == null) return;
        paintSavedState(container, bar, neutralTint);
    }

    /**
     * The two looks of the button, chosen by whether the tweet is in the archive.
     *
     * <p>Both the glyph and the tint change, because either alone is easy to miss
     * on a 24 dp icon in a row of other icons; the description changes too, so the
     * state is not carried by colour alone.
     */
    private static void paintSavedState(View container, ViewGroup bar, ColorStateList neutralTint) {
        ImageView icon = findIcon(container);
        if (icon == null) return;

        ColorStateList unsavedTint = neutralTint != null ? neutralTint : ColorStateList.valueOf(FALLBACK_TINT);
        String tweetId = tweetIdOfBar(bar);
        String slug = BookmarkerCache.savedSlug(tweetId);
        if (slug == null) {
            icon.setImageResource(iconResourceId());
            icon.setImageTintList(unsavedTint);
            container.setContentDescription("Save to Twitter Bookmarker");
            return;
        }

        icon.setImageResource(savedIconResourceId());
        icon.setImageTintList(ColorStateList.valueOf(SAVED_TINT));
        container.setContentDescription("Already saved in " + BookmarkerCache.nameFor(slug));
    }

    /**
     * The list reuses rows, and a reused row is a different tweet in the same
     * view: repainting when the row comes back on screen is what keeps the mark
     * from describing the tweet that used to be there.
     */
    private static void repaintWhenReattached(View container) {
        container.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
            @Override
            public void onViewAttachedToWindow(View view) {
                repaint(view, LIVE_BUTTONS.get(view));
            }

            @Override
            public void onViewDetachedFromWindow(View view) {
                // Nothing to do: the detach is what makes the repaint above happen.
            }
        });
    }

    /**
     * Our container inside a wrapper. Identified by identity rather than by type:
     * the bar it sits next to may itself be a FrameLayout, and repainting the
     * app's own icons would be a visible bug.
     */
    private static View ourContainerIn(ViewGroup wrapper) {
        for (int i = 0; i < wrapper.getChildCount(); i++) {
            View child = wrapper.getChildAt(i);
            if (LIVE_BUTTONS.containsKey(child)) return child;
        }
        return null;
    }

    /** The action bar inside a wrapper: the first child we added. */
    private static ViewGroup barOf(View container) {
        ViewParent parent = container.getParent();
        if (!(parent instanceof ViewGroup)) return null;

        ViewGroup wrapper = (ViewGroup) parent;
        if (wrapper.getChildCount() == 0) return null;
        View bar = wrapper.getChildAt(0);
        return bar instanceof ViewGroup ? (ViewGroup) bar : null;
    }

    /** The status id of the tweet a bar holds, or null when it holds none yet. */
    private static String tweetIdOfBar(ViewGroup bar) {
        try {
            return tweetIdOf(readField(bar, getTweetFieldName()));
        } catch (Exception e) {
            Logger.printInfo(() -> "twb: could not read the tweet id: " + e);
            return null;
        }
    }

    /** The status id as the backend keys it, or null when the app has none. */
    private static String tweetIdOf(Object rawTweet) {
        if (rawTweet == null) return null;
        try {
            Long statusId = new Tweet(rawTweet).getTweetId();
            return statusId == null ? null : String.valueOf(statusId);
        } catch (Exception e) {
            Logger.printInfo(() -> "twb: could not read the tweet id: " + e);
            return null;
        }
    }

    /* ---------------------------------------------------------------------- */
    /* view plumbing                                                          */
    /* ---------------------------------------------------------------------- */

    private static int dp(Context context, int value) {
        return Math.round(value * context.getResources().getDisplayMetrics().density);
    }

    /** Toasts from wherever the work happened; Android wants a looper thread. */
    private static void toast(String message) {
        Utils.runOnMainThread(() -> Utils.showToastShort(message));
    }

    private static String reason(Exception e) {
        String message = e.getMessage();
        return message == null || message.isEmpty() ? e.getClass().getSimpleName() : message;
    }

    private static int iconResourceId() {
        int id = ResourceUtils.getIdentifier(ResourceType.DRAWABLE, ICON_NAME);
        if (id != 0) return id;

        Logger.printInfo(() -> "twb: " + ICON_NAME + " missing, falling back to " + FALLBACK_ICON_NAME);
        return ResourceUtils.getIdentifier(ResourceType.DRAWABLE, FALLBACK_ICON_NAME);
    }

    /** The filled glyph; without it the tint alone still marks a saved tweet. */
    private static int savedIconResourceId() {
        int id = ResourceUtils.getIdentifier(ResourceType.DRAWABLE, SAVED_ICON_NAME);
        return id != 0 ? id : iconResourceId();
    }

    private static int visibleActionCount(ViewGroup inlineActionBar) {
        int count = 0;
        for (int i = 0; i < inlineActionBar.getChildCount(); i++) {
            if (inlineActionBar.getChildAt(i).getVisibility() == View.VISIBLE) {
                count++;
            }
        }
        return count;
    }

    /**
     * Matches the button to the last visible action, using only public view APIs:
     * the obfuscated colour field the sibling uses is not needed for a valid icon.
     *
     * @return the tint that means "not saved", so a later repaint can restore it
     *         without asking the neighbour again.
     */
    private static ColorStateList styleFromNeighbour(ViewGroup inlineActionBar, FrameLayout container, ImageView icon) {
        ColorStateList fallback = ColorStateList.valueOf(FALLBACK_TINT);
        View referenceAction = lastVisibleAction(inlineActionBar);
        if (referenceAction == null) {
            icon.setImageTintList(fallback);
            return fallback;
        }

        if (referenceAction instanceof ViewGroup) {
            ViewGroup referenceContainer = (ViewGroup) referenceAction;
            container.setPadding(
                    referenceContainer.getPaddingLeft(),
                    referenceContainer.getPaddingTop(),
                    referenceContainer.getPaddingRight(),
                    referenceContainer.getPaddingBottom());
        }

        ImageView referenceIcon = findIcon(referenceAction);
        if (referenceIcon == null) {
            icon.setImageTintList(fallback);
            return fallback;
        }

        icon.setScaleType(referenceIcon.getScaleType());

        ColorStateList tint = referenceIcon.getImageTintList();
        icon.setImageTintList(tint != null ? tint : fallback);

        ViewGroup.LayoutParams referenceParams = referenceIcon.getLayoutParams();
        if (referenceParams != null) {
            icon.setLayoutParams(
                    new FrameLayout.LayoutParams(
                            referenceParams.width,
                            referenceParams.height,
                            Gravity.CENTER));
        }

        return tint != null ? tint : fallback;
    }

    private static View lastVisibleAction(ViewGroup inlineActionBar) {
        for (int i = inlineActionBar.getChildCount() - 1; i >= 0; i--) {
            View child = inlineActionBar.getChildAt(i);
            if (child.getVisibility() == View.VISIBLE && child.getWidth() > 0) {
                return child;
            }
        }
        return null;
    }

    private static ImageView findIcon(View view) {
        if (view instanceof ImageView && view.getVisibility() == View.VISIBLE) {
            return (ImageView) view;
        }
        if (!(view instanceof ViewGroup)) return null;

        ViewGroup group = (ViewGroup) view;
        for (int i = 0; i < group.getChildCount(); i++) {
            ImageView found = findIcon(group.getChildAt(i));
            if (found != null) return found;
        }
        return null;
    }

    private static Object readField(Object target, String fieldName) throws ReflectiveOperationException {
        Class<?> targetClass = target.getClass();
        Field field = FIELD_CACHE.get(targetClass);
        if (field == null) {
            field = targetClass.getDeclaredField(fieldName);
            field.setAccessible(true);
            FIELD_CACHE.put(targetClass, field);
        }
        return field.get(target);
    }
}
