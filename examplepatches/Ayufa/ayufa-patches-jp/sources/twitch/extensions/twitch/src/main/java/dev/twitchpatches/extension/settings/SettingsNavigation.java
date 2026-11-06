package dev.twitchpatches.extension.settings;

import java.util.ArrayList;
import java.util.List;

final class SettingsNavigation {
    private final List<String> routes = new ArrayList<>();
    private final List<Integer> offsets = new ArrayList<>();
    private final List<String> queries = new ArrayList<>();
    private final List<Integer> browseOffsets = new ArrayList<>();

    SettingsNavigation(String initial) { routes.add(initial); offsets.add(0); queries.add(""); browseOffsets.add(0); }

    SettingsNavigation(List<String> routes, List<Integer> offsets) {
        this(routes, offsets, null);
    }

    SettingsNavigation(List<String> routes, List<Integer> offsets, List<String> queries) {
        this(routes, offsets, queries, null);
    }

    SettingsNavigation(List<String> routes, List<Integer> offsets, List<String> queries, List<Integer> browseOffsets) {
        if (routes == null || offsets == null || routes.isEmpty() || routes.size() != offsets.size())
            throw new IllegalArgumentException("Invalid settings navigation.");
        this.routes.addAll(routes);
        this.offsets.addAll(offsets);
        if (queries != null && queries.size() != routes.size()) throw new IllegalArgumentException("Invalid settings search state.");
        if (browseOffsets != null && browseOffsets.size() != routes.size()) throw new IllegalArgumentException("Invalid settings scroll state.");
        for (int index = 0; index < routes.size(); index++) {
            this.queries.add(queries == null || queries.get(index) == null ? "" : queries.get(index));
            this.browseOffsets.add(browseOffsets == null ? offsets.get(index) : browseOffsets.get(index));
        }
    }

    String current() { return routes.get(routes.size() - 1); }
    int scroll() { return offsets.get(offsets.size() - 1); }
    void saveScroll(int value) { offsets.set(offsets.size() - 1, Math.max(0, value)); }
    String query() { return queries.get(queries.size() - 1); }
    void search(String value) { search(value, scroll()); }
    void search(String value, int currentScroll) {
        int index = routes.size() - 1;
        if (query().trim().isEmpty()) browseOffsets.set(index, Math.max(0, currentScroll));
        queries.set(index, value);
        saveScroll(value.trim().isEmpty() ? browseOffsets.get(index) : 0);
    }
    void open(String key, int scroll) { saveScroll(scroll); routes.add(key); offsets.add(0); queries.add(""); browseOffsets.add(0); }
    boolean back() {
        if (routes.size() == 1) return false;
        routes.remove(routes.size() - 1);
        offsets.remove(offsets.size() - 1);
        queries.remove(queries.size() - 1);
        browseOffsets.remove(browseOffsets.size() - 1);
        return true;
    }
    ArrayList<String> routes() { return new ArrayList<>(routes); }
    ArrayList<Integer> offsets() { return new ArrayList<>(offsets); }
    ArrayList<String> queries() { return new ArrayList<>(queries); }
    ArrayList<Integer> browseOffsets() { return new ArrayList<>(browseOffsets); }
}
