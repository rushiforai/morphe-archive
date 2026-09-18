/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 *
 * Built on icysymmetra/tiktok-patches-for-morphe (GPL-3.0).
 */
package app.morphe.extension.tiktok.interaction;

import android.content.Context;
import android.graphics.Rect;
import android.view.MotionEvent;
import android.view.View;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.tiktok.blockauthor.CurrentVideoAuthor;
import app.morphe.extension.tiktok.blockauthor.Reflect;
import app.morphe.extension.tiktok.download.OriginalSoundDownloads;
import app.morphe.extension.tiktok.download.ExternalDownloader;
import app.morphe.extension.tiktok.share.ShareUrlSanitizer;
import app.morphe.extension.tiktok.feedfilter.SoundIdentity;
import app.morphe.extension.tiktok.settings.Settings;
import app.morphe.extension.tiktok.settings.L10n;
import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.util.Map;
import java.util.WeakHashMap;

public final class GestureActions {
    private static final Map<Object, CommentControl> COMMENTS = new WeakHashMap<>();
    private GestureActions() {}

    private static final class CommentControl {
        WeakReference<View> view = new WeakReference<>(null);
        String videoId;
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
        commentControl(owner).videoId = Reflect.string(aweme, "getAid", "aid");
    }

    public static boolean onDoubleTap() {
        String action = Settings.DOUBLE_TAP_ACTION.get();
        if ("nothing".equals(action)) return true;
        if (!"comments".equals(action)) return false;
        if (!openComments(Reflect.string(CurrentVideoAuthor.getAweme(), "getAid", "aid"))) {
            Utils.showToastShort(L10n.t("Comments aren't available for this video"));
        }
        return true;
    }

    /** Eligibility callback from the native edge-speedup component before its 300 ms timer. */
    public static boolean allowNativeEdgeSpeedup(float x) {
        if (edgeSeekDelta(x) != 0) return false;
        String action = Settings.LONG_PRESS_ACTION.get();
        return !"nothing".equals(action) && !"comments".equals(action)
                && !"original_sound".equals(action) && !"copy_link".equals(action)
                && !"copy_sound_link".equals(action);
    }

    /**
     * How far a long press at this point should move the video, in milliseconds. Zero when
     * the press landed in the middle, when edge seeking is off, or when there is no screen
     * to measure the press against.
     */
    static long edgeSeekDelta(MotionEvent event) {
        return event == null ? 0 : edgeSeekDelta(event.getX());
    }

    private static long edgeSeekDelta(float x) {
        if (!Settings.EDGE_SEEK.get()) return 0;
        int seconds = Settings.EDGE_SEEK_SECONDS.get();
        if (seconds <= 0) return 0;
        // The dialog offers at most 60. A restored backup is never asked, and a press that
        // jumps an hour is indistinguishable from the video ending.
        seconds = Math.min(60, seconds);
        Context context = Utils.getContext();
        if (context == null) return 0;
        int width = context.getResources().getDisplayMetrics().widthPixels;
        if (width <= 0) return 0;

        // Whole pixels, so a press exactly on a third lands on one side of the line every
        // time. A screen width times a third does not, and 106.666664 sits below 106.66667.
        int third = width / 3;
        // The listener sits on the cell's touch layer, which fills the window, so the press
        // is placed against the window. getRawX would be the position on the whole display,
        // which in a side by side split view puts every press in the right hand third.
        if (x < third) return -seconds * 1000L;
        if (x >= width - third) return seconds * 1000L;
        return 0;
    }

    /**
     * Runs before TikTok's own long press handling. Returning true swallows the gesture,
     * which is what keeps the 2x hold and the quick share sheet from also firing.
     */
    public static boolean onLongPress(MotionEvent event) {
        return handleLongPress(edgeSeekDelta(event));
    }

    /** Ordinary feed cells deliver the saved local DOWN x through their native timer. */
    public static boolean onLongPress(float x) {
        return handleLongPress(edgeSeekDelta(x));
    }

    private static boolean handleLongPress(long delta) {
        if (delta != 0) {
            // Named, so a post that never reported progress cannot move the video before it.
            String videoId = Reflect.string(CurrentVideoAuthor.getAweme(), "getAid", "aid");
            if (!FeedSeek.seekBy(videoId, delta)) Utils.showToastShort(L10n.t("Nothing is playing to seek"));
            // The edge belongs to the seek whether or not it worked, so the 2x hold that would
            // otherwise start under the finger does not fire on top of it.
            return true;
        }

        String action = Settings.LONG_PRESS_ACTION.get();
        if ("nothing".equals(action)) return true;
        if ("copy_link".equals(action)) {
            String link = ExternalDownloader.shareUrl(CurrentVideoAuthor.getAweme());
            // The same treatment a shared link gets: TikTok's own link carries the parameters
            // that say who sent it, and the clipboard is somewhere else that goes.
            String clean = link == null ? null : ShareUrlSanitizer.rewriteShareUrl(link);
            if (copyToClipboard("TikTok link", clean)) {
                if (android.os.Build.VERSION.SDK_INT < 33) {
                    Utils.showToastShort(L10n.t("Link copied"));
                }
            } else {
                Utils.showToastShort(L10n.t("This video has no link to copy"));
            }
            return true;
        }
        if ("copy_sound_link".equals(action)) {
            // The same treatment the video link above gets. TikTok's own sound share URL is a
            // share URL like any other: it carries the parameters that say who sent it, and the
            // custom share domain belongs on it too. Only the link this builds from the sound's
            // id has never had a query on it.
            String sound = soundLink(CurrentVideoAuthor.getAweme());
            String clean = sound == null ? null : ShareUrlSanitizer.rewriteShareUrl(sound);
            if (copyToClipboard("TikTok sound", clean)) {
                if (android.os.Build.VERSION.SDK_INT < 33) {
                    Utils.showToastShort(L10n.t("Sound link copied"));
                }
            } else {
                Utils.showToastShort(L10n.t("This video has no sound of its own"));
            }
            return true;
        }
        if ("original_sound".equals(action)) {
            OriginalSoundDownloads.start(CurrentVideoAuthor.getAweme(), Utils.getActivity());
            return true;
        }
        if (!"comments".equals(action)) return false;
        if (!openComments(Reflect.string(CurrentVideoAuthor.getAweme(), "getAid", "aid"))) {
            Utils.showToastShort(L10n.t("Comments aren't available for this video"));
        }
        return true;
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

    static boolean openComments(String videoId) {
        if (videoId == null || videoId.isEmpty()) return false;
        Map.Entry<Object, CommentControl> hidden = null;
        for (Map.Entry<Object, CommentControl> entry : COMMENTS.entrySet()) {
            CommentControl control = entry.getValue();
            View view = control.view.get();
            if (!videoId.equals(control.videoId) || view == null || !view.isAttachedToWindow()) continue;
            if (view.isShown() && view.getGlobalVisibleRect(new Rect())) return press(entry.getKey(), view);
            // Clear display can hide the action rail while its native click handler remains usable.
            hidden = entry;
        }
        return hidden != null && press(hidden.getKey(), hidden.getValue().view.get());
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
        if (owner == null) return null;
        for (Class<?> type = owner.getClass(); type != null; type = type.getSuperclass()) {
            for (Class<?> ability : type.getInterfaces()) {
                if (!COMMENT_ABILITY.equals(ability.getName())) continue;
                Method found = null;
                for (Method candidate : ability.getDeclaredMethods()) {
                    if (candidate.getParameterTypes().length != 0
                            || candidate.getReturnType() != void.class) {
                        continue;
                    }
                    if (found != null) {
                        HookStatus.missingMember(FAMILY, "one no-argument method on",
                                ability.getName(), "press");
                        return null;
                    }
                    found = candidate;
                }
                if (found == null) break;
                found.setAccessible(true);
                HookStatus.bound(FAMILY, ability.getName() + "#" + found.getName());
                return found;
            }
        }
        HookStatus.missingMember(FAMILY, "ability", owner.getClass().getName(),
                "IVideoCommentAbility");
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
