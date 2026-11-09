package org.ungoogled.ui;

import java.util.ArrayList;
import java.util.List;

/** Filters only the sponsored oneof case from Maps' parsed unified search rows. */
public final class SearchAds {
    private SearchAds() {}
    public static List<?> filter(List<?> rows) {
        return filter(rows, Shapes.HIDE_ADS);
    }
    static List<?> filter(List<?> rows, boolean hide) {
        if (!hide || rows == null) return rows;
        List<Object> kept = new ArrayList<>(rows.size());
        for (Object row : rows) {
            boolean sponsored = false;
            if (row != null) {
                try { sponsored = row.getClass().getField("c").getInt(row) == 5; }
                catch (ReflectiveOperationException | IllegalArgumentException ignored) { }
            }
            if (!sponsored) kept.add(row);
        }
        return kept;
    }
}
