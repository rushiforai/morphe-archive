package io.github.sabopura.morphe.extension.twitch.danmaku;

import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;
import android.view.View;

import io.github.sabopura.morphe.extension.twitch.Diagnostics;
import io.github.sabopura.morphe.extension.twitch.chat.ChatSettings;
import io.github.sabopura.morphe.extension.twitch.player.PlayerTools;
import io.github.sabopura.morphe.extension.twitch.ui.Feature;
import io.github.sabopura.morphe.extension.twitch.ui.Features;

import java.util.ArrayList;
import java.util.List;

/** Flows {@link LiveChat} messages over the largest visible player. */
@SuppressWarnings("unused")
public final class TwitchDanmaku {
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final List<DanmakuOverlayView> VIEWS = new ArrayList<>();
    /** Token of the comments waiting for the video to catch up. */
    private static final Object HELD = new Object();
    private static final long LATENCY_READ_MS = 1000L;
    private static volatile String currentRoom;
    private static long latencyReadAt;
    private static long latencyMs;
    private static boolean live = true;
    private static long loggedHold;

    private TwitchDanmaku() {
    }

    public static int configFontSizeSp() { return 22; }
    public static int configOpacityPercent() { return 85; }
    public static int configDurationSeconds() { return 7; }
    public static int configCoveragePercent() { return 75; }
    public static int configMaxLength() { return 60; }

    /** Puts each live chat message on the largest visible player. */
    static final LiveChat.Subscriber SUBSCRIBER = new LiveChat.Subscriber() {
        @Override
        public boolean wants() {
            DanmakuSettings settings = DanmakuSettings.peek();
            return settings != null && settings.enabled;
        }

        @Override
        public void onMessage(LiveChat.Message message) {
            DanmakuSettings settings = DanmakuSettings.peek();
            if (settings == null || !settings.enabled) return;
            noteRoom(message.room);
            ChatMessageReader.Comment comment = message.comment;
            if (!passes(settings, comment)) return;
            MAIN.post(() -> {
                try {
                    long hold = settings.matchDelay ? StreamDelay.hold(latency()) : 0L;
                    if (Math.abs(hold - loggedHold) >= 2000L) {
                        loggedHold = hold;
                        Log.i("SabopuraTwitch", "Danmaku waits " + hold + " ms for the video, " + latencyMs + " ms behind");
                    }
                    if (hold == 0L) {
                        show(comment);
                        return;
                    }
                    DanmakuOverlayView target = activeView();
                    String room = message.room;
                    // The viewer may leave while it waits; it must not flow over another stream or a video.
                    if (target != null) MAIN.postAtTime(() -> {
                        try {
                            if (target == activeView() && room != null && room.equals(currentRoom) && stillLive()) {
                                target.add(comment);
                            }
                        } catch (RuntimeException | LinkageError e) {
                            Diagnostics.note("danmaku.live-held", e);
                        }
                    }, HELD, SystemClock.uptimeMillis() + hold);
                } catch (RuntimeException | LinkageError e) {
                    Diagnostics.note("danmaku.live-hold", e);
                }
            });
        }
    };

    private static void show(ChatMessageReader.Comment comment) {
        try {
            DanmakuOverlayView target = activeView();
            if (target != null) target.add(comment);
        } catch (RuntimeException | LinkageError e) {
            Diagnostics.note("danmaku.live-add", e);
        }
    }

    /** Main thread. Every comment asks, so the player is read at most once a second. */
    private static long latency() {
        long now = SystemClock.uptimeMillis();
        if (latencyReadAt == 0L || now - latencyReadAt >= LATENCY_READ_MS) {
            latencyReadAt = now;
            latencyMs = PlayerTools.liveDelay();
            live = !Boolean.FALSE.equals(PlayerTools.live());
        }
        return latencyMs;
    }

    /** Main thread. False once a VOD or clip plays where the stream was, read as often as the latency. */
    private static boolean stillLive() {
        latency();
        return live;
    }

    /** The length limit, the danmaku blocked words and the chat filters, for live and VOD comments alike. */
    static boolean passes(DanmakuSettings settings, ChatMessageReader.Comment comment) {
        if (comment.plainText.codePointCount(0, comment.plainText.length()) > settings.maxLength) return false;
        return !settings.filter.blocks(comment.plainText) && !hiddenByChatFilters(comment);
    }

    /** The chat's own hidden users and word rules, when the chat filters patch is applied. */
    private static boolean hiddenByChatFilters(ChatMessageReader.Comment comment) {
        if (!Features.has(Feature.CHAT_FILTERS)) return false;
        ChatSettings chat = ChatSettings.peek();
        return chat != null && chat.enabled && chat.rules.blocks(comment.plainText, comment.login, comment.userId);
    }

    private static void noteRoom(String room) {
        if (room == null || room.equals(currentRoom)) return;
        currentRoom = room;
        MAIN.post(() -> {
            MAIN.removeCallbacksAndMessages(HELD);
            for (DanmakuOverlayView view : VIEWS) view.clearComments();
        });
    }

    /**
     * Injection point: Twitch's player presenter, whenever the state it shows changes.
     *
     * @param playerRoot the root view of that player
     * @param state      PLAYING, PAUSED, STOPPED, ...
     */
    public static void onPlayerState(View playerRoot, Enum<?> state) {
        try {
            if (playerRoot == null || state == null) return;
            String name = state.name();
            boolean playing = name.equals("PLAYING");
            if (!playing && !name.equals("PAUSED") && !name.equals("STOPPED")) return;
            MAIN.post(() -> {
                try {
                    for (DanmakuOverlayView view : VIEWS) if (view.isInside(playerRoot)) view.setPaused(!playing);
                } catch (RuntimeException | LinkageError e) {
                    Diagnostics.note("danmaku.player-pause", e);
                }
            });
        } catch (RuntimeException | LinkageError failure) {
            Diagnostics.note("danmaku.player-state", failure);
        }
    }

    /**
     * The player controls came or went. Comments step back while they are up, so the buttons and the
     * title under them can be read. Main thread.
     *
     * @param control a view among those controls
     */
    public static void controlsShown(View control, boolean shown) {
        try {
            DanmakuOverlayView watched = shown ? activeView() : null;
            for (DanmakuOverlayView view : VIEWS) {
                view.setDimmed(view == watched && view.getRootView() == control.getRootView());
            }
        } catch (RuntimeException | LinkageError e) {
            Diagnostics.note("danmaku.controls-shown", e);
        }
    }

    static void register(DanmakuOverlayView view) {
        if (!VIEWS.contains(view)) VIEWS.add(view);
    }

    static void unregister(DanmakuOverlayView view) {
        VIEWS.remove(view);
    }

    /** Applies changed settings to every player; the views are only touched on the main thread. */
    public static void settingsChanged() {
        if (Looper.myLooper() != Looper.getMainLooper()) {
            MAIN.post(TwitchDanmaku::settingsChanged);
            return;
        }
        try {
            for (DanmakuOverlayView view : new ArrayList<>(VIEWS)) view.settingsChanged();
        } catch (RuntimeException | LinkageError e) {
            Diagnostics.note("danmaku.settings-changed", e);
        }
    }

    /** The largest visible player; feed previews and minimised players are smaller. */
    static DanmakuOverlayView activeView() {
        DanmakuOverlayView best = null;
        long bestArea = 0L;
        for (DanmakuOverlayView view : VIEWS) {
            if (!view.isAttachedToWindow() || !view.isShown()) continue;
            long area = (long) view.getWidth() * view.getHeight();
            if (area > bestArea) {
                bestArea = area;
                best = view;
            }
        }
        return best;
    }
}
