package com.teslacoilsw.launcher.widget;

import ai.h;
import ai.i2;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Point;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.text.InputFilter;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.util.SparseArray;
import android.util.TypedValue;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityManager;
import android.view.accessibility.AccessibilityNodeProvider;
import android.view.animation.DecelerateInterpolator;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.Scroller;
import androidx.compose.ui.node.LayoutNode;
import androidx.recyclerview.widget.n0;
import b.c0;
import be.f;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Formatter;
import java.util.Locale;
import l30.l;
import l30.m;
import l30.n;
import l30.o;
import o9.u2;

/* loaded from: classes4.dex */
public class NumberPicker extends LinearLayout {

    /* renamed from: f0, reason: collision with root package name */
    public static final char[] f46425f0;
    public float A;
    public float B;
    public long C;
    public float D;
    public float E;
    public VelocityTracker F;
    public final int G;
    public final int H;
    public final int I;
    public final int J;
    public final boolean K;
    public final Drawable L;
    public final int M;
    public int N;
    public boolean O;
    public boolean P;
    public final Rect Q;
    public final Rect R;
    public int S;
    public boolean T;
    public boolean U;
    public m V;
    public final o W;

    /* renamed from: a, reason: collision with root package name */
    public final EditText f46426a;

    /* renamed from: a0, reason: collision with root package name */
    public int f46427a0;

    /* renamed from: b, reason: collision with root package name */
    public final int f46428b;

    /* renamed from: b0, reason: collision with root package name */
    public final boolean f46429b0;

    /* renamed from: c, reason: collision with root package name */
    public final int f46430c;

    /* renamed from: c0, reason: collision with root package name */
    public final AccessibilityManager f46431c0;

    /* renamed from: d, reason: collision with root package name */
    public final int f46432d;

    /* renamed from: d0, reason: collision with root package name */
    public final Rect f46433d0;

    /* renamed from: e, reason: collision with root package name */
    public final int f46434e;

    /* renamed from: e0, reason: collision with root package name */
    public final Point f46435e0;

    /* renamed from: f, reason: collision with root package name */
    public int f46436f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f46437g;

    /* renamed from: h, reason: collision with root package name */
    public final int f46438h;

    /* renamed from: i, reason: collision with root package name */
    public int f46439i;

    /* renamed from: j, reason: collision with root package name */
    public int f46440j;

    /* renamed from: k, reason: collision with root package name */
    public int f46441k;

    /* renamed from: l, reason: collision with root package name */
    public int f46442l;

    /* renamed from: m, reason: collision with root package name */
    public f f46443m;
    public final long n;
    public final SparseArray o;

    /* renamed from: p, reason: collision with root package name */
    public final int[] f46444p;

    /* renamed from: q, reason: collision with root package name */
    public final Paint f46445q;

    /* renamed from: r, reason: collision with root package name */
    public final Drawable f46446r;

    /* renamed from: s, reason: collision with root package name */
    public int f46447s;

    /* renamed from: t, reason: collision with root package name */
    public int f46448t;

    /* renamed from: u, reason: collision with root package name */
    public int f46449u;

    /* renamed from: v, reason: collision with root package name */
    public final Scroller f46450v;

    /* renamed from: w, reason: collision with root package name */
    public final Scroller f46451w;

    /* renamed from: x, reason: collision with root package name */
    public int f46452x;

    /* renamed from: y, reason: collision with root package name */
    public i2 f46453y;

    /* renamed from: z, reason: collision with root package name */
    public h f46454z;

    public static class CustomEditText extends EditText {
        public CustomEditText(Context context, AttributeSet attributeSet) {
            super(context, attributeSet);
        }

        @Override // android.widget.TextView
        public final void onEditorAction(int i5) {
            super.onEditorAction(i5);
            if (i5 == 6) {
                clearFocus();
            }
        }
    }

    static {
        new Formatter(new StringBuilder(), Locale.getDefault());
        f46425f0 = new char[]{'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 1632, 1633, 1634, 1635, 1636, 1637, 1638, 1639, 1640, 1641, 1776, 1777, 1778, 1779, 1780, 1781, 1782, 1783, 1784, 1785, 2406, 2407, 2408, 2409, 2410, 2411, 2412, 2413, 2414, 2415, 2534, 2535, 2536, 2537, 2538, 2539, 2540, 2541, 2542, 2543, 3302, 3303, 3304, 3305, 3306, 3307, 3308, 3309, 3310, 3311};
    }

    public NumberPicker(Context context, AttributeSet attributeSet) {
        super(context, attributeSet, 2130969760);
        this.n = 300L;
        this.o = new SparseArray();
        this.f46444p = new int[3];
        this.f46448t = Integer.MIN_VALUE;
        this.N = 0;
        this.Q = new Rect();
        this.R = new Rect();
        this.f46427a0 = -1;
        this.f46433d0 = new Rect();
        this.f46435e0 = new Point();
        this.f46431c0 = isInEditMode() ? null : (AccessibilityManager) getContext().getSystemService("accessibility");
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, u2.F, 2130969760, 2132083116);
        int resourceId = typedArrayObtainStyledAttributes.getResourceId(1, 2131624290);
        this.K = true;
        this.f46429b0 = typedArrayObtainStyledAttributes.getBoolean(0, false);
        this.J = typedArrayObtainStyledAttributes.getColor(9, 0);
        this.L = typedArrayObtainStyledAttributes.getDrawable(6);
        this.M = typedArrayObtainStyledAttributes.getDimensionPixelSize(7, (int) TypedValue.applyDimension(1, 2.0f, getResources().getDisplayMetrics()));
        this.f46428b = typedArrayObtainStyledAttributes.getDimensionPixelSize(8, (int) TypedValue.applyDimension(1, 48.0f, getResources().getDisplayMetrics()));
        int dimensionPixelSize = typedArrayObtainStyledAttributes.getDimensionPixelSize(4, -1);
        this.f46430c = dimensionPixelSize;
        int dimensionPixelSize2 = typedArrayObtainStyledAttributes.getDimensionPixelSize(2, -1);
        this.f46432d = dimensionPixelSize2;
        if (dimensionPixelSize != -1 && dimensionPixelSize2 != -1 && dimensionPixelSize > dimensionPixelSize2) {
            throw new IllegalArgumentException("minHeight > maxHeight");
        }
        int dimensionPixelSize3 = typedArrayObtainStyledAttributes.getDimensionPixelSize(5, -1);
        this.f46434e = dimensionPixelSize3;
        int dimensionPixelSize4 = typedArrayObtainStyledAttributes.getDimensionPixelSize(3, -1);
        this.f46436f = dimensionPixelSize4;
        if (dimensionPixelSize3 != -1 && dimensionPixelSize4 != -1 && dimensionPixelSize3 > dimensionPixelSize4) {
            throw new IllegalArgumentException("minWidth > maxWidth");
        }
        this.f46437g = dimensionPixelSize4 == -1;
        this.f46446r = typedArrayObtainStyledAttributes.getDrawable(10);
        typedArrayObtainStyledAttributes.recycle();
        this.W = new o(this);
        setWillNotDraw(false);
        ((LayoutInflater) getContext().getSystemService("layout_inflater")).inflate(resourceId, (ViewGroup) this, true);
        EditText editText = (EditText) findViewById(2131428480);
        this.f46426a = editText;
        editText.setOnFocusChangeListener(new l(this));
        editText.setFilters(new InputFilter[]{new n(this)});
        editText.setRawInputType(2);
        editText.setImeOptions(6);
        ViewConfiguration viewConfiguration = ViewConfiguration.get(context);
        this.G = viewConfiguration.getScaledTouchSlop();
        this.H = viewConfiguration.getScaledMinimumFlingVelocity() * 5;
        this.I = viewConfiguration.getScaledMaximumFlingVelocity() / 8;
        int textSize = (int) editText.getTextSize();
        this.f46438h = textSize;
        Paint paint = new Paint();
        paint.setAntiAlias(true);
        paint.setTextAlign(Paint.Align.CENTER);
        paint.setTextSize(textSize);
        paint.setTypeface(editText.getTypeface());
        paint.setColor(editText.getTextColors().getColorForState(LinearLayout.ENABLED_STATE_SET, -1));
        this.f46445q = paint;
        this.f46450v = new Scroller(getContext(), null, true);
        this.f46451w = new Scroller(getContext(), new DecelerateInterpolator(2.5f));
        s();
        if (getImportantForAccessibility() == 0) {
            setImportantForAccessibility(1);
        }
    }

    public static void a(NumberPicker numberPicker, boolean z11) {
        Rect rect = numberPicker.Q;
        Rect rect2 = numberPicker.R;
        if (z11) {
            if (numberPicker.getOrientation() == 1) {
                numberPicker.invalidate(0, rect2.bottom, numberPicker.getRight(), numberPicker.getBottom());
                return;
            } else {
                numberPicker.invalidate(rect2.right, 0, numberPicker.getRight(), numberPicker.getBottom());
                return;
            }
        }
        if (numberPicker.getOrientation() == 1) {
            numberPicker.invalidate(0, 0, numberPicker.getRight(), rect.top);
        } else {
            numberPicker.invalidate(0, 0, rect.left, numberPicker.getBottom());
        }
    }

    public static String e(int i5) {
        return String.format(Locale.getDefault(), "%d", Integer.valueOf(i5));
    }

    public static int k(int i5, int i11) {
        if (i11 != -1) {
            int size = View.MeasureSpec.getSize(i5);
            int mode = View.MeasureSpec.getMode(i5);
            if (mode == Integer.MIN_VALUE) {
                return View.MeasureSpec.makeMeasureSpec(Math.min(size, i11), 1073741824);
            }
            if (mode == 0) {
                return View.MeasureSpec.makeMeasureSpec(i11, 1073741824);
            }
            if (mode != 1073741824) {
                throw new IllegalArgumentException(c0.h(mode, "Unknown measure mode: "));
            }
        }
        return i5;
    }

    public final void b(boolean z11) {
        if (!this.K) {
            if (z11) {
                p(this.f46442l + 1, true);
                return;
            } else {
                p(this.f46442l - 1, true);
                return;
            }
        }
        this.f46426a.setVisibility(4);
        Scroller scroller = this.f46450v;
        if (!l(scroller)) {
            l(this.f46451w);
        }
        this.f46452x = 0;
        if (getOrientation() == 1) {
            if (z11) {
                scroller.startScroll(0, 0, 0, -this.f46447s, n0.DEFAULT_SWIPE_ANIMATION_DURATION);
            } else {
                scroller.startScroll(0, 0, 0, this.f46447s, n0.DEFAULT_SWIPE_ANIMATION_DURATION);
            }
        } else if (z11) {
            scroller.startScroll(0, 0, -this.f46447s, 0, n0.DEFAULT_SWIPE_ANIMATION_DURATION);
        } else {
            scroller.startScroll(0, 0, this.f46447s, 0, n0.DEFAULT_SWIPE_ANIMATION_DURATION);
        }
        invalidate();
    }

    public final void c(int i5) {
        SparseArray sparseArray = this.o;
        if (((String) sparseArray.get(i5)) != null) {
            return;
        }
        sparseArray.put(i5, (i5 < this.f46440j || i5 > this.f46441k) ? b.f42142b : e(i5));
    }

    @Override // android.view.View
    public final int computeHorizontalScrollOffset() {
        return getOrientation() == 0 ? this.f46449u : super.computeHorizontalScrollOffset();
    }

    @Override // android.view.View
    public final int computeHorizontalScrollRange() {
        return getOrientation() == 0 ? ((this.f46441k - this.f46440j) + 1) * this.f46447s : super.computeHorizontalScrollRange();
    }

    @Override // android.view.View
    public final void computeScroll() {
        Scroller scroller;
        Scroller scroller2 = this.f46450v;
        if (scroller2.isFinished()) {
            scroller = this.f46451w;
            if (scroller.isFinished()) {
                return;
            }
        } else {
            scroller = scroller2;
        }
        scroller.computeScrollOffset();
        int currY = getOrientation() == 1 ? scroller.getCurrY() : scroller.getCurrX();
        if (this.f46452x == 0) {
            this.f46452x = getOrientation() == 1 ? scroller.getStartY() : scroller.getStartX();
        }
        int i5 = currY - this.f46452x;
        if (getOrientation() == 1) {
            scrollBy(0, i5);
        } else {
            scrollBy(i5, 0);
        }
        this.f46452x = currY;
        if (!scroller.isFinished()) {
            invalidate();
            return;
        }
        if (scroller != scroller2) {
            if (this.N != 1) {
                s();
            }
        } else {
            if (!d()) {
                s();
            }
            if (this.N == 0) {
                return;
            }
            this.N = 0;
        }
    }

    @Override // android.view.View
    public final int computeVerticalScrollOffset() {
        return getOrientation() == 1 ? this.f46449u : super.computeVerticalScrollOffset();
    }

    @Override // android.view.View
    public final int computeVerticalScrollRange() {
        return getOrientation() == 1 ? ((this.f46441k - this.f46440j) + 1) * this.f46447s : super.computeVerticalScrollOffset();
    }

    public final boolean d() {
        int i5 = this.f46448t - this.f46449u;
        if (i5 == 0) {
            return false;
        }
        this.f46452x = 0;
        int iAbs = Math.abs(i5);
        int i11 = this.f46447s;
        if (iAbs > i11 / 2) {
            if (i5 > 0) {
                i11 = -i11;
            }
            i5 += i11;
        }
        int i12 = i5;
        int orientation = getOrientation();
        Scroller scroller = this.f46451w;
        if (orientation == 1) {
            scroller.startScroll(0, 0, 0, i12, 800);
        } else {
            scroller.startScroll(0, 0, i12, 0, 800);
        }
        invalidate();
        return true;
    }

    @Override // android.view.ViewGroup, android.view.View
    public final boolean dispatchHoverEvent(MotionEvent motionEvent) {
        if (!this.K) {
            return super.dispatchHoverEvent(motionEvent);
        }
        if (!this.f46431c0.isEnabled()) {
            return false;
        }
        int y11 = (int) motionEvent.getY();
        float x11 = (int) motionEvent.getX();
        float f11 = y11;
        int i5 = i(x11, f11, this.Q) ? 3 : h(x11, f11, this.R) ? 1 : 2;
        int actionMasked = motionEvent.getActionMasked();
        m mVar = (m) getAccessibilityNodeProvider();
        if (actionMasked == 7) {
            int i11 = this.S;
            if (i11 == i5 || i11 == -1) {
                return false;
            }
            mVar.f(i11, 256);
            mVar.f(i5, 128);
            this.S = i5;
            mVar.performAction(i5, 64, null);
            return false;
        }
        if (actionMasked == 9) {
            mVar.f(i5, 128);
            this.S = i5;
            mVar.performAction(i5, 64, null);
            return false;
        }
        if (actionMasked != 10) {
            return false;
        }
        mVar.f(i5, 256);
        this.S = -1;
        return false;
    }

    /* JADX WARN: Code restructure failed: missing block: B:28:0x003f, code lost:
    
        requestFocus();
        r5.f46427a0 = r0;
        m();
     */
    /* JADX WARN: Code restructure failed: missing block: B:29:0x004d, code lost:
    
        if (r5.f46450v.isFinished() == false) goto L34;
     */
    /* JADX WARN: Code restructure failed: missing block: B:30:0x004f, code lost:
    
        if (r0 != 20) goto L32;
     */
    /* JADX WARN: Code restructure failed: missing block: B:31:0x0051, code lost:
    
        r6 = true;
     */
    /* JADX WARN: Code restructure failed: missing block: B:32:0x0053, code lost:
    
        r6 = false;
     */
    /* JADX WARN: Code restructure failed: missing block: B:33:0x0054, code lost:
    
        b(r6);
     */
    /* JADX WARN: Code restructure failed: missing block: B:34:0x0057, code lost:
    
        return true;
     */
    @Override // android.view.ViewGroup, android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean dispatchKeyEvent(KeyEvent keyEvent) {
        int keyCode = keyEvent.getKeyCode();
        if (keyCode == 19 || keyCode == 20) {
            if (this.K) {
                int action = keyEvent.getAction();
                if (action != 0) {
                    if (action == 1 && this.f46427a0 == keyCode) {
                        this.f46427a0 = -1;
                        return true;
                    }
                } else if (keyCode == 20) {
                }
            }
        } else if (keyCode == 23 || keyCode == 66) {
            m();
        }
        return super.dispatchKeyEvent(keyEvent);
    }

    @Override // android.view.ViewGroup, android.view.View
    public final boolean dispatchTouchEvent(MotionEvent motionEvent) {
        int actionMasked = motionEvent.getActionMasked();
        if (actionMasked == 1 || actionMasked == 3) {
            m();
        }
        return super.dispatchTouchEvent(motionEvent);
    }

    @Override // android.view.ViewGroup, android.view.View
    public final boolean dispatchTrackballEvent(MotionEvent motionEvent) {
        int actionMasked = motionEvent.getActionMasked();
        if (actionMasked == 1 || actionMasked == 3) {
            m();
        }
        return super.dispatchTrackballEvent(motionEvent);
    }

    public final void f() {
        InputMethodManager inputMethodManager = (InputMethodManager) getContext().getSystemService("input_method");
        if (inputMethodManager != null) {
            EditText editText = this.f46426a;
            if (inputMethodManager.isActive(editText)) {
                inputMethodManager.hideSoftInputFromWindow(getWindowToken(), 0);
                if (this.K) {
                    editText.setVisibility(4);
                }
            }
        }
    }

    public final void g() {
        this.o.clear();
        int i5 = this.f46442l;
        int i11 = 0;
        while (true) {
            int[] iArr = this.f46444p;
            if (i11 >= iArr.length) {
                return;
            }
            int i12 = (i11 - 1) + i5;
            iArr[i11] = i12;
            c(i12);
            i11++;
        }
    }

    @Override // android.view.View
    public final AccessibilityNodeProvider getAccessibilityNodeProvider() {
        if (!this.K) {
            return super.getAccessibilityNodeProvider();
        }
        if (this.V == null) {
            this.V = new m(this);
        }
        return this.V;
    }

    @Override // android.view.View
    public final float getBottomFadingEdgeStrength() {
        return 0.9f;
    }

    @Override // android.view.View
    public final int getSolidColor() {
        return this.J;
    }

    @Override // android.view.View
    public final float getTopFadingEdgeStrength() {
        return 0.9f;
    }

    public final boolean h(float f11, float f12, Rect rect) {
        return getOrientation() == 1 ? f12 > ((float) rect.bottom) : f11 > ((float) rect.right);
    }

    public final boolean i(float f11, float f12, Rect rect) {
        return getOrientation() == 1 ? f12 < ((float) rect.top) : f11 < ((float) rect.left);
    }

    public final boolean j(Rect rect) {
        if (!isAttachedToWindow() || !hasWindowFocus()) {
            return false;
        }
        Object parent = this;
        while (parent instanceof View) {
            View view = (View) parent;
            if (view.getAlpha() <= 0.0f || view.getVisibility() != 0) {
                return false;
            }
            parent = view.getParent();
        }
        Rect rect2 = this.f46433d0;
        Point point = this.f46435e0;
        if (!getGlobalVisibleRect(rect2, point)) {
            return false;
        }
        if (rect == null) {
            return true;
        }
        rect2.offset(-point.x, -point.y);
        return rect.intersect(rect2);
    }

    public final boolean l(Scroller scroller) {
        int finalX;
        int currX;
        scroller.forceFinished(true);
        if (getOrientation() == 1) {
            finalX = scroller.getFinalY();
            currX = scroller.getCurrY();
        } else {
            finalX = scroller.getFinalX();
            currX = scroller.getCurrX();
        }
        int i5 = finalX - currX;
        int i11 = this.f46448t - ((this.f46449u + i5) % this.f46447s);
        if (i11 == 0) {
            return false;
        }
        int iAbs = Math.abs(i11);
        int i12 = this.f46447s;
        if (iAbs > i12 / 2) {
            i11 = i11 > 0 ? i11 - i12 : i11 + i12;
        }
        int i13 = i5 + i11;
        if (getOrientation() == 1) {
            scrollBy(0, i13);
            return true;
        }
        scrollBy(i13, 0);
        return true;
    }

    public final void m() {
        i2 i2Var = this.f46453y;
        if (i2Var != null) {
            removeCallbacks(i2Var);
        }
        h hVar = this.f46454z;
        if (hVar != null) {
            removeCallbacks(hVar);
        }
        this.W.a();
    }

    public final void n(int i5) {
        if (this.f46441k == i5) {
            return;
        }
        if (i5 < 0) {
            throw new IllegalArgumentException("maxValue must be >= 0");
        }
        this.f46441k = i5;
        if (i5 < this.f46442l) {
            this.f46442l = i5;
        }
        int length = this.f46444p.length;
        g();
        s();
        r();
        invalidate();
    }

    public final void o(int i5) {
        if (this.f46440j == i5) {
            return;
        }
        if (i5 < 0) {
            throw new IllegalArgumentException("minValue must be >= 0");
        }
        this.f46440j = i5;
        if (i5 > this.f46442l) {
            this.f46442l = i5;
        }
        int length = this.f46444p.length;
        g();
        s();
        r();
        invalidate();
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        m();
    }

    @Override // android.widget.LinearLayout, android.view.View
    public final void onDraw(Canvas canvas) {
        float right;
        float fHeight;
        Drawable drawable;
        Drawable drawable2;
        if (!this.K) {
            super.onDraw(canvas);
            return;
        }
        boolean zHasFocus = this.f46429b0 ? hasFocus() : true;
        Rect rect = this.R;
        Rect rect2 = this.Q;
        int i5 = 0;
        if (zHasFocus && (drawable2 = this.f46446r) != null && this.N == 0) {
            boolean z11 = this.U;
            int[] iArr = LinearLayout.PRESSED_STATE_SET;
            if (z11) {
                drawable2.setState(iArr);
                if (getOrientation() == 1) {
                    drawable2.setBounds(0, 0, getRight(), rect2.top);
                } else {
                    drawable2.setBounds(0, 0, rect2.left, getBottom());
                }
                drawable2.draw(canvas);
            }
            if (this.T) {
                drawable2.setState(iArr);
                if (getOrientation() == 1) {
                    drawable2.setBounds(0, rect.bottom, getRight(), getBottom());
                } else {
                    drawable2.setBounds(rect.right, 0, getRight(), getBottom());
                }
                drawable2.draw(canvas);
            }
        }
        int orientation = getOrientation();
        Paint paint = this.f46445q;
        if (orientation == 1) {
            right = (getRight() - getLeft()) / 2;
            fHeight = this.f46449u;
        } else {
            Rect rect3 = this.f46433d0;
            paint.getTextBounds("00", 0, 2, rect3);
            right = this.f46449u;
            fHeight = (rect3.height() / 2) + ((getBottom() - getTop()) / 2);
        }
        while (true) {
            int[] iArr2 = this.f46444p;
            if (i5 >= iArr2.length) {
                break;
            }
            String str = (String) this.o.get(iArr2[i5]);
            if ((zHasFocus && i5 != 1) || (i5 == 1 && this.f46426a.getVisibility() != 0)) {
                canvas.drawText(str, right, fHeight, paint);
            }
            if (getOrientation() == 1) {
                fHeight += this.f46447s;
            } else {
                right += this.f46447s;
            }
            i5++;
        }
        if (!zHasFocus || (drawable = this.L) == null) {
            return;
        }
        drawable.setBounds(rect2);
        drawable.draw(canvas);
        drawable.setBounds(rect);
        drawable.draw(canvas);
    }

    @Override // android.view.View
    public final void onInitializeAccessibilityEvent(AccessibilityEvent accessibilityEvent) {
        super.onInitializeAccessibilityEvent(accessibilityEvent);
        accessibilityEvent.setClassName(NumberPicker.class.getName());
        accessibilityEvent.setScrollable(true);
        accessibilityEvent.setScrollY((this.f46440j + this.f46442l) * this.f46447s);
        accessibilityEvent.setMaxScrollY((this.f46441k - this.f46440j) * this.f46447s);
    }

    @Override // android.view.ViewGroup
    public final boolean onInterceptTouchEvent(MotionEvent motionEvent) {
        if (!this.K || !isEnabled() || motionEvent.getActionMasked() != 0) {
            return false;
        }
        m();
        this.f46426a.setVisibility(4);
        float y11 = motionEvent.getY();
        this.A = y11;
        this.D = y11;
        float x11 = motionEvent.getX();
        this.B = x11;
        this.E = x11;
        this.C = motionEvent.getEventTime();
        this.O = false;
        this.P = false;
        float f11 = this.B;
        float f12 = this.A;
        Rect rect = this.Q;
        boolean zI = i(f11, f12, rect);
        Rect rect2 = this.R;
        o oVar = this.W;
        if (zI) {
            if (this.N == 0) {
                oVar.a();
                oVar.f74673c = 1;
                oVar.f74672b = 2;
                ((NumberPicker) oVar.f74674d).postDelayed(oVar, ViewConfiguration.getTapTimeout());
            }
        } else if (h(this.B, this.A, rect2) && this.N == 0) {
            oVar.a();
            oVar.f74673c = 1;
            oVar.f74672b = 1;
            ((NumberPicker) oVar.f74674d).postDelayed(oVar, ViewConfiguration.getTapTimeout());
        }
        getParent().requestDisallowInterceptTouchEvent(true);
        Scroller scroller = this.f46450v;
        boolean zIsFinished = scroller.isFinished();
        Scroller scroller2 = this.f46451w;
        if (!zIsFinished) {
            scroller.forceFinished(true);
            scroller2.forceFinished(true);
            if (this.N == 0) {
                return true;
            }
            this.N = 0;
            return true;
        }
        if (!scroller2.isFinished()) {
            scroller.forceFinished(true);
            scroller2.forceFinished(true);
            return true;
        }
        if (i(this.B, this.A, rect)) {
            f();
            long longPressTimeout = ViewConfiguration.getLongPressTimeout();
            Runnable runnable = this.f46453y;
            if (runnable == null) {
                this.f46453y = new i2(this, 2);
            } else {
                removeCallbacks(runnable);
            }
            i2 i2Var = this.f46453y;
            i2Var.f13012b = false;
            postDelayed(i2Var, longPressTimeout);
            return true;
        }
        if (!h(this.B, this.A, rect2)) {
            this.P = true;
            Runnable runnable2 = this.f46454z;
            if (runnable2 == null) {
                this.f46454z = new h(this, 21);
            } else {
                removeCallbacks(runnable2);
            }
            postDelayed(this.f46454z, ViewConfiguration.getLongPressTimeout());
            return true;
        }
        f();
        long longPressTimeout2 = ViewConfiguration.getLongPressTimeout();
        Runnable runnable3 = this.f46453y;
        if (runnable3 == null) {
            this.f46453y = new i2(this, 2);
        } else {
            removeCallbacks(runnable3);
        }
        i2 i2Var2 = this.f46453y;
        i2Var2.f13012b = true;
        postDelayed(i2Var2, longPressTimeout2);
        return true;
    }

    @Override // android.widget.LinearLayout, android.view.ViewGroup, android.view.View
    public final void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        int right;
        int left;
        int iWidth;
        if (!this.K) {
            super.onLayout(z11, i5, i11, i12, i13);
            return;
        }
        int measuredWidth = getMeasuredWidth();
        int measuredHeight = getMeasuredHeight();
        EditText editText = this.f46426a;
        int measuredWidth2 = editText.getMeasuredWidth();
        int measuredHeight2 = editText.getMeasuredHeight();
        int i14 = (measuredWidth - measuredWidth2) / 2;
        int i15 = (measuredHeight - measuredHeight2) / 2;
        editText.layout(i14, i15, measuredWidth2 + i14, measuredHeight2 + i15);
        if (z11) {
            g();
            int[] iArr = this.f46444p;
            int length = iArr.length;
            int i16 = this.f46438h;
            int i17 = length * i16;
            if (getOrientation() == 1) {
                right = getBottom();
                left = getTop();
            } else {
                right = getRight();
                left = getLeft();
            }
            float f11 = (right - left) - i17;
            float length2 = iArr.length;
            if (getOrientation() == 1) {
                iWidth = i16;
            } else {
                Rect rect = new Rect();
                this.f46445q.getTextBounds("00", 0, 2, rect);
                iWidth = rect.width();
            }
            int i18 = (int) ((f11 / length2) + 0.5f);
            this.f46439i = i18;
            this.f46447s = iWidth + i18;
            if (getOrientation() == 1) {
                this.f46448t = (editText.getTop() + editText.getBaseline()) - this.f46447s;
            } else {
                editText.getLeft();
                this.f46448t = this.f46447s / 2;
            }
            this.f46449u = this.f46448t;
            s();
            if (getOrientation() == 1) {
                setVerticalFadingEdgeEnabled(true);
                setFadingEdgeLength(((getBottom() - getTop()) - i16) / 2);
            } else {
                setHorizontalFadingEdgeEnabled(true);
                setFadingEdgeLength(((getRight() - getLeft()) - i16) / 2);
            }
            int orientation = getOrientation();
            Rect rect2 = this.R;
            Rect rect3 = this.Q;
            int i19 = this.f46428b;
            int i21 = this.M;
            if (orientation == 1) {
                int height = ((getHeight() - i19) / 2) - i21;
                rect3.set(0, height, getWidth(), height + i21);
                int i22 = (i21 * 2) + height + i19;
                rect2.set(0, i22, getWidth(), i21 + i22);
                return;
            }
            int width = ((getWidth() - i19) / 2) - i21;
            rect3.set(width, 0, width + i21, getHeight());
            int i23 = (i21 * 2) + width + i19;
            rect2.set(i23, 0, i21 + i23, getHeight());
        }
    }

    @Override // android.widget.LinearLayout, android.view.View
    public final void onMeasure(int i5, int i11) {
        if (!this.K) {
            super.onMeasure(i5, i11);
            return;
        }
        super.onMeasure(k(i5, this.f46436f), k(i11, this.f46432d));
        int measuredWidth = getMeasuredWidth();
        int i12 = this.f46434e;
        if (i12 != -1) {
            measuredWidth = View.resolveSizeAndState(Math.max(i12, measuredWidth), i5, 0);
        }
        int measuredHeight = getMeasuredHeight();
        int i13 = this.f46430c;
        if (i13 != -1) {
            measuredHeight = View.resolveSizeAndState(Math.max(i13, measuredHeight), i11, 0);
        }
        setMeasuredDimension(measuredWidth, measuredHeight);
    }

    @Override // android.view.View
    public final boolean onTouchEvent(MotionEvent motionEvent) {
        float x11;
        float f11;
        float x12;
        float f12;
        float f13;
        if (!isEnabled() || !this.K) {
            return false;
        }
        if (this.F == null) {
            this.F = VelocityTracker.obtain();
        }
        this.F.addMovement(motionEvent);
        int actionMasked = motionEvent.getActionMasked();
        int i5 = this.G;
        if (actionMasked != 1) {
            if (actionMasked != 2 || this.O) {
                return true;
            }
            if (getOrientation() == 1) {
                x12 = motionEvent.getY();
                f12 = this.A;
                f13 = this.D;
            } else {
                x12 = motionEvent.getX();
                f12 = this.B;
                f13 = this.E;
            }
            if (this.N == 1) {
                int i11 = (int) (x12 - f13);
                if (getOrientation() == 1) {
                    scrollBy(0, i11);
                } else {
                    scrollBy(i11, 0);
                }
                invalidate();
            } else if (((int) Math.abs(x12 - f12)) > i5) {
                m();
                if (this.N != 1) {
                    this.N = 1;
                }
            }
            if (getOrientation() == 1) {
                this.D = x12;
                return true;
            }
            this.E = x12;
            return true;
        }
        h hVar = this.f46454z;
        if (hVar != null) {
            removeCallbacks(hVar);
        }
        i2 i2Var = this.f46453y;
        if (i2Var != null) {
            removeCallbacks(i2Var);
        }
        o oVar = this.W;
        oVar.a();
        NumberPicker numberPicker = (NumberPicker) oVar.f74674d;
        VelocityTracker velocityTracker = this.F;
        velocityTracker.computeCurrentVelocity(1000, this.I);
        int yVelocity = (int) (getOrientation() == 1 ? velocityTracker.getYVelocity() : velocityTracker.getXVelocity());
        if (Math.abs(yVelocity) > this.H) {
            this.f46452x = 0;
            int orientation = getOrientation();
            Scroller scroller = this.f46450v;
            if (orientation == 1) {
                if (yVelocity > 0) {
                    scroller.fling(0, 0, 0, yVelocity, 0, 0, 0, LayoutNode.NotPlacedPlaceOrder);
                } else {
                    scroller.fling(0, LayoutNode.NotPlacedPlaceOrder, 0, yVelocity, 0, 0, 0, LayoutNode.NotPlacedPlaceOrder);
                }
            } else if (yVelocity > 0) {
                scroller.fling(0, 0, yVelocity, 0, 0, LayoutNode.NotPlacedPlaceOrder, 0, 0);
            } else {
                scroller.fling(LayoutNode.NotPlacedPlaceOrder, 0, yVelocity, 0, 0, LayoutNode.NotPlacedPlaceOrder, 0, 0);
            }
            invalidate();
            if (this.N != 2) {
                this.N = 2;
            }
        } else {
            if (getOrientation() == 1) {
                x11 = motionEvent.getY();
                f11 = this.A;
            } else {
                x11 = motionEvent.getX();
                f11 = this.B;
            }
            int iAbs = (int) Math.abs(x11 - f11);
            long eventTime = motionEvent.getEventTime() - this.C;
            if (iAbs > i5 || eventTime >= ViewConfiguration.getTapTimeout()) {
                d();
            } else if (this.P) {
                this.P = false;
                performClick();
            } else {
                int i12 = ((int) (x11 / this.f46447s)) - 1;
                if (i12 > 0) {
                    b(true);
                    oVar.a();
                    oVar.f74673c = 2;
                    oVar.f74672b = 1;
                    numberPicker.post(oVar);
                } else if (i12 < 0) {
                    b(false);
                    oVar.a();
                    oVar.f74673c = 2;
                    oVar.f74672b = 2;
                    numberPicker.post(oVar);
                }
            }
            if (this.N != 0) {
                this.N = 0;
            }
        }
        this.F.recycle();
        this.F = null;
        return true;
    }

    public final void p(int i5, boolean z11) {
        f fVar;
        if (this.f46442l == i5) {
            return;
        }
        this.f46442l = Math.min(Math.max(i5, this.f46440j), this.f46441k);
        s();
        if (z11 && (fVar = this.f46443m) != null) {
            GridPreviewView gridPreviewView = (GridPreviewView) fVar.f17837b;
            NumberPicker numberPicker = (NumberPicker) fVar.f17838c;
            NumberPicker numberPicker2 = (NumberPicker) fVar.f17839d;
            int i11 = numberPicker.f46442l;
            int i12 = numberPicker2.f46442l;
            gridPreviewView.f46419a = i11;
            gridPreviewView.f46420b = i12;
            gridPreviewView.invalidate();
        }
        g();
        invalidate();
    }

    @Override // android.view.View
    public final boolean performClick() {
        if (!this.K) {
            return super.performClick();
        }
        if (super.performClick()) {
            return true;
        }
        q();
        return true;
    }

    @Override // android.view.View
    public final boolean performLongClick() {
        if (!this.K) {
            return super.performLongClick();
        }
        if (!super.performLongClick()) {
            q();
            this.O = true;
        }
        return true;
    }

    public final void q() {
        InputMethodManager inputMethodManager = (InputMethodManager) getContext().getSystemService("input_method");
        if (inputMethodManager != null) {
            boolean z11 = this.K;
            EditText editText = this.f46426a;
            if (z11) {
                editText.setVisibility(0);
            }
            editText.requestFocus();
            inputMethodManager.showSoftInput(editText, 0);
        }
    }

    public final void r() {
        if (this.f46437g) {
            int i5 = 0;
            float f11 = 0.0f;
            for (int i11 = 0; i11 <= 9; i11++) {
                float fMeasureText = this.f46445q.measureText(e(i11));
                if (fMeasureText > f11) {
                    f11 = fMeasureText;
                }
            }
            for (int i12 = this.f46441k; i12 > 0; i12 /= 10) {
                i5++;
            }
            int i13 = (int) (i5 * f11);
            EditText editText = this.f46426a;
            int paddingRight = editText.getPaddingRight() + editText.getPaddingLeft() + i13;
            if (this.f46436f != paddingRight) {
                int i14 = this.f46434e;
                if (paddingRight > i14) {
                    this.f46436f = paddingRight;
                } else {
                    this.f46436f = i14;
                }
                invalidate();
            }
        }
    }

    public final void s() {
        String strE = e(this.f46442l);
        if (TextUtils.isEmpty(strE)) {
            return;
        }
        EditText editText = this.f46426a;
        if (strE.equals(editText.getText().toString())) {
            return;
        }
        editText.setText(strE);
    }

    @Override // android.view.View
    public final void scrollBy(int i5, int i11) {
        if (getOrientation() == 1) {
            i5 = i11;
        }
        int[] iArr = this.f46444p;
        if (i5 > 0 && iArr[1] <= this.f46440j) {
            this.f46449u = this.f46448t;
            return;
        }
        if (i5 < 0 && iArr[1] >= this.f46441k) {
            this.f46449u = this.f46448t;
            return;
        }
        this.f46449u += i5;
        while (true) {
            int i12 = this.f46449u;
            if (i12 - this.f46448t <= this.f46439i) {
                break;
            }
            this.f46449u = i12 - this.f46447s;
            for (int length = iArr.length - 1; length > 0; length--) {
                iArr[length] = iArr[length - 1];
            }
            int i13 = iArr[1] - 1;
            iArr[0] = i13;
            c(i13);
            p(iArr[1], true);
            if (iArr[1] <= this.f46440j) {
                this.f46449u = this.f46448t;
            }
        }
        while (true) {
            int i14 = this.f46449u;
            if (i14 - this.f46448t >= (-this.f46439i)) {
                return;
            }
            this.f46449u = i14 + this.f46447s;
            int i15 = 0;
            while (i15 < iArr.length - 1) {
                int i16 = i15 + 1;
                iArr[i15] = iArr[i16];
                i15 = i16;
            }
            int i17 = iArr[iArr.length - 2] + 1;
            iArr[iArr.length - 1] = i17;
            c(i17);
            p(iArr[1], true);
            if (iArr[1] >= this.f46441k) {
                this.f46449u = this.f46448t;
            }
        }
    }

    @Override // android.view.View
    public final void setEnabled(boolean z11) {
        super.setEnabled(z11);
        this.f46426a.setEnabled(z11);
    }
}
