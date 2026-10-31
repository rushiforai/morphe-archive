package uf;

import android.animation.ValueAnimator;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Point;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewParent;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.TextView;
import androidx.recyclerview.widget.u1;
import b.c0;
import b00.b1;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import fe.a0;
import fe.l1;
import java.util.Collections;
import java.util.Formatter;
import java.util.Iterator;
import java.util.Locale;
import java.util.concurrent.CopyOnWriteArraySet;
import o9.d4;

/* loaded from: classes3.dex */
public final class d extends View implements w {
    public final int A;
    public final long B;
    public int C;
    public Rect D;
    public final ValueAnimator E;
    public float F;
    public boolean G;
    public boolean H;
    public long I;
    public long J;
    public long K;
    public long L;
    public int M;
    public long[] N;
    public boolean[] O;

    /* renamed from: a, reason: collision with root package name */
    public final Rect f91100a;

    /* renamed from: b, reason: collision with root package name */
    public final Rect f91101b;

    /* renamed from: c, reason: collision with root package name */
    public final Rect f91102c;

    /* renamed from: d, reason: collision with root package name */
    public final Rect f91103d;

    /* renamed from: e, reason: collision with root package name */
    public final Paint f91104e;

    /* renamed from: f, reason: collision with root package name */
    public final Paint f91105f;

    /* renamed from: g, reason: collision with root package name */
    public final Paint f91106g;

    /* renamed from: h, reason: collision with root package name */
    public final Paint f91107h;

    /* renamed from: i, reason: collision with root package name */
    public final Paint f91108i;

    /* renamed from: j, reason: collision with root package name */
    public final Paint f91109j;

    /* renamed from: k, reason: collision with root package name */
    public final Drawable f91110k;

    /* renamed from: l, reason: collision with root package name */
    public final int f91111l;

    /* renamed from: m, reason: collision with root package name */
    public final int f91112m;
    public final int n;
    public final int o;

    /* renamed from: p, reason: collision with root package name */
    public final int f91113p;

    /* renamed from: q, reason: collision with root package name */
    public final int f91114q;

    /* renamed from: r, reason: collision with root package name */
    public final int f91115r;

    /* renamed from: s, reason: collision with root package name */
    public final int f91116s;

    /* renamed from: t, reason: collision with root package name */
    public final int f91117t;

    /* renamed from: u, reason: collision with root package name */
    public final StringBuilder f91118u;

    /* renamed from: v, reason: collision with root package name */
    public final Formatter f91119v;

    /* renamed from: w, reason: collision with root package name */
    public final d4 f91120w;

    /* renamed from: x, reason: collision with root package name */
    public final CopyOnWriteArraySet f91121x;

    /* renamed from: y, reason: collision with root package name */
    public final Point f91122y;

    /* renamed from: z, reason: collision with root package name */
    public final float f91123z;

    public d(Context context) {
        super(context, null, 0);
        this.f91100a = new Rect();
        this.f91101b = new Rect();
        this.f91102c = new Rect();
        this.f91103d = new Rect();
        Paint paint = new Paint();
        this.f91104e = paint;
        Paint paint2 = new Paint();
        this.f91105f = paint2;
        Paint paint3 = new Paint();
        this.f91106g = paint3;
        Paint paint4 = new Paint();
        this.f91107h = paint4;
        Paint paint5 = new Paint();
        this.f91108i = paint5;
        Paint paint6 = new Paint();
        this.f91109j = paint6;
        paint6.setAntiAlias(true);
        this.f91121x = new CopyOnWriteArraySet();
        this.f91122y = new Point();
        float f11 = context.getResources().getDisplayMetrics().density;
        this.f91123z = f11;
        this.f91117t = a(f11, -50);
        int iA = a(f11, 4);
        int iA2 = a(f11, 26);
        int iA3 = a(f11, 4);
        int iA4 = a(f11, 12);
        int iA5 = a(f11, 0);
        int iA6 = a(f11, 16);
        this.f91111l = iA;
        this.f91112m = iA2;
        this.n = 0;
        this.o = iA3;
        this.f91113p = iA4;
        this.f91114q = iA5;
        this.f91115r = iA6;
        paint.setColor(-1);
        paint6.setColor(-1);
        paint2.setColor(-855638017);
        paint3.setColor(872415231);
        paint4.setColor(-1291845888);
        paint5.setColor(872414976);
        this.f91110k = null;
        StringBuilder sb2 = new StringBuilder();
        this.f91118u = sb2;
        this.f91119v = new Formatter(sb2, Locale.getDefault());
        this.f91120w = new d4(this, 12);
        this.f91116s = (Math.max(iA5, Math.max(iA4, iA6)) + 1) / 2;
        this.F = 1.0f;
        ValueAnimator valueAnimator = new ValueAnimator();
        this.E = valueAnimator;
        valueAnimator.addUpdateListener(new b1(this, 8));
        this.J = -9223372036854775807L;
        this.B = -9223372036854775807L;
        this.A = 20;
        setFocusable(true);
        if (getImportantForAccessibility() == 0) {
            setImportantForAccessibility(1);
        }
    }

    public static int a(float f11, int i5) {
        return (int) ((i5 * f11) + 0.5f);
    }

    public final long b() {
        long j11 = this.B;
        if (j11 != -9223372036854775807L) {
            return j11;
        }
        long j12 = this.J;
        if (j12 == -9223372036854775807L) {
            return 0L;
        }
        return j12 / this.A;
    }

    public final long c() {
        if (this.f91101b.width() <= 0 || this.J == -9223372036854775807L) {
            return 0L;
        }
        return (this.f91103d.width() * this.J) / r0.width();
    }

    public final boolean d(long j11) {
        long j12 = this.J;
        if (j12 <= 0) {
            return false;
        }
        long j13 = this.H ? this.I : this.K;
        long jI = wf.v.i(j13 + j11, 0L, j12);
        if (jI == j13) {
            return false;
        }
        if (this.H) {
            h(jI);
        } else {
            e(jI);
        }
        g();
        return true;
    }

    @Override // android.view.View
    public final void drawableStateChanged() {
        super.drawableStateChanged();
        Drawable drawable = this.f91110k;
        if (drawable != null && drawable.isStateful() && drawable.setState(getDrawableState())) {
            invalidate();
        }
    }

    public final void e(long j11) {
        this.I = j11;
        this.H = true;
        setPressed(true);
        ViewParent parent = getParent();
        if (parent != null) {
            parent.requestDisallowInterceptTouchEvent(true);
        }
        Iterator it = this.f91121x.iterator();
        while (it.hasNext()) {
            m mVar = ((g) it.next()).f91129a;
            mVar.f91155d0 = true;
            TextView textView = mVar.B;
            if (textView != null) {
                textView.setText(wf.v.r(mVar.D, mVar.E, j11));
            }
            mVar.f91148a.e();
        }
    }

    public final void f(boolean z11) {
        l1 l1Var;
        removeCallbacks(this.f91120w);
        this.H = false;
        setPressed(false);
        ViewParent parent = getParent();
        if (parent != null) {
            parent.requestDisallowInterceptTouchEvent(false);
        }
        invalidate();
        Iterator it = this.f91121x.iterator();
        while (it.hasNext()) {
            g gVar = (g) it.next();
            long j11 = this.I;
            m mVar = gVar.f91129a;
            mVar.f91155d0 = false;
            if (!z11 && (l1Var = mVar.f91151b0) != null) {
                a0 a0Var = (a0) l1Var;
                a0Var.O();
                int iL = a0Var.L();
                a0Var.s0();
                a0Var.f0(j11, iL, false);
                mVar.m();
            }
            mVar.f91148a.f();
        }
    }

    public final void g() {
        Rect rect = this.f91102c;
        Rect rect2 = this.f91101b;
        rect.set(rect2);
        Rect rect3 = this.f91103d;
        rect3.set(rect2);
        long j11 = this.H ? this.I : this.K;
        if (this.J > 0) {
            rect.right = Math.min(rect2.left + ((int) ((rect2.width() * this.L) / this.J)), rect2.right);
            rect3.right = Math.min(rect2.left + ((int) ((rect2.width() * j11) / this.J)), rect2.right);
        } else {
            int i5 = rect2.left;
            rect.right = i5;
            rect3.right = i5;
        }
        invalidate(this.f91100a);
    }

    public final void h(long j11) {
        if (this.I == j11) {
            return;
        }
        this.I = j11;
        Iterator it = this.f91121x.iterator();
        while (it.hasNext()) {
            m mVar = ((g) it.next()).f91129a;
            TextView textView = mVar.B;
            if (textView != null) {
                textView.setText(wf.v.r(mVar.D, mVar.E, j11));
            }
        }
    }

    @Override // android.view.View
    public final void jumpDrawablesToCurrentState() {
        super.jumpDrawablesToCurrentState();
        Drawable drawable = this.f91110k;
        if (drawable != null) {
            drawable.jumpToCurrentState();
        }
    }

    @Override // android.view.View
    public final void onDraw(Canvas canvas) {
        Canvas canvas2;
        canvas.save();
        Rect rect = this.f91101b;
        int iHeight = rect.height();
        int iCenterY = rect.centerY() - (iHeight / 2);
        int i5 = iCenterY + iHeight;
        long j11 = this.J;
        Paint paint = this.f91106g;
        Rect rect2 = this.f91103d;
        if (j11 <= 0) {
            canvas2 = canvas;
            canvas2.drawRect(rect.left, iCenterY, rect.right, i5, paint);
        } else {
            Rect rect3 = this.f91102c;
            int i11 = rect3.left;
            int i12 = rect3.right;
            int iMax = Math.max(Math.max(rect.left, i12), rect2.right);
            int i13 = rect.right;
            if (iMax < i13) {
                canvas.drawRect(iMax, iCenterY, i13, i5, paint);
            }
            int iMax2 = Math.max(i11, rect2.right);
            if (i12 > iMax2) {
                canvas.drawRect(iMax2, iCenterY, i12, i5, this.f91105f);
            }
            if (rect2.width() > 0) {
                canvas.drawRect(rect2.left, iCenterY, rect2.right, i5, this.f91104e);
            }
            if (this.M != 0) {
                long[] jArr = this.N;
                jArr.getClass();
                boolean[] zArr = this.O;
                zArr.getClass();
                int i14 = this.o;
                int i15 = i14 / 2;
                int i16 = 0;
                int i17 = 0;
                while (i17 < this.M) {
                    int i18 = i17;
                    canvas.drawRect(Math.min(rect.width() - i14, Math.max(i16, ((int) ((rect.width() * wf.v.i(jArr[i17], 0L, this.J)) / this.J)) - i15)) + rect.left, iCenterY, r3 + i14, i5, zArr[i17] ? this.f91108i : this.f91107h);
                    i17 = i18 + 1;
                    i16 = i16;
                }
            }
            canvas2 = canvas;
        }
        if (this.J > 0) {
            int iH = wf.v.h(rect2.right, rect2.left, rect.right);
            int iCenterY2 = rect2.centerY();
            Drawable drawable = this.f91110k;
            if (drawable == null) {
                canvas2.drawCircle(iH, iCenterY2, (int) ((((this.H || isFocused()) ? this.f91115r : isEnabled() ? this.f91113p : this.f91114q) * this.F) / 2.0f), this.f91109j);
            } else {
                int intrinsicWidth = ((int) (drawable.getIntrinsicWidth() * this.F)) / 2;
                int intrinsicHeight = ((int) (drawable.getIntrinsicHeight() * this.F)) / 2;
                drawable.setBounds(iH - intrinsicWidth, iCenterY2 - intrinsicHeight, iH + intrinsicWidth, iCenterY2 + intrinsicHeight);
                drawable.draw(canvas2);
            }
        }
        canvas2.restore();
    }

    @Override // android.view.View
    public final void onFocusChanged(boolean z11, int i5, Rect rect) {
        super.onFocusChanged(z11, i5, rect);
        if (!this.H || z11) {
            return;
        }
        f(false);
    }

    @Override // android.view.View
    public final void onInitializeAccessibilityEvent(AccessibilityEvent accessibilityEvent) {
        super.onInitializeAccessibilityEvent(accessibilityEvent);
        if (accessibilityEvent.getEventType() == 4) {
            accessibilityEvent.getText().add(wf.v.r(this.f91118u, this.f91119v, this.K));
        }
        accessibilityEvent.setClassName("android.widget.SeekBar");
    }

    @Override // android.view.View
    public final void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo accessibilityNodeInfo) {
        super.onInitializeAccessibilityNodeInfo(accessibilityNodeInfo);
        accessibilityNodeInfo.setClassName("android.widget.SeekBar");
        accessibilityNodeInfo.setContentDescription(wf.v.r(this.f91118u, this.f91119v, this.K));
        if (this.J <= 0) {
            return;
        }
        if (wf.v.f94376a >= 21) {
            accessibilityNodeInfo.addAction(AccessibilityNodeInfo.AccessibilityAction.ACTION_SCROLL_FORWARD);
            accessibilityNodeInfo.addAction(AccessibilityNodeInfo.AccessibilityAction.ACTION_SCROLL_BACKWARD);
        } else {
            accessibilityNodeInfo.addAction(u1.FLAG_APPEARED_IN_PRE_LAYOUT);
            accessibilityNodeInfo.addAction(UserMetadata.MAX_INTERNAL_KEY_SIZE);
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:11:0x001a  */
    /* JADX WARN: Removed duplicated region for block: B:13:0x0025  */
    @Override // android.view.View, android.view.KeyEvent.Callback
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean onKeyDown(int i5, KeyEvent keyEvent) {
        if (isEnabled()) {
            long jB = b();
            if (i5 != 66) {
                switch (i5) {
                    case 21:
                        jB = -jB;
                        if (d(jB)) {
                            d4 d4Var = this.f91120w;
                            removeCallbacks(d4Var);
                            postDelayed(d4Var, 1000L);
                            break;
                        }
                        break;
                    case 22:
                        if (d(jB)) {
                        }
                        break;
                    case 23:
                        if (this.H) {
                            f(false);
                            break;
                        }
                        break;
                }
                return true;
            }
        }
        return super.onKeyDown(i5, keyEvent);
    }

    @Override // android.view.View
    public final void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        int paddingBottom;
        int paddingBottom2;
        Rect rect;
        int i14 = i12 - i5;
        int i15 = i13 - i11;
        int paddingLeft = getPaddingLeft();
        int paddingRight = i14 - getPaddingRight();
        int i16 = this.G ? 0 : this.f91116s;
        int i17 = this.n;
        int i18 = this.f91111l;
        int i19 = this.f91112m;
        if (i17 == 1) {
            paddingBottom = (i15 - getPaddingBottom()) - i19;
            paddingBottom2 = ((i15 - getPaddingBottom()) - i18) - Math.max(i16 - (i18 / 2), 0);
        } else {
            paddingBottom = (i15 - i19) / 2;
            paddingBottom2 = (i15 - i18) / 2;
        }
        Rect rect2 = this.f91100a;
        rect2.set(paddingLeft, paddingBottom, paddingRight, i19 + paddingBottom);
        this.f91101b.set(rect2.left + i16, paddingBottom2, rect2.right - i16, i18 + paddingBottom2);
        if (wf.v.f94376a >= 29 && ((rect = this.D) == null || rect.width() != i14 || this.D.height() != i15)) {
            Rect rect3 = new Rect(0, 0, i14, i15);
            this.D = rect3;
            setSystemGestureExclusionRects(Collections.singletonList(rect3));
        }
        g();
    }

    @Override // android.view.View
    public final void onMeasure(int i5, int i11) {
        int mode = View.MeasureSpec.getMode(i11);
        int size = View.MeasureSpec.getSize(i11);
        int i12 = this.f91112m;
        if (mode == 0) {
            size = i12;
        } else if (mode != 1073741824) {
            size = Math.min(i12, size);
        }
        setMeasuredDimension(View.MeasureSpec.getSize(i5), size);
        Drawable drawable = this.f91110k;
        if (drawable != null && drawable.isStateful() && drawable.setState(getDrawableState())) {
            invalidate();
        }
    }

    @Override // android.view.View
    public final void onRtlPropertiesChanged(int i5) {
        Drawable drawable = this.f91110k;
        if (drawable == null || wf.v.f94376a < 23 || !drawable.setLayoutDirection(i5)) {
            return;
        }
        invalidate();
    }

    /* JADX WARN: Removed duplicated region for block: B:23:0x006f  */
    @Override // android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean onTouchEvent(MotionEvent motionEvent) {
        if (isEnabled() && this.J > 0) {
            int x11 = (int) motionEvent.getX();
            int y11 = (int) motionEvent.getY();
            Point point = this.f91122y;
            point.set(x11, y11);
            int i5 = point.x;
            int i11 = point.y;
            int action = motionEvent.getAction();
            Rect rect = this.f91101b;
            Rect rect2 = this.f91103d;
            if (action == 0) {
                int i12 = i5;
                if (this.f91100a.contains(i12, i11)) {
                    rect2.right = wf.v.h(i12, rect.left, rect.right);
                    e(c());
                    g();
                    invalidate();
                    return true;
                }
            } else if (action == 1) {
                if (this.H) {
                    f(motionEvent.getAction() == 3);
                    return true;
                }
            } else if (action != 2) {
                if (action == 3) {
                }
            } else if (this.H) {
                if (i11 < this.f91117t) {
                    int i13 = this.C;
                    rect2.right = wf.v.h(c0.c(i5, i13, 3, i13), rect.left, rect.right);
                } else {
                    this.C = i5;
                    rect2.right = wf.v.h(i5, rect.left, rect.right);
                }
                h(c());
                g();
                invalidate();
                return true;
            }
        }
        return false;
    }

    @Override // android.view.View
    public final boolean performAccessibilityAction(int i5, Bundle bundle) {
        if (super.performAccessibilityAction(i5, bundle)) {
            return true;
        }
        if (this.J <= 0) {
            return false;
        }
        if (i5 == 8192) {
            if (d(-b())) {
                f(false);
            }
        } else {
            if (i5 != 4096) {
                return false;
            }
            if (d(b())) {
                f(false);
            }
        }
        sendAccessibilityEvent(4);
        return true;
    }

    @Override // android.view.View
    public final void setEnabled(boolean z11) {
        super.setEnabled(z11);
        if (!this.H || z11) {
            return;
        }
        f(true);
    }
}
