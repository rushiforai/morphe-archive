package app.windowshopper.extension.meesho;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

final class LoadedSortCore {
    private LoadedSortCore() {}

    static <T> int sort(List<T> rows, Class<?> cardClass, Field catalogField, Field summaryField,
            Field countField, Field typeField) throws IllegalAccessException {
        List<Integer> positions = new ArrayList<>();
        List<Rated<T>> products = new ArrayList<>();
        for (int i = 0; i < rows.size(); i++) {
            T item = rows.get(i);
            if (!cardClass.isInstance(item)) continue;
            Object catalog = catalogField.get(item);
            Object summary = catalog == null ? null : summaryField.get(catalog);
            Object type = summary == null ? null : typeField.get(summary);
            int count = summary == null || "SUPPLIER".equals(String.valueOf(type))
                ? -1 : Math.max(-1, countField.getInt(summary));
            positions.add(i);
            products.add(new Rated<>(item, count));
        }
        products.sort((left, right) -> Integer.compare(right.count, left.count));
        for (int i = 0; i < products.size(); i++) {
            int position = positions.get(i);
            T item = products.get(i).item;
            if (rows.get(position) != item) rows.set(position, item);
        }
        return products.size();
    }

    private static final class Rated<T> {
        final T item;
        final int count;

        Rated(T item, int count) {
            this.item = item;
            this.count = count;
        }
    }
}
