package x3;

/* loaded from: classes.dex */
public final class k {

    /* renamed from: a, reason: collision with root package name */
    public final int f95019a;

    public /* synthetic */ k(int i5) {
        this.f95019a = i5;
    }

    public static final /* synthetic */ k a() {
        return new k(3);
    }

    public static String b(int i5) {
        return i5 == 1 ? "Left" : i5 == 2 ? "Right" : i5 == 3 ? "Center" : i5 == 4 ? "Justify" : i5 == 5 ? "Start" : i5 == 6 ? "End" : i5 == Integer.MIN_VALUE ? "Unspecified" : "Invalid";
    }

    public final boolean equals(Object obj) {
        if (obj instanceof k) {
            return this.f95019a == ((k) obj).f95019a;
        }
        return false;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f95019a);
    }

    public final String toString() {
        return b(this.f95019a);
    }
}
