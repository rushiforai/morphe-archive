package mt;

/* loaded from: classes4.dex */
public final class o implements s {

    /* renamed from: a, reason: collision with root package name */
    public final int f76801a;

    public o(int i5) {
        this.f76801a = i5;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof o) && this.f76801a == ((o) obj).f76801a;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f76801a);
    }

    public final String toString() {
        return b.c0.i(this.f76801a, "GooglePay(errorCode=", ")");
    }
}
