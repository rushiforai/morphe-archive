package l1;

import androidx.compose.runtime.snapshots.SnapshotStateList;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;

/* loaded from: classes2.dex */
public final class m6 {

    /* renamed from: a, reason: collision with root package name */
    public static final m6 f73645a = new m6();

    /* renamed from: b, reason: collision with root package name */
    public static final float f73646b;

    /* renamed from: c, reason: collision with root package name */
    public static final float f73647c;

    /* renamed from: d, reason: collision with root package name */
    public static final i2.h f73648d;

    static {
        float f11 = o1.z.f79196e;
        f73646b = f11;
        f73647c = f11;
        f73648d = i2.k.a();
    }

    public static h6 c(long j11, long j12, long j13, p1.o oVar) {
        long j14 = i2.s.f61147m;
        h6 h6VarE = e((d1) ((p1.t) oVar).j(g1.f73330a));
        long j15 = j11 != 16 ? j11 : h6VarE.f73384a;
        long j16 = j12 != 16 ? j12 : h6VarE.f73385b;
        long j17 = j14 != 16 ? j14 : h6VarE.f73386c;
        long j18 = j13 != 16 ? j13 : h6VarE.f73387d;
        long j19 = j14 != 16 ? j14 : h6VarE.f73388e;
        long j21 = j14 != 16 ? j14 : h6VarE.f73389f;
        long j22 = j14 != 16 ? j14 : h6VarE.f73390g;
        long j23 = j14 != 16 ? j14 : h6VarE.f73391h;
        long j24 = j14 != 16 ? j14 : h6VarE.f73392i;
        if (j14 == 16) {
            j14 = h6VarE.f73393j;
        }
        return new h6(j15, j16, j17, j18, j19, j21, j22, j23, j24, j14);
    }

    public static void d(k2.f fVar, long j11, long j12, long j13, float f11, float f12) {
        long jA = x7.f.a(f11, f11);
        long jA2 = x7.f.a(f12, f12);
        h2.c cVarP = bh.g.p(ab.e0.h(h2.b.d(j11), 0.0f), fg.a.b(h2.e.d(j12), h2.e.b(j12)));
        h2.d dVar = new h2.d(cVarP.f59018a, cVarP.f59019b, cVarP.f59020c, cVarP.f59021d, jA, jA2, jA2, jA);
        i2.h hVar = f73648d;
        i2.n0.a(hVar, dVar);
        k2.f.e(fVar, hVar, j13, 0.0f, null, 60);
        hVar.f61117a.rewind();
    }

    public static h6 e(d1 d1Var) {
        h6 h6Var = d1Var.V;
        if (h6Var != null) {
            return h6Var;
        }
        float f11 = o1.z.f79192a;
        h6 h6Var2 = new h6(g1.d(d1Var, 26), g1.d(d1Var, 26), g1.d(d1Var, 32), g1.d(d1Var, 32), g1.d(d1Var, 26), i2.r0.h(i2.s.b(0.38f, g1.d(d1Var, 18)), d1Var.f73161p), i2.s.b(0.38f, g1.d(d1Var, 18)), i2.s.b(0.12f, g1.d(d1Var, 18)), i2.s.b(0.12f, g1.d(d1Var, 18)), i2.s.b(0.38f, g1.d(d1Var, 18)));
        d1Var.V = h6Var2;
        return h6Var2;
    }

    public final void a(i0.i iVar, b2.t tVar, h6 h6Var, boolean z11, long j11, p1.o oVar, int i5) {
        long j12;
        b2.t tVar2;
        long jFloatToRawIntBits;
        long j13;
        b2.t tVar3;
        p1.t tVar4 = (p1.t) oVar;
        tVar4.d0(-290277409);
        int i11 = 2;
        int i12 = i5 | (tVar4.f(iVar) ? 4 : 2) | 48 | (tVar4.f(h6Var) ? 256 : 128) | (tVar4.g(z11) ? 2048 : 1024) | 24576;
        if ((74899 & i12) == 74898 && tVar4.E()) {
            tVar4.V();
            tVar3 = tVar;
            j13 = j11;
        } else {
            tVar4.X();
            if ((i5 & 1) == 0 || tVar4.B()) {
                j12 = w6.f74182c;
                tVar2 = b2.r.f17024a;
            } else {
                tVar4.V();
                tVar2 = tVar;
                j12 = j11;
            }
            tVar4.q();
            Object objP = tVar4.P();
            p1.g1 g1Var = p1.n.f81514a;
            if (objP == g1Var) {
                objP = new SnapshotStateList();
                tVar4.m0(objP);
            }
            SnapshotStateList snapshotStateList = (SnapshotStateList) objP;
            boolean z12 = (i12 & 14) == 4;
            Object objP2 = tVar4.P();
            if (z12 || objP2 == g1Var) {
                objP2 = new gy.l1(iVar, snapshotStateList, null, i11);
                tVar4.m0(objP2);
            }
            p1.o0.f(iVar, (Function2) objP2, tVar4);
            if (snapshotStateList.isEmpty()) {
                jFloatToRawIntBits = j12;
            } else {
                jFloatToRawIntBits = (Float.floatToRawIntBits(y3.i.b(j12) / 2) << 32) | (Float.floatToRawIntBits(y3.i.a(j12)) & 4294967295L);
            }
            b2.t tVarA = androidx.compose.foundation.d.a(androidx.compose.foundation.layout.e.p(tVar2, jFloatToRawIntBits), iVar);
            long j14 = z11 ? h6Var.f73384a : h6Var.f73389f;
            float f11 = o1.z.f79192a;
            k0.i2.b(androidx.compose.foundation.a.b(tVarA, j14, a6.a(tVar4, 5)), tVar4);
            j13 = j12;
            tVar3 = tVar2;
        }
        p1.t1 t1VarU = tVar4.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new j6(this, iVar, tVar3, h6Var, z11, j13, i5);
        }
    }

    public final void b(x6 x6Var, b2.t tVar, boolean z11, h6 h6Var, Function2 function2, Function3 function3, float f11, float f12, p1.o oVar, int i5) {
        int i11;
        float f13;
        float f14;
        int i12;
        b2.t tVar2;
        Function2 function22;
        Function3 function32;
        Function3 function33;
        long j11;
        b2.t tVar3;
        b2.t tVar4;
        Function3 function34;
        p1.t tVar5;
        float f15;
        float f16;
        float f17;
        float f18;
        Function2 function23;
        Function3 function35;
        b2.t tVar6;
        p1.t tVar7 = (p1.t) oVar;
        tVar7.d0(49984771);
        if ((i5 & 6) == 0) {
            i11 = (tVar7.h(x6Var) ? 4 : 2) | i5;
        } else {
            i11 = i5;
        }
        int i13 = i11 | 48;
        if ((i5 & 384) == 0) {
            i13 |= tVar7.g(z11) ? 256 : 128;
        }
        if ((i5 & 3072) == 0) {
            i13 |= tVar7.f(h6Var) ? 2048 : 1024;
        }
        if ((i5 & 24576) == 0) {
            i13 |= UserMetadata.MAX_INTERNAL_KEY_SIZE;
        }
        int i14 = i13 | 14352384;
        if ((100663296 & i5) == 0) {
            i14 |= tVar7.f(this) ? 67108864 : 33554432;
        }
        if ((38347923 & i14) == 38347922 && tVar7.E()) {
            tVar7.V();
            tVar6 = tVar;
            function23 = function2;
            function35 = function3;
            f17 = f11;
            f18 = f12;
            tVar5 = tVar7;
        } else {
            tVar7.X();
            int i15 = i5 & 1;
            Object obj = p1.n.f81514a;
            if (i15 == 0 || tVar7.B()) {
                boolean z12 = ((i14 & 896) == 256) | ((((i14 & 7168) ^ 3072) > 2048 && tVar7.f(h6Var)) || (i14 & 3072) == 2048);
                Object objP = tVar7.P();
                if (z12 || objP == obj) {
                    objP = new h.o(h6Var, z11);
                    tVar7.m0(objP);
                }
                Function2 function24 = (Function2) objP;
                j1 j1Var = j1.n;
                f13 = w6.f74183d;
                f14 = w6.f74184e;
                i12 = i14 & (-57345);
                tVar2 = b2.r.f17024a;
                function22 = function24;
                function32 = j1Var;
            } else {
                tVar7.V();
                function22 = function2;
                function32 = function3;
                f13 = f11;
                f14 = f12;
                i12 = i14 & (-57345);
                tVar2 = tVar;
            }
            tVar7.q();
            int i16 = i12;
            long jA = h6Var.a(z11, false);
            float f19 = f13;
            long jA2 = h6Var.a(z11, true);
            long j12 = z11 ? h6Var.f73388e : h6Var.f73393j;
            if (z11) {
                function33 = function32;
                j11 = h6Var.f73386c;
            } else {
                function33 = function32;
                j11 = h6Var.f73391h;
            }
            b2.t tVar8 = tVar2;
            float f21 = f14;
            b2.t tVarC0 = g90.k.c0(androidx.compose.foundation.layout.e.g(androidx.compose.foundation.layout.e.e(tVar2, 1.0f), w6.f74180a), tVar7.j(c3.z1.n) == y3.n.f96613b ? 180.0f : 0.0f);
            boolean zH = ((i16 & 3670016) == 1048576) | tVar7.h(x6Var) | tVar7.e(jA) | tVar7.e(jA2) | tVar7.e(j12) | tVar7.e(j11) | ((i16 & 29360128) == 8388608) | tVar7.f(function22) | ((i16 & 458752) == 131072);
            Object objP2 = tVar7.P();
            if (zH || objP2 == obj) {
                tVar3 = tVar8;
                long j13 = j11;
                tVar4 = tVarC0;
                function34 = function33;
                tVar5 = tVar7;
                long j14 = j12;
                f15 = f19;
                f16 = f21;
                Object k6Var = new k6(x6Var, jA, jA2, j14, j13, f15, f16, function22, function34);
                tVar5.m0(k6Var);
                objP2 = k6Var;
            } else {
                f15 = f19;
                function34 = function33;
                tVar3 = tVar8;
                f16 = f21;
                tVar5 = tVar7;
                tVar4 = tVarC0;
            }
            ic.b.g(0, tVar4, (Function1) objP2, tVar5);
            f17 = f15;
            f18 = f16;
            function23 = function22;
            function35 = function34;
            tVar6 = tVar3;
        }
        p1.t1 t1VarU = tVar5.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new l6(this, x6Var, tVar6, z11, h6Var, function23, function35, f17, f18, i5);
        }
    }
}
