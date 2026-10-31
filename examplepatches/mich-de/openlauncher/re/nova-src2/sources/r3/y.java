package r3;

/* loaded from: classes2.dex */
public final class y implements h {

    /* renamed from: a, reason: collision with root package name */
    public final int f85469a;

    /* renamed from: b, reason: collision with root package name */
    public final int f85470b;

    public y(int i5, int i11) {
        this.f85469a = i5;
        this.f85470b = i11;
    }

    @Override // r3.h
    public final void a(j jVar) {
        int iE0 = kotlin.ranges.a.e0(this.f85469a, 0, jVar.f85446a.a());
        int iE02 = kotlin.ranges.a.e0(this.f85470b, 0, jVar.f85446a.a());
        if (iE0 < iE02) {
            jVar.f(iE0, iE02);
        } else {
            jVar.f(iE02, iE0);
        }
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof y)) {
            return false;
        }
        y yVar = (y) obj;
        return this.f85469a == yVar.f85469a && this.f85470b == yVar.f85470b;
    }

    public final int hashCode() {
        return (this.f85469a * 31) + this.f85470b;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("SetSelectionCommand(start=");
        sb2.append(this.f85469a);
        sb2.append(", end=");
        return a2.c.m(sb2, this.f85470b, ')');
    }
}
