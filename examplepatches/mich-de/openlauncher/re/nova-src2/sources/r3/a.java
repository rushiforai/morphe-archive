package r3;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class a implements h {

    /* renamed from: a, reason: collision with root package name */
    public final m3.g f85388a;

    /* renamed from: b, reason: collision with root package name */
    public final int f85389b;

    public a(m3.g gVar, int i5) {
        this.f85388a = gVar;
        this.f85389b = i5;
    }

    @Override // r3.h
    public final void a(j jVar) {
        int i5 = jVar.f85449d;
        m3.g gVar = this.f85388a;
        if (i5 != -1) {
            jVar.d(i5, jVar.f85450e, gVar.f75880b);
        } else {
            jVar.d(jVar.f85447b, jVar.f85448c, gVar.f75880b);
        }
        int i11 = jVar.f85447b;
        int i12 = jVar.f85448c;
        int i13 = i11 == i12 ? i12 : -1;
        int i14 = this.f85389b;
        int iE0 = kotlin.ranges.a.e0(i14 > 0 ? (i13 + i14) - 1 : (i13 + i14) - gVar.f75880b.length(), 0, jVar.f85446a.a());
        jVar.f(iE0, iE0);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a)) {
            return false;
        }
        a aVar = (a) obj;
        return Intrinsics.b(this.f85388a.f75880b, aVar.f85388a.f75880b) && this.f85389b == aVar.f85389b;
    }

    public final int hashCode() {
        return (this.f85388a.f75880b.hashCode() * 31) + this.f85389b;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("CommitTextCommand(text='");
        sb2.append(this.f85388a.f75880b);
        sb2.append("', newCursorPosition=");
        return a2.c.m(sb2, this.f85389b, ')');
    }

    public a(String str, int i5) {
        this(new m3.g(str), i5);
    }
}
