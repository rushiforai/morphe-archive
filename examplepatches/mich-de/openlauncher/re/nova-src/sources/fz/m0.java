package fz;

import android.animation.ValueAnimator;
import android.graphics.Matrix;
import android.graphics.Path;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final /* synthetic */ class m0 implements ValueAnimator.AnimatorUpdateListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ n0 f56298a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f56299b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f56300c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f56301d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ int f56302e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ int f56303f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ int f56304g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ int f56305h;

    /* renamed from: i, reason: collision with root package name */
    public final /* synthetic */ int f56306i;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ float f56307j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ Path f56308k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ Path f56309l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ float f56310m;

    public /* synthetic */ m0(n0 n0Var, int i5, int i11, int i12, int i13, int i14, int i15, int i16, int i17, float f11, Path path, Path path2, float f12) {
        this.f56298a = n0Var;
        this.f56299b = i5;
        this.f56300c = i11;
        this.f56301d = i12;
        this.f56302e = i13;
        this.f56303f = i14;
        this.f56304g = i15;
        this.f56305h = i16;
        this.f56306i = i17;
        this.f56307j = f11;
        this.f56308k = path;
        this.f56309l = path2;
        this.f56310m = f12;
    }

    @Override // android.animation.ValueAnimator.AnimatorUpdateListener
    public final void onAnimationUpdate(ValueAnimator valueAnimator) {
        Object animatedValue = valueAnimator.getAnimatedValue();
        Intrinsics.e(animatedValue, "null cannot be cast to non-null type kotlin.Float");
        float fFloatValue = ((Float) animatedValue).floatValue();
        n0 n0Var = this.f56298a;
        Matrix matrix = n0Var.f56312e;
        matrix.reset();
        float f11 = 1 - fFloatValue;
        float f12 = this.f56299b;
        float f13 = (this.f56300c * fFloatValue) + (f11 * f12);
        float f14 = (this.f56302e * fFloatValue) + (this.f56301d * f11);
        float f15 = (this.f56304g * fFloatValue) + (this.f56303f * f11);
        float f16 = (this.f56306i * fFloatValue) + (this.f56305h * f11);
        float f17 = (this.f56307j * fFloatValue) + (1.0f * f11);
        matrix.postScale(f17, f17, 50.0f, 50.0f);
        matrix.postScale(f13 / 100.0f, f14 / 100.0f);
        Path path = n0Var.f56313f;
        path.rewind();
        this.f56308k.transform(matrix, path);
        path.offset(f15, f16);
        float f18 = (fFloatValue * 0.0f) + ((f12 / 10.0f) * f11);
        float f19 = f15 - f18;
        float f21 = f16 - f18;
        float f22 = f15 + f13 + f18;
        float f23 = f16 + f14 + f18;
        Path.Direction direction = Path.Direction.CCW;
        Path path2 = this.f56309l;
        float f24 = this.f56310m;
        path2.addRoundRect(f19, f21, f22, f23, f24, f24, direction);
        path2.op(path, Path.Op.INTERSECT);
    }
}
