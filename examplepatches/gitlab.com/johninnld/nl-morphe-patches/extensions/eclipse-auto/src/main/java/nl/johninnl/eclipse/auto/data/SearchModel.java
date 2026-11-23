package nl.johninnl.eclipse.auto.data;

/**
 * The search page's logic: a 350 ms debounce on typing, an immediate search on submit, and a
 * revision that fences results so only the newest query can show them (an older query that
 * answers late is dropped, and so is anything that arrives after {@link #close()}). Pure logic:
 * time and the backend are injected, so it needs no Android. {@code R} is what one answer holds.
 */
public final class SearchModel<R> {
    public static final long DEBOUNCE_MS = 350;

    /** Runs a search; the callback arrives on the main thread. */
    public interface Backend<R> {
        void search(String query, Async<R> done);
    }

    /** Schedules a task on the main thread after a delay and can cancel it. */
    public interface Scheduler {
        Cancellable postDelayed(Runnable task, long delayMs);
    }

    public interface Cancellable {
        void cancel();
    }

    private final Backend<R> backend;
    private final Scheduler scheduler;
    private final Runnable onChange;
    private final R empty;
    private Cancellable pending;
    private int revision;
    private boolean closed;
    private String query = "";
    private boolean loading;
    private boolean failed;
    private R results;

    public SearchModel(Backend<R> backend, Scheduler scheduler, Runnable onChange, R empty) {
        this.backend = backend;
        this.scheduler = scheduler;
        this.onChange = onChange;
        this.empty = empty;
        this.results = empty;
    }

    public String query() { return query; }

    public boolean loading() { return loading; }

    public boolean failed() { return failed; }

    public R results() { return results; }

    /** The text changed: drop what is in flight and search once typing pauses. */
    public void onTextChanged(final String text) {
        if (closed) return;
        String next = text == null ? "" : text;
        if (next.equals(query) && (pending != null || loading)) return;
        query = next;
        final int mine = ++revision;
        cancelPending();
        if (next.trim().isEmpty()) {
            loading = false;
            failed = false;
            results = empty;
            onChange.run();
            return;
        }
        pending = scheduler.postDelayed(new Runnable() {
            @Override public void run() {
                pending = null;
                if (!closed && mine == revision) start(query, mine);
            }
        }, DEBOUNCE_MS);
    }

    /** The driver submitted the query: search now, without waiting for the debounce. */
    public void onSubmitted(String text) {
        if (closed) return;
        String next = text == null ? "" : text;
        if (next.trim().isEmpty()) {
            onTextChanged(next);
            return;
        }
        query = next;
        cancelPending();
        start(next, ++revision);
    }

    /** Ask again with the same text (the provider changed): the answer in flight, if any, is dropped. */
    public void refresh() {
        if (closed || query.trim().isEmpty()) return;
        cancelPending();
        start(query, ++revision);
    }

    /** The page is gone: nothing that arrives later may touch it. */
    public void close() {
        closed = true;
        revision++;
        cancelPending();
    }

    private void cancelPending() {
        if (pending != null) {
            pending.cancel();
            pending = null;
        }
    }

    private void start(String text, final int mine) {
        loading = true;
        failed = false;
        onChange.run();
        backend.search(text, new Async<R>() {
            @Override public void done(R value, Throwable failure) {
                if (closed || mine != revision) return;
                loading = false;
                failed = failure != null || value == null;
                results = failed ? empty : value;
                onChange.run();
            }
        });
    }
}
