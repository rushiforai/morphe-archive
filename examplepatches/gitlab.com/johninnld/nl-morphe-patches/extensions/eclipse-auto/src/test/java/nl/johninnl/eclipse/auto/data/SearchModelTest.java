package nl.johninnl.eclipse.auto.data;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.junit.Test;

public class SearchModelTest {
    private static final class Scheduled implements SearchModel.Cancellable {
        final Runnable task;
        final long delay;
        boolean cancelled;

        Scheduled(Runnable task, long delay) {
            this.task = task;
            this.delay = delay;
        }

        @Override public void cancel() { cancelled = true; }
    }

    private final List<Scheduled> scheduled = new ArrayList<>();
    private final List<String> queries = new ArrayList<>();
    private final List<Async<List<Model.SearchResult>>> answers = new ArrayList<>();
    private int changes;
    private final SearchModel<List<Model.SearchResult>> model = new SearchModel<List<Model.SearchResult>>(
        new SearchModel.Backend<List<Model.SearchResult>>() {
            @Override public void search(String query, Async<List<Model.SearchResult>> done) {
                queries.add(query);
                answers.add(done);
            }
        }, new SearchModel.Scheduler() {
            @Override public SearchModel.Cancellable postDelayed(Runnable task, long delayMs) {
                Scheduled entry = new Scheduled(task, delayMs);
                scheduled.add(entry);
                return entry;
            }
        }, new Runnable() { @Override public void run() { changes++; } }, Collections.<Model.SearchResult>emptyList());

    private static Model.SearchResult result(String title) { return new Model.SearchResult(new Object(), "library::" + title, title, "", null, false); }

    private void fire(int index) { if (!scheduled.get(index).cancelled) scheduled.get(index).task.run(); }

    @Test public void typingWaitsThreeHundredFiftyMillisecondsAndOnlyTheLastTextSearches() {
        model.onTextChanged("a");
        model.onTextChanged("ab");
        model.onTextChanged("abc");
        assertEquals(350, scheduled.get(0).delay);
        assertTrue("every earlier timer is cancelled", scheduled.get(0).cancelled && scheduled.get(1).cancelled);
        assertTrue(queries.isEmpty());
        fire(0);
        fire(1);
        assertTrue("cancelled timers do nothing", queries.isEmpty());
        fire(2);
        assertEquals(Arrays.asList("abc"), queries);
        assertTrue(model.loading());
    }

    @Test public void anAnswerToAnOlderQueryIsDropped() {
        model.onTextChanged("old");
        fire(0);
        model.onTextChanged("new");
        fire(1);
        assertEquals(Arrays.asList("old", "new"), queries);
        answers.get(0).done(Arrays.asList(result("stale")), null);
        assertTrue("the old answer must not show", model.results().isEmpty());
        assertTrue(model.loading());
        answers.get(1).done(Arrays.asList(result("fresh")), null);
        assertEquals(1, model.results().size());
        assertEquals("fresh", model.results().get(0).title);
        assertFalse(model.loading());
    }

    @Test public void typingWhileASearchIsRunningFencesItsAnswer() {
        model.onTextChanged("first");
        fire(0);
        model.onTextChanged("second");
        answers.get(0).done(Arrays.asList(result("first result")), null);
        assertTrue(model.results().isEmpty());
    }

    @Test public void submitSearchesAtOnceWithoutTheDebounce() {
        model.onTextChanged("jazz");
        model.onSubmitted("jazz");
        assertEquals(Arrays.asList("jazz"), queries);
        assertTrue(scheduled.get(0).cancelled);
    }

    @Test public void aBlankQueryClearsTheResultsAndNeverSearches() {
        model.onTextChanged("jazz");
        fire(0);
        answers.get(0).done(Arrays.asList(result("x")), null);
        model.onTextChanged("   ");
        assertTrue(model.results().isEmpty());
        assertFalse(model.loading());
        model.onSubmitted("");
        assertEquals(1, queries.size());
    }

    @Test public void aFailureShowsAsFailedWithNoResults() {
        model.onSubmitted("jazz");
        answers.get(0).done(null, new java.io.IOException("offline"));
        assertTrue(model.failed());
        assertEquals(Collections.<Model.SearchResult>emptyList(), model.results());
        assertFalse(model.loading());
    }

    @Test public void nothingArrivesAfterClose() {
        model.onSubmitted("jazz");
        int before = changes;
        model.close();
        answers.get(0).done(Arrays.asList(result("late")), null);
        assertEquals(before, changes);
        assertTrue(model.results().isEmpty());
        model.onTextChanged("again");
        assertTrue("a closed model schedules nothing", scheduled.isEmpty());
    }

    @Test public void refreshAsksAgainWithTheSameTextAndDropsTheAnswerInFlight() {
        model.onSubmitted("jazz");
        model.refresh();
        assertEquals(Arrays.asList("jazz", "jazz"), queries);
        answers.get(0).done(Arrays.asList(result("stale")), null);
        assertTrue("the first answer belongs to the old request", model.results().isEmpty());
        answers.get(1).done(Arrays.asList(result("fresh")), null);
        assertEquals(1, model.results().size());
        model.onTextChanged("");
        model.refresh();
        assertEquals("nothing to ask again for a blank query", 2, queries.size());
    }

    @Test public void theSameTextRepeatedByTheHostDoesNotRestartTheSearch() {
        model.onTextChanged("jazz");
        model.onTextChanged("jazz");
        assertEquals(1, scheduled.size());
    }
}
