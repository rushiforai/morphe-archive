package bw;

/* loaded from: classes4.dex */
public final class i implements j {

    /* renamed from: a, reason: collision with root package name */
    public final Exception f18666a;

    public i(Exception exc) {
        this.f18666a = exc;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof i) && this.f18666a.equals(((i) obj).f18666a);
    }

    public final int hashCode() {
        return this.f18666a.hashCode();
    }

    public final String toString() {
        return "Failed(error=" + this.f18666a + ")";
    }
}
