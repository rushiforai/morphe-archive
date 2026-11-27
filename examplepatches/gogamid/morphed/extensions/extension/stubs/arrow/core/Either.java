package arrow.core;

/** Compile-only projection of the result returned by Rossmann's activate action. */
public abstract class Either {
    public static final class Right extends Either {
        public final Object a = null;
    }
}
