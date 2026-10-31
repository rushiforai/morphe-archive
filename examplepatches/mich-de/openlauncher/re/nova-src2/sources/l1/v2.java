package l1;

import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import kotlin.coroutines.Continuation;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;

/* loaded from: classes2.dex */
public abstract class v2 {
    static {
        c0.w wVar = o1.q.f79146b;
        b0.g1 g1VarE = b0.z0.e(c0.f.i(100, 0, wVar, 2), 2);
        c0.w wVar2 = o1.q.f79145a;
        g1VarE.a(b0.z0.h(c0.f.i(500, 0, wVar2, 2), 12));
        b0.z0.d(new c0.h2(200, 100, wVar), 2).a(b0.z0.a(c0.f.i(500, 0, wVar2, 2), 12));
    }

    public static final void a(Function0 function0, b2.t tVar, i2.v0 v0Var, long j11, long j12, q2 q2Var, x1.e eVar, p1.o oVar, int i5, int i11) {
        int i12;
        i2.v0 v0VarA;
        long jE;
        long jB;
        b2.t tVar2;
        i2.v0 v0Var2;
        int i13;
        q2 q2Var2;
        int i14;
        b2.t tVar3;
        p1.t tVar4;
        b2.t tVar5;
        q2 q2Var3;
        int i15;
        p1.t tVar6 = (p1.t) oVar;
        tVar6.d0(-731723913);
        if ((i5 & 6) == 0) {
            i12 = (tVar6.h(function0) ? 4 : 2) | i5;
        } else {
            i12 = i5;
        }
        int i16 = i12 | 48;
        if ((i5 & 384) == 0) {
            if ((i11 & 4) == 0) {
                v0VarA = v0Var;
                int i17 = tVar6.f(v0VarA) ? 256 : 128;
                i16 |= i17;
            } else {
                v0VarA = v0Var;
            }
            i16 |= i17;
        } else {
            v0VarA = v0Var;
        }
        if ((i5 & 3072) == 0) {
            if ((i11 & 8) == 0) {
                jE = j11;
                int i18 = tVar6.e(jE) ? 2048 : 1024;
                i16 |= i18;
            } else {
                jE = j11;
            }
            i16 |= i18;
        } else {
            jE = j11;
        }
        if ((i5 & 24576) == 0) {
            if ((i11 & 16) == 0) {
                jB = j12;
                if (tVar6.e(jB)) {
                    i15 = ReaderJsonLexerKt.BATCH_SIZE;
                }
                i16 |= i15;
            } else {
                jB = j12;
            }
            i15 = UserMetadata.MAX_INTERNAL_KEY_SIZE;
            i16 |= i15;
        } else {
            jB = j12;
        }
        if ((196608 & i5) == 0) {
            i16 |= SQLiteDatabase.OPEN_FULLMUTEX;
        }
        int i19 = i16 | 1572864;
        if ((12582912 & i5) == 0) {
            i19 |= tVar6.h(eVar) ? 8388608 : 4194304;
        }
        if ((4793491 & i19) == 4793490 && tVar6.E()) {
            tVar6.V();
            tVar5 = tVar;
            q2Var3 = q2Var;
            tVar4 = tVar6;
        } else {
            tVar6.X();
            if ((i5 & 1) == 0 || tVar6.B()) {
                if ((i11 & 4) != 0) {
                    int i21 = o2.f73730a;
                    v0VarA = a6.a(tVar6, o1.j.f79085c);
                    i19 &= -897;
                }
                if ((i11 & 8) != 0) {
                    int i22 = o2.f73730a;
                    float f11 = o1.j.f79083a;
                    jE = g1.e(tVar6, 27);
                    i19 &= -7169;
                }
                if ((i11 & 16) != 0) {
                    jB = g1.b(jE, tVar6);
                    i19 &= -57345;
                }
                int i23 = o2.f73730a;
                q2 q2Var4 = new q2(o1.j.f79083a, o1.j.f79089g, o1.j.f79087e, o1.j.f79088f);
                tVar2 = b2.r.f17024a;
                v0Var2 = v0VarA;
                i13 = i19 & (-458753);
                q2Var2 = q2Var4;
            } else {
                tVar6.V();
                if ((i11 & 4) != 0) {
                    i19 &= -897;
                }
                if ((i11 & 8) != 0) {
                    i19 &= -7169;
                }
                if ((i11 & 16) != 0) {
                    i19 &= -57345;
                }
                tVar2 = tVar;
                v0Var2 = v0VarA;
                i13 = i19 & (-458753);
                q2Var2 = q2Var;
            }
            long j13 = jE;
            tVar6.q();
            tVar6.b0(519755085);
            Object objP = tVar6.P();
            p1.g1 g1Var = p1.n.f81514a;
            if (objP == g1Var) {
                objP = a2.c.d(tVar6);
            }
            i0.i iVar = (i0.i) objP;
            tVar6.p(false);
            b2.t tVarB = j3.n.b(tVar2, false, x.f74198m);
            float f12 = q2Var2.f73822a;
            boolean zF = tVar6.f(iVar);
            Object objP2 = tVar6.P();
            if (zF || objP2 == g1Var) {
                i14 = i13;
                tVar3 = tVar2;
                objP2 = new t2(q2Var2.f73822a, q2Var2.f73823b, q2Var2.f73825d, q2Var2.f73824c);
                tVar6.m0(objP2);
            } else {
                i14 = i13;
                tVar3 = tVar2;
            }
            t2 t2Var = (t2) objP2;
            boolean zH = tVar6.h(t2Var) | tVar6.f(q2Var2);
            Object objP3 = tVar6.P();
            Continuation continuation = null;
            if (zH || objP3 == g1Var) {
                objP3 = new h6.c(t2Var, q2Var2, continuation, 28);
                tVar6.m0(objP3);
            }
            p1.o0.f(q2Var2, (Function2) objP3, tVar6);
            boolean zF2 = tVar6.f(iVar) | tVar6.h(t2Var);
            Object objP4 = tVar6.P();
            if (zF2 || objP4 == g1Var) {
                objP4 = new kw.s3(iVar, t2Var, continuation, 2);
                tVar6.m0(objP4);
            }
            p1.o0.f(iVar, (Function2) objP4, tVar6);
            int i24 = i14 << 3;
            tVar4 = tVar6;
            t7.b(function0, tVarB, false, v0Var2, j13, jB, f12, ((y3.f) ((p1.s2) t2Var.f73995e.f18756c.f18878b).getValue()).f96602a, null, iVar, x1.f.d(1249316354, new m1.m0(jB, eVar, 2), tVar6), tVar4, (i14 & 14) | (i24 & 7168) | (57344 & i24) | (i24 & 458752), 260);
            tVar5 = tVar3;
            q2Var3 = q2Var2;
            v0VarA = v0Var2;
            jE = j13;
        }
        p1.t1 t1VarU = tVar4.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new u2(function0, tVar5, v0VarA, jE, jB, q2Var3, eVar, i5, i11);
        }
    }
}
