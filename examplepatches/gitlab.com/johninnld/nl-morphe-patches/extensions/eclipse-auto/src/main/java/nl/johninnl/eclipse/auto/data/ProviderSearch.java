package nl.johninnl.eclipse.auto.data;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * The car's search, built like the phone's Search screen: one provider (an installed addon) answers,
 * its songs, albums, artists and playlists are sectioned, and a filter narrows them to one type
 * without asking again. The provider is the phone's own selection, so the car starts where the phone
 * is and a pick in the car is what the phone shows next. When no provider can answer (none installed,
 * or the one asked fails) the app's own library search answers instead and is labelled as such.
 * Typing is debounced and a late answer to an older request is dropped ({@link SearchModel}).
 */
public final class ProviderSearch {
    /** Which type of result is shown. */
    public enum Filter {
        ALL("All"), TRACKS("Tracks"), ALBUMS("Albums"), ARTISTS("Artists"), PLAYLISTS("Playlists");

        public final String label;

        Filter(String label) { this.label = label; }
    }

    /** What the library fallback says when no provider is installed. */
    public static final String NO_PROVIDER = "No search provider is set up";
    /** What it says when the provider could not answer. */
    public static final String PROVIDER_FAILED = "The search provider could not answer";

    private final AppPort app;
    private final SearchModel<Model.Found> model;
    private final List<Runnable> listeners = new ArrayList<>();
    private Filter filter = Filter.ALL;

    public ProviderSearch(AppPort app, SearchModel.Scheduler scheduler) {
        this.app = app;
        this.model = new SearchModel<Model.Found>(new SearchModel.Backend<Model.Found>() {
            @Override public void search(String query, Async<Model.Found> done) { ProviderSearch.this.search(query, done); }
        }, scheduler, new Runnable() {
            @Override public void run() { changed(); }
        }, Model.Found.NONE);
    }

    // ---- listeners ----------------------------------------------------------------------------

    public void addListener(Runnable listener) { listeners.add(listener); }

    public void removeListener(Runnable listener) { listeners.remove(listener); }

    private void changed() {
        for (Runnable listener : new ArrayList<>(listeners)) listener.run();
    }

    // ---- providers ----------------------------------------------------------------------------

    public List<Model.SearchProvider> providers() { return app.searchProviders(); }

    /** The phone's selection when it is one of the providers, else the first provider; null when there are none. */
    public Model.SearchProvider active() {
        List<Model.SearchProvider> providers = providers();
        if (providers.isEmpty()) return null;
        String saved = app.selectedSearchProvider();
        if (saved != null) for (Model.SearchProvider provider : providers) if (provider.id.equals(saved)) return provider;
        return providers.get(0);
    }

    /** Picks a provider (stored the way the phone stores its own pick) and asks it the current query again. */
    public void select(String providerId) {
        for (Model.SearchProvider provider : providers()) {
            if (provider.id.equals(providerId)) {
                app.selectSearchProvider(providerId);
                model.refresh();
                changed();
                return;
            }
        }
    }

    // ---- state --------------------------------------------------------------------------------

    public String query() { return model.query(); }

    public boolean loading() { return model.loading(); }

    public boolean failed() { return model.failed(); }

    public Model.Found found() { return model.results(); }

    public Filter filter() { return filter; }

    /** Narrows the shown answer to one type; nothing is asked again. */
    public void setFilter(Filter next) {
        if (next == null || next == filter) return;
        filter = next;
        changed();
    }

    // ---- input --------------------------------------------------------------------------------

    public void onTextChanged(String text) { model.onTextChanged(text); }

    public void onSubmitted(String text) { model.onSubmitted(text); }

    public void close() {
        model.close();
        listeners.clear();
    }

    // ---- the request --------------------------------------------------------------------------

    private void search(final String query, final Async<Model.Found> done) {
        Model.SearchProvider provider = active();
        if (provider == null) {
            fallback(query, NO_PROVIDER, done);
            return;
        }
        app.searchProvider(provider.id, query, new Async<Model.Found>() {
            @Override public void done(Model.Found found, Throwable failure) {
                if (failure == null && found != null) done.done(found, null);
                else fallback(query, PROVIDER_FAILED, done);
            }
        });
    }

    /** The app's own library search, labelled as such: it is the only thing left to show. */
    private void fallback(String query, final String note, final Async<Model.Found> done) {
        app.search(query, new Async<List<Model.SearchResult>>() {
            @Override public void done(List<Model.SearchResult> results, Throwable failure) {
                if (results != null && failure == null) done.done(Model.Found.ofLibrary(results, note), null);
                else done.done(null, failure != null ? failure : new IOException("Search failed"));
            }
        });
    }
}
