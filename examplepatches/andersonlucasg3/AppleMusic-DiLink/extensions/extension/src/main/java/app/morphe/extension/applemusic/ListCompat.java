package app.morphe.extension.applemusic;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * API 29 replacement for {@link List#of} (API 30).
 *
 * <p>Semantics: both helpers return an immutable, random-access list, like {@code List.of}.
 * {@code Collections.singletonList} / {@code Collections.unmodifiableList} accept null
 * elements where {@code List.of} throws NPE; the app never passes null (the only call site
 * used by the playback path is a non-null string), so the difference is not observable.
 */
public final class ListCompat {

    private ListCompat() {
    }

    public static <T> List<T> of(T element) {
        return Collections.singletonList(element);
    }

    public static <T> List<T> of(T first, T second) {
        List<T> list = new ArrayList<>(2);
        list.add(first);
        list.add(second);
        return Collections.unmodifiableList(list);
    }
}
