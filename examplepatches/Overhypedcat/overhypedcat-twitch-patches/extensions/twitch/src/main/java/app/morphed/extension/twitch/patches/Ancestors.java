package app.morphed.extension.twitch.patches;

import java.util.function.Function;
import java.util.function.Predicate;

/** Walks up a parent chain (views, in practice) looking for an ancestor that matches. */
final class Ancestors {
    /** Deep view trees have a few dozen levels; this only guards against a parent loop. */
    private static final int MAX_DEPTH = 200;

    private Ancestors() {
    }

    /** Whether any ancestor of {@code start} (not {@code start} itself) matches {@code test}. */
    static <T> boolean any(T start, Function<T, T> parentOf, Predicate<T> test) {
        T current = start == null ? null : parentOf.apply(start);
        for (int depth = 0; current != null && depth < MAX_DEPTH; depth++) {
            if (test.test(current)) return true;
            current = parentOf.apply(current);
        }
        return false;
    }
}
