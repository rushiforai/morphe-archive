package defpackage;

import android.R;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Parcelable;
import android.util.AttributeSet;
import android.util.Log;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.accessibility.AccessibilityEvent;
import android.widget.EdgeEffect;
import android.widget.Scroller;
import android.widget.TextView;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import it.sephiroth.android.library.imagezoom.ImageViewTouch;
import java.util.ArrayList;
import java.util.Collections;
import java.util.WeakHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class fve extends ViewGroup {
    public static final int[] S = {R.attr.layout_gravity};
    public static final lva l0 = new lva(11);
    public static final hxa m0 = new hxa(2);
    public final int A;
    public float B;
    public float C;
    public float D;
    public float E;
    public int F;
    public VelocityTracker G;
    public final int H;
    public final int I;
    public final int J;
    public final int K;
    public final EdgeEffect L;
    public final EdgeEffect M;
    public boolean N;
    public boolean O;
    public int P;
    public final jn Q;
    public int R;
    public int a;
    public final ArrayList b;
    public final bve c;
    public final Rect d;
    public ny8 e;
    public int f;
    public int g;
    public Parcelable h;
    public final Scroller i;
    public boolean j;
    public h27 k;
    public int l;
    public Drawable m;
    public int n;
    public int o;
    public float p;
    public float q;
    public int r;
    public boolean s;
    public boolean t;
    public boolean u;
    public int v;
    public boolean w;
    public boolean x;
    public final int y;
    public int z;

    public fve(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.b = new ArrayList();
        this.c = new bve();
        this.d = new Rect();
        this.g = -1;
        this.p = -3.4028235E38f;
        this.q = Float.MAX_VALUE;
        this.v = 1;
        this.F = -1;
        this.N = true;
        this.Q = new jn(18, this);
        this.R = 0;
        setWillNotDraw(false);
        setDescendantFocusability(262144);
        setFocusable(true);
        Context context2 = getContext();
        this.i = new Scroller(context2, m0);
        ViewConfiguration viewConfiguration = ViewConfiguration.get(context2);
        float f = context2.getResources().getDisplayMetrics().density;
        this.A = viewConfiguration.getScaledPagingTouchSlop();
        this.H = (int) (400.0f * f);
        this.I = viewConfiguration.getScaledMaximumFlingVelocity();
        this.L = new EdgeEffect(context2);
        this.M = new EdgeEffect(context2);
        this.J = (int) (25.0f * f);
        this.K = (int) (2.0f * f);
        this.y = (int) (f * 16.0f);
        ute.o(this, new fo0(2, this));
        if (getImportantForAccessibility() == 0) {
            setImportantForAccessibility(1);
        }
        mte.c(this, new mya(this));
    }

    private int getClientWidth() {
        return (getMeasuredWidth() - getPaddingLeft()) - getPaddingRight();
    }

    private void setScrollingCacheEnabled(boolean z) {
        if (this.t != z) {
            this.t = z;
        }
    }

    public final bve a(int i, int i2) {
        bve bveVar = new bve();
        bveVar.b = i;
        mw5 mw5Var = (mw5) this.e;
        Context context = mw5Var.d;
        View viewInflate = mw5Var.c.inflate(com.medium.reader.R.layout.item_image_carousel, (ViewGroup) this, false);
        TextView textView = (TextView) viewInflate.findViewById(com.medium.reader.R.id.image_carousel_error);
        sw5 sw5Var = (sw5) bu1.A0(i, bu1.m1(mw5Var.e));
        if (sw5Var == null) {
            textView.getClass();
            textView.setVisibility(0);
        } else {
            ImageViewTouch imageViewTouch = (ImageViewTouch) viewInflate.findViewById(com.medium.reader.R.id.image_carousel_image);
            context.getClass();
            cfc cfcVarA = new nw5(context, sw5Var).a();
            imageViewTouch.getClass();
            imageViewTouch.setVisibility(0);
            gx5 gx5VarA = yec.a(imageViewTouch.getContext());
            nx5 nx5Var = new nx5(imageViewTouch.getContext());
            nx5Var.c = sw5Var;
            q84 q84Var = wx5.a;
            nx5Var.d = new fy5(imageViewTouch);
            nx5Var.r = dqb.FIT;
            nx5Var.c(cfcVarA);
            if (Build.VERSION.SDK_INT == 26) {
                nx5Var.b().a(wx5.f, Boolean.FALSE);
            }
            hlg.Y(nx5Var, context);
            nx5Var.e = new n0c(imageViewTouch, textView, imageViewTouch, textView, 18);
            ((kva) gx5VarA).a(nx5Var.a());
            imageViewTouch.setContentDescription(sw5Var.getAlt());
            addView(viewInflate);
        }
        bveVar.a = viewInflate;
        this.e.getClass();
        bveVar.d = 1.0f;
        ArrayList arrayList = this.b;
        if (i2 < 0 || i2 >= arrayList.size()) {
            arrayList.add(bveVar);
            return bveVar;
        }
        arrayList.add(i2, bveVar);
        return bveVar;
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void addFocusables(ArrayList arrayList, int i, int i2) {
        bve bveVarG;
        int size = arrayList.size();
        int descendantFocusability = getDescendantFocusability();
        if (descendantFocusability != 393216) {
            for (int i3 = 0; i3 < getChildCount(); i3++) {
                View childAt = getChildAt(i3);
                if (childAt.getVisibility() == 0 && (bveVarG = g(childAt)) != null && bveVarG.b == this.f) {
                    childAt.addFocusables(arrayList, i, i2);
                }
            }
        }
        if ((descendantFocusability != 262144 || size == arrayList.size()) && isFocusable()) {
            if ((i2 & 1) == 1 && isInTouchMode() && !isFocusableInTouchMode()) {
                return;
            }
            arrayList.add(this);
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void addTouchables(ArrayList arrayList) {
        bve bveVarG;
        for (int i = 0; i < getChildCount(); i++) {
            View childAt = getChildAt(i);
            if (childAt.getVisibility() == 0 && (bveVarG = g(childAt)) != null && bveVarG.b == this.f) {
                childAt.addTouchables(arrayList);
            }
        }
    }

    @Override // android.view.ViewGroup
    public final void addView(View view, int i, ViewGroup.LayoutParams layoutParams) {
        if (!checkLayoutParams(layoutParams)) {
            layoutParams = generateDefaultLayoutParams();
        }
        cve cveVar = (cve) layoutParams;
        boolean z = cveVar.a | (view.getClass().getAnnotation(ave.class) != null);
        cveVar.a = z;
        if (!this.s) {
            super.addView(view, i, layoutParams);
        } else if (z) {
            ygf.f("Cannot add pager decor view during layout");
        } else {
            cveVar.d = true;
            addViewInLayout(view, i, layoutParams);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:46:0x00c2  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean b(int r8) {
        /*
            Method dump skipped, instruction units count: 206
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.fve.b(int):boolean");
    }

    public boolean c(int i, int i2, int i3, View view, boolean z) {
        int i4;
        if (!(view instanceof ViewGroup)) {
            return z ? false : false;
        }
        ViewGroup viewGroup = (ViewGroup) view;
        int scrollX = view.getScrollX();
        int scrollY = view.getScrollY();
        for (int childCount = viewGroup.getChildCount() - 1; childCount >= 0; childCount--) {
            View childAt = viewGroup.getChildAt(childCount);
            int i5 = i2 + scrollX;
            if (i5 >= childAt.getLeft() && i5 < childAt.getRight() && (i4 = i3 + scrollY) >= childAt.getTop() && i4 < childAt.getBottom() && c(i, i5 - childAt.getLeft(), i4 - childAt.getTop(), childAt, true)) {
                break;
            }
        }
        if (z || !view.canScrollHorizontally(-i)) {
        }
        return true;
    }

    @Override // android.view.View
    public final boolean canScrollHorizontally(int i) {
        if (this.e == null) {
            return false;
        }
        int clientWidth = getClientWidth();
        int scrollX = getScrollX();
        return i < 0 ? scrollX > ((int) (((float) clientWidth) * this.p)) : i > 0 && scrollX < ((int) (((float) clientWidth) * this.q));
    }

    @Override // android.view.ViewGroup
    public final boolean checkLayoutParams(ViewGroup.LayoutParams layoutParams) {
        return (layoutParams instanceof cve) && super.checkLayoutParams(layoutParams);
    }

    @Override // android.view.View
    public final void computeScroll() {
        this.j = true;
        Scroller scroller = this.i;
        if (scroller.isFinished() || !scroller.computeScrollOffset()) {
            d(true);
            return;
        }
        int scrollX = getScrollX();
        int scrollY = getScrollY();
        int currX = scroller.getCurrX();
        int currY = scroller.getCurrY();
        if (scrollX != currX || scrollY != currY) {
            scrollTo(currX, currY);
            if (!m(currX)) {
                scroller.abortAnimation();
                scrollTo(0, currY);
            }
        }
        WeakHashMap weakHashMap = ute.a;
        postInvalidateOnAnimation();
    }

    public final void d(boolean z) {
        boolean z2 = this.R == 2;
        if (z2) {
            setScrollingCacheEnabled(false);
            Scroller scroller = this.i;
            if (!scroller.isFinished()) {
                scroller.abortAnimation();
                int scrollX = getScrollX();
                int scrollY = getScrollY();
                int currX = scroller.getCurrX();
                int currY = scroller.getCurrY();
                if (scrollX != currX || scrollY != currY) {
                    scrollTo(currX, currY);
                    if (currX != scrollX) {
                        m(currX);
                    }
                }
            }
        }
        this.u = false;
        int i = 0;
        while (true) {
            ArrayList arrayList = this.b;
            if (i >= arrayList.size()) {
                break;
            }
            bve bveVar = (bve) arrayList.get(i);
            if (bveVar.c) {
                bveVar.c = false;
                z2 = true;
            }
            i++;
        }
        if (z2) {
            jn jnVar = this.Q;
            if (!z) {
                jnVar.run();
            } else {
                WeakHashMap weakHashMap = ute.a;
                postOnAnimation(jnVar);
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:29:0x0061  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x0065 A[RETURN] */
    @Override // android.view.ViewGroup, android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean dispatchKeyEvent(android.view.KeyEvent r6) {
        /*
            r5 = this;
            boolean r0 = super.dispatchKeyEvent(r6)
            r1 = 1
            if (r0 != 0) goto L66
            int r0 = r6.getAction()
            r2 = 0
            if (r0 != 0) goto L61
            int r0 = r6.getKeyCode()
            r3 = 21
            r4 = 2
            if (r0 == r3) goto L48
            r3 = 22
            if (r0 == r3) goto L36
            r3 = 61
            if (r0 == r3) goto L20
            goto L61
        L20:
            boolean r0 = r6.hasNoModifiers()
            if (r0 == 0) goto L2b
            boolean r5 = r5.b(r4)
            goto L62
        L2b:
            boolean r6 = r6.hasModifiers(r1)
            if (r6 == 0) goto L61
            boolean r5 = r5.b(r1)
            goto L62
        L36:
            boolean r6 = r6.hasModifiers(r4)
            if (r6 == 0) goto L41
            boolean r5 = r5.l()
            goto L62
        L41:
            r6 = 66
            boolean r5 = r5.b(r6)
            goto L62
        L48:
            boolean r6 = r6.hasModifiers(r4)
            if (r6 == 0) goto L5a
            int r6 = r5.f
            if (r6 <= 0) goto L61
            int r6 = r6 - r1
            r5.u = r2
            r5.t(r6, r2, r1, r2)
            r5 = r1
            goto L62
        L5a:
            r6 = 17
            boolean r5 = r5.b(r6)
            goto L62
        L61:
            r5 = r2
        L62:
            if (r5 == 0) goto L65
            goto L66
        L65:
            return r2
        L66:
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.fve.dispatchKeyEvent(android.view.KeyEvent):boolean");
    }

    @Override // android.view.View
    public final boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent accessibilityEvent) {
        bve bveVarG;
        if (accessibilityEvent.getEventType() == 4096) {
            return super.dispatchPopulateAccessibilityEvent(accessibilityEvent);
        }
        int childCount = getChildCount();
        for (int i = 0; i < childCount; i++) {
            View childAt = getChildAt(i);
            if (childAt.getVisibility() == 0 && (bveVarG = g(childAt)) != null && bveVarG.b == this.f && childAt.dispatchPopulateAccessibilityEvent(accessibilityEvent)) {
                return true;
            }
        }
        return false;
    }

    @Override // android.view.View
    public final void draw(Canvas canvas) {
        ny8 ny8Var;
        super.draw(canvas);
        int overScrollMode = getOverScrollMode();
        EdgeEffect edgeEffect = this.M;
        EdgeEffect edgeEffect2 = this.L;
        boolean zDraw = false;
        if (overScrollMode == 0 || (overScrollMode == 1 && (ny8Var = this.e) != null && ny8Var.a() > 1)) {
            if (!edgeEffect2.isFinished()) {
                int iSave = canvas.save();
                int height = (getHeight() - getPaddingTop()) - getPaddingBottom();
                int width = getWidth();
                canvas.rotate(270.0f);
                canvas.translate(getPaddingTop() + (-height), this.p * width);
                edgeEffect2.setSize(height, width);
                zDraw = edgeEffect2.draw(canvas);
                canvas.restoreToCount(iSave);
            }
            if (!edgeEffect.isFinished()) {
                int iSave2 = canvas.save();
                int width2 = getWidth();
                int height2 = (getHeight() - getPaddingTop()) - getPaddingBottom();
                canvas.rotate(90.0f);
                canvas.translate(-getPaddingTop(), (-(this.q + 1.0f)) * width2);
                edgeEffect.setSize(height2, width2);
                zDraw |= edgeEffect.draw(canvas);
                canvas.restoreToCount(iSave2);
            }
        } else {
            edgeEffect2.finish();
            edgeEffect.finish();
        }
        if (zDraw) {
            WeakHashMap weakHashMap = ute.a;
            postInvalidateOnAnimation();
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void drawableStateChanged() {
        super.drawableStateChanged();
        Drawable drawable = this.m;
        if (drawable == null || !drawable.isStateful()) {
            return;
        }
        drawable.setState(getDrawableState());
    }

    public final void e() {
        int iA = this.e.a();
        this.a = iA;
        ArrayList arrayList = this.b;
        boolean z = arrayList.size() < (this.v * 2) + 1 && arrayList.size() < iA;
        int i = this.f;
        for (int i2 = 0; i2 < arrayList.size(); i2++) {
            bve bveVar = (bve) arrayList.get(i2);
            ny8 ny8Var = this.e;
            View view = bveVar.a;
            ny8Var.getClass();
        }
        Collections.sort(arrayList, l0);
        if (z) {
            int childCount = getChildCount();
            for (int i3 = 0; i3 < childCount; i3++) {
                cve cveVar = (cve) getChildAt(i3).getLayoutParams();
                if (!cveVar.a) {
                    cveVar.c = 0.0f;
                }
            }
            t(i, 0, false, true);
            requestLayout();
        }
    }

    public final Rect f(Rect rect, View view) {
        if (rect == null) {
            rect = new Rect();
        }
        if (view == null) {
            rect.set(0, 0, 0, 0);
            return rect;
        }
        rect.left = view.getLeft();
        rect.right = view.getRight();
        rect.top = view.getTop();
        rect.bottom = view.getBottom();
        ViewParent parent = view.getParent();
        while ((parent instanceof ViewGroup) && parent != this) {
            ViewGroup viewGroup = (ViewGroup) parent;
            rect.left = viewGroup.getLeft() + rect.left;
            rect.right = viewGroup.getRight() + rect.right;
            rect.top = viewGroup.getTop() + rect.top;
            rect.bottom = viewGroup.getBottom() + rect.bottom;
            parent = viewGroup.getParent();
        }
        return rect;
    }

    public final bve g(View view) {
        int i = 0;
        while (true) {
            ArrayList arrayList = this.b;
            if (i >= arrayList.size()) {
                return null;
            }
            bve bveVar = (bve) arrayList.get(i);
            ny8 ny8Var = this.e;
            View view2 = bveVar.a;
            ((mw5) ny8Var).getClass();
            view.getClass();
            view2.getClass();
            if (view == view2) {
                return bveVar;
            }
            i++;
        }
    }

    @Override // android.view.ViewGroup
    public final ViewGroup.LayoutParams generateDefaultLayoutParams() {
        cve cveVar = new cve(-1, -1);
        cveVar.c = 0.0f;
        return cveVar;
    }

    @Override // android.view.ViewGroup
    public final ViewGroup.LayoutParams generateLayoutParams(AttributeSet attributeSet) {
        Context context = getContext();
        cve cveVar = new cve(context, attributeSet);
        cveVar.c = 0.0f;
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, S);
        cveVar.b = typedArrayObtainStyledAttributes.getInteger(0, 48);
        typedArrayObtainStyledAttributes.recycle();
        return cveVar;
    }

    public ny8 getAdapter() {
        return this.e;
    }

    @Override // android.view.ViewGroup
    public final int getChildDrawingOrder(int i, int i2) {
        throw null;
    }

    public int getCurrentItem() {
        return this.f;
    }

    public int getOffscreenPageLimit() {
        return this.v;
    }

    public int getPageMargin() {
        return this.l;
    }

    /* JADX WARN: Code restructure failed: missing block: B:29:0x0072, code lost:
    
        return r7;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final defpackage.bve h() {
        /*
            r13 = this;
            int r0 = r13.getClientWidth()
            r1 = 0
            if (r0 <= 0) goto Lf
            int r2 = r13.getScrollX()
            float r2 = (float) r2
            float r3 = (float) r0
            float r2 = r2 / r3
            goto L10
        Lf:
            r2 = r1
        L10:
            if (r0 <= 0) goto L18
            int r3 = r13.l
            float r3 = (float) r3
            float r0 = (float) r0
            float r3 = r3 / r0
            goto L19
        L18:
            r3 = r1
        L19:
            r0 = 0
            r4 = -1
            r5 = 1
            r6 = 0
            r8 = r0
            r9 = r5
            r7 = r6
            r6 = r4
            r4 = r1
        L22:
            java.util.ArrayList r10 = r13.b
            int r11 = r10.size()
            if (r8 >= r11) goto L72
            java.lang.Object r11 = r10.get(r8)
            bve r11 = (defpackage.bve) r11
            if (r9 != 0) goto L4c
            int r12 = r11.b
            int r6 = r6 + r5
            if (r12 == r6) goto L4c
            float r1 = r1 + r4
            float r1 = r1 + r3
            bve r4 = r13.c
            r4.e = r1
            r4.b = r6
            ny8 r1 = r13.e
            r1.getClass()
            r1 = 1065353216(0x3f800000, float:1.0)
            r4.d = r1
            int r8 = r8 + (-1)
            r6 = r4
            goto L4d
        L4c:
            r6 = r11
        L4d:
            float r1 = r6.e
            float r4 = r6.d
            float r4 = r4 + r1
            float r4 = r4 + r3
            if (r9 != 0) goto L59
            int r9 = (r2 > r1 ? 1 : (r2 == r1 ? 0 : -1))
            if (r9 < 0) goto L72
        L59:
            int r4 = (r2 > r4 ? 1 : (r2 == r4 ? 0 : -1))
            if (r4 < 0) goto L71
            int r4 = r10.size()
            int r4 = r4 - r5
            if (r8 != r4) goto L65
            goto L71
        L65:
            int r4 = r6.b
            float r7 = r6.d
            int r8 = r8 + 1
            r9 = r6
            r6 = r4
            r4 = r7
            r7 = r9
            r9 = r0
            goto L22
        L71:
            return r6
        L72:
            return r7
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.fve.h():bve");
    }

    public final bve i(int i) {
        int i2 = 0;
        while (true) {
            ArrayList arrayList = this.b;
            if (i2 >= arrayList.size()) {
                return null;
            }
            bve bveVar = (bve) arrayList.get(i2);
            if (bveVar.b == i) {
                return bveVar;
            }
            i2++;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:22:0x0064  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void j() {
        /*
            r11 = this;
            int r0 = r11.P
            r1 = 1
            if (r0 <= 0) goto L6b
            int r0 = r11.getScrollX()
            int r2 = r11.getPaddingLeft()
            int r3 = r11.getPaddingRight()
            int r4 = r11.getWidth()
            int r5 = r11.getChildCount()
            r6 = 0
        L1a:
            if (r6 >= r5) goto L6b
            android.view.View r7 = r11.getChildAt(r6)
            android.view.ViewGroup$LayoutParams r8 = r7.getLayoutParams()
            cve r8 = (defpackage.cve) r8
            boolean r9 = r8.a
            if (r9 != 0) goto L2b
            goto L68
        L2b:
            int r8 = r8.b
            r8 = r8 & 7
            if (r8 == r1) goto L4f
            r9 = 3
            if (r8 == r9) goto L49
            r9 = 5
            if (r8 == r9) goto L39
            r8 = r2
            goto L5c
        L39:
            int r8 = r4 - r3
            int r9 = r7.getMeasuredWidth()
            int r8 = r8 - r9
            int r9 = r7.getMeasuredWidth()
            int r3 = r3 + r9
        L45:
            r10 = r8
            r8 = r2
            r2 = r10
            goto L5c
        L49:
            int r8 = r7.getWidth()
            int r8 = r8 + r2
            goto L5c
        L4f:
            int r8 = r7.getMeasuredWidth()
            int r8 = r4 - r8
            int r8 = r8 / 2
            int r8 = java.lang.Math.max(r8, r2)
            goto L45
        L5c:
            int r2 = r2 + r0
            int r9 = r7.getLeft()
            int r2 = r2 - r9
            if (r2 == 0) goto L67
            r7.offsetLeftAndRight(r2)
        L67:
            r2 = r8
        L68:
            int r6 = r6 + 1
            goto L1a
        L6b:
            r11.O = r1
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.fve.j():void");
    }

    public final void k(MotionEvent motionEvent) {
        int actionIndex = motionEvent.getActionIndex();
        if (motionEvent.getPointerId(actionIndex) == this.F) {
            int i = actionIndex == 0 ? 1 : 0;
            this.B = motionEvent.getX(i);
            this.F = motionEvent.getPointerId(i);
            VelocityTracker velocityTracker = this.G;
            if (velocityTracker != null) {
                velocityTracker.clear();
            }
        }
    }

    public final boolean l() {
        ny8 ny8Var = this.e;
        if (ny8Var == null || this.f >= ny8Var.a() - 1) {
            return false;
        }
        int i = this.f + 1;
        this.u = false;
        t(i, 0, true, false);
        return true;
    }

    public final boolean m(int i) {
        if (this.b.size() == 0) {
            if (!this.N) {
                this.O = false;
                j();
                if (!this.O) {
                    ygf.f("onPageScrolled did not call superclass implementation");
                    return false;
                }
            }
            return false;
        }
        bve bveVarH = h();
        getClientWidth();
        int i2 = bveVarH.b;
        this.O = false;
        j();
        if (this.O) {
            return true;
        }
        ygf.f("onPageScrolled did not call superclass implementation");
        return false;
    }

    public final boolean n(float f) {
        boolean z;
        boolean z2;
        float f2 = this.B - f;
        this.B = f;
        float scrollX = getScrollX() + f2;
        float clientWidth = getClientWidth();
        float f3 = this.p * clientWidth;
        float f4 = this.q * clientWidth;
        ArrayList arrayList = this.b;
        boolean z3 = false;
        bve bveVar = (bve) arrayList.get(0);
        bve bveVar2 = (bve) y30.m(1, arrayList);
        if (bveVar.b != 0) {
            f3 = bveVar.e * clientWidth;
            z = false;
        } else {
            z = true;
        }
        if (bveVar2.b != this.e.a() - 1) {
            f4 = bveVar2.e * clientWidth;
            z2 = false;
        } else {
            z2 = true;
        }
        if (scrollX < f3) {
            if (z) {
                this.L.onPull(Math.abs(f3 - scrollX) / clientWidth);
                z3 = true;
            }
            scrollX = f3;
        } else if (scrollX > f4) {
            if (z2) {
                this.M.onPull(Math.abs(scrollX - f4) / clientWidth);
                z3 = true;
            }
            scrollX = f4;
        }
        int i = (int) scrollX;
        this.B = (scrollX - i) + this.B;
        scrollTo(i, getScrollY());
        m(i);
        return z3;
    }

    public final void o() {
        p(this.f);
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        this.N = true;
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onDetachedFromWindow() {
        removeCallbacks(this.Q);
        Scroller scroller = this.i;
        if (scroller != null && !scroller.isFinished()) {
            scroller.abortAnimation();
        }
        super.onDetachedFromWindow();
    }

    @Override // android.view.View
    public final void onDraw(Canvas canvas) {
        int i;
        float f;
        ArrayList arrayList;
        int i2;
        super.onDraw(canvas);
        if (this.l <= 0 || this.m == null) {
            return;
        }
        ArrayList arrayList2 = this.b;
        if (arrayList2.size() <= 0 || this.e == null) {
            return;
        }
        int scrollX = getScrollX();
        float width = getWidth();
        float f2 = this.l / width;
        int i3 = 0;
        bve bveVar = (bve) arrayList2.get(0);
        float f3 = bveVar.e;
        int size = arrayList2.size();
        int i4 = bveVar.b;
        int i5 = ((bve) arrayList2.get(size - 1)).b;
        while (i4 < i5) {
            while (true) {
                i = bveVar.b;
                if (i4 <= i || i3 >= size) {
                    break;
                }
                i3++;
                bveVar = (bve) arrayList2.get(i3);
            }
            if (i4 == i) {
                float f4 = bveVar.e;
                float f5 = bveVar.d;
                f = (f4 + f5) * width;
                f3 = f4 + f5 + f2;
            } else {
                this.e.getClass();
                f = (f3 + 1.0f) * width;
                f3 = 1.0f + f2 + f3;
            }
            if (this.l + f > scrollX) {
                arrayList = arrayList2;
                i2 = scrollX;
                this.m.setBounds(Math.round(f), this.n, Math.round(this.l + f), this.o);
                this.m.draw(canvas);
            } else {
                arrayList = arrayList2;
                i2 = scrollX;
            }
            if (f > i2 + r3) {
                return;
            }
            i4++;
            arrayList2 = arrayList;
            scrollX = i2;
        }
    }

    @Override // android.view.ViewGroup
    public final boolean onInterceptTouchEvent(MotionEvent motionEvent) {
        int action = motionEvent.getAction() & 255;
        if (action == 3 || action == 1) {
            r();
            return false;
        }
        if (action != 0) {
            if (this.w) {
                return true;
            }
            if (this.x) {
                return false;
            }
        }
        if (action == 0) {
            float x = motionEvent.getX();
            this.D = x;
            this.B = x;
            float y = motionEvent.getY();
            this.E = y;
            this.C = y;
            this.F = motionEvent.getPointerId(0);
            this.x = false;
            this.j = true;
            Scroller scroller = this.i;
            scroller.computeScrollOffset();
            if (this.R != 2 || Math.abs(scroller.getFinalX() - scroller.getCurrX()) <= this.K) {
                d(false);
                this.w = false;
            } else {
                scroller.abortAnimation();
                this.u = false;
                o();
                this.w = true;
                ViewParent parent = getParent();
                if (parent != null) {
                    parent.requestDisallowInterceptTouchEvent(true);
                }
                setScrollState(1);
            }
        } else if (action == 2) {
            int i = this.F;
            if (i != -1) {
                int iFindPointerIndex = motionEvent.findPointerIndex(i);
                float x2 = motionEvent.getX(iFindPointerIndex);
                float f = x2 - this.B;
                float fAbs = Math.abs(f);
                float y2 = motionEvent.getY(iFindPointerIndex);
                float fAbs2 = Math.abs(y2 - this.E);
                if (f != 0.0f) {
                    float f2 = this.B;
                    if ((f2 >= this.z || f <= 0.0f) && ((f2 <= getWidth() - this.z || f >= 0.0f) && c((int) f, (int) x2, (int) y2, this, false))) {
                        this.B = x2;
                        this.C = y2;
                        this.x = true;
                        return false;
                    }
                }
                int i2 = this.A;
                float f3 = i2;
                if (fAbs > f3 && fAbs * 0.5f > fAbs2) {
                    this.w = true;
                    ViewParent parent2 = getParent();
                    if (parent2 != null) {
                        parent2.requestDisallowInterceptTouchEvent(true);
                    }
                    setScrollState(1);
                    float f4 = this.D;
                    float f5 = i2;
                    this.B = f > 0.0f ? f4 + f5 : f4 - f5;
                    this.C = y2;
                    setScrollingCacheEnabled(true);
                } else if (fAbs2 > f3) {
                    this.x = true;
                }
                if (this.w && n(x2)) {
                    WeakHashMap weakHashMap = ute.a;
                    postInvalidateOnAnimation();
                }
            }
        } else if (action == 6) {
            k(motionEvent);
        }
        VelocityTracker velocityTrackerObtain = this.G;
        if (velocityTrackerObtain == null) {
            velocityTrackerObtain = VelocityTracker.obtain();
            this.G = velocityTrackerObtain;
        }
        velocityTrackerObtain.addMovement(motionEvent);
        return this.w;
    }

    /* JADX WARN: Removed duplicated region for block: B:22:0x0072  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0094  */
    @Override // android.view.ViewGroup, android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void onLayout(boolean r19, int r20, int r21, int r22, int r23) {
        /*
            Method dump skipped, instruction units count: 286
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.fve.onLayout(boolean, int, int, int, int):void");
    }

    @Override // android.view.View
    public final void onMeasure(int i, int i2) {
        cve cveVar;
        cve cveVar2;
        int i3;
        setMeasuredDimension(View.getDefaultSize(0, i), View.getDefaultSize(0, i2));
        int measuredWidth = getMeasuredWidth();
        this.z = Math.min(measuredWidth / 10, this.y);
        int paddingLeft = (measuredWidth - getPaddingLeft()) - getPaddingRight();
        int measuredHeight = (getMeasuredHeight() - getPaddingTop()) - getPaddingBottom();
        int childCount = getChildCount();
        int i4 = 0;
        while (true) {
            boolean z = true;
            int i5 = 1073741824;
            if (i4 >= childCount) {
                break;
            }
            View childAt = getChildAt(i4);
            if (childAt.getVisibility() != 8 && (cveVar2 = (cve) childAt.getLayoutParams()) != null && cveVar2.a) {
                int i6 = cveVar2.b;
                int i7 = i6 & 7;
                int i8 = i6 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
                boolean z2 = i8 == 48 || i8 == 80;
                if (i7 != 3 && i7 != 5) {
                    z = false;
                }
                int i9 = Integer.MIN_VALUE;
                if (z2) {
                    i3 = Integer.MIN_VALUE;
                    i9 = 1073741824;
                } else {
                    i3 = z ? 1073741824 : Integer.MIN_VALUE;
                }
                int i10 = ((ViewGroup.LayoutParams) cveVar2).width;
                if (i10 != -2) {
                    if (i10 == -1) {
                        i10 = paddingLeft;
                    }
                    i9 = 1073741824;
                } else {
                    i10 = paddingLeft;
                }
                int i11 = ((ViewGroup.LayoutParams) cveVar2).height;
                if (i11 == -2) {
                    i11 = measuredHeight;
                    i5 = i3;
                } else if (i11 == -1) {
                    i11 = measuredHeight;
                }
                childAt.measure(View.MeasureSpec.makeMeasureSpec(i10, i9), View.MeasureSpec.makeMeasureSpec(i11, i5));
                if (z2) {
                    measuredHeight -= childAt.getMeasuredHeight();
                } else if (z) {
                    paddingLeft -= childAt.getMeasuredWidth();
                }
            }
            i4++;
        }
        View.MeasureSpec.makeMeasureSpec(paddingLeft, 1073741824);
        this.r = View.MeasureSpec.makeMeasureSpec(measuredHeight, 1073741824);
        this.s = true;
        o();
        this.s = false;
        int childCount2 = getChildCount();
        for (int i12 = 0; i12 < childCount2; i12++) {
            View childAt2 = getChildAt(i12);
            if (childAt2.getVisibility() != 8 && ((cveVar = (cve) childAt2.getLayoutParams()) == null || !cveVar.a)) {
                childAt2.measure(View.MeasureSpec.makeMeasureSpec((int) (paddingLeft * cveVar.c), 1073741824), this.r);
            }
        }
    }

    @Override // android.view.ViewGroup
    public final boolean onRequestFocusInDescendants(int i, Rect rect) {
        int i2;
        int i3;
        int i4;
        bve bveVarG;
        int childCount = getChildCount();
        if ((i & 2) != 0) {
            i3 = childCount;
            i2 = 0;
            i4 = 1;
        } else {
            i2 = childCount - 1;
            i3 = -1;
            i4 = -1;
        }
        while (i2 != i3) {
            View childAt = getChildAt(i2);
            if (childAt.getVisibility() == 0 && (bveVarG = g(childAt)) != null && bveVarG.b == this.f && childAt.requestFocus(i, rect)) {
                return true;
            }
            i2 += i4;
        }
        return false;
    }

    @Override // android.view.View
    public final void onRestoreInstanceState(Parcelable parcelable) {
        if (!(parcelable instanceof eve)) {
            super.onRestoreInstanceState(parcelable);
            return;
        }
        eve eveVar = (eve) parcelable;
        super.onRestoreInstanceState(eveVar.a);
        ny8 ny8Var = this.e;
        int i = eveVar.c;
        if (ny8Var != null) {
            t(i, 0, false, true);
        } else {
            this.g = i;
            this.h = eveVar.d;
        }
    }

    @Override // android.view.View
    public final Parcelable onSaveInstanceState() {
        eve eveVar = new eve(super.onSaveInstanceState());
        eveVar.c = this.f;
        ny8 ny8Var = this.e;
        if (ny8Var != null) {
            ny8Var.getClass();
            eveVar.d = null;
        }
        return eveVar;
    }

    @Override // android.view.View
    public final void onSizeChanged(int i, int i2, int i3, int i4) {
        super.onSizeChanged(i, i2, i3, i4);
        if (i != i3) {
            int i5 = this.l;
            q(i, i3, i5, i5);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:53:0x00d8  */
    @Override // android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean onTouchEvent(android.view.MotionEvent r9) {
        /*
            Method dump skipped, instruction units count: 414
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.fve.onTouchEvent(android.view.MotionEvent):boolean");
    }

    /* JADX WARN: Code restructure failed: missing block: B:25:0x0061, code lost:
    
        r9 = null;
     */
    /* JADX WARN: Removed duplicated region for block: B:52:0x00cb A[PHI: r7 r11 r15
      0x00cb: PHI (r7v15 int) = (r7v14 int), (r7v4 int), (r7v18 int) binds: [B:62:0x00ef, B:59:0x00db, B:50:0x00c2] A[DONT_GENERATE, DONT_INLINE]
      0x00cb: PHI (r11v26 int) = (r11v1 int), (r11v25 int), (r11v29 int) binds: [B:62:0x00ef, B:59:0x00db, B:50:0x00c2] A[DONT_GENERATE, DONT_INLINE]
      0x00cb: PHI (r15v6 float) = (r15v4 float), (r15v5 float), (r15v3 float) binds: [B:62:0x00ef, B:59:0x00db, B:50:0x00c2] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:88:0x0155 A[PHI: r3 r12
      0x0155: PHI (r3v20 float) = (r3v18 float), (r3v19 float), (r3v17 float) binds: [B:96:0x017c, B:93:0x0166, B:86:0x014c] A[DONT_GENERATE, DONT_INLINE]
      0x0155: PHI (r12v25 int) = (r12v23 int), (r12v24 int), (r12v22 int) binds: [B:96:0x017c, B:93:0x0166, B:86:0x014c] A[DONT_GENERATE, DONT_INLINE]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void p(int r18) {
        /*
            Method dump skipped, instruction units count: 896
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.fve.p(int):void");
    }

    public final void q(int i, int i2, int i3, int i4) {
        if (i2 <= 0 || this.b.isEmpty()) {
            bve bveVarI = i(this.f);
            int iMin = (int) ((bveVarI != null ? Math.min(bveVarI.e, this.q) : 0.0f) * ((i - getPaddingLeft()) - getPaddingRight()));
            if (iMin != getScrollX()) {
                d(false);
                scrollTo(iMin, getScrollY());
                return;
            }
            return;
        }
        Scroller scroller = this.i;
        if (!scroller.isFinished()) {
            scroller.setFinalX(getCurrentItem() * getClientWidth());
        } else {
            scrollTo((int) ((getScrollX() / (((i2 - getPaddingLeft()) - getPaddingRight()) + i4)) * (((i - getPaddingLeft()) - getPaddingRight()) + i3)), getScrollY());
        }
    }

    public final boolean r() {
        this.F = -1;
        this.w = false;
        this.x = false;
        VelocityTracker velocityTracker = this.G;
        if (velocityTracker != null) {
            velocityTracker.recycle();
            this.G = null;
        }
        EdgeEffect edgeEffect = this.L;
        edgeEffect.onRelease();
        EdgeEffect edgeEffect2 = this.M;
        edgeEffect2.onRelease();
        return edgeEffect.isFinished() || edgeEffect2.isFinished();
    }

    @Override // android.view.ViewGroup, android.view.ViewManager
    public final void removeView(View view) {
        if (this.s) {
            removeViewInLayout(view);
        } else {
            super.removeView(view);
        }
    }

    public final void s(int i, int i2, boolean z) {
        int scrollX;
        int iAbs;
        bve bveVarI = i(i);
        int iMax = bveVarI != null ? (int) (Math.max(this.p, Math.min(bveVarI.e, this.q)) * getClientWidth()) : 0;
        if (!z) {
            d(false);
            scrollTo(iMax, 0);
            m(iMax);
            return;
        }
        if (getChildCount() == 0) {
            setScrollingCacheEnabled(false);
            return;
        }
        Scroller scroller = this.i;
        if (scroller == null || scroller.isFinished()) {
            scrollX = getScrollX();
        } else {
            scrollX = this.j ? scroller.getCurrX() : scroller.getStartX();
            scroller.abortAnimation();
            setScrollingCacheEnabled(false);
        }
        int i3 = scrollX;
        int scrollY = getScrollY();
        int i4 = iMax - i3;
        int i5 = 0 - scrollY;
        if (i4 == 0 && i5 == 0) {
            d(false);
            o();
            setScrollState(0);
            return;
        }
        setScrollingCacheEnabled(true);
        setScrollState(2);
        int clientWidth = getClientWidth();
        int i6 = clientWidth / 2;
        float f = clientWidth;
        float f2 = i6;
        float fSin = (((float) Math.sin((Math.min(1.0f, (Math.abs(i4) * 1.0f) / f) - 0.5f) * 0.47123894f)) * f2) + f2;
        int iAbs2 = Math.abs(i2);
        if (iAbs2 > 0) {
            iAbs = Math.round(Math.abs(fSin / iAbs2) * 1000.0f) * 4;
        } else {
            this.e.getClass();
            iAbs = (int) (((Math.abs(i4) / ((f * 1.0f) + this.l)) + 1.0f) * 100.0f);
        }
        int iMin = Math.min(iAbs, 600);
        this.j = false;
        this.i.startScroll(i3, scrollY, i4, i5, iMin);
        WeakHashMap weakHashMap = ute.a;
        postInvalidateOnAnimation();
    }

    public void setAdapter(ny8 ny8Var) {
        ArrayList arrayList = this.b;
        ny8 ny8Var2 = this.e;
        if (ny8Var2 != null) {
            synchronized (ny8Var2) {
                ny8Var2.b = null;
            }
            this.e.getClass();
            for (int i = 0; i < arrayList.size(); i++) {
                bve bveVar = (bve) arrayList.get(i);
                ny8 ny8Var3 = this.e;
                int i2 = bveVar.b;
                View view = bveVar.a;
                ((mw5) ny8Var3).getClass();
                view.getClass();
                removeView(view);
            }
            this.e.getClass();
            arrayList.clear();
            int i3 = 0;
            while (i3 < getChildCount()) {
                if (!((cve) getChildAt(i3).getLayoutParams()).a) {
                    removeViewAt(i3);
                    i3--;
                }
                i3++;
            }
            this.f = 0;
            scrollTo(0, 0);
        }
        this.e = ny8Var;
        this.a = 0;
        if (ny8Var != null) {
            h27 h27Var = this.k;
            if (h27Var == null) {
                h27Var = new h27(1, this);
                this.k = h27Var;
            }
            this.e.b(h27Var);
            this.u = false;
            boolean z = this.N;
            this.N = true;
            this.a = this.e.a();
            if (this.g >= 0) {
                this.e.getClass();
                t(this.g, 0, false, true);
                this.g = -1;
            } else if (z) {
                requestLayout();
            } else {
                o();
            }
        }
    }

    public void setCurrentItem(int i) {
        this.u = false;
        t(i, 0, !this.N, false);
    }

    public void setOffscreenPageLimit(int i) {
        if (i < 1) {
            Log.w("ViewPager", "Requested offscreen page limit " + i + " too small; defaulting to 1");
            i = 1;
        }
        if (i != this.v) {
            this.v = i;
            o();
        }
    }

    public void setPageMargin(int i) {
        int i2 = this.l;
        this.l = i;
        int width = getWidth();
        q(width, width, i, i2);
        requestLayout();
    }

    public void setPageMarginDrawable(Drawable drawable) {
        this.m = drawable;
        if (drawable != null) {
            refreshDrawableState();
        }
        setWillNotDraw(drawable == null);
        invalidate();
    }

    public void setScrollState(int i) {
        if (this.R == i) {
            return;
        }
        this.R = i;
    }

    public final void t(int i, int i2, boolean z, boolean z2) {
        ny8 ny8Var = this.e;
        if (ny8Var == null || ny8Var.a() <= 0) {
            setScrollingCacheEnabled(false);
            return;
        }
        ArrayList arrayList = this.b;
        if (!z2 && this.f == i && arrayList.size() != 0) {
            setScrollingCacheEnabled(false);
            return;
        }
        if (i < 0) {
            i = 0;
        } else if (i >= this.e.a()) {
            i = this.e.a() - 1;
        }
        int i3 = this.v;
        int i4 = this.f;
        if (i > i4 + i3 || i < i4 - i3) {
            for (int i5 = 0; i5 < arrayList.size(); i5++) {
                ((bve) arrayList.get(i5)).c = true;
            }
        }
        if (this.N) {
            this.f = i;
            requestLayout();
        } else {
            p(i);
            s(i, i2, z);
        }
    }

    @Override // android.view.View
    public final boolean verifyDrawable(Drawable drawable) {
        return super.verifyDrawable(drawable) || drawable == this.m;
    }

    public void setPageMarginDrawable(int i) {
        setPageMarginDrawable(getContext().getDrawable(i));
    }

    @Deprecated
    public void setOnPageChangeListener(dve dveVar) {
    }

    @Override // android.view.ViewGroup
    public final ViewGroup.LayoutParams generateLayoutParams(ViewGroup.LayoutParams layoutParams) {
        return generateDefaultLayoutParams();
    }
}
