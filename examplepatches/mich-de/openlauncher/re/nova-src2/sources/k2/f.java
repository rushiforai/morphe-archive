package k2;

import com.amplitude.eventbridge.EventBridgeChannel;
import i2.c0;
import i2.n0;
import i2.o0;
import i2.p;
import i2.t;
import java.util.List;
import y3.n;

/* loaded from: classes.dex */
public interface f extends y3.c {
    static /* synthetic */ void C(f fVar, p pVar, long j11, long j12, long j13, g gVar, int i5) {
        long j14 = (i5 & 2) != 0 ? 0L : j11;
        fVar.mo91drawRoundRectZuiqVtQ(pVar, j14, (i5 & 4) != 0 ? G(fVar.mo94getSizeNHjbRc(), j14) : j12, j13, 1.0f, (i5 & 32) != 0 ? j.f70871a : gVar, null, 3);
    }

    static long G(long j11, long j12) {
        float fIntBitsToFloat = Float.intBitsToFloat((int) (j11 >> 32)) - Float.intBitsToFloat((int) (j12 >> 32));
        float fIntBitsToFloat2 = Float.intBitsToFloat((int) (j11 & 4294967295L)) - Float.intBitsToFloat((int) (j12 & 4294967295L));
        return (Float.floatToRawIntBits(fIntBitsToFloat) << 32) | (Float.floatToRawIntBits(fIntBitsToFloat2) & 4294967295L);
    }

    static /* synthetic */ void J(f fVar, c0 c0Var, long j11, t tVar, int i5) {
        if ((i5 & 2) != 0) {
            j11 = 0;
        }
        long j12 = j11;
        if ((i5 & 16) != 0) {
            tVar = null;
        }
        fVar.mo83drawImagegbVJVH8(c0Var, j12, 1.0f, j.f70871a, tVar, 3);
    }

    static void L(f fVar, c0 c0Var, long j11, long j12, float f11, t tVar, int i5, int i11) {
        fVar.mo82drawImageAZ2fEMs(c0Var, 0L, j11, 0L, (i11 & 16) != 0 ? j11 : j12, (i11 & 32) != 0 ? 1.0f : f11, j.f70871a, tVar, 3, (i11 & EventBridgeChannel.QUEUE_CAPACITY) != 0 ? 1 : i5);
    }

    static /* synthetic */ void d(f fVar, n0 n0Var, p pVar, float f11, k kVar, int i5) {
        if ((i5 & 4) != 0) {
            f11 = 1.0f;
        }
        float f12 = f11;
        g gVar = kVar;
        if ((i5 & 8) != 0) {
            gVar = j.f70871a;
        }
        fVar.mo86drawPathGBMwjPU(n0Var, pVar, f12, gVar, null, (i5 & 32) != 0 ? 3 : 0);
    }

    static /* synthetic */ void e(f fVar, n0 n0Var, long j11, float f11, k kVar, int i5) {
        if ((i5 & 4) != 0) {
            f11 = 1.0f;
        }
        float f12 = f11;
        g gVar = kVar;
        if ((i5 & 8) != 0) {
            gVar = j.f70871a;
        }
        fVar.mo87drawPathLG529CI(n0Var, j11, f12, gVar, null, 3);
    }

    static /* synthetic */ void h(f fVar, p pVar, long j11, long j12, float f11, g gVar, int i5) {
        if ((i5 & 2) != 0) {
            j11 = 0;
        }
        long j13 = j11;
        fVar.mo89drawRectAsUm42w(pVar, j13, (i5 & 4) != 0 ? G(fVar.mo94getSizeNHjbRc(), j13) : j12, (i5 & 8) != 0 ? 1.0f : f11, (i5 & 16) != 0 ? j.f70871a : gVar, null, (i5 & 64) != 0 ? 3 : 13);
    }

    static /* synthetic */ void s(f fVar, long j11, long j12, long j13, float f11, t tVar, int i5) {
        long j14 = (i5 & 2) != 0 ? 0L : j12;
        fVar.mo90drawRectnJ9OG0(j11, j14, (i5 & 4) != 0 ? G(fVar.mo94getSizeNHjbRc(), j14) : j13, (i5 & 8) != 0 ? 1.0f : f11, j.f70871a, (i5 & 32) != 0 ? null : tVar, (i5 & 64) != 0 ? 3 : 0);
    }

    /* renamed from: drawArc-yD3GUKo */
    void mo80drawArcyD3GUKo(long j11, float f11, float f12, boolean z11, long j12, long j13, float f13, g gVar, t tVar, int i5);

    /* renamed from: drawCircle-VaOC9Bg */
    void mo81drawCircleVaOC9Bg(long j11, float f11, long j12, float f12, g gVar, t tVar, int i5);

    /* renamed from: drawImage-AZ2fEMs */
    void mo82drawImageAZ2fEMs(c0 c0Var, long j11, long j12, long j13, long j14, float f11, g gVar, t tVar, int i5, int i11);

    /* renamed from: drawImage-gbVJVH8 */
    void mo83drawImagegbVJVH8(c0 c0Var, long j11, float f11, g gVar, t tVar, int i5);

    /* renamed from: drawLine-1RTmtNc */
    void mo84drawLine1RTmtNc(p pVar, long j11, long j12, float f11, int i5, o0 o0Var, float f12, t tVar, int i11);

    /* renamed from: drawLine-NGM6Ib0 */
    void mo85drawLineNGM6Ib0(long j11, long j12, long j13, float f11, int i5, o0 o0Var, float f12, t tVar, int i11);

    /* renamed from: drawPath-GBMwjPU */
    void mo86drawPathGBMwjPU(n0 n0Var, p pVar, float f11, g gVar, t tVar, int i5);

    /* renamed from: drawPath-LG529CI */
    void mo87drawPathLG529CI(n0 n0Var, long j11, float f11, g gVar, t tVar, int i5);

    /* renamed from: drawPoints-F8ZwMP8 */
    void mo88drawPointsF8ZwMP8(List list, int i5, long j11, float f11, int i11, o0 o0Var, float f12, t tVar, int i12);

    /* renamed from: drawRect-AsUm42w */
    void mo89drawRectAsUm42w(p pVar, long j11, long j12, float f11, g gVar, t tVar, int i5);

    /* renamed from: drawRect-n-J9OG0 */
    void mo90drawRectnJ9OG0(long j11, long j12, long j13, float f11, g gVar, t tVar, int i5);

    /* renamed from: drawRoundRect-ZuiqVtQ */
    void mo91drawRoundRectZuiqVtQ(p pVar, long j11, long j12, long j13, float f11, g gVar, t tVar, int i5);

    /* renamed from: drawRoundRect-u-Aw5IA */
    void mo92drawRoundRectuAw5IA(long j11, long j12, long j13, long j14, g gVar, float f11, t tVar, int i5);

    /* renamed from: getCenter-F1C5BW0 */
    default long mo93getCenterF1C5BW0() {
        return fg.a.q(getDrawContext().mo111getSizeNHjbRc());
    }

    d getDrawContext();

    n getLayoutDirection();

    /* renamed from: getSize-NH-jbRc */
    default long mo94getSizeNHjbRc() {
        return getDrawContext().mo111getSizeNHjbRc();
    }
}
