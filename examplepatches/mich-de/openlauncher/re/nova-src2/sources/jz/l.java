package jz;

import android.animation.ValueAnimator;
import android.graphics.Matrix;
import android.graphics.Rect;
import android.graphics.RectF;
import android.view.ViewGroup;
import android.view.animation.PathInterpolator;
import b10.q;
import com.android.launcher3.views.FloatingIconView;
import java.util.ArrayList;
import kotlin.math.MathKt;
import mx.j0;
import o9.g3;

/* loaded from: classes4.dex */
public final class l implements ValueAnimator.AnimatorUpdateListener {

    /* renamed from: a, reason: collision with root package name */
    public final ArrayList f70535a = new ArrayList();

    /* renamed from: b, reason: collision with root package name */
    public final k8.a f70536b;

    /* renamed from: c, reason: collision with root package name */
    public final k8.a f70537c;

    /* renamed from: d, reason: collision with root package name */
    public final k8.a f70538d;

    /* renamed from: e, reason: collision with root package name */
    public final k8.a f70539e;

    /* renamed from: f, reason: collision with root package name */
    public final k8.a f70540f;

    /* renamed from: g, reason: collision with root package name */
    public final k8.a f70541g;

    /* renamed from: h, reason: collision with root package name */
    public boolean f70542h;

    /* renamed from: i, reason: collision with root package name */
    public final /* synthetic */ RectF f70543i;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ j0 f70544j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ Rect f70545k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ Rect f70546l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ RectF f70547m;
    public final /* synthetic */ int[] n;
    public final /* synthetic */ RectF o;

    /* renamed from: p, reason: collision with root package name */
    public final /* synthetic */ Matrix f70548p;

    /* renamed from: q, reason: collision with root package name */
    public final /* synthetic */ FloatingIconView f70549q;

    /* renamed from: r, reason: collision with root package name */
    public final /* synthetic */ q f70550r;

    public l(float f11, long j11, float f12, long j12, float f13, float f14, long j13, float f15, float f16, float f17, float f18, RectF rectF, j0 j0Var, Rect rect, Rect rect2, RectF rectF2, int[] iArr, RectF rectF3, Matrix matrix, FloatingIconView floatingIconView, q qVar) {
        this.f70543i = rectF;
        this.f70544j = j0Var;
        this.f70545k = rect;
        this.f70546l = rect2;
        this.f70547m = rectF2;
        this.n = iArr;
        this.o = rectF3;
        this.f70548p = matrix;
        this.f70549q = floatingIconView;
        this.f70550r = qVar;
        PathInterpolator pathInterpolator = s9.k.f86800m;
        this.f70536b = new k8.a(this, 0.0f, f11, 0.0f, j11, pathInterpolator);
        this.f70537c = new k8.a(this, 0.0f, f12, 0.0f, j12, pathInterpolator);
        PathInterpolator pathInterpolator2 = s9.k.f86801p;
        this.f70538d = new k8.a(this, f13, f14, 0.0f, 450.0f, pathInterpolator2);
        this.f70539e = new k8.a(this, 1.0f, 0.0f, 25.0f, j13, s9.k.f86788a);
        this.f70540f = new k8.a(this, f15, f16, 0.0f, 375.0f, pathInterpolator2);
        this.f70541g = new k8.a(this, f17, f18, 0.0f, 375.0f, pathInterpolator2);
    }

    @Override // android.animation.ValueAnimator.AnimatorUpdateListener
    public final void onAnimationUpdate(ValueAnimator valueAnimator) {
        int iWidth;
        int iB;
        int i5;
        int i11;
        float animatedFraction = valueAnimator.getAnimatedFraction();
        float duration = valueAnimator.getDuration() * animatedFraction;
        ArrayList arrayList = this.f70535a;
        for (int size = arrayList.size() - 1; size >= 0; size--) {
            k8.a aVar = (k8.a) arrayList.get(size);
            float interpolation = aVar.f71198f.getInterpolation(Math.min(1.0f, Math.max(0.0f, duration - aVar.f71196d) / aVar.f71197e));
            aVar.f71193a = a2.c.a(1.0f, interpolation, aVar.f71194b, aVar.f71195c * interpolation);
        }
        RectF rectF = this.f70543i;
        float fWidth = rectF.width();
        k8.a aVar2 = this.f70538d;
        float f11 = fWidth * aVar2.f71193a;
        float fHeight = rectF.height() * aVar2.f71193a;
        boolean zO = this.f70544j.o();
        Rect rect = this.f70545k;
        k8.a aVar3 = this.f70540f;
        if (zO) {
            iWidth = MathKt.b(aVar3.f71193a);
            iB = rect.height();
        } else {
            iWidth = rect.width();
            iB = MathKt.b(aVar3.f71193a);
        }
        this.f70546l.set(0, 0, iWidth, iB);
        float f12 = iWidth;
        float f13 = iB;
        float fMax = Math.max(f11 / f12, fHeight / f13);
        if (fMax > 1.0f) {
            fMax = 1.0f;
        }
        float f14 = (f12 * fMax) - f11;
        float f15 = 2;
        float f16 = f14 / f15;
        float f17 = ((f13 * fMax) - fHeight) / f15;
        RectF rectF2 = this.f70547m;
        rectF2.set(rectF);
        int[] iArr = this.n;
        rectF2.offset(iArr[0], iArr[1]);
        k8.a aVar4 = this.f70536b;
        float f18 = aVar4.f71193a;
        k8.a aVar5 = this.f70537c;
        rectF2.offset(f18, aVar5.f71193a);
        g3.u(rectF2, aVar2.f71193a);
        float f19 = rectF2.left - f16;
        float f21 = rectF2.top - f17;
        RectF rectF3 = this.o;
        rectF3.set(rectF);
        rectF3.offset(aVar4.f71193a, aVar5.f71193a);
        g3.u(rectF3, aVar2.f71193a);
        rectF3.left -= f16;
        rectF3.top -= f17;
        rectF3.right += f16;
        rectF3.bottom += f17;
        Matrix matrix = this.f70548p;
        matrix.setScale(fMax, fMax);
        matrix.postTranslate(f19, f21);
        k8.a aVar6 = this.f70539e;
        float f22 = aVar6.f71193a;
        float f23 = this.f70541g.f71193a * fMax;
        FloatingIconView floatingIconView = this.f70549q;
        floatingIconView.setAlpha(f22);
        za.l lVar = floatingIconView.f21270i;
        j0 j0Var = floatingIconView.f21264c.f79934x;
        boolean z11 = floatingIconView.f21266e;
        lVar.getClass();
        ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) floatingIconView.getLayoutParams();
        boolean z12 = lVar.f98450b;
        float marginStart = z12 ? rectF3.left - ((j0Var.f77151k - marginLayoutParams.getMarginStart()) - marginLayoutParams.width) : rectF3.left - marginLayoutParams.getMarginStart();
        float f24 = rectF3.top - marginLayoutParams.topMargin;
        floatingIconView.setTranslationX(marginStart);
        floatingIconView.setTranslationY(f24);
        float fMin = Math.min(marginLayoutParams.width, marginLayoutParams.height);
        float fMax2 = Math.max(1.0f, Math.min(rectF3.width() / fMin, rectF3.height() / fMin));
        if (!Float.isNaN(fMax2)) {
            Rect rect2 = lVar.f98460l;
            Rect rect3 = lVar.f98459k;
            if (z12) {
                int i12 = j0Var.f77151k;
                marginLayoutParams.getMarginStart();
            } else {
                marginLayoutParams.getMarginStart();
            }
            g3.r(Math.max(0.0f, animatedFraction), 0.0f, 1.0f, 0.0f, 10.0f, s9.k.f86788a);
            if (z11) {
                rect3.right = (int) (rectF3.width() / fMax2);
            } else {
                rect3.bottom = (int) (rectF3.height() / fMax2);
            }
            lVar.f98458j = f23 / fMax2;
            if (lVar.f98453e) {
                float fWidth2 = (z11 ? rect3.width() : rect3.height()) / fMin;
                lVar.a(fWidth2, z11);
                int iHeight = rect2.height();
                int iWidth2 = rect2.width();
                if (z11) {
                    i5 = 0;
                } else {
                    float f25 = iHeight;
                    i5 = (int) (((f25 * fWidth2) - f25) / 2.0f);
                }
                if (z11) {
                    float f26 = iWidth2;
                    i11 = (int) (((fWidth2 * f26) - f26) / 2.0f);
                } else {
                    i11 = 0;
                }
                Rect rect4 = za.l.f98446q;
                rect4.set(rect2);
                rect4.offset(i11, i5);
                lVar.f98451c.setBounds(rect4);
            }
            lVar.invalidate();
            lVar.invalidateOutline();
            floatingIconView.setPivotX(0.0f);
            floatingIconView.setPivotY(0.0f);
            floatingIconView.setScaleX(fMax2);
            floatingIconView.setScaleY(fMax2);
            floatingIconView.invalidate();
        }
        if (this.f70542h || aVar6.f71193a >= 0.13f) {
            return;
        }
        this.f70550r.invoke(floatingIconView);
        this.f70542h = true;
    }
}
