package rj;

import android.animation.Animator;
import android.animation.AnimatorSet;
import android.animation.FloatEvaluator;
import android.animation.ObjectAnimator;
import android.animation.StateListAnimator;
import android.animation.ValueAnimator;
import android.graphics.Matrix;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.InsetDrawable;
import android.graphics.drawable.LayerDrawable;
import android.os.Build;
import android.util.Property;
import android.view.View;
import bk.u;
import cl.l0;
import com.google.android.material.floatingactionbutton.FloatingActionButton;
import java.util.ArrayList;
import ps.l;

/* loaded from: classes3.dex */
public final class j {

    /* renamed from: a, reason: collision with root package name */
    public bk.j f85992a;

    /* renamed from: b, reason: collision with root package name */
    public bk.g f85993b;

    /* renamed from: c, reason: collision with root package name */
    public Drawable f85994c;

    /* renamed from: d, reason: collision with root package name */
    public a f85995d;

    /* renamed from: e, reason: collision with root package name */
    public LayerDrawable f85996e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f85997f;

    /* renamed from: g, reason: collision with root package name */
    public float f85998g;

    /* renamed from: h, reason: collision with root package name */
    public float f85999h;

    /* renamed from: i, reason: collision with root package name */
    public float f86000i;

    /* renamed from: j, reason: collision with root package name */
    public int f86001j;

    /* renamed from: k, reason: collision with root package name */
    public Animator f86002k;

    /* renamed from: l, reason: collision with root package name */
    public cj.e f86003l;

    /* renamed from: m, reason: collision with root package name */
    public cj.e f86004m;
    public int o;

    /* renamed from: q, reason: collision with root package name */
    public final FloatingActionButton f86006q;

    /* renamed from: r, reason: collision with root package name */
    public final q.c f86007r;

    /* renamed from: w, reason: collision with root package name */
    public StateListAnimator f86012w;

    /* renamed from: x, reason: collision with root package name */
    public static final f6.a f85989x = cj.a.f19953c;

    /* renamed from: y, reason: collision with root package name */
    public static final int f85990y = 2130969697;

    /* renamed from: z, reason: collision with root package name */
    public static final int f85991z = 2130969713;
    public static final int A = 2130969700;
    public static final int B = 2130969711;
    public static final int[] C = {16842919, 16842910};
    public static final int[] D = {16843623, 16842908, 16842910};
    public static final int[] E = {16842908, 16842910};
    public static final int[] F = {16843623, 16842910};
    public static final int[] G = {16842910};
    public static final int[] H = new int[0];
    public float n = 1.0f;

    /* renamed from: p, reason: collision with root package name */
    public int f86005p = 0;

    /* renamed from: s, reason: collision with root package name */
    public final Rect f86008s = new Rect();

    /* renamed from: t, reason: collision with root package name */
    public final RectF f86009t = new RectF();

    /* renamed from: u, reason: collision with root package name */
    public final RectF f86010u = new RectF();

    /* renamed from: v, reason: collision with root package name */
    public final Matrix f86011v = new Matrix();

    public j(FloatingActionButton floatingActionButton, q.c cVar) {
        this.f86006q = floatingActionButton;
        this.f86007r = cVar;
        mh.c cVar2 = new mh.c(19);
        cVar2.u(C, e(new g(this, 1)));
        cVar2.u(D, e(new g(this, 0)));
        cVar2.u(E, e(new g(this, 0)));
        cVar2.u(F, e(new g(this, 0)));
        cVar2.u(G, e(new g(this, 2)));
        cVar2.u(H, e(new f(this)));
        floatingActionButton.getRotation();
    }

    public static ValueAnimator e(h hVar) {
        ValueAnimator valueAnimator = new ValueAnimator();
        valueAnimator.setInterpolator(f85989x);
        valueAnimator.setDuration(100L);
        valueAnimator.addListener(hVar);
        valueAnimator.addUpdateListener(hVar);
        valueAnimator.setFloatValues(0.0f, 1.0f);
        return valueAnimator;
    }

    public final void a(float f11, Matrix matrix) {
        matrix.reset();
        Drawable drawable = this.f86006q.getDrawable();
        if (drawable == null || this.o == 0) {
            return;
        }
        float intrinsicWidth = drawable.getIntrinsicWidth();
        float intrinsicHeight = drawable.getIntrinsicHeight();
        RectF rectF = this.f86009t;
        rectF.set(0.0f, 0.0f, intrinsicWidth, intrinsicHeight);
        float f12 = this.o;
        RectF rectF2 = this.f86010u;
        rectF2.set(0.0f, 0.0f, f12, f12);
        matrix.setRectToRect(rectF, rectF2, Matrix.ScaleToFit.CENTER);
        float f13 = this.o / 2.0f;
        matrix.postScale(f11, f11, f13, f13);
    }

    public final AnimatorSet b(cj.e eVar, float f11, float f12, float f13) {
        ArrayList arrayList = new ArrayList();
        Property property = View.ALPHA;
        float[] fArr = {f11};
        FloatingActionButton floatingActionButton = this.f86006q;
        ObjectAnimator objectAnimatorOfFloat = ObjectAnimator.ofFloat(floatingActionButton, (Property<FloatingActionButton, Float>) property, fArr);
        eVar.d("opacity").a(objectAnimatorOfFloat);
        arrayList.add(objectAnimatorOfFloat);
        ObjectAnimator objectAnimatorOfFloat2 = ObjectAnimator.ofFloat(floatingActionButton, (Property<FloatingActionButton, Float>) View.SCALE_X, f12);
        eVar.d("scale").a(objectAnimatorOfFloat2);
        int i5 = Build.VERSION.SDK_INT;
        if (i5 == 26) {
            e eVar2 = new e();
            eVar2.f85982a = new FloatEvaluator();
            objectAnimatorOfFloat2.setEvaluator(eVar2);
        }
        arrayList.add(objectAnimatorOfFloat2);
        ObjectAnimator objectAnimatorOfFloat3 = ObjectAnimator.ofFloat(floatingActionButton, (Property<FloatingActionButton, Float>) View.SCALE_Y, f12);
        eVar.d("scale").a(objectAnimatorOfFloat3);
        if (i5 == 26) {
            e eVar3 = new e();
            eVar3.f85982a = new FloatEvaluator();
            objectAnimatorOfFloat3.setEvaluator(eVar3);
        }
        arrayList.add(objectAnimatorOfFloat3);
        Matrix matrix = this.f86011v;
        a(f13, matrix);
        ObjectAnimator objectAnimatorOfObject = ObjectAnimator.ofObject(floatingActionButton, new cj.d(), new c(this), new Matrix(matrix));
        eVar.d("iconScale").a(objectAnimatorOfObject);
        arrayList.add(objectAnimatorOfObject);
        AnimatorSet animatorSet = new AnimatorSet();
        l0.L(animatorSet, arrayList);
        return animatorSet;
    }

    public final AnimatorSet c(float f11, float f12, float f13, int i5, int i11) {
        AnimatorSet animatorSet = new AnimatorSet();
        ArrayList arrayList = new ArrayList();
        ValueAnimator valueAnimatorOfFloat = ValueAnimator.ofFloat(0.0f, 1.0f);
        FloatingActionButton floatingActionButton = this.f86006q;
        valueAnimatorOfFloat.addUpdateListener(new d(this, floatingActionButton.getAlpha(), f11, floatingActionButton.getScaleX(), f12, floatingActionButton.getScaleY(), this.n, f13, new Matrix(this.f86011v)));
        arrayList.add(valueAnimatorOfFloat);
        l0.L(animatorSet, arrayList);
        animatorSet.setDuration(l.q(floatingActionButton.getContext(), i5, floatingActionButton.getContext().getResources().getInteger(2131492923)));
        animatorSet.setInterpolator(l.r(floatingActionButton.getContext(), i11, cj.a.f19952b));
        return animatorSet;
    }

    public final AnimatorSet d(float f11, float f12) {
        AnimatorSet animatorSet = new AnimatorSet();
        float[] fArr = {f11};
        FloatingActionButton floatingActionButton = this.f86006q;
        animatorSet.play(ObjectAnimator.ofFloat(floatingActionButton, "elevation", fArr).setDuration(0L)).with(ObjectAnimator.ofFloat(floatingActionButton, (Property<FloatingActionButton, Float>) View.TRANSLATION_Z, f12).setDuration(100L));
        animatorSet.setInterpolator(f85989x);
        return animatorSet;
    }

    public final void f(float f11, float f12, float f13) {
        FloatingActionButton floatingActionButton = this.f86006q;
        if (floatingActionButton.getStateListAnimator() == this.f86012w) {
            StateListAnimator stateListAnimator = new StateListAnimator();
            stateListAnimator.addState(C, d(f11, f13));
            stateListAnimator.addState(D, d(f11, f12));
            stateListAnimator.addState(E, d(f11, f12));
            stateListAnimator.addState(F, d(f11, f12));
            AnimatorSet animatorSet = new AnimatorSet();
            ArrayList arrayList = new ArrayList();
            arrayList.add(ObjectAnimator.ofFloat(floatingActionButton, "elevation", f11).setDuration(0L));
            arrayList.add(ObjectAnimator.ofFloat(floatingActionButton, (Property<FloatingActionButton, Float>) View.TRANSLATION_Z, 0.0f).setDuration(100L));
            animatorSet.playSequentially((Animator[]) arrayList.toArray(new Animator[0]));
            animatorSet.setInterpolator(f85989x);
            stateListAnimator.addState(G, animatorSet);
            stateListAnimator.addState(H, d(0.0f, 0.0f));
            this.f86012w = stateListAnimator;
            floatingActionButton.setStateListAnimator(stateListAnimator);
        }
        if (h()) {
            i();
        }
    }

    public final void g(bk.j jVar) {
        this.f85992a = jVar;
        bk.g gVar = this.f85993b;
        if (gVar != null) {
            gVar.c(jVar);
        }
        Object obj = this.f85994c;
        if (obj instanceof u) {
            ((u) obj).c(jVar);
        }
        a aVar = this.f85995d;
        if (aVar != null) {
            aVar.o = jVar;
            aVar.invalidateSelf();
        }
    }

    public final boolean h() {
        if (((FloatingActionButton) this.f86007r.f83189b).f34288h) {
            return true;
        }
        if (!this.f85997f) {
            return false;
        }
        FloatingActionButton floatingActionButton = this.f86006q;
        return floatingActionButton.f(floatingActionButton.f34284d) < this.f86001j;
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x0064  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void i() {
        boolean z11 = ((FloatingActionButton) this.f86007r.f83189b).f34288h;
        Rect rect = this.f86008s;
        if (z11) {
            int iMax = 0;
            if (this.f85997f) {
                int i5 = this.f86001j;
                FloatingActionButton floatingActionButton = this.f86006q;
                iMax = Math.max((i5 - floatingActionButton.f(floatingActionButton.f34284d)) / 2, 0);
            }
            int iMax2 = Math.max(iMax, (int) Math.ceil(this.f86006q.getElevation() + this.f86000i));
            int iMax3 = Math.max(iMax, (int) Math.ceil(r0 * 1.5f));
            rect.set(iMax2, iMax3, iMax2, iMax3);
        } else if (this.f85997f) {
            FloatingActionButton floatingActionButton2 = this.f86006q;
            int iF = floatingActionButton2.f(floatingActionButton2.f34284d);
            int i11 = this.f86001j;
            if (iF >= i11) {
                rect.set(0, 0, 0, 0);
            } else {
                int iF2 = (i11 - floatingActionButton2.f(floatingActionButton2.f34284d)) / 2;
                rect.set(iF2, iF2, iF2, iF2);
            }
        }
        v30.e.d(this.f85996e, "Didn't initialize content background");
        boolean zH = h();
        q.c cVar = this.f86007r;
        if (zH) {
            super/*android.view.View*/.setBackgroundDrawable(new InsetDrawable((Drawable) this.f85996e, rect.left, rect.top, rect.right, rect.bottom));
        } else {
            LayerDrawable layerDrawable = this.f85996e;
            if (layerDrawable != null) {
                super/*android.view.View*/.setBackgroundDrawable(layerDrawable);
            } else {
                cVar.getClass();
            }
        }
        int i12 = rect.left;
        int i13 = rect.top;
        int i14 = rect.right;
        int i15 = rect.bottom;
        FloatingActionButton floatingActionButton3 = (FloatingActionButton) cVar.f83189b;
        floatingActionButton3.f34289i.set(i12, i13, i14, i15);
        int i16 = floatingActionButton3.f34286f;
        floatingActionButton3.setPadding(i12 + i16, i13 + i16, i14 + i16, i15 + i16);
    }
}
