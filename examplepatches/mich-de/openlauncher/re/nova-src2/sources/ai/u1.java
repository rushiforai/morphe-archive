package ai;

import ads_mobile_sdk.db0;
import ads_mobile_sdk.fl2;
import ads_mobile_sdk.gu0;
import ads_mobile_sdk.qw2;
import ads_mobile_sdk.ti3;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.os.Bundle;
import b.kc;
import b.u4;
import java.util.ArrayList;
import java.util.List;
import kotlin.coroutines.Continuation;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes3.dex */
public abstract class u1 implements w1, fe.l1, mk.a {

    /* renamed from: a, reason: collision with root package name */
    public final Object f13368a;

    public /* synthetic */ u1(Object obj) {
        this.f13368a = obj;
    }

    public void A(fe.u0 u0Var) {
        xk.r2 r2VarS = xk.v0.s(u0Var);
        fe.a0 a0Var = (fe.a0) this;
        a0Var.s0();
        ArrayList arrayList = new ArrayList();
        for (int i5 = 0; i5 < r2VarS.f96009d; i5++) {
            arrayList.add(a0Var.f54698q.a((fe.u0) r2VarS.get(i5)));
        }
        a0Var.h0(arrayList);
    }

    public boolean B(String preloadId, ni.a0 a0Var, ni.z zVar) {
        Intrinsics.g(preloadId, "preloadId");
        b.b4.f15783a.getClass();
        fl2 fl2Var = (fl2) ((db0) gu0.a()).f2356v1.get();
        qw2 qw2Var = (qw2) this.f13368a;
        fl2Var.getClass();
        return ((Boolean) t70.m0.u(new ti3(), new c0.b1(a0Var, qw2Var, fl2Var, preloadId, zVar, (Continuation) null, 3))).booleanValue();
    }

    public abstract void C(int i5);

    public void D() {
        k1 k1Var = ((m1) this.f13368a).f13139g;
        m1.l(k1Var);
        k1Var.D();
    }

    @Override // ai.w1
    public kc a() {
        throw null;
    }

    @Override // ai.w1
    public o0 b() {
        throw null;
    }

    @Override // ai.w1
    public k1 c() {
        throw null;
    }

    @Override // ai.w1
    public Context d() {
        throw null;
    }

    @Override // ai.w1
    public xg.a e() {
        throw null;
    }

    public abstract void g(Canvas canvas, Rect rect, float f11, boolean z11, boolean z12);

    public com.facebook.shimmer.c h() {
        com.facebook.shimmer.c cVar = (com.facebook.shimmer.c) this.f13368a;
        int[] iArr = cVar.f27534b;
        int i5 = cVar.f27538f;
        if (i5 != 1) {
            int i11 = cVar.f27537e;
            iArr[0] = i11;
            int i12 = cVar.f27536d;
            iArr[1] = i12;
            iArr[2] = i12;
            iArr[3] = i11;
        } else {
            int i13 = cVar.f27536d;
            iArr[0] = i13;
            iArr[1] = i13;
            int i14 = cVar.f27537e;
            iArr[2] = i14;
            iArr[3] = i14;
        }
        float[] fArr = cVar.f27533a;
        if (i5 != 1) {
            fArr[0] = Math.max(((1.0f - cVar.f27543k) - cVar.f27544l) / 2.0f, 0.0f);
            fArr[1] = Math.max(((1.0f - cVar.f27543k) - 0.001f) / 2.0f, 0.0f);
            fArr[2] = Math.min(((cVar.f27543k + 1.0f) + 0.001f) / 2.0f, 1.0f);
            fArr[3] = Math.min(((cVar.f27543k + 1.0f) + cVar.f27544l) / 2.0f, 1.0f);
            return cVar;
        }
        fArr[0] = 0.0f;
        fArr[1] = Math.min(cVar.f27543k, 1.0f);
        fArr[2] = Math.min(cVar.f27543k + cVar.f27544l, 1.0f);
        fArr[3] = 1.0f;
        return cVar;
    }

    public u1 i(TypedArray typedArray) {
        com.facebook.shimmer.c cVar = (com.facebook.shimmer.c) this.f13368a;
        if (typedArray.hasValue(3)) {
            cVar.n = typedArray.getBoolean(3, cVar.n);
        }
        if (typedArray.hasValue(0)) {
            cVar.o = typedArray.getBoolean(0, cVar.o);
        }
        if (typedArray.hasValue(1)) {
            cVar.f27537e = (((int) (Math.min(1.0f, Math.max(0.0f, typedArray.getFloat(1, 0.3f))) * 255.0f)) << 24) | (cVar.f27537e & 16777215);
        }
        if (typedArray.hasValue(11)) {
            cVar.f27536d = (((int) (Math.min(1.0f, Math.max(0.0f, typedArray.getFloat(11, 1.0f))) * 255.0f)) << 24) | (16777215 & cVar.f27536d);
        }
        if (typedArray.hasValue(7)) {
            long j11 = typedArray.getInt(7, (int) cVar.f27549s);
            if (j11 < 0) {
                throw new IllegalArgumentException(u4.g(j11, "Given a negative duration: "));
            }
            cVar.f27549s = j11;
        }
        if (typedArray.hasValue(14)) {
            cVar.f27547q = typedArray.getInt(14, cVar.f27547q);
        }
        if (typedArray.hasValue(15)) {
            long j12 = typedArray.getInt(15, (int) cVar.f27550t);
            if (j12 < 0) {
                throw new IllegalArgumentException(u4.g(j12, "Given a negative repeat delay: "));
            }
            cVar.f27550t = j12;
        }
        if (typedArray.hasValue(16)) {
            cVar.f27548r = typedArray.getInt(16, cVar.f27548r);
        }
        if (typedArray.hasValue(5)) {
            int i5 = typedArray.getInt(5, cVar.f27535c);
            if (i5 == 1) {
                cVar.f27535c = 1;
            } else if (i5 == 2) {
                cVar.f27535c = 2;
            } else if (i5 != 3) {
                cVar.f27535c = 0;
            } else {
                cVar.f27535c = 3;
            }
        }
        if (typedArray.hasValue(17)) {
            if (typedArray.getInt(17, cVar.f27538f) != 1) {
                cVar.f27538f = 0;
            } else {
                cVar.f27538f = 1;
            }
        }
        if (typedArray.hasValue(6)) {
            float f11 = typedArray.getFloat(6, cVar.f27544l);
            if (f11 < 0.0f) {
                throw new IllegalArgumentException("Given invalid dropoff value: " + f11);
            }
            cVar.f27544l = f11;
        }
        if (typedArray.hasValue(9)) {
            int dimensionPixelSize = typedArray.getDimensionPixelSize(9, cVar.f27539g);
            if (dimensionPixelSize < 0) {
                throw new IllegalArgumentException(b.c0.h(dimensionPixelSize, "Given invalid width: "));
            }
            cVar.f27539g = dimensionPixelSize;
        }
        if (typedArray.hasValue(8)) {
            int dimensionPixelSize2 = typedArray.getDimensionPixelSize(8, cVar.f27540h);
            if (dimensionPixelSize2 < 0) {
                throw new IllegalArgumentException(b.c0.h(dimensionPixelSize2, "Given invalid height: "));
            }
            cVar.f27540h = dimensionPixelSize2;
        }
        if (typedArray.hasValue(13)) {
            float f12 = typedArray.getFloat(13, cVar.f27543k);
            if (f12 < 0.0f) {
                throw new IllegalArgumentException("Given invalid intensity value: " + f12);
            }
            cVar.f27543k = f12;
        }
        if (typedArray.hasValue(19)) {
            float f13 = typedArray.getFloat(19, cVar.f27541i);
            if (f13 < 0.0f) {
                throw new IllegalArgumentException("Given invalid width ratio: " + f13);
            }
            cVar.f27541i = f13;
        }
        if (typedArray.hasValue(10)) {
            float f14 = typedArray.getFloat(10, cVar.f27542j);
            if (f14 < 0.0f) {
                throw new IllegalArgumentException("Given invalid height ratio: " + f14);
            }
            cVar.f27542j = f14;
        }
        if (typedArray.hasValue(18)) {
            cVar.f27545m = typedArray.getFloat(18, cVar.f27545m);
        }
        return r();
    }

    public abstract void j(Canvas canvas, Paint paint, int i5, int i11);

    public abstract void k(Canvas canvas, Paint paint, wj.m mVar, int i5);

    public abstract void l(Canvas canvas, Paint paint, float f11, float f12, int i5, int i11, int i12);

    public abstract List m();

    public boolean n() {
        return false;
    }

    public abstract int o();

    @Override // mk.a
    public void onDismissed(Bundle bundle) {
        ((x7.c) this.f13368a).onDismissed(bundle);
    }

    @Override // mk.a
    public void onError(Bundle bundle) {
        ((x7.c) this.f13368a).onError(bundle);
    }

    @Override // mk.a
    public void onShown(Bundle bundle) {
        ((x7.c) this.f13368a).onShown(bundle);
    }

    public abstract int p();

    public abstract int q();

    public abstract u1 r();

    public boolean s(String preloadId) {
        Intrinsics.g(preloadId, "preloadId");
        b.b4.f15783a.getClass();
        fl2 fl2Var = (fl2) ((db0) gu0.a()).f2356v1.get();
        qw2 requestType = (qw2) this.f13368a;
        fl2Var.getClass();
        Intrinsics.g(requestType, "requestType");
        return ((Boolean) t70.m0.u(new ti3(), new c3.a4(requestType, fl2Var, preloadId, null))).booleanValue();
    }

    public boolean t(int i5) {
        fe.a0 a0Var = (fe.a0) this;
        a0Var.s0();
        return a0Var.O.f54833a.f94322a.get(i5);
    }

    public boolean u() {
        fe.a0 a0Var = (fe.a0) this;
        fe.z1 z1VarO = a0Var.O();
        return !z1VarO.p() && z1VarO.m(a0Var.L(), (fe.y1) this.f13368a, 0L).f55105h;
    }

    public boolean v() {
        fe.a0 a0Var = (fe.a0) this;
        fe.z1 z1VarO = a0Var.O();
        return !z1VarO.p() && z1VarO.m(a0Var.L(), (fe.y1) this.f13368a, 0L).a();
    }

    public boolean w() {
        fe.a0 a0Var = (fe.a0) this;
        fe.z1 z1VarO = a0Var.O();
        return !z1VarO.p() && z1VarO.m(a0Var.L(), (fe.y1) this.f13368a, 0L).f55104g;
    }

    public void x() {
        int iE;
        int iE2;
        fe.a0 a0Var = (fe.a0) this;
        if (a0Var.O().p() || a0Var.X()) {
            return;
        }
        fe.z1 z1VarO = a0Var.O();
        if (z1VarO.p()) {
            iE = -1;
        } else {
            int iL = a0Var.L();
            a0Var.s0();
            int i5 = a0Var.F;
            if (i5 == 1) {
                i5 = 0;
            }
            a0Var.s0();
            iE = z1VarO.e(iL, i5, a0Var.G);
        }
        if (!(iE != -1)) {
            if (v() && u()) {
                int iL2 = a0Var.L();
                a0Var.s0();
                a0Var.f0(-9223372036854775807L, iL2, false);
                return;
            }
            return;
        }
        fe.z1 z1VarO2 = a0Var.O();
        if (z1VarO2.p()) {
            iE2 = -1;
        } else {
            int iL3 = a0Var.L();
            a0Var.s0();
            int i11 = a0Var.F;
            if (i11 == 1) {
                i11 = 0;
            }
            a0Var.s0();
            iE2 = z1VarO2.e(iL3, i11, a0Var.G);
        }
        if (iE2 == -1) {
            return;
        }
        if (iE2 == a0Var.L()) {
            a0Var.s0();
            a0Var.f0(-9223372036854775807L, a0Var.L(), true);
        } else {
            a0Var.s0();
            a0Var.f0(-9223372036854775807L, iE2, false);
        }
    }

    public void y(long j11) {
        fe.a0 a0Var = (fe.a0) this;
        long jM = a0Var.M() + j11;
        long jR = a0Var.R();
        if (jR != -9223372036854775807L) {
            jM = Math.min(jM, jR);
        }
        long jMax = Math.max(jM, 0L);
        int iL = a0Var.L();
        a0Var.s0();
        a0Var.f0(jMax, iL, false);
    }

    public void z() {
        int iK;
        int iK2;
        int iK3;
        fe.a0 a0Var = (fe.a0) this;
        if (a0Var.O().p() || a0Var.X()) {
            return;
        }
        fe.z1 z1VarO = a0Var.O();
        if (z1VarO.p()) {
            iK = -1;
        } else {
            int iL = a0Var.L();
            a0Var.s0();
            int i5 = a0Var.F;
            if (i5 == 1) {
                i5 = 0;
            }
            a0Var.s0();
            iK = z1VarO.k(iL, i5, a0Var.G);
        }
        boolean z11 = iK != -1;
        if (v() && !w()) {
            if (z11) {
                fe.z1 z1VarO2 = a0Var.O();
                if (z1VarO2.p()) {
                    iK3 = -1;
                } else {
                    int iL2 = a0Var.L();
                    a0Var.s0();
                    int i11 = a0Var.F;
                    if (i11 == 1) {
                        i11 = 0;
                    }
                    a0Var.s0();
                    iK3 = z1VarO2.k(iL2, i11, a0Var.G);
                }
                if (iK3 == -1) {
                    return;
                }
                if (iK3 == a0Var.L()) {
                    a0Var.s0();
                    a0Var.f0(-9223372036854775807L, a0Var.L(), true);
                    return;
                } else {
                    a0Var.s0();
                    a0Var.f0(-9223372036854775807L, iK3, false);
                    return;
                }
            }
            return;
        }
        if (z11) {
            long jM = a0Var.M();
            a0Var.s0();
            if (jM <= 3000) {
                fe.z1 z1VarO3 = a0Var.O();
                if (z1VarO3.p()) {
                    iK2 = -1;
                } else {
                    int iL3 = a0Var.L();
                    a0Var.s0();
                    int i12 = a0Var.F;
                    if (i12 == 1) {
                        i12 = 0;
                    }
                    a0Var.s0();
                    iK2 = z1VarO3.k(iL3, i12, a0Var.G);
                }
                if (iK2 == -1) {
                    return;
                }
                if (iK2 == a0Var.L()) {
                    a0Var.s0();
                    a0Var.f0(-9223372036854775807L, a0Var.L(), true);
                    return;
                } else {
                    a0Var.s0();
                    a0Var.f0(-9223372036854775807L, iK2, false);
                    return;
                }
            }
        }
        int iL4 = a0Var.L();
        a0Var.s0();
        a0Var.f0(0L, iL4, false);
    }

    public u1(m1 m1Var) {
        sg.w.h(m1Var);
        this.f13368a = m1Var;
    }

    public u1(int i5) {
        switch (i5) {
            case 2:
                this.f13368a = new fe.y1();
                break;
            default:
                this.f13368a = new com.facebook.shimmer.c();
                break;
        }
    }
}
