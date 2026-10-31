package ca;

import android.animation.ObjectAnimator;
import android.animation.PropertyValuesHolder;
import android.animation.RectEvaluator;
import android.animation.ValueAnimator;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Rect;
import android.view.View;

/* loaded from: classes.dex */
public abstract class e implements ValueAnimator.AnimatorUpdateListener {

    /* renamed from: m, reason: collision with root package name */
    public static final c f19909m = new c("alpha", 0);
    public static final c n = new c("shift", 1);
    public static final RectEvaluator o = new RectEvaluator(new Rect());

    /* renamed from: p, reason: collision with root package name */
    public static final Rect f19910p = new Rect();

    /* renamed from: q, reason: collision with root package name */
    public static final Rect f19911q = new Rect();

    /* renamed from: a, reason: collision with root package name */
    public final View f19912a;

    /* renamed from: b, reason: collision with root package name */
    public final Paint f19913b;

    /* renamed from: c, reason: collision with root package name */
    public final int f19914c;

    /* renamed from: d, reason: collision with root package name */
    public final Rect f19915d = new Rect();

    /* renamed from: e, reason: collision with root package name */
    public boolean f19916e = false;

    /* renamed from: f, reason: collision with root package name */
    public Object f19917f;

    /* renamed from: g, reason: collision with root package name */
    public Object f19918g;

    /* renamed from: h, reason: collision with root package name */
    public Object f19919h;

    /* renamed from: i, reason: collision with root package name */
    public float f19920i;

    /* renamed from: j, reason: collision with root package name */
    public ObjectAnimator f19921j;

    /* renamed from: k, reason: collision with root package name */
    public float f19922k;

    /* renamed from: l, reason: collision with root package name */
    public final float f19923l;

    public e(View view, int i5) {
        this.f19912a = view;
        Paint paint = new Paint(1);
        this.f19913b = paint;
        int iAlpha = Color.alpha(i5);
        this.f19914c = iAlpha;
        paint.setColor(i5 | (-16777216));
        this.f19922k = 0.0f;
        paint.setAlpha((int) (iAlpha * 0.0f));
        this.f19920i = 0.0f;
        if (u9.b.f90694g.f90687d) {
            this.f19923l = bh.g.M(view.getContext(), 8);
        }
    }

    public final void a(Object obj, boolean z11) {
        c cVar = f19909m;
        if (z11) {
            ObjectAnimator objectAnimator = this.f19921j;
            if (objectAnimator != null) {
                objectAnimator.cancel();
                this.f19921j = null;
            }
            if (this.f19922k > 0.2f) {
                this.f19919h = obj;
                ObjectAnimator objectAnimatorOfPropertyValuesHolder = ObjectAnimator.ofPropertyValuesHolder(this, PropertyValuesHolder.ofFloat(cVar, 1.0f), PropertyValuesHolder.ofFloat(n, 1.0f));
                this.f19921j = objectAnimatorOfPropertyValuesHolder;
                objectAnimatorOfPropertyValuesHolder.addListener(new d(this, obj, true));
            } else {
                this.f19918g = obj;
                this.f19920i = 0.0f;
                this.f19919h = null;
                this.f19921j = ObjectAnimator.ofPropertyValuesHolder(this, PropertyValuesHolder.ofFloat(cVar, 1.0f));
            }
            this.f19917f = obj;
        } else if (this.f19917f == obj) {
            this.f19917f = null;
            ObjectAnimator objectAnimator2 = this.f19921j;
            if (objectAnimator2 != null) {
                objectAnimator2.cancel();
                this.f19921j = null;
            }
            ObjectAnimator objectAnimatorOfPropertyValuesHolder2 = ObjectAnimator.ofPropertyValuesHolder(this, PropertyValuesHolder.ofFloat(cVar, 0.0f));
            this.f19921j = objectAnimatorOfPropertyValuesHolder2;
            objectAnimatorOfPropertyValuesHolder2.addListener(new d(this, null, false));
        }
        boolean z12 = this.f19916e;
        View view = this.f19912a;
        if (z12) {
            view.invalidate(this.f19915d);
            this.f19916e = false;
        }
        Rect rectC = c();
        if (rectC != null) {
            view.invalidate(rectC);
        }
        if (!z11) {
            obj = null;
        }
        this.f19917f = obj;
        ObjectAnimator objectAnimator3 = this.f19921j;
        if (objectAnimator3 != null) {
            objectAnimator3.addUpdateListener(this);
            this.f19921j.setDuration(150L).start();
        }
    }

    public final void b(Canvas canvas) {
        Rect rectC;
        if (this.f19922k > 0.0f && (rectC = c()) != null) {
            Rect rect = this.f19915d;
            rect.set(rectC);
            float f11 = rect.left;
            float f12 = rect.top;
            float f13 = rect.right;
            float f14 = rect.bottom;
            float f15 = this.f19923l;
            canvas.drawRoundRect(f11, f12, f13, f14, f15, f15, this.f19913b);
            this.f19916e = true;
        }
    }

    public final Rect c() {
        Object obj;
        Object obj2 = this.f19918g;
        if (obj2 == null || !d(obj2)) {
            return null;
        }
        Object obj3 = this.f19918g;
        Rect rect = f19910p;
        e(obj3, rect);
        if (this.f19920i <= 0.0f || (obj = this.f19919h) == null) {
            return rect;
        }
        Rect rect2 = f19911q;
        e(obj, rect2);
        return o.evaluate(this.f19920i, rect, rect2);
    }

    public boolean d(Object obj) {
        return true;
    }

    public abstract void e(Object obj, Rect rect);

    @Override // android.animation.ValueAnimator.AnimatorUpdateListener
    public final void onAnimationUpdate(ValueAnimator valueAnimator) {
        boolean z11 = this.f19916e;
        View view = this.f19912a;
        if (z11) {
            view.invalidate(this.f19915d);
            this.f19916e = false;
        }
        Rect rectC = c();
        if (rectC != null) {
            view.invalidate(rectC);
        }
    }

    public void onFocusChange(View view, boolean z11) {
        a(view, z11);
    }
}
