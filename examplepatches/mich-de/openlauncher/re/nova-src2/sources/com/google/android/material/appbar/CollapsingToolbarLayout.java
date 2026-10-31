package com.google.android.material.appbar;

import a5.a1;
import a5.h2;
import a5.q0;
import a5.s0;
import android.animation.TimeInterpolator;
import android.animation.ValueAnimator;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.Region;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.text.TextPaint;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.animation.AnimationUtils;
import android.widget.FrameLayout;
import androidx.appcompat.widget.Toolbar;
import androidx.recyclerview.widget.a0;
import cm.f;
import dj.d;
import dj.h;
import java.util.ArrayList;
import java.util.WeakHashMap;
import ps.e0;
import ps.f0;
import ps.l;
import tj.i;

/* loaded from: classes3.dex */
public class CollapsingToolbarLayout extends FrameLayout {
    public int A;
    public final boolean B;
    public int C;
    public final boolean D;

    /* renamed from: a, reason: collision with root package name */
    public boolean f34035a;

    /* renamed from: b, reason: collision with root package name */
    public final int f34036b;

    /* renamed from: c, reason: collision with root package name */
    public ViewGroup f34037c;

    /* renamed from: d, reason: collision with root package name */
    public View f34038d;

    /* renamed from: e, reason: collision with root package name */
    public View f34039e;

    /* renamed from: f, reason: collision with root package name */
    public final int f34040f;

    /* renamed from: g, reason: collision with root package name */
    public final int f34041g;

    /* renamed from: h, reason: collision with root package name */
    public final int f34042h;

    /* renamed from: i, reason: collision with root package name */
    public final int f34043i;

    /* renamed from: j, reason: collision with root package name */
    public final Rect f34044j;

    /* renamed from: k, reason: collision with root package name */
    public final tj.b f34045k;

    /* renamed from: l, reason: collision with root package name */
    public final boolean f34046l;

    /* renamed from: m, reason: collision with root package name */
    public boolean f34047m;
    public Drawable n;
    public final Drawable o;

    /* renamed from: p, reason: collision with root package name */
    public int f34048p;

    /* renamed from: q, reason: collision with root package name */
    public boolean f34049q;

    /* renamed from: r, reason: collision with root package name */
    public ValueAnimator f34050r;

    /* renamed from: s, reason: collision with root package name */
    public final long f34051s;

    /* renamed from: t, reason: collision with root package name */
    public final TimeInterpolator f34052t;

    /* renamed from: u, reason: collision with root package name */
    public final TimeInterpolator f34053u;

    /* renamed from: v, reason: collision with root package name */
    public final int f34054v;

    /* renamed from: w, reason: collision with root package name */
    public d f34055w;

    /* renamed from: x, reason: collision with root package name */
    public int f34056x;

    /* renamed from: y, reason: collision with root package name */
    public final int f34057y;

    /* renamed from: z, reason: collision with root package name */
    public h2 f34058z;

    public CollapsingToolbarLayout(Context context, AttributeSet attributeSet) {
        int i5;
        ColorStateList colorStateListM;
        ColorStateList colorStateListM2;
        super(hk.a.a(context, attributeSet, 2130968928, 2132083758), attributeSet, 2130968928);
        this.f34035a = true;
        this.f34044j = new Rect();
        this.f34054v = -1;
        this.A = 0;
        this.C = 0;
        Context context2 = getContext();
        tj.b bVar = new tj.b(this);
        this.f34045k = bVar;
        bVar.W = cj.a.f19955e;
        bVar.i(false);
        bVar.J = false;
        pj.a aVar = new pj.a(context2);
        i.a(context2, attributeSet, 2130968928, 2132083758);
        int[] iArr = bj.a.f17924k;
        i.b(context2, attributeSet, iArr, 2130968928, 2132083758, new int[0]);
        TypedArray typedArrayObtainStyledAttributes = context2.obtainStyledAttributes(attributeSet, iArr, 2130968928, 2132083758);
        int i11 = typedArrayObtainStyledAttributes.getInt(4, 8388691);
        if (bVar.f89353j != i11) {
            bVar.f89353j = i11;
            bVar.i(false);
        }
        int i12 = typedArrayObtainStyledAttributes.getInt(0, 8388627);
        if (bVar.f89355k != i12) {
            bVar.f89355k = i12;
            bVar.i(false);
        }
        int dimensionPixelSize = typedArrayObtainStyledAttributes.getDimensionPixelSize(5, 0);
        this.f34043i = dimensionPixelSize;
        this.f34042h = dimensionPixelSize;
        this.f34041g = dimensionPixelSize;
        this.f34040f = dimensionPixelSize;
        if (typedArrayObtainStyledAttributes.hasValue(8)) {
            this.f34040f = typedArrayObtainStyledAttributes.getDimensionPixelSize(8, 0);
        }
        int i13 = 7;
        if (typedArrayObtainStyledAttributes.hasValue(7)) {
            this.f34042h = typedArrayObtainStyledAttributes.getDimensionPixelSize(7, 0);
        }
        if (typedArrayObtainStyledAttributes.hasValue(9)) {
            this.f34041g = typedArrayObtainStyledAttributes.getDimensionPixelSize(9, 0);
        }
        if (typedArrayObtainStyledAttributes.hasValue(6)) {
            this.f34043i = typedArrayObtainStyledAttributes.getDimensionPixelSize(6, 0);
        }
        boolean z11 = typedArrayObtainStyledAttributes.getBoolean(20, true);
        this.f34046l = z11;
        CharSequence text = typedArrayObtainStyledAttributes.getText(18);
        ColorStateList colorStateListValueOf = null;
        if (text == null || !TextUtils.equals(bVar.G, text)) {
            bVar.G = text;
            bVar.H = null;
            Bitmap bitmap = bVar.K;
            if (bitmap != null) {
                bitmap.recycle();
                bVar.K = null;
            }
            bVar.i(false);
        }
        setContentDescription(z11 ? bVar.G : null);
        bVar.m(2132083373);
        bVar.k(2132083347);
        if (typedArrayObtainStyledAttributes.hasValue(10)) {
            bVar.m(typedArrayObtainStyledAttributes.getResourceId(10, 0));
        }
        if (typedArrayObtainStyledAttributes.hasValue(1)) {
            bVar.k(typedArrayObtainStyledAttributes.getResourceId(1, 0));
        }
        if (typedArrayObtainStyledAttributes.hasValue(22)) {
            int i14 = typedArrayObtainStyledAttributes.getInt(22, -1);
            bVar.F = i14 != 0 ? i14 != 1 ? i14 != 3 ? TextUtils.TruncateAt.END : TextUtils.TruncateAt.MARQUEE : TextUtils.TruncateAt.MIDDLE : TextUtils.TruncateAt.START;
            bVar.i(false);
        }
        if (typedArrayObtainStyledAttributes.hasValue(11) && bVar.n != (colorStateListM2 = f0.m(context2, typedArrayObtainStyledAttributes, 11))) {
            bVar.n = colorStateListM2;
            bVar.i(false);
        }
        if (typedArrayObtainStyledAttributes.hasValue(2) && bVar.o != (colorStateListM = f0.m(context2, typedArrayObtainStyledAttributes, 2))) {
            bVar.o = colorStateListM;
            bVar.i(false);
        }
        this.f34054v = typedArrayObtainStyledAttributes.getDimensionPixelSize(16, -1);
        if (typedArrayObtainStyledAttributes.hasValue(14) && (i5 = typedArrayObtainStyledAttributes.getInt(14, 1)) != bVar.f89361n0) {
            bVar.f89361n0 = i5;
            Bitmap bitmap2 = bVar.K;
            if (bitmap2 != null) {
                bitmap2.recycle();
                bVar.K = null;
            }
            bVar.i(false);
        }
        if (typedArrayObtainStyledAttributes.hasValue(21)) {
            bVar.V = AnimationUtils.loadInterpolator(context2, typedArrayObtainStyledAttributes.getResourceId(21, 0));
            bVar.i(false);
        }
        this.f34051s = typedArrayObtainStyledAttributes.getInt(15, 600);
        this.f34052t = l.r(context2, 2130969719, cj.a.f19953c);
        this.f34053u = l.r(context2, 2130969719, cj.a.f19954d);
        d(typedArrayObtainStyledAttributes.getDrawable(3));
        Drawable drawable = typedArrayObtainStyledAttributes.getDrawable(17);
        Drawable drawable2 = this.o;
        if (drawable2 != drawable) {
            if (drawable2 != null) {
                drawable2.setCallback(null);
            }
            Drawable drawableMutate = drawable != null ? drawable.mutate() : null;
            this.o = drawableMutate;
            if (drawableMutate != null) {
                if (drawableMutate.isStateful()) {
                    this.o.setState(getDrawableState());
                }
                Drawable drawable3 = this.o;
                WeakHashMap weakHashMap = a1.f250a;
                drawable3.setLayoutDirection(getLayoutDirection());
                this.o.setVisible(getVisibility() == 0, false);
                this.o.setCallback(this);
                this.o.setAlpha(this.f34048p);
            }
            WeakHashMap weakHashMap2 = a1.f250a;
            postInvalidateOnAnimation();
        }
        int i15 = typedArrayObtainStyledAttributes.getInt(19, 0);
        this.f34057y = i15;
        boolean z12 = i15 == 1;
        bVar.f89339c = z12;
        ViewParent parent = getParent();
        if (parent instanceof AppBarLayout) {
            AppBarLayout appBarLayout = (AppBarLayout) parent;
            if (this.f34057y == 1) {
                appBarLayout.f34014k = false;
            }
        }
        if (z12 && this.n == null) {
            Context context3 = getContext();
            TypedValue typedValueU = e0.u(context3, 2130968979);
            if (typedValueU != null) {
                int i16 = typedValueU.resourceId;
                if (i16 != 0) {
                    colorStateListValueOf = o4.a.b(context3, i16);
                } else {
                    int i17 = typedValueU.data;
                    if (i17 != 0) {
                        colorStateListValueOf = ColorStateList.valueOf(i17);
                    }
                }
            }
            d(new ColorDrawable(colorStateListValueOf != null ? colorStateListValueOf.getDefaultColor() : aVar.a(getResources().getDimension(2131165371), aVar.f82604d)));
        }
        this.f34036b = typedArrayObtainStyledAttributes.getResourceId(23, -1);
        this.B = typedArrayObtainStyledAttributes.getBoolean(13, false);
        this.D = typedArrayObtainStyledAttributes.getBoolean(12, false);
        typedArrayObtainStyledAttributes.recycle();
        setWillNotDraw(false);
        f fVar = new f(this, i13);
        WeakHashMap weakHashMap3 = a1.f250a;
        s0.l(this, fVar);
    }

    public static h c(View view) {
        h hVar = (h) view.getTag(2131429154);
        if (hVar != null) {
            return hVar;
        }
        h hVar2 = new h(view);
        view.setTag(2131429154, hVar2);
        return hVar2;
    }

    public final void a() {
        View view;
        if (this.f34035a) {
            ViewGroup viewGroup = null;
            this.f34037c = null;
            this.f34038d = null;
            int i5 = this.f34036b;
            if (i5 != -1) {
                ViewGroup viewGroup2 = (ViewGroup) findViewById(i5);
                this.f34037c = viewGroup2;
                if (viewGroup2 != null) {
                    ViewParent parent = viewGroup2.getParent();
                    View view2 = viewGroup2;
                    while (parent != this && parent != null) {
                        if (parent instanceof View) {
                            view2 = (View) parent;
                        }
                        parent = parent.getParent();
                        view2 = view2;
                    }
                    this.f34038d = view2;
                }
            }
            if (this.f34037c == null) {
                int childCount = getChildCount();
                for (int i11 = 0; i11 < childCount; i11++) {
                    View childAt = getChildAt(i11);
                    if ((childAt instanceof Toolbar) || (childAt instanceof android.widget.Toolbar)) {
                        viewGroup = (ViewGroup) childAt;
                        break;
                    }
                }
                this.f34037c = viewGroup;
            }
            boolean z11 = this.f34046l;
            if (!z11 && (view = this.f34039e) != null) {
                ViewParent parent2 = view.getParent();
                if (parent2 instanceof ViewGroup) {
                    ((ViewGroup) parent2).removeView(this.f34039e);
                }
            }
            if (z11 && this.f34037c != null) {
                if (this.f34039e == null) {
                    this.f34039e = new View(getContext());
                }
                if (this.f34039e.getParent() == null) {
                    this.f34037c.addView(this.f34039e, -1, -1);
                }
            }
            this.f34035a = false;
        }
    }

    public final int b() {
        int i5 = this.f34054v;
        if (i5 >= 0) {
            return i5 + this.A + this.C;
        }
        h2 h2Var = this.f34058z;
        int iD = h2Var != null ? h2Var.d() : 0;
        WeakHashMap weakHashMap = a1.f250a;
        int minimumHeight = getMinimumHeight();
        return minimumHeight > 0 ? Math.min((minimumHeight * 2) + iD, getHeight()) : getHeight() / 3;
    }

    @Override // android.widget.FrameLayout, android.view.ViewGroup
    public final boolean checkLayoutParams(ViewGroup.LayoutParams layoutParams) {
        return layoutParams instanceof dj.c;
    }

    public final void d(Drawable drawable) {
        Drawable drawable2 = this.n;
        if (drawable2 != drawable) {
            if (drawable2 != null) {
                drawable2.setCallback(null);
            }
            Drawable drawableMutate = drawable != null ? drawable.mutate() : null;
            this.n = drawableMutate;
            if (drawableMutate != null) {
                int width = getWidth();
                int height = getHeight();
                ViewGroup viewGroup = this.f34037c;
                if (this.f34057y == 1 && viewGroup != null && this.f34046l) {
                    height = viewGroup.getBottom();
                }
                drawableMutate.setBounds(0, 0, width, height);
                this.n.setCallback(this);
                this.n.setAlpha(this.f34048p);
            }
            WeakHashMap weakHashMap = a1.f250a;
            postInvalidateOnAnimation();
        }
    }

    @Override // android.view.View
    public final void draw(Canvas canvas) {
        Drawable drawable;
        super.draw(canvas);
        a();
        if (this.f34037c == null && (drawable = this.n) != null && this.f34048p > 0) {
            drawable.mutate().setAlpha(this.f34048p);
            this.n.draw(canvas);
        }
        if (this.f34046l && this.f34047m) {
            ViewGroup viewGroup = this.f34037c;
            tj.b bVar = this.f34045k;
            if (viewGroup == null || this.n == null || this.f34048p <= 0 || this.f34057y != 1 || bVar.f89337b >= bVar.f89343e) {
                bVar.d(canvas);
            } else {
                int iSave = canvas.save();
                canvas.clipRect(this.n.getBounds(), Region.Op.DIFFERENCE);
                bVar.d(canvas);
                canvas.restoreToCount(iSave);
            }
        }
        if (this.o == null || this.f34048p <= 0) {
            return;
        }
        h2 h2Var = this.f34058z;
        int iD = h2Var != null ? h2Var.d() : 0;
        if (iD > 0) {
            this.o.setBounds(0, -this.f34056x, getWidth(), iD - this.f34056x);
            this.o.mutate().setAlpha(this.f34048p);
            this.o.draw(canvas);
        }
    }

    @Override // android.view.ViewGroup
    public final boolean drawChild(Canvas canvas, View view, long j11) {
        boolean z11;
        View view2;
        Drawable drawable = this.n;
        if (drawable == null || this.f34048p <= 0 || ((view2 = this.f34038d) == null || view2 == this ? view != this.f34037c : view != view2)) {
            z11 = false;
        } else {
            int width = getWidth();
            int height = getHeight();
            if (this.f34057y == 1 && view != null && this.f34046l) {
                height = view.getBottom();
            }
            drawable.setBounds(0, 0, width, height);
            this.n.mutate().setAlpha(this.f34048p);
            this.n.draw(canvas);
            z11 = true;
        }
        return super.drawChild(canvas, view, j11) || z11;
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void drawableStateChanged() {
        ColorStateList colorStateList;
        super.drawableStateChanged();
        int[] drawableState = getDrawableState();
        boolean z11 = false;
        Drawable drawable = this.o;
        boolean state = (drawable == null || !drawable.isStateful()) ? false : drawable.setState(drawableState);
        Drawable drawable2 = this.n;
        if (drawable2 != null && drawable2.isStateful()) {
            state |= drawable2.setState(drawableState);
        }
        tj.b bVar = this.f34045k;
        if (bVar != null) {
            bVar.R = drawableState;
            ColorStateList colorStateList2 = bVar.o;
            if ((colorStateList2 != null && colorStateList2.isStateful()) || ((colorStateList = bVar.n) != null && colorStateList.isStateful())) {
                bVar.i(false);
                z11 = true;
            }
            state |= z11;
        }
        if (state) {
            invalidate();
        }
    }

    public final void e() {
        int i5;
        ViewGroup viewGroup;
        if (this.n == null && this.o == null) {
            return;
        }
        boolean z11 = getHeight() + this.f34056x < b();
        WeakHashMap weakHashMap = a1.f250a;
        boolean z12 = isLaidOut() && !isInEditMode();
        if (this.f34049q != z11) {
            if (z12) {
                i5 = z11 ? 255 : 0;
                a();
                ValueAnimator valueAnimator = this.f34050r;
                if (valueAnimator == null) {
                    ValueAnimator valueAnimator2 = new ValueAnimator();
                    this.f34050r = valueAnimator2;
                    valueAnimator2.setInterpolator(i5 > this.f34048p ? this.f34052t : this.f34053u);
                    this.f34050r.addUpdateListener(new a0(this, 3));
                } else if (valueAnimator.isRunning()) {
                    this.f34050r.cancel();
                }
                this.f34050r.setDuration(this.f34051s);
                this.f34050r.setIntValues(this.f34048p, i5);
                this.f34050r.start();
            } else {
                i5 = z11 ? 255 : 0;
                if (i5 != this.f34048p) {
                    if (this.n != null && (viewGroup = this.f34037c) != null) {
                        viewGroup.postInvalidateOnAnimation();
                    }
                    this.f34048p = i5;
                    postInvalidateOnAnimation();
                }
            }
            this.f34049q = z11;
        }
    }

    public final void f(int i5, int i11, int i12, int i13, boolean z11) {
        View view;
        int titleMarginBottom;
        int titleMarginEnd;
        int titleMarginTop;
        if (!this.f34046l || (view = this.f34039e) == null) {
            return;
        }
        WeakHashMap weakHashMap = a1.f250a;
        int titleMarginStart = 0;
        boolean z12 = view.isAttachedToWindow() && this.f34039e.getVisibility() == 0;
        this.f34047m = z12;
        if (z12 || z11) {
            boolean z13 = getLayoutDirection() == 1;
            View view2 = this.f34038d;
            if (view2 == null) {
                view2 = this.f34037c;
            }
            int height = ((getHeight() - c(view2).f49262b) - view2.getHeight()) - ((FrameLayout.LayoutParams) ((dj.c) view2.getLayoutParams())).bottomMargin;
            View view3 = this.f34039e;
            Rect rect = this.f34044j;
            tj.c.a(this, view3, rect);
            ViewGroup viewGroup = this.f34037c;
            if (viewGroup instanceof Toolbar) {
                Toolbar toolbar = (Toolbar) viewGroup;
                titleMarginStart = toolbar.f13813p;
                titleMarginEnd = toolbar.f13814q;
                titleMarginTop = toolbar.f13815r;
                titleMarginBottom = toolbar.f13816s;
            } else if (viewGroup instanceof android.widget.Toolbar) {
                android.widget.Toolbar toolbar2 = (android.widget.Toolbar) viewGroup;
                titleMarginStart = toolbar2.getTitleMarginStart();
                titleMarginEnd = toolbar2.getTitleMarginEnd();
                titleMarginTop = toolbar2.getTitleMarginTop();
                titleMarginBottom = toolbar2.getTitleMarginBottom();
            } else {
                titleMarginBottom = 0;
                titleMarginEnd = 0;
                titleMarginTop = 0;
            }
            int i14 = rect.left + (z13 ? titleMarginEnd : titleMarginStart);
            int i15 = rect.top + height + titleMarginTop;
            int i16 = rect.right;
            if (!z13) {
                titleMarginStart = titleMarginEnd;
            }
            int i17 = i16 - titleMarginStart;
            int i18 = (rect.bottom + height) - titleMarginBottom;
            tj.b bVar = this.f34045k;
            Rect rect2 = bVar.f89349h;
            if (rect2.left != i14 || rect2.top != i15 || rect2.right != i17 || rect2.bottom != i18) {
                rect2.set(i14, i15, i17, i18);
                bVar.S = true;
            }
            int i19 = this.f34040f;
            int i21 = this.f34042h;
            int i22 = z13 ? i21 : i19;
            int i23 = rect.top + this.f34041g;
            int i24 = i12 - i5;
            if (!z13) {
                i19 = i21;
            }
            int i25 = i24 - i19;
            int i26 = (i13 - i11) - this.f34043i;
            Rect rect3 = bVar.f89347g;
            if (rect3.left != i22 || rect3.top != i23 || rect3.right != i25 || rect3.bottom != i26) {
                rect3.set(i22, i23, i25, i26);
                bVar.S = true;
            }
            bVar.i(z11);
        }
    }

    public final void g() {
        boolean z11;
        if (this.f34037c == null || !(z11 = this.f34046l)) {
            return;
        }
        tj.b bVar = this.f34045k;
        if (TextUtils.isEmpty(bVar.G)) {
            ViewGroup viewGroup = this.f34037c;
            CharSequence title = viewGroup instanceof Toolbar ? ((Toolbar) viewGroup).f13821x : viewGroup instanceof android.widget.Toolbar ? ((android.widget.Toolbar) viewGroup).getTitle() : null;
            if (title == null || !TextUtils.equals(bVar.G, title)) {
                bVar.G = title;
                bVar.H = null;
                Bitmap bitmap = bVar.K;
                if (bitmap != null) {
                    bitmap.recycle();
                    bVar.K = null;
                }
                bVar.i(false);
            }
            setContentDescription(z11 ? bVar.G : null);
        }
    }

    @Override // android.widget.FrameLayout, android.view.ViewGroup
    public final ViewGroup.LayoutParams generateDefaultLayoutParams() {
        dj.c cVar = new dj.c(-1, -1);
        cVar.f49245a = 0;
        cVar.f49246b = 0.5f;
        return cVar;
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        ViewParent parent = getParent();
        if (parent instanceof AppBarLayout) {
            AppBarLayout appBarLayout = (AppBarLayout) parent;
            if (this.f34057y == 1) {
                appBarLayout.f34014k = false;
            }
            WeakHashMap weakHashMap = a1.f250a;
            setFitsSystemWindows(appBarLayout.getFitsSystemWindows());
            if (this.f34055w == null) {
                this.f34055w = new d(this);
            }
            d dVar = this.f34055w;
            if (appBarLayout.f34011h == null) {
                appBarLayout.f34011h = new ArrayList();
            }
            if (dVar != null && !appBarLayout.f34011h.contains(dVar)) {
                appBarLayout.f34011h.add(dVar);
            }
            q0.c(this);
        }
    }

    @Override // android.view.View
    public final void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        this.f34045k.h(configuration);
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onDetachedFromWindow() {
        ArrayList arrayList;
        ViewParent parent = getParent();
        d dVar = this.f34055w;
        if (dVar != null && (parent instanceof AppBarLayout) && (arrayList = ((AppBarLayout) parent).f34011h) != null) {
            arrayList.remove(dVar);
        }
        super.onDetachedFromWindow();
    }

    @Override // android.widget.FrameLayout, android.view.ViewGroup, android.view.View
    public final void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        super.onLayout(z11, i5, i11, i12, i13);
        h2 h2Var = this.f34058z;
        if (h2Var != null) {
            int iD = h2Var.d();
            int childCount = getChildCount();
            for (int i14 = 0; i14 < childCount; i14++) {
                View childAt = getChildAt(i14);
                WeakHashMap weakHashMap = a1.f250a;
                if (!childAt.getFitsSystemWindows() && childAt.getTop() < iD) {
                    childAt.offsetTopAndBottom(iD);
                }
            }
        }
        int childCount2 = getChildCount();
        for (int i15 = 0; i15 < childCount2; i15++) {
            h hVarC = c(getChildAt(i15));
            View view = hVarC.f49261a;
            hVarC.f49262b = view.getTop();
            hVarC.f49263c = view.getLeft();
        }
        f(i5, i11, i12, i13, false);
        g();
        e();
        int childCount3 = getChildCount();
        for (int i16 = 0; i16 < childCount3; i16++) {
            c(getChildAt(i16)).a();
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:19:0x007f  */
    @Override // android.widget.FrameLayout, android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void onMeasure(int i5, int i11) {
        CollapsingToolbarLayout collapsingToolbarLayout;
        int measuredHeight;
        int measuredHeight2;
        a();
        super.onMeasure(i5, i11);
        int mode = View.MeasureSpec.getMode(i11);
        h2 h2Var = this.f34058z;
        int iD = h2Var != null ? h2Var.d() : 0;
        if ((mode == 0 || this.B) && iD > 0) {
            this.A = iD;
            super.onMeasure(i5, View.MeasureSpec.makeMeasureSpec(getMeasuredHeight() + iD, 1073741824));
        }
        if (this.D) {
            tj.b bVar = this.f34045k;
            if (bVar.f89361n0 > 1) {
                g();
                collapsingToolbarLayout = this;
                collapsingToolbarLayout.f(0, 0, getMeasuredWidth(), getMeasuredHeight(), true);
                int i12 = bVar.f89363p;
                if (i12 > 1) {
                    TextPaint textPaint = bVar.U;
                    textPaint.setTextSize(bVar.f89357l);
                    textPaint.setTypeface(bVar.f89374z);
                    textPaint.setLetterSpacing(bVar.f89348g0);
                    collapsingToolbarLayout.C = (i12 - 1) * Math.round(textPaint.descent() + (-textPaint.ascent()));
                    super.onMeasure(i5, View.MeasureSpec.makeMeasureSpec(getMeasuredHeight() + collapsingToolbarLayout.C, 1073741824));
                }
            } else {
                collapsingToolbarLayout = this;
            }
        }
        ViewGroup viewGroup = collapsingToolbarLayout.f34037c;
        if (viewGroup != null) {
            View view = collapsingToolbarLayout.f34038d;
            if (view == null || view == collapsingToolbarLayout) {
                ViewGroup.LayoutParams layoutParams = viewGroup.getLayoutParams();
                if (layoutParams instanceof ViewGroup.MarginLayoutParams) {
                    ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) layoutParams;
                    measuredHeight = viewGroup.getMeasuredHeight() + marginLayoutParams.topMargin + marginLayoutParams.bottomMargin;
                } else {
                    measuredHeight = viewGroup.getMeasuredHeight();
                }
                setMinimumHeight(measuredHeight);
                return;
            }
            ViewGroup.LayoutParams layoutParams2 = view.getLayoutParams();
            if (layoutParams2 instanceof ViewGroup.MarginLayoutParams) {
                ViewGroup.MarginLayoutParams marginLayoutParams2 = (ViewGroup.MarginLayoutParams) layoutParams2;
                measuredHeight2 = view.getMeasuredHeight() + marginLayoutParams2.topMargin + marginLayoutParams2.bottomMargin;
            } else {
                measuredHeight2 = view.getMeasuredHeight();
            }
            setMinimumHeight(measuredHeight2);
        }
    }

    @Override // android.view.View
    public final void onSizeChanged(int i5, int i11, int i12, int i13) {
        super.onSizeChanged(i5, i11, i12, i13);
        Drawable drawable = this.n;
        if (drawable != null) {
            ViewGroup viewGroup = this.f34037c;
            if (this.f34057y == 1 && viewGroup != null && this.f34046l) {
                i11 = viewGroup.getBottom();
            }
            drawable.setBounds(0, 0, i5, i11);
        }
    }

    @Override // android.view.View
    public final void setVisibility(int i5) {
        super.setVisibility(i5);
        boolean z11 = i5 == 0;
        Drawable drawable = this.o;
        if (drawable != null && drawable.isVisible() != z11) {
            this.o.setVisible(z11, false);
        }
        Drawable drawable2 = this.n;
        if (drawable2 == null || drawable2.isVisible() == z11) {
            return;
        }
        this.n.setVisible(z11, false);
    }

    @Override // android.view.View
    public final boolean verifyDrawable(Drawable drawable) {
        return super.verifyDrawable(drawable) || drawable == this.n || drawable == this.o;
    }

    @Override // android.widget.FrameLayout, android.view.ViewGroup
    public final FrameLayout.LayoutParams generateLayoutParams(AttributeSet attributeSet) {
        Context context = getContext();
        dj.c cVar = new dj.c(context, attributeSet);
        cVar.f49245a = 0;
        cVar.f49246b = 0.5f;
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, bj.a.f17925l);
        cVar.f49245a = typedArrayObtainStyledAttributes.getInt(0, 0);
        cVar.f49246b = typedArrayObtainStyledAttributes.getFloat(1, 0.5f);
        typedArrayObtainStyledAttributes.recycle();
        return cVar;
    }

    @Override // android.widget.FrameLayout, android.view.ViewGroup
    public final FrameLayout.LayoutParams generateDefaultLayoutParams() {
        dj.c cVar = new dj.c(-1, -1);
        cVar.f49245a = 0;
        cVar.f49246b = 0.5f;
        return cVar;
    }

    @Override // android.widget.FrameLayout, android.view.ViewGroup
    public final ViewGroup.LayoutParams generateLayoutParams(ViewGroup.LayoutParams layoutParams) {
        dj.c cVar = new dj.c(layoutParams);
        cVar.f49245a = 0;
        cVar.f49246b = 0.5f;
        return cVar;
    }
}
