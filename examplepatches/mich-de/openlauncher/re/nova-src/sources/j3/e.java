package j3;

/* loaded from: classes2.dex */
public final class e {

    /* renamed from: a, reason: collision with root package name */
    public final int f68776a;

    public /* synthetic */ e(int i5) {
        this.f68776a = i5;
    }

    public static final /* synthetic */ e a(int i5) {
        return new e(i5);
    }

    public static final boolean b(int i5, int i11) {
        return i5 == i11;
    }

    public final /* synthetic */ int c() {
        return this.f68776a;
    }

    public final boolean equals(Object obj) {
        if (obj instanceof e) {
            return this.f68776a == ((e) obj).f68776a;
        }
        return false;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f68776a);
    }

    public final String toString() {
        int i5 = this.f68776a;
        return i5 == 0 ? "Polite" : i5 == 1 ? "Assertive" : "Unknown";
    }
}
