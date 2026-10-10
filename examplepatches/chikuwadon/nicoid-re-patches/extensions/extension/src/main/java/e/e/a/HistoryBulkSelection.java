package e.e.a;

/** Compatibility entry point for account history selection. */
public final class HistoryBulkSelection {
    private HistoryBulkSelection() { }
    public static void show(Object fragment, int position) { BulkSelection.enter(fragment, position); }
}
