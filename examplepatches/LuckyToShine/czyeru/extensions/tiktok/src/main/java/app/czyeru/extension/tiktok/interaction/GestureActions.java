/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 *
 * Built on icysymmetra/tiktok-patches-for-morphe (GPL-3.0).
 */
package app.czyeru.extension.tiktok.interaction;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.graphics.Rect;
import android.net.Uri;
import android.os.SystemClock;
import android.text.TextUtils;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.Window;
import app.czyeru.extension.shared.Logger;
import app.czyeru.extension.shared.Utils;
import app.czyeru.extension.shared.diagnostics.HookStatus;
import app.czyeru.extension.tiktok.blockauthor.CurrentVideoAuthor;
import app.czyeru.extension.tiktok.blockauthor.Reflect;
import app.czyeru.extension.tiktok.share.ShareUrlSanitizer;
import app.czyeru.extension.tiktok.feedfilter.SoundIdentity;
import app.czyeru.extension.tiktok.settings.Settings;
import app.czyeru.extension.tiktok.settings.L10n;
import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.Locale;
import java.util.Map;
import java.util.WeakHashMap;

public final class GestureActions {
    private static final Map<Object, CommentControl> COMMENTS = new WeakHashMap<>();
    private GestureActions() {}

    private static final class CommentControl {
        WeakReference<View> view = new WeakReference<>(null);
        String videoId;
        /** The post bound with the id, for the long press actions that need more than its id. */
        WeakReference<Object> aweme = new WeakReference<>(null);
    }

    private static CommentControl commentControl(Object owner) {
        CommentControl control = COMMENTS.get(owner);
        if (control == null) {
            control = new CommentControl();
            COMMENTS.put(owner, control);
        }
        return control;
    }

    public static void registerCommentView(Object owner, View view) {
        for (Map.Entry<Object, CommentControl> entry : COMMENTS.entrySet()) {
            if (entry.getKey() != owner && entry.getValue().view.get() == view) entry.getValue().view.clear();
        }
        commentControl(owner).view = new WeakReference<>(view);
    }

    public static void bindCommentView(Object owner, Object params) {
        Object aweme = Reflect.property(params, "getAweme", "aweme");
        CommentControl control = commentControl(owner);
        control.videoId = Reflect.string(aweme, "getAid", "aid");
        control.aweme = new WeakReference<>(aweme);
    }

    /**
     * Each heart's assem and its view, for Like the video. The heart needs no video id of its own:
     * it's found beside the comment button the gesture picked, and its assem likes the post it's
     * bound to.
     */
    private static final Map<Object, WeakReference<View>> HEARTS = new WeakHashMap<>();

    /** {@code VideoDiggAssem.onViewCreated}, which TikTok runs again as a cell's assems are reused. */
    public static void registerLikeView(Object owner, View view) {
        for (Map.Entry<Object, WeakReference<View>> entry : HEARTS.entrySet()) {
            if (entry.getKey() != owner && entry.getValue().get() == view) entry.getValue().clear();
        }
        HEARTS.put(owner, new WeakReference<>(view));
    }

    /**
     * Runs at the start of each method a double tap reaches on its way to TikTok's like, on the
     * main thread. Returning true swallows the gesture, which is what keeps the like from also
     * happening. The legacy panel hands the tap on to the modern one, so a swallowed tap never
     * reaches the second guard and an action runs once.
     *
     * <p>A double tap lands with the finger still down, as a long press does, so the Long press
     * actions run from here unchanged: the sleep timer's picker is posted until the touch is done
     * with, and a frame is read at the tap. The edge seek stays with the long press. Where the tap
     * landed matters only to Double tap by corner.
     *
     * <p>Each guard hands over the tap's event. A route that reached a second guard with the same
     * tap, rather than through the panel that swallows it, gets the first guard's answer back and
     * the action doesn't run twice. A copy of the event carries the same times, so it counts too.
     */
    public static boolean onDoubleTap(MotionEvent event) {
        if (event != null && event.getDownTime() == answeredTapDown && event.getEventTime() == answeredTapAt) {
            return answeredTap;
        }
        boolean answer = runAction(doubleTapAction(event));
        if (event != null) {
            answeredTapDown = event.getDownTime();
            answeredTapAt = event.getEventTime();
            answeredTap = answer;
        }
        return answer;
    }

    /** The double tap the last guard answered, by its event's times, and what it answered. */
    private static long answeredTapDown = Long.MIN_VALUE;
    private static long answeredTapAt = Long.MIN_VALUE;
    private static boolean answeredTap;

    /** Forgets the last double taps answered and taken, for tests that share the class across runs. */
    static void forgetDoubleTaps() {
        answeredTapDown = Long.MIN_VALUE;
        answeredTapAt = Long.MIN_VALUE;
    }

    /** {@link #onDoubleTap(MotionEvent)} for a tap with no event to tell it apart by. */
    public static boolean onDoubleTap() {
        return runAction(doubleTapAction(null));
    }

    /**
     * The double tap choice for a tap at this event: its corner's with Double tap by corner on,
     * the plain choice otherwise or for a tap with no event or window to place it against (#232).
     */
    static String doubleTapAction(MotionEvent event) {
        if (event == null || !Settings.DOUBLE_TAP_SPLIT_ZONES.get()) return Settings.DOUBLE_TAP_ACTION.get();
        // The window's size and the event's own x and y, as sideOf places a long press: the
        // listener's touch layer fills the window, and getRawX would be off in a split view.
        Context context = Utils.getWindowContext();
        if (context == null) return Settings.DOUBLE_TAP_ACTION.get();
        android.util.DisplayMetrics metrics = context.getResources().getDisplayMetrics();
        int width = metrics.widthPixels;
        int height = metrics.heightPixels;
        if (width <= 0 || height <= 0) return Settings.DOUBLE_TAP_ACTION.get();
        boolean left = event.getX() < width / 2;
        boolean top = event.getY() < height / 2;
        if (top) return (left ? Settings.DOUBLE_TAP_TOP_LEFT_ACTION : Settings.DOUBLE_TAP_TOP_RIGHT_ACTION).get();
        return (left ? Settings.DOUBLE_TAP_BOTTOM_LEFT_ACTION : Settings.DOUBLE_TAP_BOTTOM_RIGHT_ACTION).get();
    }

    /**
     * The double tap window the feed's tap timer works with (#239). TikTok holds each tap on a
     * video back for this long before it pauses or plays, in case a second tap follows, and takes
     * a touch inside it as that second tap. With every double tap set to do nothing there is
     * nothing to wait for, so the window is zero: a tap acts as the finger lifts, and quick taps
     * each count as taps.
     */
    public static int feedDoubleTapTimeout(int timeout) {
        return doubleTapDoesNothing() ? 0 : timeout;
    }

    /** Whether a double tap anywhere on the video does nothing, with or without Double tap by corner. */
    static boolean doubleTapDoesNothing() {
        if (!Settings.DOUBLE_TAP_SPLIT_ZONES.get()) return "nothing".equals(Settings.DOUBLE_TAP_ACTION.get());
        return "nothing".equals(Settings.DOUBLE_TAP_TOP_LEFT_ACTION.get())
                && "nothing".equals(Settings.DOUBLE_TAP_TOP_RIGHT_ACTION.get())
                && "nothing".equals(Settings.DOUBLE_TAP_BOTTOM_LEFT_ACTION.get())
                && "nothing".equals(Settings.DOUBLE_TAP_BOTTOM_RIGHT_ACTION.get());
    }

    /**
     * Opens the comments of the video on screen, for a gesture made on it, or says there are none.
     *
     * <p>Not by the playing video's id. That follows the player's progress, which names the new
     * video only once it starts playing, so right after a swipe it still named the one before and
     * the press went to that video's button: its comments opened, its "restricted" message showed,
     * or with no button bound to it Hushfeed's toast did (#63). The id now only breaks a tie.
     */
    static void openOnScreenComments() {
        String playing = Reflect.string(CurrentVideoAuthor.getAweme(), "getAid", "aid");
        if (!openVisibleComments(playing)) {
            Utils.showToastShort(L10n.t("Comments aren't available for this video"));
        }
    }

    /**
     * What a gesture set to {@code action} does, for Double tap and Long press alike. True when
     * the gesture was Hushfeed's; false leaves it to TikTok, which is what its own choice asks for
     * and what a value this build doesn't know gets, as a backup from a newer build can carry.
     */
    static boolean runAction(String action) {
        if ("nothing".equals(action)) return true;
        if ("like_toggle".equals(action)) {
            toggleOnScreenLike();
            return true;
        }
        if ("copy_link".equals(action)) {
            copyVideoLink(onScreenAweme());
            return true;
        }
        if ("copy_sound_link".equals(action)) {
            // The same treatment the video link above gets. TikTok's own sound share URL is a
            // share URL like any other: it carries the parameters that say who sent it, and the
            // custom share domain belongs on it too. Only the link this builds from the sound's
            // id has never had a query on it.
            String sound = soundLink(onScreenAweme());
            String clean = ShareUrlSanitizer.stripAllQueryParams(sound);
            if (copyToClipboard("TikTok sound", clean)) {
                if (android.os.Build.VERSION.SDK_INT < 33) {
                    Utils.showToastShort(L10n.t("Sound link copied"));
                }
            } else {
                Utils.showToastShort(L10n.t("This video has no sound of its own"));
            }
            return true;
        }
        if ("youtube_music".equals(action)) {
            Context context = Utils.getActivity();
            YouTubeMusicSearch.open(onScreenAweme(),
                    context != null ? context : Utils.getContext());
            return true;
        }
        if ("open_search".equals(action)) {
            // Posted, like the sleep timer, so the page opens after the gesture is done with the touch.
            Utils.runOnMainThread(() -> openSearchPage(Utils.getVisibleActivity()));
            return true;
        }
        if (!"comments".equals(action)) return false;
        openOnScreenComments();
        return true;
    }

    /**
     * TikTok's own link for its home screen Search shortcut, which opens the empty search page
     * with the keyboard up. It goes through TikTok's router like any of its links, so it still
     * works with Hide feed search button on, where there is no button left to press (#251).
     */
    static final String SEARCH_PAGE_URI = "snssdk1233://search?enter_from=home_screen_icon&enter_method=enter"
            + "&enter_blank_page=1&enter_from_sub=app_outside&set_hint_by_sug_word=1";

    static boolean openSearchPage(Context context) {
        if (context == null) context = Utils.getContext();
        if (context == null) return false;
        Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(SEARCH_PAGE_URI))
                .setPackage(context.getPackageName());
        if (!(context instanceof Activity)) intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        try {
            context.startActivity(intent);
            return true;
        } catch (RuntimeException failure) {
            Logger.printException(() -> "Could not open the search page", failure);
            Utils.showToastShort(L10n.t("Search didn't open. Restart TikTok and try again."));
            return false;
        }
    }

    /** The page for the post's sound, or null when the post carries only its own audio. */
    static String soundLink(Object aweme) {
        Object music = aweme == null ? null : Reflect.property(aweme, "getMusic", "music");
        if (music == null) return null;
        Object shareInfo = Reflect.property(music, "getShareInfo", "shareInfo");
        String shared = shareInfo == null
                ? null : Reflect.string(shareInfo, "getShareUrl", "shareUrl");
        if (shared == null) shared = Reflect.string(music, "getShareUrl", "shareUrl");
        if (shared != null && shared.startsWith("https://")) return shared;

        String id = SoundIdentity.idOf(music);
        if (id == null || id.isEmpty()) return null;
        // The slug in front of the id is decoration; the id is what the page is looked up by.
        return "https://www.tiktok.com/music/x-" + id;
    }

    /**
     * Copies {@code aweme}'s link and says so, for a gesture and for a press on Share alike.
     * Android 13 and newer show their own note for every copy, so the toast is for older ones.
     */
    public static void copyVideoLink(Object aweme) {
        String link = Reflect.string(aweme, "getShareUrl", "shareUrl");
        if (link == null) {
            String handle = Reflect.string(Reflect.property(aweme, "getAuthor", "author"), "getUniqueId", "uniqueId");
            String id = Reflect.string(aweme, "getAid", "aid");
            if (handle != null && id != null) link = "https://www.tiktok.com/@" + handle + "/video/" + id;
        }
        // The same treatment a shared link gets: TikTok's own link carries the parameters
        // that say who sent it, and the clipboard is somewhere else that goes.
        String clean = ShareUrlSanitizer.stripAllQueryParams(link);
        if (copyToClipboard("TikTok link", clean)) {
            if (android.os.Build.VERSION.SDK_INT < 33) {
                Utils.showToastShort(L10n.t("Link copied"));
            }
        } else {
            Utils.showToastShort(L10n.t("This video has no link to copy"));
        }
    }

    /**
     * Puts a link on the clipboard through the shared helper, which marks the clip sensitive on
     * the Android versions that understand the flag. These two were the only clips in the bundle
     * building their own {@code ClipData}, so they were the only ones a clipboard viewer could
     * read back without the warning.
     */
    static boolean copyToClipboard(String label, String text) {
        if (text == null || text.isEmpty()) return false;
        Context context = Utils.getContext();
        if (context == null) return false;
        // Asked once and used once. Checking one call and letting the helper make its own
        // would be a guard over a different answer than the one that gets dereferenced.
        if (context.getSystemService(Context.CLIPBOARD_SERVICE) == null) return false;
        try {
            Utils.setClipboard(context, label, text);
        } catch (RuntimeException unavailable) {
            Logger.printException(() -> "Could not put " + label + " on the clipboard", unavailable);
            return false;
        }
        return true;
    }

    public static boolean openComments(String videoId) {
        return openComments(videoId, false);
    }

    /**
     * The button bound to this video. With {@code outsidePagerOnly}, a button in TikTok's feed
     * pager doesn't count: the screen already said its cell is out of sight.
     */
    private static boolean openComments(String videoId, boolean outsidePagerOnly) {
        Map.Entry<Object, CommentControl> bound = boundButton(videoId, outsidePagerOnly);
        return bound != null && press(bound.getKey(), bound.getValue().view.get());
    }

    /** The button bound to this video, a shown one before a hidden one, or null. */
    private static Map.Entry<Object, CommentControl> boundButton(String videoId, boolean outsidePagerOnly) {
        if (videoId == null || videoId.isEmpty()) return null;
        Map.Entry<Object, CommentControl> hidden = null;
        for (Map.Entry<Object, CommentControl> entry : COMMENTS.entrySet()) {
            CommentControl control = entry.getValue();
            View view = control.view.get();
            if (!videoId.equals(control.videoId) || view == null || !view.isAttachedToWindow()) continue;
            if (outsidePagerOnly && cellOf(view) != view) continue;
            if (view.isShown() && view.getGlobalVisibleRect(new Rect())) return entry;
            // Clear display can hide the action rail while its native click handler remains usable.
            hidden = entry;
        }
        return hidden;
    }

    /** The feed's pager, in the main feed and in a video opened from a profile or a search. */
    static final String FEED_PAGER = "com.ss.android.ugc.aweme.common.widget.VerticalViewPager";

    /**
     * Presses the comment button of the video on screen: the one in the window in front whose
     * cell shows most, the playing id breaking a tie. With nothing on screen to judge by, the
     * button bound to the playing id, as before, but only off TikTok's pager. On it, a LIVE or
     * an ad on screen has no comment button, and the playing id there still names the video
     * before, a page away.
     */
    static boolean openVisibleComments(String playingId) {
        OnScreen screen = onScreen(playingId);
        // A feed in front whose cell has no button is a LIVE or an ad: no comments, and nothing
        // elsewhere stands in for them.
        if (screen.control == null) return !screen.feedInFront && openComments(playingId, true);
        String pressed = screen.control.videoId;
        if (playingId == null || !playingId.equals(pressed)) {
            Logger.printDebug(() -> "Comments for the video on screen (" + pressed
                    + "), the player still names " + playingId);
        }
        return press(screen.owner, screen.view);
    }

    private static Object heartOnScreen(String playingId) {
        OnScreen screen = onScreen(playingId);
        View button = screen.view;
        if (button == null && !screen.feedInFront) {
            Map.Entry<Object, CommentControl> bound = boundButton(playingId, true);
            if (bound != null) button = bound.getValue().view.get();
        }
        return button == null ? null : heartBeside(button);
    }

    /**
     * Like or unlike, a Double tap choice only (#248). The same video and heart as
     * {@link #likeOnScreenVideo}, pressed through the heart's click instead, so a liked video
     * loses its like. TikTok's own double tap stays like-only, and so does the Like choice.
     */
    static void toggleOnScreenLike() {
        String playing = Reflect.string(CurrentVideoAuthor.getAweme(), "getAid", "aid");
        if (!toggleVisibleLike(playing)) {
            Utils.showToastShort(L10n.t("Likes aren't available for this video"));
        }
    }

    static boolean toggleVisibleLike(String playingId) {
        Object heart = heartOnScreen(playingId);
        if (heart == null) return false;
        Method click = heartClick(heart);
        if (click == null) return false;
        try {
            click.invoke(heart, (Object) null);
            return true;
        } catch (ReflectiveOperationException | RuntimeException exception) {
            Logger.printException(() -> "Could not press the heart from the feed gesture", exception);
            return false;
        }
    }

    /**
     * The heart nearest the comment button: the first registered heart under one of the button's
     * parents, going up. The climb ends at the button's cell, in TikTok's pager or in any other
     * pager or list, so a cell whose heart is missing never borrows the next video's. A heart
     * only has to be attached, since Clear display hides the rail and its assem still likes.
     */
    static Object heartBeside(View button) {
        for (ViewParent parent = button.getParent(); parent instanceof View; parent = parent.getParent()) {
            if (holdsCells(parent)) break;
            for (Map.Entry<Object, WeakReference<View>> entry : HEARTS.entrySet()) {
                View heart = entry.getValue().get();
                if (heart != null && heart.isAttachedToWindow() && isInside(heart, (View) parent)) {
                    return entry.getKey();
                }
            }
        }
        return null;
    }

    /**
     * Whether this parent lays out cells of its own: TikTok's feed pager, or a ViewPager,
     * RecyclerView or AdapterView, TikTok's subclasses included. On 47.1.4 the rail between a
     * comment button and its heart is a LinearLayout, which isn't one.
     */
    static boolean holdsCells(ViewParent parent) {
        if (parent instanceof android.widget.AdapterView) return true;
        for (Class<?> type = parent.getClass(); type != null && type != View.class; type = type.getSuperclass()) {
            String name = type.getSimpleName();
            if (FEED_PAGER.equals(type.getName()) || "ViewPager".equals(name) || "ViewPager2".equals(name)
                    || "RecyclerView".equals(name)) {
                return true;
            }
        }
        return false;
    }

    private static boolean isInside(View view, View group) {
        for (ViewParent parent = view.getParent(); parent instanceof View; parent = parent.getParent()) {
            if (parent == group) return true;
        }
        return false;
    }

    /**
     * Presses the heart the way TikTok's own long press like does (LongPressDiggAssem). The heart's
     * click is a toggle that takes a like back off a liked video. This one likes only a video that
     * isn't liked yet, through the same handler the click runs, so the count, the animation and
     * Confirm likes all work as they do for a tap on the heart.
     */
    private static boolean pressLike(Object owner) {
        Method like = likePress(owner);
        if (like == null) return false;
        try {
            like.invoke(owner);
            Logger.printDebug(() -> "Liked through " + like.getName());
            return true;
        } catch (ReflectiveOperationException | RuntimeException exception) {
            Logger.printException(() -> "Could not like the video from the feed gesture", exception);
            return false;
        }
    }

    /**
     * The post a long press was made on, for the actions that need more than its comments.
     *
     * <p>Not the playing post. Until a new video starts playing, that's still the one before,
     * so a link copied right after a swipe was that video's (#63). With a feed in front, it's
     * the post bound to its cell on screen, and none for a cell without a button (a LIVE or an
     * ad). Anywhere else, or with no button registered in front at all, which a build that
     * moved the button would look like, it's the playing post as before.
     */
    public static Object onScreenAweme() {
        Object playing = CurrentVideoAuthor.getAweme();
        String playingId = Reflect.string(playing, "getAid", "aid");
        OnScreen screen = onScreen(playingId);
        if (!screen.feedInFront) return playing;
        if (screen.control == null) return screen.registeredInFront ? null : playing;
        Object aweme = screen.control.aweme.get();
        if (aweme != null) return aweme;
        return playingId != null && playingId.equals(screen.control.videoId) ? playing : null;
    }

    /** What the screen says about the video a gesture was made on. */
    private static final class OnScreen {
        /** The comment button of the cell showing most, its assem and its binding; or nulls. */
        Object owner;
        View view;
        CommentControl control;
        /** The window in front shows a cell of TikTok's feed pager, with a button or without. */
        boolean feedInFront;
        /** Some registered button, on screen or not, lives in the window in front. */
        boolean registeredInFront;
    }

    /**
     * The window in front first, then how much of the cell shows, then the playing id. With a
     * feed in front, only its own cells count: a feed left showing behind it, the main feed
     * under a video opened from a profile, is out of sight even when its window isn't.
     */
    private static OnScreen onScreen(String playingId) {
        OnScreen screen = new OnScreen();
        Activity front = Utils.getVisibleActivity();
        Window window = front == null ? null : front.getWindow();
        View frontRoot = window == null ? null : window.peekDecorView();
        Rect visible = new Rect();
        screen.feedInFront = showsFeedCell(frontRoot, visible);
        boolean bestInFront = false;
        boolean bestPlaying = false;
        float bestShare = 0;
        for (Map.Entry<Object, CommentControl> entry : COMMENTS.entrySet()) {
            View view = entry.getValue().view.get();
            if (view == null || !view.isAttachedToWindow()) continue;
            boolean inFront = frontRoot != null && view.getRootView() == frontRoot;
            screen.registeredInFront |= inFront;
            if (screen.feedInFront && !inFront) continue;
            float share = onScreenShare(cellOf(view), visible);
            if (share <= 0) continue;
            String id = entry.getValue().videoId;
            boolean playing = playingId != null && playingId.equals(id);
            if (screen.view != null
                    && !beats(inFront, share, playing, bestInFront, bestShare, bestPlaying)) continue;
            screen.owner = entry.getKey();
            screen.view = view;
            screen.control = entry.getValue();
            bestInFront = inFront;
            bestShare = share;
            bestPlaying = playing;
        }
        return screen;
    }

    /** Whether a cell of TikTok's feed pager shows anywhere under {@code view}. */
    private static boolean showsFeedCell(View view, Rect visible) {
        if (!(view instanceof ViewGroup)) return false;
        ViewGroup group = (ViewGroup) view;
        boolean pager = FEED_PAGER.equals(group.getClass().getName());
        for (int i = 0, count = group.getChildCount(); i < count; i++) {
            View child = group.getChildAt(i);
            if (pager ? onScreenShare(child, visible) > 0 : showsFeedCell(child, visible)) return true;
        }
        return false;
    }

    /** The window in front first, then how much of the cell shows, then the playing id. */
    private static boolean beats(boolean inFront, float share, boolean playing,
                                 boolean bestInFront, float bestShare, boolean bestPlaying) {
        if (inFront != bestInFront) return inFront;
        if (share != bestShare) return share > bestShare;
        return playing && !bestPlaying;
    }

    /**
     * The video cell a comment button sits in: the pager's child above it. The button itself on
     * a surface without that pager, which then has to be shown to count.
     */
    public static View cellOf(View view) {
        View child = view;
        for (ViewParent parent = view.getParent(); parent instanceof View; parent = parent.getParent()) {
            if (FEED_PAGER.equals(parent.getClass().getName())) return child;
            child = (View) parent;
        }
        return view;
    }

    /**
     * How much of the cell is on screen, from 0 to 1. Nothing inside the cell is asked: Clear
     * display hides the rail of the video being watched, and on some builds lays the cell out
     * with it already hidden. Everything above the cell has to be shown, which leaves out a feed
     * behind another tab, or behind a detail page, whose cells keep their last layout.
     */
    public static float onScreenShare(View cell, Rect visible) {
        float area = (float) cell.getWidth() * cell.getHeight();
        ViewParent parent = cell.getParent();
        if (area <= 0 || cell.getVisibility() != View.VISIBLE || !(parent instanceof View)
                || !((View) parent).isShown() || !cell.getGlobalVisibleRect(visible)) {
            return 0;
        }
        return visible.width() * (float) visible.height() / area;
    }

    /** The Hook status family the comment press reports under. */
    static final String FAMILY = "double tap";
    /** The ability the comment assem implements; its one no-argument method is the icon press. */
    static final String COMMENT_ABILITY = "com.ss.android.ugc.aweme.feed.assem.ability.IVideoCommentAbility";

    /**
     * Presses the comment button the way TikTok's own keyboard shortcut does.
     *
     * <p>The registered view's click listener does nothing. TikTok wires the real handler as a
     * touch listener and leaves a placeholder click listener beside it, so {@code performClick()}
     * fires the placeholder, reports true, and no sheet opens; that is what a double tap set to
     * comments did on the S22 with 46.2.3 on 2026-09-14. The assem the view belongs to implements
     * {@code IVideoCommentAbility}, whose only no-argument method is the comment-icon press with
     * all of TikTok's own gating in front of it (comments turned off, a private account, FTC).
     * It is that shape on 46.2.3, 46.7.3 and 46.8.3 under three different names, so it is found
     * by shape. A build without the ability falls back to the click, and Hook status says so.
     */
    private static boolean press(Object owner, View view) {
        Method icon = commentPress(owner);
        if (icon == null) return click(view);
        try {
            icon.invoke(owner);
            Logger.printDebug(() -> "Pressed the comment button through " + icon.getName());
            return true;
        } catch (ReflectiveOperationException | RuntimeException exception) {
            Logger.printException(() -> "Could not press the comment button from the feed gesture", exception);
            return false;
        }
    }

    /**
     * The ability's one no-argument method, or null when the owner has no such ability or the
     * ability has grown a second method of that shape and the press can no longer be told apart.
     */
    static Method commentPress(Object owner) {
        return abilityPress(owner, COMMENT_ABILITY, FAMILY);
    }

    /** The Hook status family the like press reports under. */
    static final String LIKE_FAMILY = "long press like";
    /**
     * The ability the heart's assem implements. Its one no-argument method is TikTok's long press
     * like, which likes a video that isn't liked and leaves a liked one be. On 47.1.4 it's MG0,
     * beside the heart's click (Dw0, the one that takes a String), and the shape picks it the way
     * it picks the comment press.
     */
    static final String LIKE_ABILITY = "com.ss.android.ugc.feed.platform.cell.ability.VideoDiggAssemAbility";

    /** The heart's ability's one no-argument method, found as the comment press is. */
    static Method likePress(Object owner) {
        return abilityPress(owner, LIKE_ABILITY, LIKE_FAMILY);
    }

    /** The Hook status family the heart's click reports under. */
    static final String HEART_CLICK_FAMILY = "heart click";

    /**
     * The heart's click on the same ability: its one method that takes a String and returns
     * nothing (Rt0 on 47.5.3). TikTok's own tap on the heart runs it, and a null String is the
     * tap's "click_like", so it likes a video that isn't liked and takes the like off one that is,
     * through the handler Confirm likes guards.
     */
    static Method heartClick(Object owner) {
        return abilityPress(owner, LIKE_ABILITY, HEART_CLICK_FAMILY, String.class);
    }

    private static Method abilityPress(Object owner, String abilityName, String family, Class<?>... parameters) {
        if (owner == null) return null;
        for (Class<?> type = owner.getClass(); type != null; type = type.getSuperclass()) {
            for (Class<?> ability : type.getInterfaces()) {
                if (!abilityName.equals(ability.getName())) continue;
                Method found = null;
                for (Method candidate : ability.getDeclaredMethods()) {
                    if (!Arrays.equals(candidate.getParameterTypes(), parameters)
                            || candidate.getReturnType() != void.class) {
                        continue;
                    }
                    if (found != null) {
                        HookStatus.missingMember(family, "one no-argument method on",
                                ability.getName(), "press");
                        return null;
                    }
                    found = candidate;
                }
                if (found == null) break;
                found.setAccessible(true);
                HookStatus.bound(family, ability.getName() + "#" + found.getName());
                return found;
            }
        }
        HookStatus.missingMember(family, "ability", owner.getClass().getName(),
                abilityName.substring(abilityName.lastIndexOf('.') + 1));
        return null;
    }

    private static boolean click(View view) {
        try {
            return view.performClick();
        } catch (RuntimeException exception) {
            Logger.printException(() -> "Could not open comments from the feed gesture", exception);
            return false;
        }
    }
}
