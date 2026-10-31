package wf;

/* loaded from: classes3.dex */
public final class p {

    /* renamed from: c, reason: collision with root package name */
    public static final p f94364c = new p(-1, -1);

    /* renamed from: a, reason: collision with root package name */
    public final int f94365a;

    /* renamed from: b, reason: collision with root package name */
    public final int f94366b;

    public p(int i5, int i11) {
        a.e((i5 == -1 || i5 >= 0) && (i11 == -1 || i11 >= 0));
        this.f94365a = i5;
        this.f94366b = i11;
    }

    public final boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (this == obj) {
            return true;
        }
        if (obj instanceof p) {
            p pVar = (p) obj;
            if (this.f94365a == pVar.f94365a && this.f94366b == pVar.f94366b) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        int i5 = this.f94365a;
        return ((i5 >>> 16) | (i5 << 16)) ^ this.f94366b;
    }

    public final String toString() {
        return this.f94365a + "x" + this.f94366b;
    }
}
