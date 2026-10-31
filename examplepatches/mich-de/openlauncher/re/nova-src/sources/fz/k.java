package fz;

import android.animation.ValueAnimator;
import android.graphics.Path;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final /* synthetic */ class k implements ValueAnimator.AnimatorUpdateListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ p f56274a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Path f56275b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ float f56276c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ float f56277d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ float f56278e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ float f56279f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ float f56280g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ float f56281h;

    /* renamed from: i, reason: collision with root package name */
    public final /* synthetic */ float f56282i;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ float f56283j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ float f56284k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ float f56285l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ float f56286m;
    public final /* synthetic */ float n;
    public final /* synthetic */ float o;

    public /* synthetic */ k(p pVar, Path path, float f11, float f12, float f13, float f14, float f15, float f16, float f17, float f18, float f19, float f21, float f22, float f23, float f24) {
        this.f56274a = pVar;
        this.f56275b = path;
        this.f56276c = f11;
        this.f56277d = f12;
        this.f56278e = f13;
        this.f56279f = f14;
        this.f56280g = f15;
        this.f56281h = f16;
        this.f56282i = f17;
        this.f56283j = f18;
        this.f56284k = f19;
        this.f56285l = f21;
        this.f56286m = f22;
        this.n = f23;
        this.o = f24;
    }

    @Override // android.animation.ValueAnimator.AnimatorUpdateListener
    public final void onAnimationUpdate(ValueAnimator valueAnimator) {
        Object animatedValue = valueAnimator.getAnimatedValue();
        Intrinsics.e(animatedValue, "null cannot be cast to non-null type kotlin.Float");
        this.f56274a.n(this.f56275b, this.f56276c, this.f56277d, this.f56278e, this.f56279f, this.f56280g, this.f56281h, this.f56282i, this.f56283j, this.f56284k, this.f56285l, this.f56286m, this.n, this.o, ((Float) animatedValue).floatValue());
    }
}
