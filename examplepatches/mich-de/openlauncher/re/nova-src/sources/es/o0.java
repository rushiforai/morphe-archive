package es;

/* loaded from: classes4.dex */
public final class o0 implements p0 {

    /* renamed from: a, reason: collision with root package name */
    public final Exception f52996a;

    public o0(Exception exc) {
        this.f52996a = exc;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof o0) && this.f52996a.equals(((o0) obj).f52996a);
    }

    public final int hashCode() {
        return this.f52996a.hashCode();
    }

    public final String toString() {
        return "Failure(error=" + this.f52996a + ")";
    }
}
