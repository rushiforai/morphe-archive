package nl.johninnl.eclipse.auto.screens;

import androidx.car.app.CarContext;
import androidx.car.app.model.Template;
import androidx.lifecycle.DefaultLifecycleObserver;
import androidx.lifecycle.LifecycleOwner;
import nl.johninnl.eclipse.auto.data.Async;
import nl.johninnl.eclipse.auto.data.Model;
import nl.johninnl.eclipse.auto.data.Playback;
import nl.johninnl.eclipse.auto.ui.Pages;

/**
 * An album, artist, playlist, facet list, feed card or radio category. Tapping a song plays the
 * collection from that song under the collection's own origin, exactly like the phone. A collection
 * that has to be fetched shows a spinner meanwhile; its result is fenced by a revision and dropped
 * once the screen is destroyed.
 */
public final class CollectionScreen extends BaseScreen implements Pages.CollectionActions {
    private Model.Collection collection;
    private final Model.Loader loader;
    private boolean loading;
    private boolean failed;
    private boolean destroyed;
    private int revision;

    public CollectionScreen(CarContext context, Host host, Model.Collection collection) {
        super(context, host);
        this.collection = collection;
        this.loader = collection.loader;
        this.loading = loader != null;
        getLifecycle().addObserver(new DefaultLifecycleObserver() {
            @Override public void onCreate(LifecycleOwner owner) { if (loader != null) fetch(); }

            @Override public void onDestroy(LifecycleOwner owner) {
                destroyed = true;
                revision++;
            }
        });
    }

    private void fetch() {
        loading = true;
        failed = false;
        final int mine = ++revision;
        loader.load(new Model.LoadCallback() {
            @Override public void loaded(Model.Collection result) {
                if (destroyed || mine != revision) return;
                collection = result;
                loading = false;
                invalidate();
            }

            @Override public void failed() {
                if (destroyed || mine != revision) return;
                loading = false;
                failed = true;
                invalidate();
            }
        });
    }

    @Override public Template onGetTemplate() {
        if (loading) return Pages.collectionLoading(host.env(), collection.title);
        if (failed) return Pages.collectionFailed(host.env(), collection.title, this::retry);
        return Pages.collection(host.env(), collection, host.hasUpcoming(), !host.app().liveStationTuned(), this);
    }

    @Override public void retry() {
        if (!onTop() || loader == null) return;
        fetch();
        invalidate();
    }

    @Override public void play(int index) {
        if (!onTop()) return;
        boolean lookup = index >= 0 && index < collection.tracks.size() && collection.tracks.get(index).history != null;
        Playback.tap(host.app(), collection.tracks, index, collection.origin, lookup ? new Async<Boolean>() {
            @Override public void done(Boolean found, Throwable failure) {
                if (Boolean.TRUE.equals(found)) host.showPlayer();
                else host.toast("Couldn't find that song");
            }
        } : null);
        if (!lookup) host.showPlayer();
    }

    @Override public void playAll() { play(0); }

    @Override public void shuffle() {
        if (!onTop()) return;
        Playback.shuffle(host.app(), collection.tracks, collection.origin);
        host.showPlayer();
    }

    @Override public void addToUpNext() {
        if (!onTop()) return;
        int added = Playback.addToUpNext(host.app(), collection.tracks);
        host.toast(added == 1 ? "Added 1 song to Up Next" : "Added " + added + " songs to Up Next");
        invalidate();
    }

    @Override public void upNext() {
        if (onTop()) host.showQueue();
    }

    @Override public void search() {
        if (onTop()) host.showSearch(this);
    }

    @Override public void open(Model.Tile tile) {
        if (onTop()) host.open(this, tile.opener.open());
    }

    @Override public void startStation(Model.Station station) {
        if (!onTop()) return;
        host.app().startStation(station);
        host.showPlayer();
    }
}
