package l1;

import kotlin.ULong;
import kotlin.jvm.functions.Function1;

/* loaded from: classes.dex */
public abstract class b3 {

    /* renamed from: a, reason: collision with root package name */
    public static final b2.t f73053a = androidx.compose.foundation.layout.e.o(b2.r.f17024a, o1.n.f79132a);

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0052  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x0064  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x007a  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x0095  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x0097  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x009c  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x00b1  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x00b7  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x00c6 A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:69:0x00c8  */
    /* JADX WARN: Removed duplicated region for block: B:71:0x00d0  */
    /* JADX WARN: Removed duplicated region for block: B:73:0x00d3  */
    /* JADX WARN: Removed duplicated region for block: B:77:0x00e7  */
    /* JADX WARN: Removed duplicated region for block: B:86:0x0106  */
    /* JADX WARN: Removed duplicated region for block: B:89:0x011a  */
    /* JADX WARN: Removed duplicated region for block: B:93:0x0132  */
    /* JADX WARN: Removed duplicated region for block: B:97:0x0154  */
    /* JADX WARN: Removed duplicated region for block: B:99:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Type inference failed for: r3v16 */
    /* JADX WARN: Type inference failed for: r3v17, types: [boolean, int] */
    /* JADX WARN: Type inference failed for: r3v20 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final void a(n2.c cVar, String str, b2.t tVar, long j11, p1.o oVar, int i5, int i11) {
        int i12;
        b2.t tVar2;
        long j12;
        int i13;
        long j13;
        boolean z11;
        Object objP;
        ?? r32;
        b2.t tVarB;
        b2.t tVar3;
        long j14;
        p1.t1 t1VarU;
        p1.t tVar4 = (p1.t) oVar;
        tVar4.d0(-2142239481);
        if ((i5 & 6) == 0) {
            i12 = (tVar4.h(cVar) ? 4 : 2) | i5;
        } else {
            i12 = i5;
        }
        if ((i5 & 48) == 0) {
            i12 |= tVar4.f(str) ? 32 : 16;
        }
        int i14 = i11 & 4;
        if (i14 == 0) {
            if ((i5 & 384) == 0) {
                tVar2 = tVar;
                i12 |= tVar4.f(tVar2) ? 256 : 128;
            }
            if ((i5 & 3072) != 0) {
                j12 = j11;
                i12 |= ((i11 & 8) == 0 && tVar4.e(j12)) ? 2048 : 1024;
            } else {
                j12 = j11;
            }
            if ((i12 & 1171) == 1170 || !tVar4.E()) {
                tVar4.X();
                i13 = i5 & 1;
                b2.t tVar5 = b2.r.f17024a;
                if (i13 != 0 || tVar4.B()) {
                    if (i14 != 0) {
                        tVar2 = tVar5;
                    }
                    if ((i11 & 8) != 0) {
                        j12 = ((i2.s) tVar4.j(s1.f73932a)).f61148a;
                        i12 &= -7169;
                    }
                    j13 = j12;
                    tVar4.q();
                    z11 = (((i12 & 7168) ^ 3072) > 2048 && tVar4.e(j13)) || (i12 & 3072) == 2048;
                    objP = tVar4.P();
                    p1.g1 g1Var = p1.n.f81514a;
                    if (z11 || objP == g1Var) {
                        objP = !ULong.a(j13, i2.s.f61147m) ? null : new i2.n(j13, 5);
                        tVar4.m0(objP);
                    }
                    i2.t tVar6 = (i2.t) objP;
                    tVar4.b0(-2144891392);
                    if (str == null) {
                        boolean z12 = (i12 & 112) == 32;
                        Object objP2 = tVar4.P();
                        if (z12 || objP2 == g1Var) {
                            objP2 = new a3(str, 0);
                            tVar4.m0(objP2);
                        }
                        r32 = 0;
                        tVarB = j3.n.b(tVar5, false, (Function1) objP2);
                    } else {
                        r32 = 0;
                        tVarB = tVar5;
                    }
                    tVar4.p(r32);
                    if (h2.e.a(cVar.f(), 9205357640488583168L)) {
                        long jF = cVar.f();
                        if (Float.isInfinite(h2.e.d(jF)) && Float.isInfinite(h2.e.b(jF))) {
                            tVar5 = f73053a;
                        }
                        k0.p.a(androidx.compose.ui.draw.a.d(tVar2.then(tVar5), cVar, null, z2.k.f98095b, 0.0f, tVar6, 22).then(tVarB), tVar4, r32);
                        tVar3 = tVar2;
                        j14 = j13;
                    }
                } else {
                    tVar4.V();
                    if ((i11 & 8) != 0) {
                        i12 &= -7169;
                    }
                    j13 = j12;
                    tVar4.q();
                    if (((i12 & 7168) ^ 3072) > 2048) {
                        objP = tVar4.P();
                        p1.g1 g1Var2 = p1.n.f81514a;
                        if (z11) {
                            objP = !ULong.a(j13, i2.s.f61147m) ? null : new i2.n(j13, 5);
                            tVar4.m0(objP);
                            i2.t tVar62 = (i2.t) objP;
                            tVar4.b0(-2144891392);
                            if (str == null) {
                            }
                            tVar4.p(r32);
                            if (h2.e.a(cVar.f(), 9205357640488583168L)) {
                            }
                        }
                    } else {
                        objP = tVar4.P();
                        p1.g1 g1Var22 = p1.n.f81514a;
                        if (z11) {
                        }
                    }
                }
            } else {
                tVar4.V();
                tVar3 = tVar2;
                j14 = j12;
            }
            t1VarU = tVar4.u();
            if (t1VarU == null) {
                t1VarU.f81583d = new z2(cVar, str, tVar3, j14, i5, i11);
                return;
            }
            return;
        }
        i12 |= 384;
        tVar2 = tVar;
        if ((i5 & 3072) != 0) {
        }
        if ((i12 & 1171) == 1170) {
            tVar4.X();
            i13 = i5 & 1;
            b2.t tVar52 = b2.r.f17024a;
            if (i13 != 0) {
                if (i14 != 0) {
                }
                if ((i11 & 8) != 0) {
                }
                j13 = j12;
                tVar4.q();
                if (((i12 & 7168) ^ 3072) > 2048) {
                }
            }
        }
        t1VarU = tVar4.u();
        if (t1VarU == null) {
        }
    }

    public static final void b(o2.g gVar, String str, b2.t tVar, long j11, p1.o oVar, int i5, int i11) {
        int i12;
        String str2;
        b2.t tVar2;
        long j12;
        p1.t tVar3 = (p1.t) oVar;
        tVar3.d0(-126890956);
        if ((i5 & 6) == 0) {
            i12 = (tVar3.f(gVar) ? 4 : 2) | i5;
        } else {
            i12 = i5;
        }
        if ((i5 & 48) == 0) {
            i12 |= tVar3.f(str) ? 32 : 16;
        }
        int i13 = i11 & 4;
        if (i13 != 0) {
            i12 |= 384;
        } else if ((i5 & 384) == 0) {
            i12 |= tVar3.f(tVar) ? 256 : 128;
        }
        if ((i5 & 3072) == 0) {
            i12 |= ((i11 & 8) == 0 && tVar3.e(j11)) ? 2048 : 1024;
        }
        if ((i12 & 1171) == 1170 && tVar3.E()) {
            tVar3.V();
            j12 = j11;
            tVar2 = tVar;
            str2 = str;
        } else {
            tVar3.X();
            if ((i5 & 1) == 0 || tVar3.B()) {
                if (i13 != 0) {
                    tVar = b2.r.f17024a;
                }
                if ((i11 & 8) != 0) {
                    j11 = ((i2.s) tVar3.j(s1.f73932a)).f61148a;
                    i12 &= -7169;
                }
                b2.t tVar4 = tVar;
                long j13 = j11;
                tVar3.q();
                a(o2.b.b(gVar, tVar3), str, tVar4, j13, tVar3, (i12 & 112) | 8 | (i12 & 896) | (i12 & 7168), 0);
                str2 = str;
                tVar2 = tVar4;
                j12 = j13;
            } else {
                tVar3.V();
                if ((i11 & 8) != 0) {
                    i12 &= -7169;
                }
                b2.t tVar42 = tVar;
                long j132 = j11;
                tVar3.q();
                a(o2.b.b(gVar, tVar3), str, tVar42, j132, tVar3, (i12 & 112) | 8 | (i12 & 896) | (i12 & 7168), 0);
                str2 = str;
                tVar2 = tVar42;
                j12 = j132;
            }
        }
        p1.t1 t1VarU = tVar3.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new y2(gVar, str2, tVar2, j12, i5, i11);
        }
    }
}
