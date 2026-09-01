package j$.util;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class Spliterators {
    public static final l1 a = new l1();
    public static final j1 b = new j1();
    public static final k1 c = new k1();
    public static final i1 d = new i1();

    public static void a(int i, int i2, int i3) {
        if (i2 <= i3) {
            if (i2 < 0) {
                throw new ArrayIndexOutOfBoundsException(i2);
            }
            if (i3 > i) {
                throw new ArrayIndexOutOfBoundsException(i3);
            }
            return;
        }
        throw new ArrayIndexOutOfBoundsException("origin(" + i2 + ") > fence(" + i3 + ")");
    }

    public static <T> Spliterator<T> spliterator(java.util.Collection<? extends T> collection, int i) {
        return new n1((java.util.Collection) Objects.requireNonNull(collection), i);
    }
}
