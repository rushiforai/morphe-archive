package fz;

import android.animation.Animator;
import android.animation.ValueAnimator;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Rect;
import android.view.View;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class q0 extends r {

    /* renamed from: d, reason: collision with root package name */
    public final Path f56345d = new Path();

    /* renamed from: e, reason: collision with root package name */
    public final Path f56346e = new Path();

    /* renamed from: f, reason: collision with root package name */
    public final Matrix f56347f = new Matrix();

    /* renamed from: g, reason: collision with root package name */
    public final float[] f56348g = new float[8];

    /* renamed from: h, reason: collision with root package name */
    public final float[] f56349h = new float[8];

    /* renamed from: i, reason: collision with root package name */
    public final Path f56350i;

    public q0() {
        Path path = new Path();
        this.f56350i = path;
        g(path, 0.0f, 0.0f, 100.0f, 100.0f, 0.0f, 0.0f);
    }

    @Override // fz.r
    public final void a(Path path, float f11, float f12, float f13) {
        float f14 = 2 * f13;
        g(path, 0.0f, 0.0f, f14, f14, f11, f12);
    }

    @Override // fz.r
    public final String b() {
        return "FOLDER_PLATFORM";
    }

    @Override // fz.r
    public final Animator c(final View view, final Rect rect, final Rect rect2, final float f11, boolean z11, boolean z12) {
        final Path path = new Path();
        ValueAnimator valueAnimatorOfFloat = z11 ? ValueAnimator.ofFloat(1.0f, 0.0f) : ValueAnimator.ofFloat(0.0f, 1.0f);
        valueAnimatorOfFloat.addListener(new o(view, 2));
        valueAnimatorOfFloat.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() { // from class: fz.p0
            @Override // android.animation.ValueAnimator.AnimatorUpdateListener
            public final void onAnimationUpdate(ValueAnimator valueAnimator) {
                float fHeight;
                Path path2 = path;
                path2.rewind();
                Object animatedValue = valueAnimator.getAnimatedValue();
                Intrinsics.e(animatedValue, "null cannot be cast to non-null type kotlin.Float");
                float fFloatValue = ((Float) animatedValue).floatValue();
                Rect rect3 = rect;
                float f12 = 1.0f - fFloatValue;
                Rect rect4 = rect2;
                float f13 = (rect4.left * fFloatValue) + (rect3.left * f12);
                float f14 = (rect4.top * fFloatValue) + (rect3.top * f12);
                if (fFloatValue < 0.5d) {
                    fHeight = ((rect3.height() * 1.2f) * fFloatValue) / 0.5f;
                } else {
                    fHeight = ((1 - fFloatValue) * (rect3.height() * 1.2f)) / 0.5f;
                }
                this.g(path2, fFloatValue, f11 * fFloatValue, (rect4.width() * fFloatValue) + (rect3.width() * f12), (rect4.height() * fFloatValue) + (rect3.height() * f12), f13, f14 - fHeight);
                ((za.m) view).A(path2);
            }
        });
        return valueAnimatorOfFloat;
    }

    @Override // fz.r
    public final void d(Canvas canvas, float f11, float f12, float f13, Paint paint) {
        Path path = this.f56346e;
        path.rewind();
        float f14 = 2 * f13;
        g(path, 0.0f, 0.0f, f14, f14, f11, f12);
        canvas.drawPath(path, paint);
    }

    @Override // fz.r
    public final Path e() {
        return this.f56350i;
    }

    public final void g(Path path, float f11, float f12, float f13, float f14, float f15, float f16) {
        path.rewind();
        Path path2 = this.f56345d;
        path2.rewind();
        float[] fArr = this.f56348g;
        int length = fArr.length;
        Intrinsics.g(fArr, "<this>");
        Arrays.fill(fArr, 0, length, f12);
        this.f56345d.addRoundRect(0.0f, 0.0f, f13, f14, this.f56348g, Path.Direction.CCW);
        float f17 = (1.0f - f11) * 0.15f;
        float f18 = ((90 * f17) * f13) / 100.0f;
        fArr[0] = 0.0f;
        fArr[1] = 0.0f;
        fArr[2] = f13;
        fArr[3] = 0.0f;
        fArr[4] = f13;
        fArr[5] = f14;
        fArr[6] = 0.0f;
        fArr[7] = f14;
        float f19 = f18 + 0.0f;
        float[] fArr2 = this.f56349h;
        fArr2[0] = f19;
        float f21 = (((Sdk.SDKError.Reason.LINK_COMMAND_OPEN_FAILED_VALUE * f17) * f14) / 100.0f) + 0.0f;
        fArr2[1] = f21;
        fArr2[2] = f13 - f18;
        fArr2[3] = f21;
        fArr2[4] = f13;
        float f22 = f14 + ((((-32) * f17) * f14) / 100.0f);
        fArr2[5] = f22;
        fArr2[6] = 0.0f;
        fArr2[7] = f22;
        Matrix matrix = this.f56347f;
        matrix.reset();
        this.f56347f.setPolyToPoly(fArr, 0, fArr2, 0, 4);
        matrix.postTranslate(f15, f16);
        path.addPath(path2, matrix);
    }
}
