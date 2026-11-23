package nl.johninnl.eclipse.auto.screens;

import android.os.Handler;
import android.os.Looper;
import androidx.car.app.CarContext;
import androidx.car.app.constraints.ConstraintManager;
import androidx.car.app.model.Template;
import androidx.lifecycle.DefaultLifecycleObserver;
import androidx.lifecycle.LifecycleOwner;
import nl.johninnl.eclipse.auto.data.Model;
import nl.johninnl.eclipse.auto.data.ProviderSearch;
import nl.johninnl.eclipse.auto.data.SearchModel;
import nl.johninnl.eclipse.auto.ui.Navigator;
import nl.johninnl.eclipse.auto.ui.Pages;

/**
 * Search the way the phone does: the selected provider (an installed addon, the phone's own pick)
 * answers with songs, albums, artists and playlists, filtered by type; when no provider can answer,
 * the app's own library search does, labelled "From your library". Results appear 350 ms after typing
 * pauses and at once on submit; a late answer to an older query is dropped, and nothing arrives after
 * the screen is gone. On API 9 the sections are on this page; below that, a submit also opens the
 * sectioned {@link SearchResultsScreen}.
 */
public final class SearchScreen extends BaseScreen implements Pages.SearchActions {
    private final Handler main = new Handler(Looper.getMainLooper());
    private final ProviderSearch search;
    private final SearchActionsImpl actions;

    public SearchScreen(CarContext context, Host host) {
        super(context, host);
        search = new ProviderSearch(host.app(), new SearchModel.Scheduler() {
            @Override public SearchModel.Cancellable postDelayed(Runnable task, long delayMs) {
                final Runnable posted = task;
                main.postDelayed(posted, delayMs);
                return new SearchModel.Cancellable() {
                    @Override public void cancel() { main.removeCallbacks(posted); }
                };
            }
        });
        actions = new SearchActionsImpl(this, host, search);
        search.addListener(new Runnable() { @Override public void run() { invalidate(); } });
        getLifecycle().addObserver(new DefaultLifecycleObserver() {
            @Override public void onDestroy(LifecycleOwner owner) { search.close(); }
        });
    }

    @Override public Template onGetTemplate() {
        int limit = Math.max(1, getCarContext().getCarService(ConstraintManager.class)
            .getContentLimit(ConstraintManager.CONTENT_LIMIT_TYPE_LIST));
        return Pages.search(host.env(), SearchActionsImpl.stateOf(host, search), limit, this);
    }

    @Override public void textChanged(String text) { actions.textChanged(text); }

    @Override public void submitted(String text) {
        actions.submitted(text);
        if (!host.env().api9() && text != null && !text.trim().isEmpty() && onTop()) {
            Navigator.push(getScreenManager(), new SearchResultsScreen(getCarContext(), host, search));
        }
    }

    @Override public void open(Model.SearchResult result) { actions.open(result); }

    @Override public void playTrack(int index) { actions.playTrack(index); }

    @Override public void openTile(Model.Tile tile) { actions.openTile(tile); }

    @Override public void filter(ProviderSearch.Filter filter) { actions.filter(filter); }

    @Override public void pickProvider() { actions.pickProvider(); }
}
