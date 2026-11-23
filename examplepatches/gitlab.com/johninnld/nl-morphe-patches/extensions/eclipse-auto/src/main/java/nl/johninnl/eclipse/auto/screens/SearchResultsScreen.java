package nl.johninnl.eclipse.auto.screens;

import androidx.car.app.CarContext;
import androidx.car.app.model.Template;
import androidx.lifecycle.DefaultLifecycleObserver;
import androidx.lifecycle.LifecycleOwner;
import nl.johninnl.eclipse.auto.data.ProviderSearch;
import nl.johninnl.eclipse.auto.ui.Pages;

/**
 * Below API 9 a SearchTemplate cannot hold sections, so a submitted query opens this page: the same
 * search, shown as Tracks, Albums, Artists and Playlists under their titles with the type filter on top.
 * It shares the search page's model, so a later answer or a provider pick shows here too.
 */
final class SearchResultsScreen extends BaseScreen {
    private final ProviderSearch search;
    private final Pages.SearchActions actions;
    private final Runnable changed = new Runnable() {
        @Override public void run() { invalidate(); }
    };

    SearchResultsScreen(CarContext context, Host host, ProviderSearch search) {
        super(context, host);
        this.search = search;
        this.actions = new SearchActionsImpl(this, host, search);
        search.addListener(changed);
        getLifecycle().addObserver(new DefaultLifecycleObserver() {
            @Override public void onDestroy(LifecycleOwner owner) { SearchResultsScreen.this.search.removeListener(changed); }
        });
    }

    @Override public Template onGetTemplate() {
        return Pages.searchResults(host.env(), SearchActionsImpl.stateOf(host, search), actions);
    }
}
