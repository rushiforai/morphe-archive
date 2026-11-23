package nl.johninnl.eclipse.auto.data;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import org.junit.Test;

/** The car's search against fakes: which provider answers, the phone's selection, filters, fallback and stale answers. */
public class ProviderSearchTest {
    private final FakeApp app = new FakeApp();
    private final List<Runnable> scheduled = new ArrayList<>();
    private int changes;
    private final ProviderSearch search = new ProviderSearch(app, new SearchModel.Scheduler() {
        @Override public SearchModel.Cancellable postDelayed(final Runnable task, long delayMs) {
            scheduled.add(task);
            return new SearchModel.Cancellable() { @Override public void cancel() { scheduled.remove(task); } };
        }
    });

    {
        search.addListener(new Runnable() { @Override public void run() { changes++; } });
    }

    private static Model.SearchProvider provider(String id, String name) { return new Model.SearchProvider(id, name); }

    private static Model.SearchHit hit(Model.SearchHit.Kind kind, String provider, String id, String title, String subtitle) {
        return new Model.SearchHit(kind, provider, id, title, subtitle, "https://art/" + id);
    }

    /** A provider's answer: two songs, an album, an artist and a playlist. */
    private static Model.Found answer(String provider) {
        return Model.Found.ofProvider(FakeApp.tracks(provider + " song 1", provider + " song 2"),
            Arrays.asList(hit(Model.SearchHit.Kind.ALBUM, provider, "al1", provider + " album", "An Artist")),
            Arrays.asList(hit(Model.SearchHit.Kind.ARTIST, provider, "ar1", provider + " artist", "")),
            Arrays.asList(hit(Model.SearchHit.Kind.PLAYLIST, provider, "pl1", provider + " playlist", "A Creator")));
    }

    private void twoProviders() {
        app.providers = Arrays.asList(provider("provider-a", "Provider A"), provider("provider-b", "Provider B"));
        app.providerAnswers.put("provider-a", answer("provider-a"));
        app.providerAnswers.put("provider-b", answer("provider-b"));
    }

    // ---- which provider --------------------------------------------------------------------------

    @Test public void theProviderIsTheOneThePhoneHasSelectedWhenItCanSearchElseTheFirst() {
        assertNull("no provider installed", search.active());
        twoProviders();
        assertEquals("nothing stored: the first", "provider-a", search.active().id);
        app.selectedProvider = "provider-b";
        assertEquals("the phone's own selection", "provider-b", search.active().id);
        assertEquals("Provider B", search.active().name);
        app.selectedProvider = "uninstalled";
        assertEquals("a stored addon that cannot search any more: the first", "provider-a", search.active().id);
    }

    @Test public void aProviderWithoutANameIsCalledByItsId() {
        assertEquals("provider-a", provider("provider-a", "  ").name);
        assertEquals("provider-a", provider("provider-a", null).name);
    }

    @Test public void pickingAProviderStoresItAsThePhoneDoesAndAsksTheSameQueryAgain() {
        twoProviders();
        search.onSubmitted("sample query");
        assertEquals(Arrays.asList("searchProvider provider-a sample query"), app.calls);
        assertEquals("provider-a album", search.found().albums.get(0).title);
        search.select("provider-b");
        assertEquals("the phone follows", "provider-b", app.selectedProvider);
        assertEquals(Arrays.asList("searchProvider provider-a sample query", "selectSearchProvider provider-b", "searchProvider provider-b sample query"),
            app.calls);
        assertEquals("provider-b album", search.found().albums.get(0).title);
    }

    @Test public void pickingSomethingThatIsNotAProviderDoesNothing() {
        twoProviders();
        search.select("spotify");
        assertTrue(app.calls.isEmpty());
        assertNull(app.selectedProvider);
    }

    @Test public void aSlowAnswerFromThePreviousProviderIsDropped() {
        twoProviders();
        app.holdProviderAnswers = true;
        search.onSubmitted("sample query");
        search.select("provider-b");
        assertEquals(2, app.heldAnswers.size());
        // The old provider answers last, after the new one was asked: it must not show.
        app.heldAnswers.get(1).run();
        assertEquals("provider-b album", search.found().albums.get(0).title);
        app.heldAnswers.get(0).run();
        assertEquals("provider-b album", search.found().albums.get(0).title);
        assertFalse(search.loading());
    }

    @Test public void aNewerQueryDropsTheAnswerToAnOlderOne() {
        twoProviders();
        app.holdProviderAnswers = true;
        search.onSubmitted("first");
        search.onSubmitted("second");
        app.providerAnswers.put("provider-a", Model.Found.ofProvider(FakeApp.tracks("late"), new ArrayList<Model.SearchHit>(),
            new ArrayList<Model.SearchHit>(), new ArrayList<Model.SearchHit>()));
        app.heldAnswers.get(0).run();
        assertTrue("the old query's answer is not shown", search.found().isEmpty());
        assertTrue(search.loading());
        app.heldAnswers.get(1).run();
        assertEquals("late", search.found().tracks.get(0).title);
    }

    // ---- the answer --------------------------------------------------------------------------------

    @Test public void theAnswerHoldsAllFourTypesInTheProvidersOrder() {
        twoProviders();
        search.onSubmitted("sample query");
        Model.Found found = search.found();
        assertFalse(found.fromLibrary());
        assertEquals(Arrays.asList("provider-a song 1", "provider-a song 2"), titles(found.tracks));
        assertEquals(Model.SearchHit.Kind.ALBUM, found.albums.get(0).kind);
        assertEquals("An Artist", found.albums.get(0).subtitle);
        assertEquals(Model.SearchHit.Kind.ARTIST, found.artists.get(0).kind);
        assertEquals(Model.SearchHit.Kind.PLAYLIST, found.playlists.get(0).kind);
        assertEquals("provider-a", found.albums.get(0).providerId);
        assertFalse(found.isEmpty());
    }

    private static List<String> titles(List<Model.Track> tracks) {
        List<String> titles = new ArrayList<>();
        for (Model.Track track : tracks) titles.add(track.title);
        return titles;
    }

    @Test public void aTypeWithNothingFoundIsSimplyEmpty() {
        app.providers = Arrays.asList(provider("provider-a", "Provider A"));
        app.providerAnswers.put("provider-a", Model.Found.ofProvider(FakeApp.tracks("only song"), new ArrayList<Model.SearchHit>(),
            new ArrayList<Model.SearchHit>(), new ArrayList<Model.SearchHit>()));
        search.onSubmitted("x");
        assertEquals(1, search.found().tracks.size());
        assertTrue(search.found().albums.isEmpty() && search.found().artists.isEmpty() && search.found().playlists.isEmpty());
        assertFalse(search.failed());
    }

    @Test public void theFilterNarrowsTheShownTypeWithoutAskingAgain() {
        twoProviders();
        search.onSubmitted("sample query");
        int asked = app.calls.size();
        int before = changes;
        assertEquals(ProviderSearch.Filter.ALL, search.filter());
        search.setFilter(ProviderSearch.Filter.ALBUMS);
        assertEquals(ProviderSearch.Filter.ALBUMS, search.filter());
        assertEquals("no new request", asked, app.calls.size());
        assertTrue("the page is told to redraw", changes > before);
        int again = changes;
        search.setFilter(ProviderSearch.Filter.ALBUMS);
        assertEquals("the same filter is not a change", again, changes);
        assertEquals(Arrays.asList("All", "Tracks", "Albums", "Artists", "Playlists"), filterLabels());
    }

    private static List<String> filterLabels() {
        List<String> labels = new ArrayList<>();
        for (ProviderSearch.Filter filter : ProviderSearch.Filter.values()) labels.add(filter.label);
        return labels;
    }

    // ---- fallback to the library ---------------------------------------------------------------------

    @Test public void withoutAnyProviderTheLibraryAnswersAndSaysSo() {
        app.searchResults = Arrays.asList(new Model.SearchResult(new Object(), "library::1", "Local song", "Artist", null, false));
        search.onSubmitted("local");
        assertTrue(search.found().fromLibrary());
        assertEquals(ProviderSearch.NO_PROVIDER, search.found().note);
        assertEquals(1, search.found().library.size());
        assertEquals(Arrays.asList("search local"), app.calls);
    }

    @Test public void aProviderThatFailsFallsBackToTheLibraryLabelled() {
        twoProviders();
        app.providerFailures.put("provider-a", new java.io.IOException("offline"));
        app.searchResults = Arrays.asList(new Model.SearchResult(new Object(), "library::1", "Local song", "Artist", null, false));
        search.onSubmitted("local");
        assertTrue(search.found().fromLibrary());
        assertEquals(ProviderSearch.PROVIDER_FAILED, search.found().note);
        assertEquals(Arrays.asList("searchProvider provider-a local", "search local"), app.calls);
        assertFalse("a fallback answer is not a failure", search.failed());
    }

    @Test public void whenTheLibraryCannotAnswerEitherTheSearchHasFailed() {
        twoProviders();
        app.providerFailures.put("provider-a", new java.io.IOException("offline"));
        app.searchFailure = new java.io.IOException("no library search");
        search.onSubmitted("x");
        assertTrue(search.failed());
        assertTrue(search.found().isEmpty());
        assertFalse(search.loading());
    }

    @Test public void aProviderAnswerWithNothingInItIsNotAFailureAndDoesNotFallBack() {
        twoProviders();
        app.providerAnswers.put("provider-a", Model.Found.ofProvider(new ArrayList<Model.Track>(), new ArrayList<Model.SearchHit>(),
            new ArrayList<Model.SearchHit>(), new ArrayList<Model.SearchHit>()));
        search.onSubmitted("zzzz");
        assertFalse(search.found().fromLibrary());
        assertTrue(search.found().isEmpty());
        assertEquals(Arrays.asList("searchProvider provider-a zzzz"), app.calls);
    }

    // ---- typing --------------------------------------------------------------------------------------

    @Test public void typingIsDebouncedAndABlankQueryNeverAsks() {
        twoProviders();
        search.onTextChanged("ne");
        search.onTextChanged("sample query");
        assertEquals("only the last timer is left", 1, scheduled.size());
        assertTrue(app.calls.isEmpty());
        scheduled.get(0).run();
        assertEquals(Arrays.asList("searchProvider provider-a sample query"), app.calls);
        search.onTextChanged("   ");
        assertTrue(search.found().isEmpty());
        assertEquals(1, app.calls.size());
    }

    @Test public void nothingArrivesAfterTheSearchIsClosed() {
        twoProviders();
        app.holdProviderAnswers = true;
        search.onSubmitted("x");
        search.close();
        int before = changes;
        app.heldAnswers.get(0).run();
        assertEquals(before, changes);
        assertNotNull(search.found());
        assertTrue(search.found().isEmpty());
    }
}
