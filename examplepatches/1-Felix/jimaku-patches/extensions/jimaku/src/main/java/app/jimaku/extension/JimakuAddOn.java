package app.jimaku.extension;

import java.util.concurrent.atomic.AtomicBoolean;

import app.morphe.extension.youtube.addon.AddOnApi;

/**
 * Jimaku's entry point. The patch adds a call to {@link #register()} to Morphe's
 * {@code AddOnManager.registerAddOns()}, which runs on the first of Morphe's player hooks, on the
 * main thread. Each listener is a Java lambda of an Android interface, as Morphe's add-on API asks.
 */
@SuppressWarnings("unused")
public final class JimakuAddOn {
    private static final AtomicBoolean registered = new AtomicBoolean();

    private JimakuAddOn() {
    }

    public static void register() {
        if (!registered.compareAndSet(false, true)) return;
        Guard.run("registration", () -> {
            Player player = new Player();
            Guard.setOnFault(player::onFault);
            player.watchActivities(Morphe.context());

            AddOnApi.addPlayerOverlayButtonsListener(view -> Guard.run("overlay buttons", () -> player.onControlsCreated(view)));
            AddOnApi.addNewVideoStartedListener(() -> Guard.run("new video", player::onNewVideo));
            AddOnApi.addVideoIdListener(id -> Guard.run("video ID", () -> player.onVideoId(id)));
            AddOnApi.addVideoStateListener(state -> Guard.run("video state", () -> player.onVideoState(state)));
            AddOnApi.addVideoTimeListener(millis -> Guard.run("video time", () -> player.onVideoTime(millis)));

            JimakuLog.info("Registered with Morphe, bundle " + BuildConfig.BUNDLE_VERSION
                    + (BuildConfig.FAULT_TEST ? ", fault test build" : ""));
        });
    }
}
