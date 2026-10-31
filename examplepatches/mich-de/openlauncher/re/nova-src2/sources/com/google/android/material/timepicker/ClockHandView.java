package com.google.android.material.timepicker;

import a5.a1;
import android.animation.TimeInterpolator;
import android.animation.ValueAnimator;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RectF;
import android.util.AttributeSet;
import android.util.Pair;
import android.util.TypedValue;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.accessibility.AccessibilityManager;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.WeakHashMap;

/* loaded from: classes3.dex */
class ClockHandView extends View {

    /* renamed from: v, reason: collision with root package name */
    public static final /* synthetic */ int f34428v = 0;

    /* renamed from: a, reason: collision with root package name */
    public final int f34429a;

    /* renamed from: b, reason: collision with root package name */
    public final TimeInterpolator f34430b;

    /* renamed from: c, reason: collision with root package name */
    public final ValueAnimator f34431c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f34432d;

    /* renamed from: e, reason: collision with root package name */
    public float f34433e;

    /* renamed from: f, reason: collision with root package name */
    public float f34434f;

    /* renamed from: g, reason: collision with root package name */
    public boolean f34435g;

    /* renamed from: h, reason: collision with root package name */
    public final int f34436h;

    /* renamed from: i, reason: collision with root package name */
    public boolean f34437i;

    /* renamed from: j, reason: collision with root package name */
    public final ArrayList f34438j;

    /* renamed from: k, reason: collision with root package name */
    public final int f34439k;

    /* renamed from: l, reason: collision with root package name */
    public final float f34440l;

    /* renamed from: m, reason: collision with root package name */
    public final Paint f34441m;
    public final RectF n;
    public final int o;

    /* renamed from: p, reason: collision with root package name */
    public float f34442p;

    /* renamed from: q, reason: collision with root package name */
    public boolean f34443q;

    /* renamed from: r, reason: collision with root package name */
    public n f34444r;

    /* renamed from: s, reason: collision with root package name */
    public double f34445s;

    /* renamed from: t, reason: collision with root package name */
    public int f34446t;

    /* renamed from: u, reason: collision with root package name */
    public int f34447u;

    public ClockHandView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet, 2130969601);
        this.f34431c = new ValueAnimator();
        this.f34438j = new ArrayList();
        Paint paint = new Paint();
        this.f34441m = paint;
        this.n = new RectF();
        this.f34447u = 1;
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, bj.a.f17923j, 2130969601, 2132084050);
        this.f34429a = ps.l.q(context, 2130969697, 200);
        this.f34430b = ps.l.r(context, 2130969713, cj.a.f19952b);
        this.f34446t = typedArrayObtainStyledAttributes.getDimensionPixelSize(1, 0);
        this.f34439k = typedArrayObtainStyledAttributes.getDimensionPixelSize(2, 0);
        this.o = getResources().getDimensionPixelSize(2131165990);
        this.f34440l = r4.getDimensionPixelSize(2131165988);
        int color = typedArrayObtainStyledAttributes.getColor(0, 0);
        paint.setAntiAlias(true);
        paint.setColor(color);
        c(0.0f, false);
        this.f34436h = ViewConfiguration.get(context).getScaledTouchSlop();
        WeakHashMap weakHashMap = a1.f250a;
        setImportantForAccessibility(2);
        typedArrayObtainStyledAttributes.recycle();
    }

    public final int a(float f11, float f12) {
        int degrees = (int) Math.toDegrees(Math.atan2(f12 - (getHeight() / 2), f11 - (getWidth() / 2)));
        int i5 = degrees + 90;
        return i5 < 0 ? degrees + 450 : i5;
    }

    public final int b(int i5) {
        return i5 == 2 ? Math.round(this.f34446t * 0.66f) : this.f34446t;
    }

    public final void c(float f11, boolean z11) {
        ValueAnimator valueAnimator = this.f34431c;
        if (valueAnimator != null) {
            valueAnimator.cancel();
        }
        if (!z11) {
            d(f11, false);
            return;
        }
        float f12 = this.f34442p;
        if (Math.abs(f12 - f11) > 180.0f) {
            if (f12 > 180.0f && f11 < 180.0f) {
                f11 += 360.0f;
            }
            if (f12 < 180.0f && f11 > 180.0f) {
                f12 += 360.0f;
            }
        }
        Pair pair = new Pair(Float.valueOf(f12), Float.valueOf(f11));
        valueAnimator.setFloatValues(((Float) pair.first).floatValue(), ((Float) pair.second).floatValue());
        valueAnimator.setDuration(this.f34429a);
        valueAnimator.setInterpolator(this.f34430b);
        valueAnimator.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() { // from class: com.google.android.material.timepicker.d
            @Override // android.animation.ValueAnimator.AnimatorUpdateListener
            public final void onAnimationUpdate(ValueAnimator valueAnimator2) {
                int i5 = ClockHandView.f34428v;
                ClockHandView clockHandView = this.f34487a;
                clockHandView.getClass();
                clockHandView.d(((Float) valueAnimator2.getAnimatedValue()).floatValue(), true);
            }
        });
        valueAnimator.addListener(new e(0));
        valueAnimator.start();
    }

    public final void d(float f11, boolean z11) {
        float f12 = f11 % 360.0f;
        this.f34442p = f12;
        this.f34445s = Math.toRadians(f12 - 90.0f);
        int height = getHeight() / 2;
        int width = getWidth() / 2;
        float fB = b(this.f34447u);
        float fCos = (((float) Math.cos(this.f34445s)) * fB) + width;
        float fSin = (fB * ((float) Math.sin(this.f34445s))) + height;
        float f13 = this.f34439k;
        this.n.set(fCos - f13, fSin - f13, fCos + f13, fSin + f13);
        Iterator it = this.f34438j.iterator();
        while (it.hasNext()) {
            ((f) it.next()).d(f12, z11);
        }
        invalidate();
    }

    @Override // android.view.View
    public final void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        int height = getHeight() / 2;
        int width = getWidth() / 2;
        float f11 = width;
        float fB = b(this.f34447u);
        float fCos = (((float) Math.cos(this.f34445s)) * fB) + f11;
        float f12 = height;
        float fSin = (fB * ((float) Math.sin(this.f34445s))) + f12;
        Paint paint = this.f34441m;
        paint.setStrokeWidth(0.0f);
        canvas.drawCircle(fCos, fSin, this.f34439k, paint);
        double dSin = Math.sin(this.f34445s);
        paint.setStrokeWidth(this.o);
        canvas.drawLine(f11, f12, width + ((int) (Math.cos(this.f34445s) * d)), height + ((int) (d * dSin)), paint);
        canvas.drawCircle(f11, f12, this.f34440l, paint);
    }

    @Override // android.view.View
    public final void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        super.onLayout(z11, i5, i11, i12, i13);
        if (this.f34431c.isRunning()) {
            return;
        }
        c(this.f34442p, false);
    }

    @Override // android.view.View
    public final boolean onTouchEvent(MotionEvent motionEvent) {
        boolean z11;
        boolean z12;
        boolean z13;
        boolean z14;
        n nVar;
        int actionMasked = motionEvent.getActionMasked();
        float x11 = motionEvent.getX();
        float y11 = motionEvent.getY();
        if (actionMasked != 0) {
            if (actionMasked == 1 || actionMasked == 2) {
                int i5 = (int) (x11 - this.f34433e);
                int i11 = (int) (y11 - this.f34434f);
                this.f34435g = (i11 * i11) + (i5 * i5) > this.f34436h;
                z13 = this.f34443q;
                z12 = actionMasked == 1;
                if (this.f34437i) {
                    this.f34447u = ph.a.o((float) (getWidth() / 2), (float) (getHeight() / 2), x11, y11) > ((float) b(2)) + TypedValue.applyDimension(1, (float) 12, getContext().getResources().getDisplayMetrics()) ? 1 : 2;
                }
                z11 = false;
            } else {
                z12 = false;
                z11 = false;
                z13 = false;
            }
        } else {
            this.f34433e = x11;
            this.f34434f = y11;
            this.f34435g = true;
            this.f34443q = false;
            z11 = true;
            z12 = false;
            z13 = false;
        }
        boolean z15 = this.f34443q;
        float fA = a(x11, y11);
        boolean z16 = this.f34442p != fA;
        if (z11 && z16) {
            z14 = true;
        } else if (z16 || z13) {
            c(fA, z12 && this.f34432d);
            z14 = true;
        } else {
            z14 = false;
        }
        boolean z17 = z14 | z15;
        this.f34443q = z17;
        if (z17 && z12 && (nVar = this.f34444r) != null) {
            TimeModel timeModel = nVar.f34505b;
            TimePickerView timePickerView = nVar.f34504a;
            float fA2 = a(x11, y11);
            boolean z18 = this.f34435g;
            nVar.f34508e = true;
            int i12 = timeModel.f34472e;
            int i13 = timeModel.f34471d;
            if (timeModel.f34473f == 10) {
                timePickerView.f34478r.c(nVar.f34507d, false);
                AccessibilityManager accessibilityManager = (AccessibilityManager) timePickerView.getContext().getSystemService(AccessibilityManager.class);
                if (accessibilityManager == null || !accessibilityManager.isTouchExplorationEnabled()) {
                    nVar.b(12, true);
                }
            } else {
                int iRound = Math.round(fA2);
                if (!z18) {
                    timeModel.e(((iRound + 15) / 30) * 5);
                    nVar.f34506c = timeModel.f34472e * 6;
                }
                timePickerView.f34478r.c(nVar.f34506c, z18);
            }
            nVar.f34508e = false;
            nVar.c();
            if (timeModel.f34472e != i12 || timeModel.f34471d != i13) {
                timePickerView.performHapticFeedback(4);
            }
        }
        return true;
    }
}
