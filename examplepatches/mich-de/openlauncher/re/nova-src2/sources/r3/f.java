package r3;

/* loaded from: classes2.dex */
public final class f implements h {

    /* renamed from: a, reason: collision with root package name */
    public final int f85437a;

    /* renamed from: b, reason: collision with root package name */
    public final int f85438b;

    public f(int i5, int i11) {
        this.f85437a = i5;
        this.f85438b = i11;
        if (i5 >= 0 && i11 >= 0) {
            return;
        }
        s3.a.a("Expected lengthBeforeCursor and lengthAfterCursor to be non-negative, were " + i5 + " and " + i11 + " respectively.");
    }

    @Override // r3.h
    public final void a(j jVar) {
        int i5 = jVar.f85448c;
        fz.u uVar = jVar.f85446a;
        int i11 = this.f85438b;
        int iA = i5 + i11;
        if (((i5 ^ iA) & (i11 ^ iA)) < 0) {
            iA = uVar.a();
        }
        jVar.a(jVar.f85448c, Math.min(iA, uVar.a()));
        int i12 = jVar.f85447b;
        int i13 = this.f85437a;
        int i14 = i12 - i13;
        if (((i12 ^ i14) & (i13 ^ i12)) < 0) {
            i14 = 0;
        }
        jVar.a(Math.max(0, i14), jVar.f85447b);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof f)) {
            return false;
        }
        f fVar = (f) obj;
        return this.f85437a == fVar.f85437a && this.f85438b == fVar.f85438b;
    }

    public final int hashCode() {
        return (this.f85437a * 31) + this.f85438b;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("DeleteSurroundingTextCommand(lengthBeforeCursor=");
        sb2.append(this.f85437a);
        sb2.append(", lengthAfterCursor=");
        return a2.c.m(sb2, this.f85438b, ')');
    }
}
