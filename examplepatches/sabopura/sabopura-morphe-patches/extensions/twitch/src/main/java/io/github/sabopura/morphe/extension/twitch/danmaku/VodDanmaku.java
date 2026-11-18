package io.github.sabopura.morphe.extension.twitch.danmaku;

import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;

import io.github.sabopura.morphe.extension.twitch.Diagnostics;
import io.github.sabopura.morphe.extension.twitch.player.PlayerTools;
import io.github.sabopura.morphe.extension.twitch.ui.Feature;
import io.github.sabopura.morphe.extension.twitch.ui.Features;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * Flows a VOD's chat replay over the video. As playback reaches each second, Twitch adds that
 * second's comments to its chat list, whether the chat is on screen or not; each comment it adds
 * comes here. So danmaku follows the position, the speed, pauses, seeks and the VOD chat offset
 * the same way the chat list does.
 */
@SuppressWarnings("unused")
public final class VodDanmaku {
    /** Comments beyond this, arriving faster than they can flow, are dropped. */
    private static final int MAX_WAITING = 300;

    private static final class Waiting {
        final ChatMessageReader.Comment comment;
        final int second;
        long dueMs;

        Waiting(ChatMessageReader.Comment comment, int second) {
            this.comment = comment;
            this.second = second;
        }
    }

    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final Runnable DRAIN = VodDanmaku::drain;
    private static final Runnable RELEASE = VodDanmaku::release;
    /** Twitch's comment models, handed over by whichever thread built the rows. */
    private static final List<Object> DELIVERED = new ArrayList<>();
    private static boolean drainPosted;

    // The rest is used on the main thread only.
    private static final VodReplay REPLAY = new VodReplay();
    private static final List<Waiting> WAITING = new ArrayList<>();
    private static WeakReference<DanmakuOverlayView> target = new WeakReference<>(null);
    /** When the comments waiting were held back by a pause, or 0. */
    private static long heldSince;

    private VodDanmaku() {
    }

    /** Injection point: Twitch builds a VOD chat row for a comment it adds to the chat replay. */
    public static void onComment(Object comment) {
        try {
            if (comment == null || !Features.has(Feature.VOD_DANMAKU) || !wanted(DanmakuSettings.peek())) return;
            synchronized (DELIVERED) {
                if (DELIVERED.size() < MAX_WAITING) DELIVERED.add(comment);
                if (drainPosted) return;
                drainPosted = true;
            }
            MAIN.post(DRAIN);
        } catch (RuntimeException | LinkageError failure) {
            Diagnostics.note("danmaku.vod-comment", failure);
        }
    }

    /** The overlay's video resumed: comments held back by the pause go on from where they were. */
    static void resumed(DanmakuOverlayView view) {
        if (view != target.get() || WAITING.isEmpty()) return;
        MAIN.removeCallbacks(RELEASE);
        release();
    }

    private static boolean wanted(DanmakuSettings settings) {
        return settings != null && settings.enabled && settings.vod;
    }

    private static void drain() {
        List<Object> batch;
        synchronized (DELIVERED) {
            batch = new ArrayList<>(DELIVERED);
            DELIVERED.clear();
            drainPosted = false;
        }
        try {
            DanmakuSettings settings = DanmakuSettings.peek();
            DanmakuOverlayView view = TwitchDanmaku.activeView();
            if (!wanted(settings) || view == null) return;
            String vod = PlayerTools.vodId();
            if (vod.isEmpty() || Boolean.TRUE.equals(PlayerTools.live())) return;
            double now = VodReplay.contentSeconds(PlayerTools.position(),
                    Features.has(Feature.VOD_OFFSET) ? PlayerTools.commentShift() : 0);
            long wallMs = SystemClock.uptimeMillis();
            boolean jumped = REPLAY.moveTo(vod, now, wallMs);
            if (jumped || view != target.get()) {
                MAIN.removeCallbacks(RELEASE);
                WAITING.clear();
                heldSince = 0;
                target = new WeakReference<>(view);
                if (jumped) view.clearComments();
            }
            schedule(admitted(batch, settings, vod, now), now, wallMs);
            MAIN.removeCallbacks(RELEASE);
            release();
        } catch (RuntimeException | LinkageError failure) {
            Diagnostics.note("danmaku.vod-drain", failure);
        }
    }

    /** The comments of this VOD that belong where it plays, have not flowed and pass the filters. */
    private static List<Waiting> admitted(List<Object> batch, DanmakuSettings settings, String vod, double now) {
        List<Waiting> result = new ArrayList<>(batch.size());
        for (Object raw : batch) {
            try {
                String commentVod = VodCommentAccess.vodId(raw);
                if (commentVod != null && !vod.equals(commentVod.startsWith("v") ? commentVod.substring(1) : commentVod))
                    continue;
                int second = VodCommentAccess.offsetSeconds(raw);
                if (!REPLAY.admit(VodCommentAccess.id(raw), second, now)) continue;
                ChatMessageReader.Comment comment = read(raw);
                if (comment != null && TwitchDanmaku.passes(settings, comment)) result.add(new Waiting(comment, second));
            } catch (RuntimeException | LinkageError failure) {
                Diagnostics.note("danmaku.vod-read", failure);
            }
        }
        return result;
    }

    private static ChatMessageReader.Comment read(Object raw) {
        Object message = VodCommentAccess.message(raw);
        if (message == null) return null;
        Object commenter = VodCommentAccess.commenter(raw);
        List<VodCommentReader.Emote> emotes = new ArrayList<>();
        Object emoticons = VodCommentAccess.emoticons(message);
        if (emoticons instanceof List) {
            for (Object emoticon : (List<?>) emoticons) {
                if (emoticon != null)
                    emotes.add(new VodCommentReader.Emote(VodCommentAccess.emoteId(emoticon),
                            VodCommentAccess.emoteBegin(emoticon)));
            }
        }
        return VodCommentReader.read(VodCommentAccess.id(raw),
                commenter == null ? null : VodCommentAccess.displayName(commenter),
                commenter == null ? null : VodCommentAccess.login(commenter),
                commenter == null ? null : VodCommentAccess.userId(commenter),
                VodCommentAccess.color(message), VodCommentAccess.body(message), emotes);
    }

    /** Spreads each second's comments over that second of playback. */
    private static void schedule(List<Waiting> comments, double now, long wallMs) {
        Map<Integer, int[]> seconds = new HashMap<>();
        for (Waiting waiting : comments) {
            int[] counts = seconds.get(waiting.second);
            if (counts == null) seconds.put(waiting.second, counts = new int[2]);
            counts[0]++;
        }
        float rate = rate();
        for (Waiting waiting : comments) {
            int[] counts = seconds.get(waiting.second);
            waiting.dueMs = wallMs + VodReplay.delayMillis(waiting.second, counts[1]++, counts[0], now, rate);
            if (WAITING.size() >= MAX_WAITING) WAITING.remove(0);
            WAITING.add(waiting);
        }
    }

    private static float rate() {
        float rate = PlayerTools.playbackRate();
        return Float.isNaN(rate) || rate <= 0f ? 1f : Math.max(.25f, Math.min(2f, rate));
    }

    /** Hands the overlay the comments that are due, and comes back when the next one is. */
    private static void release() {
        try {
            DanmakuOverlayView view = target.get();
            if (WAITING.isEmpty()) return;
            if (view == null || !view.isAttachedToWindow() || !wanted(DanmakuSettings.peek())) {
                WAITING.clear();
                heldSince = 0;
                return;
            }
            long now = SystemClock.uptimeMillis();
            if (view.isPaused()) {
                if (heldSince == 0) heldSince = now;
                return;
            }
            if (heldSince != 0) {
                for (Waiting waiting : WAITING) waiting.dueMs += now - heldSince;
                heldSince = 0;
            }
            long next = Long.MAX_VALUE;
            for (Iterator<Waiting> it = WAITING.iterator(); it.hasNext(); ) {
                Waiting waiting = it.next();
                if (waiting.dueMs > now) {
                    next = Math.min(next, waiting.dueMs);
                    continue;
                }
                it.remove();
                view.add(waiting.comment);
            }
            if (next != Long.MAX_VALUE) MAIN.postAtTime(RELEASE, next);
        } catch (RuntimeException | LinkageError failure) {
            Diagnostics.note("danmaku.vod-release", failure);
            WAITING.clear();
        }
    }
}
