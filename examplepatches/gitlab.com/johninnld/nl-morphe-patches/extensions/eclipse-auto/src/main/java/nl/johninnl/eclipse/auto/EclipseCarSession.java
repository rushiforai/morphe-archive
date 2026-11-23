package nl.johninnl.eclipse.auto;

import android.content.Intent;
import androidx.car.app.CarToast;
import androidx.car.app.Screen;
import androidx.car.app.ScreenManager;
import androidx.car.app.Session;
import androidx.car.app.media.MediaConstants;
import androidx.car.app.media.MediaPlaybackManager;
import androidx.lifecycle.DefaultLifecycleObserver;
import androidx.lifecycle.LifecycleOwner;
import java.util.concurrent.ExecutorService;
import nl.johninnl.eclipse.auto.app.AppBridge;
import nl.johninnl.eclipse.auto.app.Signals;
import nl.johninnl.eclipse.auto.data.AppPort;
import nl.johninnl.eclipse.auto.data.Catalog;
import nl.johninnl.eclipse.auto.data.CatalogFactory;
import nl.johninnl.eclipse.auto.data.HomeBuilder;
import nl.johninnl.eclipse.auto.data.LibraryStore;
import nl.johninnl.eclipse.auto.data.Model;
import nl.johninnl.eclipse.auto.data.RadioStore;
import nl.johninnl.eclipse.auto.screens.CollectionScreen;
import nl.johninnl.eclipse.auto.screens.Host;
import nl.johninnl.eclipse.auto.screens.PlaceholderScreen;
import nl.johninnl.eclipse.auto.screens.PlayerScreen;
import nl.johninnl.eclipse.auto.screens.QueueScreen;
import nl.johninnl.eclipse.auto.screens.RootScreen;
import nl.johninnl.eclipse.auto.screens.SearchScreen;
import nl.johninnl.eclipse.auto.ui.CarEnv;
import nl.johninnl.eclipse.auto.ui.Env;
import nl.johninnl.eclipse.auto.ui.Navigator;

/**
 * One car session. UI ownership is separate from the application playback link: the session
 * attaches to {@link MediaLink}, registers the app's own compat token with the host once the link
 * is ready (never before), and shows the player as the root screen when started with
 * SHOW_MEDIA_PLAYBACK. It owns the {@link Catalog} of server-fed content, whose pending results are
 * dropped when the session is destroyed.
 */
final class EclipseCarSession extends Session implements MediaLink.Listener, Host {
    private AppBridge app;
    private CarEnv env;
    private LibraryStore library;
    private RadioStore radio;
    private HomeBuilder homeBuilder;
    private Catalog catalog;
    private ExecutorService feedExecutor;
    private MediaLink link;
    private boolean destroyed;
    private boolean registered;
    private boolean reconnecting;
    private String error;
    private final Runnable queueSignal = this::refresh;

    @Override public Screen onCreateScreen(Intent intent) {
        app = new AppBridge(getCarContext());
        env = new CarEnv(getCarContext(), app);
        library = new LibraryStore(app);
        radio = new RadioStore(app);
        homeBuilder = new HomeBuilder(app, library, radio);
        catalog = newCatalog();
        getLifecycle().addObserver(new DefaultLifecycleObserver() {
            @Override public void onDestroy(LifecycleOwner owner) {
                destroyed = true;
                registered = false;
                Signals.clearListener(queueSignal);
                catalog.close();
                feedExecutor.shutdown();
                if (link != null) link.detach(EclipseCarSession.this);
            }
        });
        Signals.setListener(queueSignal);
        attach();
        return MediaConstants.ACTION_SHOW_MEDIA_PLAYBACK.equals(intent.getAction())
            ? new PlayerScreen(getCarContext(), this) : new RootScreen(getCarContext(), this);
    }

    /** One background thread for the feeds; results come back to the main thread. */
    private Catalog newCatalog() {
        feedExecutor = CatalogFactory.newExecutor();
        return CatalogFactory.create(getCarContext(), app, feedExecutor, queueSignal);
    }

    @Override public void onNewIntent(Intent intent) {
        if (MediaConstants.ACTION_SHOW_MEDIA_PLAYBACK.equals(intent.getAction())) showPlayer();
    }

    private void attach() {
        link = MediaLink.get(getCarContext().getApplicationContext());
        link.attach(this);
    }

    // ---- MediaLink.Listener --------------------------------------------------------------------

    @Override public void connected() {
        if (destroyed || link == null || !link.ready()) return;
        try {
            getCarContext().getCarService(MediaPlaybackManager.class)
                .registerMediaPlaybackToken(AppBridge.compatToken(link.sessionToken()));
            registered = true;
            error = null;
            if (reconnecting) {
                reconnecting = false;
                popToRoot();
            }
            refresh();
        } catch (RuntimeException failure) {
            disconnected("Could not register Eclipse playback. Reconnect to continue.");
        }
    }

    /** Playback state changes redraw nothing here: the host draws the player itself. */
    @Override public void changed() { }

    @Override public void disconnected(String reason) {
        if (destroyed) return;
        registered = false;
        error = reason;
        refresh();
    }

    // ---- Host ----------------------------------------------------------------------------------

    @Override public Env env() { return env; }

    @Override public AppPort app() { return app; }

    @Override public LibraryStore library() { return library; }

    @Override public RadioStore radio() { return radio; }

    @Override public Catalog catalog() { return catalog; }

    @Override public HomeBuilder homeBuilder() { return homeBuilder; }

    @Override public boolean hasUpcoming() { return app.hasUpcoming(); }

    @Override public boolean playerReady() { return !destroyed && registered && link != null && link.ready(); }

    @Override public String playerError() { return error; }

    @Override public void reconnect() {
        if (destroyed) return;
        if (link != null) link.detach(this);
        registered = false;
        error = null;
        reconnecting = true;
        attach();
        refresh();
    }

    @Override public void showPlayer() {
        ScreenManager screens = getCarContext().getCarService(ScreenManager.class);
        if (screens.getTop() instanceof PlayerScreen) return;
        for (Screen screen : screens.getScreenStack()) {
            if (screen instanceof PlayerScreen) {
                screens.popTo(PlayerScreen.MARKER);
                return;
            }
        }
        Navigator.push(screens, new PlayerScreen(getCarContext(), this));
    }

    @Override public void showQueue() {
        ScreenManager screens = getCarContext().getCarService(ScreenManager.class);
        if (!(screens.getTop() instanceof QueueScreen)) Navigator.push(screens, new QueueScreen(getCarContext(), this));
    }

    @Override public void showSearch(Screen from) {
        if (!(from.getScreenManager().getTop() instanceof SearchScreen)) {
            Navigator.push(from.getScreenManager(), new SearchScreen(getCarContext(), this));
        }
    }

    @Override public void open(Screen from, Model.Collection collection) {
        Navigator.push(from.getScreenManager(), new CollectionScreen(getCarContext(), this, collection));
    }

    @Override public void showMessage(Screen from, String title, String message) {
        Navigator.push(from.getScreenManager(), new PlaceholderScreen(getCarContext(), title, message));
    }

    @Override public void toast(String text) { CarToast.makeText(getCarContext(), text, CarToast.LENGTH_SHORT).show(); }

    // ---- refresh -------------------------------------------------------------------------------

    private void popToRoot() {
        ScreenManager screens = getCarContext().getCarService(ScreenManager.class);
        if (!screens.getScreenStack().isEmpty()) screens.popToRoot();
    }

    /** Invalidate the screen on top. Called on queue changes, feed changes and when the link's state changes. */
    void refresh() {
        if (destroyed) return;
        try {
            Screen top = getCarContext().getCarService(ScreenManager.class).getTop();
            if (top != null) top.invalidate();
        } catch (IllegalStateException notCreatedYet) {
            // The first screen has not been created yet; it will build its own template.
        }
    }
}
