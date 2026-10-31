package m3;

import androidx.recyclerview.widget.u1;
import com.google.android.gms.internal.measurement.k2;
import i2.u0;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import kotlin.ULong;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class p0 {

    /* renamed from: d, reason: collision with root package name */
    public static final p0 f75955d = new p0(0, 0, null, null, 0, 0, 0, 16777215);

    /* renamed from: a, reason: collision with root package name */
    public final g0 f75956a;

    /* renamed from: b, reason: collision with root package name */
    public final u f75957b;

    /* renamed from: c, reason: collision with root package name */
    public final z f75958c;

    public p0(g0 g0Var, u uVar, z zVar) {
        this.f75956a = g0Var;
        this.f75957b = uVar;
        this.f75958c = zVar;
    }

    public static p0 a(p0 p0Var, long j11, long j12, q3.b0 b0Var, q3.p pVar, long j13, int i5, long j14, z zVar, x3.i iVar, int i11) {
        long jB = (i11 & 1) != 0 ? p0Var.f75956a.f75883a.b() : j11;
        long j15 = (i11 & 2) != 0 ? p0Var.f75956a.f75884b : j12;
        q3.b0 b0Var2 = (i11 & 4) != 0 ? p0Var.f75956a.f75885c : b0Var;
        g0 g0Var = p0Var.f75956a;
        q3.v vVar = g0Var.f75886d;
        q3.w wVar = g0Var.f75887e;
        q3.p pVar2 = (i11 & 32) != 0 ? g0Var.f75888f : pVar;
        String str = g0Var.f75889g;
        long j16 = (i11 & 128) != 0 ? g0Var.f75890h : j13;
        x3.a aVar = g0Var.f75891i;
        x3.p pVar3 = g0Var.f75892j;
        t3.b bVar = g0Var.f75893k;
        long j17 = g0Var.f75894l;
        x3.l lVar = g0Var.f75895m;
        u0 u0Var = g0Var.n;
        k2.g gVar = g0Var.f75896p;
        int i12 = (i11 & SQLiteDatabase.OPEN_NOMUTEX) != 0 ? p0Var.f75957b.f75973a : i5;
        u uVar = p0Var.f75957b;
        int i13 = uVar.f75974b;
        long j18 = (i11 & SQLiteDatabase.OPEN_SHAREDCACHE) != 0 ? uVar.f75975c : j14;
        x3.q qVar = uVar.f75976d;
        z zVar2 = (i11 & 524288) != 0 ? p0Var.f75958c : zVar;
        x3.i iVar2 = (i11 & 1048576) != 0 ? uVar.f75978f : iVar;
        int i14 = uVar.f75979g;
        int i15 = uVar.f75980h;
        x3.s sVar = uVar.f75981i;
        long jB2 = g0Var.f75883a.b();
        int i16 = i2.s.n;
        return new p0(new g0(ULong.a(jB, jB2) ? g0Var.f75883a : jB != 16 ? new x3.c(jB) : x3.n.f95025a, j15, b0Var2, vVar, wVar, pVar2, str, j16, aVar, pVar3, bVar, j17, lVar, u0Var, zVar2 != null ? zVar2.f75990a : null, gVar), new u(i12, i13, j18, qVar, zVar2 != null ? zVar2.f75991b : null, iVar2, i14, i15, sVar), zVar2);
    }

    public static p0 e(p0 p0Var, long j11, long j12, q3.b0 b0Var, q3.v vVar, q3.p pVar, long j13, x3.l lVar, int i5, long j14, int i11) {
        long j15 = (i11 & 1) != 0 ? i2.s.f61147m : j11;
        long j16 = (i11 & 2) != 0 ? y3.p.f96617c : j12;
        q3.b0 b0Var2 = (i11 & 4) != 0 ? null : b0Var;
        q3.v vVar2 = (i11 & 8) != 0 ? null : vVar;
        q3.p pVar2 = (i11 & 32) != 0 ? null : pVar;
        long j17 = (i11 & 128) != 0 ? y3.p.f96617c : j13;
        long j18 = i2.s.f61147m;
        x3.l lVar2 = (i11 & u1.FLAG_APPEARED_IN_PRE_LAYOUT) != 0 ? null : lVar;
        int i12 = (32768 & i11) != 0 ? Integer.MIN_VALUE : i5;
        long j19 = (i11 & SQLiteDatabase.OPEN_SHAREDCACHE) != 0 ? y3.p.f96617c : j14;
        g0 g0VarA = h0.a(p0Var.f75956a, j15, null, Float.NaN, j16, b0Var2, vVar2, null, pVar2, null, j17, null, null, null, j18, lVar2, null, null, null);
        u uVarA = v.a(p0Var.f75957b, i12, Integer.MIN_VALUE, j19, null, null, null, 0, Integer.MIN_VALUE, null);
        return (p0Var.f75956a == g0VarA && p0Var.f75957b == uVarA) ? p0Var : new p0(g0VarA, uVarA);
    }

    public final long b() {
        return this.f75956a.f75883a.b();
    }

    public final boolean c(p0 p0Var) {
        if (this != p0Var) {
            return Intrinsics.b(this.f75957b, p0Var.f75957b) && this.f75956a.a(p0Var.f75956a);
        }
        return true;
    }

    public final p0 d(p0 p0Var) {
        return (p0Var == null || p0Var.equals(f75955d)) ? this : new p0(this.f75956a.c(p0Var.f75956a), this.f75957b.a(p0Var.f75957b));
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof p0)) {
            return false;
        }
        p0 p0Var = (p0) obj;
        return Intrinsics.b(this.f75956a, p0Var.f75956a) && Intrinsics.b(this.f75957b, p0Var.f75957b) && Intrinsics.b(this.f75958c, p0Var.f75958c);
    }

    public final int hashCode() {
        int iHashCode = (this.f75957b.hashCode() + (this.f75956a.hashCode() * 31)) * 31;
        z zVar = this.f75958c;
        return iHashCode + (zVar != null ? zVar.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("TextStyle(color=");
        sb2.append((Object) i2.s.h(b()));
        sb2.append(", brush=");
        g0 g0Var = this.f75956a;
        sb2.append(g0Var.f75883a.c());
        sb2.append(", alpha=");
        sb2.append(g0Var.f75883a.a());
        sb2.append(", fontSize=");
        sb2.append((Object) y3.p.d(g0Var.f75884b));
        sb2.append(", fontWeight=");
        sb2.append(g0Var.f75885c);
        sb2.append(", fontStyle=");
        sb2.append(g0Var.f75886d);
        sb2.append(", fontSynthesis=");
        sb2.append(g0Var.f75887e);
        sb2.append(", fontFamily=");
        sb2.append(g0Var.f75888f);
        sb2.append(", fontFeatureSettings=");
        sb2.append(g0Var.f75889g);
        sb2.append(", letterSpacing=");
        sb2.append((Object) y3.p.d(g0Var.f75890h));
        sb2.append(", baselineShift=");
        sb2.append(g0Var.f75891i);
        sb2.append(", textGeometricTransform=");
        sb2.append(g0Var.f75892j);
        sb2.append(", localeList=");
        sb2.append(g0Var.f75893k);
        sb2.append(", background=");
        k2.v(g0Var.f75894l, ", textDecoration=", sb2);
        sb2.append(g0Var.f75895m);
        sb2.append(", shadow=");
        sb2.append(g0Var.n);
        sb2.append(", drawStyle=");
        sb2.append(g0Var.f75896p);
        sb2.append(", textAlign=");
        u uVar = this.f75957b;
        sb2.append((Object) x3.k.b(uVar.f75973a));
        sb2.append(", textDirection=");
        sb2.append((Object) x3.m.a(uVar.f75974b));
        sb2.append(", lineHeight=");
        sb2.append((Object) y3.p.d(uVar.f75975c));
        sb2.append(", textIndent=");
        sb2.append(uVar.f75976d);
        sb2.append(", platformStyle=");
        sb2.append(this.f75958c);
        sb2.append(", lineHeightStyle=");
        sb2.append(uVar.f75978f);
        sb2.append(", lineBreak=");
        sb2.append((Object) x3.e.a(uVar.f75979g));
        sb2.append(", hyphens=");
        sb2.append((Object) x3.d.a(uVar.f75980h));
        sb2.append(", textMotion=");
        sb2.append(uVar.f75981i);
        sb2.append(')');
        return sb2.toString();
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public p0(g0 g0Var, u uVar) {
        y yVar = g0Var.o;
        x xVar = uVar.f75977e;
        this(g0Var, uVar, (yVar == null && xVar == null) ? null : new z(yVar, xVar));
    }

    public p0(long j11, long j12, q3.b0 b0Var, q3.p pVar, long j13, int i5, long j14, int i11) {
        this(new g0((i11 & 1) != 0 ? i2.s.f61147m : j11, (i11 & 2) != 0 ? y3.p.f96617c : j12, (i11 & 4) != 0 ? null : b0Var, (q3.v) null, (q3.w) null, (i11 & 32) != 0 ? null : pVar, (String) null, (i11 & 128) != 0 ? y3.p.f96617c : j13, (x3.a) null, (x3.p) null, (t3.b) null, i2.s.f61147m, (x3.l) null, (u0) null, (y) null), new u((32768 & i11) != 0 ? Integer.MIN_VALUE : i5, Integer.MIN_VALUE, (i11 & SQLiteDatabase.OPEN_SHAREDCACHE) != 0 ? y3.p.f96617c : j14, null, null, null, 0, Integer.MIN_VALUE, null), null);
    }
}
