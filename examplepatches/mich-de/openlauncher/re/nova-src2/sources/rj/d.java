package rj;

import android.animation.ValueAnimator;
import android.graphics.Matrix;
import com.google.android.material.floatingactionbutton.FloatingActionButton;

/* loaded from: classes3.dex */
public final class d implements ValueAnimator.AnimatorUpdateListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ float f85973a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ float f85974b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ float f85975c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ float f85976d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ float f85977e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ float f85978f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ float f85979g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ Matrix f85980h;

    /* renamed from: i, reason: collision with root package name */
    public final /* synthetic */ j f85981i;

    public d(j jVar, float f11, float f12, float f13, float f14, float f15, float f16, float f17, Matrix matrix) {
        this.f85981i = jVar;
        this.f85973a = f11;
        this.f85974b = f12;
        this.f85975c = f13;
        this.f85976d = f14;
        this.f85977e = f15;
        this.f85978f = f16;
        this.f85979g = f17;
        this.f85980h = matrix;
    }

    @Override // android.animation.ValueAnimator.AnimatorUpdateListener
    public final void onAnimationUpdate(ValueAnimator valueAnimator) {
        float fFloatValue = ((Float) valueAnimator.getAnimatedValue()).floatValue();
        j jVar = this.f85981i;
        jVar.f86006q.setAlpha(cj.a.b(this.f85973a, this.f85974b, 0.0f, 0.2f, fFloatValue));
        FloatingActionButton floatingActionButton = jVar.f86006q;
        float f11 = this.f85975c;
        float f12 = this.f85976d;
        floatingActionButton.setScaleX(cj.a.a(f11, f12, fFloatValue));
        jVar.f86006q.setScaleY(cj.a.a(this.f85977e, f12, fFloatValue));
        float f13 = this.f85978f;
        float f14 = this.f85979g;
        jVar.n = cj.a.a(f13, f14, fFloatValue);
        float fA = cj.a.a(f13, f14, fFloatValue);
        Matrix matrix = this.f85980h;
        jVar.a(fA, matrix);
        jVar.f86006q.setImageMatrix(matrix);
    }
}
