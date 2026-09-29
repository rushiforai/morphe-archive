package io.github.bakwudo.uyu.extension.danmaku;

import android.os.Handler;
import android.os.Looper;
import android.view.View;

import java.lang.ref.WeakReference;
import java.util.List;

import io.github.bakwudo.uyu.extension.Utils;
import io.github.bakwudo.uyu.extension.settings.Settings;

@SuppressWarnings("unused")
public final class DanmakuPatch {
    private static final Handler mainHandler = new Handler(Looper.getMainLooper());

    /** The overlay of the most recently created live theatre. */
    private static volatile WeakReference<DanmakuOverlay> currentOverlay = new WeakReference<>(null);

    private DanmakuPatch() {
    }

    /**
     * Injection point: end of the live theatre view delegate's constructor.
     *
     * @param theatreViewDelegate The theatre's view delegate.
     */
    public static void onTheatreCreated(Object theatreViewDelegate) {
        try {
            View root = ViewDelegates.rootView(theatreViewDelegate);
            if (root == null) {
                Utils.logInfo("Danmaku: theatre root view not found");
                return;
            }
            DanmakuOverlay overlay = DanmakuOverlay.attach(root);
            if (overlay != null) currentOverlay = new WeakReference<>(overlay);
        } catch (Exception ex) {
            Utils.logError("Danmaku: failed to add the overlay", ex);
        }
    }

    /**
     * Injection point: the player presenter, when the playback state changes.
     *
     * @param playerViewDelegate The presenter's player view delegate.
     * @param state              The player's state (STOPPED, PAUSED, PLAYING, PREPARING, ...).
     */
    public static void onPlayerStateChanged(Object playerViewDelegate, Enum<?> state) {
        try {
            if (state == null) return;
            String name = state.name();
            boolean paused;
            if (name.equals("PLAYING")) {
                paused = false;
            } else if (name.equals("PAUSED") || name.equals("STOPPED")) {
                paused = true;
            } else {
                return;
            }

            View playerRoot = ViewDelegates.rootView(playerViewDelegate);
            mainHandler.post(() -> {
                DanmakuOverlay overlay = currentOverlay.get();
                // Other players, such as picture by picture ads, have their own views.
                if (overlay != null && overlay.isInPlayer(playerRoot)) overlay.setPaused(paused);
            });
        } catch (Exception ex) {
            Utils.logError("Danmaku: failed to handle the player state", ex);
        }
    }

    /**
     * Injection point: constructor of MessagesReceivedEvent, created by the chat connection for
     * every batch of messages it receives.
     *
     * @param channelId   The channel's user id.
     * @param messages    ChatLiveMessage objects.
     * @param fromHistory true for messages sent before the chat was joined.
     */
    public static void onMessagesReceived(String channelId, List<?> messages, boolean fromHistory) {
        try {
            if (fromHistory || messages == null || messages.isEmpty()) return;
            // Messages are tracked even while no comments are shown, so that the chat connection
            // sending them again later does not show them.
            List<DanmakuComment> comments = DanmakuMessages.toComments(messages);
            if (comments.isEmpty() || currentOverlay.get() == null || !Settings.DANMAKU_ENABLED.get()) return;

            mainHandler.post(() -> {
                DanmakuOverlay overlay = currentOverlay.get();
                if (overlay != null) overlay.addComments(comments);
            });
        } catch (Exception ex) {
            Utils.logError("Danmaku: failed to handle chat messages", ex);
        }
    }
}
