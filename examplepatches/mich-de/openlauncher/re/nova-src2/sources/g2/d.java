package g2;

/* loaded from: classes2.dex */
public final class d {

    /* renamed from: a, reason: collision with root package name */
    public final int f56863a;

    public /* synthetic */ d(int i5) {
        this.f56863a = i5;
    }

    public static final /* synthetic */ d a(int i5) {
        return new d(i5);
    }

    public static final boolean b(int i5, int i11) {
        return i5 == i11;
    }

    public static String c(int i5) {
        return i5 == 1 ? "Next" : i5 == 2 ? "Previous" : i5 == 3 ? "Left" : i5 == 4 ? "Right" : i5 == 5 ? "Up" : i5 == 6 ? "Down" : i5 == 7 ? "Enter" : i5 == 8 ? "Exit" : "Invalid FocusDirection";
    }

    public final /* synthetic */ int d() {
        return this.f56863a;
    }

    public final boolean equals(Object obj) {
        if (obj instanceof d) {
            return this.f56863a == ((d) obj).f56863a;
        }
        return false;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f56863a);
    }

    public final String toString() {
        return c(this.f56863a);
    }
}
