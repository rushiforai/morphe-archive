package com.android.launcher3.views;

import aa.l;
import aa.p;
import android.animation.ObjectAnimator;
import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Insets;
import android.graphics.Paint;
import android.graphics.Point;
import android.graphics.Rect;
import android.graphics.RectF;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.WindowInsets;
import android.widget.TextView;
import androidx.recyclerview.widget.c;
import java.util.Collections;
import java.util.List;
import o9.g3;
import o9.m;
import o9.u2;
import q9.w;
import v30.e;

/* loaded from: classes.dex */
public class RecyclerViewFastScroller extends View {
    public static final Rect C = new Rect();
    public static final l D = new l(13, Integer.class, "width");
    public static final List E = Collections.singletonList(new Rect());
    public int A;
    public int B;

    /* renamed from: a, reason: collision with root package name */
    public final int f21285a;

    /* renamed from: b, reason: collision with root package name */
    public final int f21286b;

    /* renamed from: c, reason: collision with root package name */
    public final int f21287c;

    /* renamed from: d, reason: collision with root package name */
    public int f21288d;

    /* renamed from: e, reason: collision with root package name */
    public final float f21289e;

    /* renamed from: f, reason: collision with root package name */
    public int f21290f;

    /* renamed from: g, reason: collision with root package name */
    public ObjectAnimator f21291g;

    /* renamed from: h, reason: collision with root package name */
    public final Paint f21292h;

    /* renamed from: i, reason: collision with root package name */
    public final int f21293i;

    /* renamed from: j, reason: collision with root package name */
    public final RectF f21294j;

    /* renamed from: k, reason: collision with root package name */
    public final Point f21295k;

    /* renamed from: l, reason: collision with root package name */
    public final Paint f21296l;

    /* renamed from: m, reason: collision with root package name */
    public boolean f21297m;
    public boolean n;
    public final boolean o;

    /* renamed from: p, reason: collision with root package name */
    public long f21298p;

    /* renamed from: q, reason: collision with root package name */
    public int f21299q;

    /* renamed from: r, reason: collision with root package name */
    public int f21300r;

    /* renamed from: s, reason: collision with root package name */
    public int f21301s;

    /* renamed from: t, reason: collision with root package name */
    public TextView f21302t;

    /* renamed from: u, reason: collision with root package name */
    public boolean f21303u;

    /* renamed from: v, reason: collision with root package name */
    public String f21304v;

    /* renamed from: w, reason: collision with root package name */
    public Insets f21305w;

    /* renamed from: x, reason: collision with root package name */
    public m f21306x;

    /* renamed from: y, reason: collision with root package name */
    public w f21307y;

    /* renamed from: z, reason: collision with root package name */
    public int f21308z;

    public RecyclerViewFastScroller(Context context, AttributeSet attributeSet) throws Resources.NotFoundException {
        super(context, attributeSet, 0);
        this.f21288d = 0;
        this.f21294j = new RectF();
        this.f21295k = new Point();
        Paint paint = new Paint();
        this.f21296l = paint;
        paint.setColor(p.b(context, 16842806));
        paint.setAlpha(30);
        Paint paint2 = new Paint();
        this.f21292h = paint2;
        paint2.setAntiAlias(true);
        paint2.setColor(p.b(context, 16843829));
        paint2.setStyle(Paint.Style.FILL);
        Resources resources = getResources();
        int dimensionPixelSize = resources.getDimensionPixelSize(2131165510);
        this.f21285a = dimensionPixelSize;
        this.f21290f = dimensionPixelSize;
        this.f21286b = resources.getDimensionPixelSize(2131165509);
        this.f21287c = resources.getDimensionPixelSize(2131165507);
        this.f21293i = resources.getDimensionPixelSize(2131165506);
        ViewConfiguration.get(context);
        this.f21289e = resources.getDisplayMetrics().density * 4.0f;
        float f11 = resources.getDisplayMetrics().density;
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, u2.K, 0, 0);
        this.o = typedArrayObtainStyledAttributes.getBoolean(0, false);
        typedArrayObtainStyledAttributes.recycle();
    }

    public final void a(boolean z11) {
        if (this.f21303u != z11) {
            this.f21303u = z11;
            this.f21302t.setTextColor(e.o(this.f21292h.getColor()));
            this.f21302t.animate().cancel();
            this.f21302t.animate().alpha(z11 ? 1.0f : 0.0f).setDuration(z11 ? 200L : 150L).start();
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:29:0x00a1  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean b(MotionEvent motionEvent, Point point) {
        int x11 = ((int) motionEvent.getX()) - point.x;
        int y11 = ((int) motionEvent.getY()) - point.y;
        int action = motionEvent.getAction();
        if (action == 0) {
            this.f21308z = x11;
            this.B = y11;
            this.A = y11;
            this.f21298p = motionEvent.getDownTime();
            if (Math.abs(this.f21288d) < this.f21289e && this.f21306x.getScrollState() != 0) {
                this.f21306x.stopScroll();
            }
            if (d(x11, y11)) {
                this.f21299q = this.A - this.f21300r;
            }
        } else if (action == 1) {
            this.f21306x.k();
            this.f21299q = 0;
            if (this.f21297m) {
                this.f21297m = false;
                a(false);
                f(false);
                c.d(this.f21306x);
            }
        } else if (action == 2) {
            this.B = y11;
            if (!this.f21297m && this.f21306x.p() && d(this.f21308z, this.B) && motionEvent.getEventTime() - this.f21298p > 40) {
                int i5 = this.A;
                int i11 = this.B;
                this.f21297m = true;
                if (this.o) {
                    this.n = true;
                }
                this.f21299q = (i11 - i5) + this.f21299q;
                a(true);
                f(true);
            }
            if (this.f21297m) {
                int iJ = this.f21306x.j() - this.f21293i;
                float fMax = Math.max(0, Math.min(iJ, y11 - this.f21299q));
                String strM = this.f21306x.m(fMax / iJ);
                if (!strM.equals(this.f21304v)) {
                    this.f21304v = strM;
                    this.f21302t.setText(strM);
                    performHapticFeedback(4);
                }
                a(!strM.isEmpty());
                e((int) fMax);
            }
        } else if (action == 3) {
        }
        return this.f21297m;
    }

    public final boolean c(float f11, float f12, Point point) {
        if (this.f21300r < 0) {
            return false;
        }
        Rect rect = C;
        getHitRect(rect);
        int iE = this.f21306x.e() + rect.top;
        rect.top = iE;
        if (point != null) {
            point.set(rect.left, iE);
        }
        return rect.contains((int) f11, (int) f12);
    }

    public final boolean d(int i5, int i11) {
        int i12 = i11 - this.f21300r;
        return i5 >= 0 && i5 < getWidth() && i12 >= 0 && i12 <= this.f21293i;
    }

    public final void e(int i5) {
        if (this.f21300r == i5) {
            if (this.f21301s != this.f21306x.h()) {
                this.f21301s = this.f21306x.h();
                return;
            }
            return;
        }
        int height = this.f21302t.getHeight();
        float fE = this.f21306x.e() + i5;
        int i11 = this.f21290f;
        int i12 = this.f21287c;
        this.f21302t.setTranslationY(g3.b(((((i11 + i12) + i12) / 2.0f) + fE) - (height / 2.0f), 0.0f, (this.f21306x.j() + (this.f21306x.e() + getTop())) - height));
        this.f21300r = i5;
        invalidate();
        this.f21301s = this.f21306x.h();
    }

    public final void f(boolean z11) {
        ObjectAnimator objectAnimator = this.f21291g;
        if (objectAnimator != null) {
            objectAnimator.cancel();
        }
        ObjectAnimator objectAnimatorOfInt = ObjectAnimator.ofInt(this, D, z11 ? this.f21286b : this.f21285a);
        this.f21291g = objectAnimatorOfInt;
        objectAnimatorOfInt.setDuration(150L);
        this.f21291g.start();
    }

    @Override // android.view.View
    public final boolean hasOverlappingRendering() {
        return false;
    }

    @Override // android.view.View
    public final WindowInsets onApplyWindowInsets(WindowInsets windowInsets) {
        if (g3.f79851f) {
            this.f21305w = windowInsets.getSystemGestureInsets();
        }
        return super.onApplyWindowInsets(windowInsets);
    }

    @Override // android.view.View
    public final void onDraw(Canvas canvas) {
        if (this.f21300r < 0) {
            if (g3.f79851f) {
                List list = Collections.EMPTY_LIST;
                setSystemGestureExclusionRects(Collections.EMPTY_LIST);
                return;
            }
            return;
        }
        int iSave = canvas.save();
        canvas.translate(getWidth() / 2, this.f21306x.e());
        int width = getWidth() / 2;
        int iE = this.f21306x.e();
        Point point = this.f21295k;
        point.set(width, iE);
        float f11 = this.f21290f / 2;
        float fJ = this.f21306x.j();
        float f12 = this.f21290f;
        canvas.drawRoundRect(-f11, 0.0f, f11, fJ, f12, f12, this.f21296l);
        canvas.translate(0.0f, this.f21300r);
        point.y += this.f21300r;
        int i5 = this.f21287c;
        float f13 = f11 + i5;
        float f14 = this.f21290f + i5 + i5;
        float f15 = this.f21293i;
        RectF rectF = this.f21294j;
        rectF.set(-f13, 0.0f, f13, f15);
        canvas.drawRoundRect(rectF, f14, f14, this.f21292h);
        boolean z11 = g3.f79851f;
        if (z11) {
            List list2 = E;
            rectF.roundOut((Rect) list2.get(0));
            ((Rect) list2.get(0)).offset(point.x, point.y);
            if (z11 && this.f21305w != null) {
                ((Rect) list2.get(0)).left = ((Rect) list2.get(0)).right - this.f21305w.right;
            }
            setSystemGestureExclusionRects(list2);
        }
        canvas.restoreToCount(iSave);
    }
}
