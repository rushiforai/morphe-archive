package r3;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class x implements h {

    /* renamed from: a, reason: collision with root package name */
    public final m3.g f85467a;

    /* renamed from: b, reason: collision with root package name */
    public final int f85468b;

    public x(String str, int i5) {
        this.f85467a = new m3.g(str);
        this.f85468b = i5;
    }

    @Override // r3.h
    public final void a(j jVar) {
        int i5 = jVar.f85449d;
        m3.g gVar = this.f85467a;
        if (i5 != -1) {
            int i11 = jVar.f85450e;
            String str = gVar.f75880b;
            String str2 = gVar.f75880b;
            jVar.d(i5, i11, str);
            if (str2.length() > 0) {
                jVar.e(i5, str2.length() + i5);
            }
        } else {
            int i12 = jVar.f85447b;
            int i13 = jVar.f85448c;
            String str3 = gVar.f75880b;
            String str4 = gVar.f75880b;
            jVar.d(i12, i13, str3);
            if (str4.length() > 0) {
                jVar.e(i12, str4.length() + i12);
            }
        }
        int i14 = jVar.f85447b;
        int i15 = jVar.f85448c;
        int i16 = i14 == i15 ? i15 : -1;
        int i17 = this.f85468b;
        int iE0 = kotlin.ranges.a.e0(i17 > 0 ? (i16 + i17) - 1 : (i16 + i17) - gVar.f75880b.length(), 0, jVar.f85446a.a());
        jVar.f(iE0, iE0);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof x)) {
            return false;
        }
        x xVar = (x) obj;
        return Intrinsics.b(this.f85467a.f75880b, xVar.f85467a.f75880b) && this.f85468b == xVar.f85468b;
    }

    public final int hashCode() {
        return (this.f85467a.f75880b.hashCode() * 31) + this.f85468b;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("SetComposingTextCommand(text='");
        sb2.append(this.f85467a.f75880b);
        sb2.append("', newCursorPosition=");
        return a2.c.m(sb2, this.f85468b, ')');
    }
}
