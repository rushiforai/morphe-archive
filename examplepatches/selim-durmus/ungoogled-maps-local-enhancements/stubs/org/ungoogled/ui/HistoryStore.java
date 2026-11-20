package org.ungoogled.ui;
final class HistoryStore {
    static final class Entry {
        String ftid, name;
        String category = "";
        double lat, lng;
    }
    static boolean enabled(android.content.Context c) { return false; }
    static synchronized void load(android.content.Context c) {}
    static synchronized java.util.List<Entry> newestFirst() { return null; }
}
