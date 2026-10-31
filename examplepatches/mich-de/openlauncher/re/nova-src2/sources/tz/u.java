package tz;

import b.c0;
import b.u4;
import kotlin.UInt;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Serializable
@SourceDebugExtension
/* loaded from: classes.dex */
public final class u {

    @NotNull
    public static final t Companion = new t();

    /* renamed from: a, reason: collision with root package name */
    public final int f90170a;

    /* renamed from: b, reason: collision with root package name */
    public final long f90171b;

    /* renamed from: c, reason: collision with root package name */
    public final long f90172c;

    /* renamed from: d, reason: collision with root package name */
    public final long f90173d;

    /* renamed from: e, reason: collision with root package name */
    public final long f90174e;

    /* renamed from: f, reason: collision with root package name */
    public final int f90175f;

    /* renamed from: g, reason: collision with root package name */
    public final int f90176g;

    /* renamed from: h, reason: collision with root package name */
    public u f90177h;

    public /* synthetic */ u(int i5, r rVar, n nVar, n nVar2, n nVar3, n nVar4, int i11, int i12) {
        int i13;
        if (6 != (i5 & 6)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 6, s.f90169a.getDescriptor());
        }
        if ((i5 & 1) == 0) {
            r.Companion.getClass();
            i13 = 0;
        } else {
            i13 = rVar.f90168a;
        }
        this.f90170a = i13;
        this.f90171b = nVar.f90163a;
        long j11 = nVar2.f90163a;
        this.f90172c = j11;
        this.f90173d = (i5 & 8) != 0 ? nVar3.f90163a : j11;
        this.f90174e = (i5 & 16) == 0 ? this.f90173d : nVar4.f90163a;
        if ((i5 & 32) == 0) {
            this.f90175f = 40;
        } else {
            this.f90175f = i11;
        }
        if ((i5 & 64) == 0) {
            this.f90176g = 20;
        } else {
            this.f90176g = i12;
        }
        this.f90177h = null;
    }

    public static u a(u uVar, int i5, long j11, long j12, long j13, int i11, int i12, int i13) {
        if ((i13 & 1) != 0) {
            i5 = uVar.f90170a;
        }
        int i14 = i5;
        long j14 = (i13 & 2) != 0 ? uVar.f90171b : j11;
        long j15 = (i13 & 4) != 0 ? uVar.f90172c : j12;
        long j16 = (i13 & 8) != 0 ? uVar.f90173d : j13;
        long j17 = uVar.f90174e;
        int i15 = (i13 & 32) != 0 ? uVar.f90175f : i11;
        int i16 = (i13 & 64) != 0 ? uVar.f90176g : i12;
        uVar.getClass();
        return new u(i14, j14, j15, j16, j17, i15, i16);
    }

    public final int b(o oVar, int i5) {
        u uVar = this.f90177h;
        if (uVar == null) {
            return i5;
        }
        long j11 = uVar.f90171b;
        c.Companion.getClass();
        int iJ = r4.a.j(n.f(j11, uVar.c(oVar, 0)), uVar.b(oVar, i5));
        UInt.Companion companion = UInt.f71696b;
        return iJ;
    }

    public final o c(o oVar, int i5) {
        r.Companion.getClass();
        int i11 = this.f90170a;
        if (c.a(i11, 1)) {
            c.Companion.getClass();
            if (!c.a(i5, 0)) {
                return r.a(i11, i5, oVar);
            }
        }
        return r.a(i11, i5, oVar);
    }

    public final v d(g30.b bVar) {
        o oVar = bVar.f57023g;
        return f(oVar, b(oVar, bVar.f57020d));
    }

    public final v e(int i5, int i11, o oVar) {
        o oVarC = c(oVar, i11);
        int iF = n.f(this.f90171b, oVarC);
        UInt.Companion companion = UInt.f71696b;
        int iJ = ((iF >>> 24) & 255) == 255 ? iF : r4.a.j(iF, i5);
        return new v(iF, n.d(this.f90172c, oVarC, iF, iJ, this.f90175f), n.d(this.f90173d, oVarC, iF, iJ, this.f90176g), n.d(this.f90174e, oVarC, iF, iJ, this.f90176g), i5);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof u)) {
            return false;
        }
        u uVar = (u) obj;
        return c.a(this.f90170a, uVar.f90170a) && n.a(this.f90171b, uVar.f90171b) && n.a(this.f90172c, uVar.f90172c) && n.a(this.f90173d, uVar.f90173d) && n.a(this.f90174e, uVar.f90174e) && this.f90175f == uVar.f90175f && this.f90176g == uVar.f90176g;
    }

    public final v f(o oVar, int i5) {
        int iB = b(oVar, i5);
        c.Companion.getClass();
        return e(iB, 0, oVar);
    }

    public final int hashCode() {
        UInt.Companion companion = UInt.f71696b;
        int iHashCode = Integer.hashCode(this.f90170a) * 31;
        m mVar = n.Companion;
        return Integer.hashCode(this.f90176g) + u4.a(this.f90175f, c0.d(c0.d(c0.d(c0.d(iHashCode, 31, this.f90171b), 31, this.f90172c), 31, this.f90173d), 31, this.f90174e), 31);
    }

    public final String toString() {
        String strH = n.h(this.f90171b);
        String strH2 = n.h(this.f90172c);
        String strConcat = ", accent: ".concat(n.h(this.f90173d));
        String strConcat2 = ", accent2: ".concat(n.h(this.f90174e));
        StringBuilder sbW = c0.w("bgColor: ", strH, ", fgColor: ", strH2, strConcat);
        sbW.append(strConcat2);
        return sbW.toString();
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public /* synthetic */ u(int i5, long j11, long j12, long j13, int i11) {
        if ((i11 & 1) != 0) {
            r.Companion.getClass();
            i5 = 0;
        }
        int i12 = i5;
        long j14 = (i11 & 8) != 0 ? j12 : j13;
        this(i12, j11, j12, j14, j14, 40, 20);
    }

    public u(int i5, long j11, long j12, long j13, long j14, int i11, int i12) {
        this.f90170a = i5;
        this.f90171b = j11;
        this.f90172c = j12;
        this.f90173d = j13;
        this.f90174e = j14;
        this.f90175f = i11;
        this.f90176g = i12;
    }
}
