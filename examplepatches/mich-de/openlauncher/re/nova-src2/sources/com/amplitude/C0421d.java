package com.amplitude;

import androidx.compose.ui.graphics.Canvas;
import kotlin.jvm.internal.Intrinsics;

/* renamed from: com.amplitude.d, reason: case insensitive filesystem */
/* loaded from: classes2.dex */
public final class C0421d implements k2.h {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ C0385b f20519a;

    public C0421d(C0385b c0385b) {
        this.f20519a = c0385b;
    }

    @Override // k2.h
    /* renamed from: clipPath-mtrdD-E, reason: not valid java name */
    public final void mo135clipPathmtrdDE(i2.n0 path, int i5) {
        Intrinsics.g(path, "path");
        this.f20519a.getCanvas().mo12clipPathmtrdDE(path, i5);
    }

    @Override // k2.h
    /* renamed from: clipRect-N_I0leg, reason: not valid java name */
    public final void mo136clipRectN_I0leg(float f11, float f12, float f13, float f14, int i5) {
        this.f20519a.getCanvas().mo13clipRectN_I0leg(f11, f12, f13, f14, i5);
    }

    /* renamed from: getCenter-F1C5BW0, reason: not valid java name */
    public final long m137getCenterF1C5BW0() {
        return fg.a.q(this.f20519a.mo111getSizeNHjbRc());
    }

    /* renamed from: getSize-NH-jbRc, reason: not valid java name */
    public final long m138getSizeNHjbRc() {
        return this.f20519a.mo111getSizeNHjbRc();
    }

    @Override // k2.h
    public final void inset(float f11, float f12, float f13, float f14) {
        Canvas canvas = this.f20519a.getCanvas();
        C0385b c0385b = this.f20519a;
        float fIntBitsToFloat = Float.intBitsToFloat((int) (c0385b.mo111getSizeNHjbRc() >> 32)) - (f13 + f11);
        float fIntBitsToFloat2 = Float.intBitsToFloat((int) (this.f20519a.mo111getSizeNHjbRc() & 4294967295L)) - (f14 + f12);
        long jFloatToRawIntBits = (Float.floatToRawIntBits(fIntBitsToFloat2) & 4294967295L) | (Float.floatToRawIntBits(fIntBitsToFloat) << 32);
        if (Float.intBitsToFloat((int) (jFloatToRawIntBits >> 32)) < 0.0f || Float.intBitsToFloat((int) (jFloatToRawIntBits & 4294967295L)) < 0.0f) {
            throw new IllegalArgumentException("Width and height must be greater than or equal to zero");
        }
        c0385b.mo112setSizeuvyYCjk(jFloatToRawIntBits);
        canvas.translate(f11, f12);
    }

    @Override // k2.h
    /* renamed from: rotate-Uv8p0NA, reason: not valid java name */
    public final void mo139rotateUv8p0NA(float f11, long j11) {
        Canvas canvas = this.f20519a.getCanvas();
        int i5 = (int) (j11 >> 32);
        int i11 = (int) (j11 & 4294967295L);
        canvas.translate(Float.intBitsToFloat(i5), Float.intBitsToFloat(i11));
        canvas.rotate(f11);
        canvas.translate(-Float.intBitsToFloat(i5), -Float.intBitsToFloat(i11));
    }

    @Override // k2.h
    /* renamed from: scale-0AR0LA0, reason: not valid java name */
    public final void mo140scale0AR0LA0(float f11, float f12, long j11) {
        Canvas canvas = this.f20519a.getCanvas();
        int i5 = (int) (j11 >> 32);
        int i11 = (int) (j11 & 4294967295L);
        canvas.translate(Float.intBitsToFloat(i5), Float.intBitsToFloat(i11));
        canvas.scale(f11, f12);
        canvas.translate(-Float.intBitsToFloat(i5), -Float.intBitsToFloat(i11));
    }

    @Override // k2.h
    /* renamed from: transform-58bKbWc, reason: not valid java name */
    public final void mo141transform58bKbWc(float[] matrix) {
        Intrinsics.g(matrix, "matrix");
        this.f20519a.getCanvas().mo15concat58bKbWc(matrix);
    }

    @Override // k2.h
    public final void translate(float f11, float f12) {
        this.f20519a.getCanvas().translate(f11, f12);
    }
}
