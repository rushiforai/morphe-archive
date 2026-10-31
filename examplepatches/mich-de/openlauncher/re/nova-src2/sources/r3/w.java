package r3;

/* loaded from: classes2.dex */
public final class w implements h {

    /* renamed from: a, reason: collision with root package name */
    public final int f85465a;

    /* renamed from: b, reason: collision with root package name */
    public final int f85466b;

    public w(int i5, int i11) {
        this.f85465a = i5;
        this.f85466b = i11;
    }

    @Override // r3.h
    public final void a(j jVar) {
        boolean z11 = jVar.f85449d != -1;
        fz.u uVar = jVar.f85446a;
        if (z11) {
            jVar.f85449d = -1;
            jVar.f85450e = -1;
        }
        int iE0 = kotlin.ranges.a.e0(this.f85465a, 0, uVar.a());
        int iE02 = kotlin.ranges.a.e0(this.f85466b, 0, uVar.a());
        if (iE0 != iE02) {
            if (iE0 < iE02) {
                jVar.e(iE0, iE02);
            } else {
                jVar.e(iE02, iE0);
            }
        }
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof w)) {
            return false;
        }
        w wVar = (w) obj;
        return this.f85465a == wVar.f85465a && this.f85466b == wVar.f85466b;
    }

    public final int hashCode() {
        return (this.f85465a * 31) + this.f85466b;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("SetComposingRegionCommand(start=");
        sb2.append(this.f85465a);
        sb2.append(", end=");
        return a2.c.m(sb2, this.f85466b, ')');
    }
}
