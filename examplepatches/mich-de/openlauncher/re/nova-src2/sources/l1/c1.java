package l1;

import androidx.compose.material3.MinimumInteractiveModifier;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.FloatCompanionObject;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;

/* loaded from: classes2.dex */
public abstract class c1 {

    /* renamed from: a, reason: collision with root package name */
    public static final float f73087a;

    /* renamed from: b, reason: collision with root package name */
    public static final float f73088b = 20;

    /* renamed from: c, reason: collision with root package name */
    public static final float f73089c;

    /* renamed from: d, reason: collision with root package name */
    public static final float f73090d;

    static {
        float f11 = 2;
        f73087a = f11;
        f73089c = f11;
        f73090d = f11;
    }

    /* JADX WARN: Removed duplicated region for block: B:30:0x0051  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x0056  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x006c  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x007a  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x008a  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x00a5  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x00a7  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x00aa  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x00ad  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x00ba  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x0114  */
    /* JADX WARN: Removed duplicated region for block: B:66:0x0120  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x0124  */
    /* JADX WARN: Removed duplicated region for block: B:71:0x0130  */
    /* JADX WARN: Removed duplicated region for block: B:86:0x0157  */
    /* JADX WARN: Removed duplicated region for block: B:90:0x016d  */
    /* JADX WARN: Removed duplicated region for block: B:92:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final void a(boolean z11, Function1 function1, b2.t tVar, boolean z12, x0 x0Var, p1.o oVar, int i5, int i11) {
        int i12;
        b2.t tVar2;
        int i13;
        boolean z13;
        int i14;
        x0 x0Var2;
        int i15;
        int i16;
        x0 x0Var3;
        boolean z14;
        b2.t tVar3;
        Function0 function0;
        b2.t tVar4;
        boolean z15;
        x0 x0Var4;
        p1.t1 t1VarU;
        p1.t tVar5 = (p1.t) oVar;
        tVar5.d0(-1406741137);
        if ((i5 & 6) == 0) {
            i12 = (tVar5.g(z11) ? 4 : 2) | i5;
        } else {
            i12 = i5;
        }
        if ((i5 & 48) == 0) {
            i12 |= tVar5.h(function1) ? 32 : 16;
        }
        int i17 = i11 & 4;
        if (i17 != 0) {
            i12 |= 384;
        } else {
            if ((i5 & 384) == 0) {
                tVar2 = tVar;
                i12 |= tVar5.f(tVar2) ? 256 : 128;
            }
            i13 = i11 & 8;
            if (i13 != 0) {
                if ((i5 & 3072) == 0) {
                    z13 = z12;
                    i12 |= tVar5.g(z13) ? 2048 : 1024;
                }
                if ((i5 & 24576) == 0) {
                    i12 |= UserMetadata.MAX_INTERNAL_KEY_SIZE;
                }
                i14 = i12 | 196608;
                if ((74899 & i14) == 74898 && tVar5.E()) {
                    tVar5.V();
                    x0Var4 = x0Var;
                    tVar4 = tVar2;
                    z15 = z13;
                } else {
                    tVar5.X();
                    if ((i5 & 1) != 0 || tVar5.B()) {
                        b2.t tVar6 = i17 == 0 ? b2.r.f17024a : tVar2;
                        if (i13 != 0) {
                            z13 = true;
                        }
                        d1 d1Var = (d1) tVar5.j(g1.f73330a);
                        x0Var2 = d1Var.R;
                        if (x0Var2 != null) {
                            long jD = g1.d(d1Var, o1.a.f78924d);
                            long j11 = i2.s.f61146l;
                            int i18 = o1.a.f78922b;
                            long jD2 = g1.d(d1Var, i18);
                            int i19 = o1.a.f78923c;
                            i15 = -57345;
                            x0 x0Var5 = new x0(jD, j11, jD2, j11, i2.s.b(0.38f, g1.d(d1Var, i19)), j11, i2.s.b(0.38f, g1.d(d1Var, i19)), g1.d(d1Var, i18), g1.d(d1Var, o1.a.f78926f), i2.s.b(0.38f, g1.d(d1Var, i19)), i2.s.b(0.38f, g1.d(d1Var, o1.a.f78925e)), i2.s.b(0.38f, g1.d(d1Var, i19)));
                            d1Var.R = x0Var5;
                            x0Var2 = x0Var5;
                        } else {
                            i15 = -57345;
                        }
                        i16 = i14 & i15;
                        x0Var3 = x0Var2;
                        z14 = z13;
                        tVar3 = tVar6;
                    } else {
                        tVar5.V();
                        i16 = i14 & (-57345);
                        x0Var3 = x0Var;
                        z14 = z13;
                        tVar3 = tVar2;
                    }
                    tVar5.q();
                    l3.a aVar = !z11 ? l3.a.f74630a : l3.a.f74631b;
                    tVar5.b0(1046936362);
                    if (function1 == null) {
                        boolean z16 = ((i16 & 112) == 32) | ((i16 & 14) == 4);
                        Object objP = tVar5.P();
                        if (z16 || objP == p1.n.f81514a) {
                            objP = new h.d(function1, z11, 1);
                            tVar5.m0(objP);
                        }
                        function0 = (Function0) objP;
                    } else {
                        function0 = null;
                    }
                    Function0 function02 = function0;
                    tVar5.p(false);
                    c(aVar, function02, tVar3, z14, x0Var3, tVar5, i16 & 524160);
                    tVar4 = tVar3;
                    z15 = z14;
                    x0Var4 = x0Var3;
                }
                t1VarU = tVar5.u();
                if (t1VarU != null) {
                    t1VarU.f81583d = new y0(z11, function1, tVar4, z15, x0Var4, i5, i11, 0);
                    return;
                }
                return;
            }
            i12 |= 3072;
            z13 = z12;
            if ((i5 & 24576) == 0) {
            }
            i14 = i12 | 196608;
            if ((74899 & i14) == 74898) {
                tVar5.X();
                if ((i5 & 1) != 0) {
                    if (i17 == 0) {
                    }
                    if (i13 != 0) {
                    }
                    d1 d1Var2 = (d1) tVar5.j(g1.f73330a);
                    x0Var2 = d1Var2.R;
                    if (x0Var2 != null) {
                    }
                    i16 = i14 & i15;
                    x0Var3 = x0Var2;
                    z14 = z13;
                    tVar3 = tVar6;
                    tVar5.q();
                    l3.a aVar2 = !z11 ? l3.a.f74630a : l3.a.f74631b;
                    tVar5.b0(1046936362);
                    if (function1 == null) {
                    }
                    Function0 function022 = function0;
                    tVar5.p(false);
                    c(aVar2, function022, tVar3, z14, x0Var3, tVar5, i16 & 524160);
                    tVar4 = tVar3;
                    z15 = z14;
                    x0Var4 = x0Var3;
                }
            }
            t1VarU = tVar5.u();
            if (t1VarU != null) {
            }
        }
        tVar2 = tVar;
        i13 = i11 & 8;
        if (i13 != 0) {
        }
        z13 = z12;
        if ((i5 & 24576) == 0) {
        }
        i14 = i12 | 196608;
        if ((74899 & i14) == 74898) {
        }
        t1VarU = tVar5.u();
        if (t1VarU != null) {
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:100:0x01d6  */
    /* JADX WARN: Removed duplicated region for block: B:111:0x01ef  */
    /* JADX WARN: Removed duplicated region for block: B:123:0x020b  */
    /* JADX WARN: Removed duplicated region for block: B:130:0x022f  */
    /* JADX WARN: Removed duplicated region for block: B:132:0x0246  */
    /* JADX WARN: Removed duplicated region for block: B:143:0x025f  */
    /* JADX WARN: Removed duplicated region for block: B:155:0x027b  */
    /* JADX WARN: Removed duplicated region for block: B:161:0x029c  */
    /* JADX WARN: Removed duplicated region for block: B:165:0x02dd  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x00b4  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x00b8  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x00e0  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x00e9  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x0120 A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:69:0x012e  */
    /* JADX WARN: Removed duplicated region for block: B:78:0x0152  */
    /* JADX WARN: Removed duplicated region for block: B:81:0x016b  */
    /* JADX WARN: Removed duplicated region for block: B:82:0x0172  */
    /* JADX WARN: Removed duplicated region for block: B:88:0x01a0  */
    /* JADX WARN: Removed duplicated region for block: B:91:0x01b1  */
    /* JADX WARN: Removed duplicated region for block: B:92:0x01b4  */
    /* JADX WARN: Removed duplicated region for block: B:95:0x01ba  */
    /* JADX WARN: Removed duplicated region for block: B:97:0x01bf  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final void b(boolean z11, l3.a aVar, b2.t tVar, x0 x0Var, p1.o oVar, int i5) {
        int i11;
        float f11;
        int iOrdinal;
        float f12;
        Object objB;
        l3.a aVar2;
        boolean z12;
        float f13;
        c0.c0 c0VarH;
        float f14;
        c0.y1 y1VarC;
        int iOrdinal2;
        float f15;
        int iOrdinal3;
        c0.y1 y1VarC2;
        Object objP;
        p1.g1 g1Var;
        w0 w0Var;
        long j11;
        p1.y2 y2Var;
        Object objM;
        long j12;
        Object obj;
        Object objM2;
        boolean zF;
        Object objP2;
        p1.t tVar2 = (p1.t) oVar;
        tVar2.d0(2007131616);
        if ((i5 & 6) == 0) {
            i11 = (tVar2.g(z11) ? 4 : 2) | i5;
        } else {
            i11 = i5;
        }
        if ((i5 & 48) == 0) {
            i11 |= tVar2.f(aVar) ? 32 : 16;
        }
        if ((i5 & 384) == 0) {
            i11 |= tVar2.f(tVar) ? 256 : 128;
        }
        if ((i5 & 3072) == 0) {
            i11 |= tVar2.f(x0Var) ? 2048 : 1024;
        }
        if ((i11 & 1171) == 1170 && tVar2.E()) {
            tVar2.V();
        } else {
            c0.c2 c2VarE = c0.f2.e(aVar, null, tVar2, (i11 >> 3) & 14, 2);
            p1.e1 e1Var = c2VarE.f18733d;
            c0.g2 g2Var = c2VarE.f18730a;
            FloatCompanionObject floatCompanionObject = FloatCompanionObject.f71855a;
            c0.i2 i2Var = c0.f.f18784i;
            l3.a aVar3 = (l3.a) g2Var.c();
            tVar2.b0(1800065638);
            int iOrdinal4 = aVar3.ordinal();
            float f16 = 1.0f;
            if (iOrdinal4 == 0) {
                f11 = 1.0f;
                tVar2.p(false);
                Float fValueOf = Float.valueOf(f11);
                p1.s2 s2Var = (p1.s2) e1Var;
                l3.a aVar4 = (l3.a) s2Var.getValue();
                tVar2.b0(1800065638);
                iOrdinal = aVar4.ordinal();
                if (iOrdinal == 0) {
                    f12 = 1.0f;
                    tVar2.p(false);
                    Float fValueOf2 = Float.valueOf(f12);
                    c0.w1 w1VarF = c2VarE.f();
                    tVar2.b0(1373301606);
                    objB = w1VarF.b();
                    aVar2 = l3.a.f74631b;
                    if (objB == aVar2) {
                        z12 = false;
                        c0VarH = c0.f.i(100, 0, null, 6);
                    } else {
                        z12 = false;
                        if (w1VarF.a() == aVar2) {
                            c0VarH = new c0.j1(100);
                        } else {
                            f13 = 0.0f;
                            c0VarH = c0.f.h(0.0f, 0.0f, null, 7);
                            tVar2.p(z12);
                            boolean z13 = z12;
                            f14 = f13;
                            y1VarC = c0.f2.c(c2VarE, fValueOf, fValueOf2, c0VarH, i2Var, tVar2, 0);
                            l3.a aVar5 = (l3.a) g2Var.c();
                            tVar2.b0(-1426969489);
                            iOrdinal2 = aVar5.ordinal();
                            if (iOrdinal2 != 0 || iOrdinal2 == 1) {
                                f15 = f14;
                            } else {
                                if (iOrdinal2 != 2) {
                                    throw new NoWhenBranchMatchedException();
                                }
                                f15 = 1.0f;
                            }
                            tVar2.p(z13);
                            Float fValueOf3 = Float.valueOf(f15);
                            l3.a aVar6 = (l3.a) s2Var.getValue();
                            tVar2.b0(-1426969489);
                            iOrdinal3 = aVar6.ordinal();
                            if (iOrdinal3 != 0 || iOrdinal3 == 1) {
                                f16 = f14;
                            } else if (iOrdinal3 != 2) {
                                throw new NoWhenBranchMatchedException();
                            }
                            tVar2.p(z13);
                            Float fValueOf4 = Float.valueOf(f16);
                            c0.w1 w1VarF2 = c2VarE.f();
                            tVar2.b0(-1324481169);
                            c0.c0 c0VarG = w1VarF2.b() != aVar2 ? c0.f.g() : w1VarF2.a() == aVar2 ? new c0.j1(100) : c0.f.i(100, z13 ? 1 : 0, null, 6);
                            tVar2.p(z13);
                            y1VarC2 = c0.f2.c(c2VarE, fValueOf3, fValueOf4, c0VarG, i2Var, tVar2, 0);
                            tVar2 = tVar2;
                            objP = tVar2.P();
                            g1Var = p1.n.f81514a;
                            if (objP == g1Var) {
                                objP = new w0();
                                tVar2.m0(objP);
                            }
                            w0Var = (w0) objP;
                            x0Var.getClass();
                            p1.y2 y2VarA = b0.n1.a(aVar != aVar2 ? x0Var.f74207b : x0Var.f74206a, c0.f.i(aVar != aVar2 ? 100 : 50, z13 ? 1 : 0, null, 6), tVar2, 0, 12);
                            if (z11) {
                                int iOrdinal5 = aVar.ordinal();
                                if (iOrdinal5 == 0) {
                                    j11 = x0Var.f74210e;
                                } else if (iOrdinal5 == 1) {
                                    j11 = x0Var.f74211f;
                                } else {
                                    if (iOrdinal5 != 2) {
                                        throw new NoWhenBranchMatchedException();
                                    }
                                    j11 = x0Var.f74212g;
                                }
                            } else {
                                int iOrdinal6 = aVar.ordinal();
                                if (iOrdinal6 == 0) {
                                    j11 = x0Var.f74208c;
                                } else if (iOrdinal6 != 1) {
                                    if (iOrdinal6 != 2) {
                                        throw new NoWhenBranchMatchedException();
                                    }
                                    j11 = x0Var.f74208c;
                                } else {
                                    j11 = x0Var.f74209d;
                                }
                            }
                            if (z11) {
                                y2Var = y2VarA;
                                tVar2.b0(-392031362);
                                objM = androidx.compose.runtime.d.m(new i2.s(j11), tVar2);
                                tVar2.p(z13);
                            } else {
                                tVar2.b0(-392211906);
                                y2Var = y2VarA;
                                objM = b0.n1.a(j11, c0.f.i(aVar == aVar2 ? 100 : 50, z13 ? 1 : 0, null, 6), tVar2, 0, 12);
                                tVar2.p(z13);
                            }
                            Object obj2 = objM;
                            if (z11) {
                                int iOrdinal7 = aVar.ordinal();
                                if (iOrdinal7 == 0) {
                                    j12 = x0Var.f74215j;
                                } else if (iOrdinal7 == 1) {
                                    j12 = x0Var.f74216k;
                                } else {
                                    if (iOrdinal7 != 2) {
                                        throw new NoWhenBranchMatchedException();
                                    }
                                    j12 = x0Var.f74217l;
                                }
                            } else {
                                int iOrdinal8 = aVar.ordinal();
                                if (iOrdinal8 == 0) {
                                    j12 = x0Var.f74213h;
                                } else if (iOrdinal8 != 1) {
                                    if (iOrdinal8 != 2) {
                                        throw new NoWhenBranchMatchedException();
                                    }
                                    j12 = x0Var.f74213h;
                                } else {
                                    j12 = x0Var.f74214i;
                                }
                            }
                            if (z11) {
                                obj = obj2;
                                tVar2.b0(-1725635953);
                                objM2 = androidx.compose.runtime.d.m(new i2.s(j12), tVar2);
                                tVar2.p(z13);
                            } else {
                                tVar2.b0(-1725816497);
                                int i12 = aVar == aVar2 ? 100 : 50;
                                obj = obj2;
                                objM2 = b0.n1.a(j12, c0.f.i(i12, z13 ? 1 : 0, null, 6), tVar2, 0, 12);
                                tVar2.p(z13);
                            }
                            b2.t tVarK = androidx.compose.foundation.layout.e.k(androidx.compose.foundation.layout.e.x(tVar, b2.d.f17001e, 2), f73088b);
                            zF = tVar2.f(obj) | tVar2.f(objM2) | tVar2.f(y2Var) | tVar2.f(y1VarC) | tVar2.f(y1VarC2);
                            objP2 = tVar2.P();
                            if (!zF || objP2 == g1Var) {
                                objP2 = new z0(obj, objM2, y2Var, y1VarC, y1VarC2, w0Var, 0);
                                tVar2.m0(objP2);
                            }
                            ic.b.g(z13 ? 1 : 0, tVarK, (Function1) objP2, tVar2);
                        }
                    }
                    f13 = 0.0f;
                    tVar2.p(z12);
                    boolean z132 = z12;
                    f14 = f13;
                    y1VarC = c0.f2.c(c2VarE, fValueOf, fValueOf2, c0VarH, i2Var, tVar2, 0);
                    l3.a aVar52 = (l3.a) g2Var.c();
                    tVar2.b0(-1426969489);
                    iOrdinal2 = aVar52.ordinal();
                    if (iOrdinal2 != 0) {
                        f15 = f14;
                        tVar2.p(z132);
                        Float fValueOf32 = Float.valueOf(f15);
                        l3.a aVar62 = (l3.a) s2Var.getValue();
                        tVar2.b0(-1426969489);
                        iOrdinal3 = aVar62.ordinal();
                        if (iOrdinal3 != 0) {
                            f16 = f14;
                            tVar2.p(z132);
                            Float fValueOf42 = Float.valueOf(f16);
                            c0.w1 w1VarF22 = c2VarE.f();
                            tVar2.b0(-1324481169);
                            if (w1VarF22.b() != aVar2) {
                            }
                            tVar2.p(z132);
                            y1VarC2 = c0.f2.c(c2VarE, fValueOf32, fValueOf42, c0VarG, i2Var, tVar2, 0);
                            tVar2 = tVar2;
                            objP = tVar2.P();
                            g1Var = p1.n.f81514a;
                            if (objP == g1Var) {
                            }
                            w0Var = (w0) objP;
                            x0Var.getClass();
                            p1.y2 y2VarA2 = b0.n1.a(aVar != aVar2 ? x0Var.f74207b : x0Var.f74206a, c0.f.i(aVar != aVar2 ? 100 : 50, z132 ? 1 : 0, null, 6), tVar2, 0, 12);
                            if (z11) {
                            }
                            if (z11) {
                            }
                            Object obj22 = objM;
                            if (z11) {
                            }
                            if (z11) {
                            }
                            b2.t tVarK2 = androidx.compose.foundation.layout.e.k(androidx.compose.foundation.layout.e.x(tVar, b2.d.f17001e, 2), f73088b);
                            zF = tVar2.f(obj) | tVar2.f(objM2) | tVar2.f(y2Var) | tVar2.f(y1VarC) | tVar2.f(y1VarC2);
                            objP2 = tVar2.P();
                            if (!zF) {
                                objP2 = new z0(obj, objM2, y2Var, y1VarC, y1VarC2, w0Var, 0);
                                tVar2.m0(objP2);
                                ic.b.g(z132 ? 1 : 0, tVarK2, (Function1) objP2, tVar2);
                            }
                        }
                    }
                } else if (iOrdinal != 1) {
                    if (iOrdinal != 2) {
                        throw new NoWhenBranchMatchedException();
                    }
                    f12 = 1.0f;
                    tVar2.p(false);
                    Float fValueOf22 = Float.valueOf(f12);
                    c0.w1 w1VarF3 = c2VarE.f();
                    tVar2.b0(1373301606);
                    objB = w1VarF3.b();
                    aVar2 = l3.a.f74631b;
                    if (objB == aVar2) {
                    }
                    f13 = 0.0f;
                    tVar2.p(z12);
                    boolean z1322 = z12;
                    f14 = f13;
                    y1VarC = c0.f2.c(c2VarE, fValueOf, fValueOf22, c0VarH, i2Var, tVar2, 0);
                    l3.a aVar522 = (l3.a) g2Var.c();
                    tVar2.b0(-1426969489);
                    iOrdinal2 = aVar522.ordinal();
                    if (iOrdinal2 != 0) {
                    }
                } else {
                    f12 = 0.0f;
                    tVar2.p(false);
                    Float fValueOf222 = Float.valueOf(f12);
                    c0.w1 w1VarF32 = c2VarE.f();
                    tVar2.b0(1373301606);
                    objB = w1VarF32.b();
                    aVar2 = l3.a.f74631b;
                    if (objB == aVar2) {
                    }
                    f13 = 0.0f;
                    tVar2.p(z12);
                    boolean z13222 = z12;
                    f14 = f13;
                    y1VarC = c0.f2.c(c2VarE, fValueOf, fValueOf222, c0VarH, i2Var, tVar2, 0);
                    l3.a aVar5222 = (l3.a) g2Var.c();
                    tVar2.b0(-1426969489);
                    iOrdinal2 = aVar5222.ordinal();
                    if (iOrdinal2 != 0) {
                    }
                }
            } else if (iOrdinal4 != 1) {
                if (iOrdinal4 != 2) {
                    throw new NoWhenBranchMatchedException();
                }
                f11 = 1.0f;
                tVar2.p(false);
                Float fValueOf5 = Float.valueOf(f11);
                p1.s2 s2Var2 = (p1.s2) e1Var;
                l3.a aVar42 = (l3.a) s2Var2.getValue();
                tVar2.b0(1800065638);
                iOrdinal = aVar42.ordinal();
                if (iOrdinal == 0) {
                }
            } else {
                f11 = 0.0f;
                tVar2.p(false);
                Float fValueOf52 = Float.valueOf(f11);
                p1.s2 s2Var22 = (p1.s2) e1Var;
                l3.a aVar422 = (l3.a) s2Var22.getValue();
                tVar2.b0(1800065638);
                iOrdinal = aVar422.ordinal();
                if (iOrdinal == 0) {
                }
            }
        }
        p1.t1 t1VarU = tVar2.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new a1(z11, aVar, tVar, x0Var, i5, 0);
        }
    }

    public static final void c(l3.a aVar, Function0 function0, b2.t tVar, boolean z11, x0 x0Var, p1.o oVar, int i5) {
        int i11;
        l3.a aVar2;
        boolean z12;
        x0 x0Var2;
        p1.t tVar2 = (p1.t) oVar;
        tVar2.d0(-1608358065);
        if ((i5 & 6) == 0) {
            i11 = (tVar2.f(aVar) ? 4 : 2) | i5;
        } else {
            i11 = i5;
        }
        if ((i5 & 48) == 0) {
            i11 |= tVar2.h(function0) ? 32 : 16;
        }
        if ((i5 & 384) == 0) {
            i11 |= tVar2.f(tVar) ? 256 : 128;
        }
        if ((i5 & 3072) == 0) {
            i11 |= tVar2.g(z11) ? 2048 : 1024;
        }
        if ((i5 & 24576) == 0) {
            i11 |= tVar2.f(x0Var) ? ReaderJsonLexerKt.BATCH_SIZE : UserMetadata.MAX_INTERNAL_KEY_SIZE;
        }
        if ((196608 & i5) == 0) {
            i11 |= tVar2.f(null) ? SQLiteDatabase.OPEN_SHAREDCACHE : SQLiteDatabase.OPEN_FULLMUTEX;
        }
        if ((74899 & i11) == 74898 && tVar2.E()) {
            tVar2.V();
            aVar2 = aVar;
            x0Var2 = x0Var;
            z12 = z11;
        } else {
            tVar2.X();
            if ((i5 & 1) != 0 && !tVar2.B()) {
                tVar2.V();
            }
            tVar2.q();
            tVar2.b0(-97239746);
            b2.t tVar3 = b2.r.f17024a;
            b2.t tVarC = function0 != null ? androidx.compose.foundation.selection.d.c(q5.a(false, o1.a.f78921a / 2, 0L, tVar2, 54, 4), new j3.h(1), function0, aVar, z11) : tVar3;
            tVar2.p(false);
            if (function0 != null) {
                p1.z2 z2Var = c3.f73102a;
                tVar3 = MinimumInteractiveModifier.f14086b;
            }
            aVar2 = aVar;
            b(z11, aVar2, androidx.compose.foundation.layout.d.j(tVar.then(tVar3).then(tVarC), f73087a), x0Var, tVar2, ((i11 >> 9) & 14) | ((i11 << 3) & 112) | ((i11 >> 3) & 7168));
            z12 = z11;
            x0Var2 = x0Var;
        }
        p1.t1 t1VarU = tVar2.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new b1(aVar2, function0, tVar, z12, x0Var2, i5);
        }
    }
}
