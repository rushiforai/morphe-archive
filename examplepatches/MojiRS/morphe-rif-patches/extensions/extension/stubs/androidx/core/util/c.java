package androidx.core.util;

/**
 * COMPILE-ONLY stub of rif's androidx Pair (R8 renamed it to androidx.core.util.c in both
 * builds of 5.6.22; fields a and b, static factory a). Packaged in ../libs/rif-stubs.jar,
 * never bundled: rif provides the real class at runtime.
 */
public class c<F, S> {
    public final F a;
    public final S b;

    public c(F a, S b) {
        this.a = a;
        this.b = b;
    }

    public static <A, B> c<A, B> a(A a, B b) {
        return new c<>(a, b);
    }
}
