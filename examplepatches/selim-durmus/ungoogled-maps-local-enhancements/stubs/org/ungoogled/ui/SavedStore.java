package org.ungoogled.ui;
final class SavedStore {
    static class Place {
        double lat, lng;
        String name, ftid;
        String note = "", category = "";
        final java.util.Set<String> lists = new java.util.LinkedHashSet<>();
        boolean located() { return lat != 0 || lng != 0; }
    }
    static Place home, work;
    static final java.util.Map<String,Place> labels = new java.util.LinkedHashMap<>();
    static final java.util.Map<String,String> lists = new java.util.LinkedHashMap<>();
    static final java.util.Map<String,Place> places = new java.util.LinkedHashMap<>();
    static synchronized void load(android.content.Context c) {}
    static synchronized Place labelled(String label) { return null; }
}
