package nl.johninnl.eclipse.auto.screens;

import androidx.car.app.CarContext;
import androidx.car.app.model.Template;
import androidx.lifecycle.DefaultLifecycleObserver;
import androidx.lifecycle.LifecycleOwner;
import java.util.List;
import nl.johninnl.eclipse.auto.data.Async;
import nl.johninnl.eclipse.auto.data.HomeView;
import nl.johninnl.eclipse.auto.data.LibraryStore;
import nl.johninnl.eclipse.auto.data.Model;
import nl.johninnl.eclipse.auto.data.Playback;
import nl.johninnl.eclipse.auto.ui.Destination;
import nl.johninnl.eclipse.auto.ui.Pages;

/**
 * The single root page: one SectionedItemTemplate whose first section selects the destination
 * (chips on API 9, a "Browse" row list below) and re-renders this same screen in place. Library is
 * read from the app's local stores; Home and Discover come from the server feed through the
 * catalogue and end (Home) with the live stations and the Radio categories.
 */
public final class RootScreen extends BaseScreen implements Pages.RootActions {
    private Destination selected = Destination.HOME;

    public RootScreen(CarContext context, Host host) {
        super(context, host);
        getLifecycle().addObserver(new DefaultLifecycleObserver() {
            /** Coming back from a pushed screen refreshes a stale feed while the cached one stays on screen. */
            @Override public void onResume(LifecycleOwner owner) { refreshSelected(false); }
        });
    }

    private void refreshSelected(boolean force) {
        if (selected == Destination.HOME) {
            host.catalog().requestHome(force);
            host.catalog().requestRadio();
        } else if (selected == Destination.DISCOVER) {
            host.catalog().requestDiscover(force);
        }
    }

    @Override public Template onGetTemplate() {
        LibraryStore.View library = null;
        HomeView feed = null;
        if (selected == Destination.LIBRARY) {
            library = host.library().view();
        } else if (selected == Destination.HOME) {
            feed = host.homeBuilder().home(host.catalog().home(), host.catalog().layout(), host.catalog().liveStations());
        } else {
            feed = host.homeBuilder().discover(host.catalog().discover());
        }
        return Pages.root(host.env(), new Pages.RootModel(selected, host.hasUpcoming(), library, feed), this);
    }

    /** Tapping the selected destination again returns to Home. */
    @Override public void select(Destination destination) {
        if (!onTop()) return;
        Destination next = destination == selected ? Destination.HOME : destination;
        if (next == selected) return;
        selected = next;
        refreshSelected(false);
        invalidate();
    }

    @Override public void search() {
        if (onTop()) host.showSearch(this);
    }

    @Override public void upNext() {
        if (onTop()) host.showQueue();
    }

    @Override public void open(Model.Tile tile) {
        if (onTop()) host.open(this, tile.opener.open());
    }

    @Override public void playTracks(List<Model.Track> tracks, int index, Object origin) {
        if (!onTop()) return;
        boolean lookup = index >= 0 && index < tracks.size() && tracks.get(index).history != null;
        Playback.tap(host.app(), tracks, index, origin, lookup ? new Async<Boolean>() {
            @Override public void done(Boolean found, Throwable failure) {
                if (Boolean.TRUE.equals(found)) host.showPlayer();
                else host.toast("Couldn't find that song");
            }
        } : null);
        if (!lookup) host.showPlayer();
    }

    @Override public void shuffleTracks(List<Model.Track> tracks, Object origin) {
        if (!onTop()) return;
        Playback.shuffle(host.app(), tracks, origin);
        host.showPlayer();
    }

    @Override public void tuneStation(Model.LiveStation station) {
        if (!onTop()) return;
        host.app().tuneLiveStation(station.id);
        host.showPlayer();
    }

    @Override public void playTile(Model.Tile tile) {
        if (!onTop() || tile.playLoader == null) return;
        tile.playLoader.load(new Model.LoadCallback() {
            @Override public void loaded(Model.Collection collection) {
                Playback.play(host.app(), collection.tracks, 0, collection.origin);
                host.showPlayer();
            }

            @Override public void failed() { host.toast("Couldn't load the top songs"); }
        });
    }

    /** Same as the phone's Umbra card: nothing happens while the DJ already plays (the car opens the player instead). */
    @Override public void startDj() {
        if (!onTop()) return;
        if (!host.app().djLive()) host.app().startDj();
        host.showPlayer();
    }

    @Override public void stopDj() {
        if (!onTop()) return;
        host.app().stopDj();
        invalidate();
    }

    @Override public void showPlayer() {
        if (onTop()) host.showPlayer();
    }

    @Override public void retry() {
        if (!onTop()) return;
        refreshSelected(true);
        invalidate();
    }
}
