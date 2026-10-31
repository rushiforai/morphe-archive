package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.rewardedcountdowntimer;

import c0.j0;
import f1.i3;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import p1.y2;

/* loaded from: classes4.dex */
public final /* synthetic */ class j implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f40072a = 2;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ float f40073b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ long f40074c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ long f40075d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Object f40076e;

    public /* synthetic */ j(float f11, long j11, long j12, j0 j0Var) {
        this.f40073b = f11;
        this.f40074c = j11;
        this.f40075d = j12;
        this.f40076e = j0Var;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f40072a) {
            case 0:
                break;
            case 1:
                k2.k kVar = (k2.k) this.f40076e;
                k2.f fVar = (k2.f) obj;
                float f11 = this.f40073b * 360.0f;
                i3.c(fVar, 0.0f, 360.0f, this.f40074c, kVar);
                i3.c(fVar, 270.0f, f11, this.f40075d, kVar);
                break;
            default:
                y2 y2Var = (y2) this.f40076e;
                k2.f Canvas = (k2.f) obj;
                Intrinsics.g(Canvas, "$this$Canvas");
                float fMo102toPx0680j_4 = Canvas.mo102toPx0680j_4(this.f40073b);
                float f12 = 2;
                Canvas.mo81drawCircleVaOC9Bg(this.f40074c, (h2.e.c(Canvas.mo94getSizeNHjbRc()) / f12) - (fMo102toPx0680j_4 / f12), (120 & 4) != 0 ? Canvas.mo93getCenterF1C5BW0() : 0L, 1.0f, (120 & 16) != 0 ? k2.j.f70871a : new k2.k(fMo102toPx0680j_4, 0.0f, 1, 0, 26), null, 3);
                float fFloatValue = ((Number) y2Var.getValue()).floatValue();
                k2.k kVar2 = new k2.k(fMo102toPx0680j_4, 0.0f, 1, 0, 26);
                float fIntBitsToFloat = Float.intBitsToFloat((int) (Canvas.mo94getSizeNHjbRc() >> 32)) - fMo102toPx0680j_4;
                float fIntBitsToFloat2 = Float.intBitsToFloat((int) (Canvas.mo94getSizeNHjbRc() & 4294967295L)) - fMo102toPx0680j_4;
                Canvas.mo80drawArcyD3GUKo(this.f40075d, fFloatValue, 90.0f, false, (832 & 16) != 0 ? 0L : (Float.floatToRawIntBits(r9) << 32) | (4294967295L & Float.floatToRawIntBits(r9)), (Float.floatToRawIntBits(fIntBitsToFloat) << 32) | (Float.floatToRawIntBits(fIntBitsToFloat2) & 4294967295L), (832 & 64) != 0 ? 1.0f : 0.0f, kVar2, null, 3);
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ j(float f11, long j11, k2.k kVar, long j12) {
        this.f40073b = f11;
        this.f40074c = j11;
        this.f40076e = kVar;
        this.f40075d = j12;
    }

    public /* synthetic */ j(long j11, float f11, c0.e eVar, long j12) {
        this.f40074c = j11;
        this.f40073b = f11;
        this.f40076e = eVar;
        this.f40075d = j12;
    }
}
