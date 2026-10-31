package v2;

import android.view.MotionEvent;
import e1.m0;
import kotlin.jvm.functions.Function1;

/* loaded from: classes2.dex */
public abstract class g0 {

    /* renamed from: a, reason: collision with root package name */
    public static final StackTraceElement[] f91930a = new StackTraceElement[0];

    public static final int a(boolean z11, boolean z12, boolean z13) {
        return (z11 ? 1 : 0) | ((z12 ? 1 : 0) << 1) | ((z13 ? 1 : 0) << 2);
    }

    public static final boolean b(t tVar) {
        return !tVar.f91997h && tVar.f91993d;
    }

    public static final boolean c(t tVar) {
        return (tVar.l() || !tVar.f91997h || tVar.f91993d) ? false : true;
    }

    public static final boolean d(t tVar) {
        return tVar.f91997h && !tVar.f91993d;
    }

    public static final void e(long j11, z zVar) {
        MotionEvent motionEventObtain = MotionEvent.obtain(j11, j11, 3, 0.0f, 0.0f, 0);
        motionEventObtain.setSource(0);
        zVar.invoke(motionEventObtain);
        motionEventObtain.recycle();
    }

    public static final boolean f(int i5, int i11) {
        return i5 == i11;
    }

    public static final boolean g(long j11, long j12) {
        return j11 == j12;
    }

    public static final boolean h(t tVar, long j11) {
        long j12 = tVar.f91992c;
        float fIntBitsToFloat = Float.intBitsToFloat((int) (j12 >> 32));
        float fIntBitsToFloat2 = Float.intBitsToFloat((int) (j12 & 4294967295L));
        int i5 = (int) (j11 >> 32);
        int i11 = (int) (j11 & 4294967295L);
        return (fIntBitsToFloat > ((float) i5)) | (fIntBitsToFloat < 0.0f) | (fIntBitsToFloat2 < 0.0f) | (fIntBitsToFloat2 > ((float) i11));
    }

    public static final boolean i(t tVar, long j11, long j12) {
        int i5 = tVar.f91998i == 1 ? 1 : 0;
        long j13 = tVar.f91992c;
        float fIntBitsToFloat = Float.intBitsToFloat((int) (j13 >> 32));
        float fIntBitsToFloat2 = Float.intBitsToFloat((int) (j13 & 4294967295L));
        float f11 = i5;
        float fIntBitsToFloat3 = Float.intBitsToFloat((int) (j12 >> 32)) * f11;
        float f12 = ((int) (j11 >> 32)) + fIntBitsToFloat3;
        float fIntBitsToFloat4 = Float.intBitsToFloat((int) (j12 & 4294967295L)) * f11;
        return (fIntBitsToFloat > f12) | (fIntBitsToFloat < (-fIntBitsToFloat3)) | (fIntBitsToFloat2 < (-fIntBitsToFloat4)) | (fIntBitsToFloat2 > ((int) (j11 & 4294967295L)) + fIntBitsToFloat4);
    }

    public static final long j(t tVar, boolean z11) {
        long jF = h2.b.f(tVar.f91992c, tVar.f91996g);
        if (z11 || !tVar.l()) {
            return jF;
        }
        return 0L;
    }

    public static final boolean k(t tVar) {
        return !h2.b.b(j(tVar, true), 0L);
    }

    public static final void l(m mVar, long j11, z zVar) {
        n(mVar, j11, zVar, true);
    }

    public static final void m(m mVar, long j11, b0.e eVar) {
        n(mVar, j11, eVar, false);
    }

    public static final void n(m mVar, long j11, Function1 function1, boolean z11) {
        m0 m0Var = mVar.f91976b;
        MotionEvent motionEventI = m0Var != null ? m0Var.i() : null;
        if (motionEventI == null) {
            throw new IllegalArgumentException("The PointerEvent receiver cannot have a null MotionEvent.");
        }
        int action = motionEventI.getAction();
        if (z11) {
            motionEventI.setAction(3);
        }
        int i5 = (int) (j11 >> 32);
        int i11 = (int) (j11 & 4294967295L);
        motionEventI.offsetLocation(-Float.intBitsToFloat(i5), -Float.intBitsToFloat(i11));
        function1.invoke(motionEventI);
        motionEventI.offsetLocation(Float.intBitsToFloat(i5), Float.intBitsToFloat(i11));
        motionEventI.setAction(action);
    }

    public static long o(MotionEvent motionEvent, int i5) {
        float rawX = motionEvent.getRawX(i5);
        float rawY = motionEvent.getRawY(i5);
        return (Float.floatToRawIntBits(rawY) & 4294967295L) | (Float.floatToRawIntBits(rawX) << 32);
    }
}
