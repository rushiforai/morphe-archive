package com.google.android.material.chip;

import a5.a1;
import a5.s0;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.PorterDuff;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.InsetDrawable;
import android.graphics.drawable.RippleDrawable;
import android.text.TextPaint;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.util.Log;
import android.util.TypedValue;
import android.view.MotionEvent;
import android.view.PointerIcon;
import android.view.View;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.Checkable;
import android.widget.CompoundButton;
import android.widget.TextView;
import androidx.compose.ui.node.LayoutNode;
import bk.f;
import bk.j;
import bk.u;
import cj.e;
import com.google.android.gms.internal.consent_sdk.k0;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.lang.ref.WeakReference;
import java.util.Arrays;
import java.util.WeakHashMap;
import lj.a;
import lj.c;
import lj.d;
import ps.e0;
import ps.f0;
import r.n;
import tj.g;
import tj.i;

/* loaded from: classes3.dex */
public class Chip extends n implements c, u, Checkable {

    /* renamed from: t, reason: collision with root package name */
    public static final Rect f34171t = new Rect();

    /* renamed from: u, reason: collision with root package name */
    public static final int[] f34172u = {16842913};

    /* renamed from: v, reason: collision with root package name */
    public static final int[] f34173v = {16842911};

    /* renamed from: e, reason: collision with root package name */
    public final d f34174e;

    /* renamed from: f, reason: collision with root package name */
    public InsetDrawable f34175f;

    /* renamed from: g, reason: collision with root package name */
    public RippleDrawable f34176g;

    /* renamed from: h, reason: collision with root package name */
    public CompoundButton.OnCheckedChangeListener f34177h;

    /* renamed from: i, reason: collision with root package name */
    public boolean f34178i;

    /* renamed from: j, reason: collision with root package name */
    public boolean f34179j;

    /* renamed from: k, reason: collision with root package name */
    public boolean f34180k;

    /* renamed from: l, reason: collision with root package name */
    public boolean f34181l;

    /* renamed from: m, reason: collision with root package name */
    public final boolean f34182m;
    public int n;
    public int o;

    /* renamed from: p, reason: collision with root package name */
    public String f34183p;

    /* renamed from: q, reason: collision with root package name */
    public final Rect f34184q;

    /* renamed from: r, reason: collision with root package name */
    public final RectF f34185r;

    /* renamed from: s, reason: collision with root package name */
    public final a f34186s;

    public Chip(Context context, AttributeSet attributeSet) {
        d dVar;
        ColorStateList colorStateListM;
        Drawable drawable;
        int resourceId;
        super(hk.a.a(context, attributeSet, 2130968893, 2132083972), attributeSet, 2130968893);
        this.f34184q = new Rect();
        this.f34185r = new RectF();
        this.f34186s = new a(this, 0);
        Context context2 = getContext();
        if (attributeSet != null) {
            if (attributeSet.getAttributeValue("http://schemas.android.com/apk/res/android", "background") != null) {
                Log.w("Chip", "Do not set the background; Chip manages its own background drawable.");
            }
            if (attributeSet.getAttributeValue("http://schemas.android.com/apk/res/android", "drawableLeft") != null) {
                throw new UnsupportedOperationException("Please set left drawable using R.attr#chipIcon.");
            }
            if (attributeSet.getAttributeValue("http://schemas.android.com/apk/res/android", "drawableStart") != null) {
                throw new UnsupportedOperationException("Please set start drawable using R.attr#chipIcon.");
            }
            if (attributeSet.getAttributeValue("http://schemas.android.com/apk/res/android", "drawableEnd") != null) {
                throw new UnsupportedOperationException("Please set end drawable using R.attr#closeIcon.");
            }
            if (attributeSet.getAttributeValue("http://schemas.android.com/apk/res/android", "drawableRight") != null) {
                throw new UnsupportedOperationException("Please set end drawable using R.attr#closeIcon.");
            }
            if (!attributeSet.getAttributeBooleanValue("http://schemas.android.com/apk/res/android", "singleLine", true) || attributeSet.getAttributeIntValue("http://schemas.android.com/apk/res/android", "lines", 1) != 1 || attributeSet.getAttributeIntValue("http://schemas.android.com/apk/res/android", "minLines", 1) != 1 || attributeSet.getAttributeIntValue("http://schemas.android.com/apk/res/android", "maxLines", 1) != 1) {
                throw new UnsupportedOperationException("Chip does not support multi-line text");
            }
            if (attributeSet.getAttributeIntValue("http://schemas.android.com/apk/res/android", "gravity", 8388627) != 8388627) {
                Log.w("Chip", "Chip text must be vertically center and start aligned");
            }
        }
        d dVar2 = new d(context2, attributeSet);
        Context context3 = dVar2.f74957c0;
        int[] iArr = bj.a.f17920g;
        TypedArray typedArrayF = i.f(context3, attributeSet, iArr, 2130968893, 2132083972, new int[0]);
        dVar2.C0 = typedArrayF.hasValue(37);
        Context context4 = dVar2.f74957c0;
        ColorStateList colorStateListM2 = f0.m(context4, typedArrayF, 24);
        if (dVar2.f74979y != colorStateListM2) {
            dVar2.f74979y = colorStateListM2;
            dVar2.onStateChange(dVar2.getState());
        }
        ColorStateList colorStateListM3 = f0.m(context4, typedArrayF, 11);
        if (dVar2.f74981z != colorStateListM3) {
            dVar2.f74981z = colorStateListM3;
            dVar2.onStateChange(dVar2.getState());
        }
        float dimension = typedArrayF.getDimension(19, 0.0f);
        if (dVar2.A != dimension) {
            dVar2.A = dimension;
            dVar2.invalidateSelf();
            dVar2.x();
        }
        if (typedArrayF.hasValue(12)) {
            float dimension2 = typedArrayF.getDimension(12, 0.0f);
            if (dVar2.B != dimension2) {
                dVar2.B = dimension2;
                j jVarF = dVar2.f17980a.f17964a.f();
                jVarF.f18007e = new bk.a(dimension2);
                jVarF.f18008f = new bk.a(dimension2);
                jVarF.f18009g = new bk.a(dimension2);
                jVarF.f18010h = new bk.a(dimension2);
                dVar2.c(jVarF.a());
            }
        }
        ColorStateList colorStateListM4 = f0.m(context4, typedArrayF, 22);
        if (dVar2.C != colorStateListM4) {
            dVar2.C = colorStateListM4;
            if (dVar2.C0) {
                f fVar = dVar2.f17980a;
                if (fVar.f17967d != colorStateListM4) {
                    fVar.f17967d = colorStateListM4;
                    dVar2.onStateChange(dVar2.getState());
                }
            }
            dVar2.onStateChange(dVar2.getState());
        }
        float dimension3 = typedArrayF.getDimension(23, 0.0f);
        if (dVar2.D != dimension3) {
            dVar2.D = dimension3;
            dVar2.f74958d0.setStrokeWidth(dimension3);
            if (dVar2.C0) {
                dVar2.f17980a.f17973j = dimension3;
                dVar2.invalidateSelf();
            }
            dVar2.invalidateSelf();
        }
        ColorStateList colorStateListM5 = f0.m(context4, typedArrayF, 36);
        if (dVar2.E != colorStateListM5) {
            dVar2.E = colorStateListM5;
            dVar2.f74978x0 = null;
            dVar2.onStateChange(dVar2.getState());
        }
        CharSequence text = typedArrayF.getText(5);
        text = text == null ? b.f42142b : text;
        if (!TextUtils.equals(dVar2.F, text)) {
            dVar2.F = text;
            dVar2.f74963i0.f89391d = true;
            dVar2.invalidateSelf();
            dVar2.x();
        }
        yj.c cVar = (!typedArrayF.hasValue(0) || (resourceId = typedArrayF.getResourceId(0, 0)) == 0) ? null : new yj.c(context4, resourceId);
        cVar.f97363k = typedArrayF.getDimension(1, cVar.f97363k);
        dVar2.C(cVar);
        int i5 = typedArrayF.getInt(3, 0);
        if (i5 == 1) {
            dVar2.f74982z0 = TextUtils.TruncateAt.START;
        } else if (i5 == 2) {
            dVar2.f74982z0 = TextUtils.TruncateAt.MIDDLE;
        } else if (i5 == 3) {
            dVar2.f74982z0 = TextUtils.TruncateAt.END;
        }
        dVar2.A(typedArrayF.getBoolean(18, false));
        if (attributeSet != null && attributeSet.getAttributeValue("http://schemas.android.com/apk/res-auto", "chipIconEnabled") != null && attributeSet.getAttributeValue("http://schemas.android.com/apk/res-auto", "chipIconVisible") == null) {
            dVar2.A(typedArrayF.getBoolean(15, false));
        }
        Drawable drawableP = f0.p(context4, typedArrayF, 14);
        Drawable drawable2 = dVar2.H;
        Drawable drawableD = drawable2 != null ? e0.D(drawable2) : null;
        if (drawableD != drawableP) {
            float fS = dVar2.s();
            dVar2.H = drawableP != null ? drawableP.mutate() : null;
            float fS2 = dVar2.s();
            d.G(drawableD);
            if (dVar2.E()) {
                dVar2.q(dVar2.H);
            }
            dVar2.invalidateSelf();
            if (fS != fS2) {
                dVar2.x();
            }
        }
        if (typedArrayF.hasValue(17)) {
            ColorStateList colorStateListM6 = f0.m(context4, typedArrayF, 17);
            dVar2.K = true;
            if (dVar2.I != colorStateListM6) {
                dVar2.I = colorStateListM6;
                if (dVar2.E()) {
                    dVar2.H.setTintList(colorStateListM6);
                }
                dVar2.onStateChange(dVar2.getState());
            }
        }
        float dimension4 = typedArrayF.getDimension(16, -1.0f);
        if (dVar2.J != dimension4) {
            float fS3 = dVar2.s();
            dVar2.J = dimension4;
            float fS4 = dVar2.s();
            dVar2.invalidateSelf();
            if (fS3 != fS4) {
                dVar2.x();
            }
        }
        dVar2.B(typedArrayF.getBoolean(31, false));
        if (attributeSet != null && attributeSet.getAttributeValue("http://schemas.android.com/apk/res-auto", "closeIconEnabled") != null && attributeSet.getAttributeValue("http://schemas.android.com/apk/res-auto", "closeIconVisible") == null) {
            dVar2.B(typedArrayF.getBoolean(26, false));
        }
        Drawable drawableP2 = f0.p(context4, typedArrayF, 25);
        Drawable drawable3 = dVar2.M;
        Drawable drawableD2 = drawable3 != null ? e0.D(drawable3) : null;
        if (drawableD2 != drawableP2) {
            float fT = dVar2.t();
            dVar2.M = drawableP2 != null ? drawableP2.mutate() : null;
            int[] iArr2 = zj.a.f98535a;
            dVar2.N = new RippleDrawable(zj.a.a(dVar2.E), dVar2.M, d.E0);
            float fT2 = dVar2.t();
            d.G(drawableD2);
            if (dVar2.F()) {
                dVar2.q(dVar2.M);
            }
            dVar2.invalidateSelf();
            if (fT != fT2) {
                dVar2.x();
            }
        }
        ColorStateList colorStateListM7 = f0.m(context4, typedArrayF, 30);
        if (dVar2.O != colorStateListM7) {
            dVar2.O = colorStateListM7;
            if (dVar2.F()) {
                dVar2.M.setTintList(colorStateListM7);
            }
            dVar2.onStateChange(dVar2.getState());
        }
        float dimension5 = typedArrayF.getDimension(28, 0.0f);
        if (dVar2.P != dimension5) {
            dVar2.P = dimension5;
            dVar2.invalidateSelf();
            if (dVar2.F()) {
                dVar2.x();
            }
        }
        boolean z11 = typedArrayF.getBoolean(6, false);
        if (dVar2.Q != z11) {
            dVar2.Q = z11;
            float fS5 = dVar2.s();
            if (!z11 && dVar2.f74970p0) {
                dVar2.f74970p0 = false;
            }
            float fS6 = dVar2.s();
            dVar2.invalidateSelf();
            if (fS5 != fS6) {
                dVar2.x();
            }
        }
        dVar2.z(typedArrayF.getBoolean(10, false));
        if (attributeSet != null && attributeSet.getAttributeValue("http://schemas.android.com/apk/res-auto", "checkedIconEnabled") != null && attributeSet.getAttributeValue("http://schemas.android.com/apk/res-auto", "checkedIconVisible") == null) {
            dVar2.z(typedArrayF.getBoolean(8, false));
        }
        Drawable drawableP3 = f0.p(context4, typedArrayF, 7);
        if (dVar2.S != drawableP3) {
            float fS7 = dVar2.s();
            dVar2.S = drawableP3;
            float fS8 = dVar2.s();
            d.G(dVar2.S);
            dVar2.q(dVar2.S);
            dVar2.invalidateSelf();
            if (fS7 != fS8) {
                dVar2.x();
            }
        }
        if (typedArrayF.hasValue(9) && dVar2.T != (colorStateListM = f0.m(context4, typedArrayF, 9))) {
            dVar2.T = colorStateListM;
            if (dVar2.R && (drawable = dVar2.S) != null && dVar2.Q) {
                drawable.setTintList(colorStateListM);
            }
            dVar2.onStateChange(dVar2.getState());
        }
        e.a(context4, typedArrayF, 39);
        e.a(context4, typedArrayF, 33);
        float dimension6 = typedArrayF.getDimension(21, 0.0f);
        if (dVar2.U != dimension6) {
            dVar2.U = dimension6;
            dVar2.invalidateSelf();
            dVar2.x();
        }
        float dimension7 = typedArrayF.getDimension(35, 0.0f);
        if (dVar2.V != dimension7) {
            float fS9 = dVar2.s();
            dVar2.V = dimension7;
            float fS10 = dVar2.s();
            dVar2.invalidateSelf();
            if (fS9 != fS10) {
                dVar2.x();
            }
        }
        float dimension8 = typedArrayF.getDimension(34, 0.0f);
        if (dVar2.W != dimension8) {
            float fS11 = dVar2.s();
            dVar2.W = dimension8;
            float fS12 = dVar2.s();
            dVar2.invalidateSelf();
            if (fS11 != fS12) {
                dVar2.x();
            }
        }
        float dimension9 = typedArrayF.getDimension(41, 0.0f);
        if (dVar2.X != dimension9) {
            dVar2.X = dimension9;
            dVar2.invalidateSelf();
            dVar2.x();
        }
        float dimension10 = typedArrayF.getDimension(40, 0.0f);
        if (dVar2.Y != dimension10) {
            dVar2.Y = dimension10;
            dVar2.invalidateSelf();
            dVar2.x();
        }
        float dimension11 = typedArrayF.getDimension(29, 0.0f);
        if (dVar2.Z != dimension11) {
            dVar2.Z = dimension11;
            dVar2.invalidateSelf();
            if (dVar2.F()) {
                dVar2.x();
            }
        }
        float dimension12 = typedArrayF.getDimension(27, 0.0f);
        if (dVar2.f74955a0 != dimension12) {
            dVar2.f74955a0 = dimension12;
            dVar2.invalidateSelf();
            if (dVar2.F()) {
                dVar2.x();
            }
        }
        float dimension13 = typedArrayF.getDimension(13, 0.0f);
        if (dVar2.f74956b0 != dimension13) {
            dVar2.f74956b0 = dimension13;
            dVar2.invalidateSelf();
            dVar2.x();
        }
        dVar2.B0 = typedArrayF.getDimensionPixelSize(4, LayoutNode.NotPlacedPlaceOrder);
        typedArrayF.recycle();
        i.a(context2, attributeSet, 2130968893, 2132083972);
        i.b(context2, attributeSet, iArr, 2130968893, 2132083972, new int[0]);
        TypedArray typedArrayObtainStyledAttributes = context2.obtainStyledAttributes(attributeSet, iArr, 2130968893, 2132083972);
        this.f34182m = typedArrayObtainStyledAttributes.getBoolean(32, false);
        this.o = (int) Math.ceil(typedArrayObtainStyledAttributes.getDimension(20, (float) Math.ceil(TypedValue.applyDimension(1, 48, getContext().getResources().getDisplayMetrics()))));
        typedArrayObtainStyledAttributes.recycle();
        d dVar3 = this.f34174e;
        if (dVar3 != dVar2) {
            if (dVar3 != null) {
                dVar3.f74980y0 = new WeakReference(null);
            }
            this.f34174e = dVar2;
            dVar2.A0 = false;
            dVar2.f74980y0 = new WeakReference(this);
            a(this.o);
        }
        dVar2.k(s0.e(this));
        i.a(context2, attributeSet, 2130968893, 2132083972);
        i.b(context2, attributeSet, iArr, 2130968893, 2132083972, new int[0]);
        TypedArray typedArrayObtainStyledAttributes2 = context2.obtainStyledAttributes(attributeSet, iArr, 2130968893, 2132083972);
        boolean zHasValue = typedArrayObtainStyledAttributes2.hasValue(37);
        typedArrayObtainStyledAttributes2.recycle();
        new lj.b(this, this);
        if (b() && (dVar = this.f34174e) != null) {
            boolean z12 = dVar.L;
        }
        a1.k(this, null);
        if (!zHasValue) {
            setOutlineProvider(new ab.a(this, 3));
        }
        setChecked(this.f34178i);
        setText(dVar2.F);
        setEllipsize(dVar2.f74982z0);
        f();
        if (!this.f34174e.A0) {
            setLines(1);
            setHorizontallyScrolling(true);
        }
        super.setGravity(8388627);
        e();
        if (this.f34182m) {
            setMinHeight(this.o);
        }
        this.n = getLayoutDirection();
        super.setOnCheckedChangeListener(new f10.b(this, 2));
    }

    public final void a(int i5) {
        this.o = i5;
        if (!this.f34182m) {
            InsetDrawable insetDrawable = this.f34175f;
            if (insetDrawable == null) {
                d();
                return;
            }
            if (insetDrawable != null) {
                this.f34175f = null;
                setMinWidth(0);
                d dVar = this.f34174e;
                setMinHeight((int) (dVar != null ? dVar.A : 0.0f));
                d();
                return;
            }
            return;
        }
        int iMax = Math.max(0, i5 - ((int) this.f34174e.A));
        int iMax2 = Math.max(0, i5 - this.f34174e.getIntrinsicWidth());
        if (iMax2 <= 0 && iMax <= 0) {
            InsetDrawable insetDrawable2 = this.f34175f;
            if (insetDrawable2 == null) {
                d();
                return;
            }
            if (insetDrawable2 != null) {
                this.f34175f = null;
                setMinWidth(0);
                d dVar2 = this.f34174e;
                setMinHeight((int) (dVar2 != null ? dVar2.A : 0.0f));
                d();
                return;
            }
            return;
        }
        int i11 = iMax2 > 0 ? iMax2 / 2 : 0;
        int i12 = iMax > 0 ? iMax / 2 : 0;
        if (this.f34175f != null) {
            Rect rect = new Rect();
            this.f34175f.getPadding(rect);
            if (rect.top == i12 && rect.bottom == i12 && rect.left == i11 && rect.right == i11) {
                d();
                return;
            }
        }
        if (getMinHeight() != i5) {
            setMinHeight(i5);
        }
        if (getMinWidth() != i5) {
            setMinWidth(i5);
        }
        this.f34175f = new InsetDrawable((Drawable) this.f34174e, i11, i12, i11, i12);
        d();
    }

    public final boolean b() {
        d dVar = this.f34174e;
        if (dVar == null) {
            return false;
        }
        Drawable drawable = dVar.M;
        return (drawable != null ? e0.D(drawable) : null) != null;
    }

    @Override // bk.u
    public final void c(j jVar) {
        this.f34174e.c(jVar);
    }

    public final void d() {
        int[] iArr = zj.a.f98535a;
        d dVar = this.f34174e;
        ColorStateList colorStateListA = zj.a.a(dVar.E);
        Drawable drawable = this.f34175f;
        if (drawable == null) {
            drawable = dVar;
        }
        this.f34176g = new RippleDrawable(colorStateListA, drawable, null);
        dVar.getClass();
        RippleDrawable rippleDrawable = this.f34176g;
        WeakHashMap weakHashMap = a1.f250a;
        setBackground(rippleDrawable);
        e();
    }

    @Override // android.view.View
    public final boolean dispatchHoverEvent(MotionEvent motionEvent) {
        return super.dispatchHoverEvent(motionEvent);
    }

    /* JADX WARN: Type inference failed for: r1v3, types: [boolean, int] */
    @Override // r.n, android.widget.CompoundButton, android.widget.TextView, android.view.View
    public final void drawableStateChanged() {
        int i5;
        super.drawableStateChanged();
        boolean zY = false;
        d dVar = this.f34174e;
        if (dVar != null && d.w(dVar.M)) {
            ?? IsEnabled = isEnabled();
            int i11 = IsEnabled;
            if (this.f34181l) {
                i11 = IsEnabled + 1;
            }
            int i12 = i11;
            if (this.f34180k) {
                i12 = i11 + 1;
            }
            int i13 = i12;
            if (this.f34179j) {
                i13 = i12 + 1;
            }
            int i14 = i13;
            if (isChecked()) {
                i14 = i13 + 1;
            }
            int[] iArr = new int[i14];
            if (isEnabled()) {
                iArr[0] = 16842910;
                i5 = 1;
            } else {
                i5 = 0;
            }
            if (this.f34181l) {
                iArr[i5] = 16842908;
                i5++;
            }
            if (this.f34180k) {
                iArr[i5] = 16843623;
                i5++;
            }
            if (this.f34179j) {
                iArr[i5] = 16842919;
                i5++;
            }
            if (isChecked()) {
                iArr[i5] = 16842913;
            }
            d dVar2 = this.f34174e;
            if (!Arrays.equals(dVar2.f74977w0, iArr)) {
                dVar2.f74977w0 = iArr;
                if (dVar2.F()) {
                    zY = dVar2.y(dVar2.getState(), iArr);
                }
            }
        }
        if (zY) {
            invalidate();
        }
    }

    public final void e() {
        d dVar;
        if (TextUtils.isEmpty(getText()) || (dVar = this.f34174e) == null) {
            return;
        }
        int iT = (int) (dVar.t() + dVar.f74956b0 + dVar.Y);
        int iS = (int) (dVar.s() + dVar.U + dVar.X);
        if (this.f34175f != null) {
            Rect rect = new Rect();
            this.f34175f.getPadding(rect);
            iS += rect.left;
            iT += rect.right;
        }
        int paddingTop = getPaddingTop();
        int paddingBottom = getPaddingBottom();
        WeakHashMap weakHashMap = a1.f250a;
        setPaddingRelative(iS, paddingTop, iT, paddingBottom);
    }

    public final void f() {
        TextPaint paint = getPaint();
        d dVar = this.f34174e;
        if (dVar != null) {
            paint.drawableState = dVar.getState();
        }
        d dVar2 = this.f34174e;
        yj.c cVar = dVar2 != null ? dVar2.f74963i0.f89393f : null;
        if (cVar != null) {
            cVar.e(getContext(), paint, this.f34186s);
        }
    }

    @Override // android.widget.CheckBox, android.widget.CompoundButton, android.widget.Button, android.widget.TextView, android.view.View
    public final CharSequence getAccessibilityClassName() {
        if (!TextUtils.isEmpty(this.f34183p)) {
            return this.f34183p;
        }
        d dVar = this.f34174e;
        if (dVar == null || !dVar.Q) {
            return isClickable() ? "android.widget.Button" : "android.view.View";
        }
        getParent();
        return "android.widget.Button";
    }

    @Override // android.widget.TextView
    public final TextUtils.TruncateAt getEllipsize() {
        d dVar = this.f34174e;
        if (dVar != null) {
            return dVar.f74982z0;
        }
        return null;
    }

    @Override // android.widget.TextView, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        k0.E(this, this.f34174e);
    }

    @Override // android.widget.CompoundButton, android.widget.TextView, android.view.View
    public final int[] onCreateDrawableState(int i5) {
        int[] iArrOnCreateDrawableState = super.onCreateDrawableState(i5 + 2);
        if (isChecked()) {
            View.mergeDrawableStates(iArrOnCreateDrawableState, f34172u);
        }
        d dVar = this.f34174e;
        if (dVar != null && dVar.Q) {
            View.mergeDrawableStates(iArrOnCreateDrawableState, f34173v);
        }
        return iArrOnCreateDrawableState;
    }

    @Override // android.widget.TextView, android.view.View
    public final void onFocusChanged(boolean z11, int i5, Rect rect) {
        super.onFocusChanged(z11, i5, rect);
    }

    @Override // android.view.View
    public final boolean onHoverEvent(MotionEvent motionEvent) {
        int actionMasked = motionEvent.getActionMasked();
        if (actionMasked == 7) {
            RectF rectF = this.f34185r;
            rectF.setEmpty();
            b();
            boolean zContains = rectF.contains(motionEvent.getX(), motionEvent.getY());
            if (this.f34180k != zContains) {
                this.f34180k = zContains;
                refreshDrawableState();
            }
        } else if (actionMasked == 10 && this.f34180k) {
            this.f34180k = false;
            refreshDrawableState();
        }
        return super.onHoverEvent(motionEvent);
    }

    @Override // android.view.View
    public final void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo accessibilityNodeInfo) {
        super.onInitializeAccessibilityNodeInfo(accessibilityNodeInfo);
        accessibilityNodeInfo.setClassName(getAccessibilityClassName());
        d dVar = this.f34174e;
        accessibilityNodeInfo.setCheckable(dVar != null && dVar.Q);
        accessibilityNodeInfo.setClickable(isClickable());
        getParent();
    }

    @Override // android.widget.Button, android.widget.TextView, android.view.View
    public final PointerIcon onResolvePointerIcon(MotionEvent motionEvent, int i5) {
        RectF rectF = this.f34185r;
        rectF.setEmpty();
        b();
        return (rectF.contains(motionEvent.getX(), motionEvent.getY()) && isEnabled()) ? PointerIcon.getSystemIcon(getContext(), 1002) : super.onResolvePointerIcon(motionEvent, i5);
    }

    @Override // android.widget.TextView, android.view.View
    public final void onRtlPropertiesChanged(int i5) {
        super.onRtlPropertiesChanged(i5);
        if (this.n != i5) {
            this.n = i5;
            e();
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:8:0x0022, code lost:
    
        if (r0 != 3) goto L27;
     */
    /* JADX WARN: Removed duplicated region for block: B:22:0x0042  */
    @Override // android.widget.TextView, android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean onTouchEvent(MotionEvent motionEvent) {
        boolean z11;
        int actionMasked = motionEvent.getActionMasked();
        RectF rectF = this.f34185r;
        rectF.setEmpty();
        b();
        boolean zContains = rectF.contains(motionEvent.getX(), motionEvent.getY());
        if (actionMasked != 0) {
            if (actionMasked != 1) {
                if (actionMasked == 2) {
                    boolean z12 = this.f34179j;
                    if (z12) {
                        if (!zContains && z12) {
                            this.f34179j = false;
                            refreshDrawableState();
                        }
                        z11 = true;
                    }
                }
                z11 = false;
            } else {
                if (this.f34179j) {
                    playSoundEffect(0);
                    z11 = true;
                }
                if (this.f34179j) {
                    this.f34179j = false;
                    refreshDrawableState();
                }
            }
            z11 = false;
            if (this.f34179j) {
            }
        } else {
            if (zContains) {
                if (!this.f34179j) {
                    this.f34179j = true;
                    refreshDrawableState();
                }
                z11 = true;
            }
            z11 = false;
        }
        return z11 || super.onTouchEvent(motionEvent);
    }

    @Override // android.view.View
    public final void setBackground(Drawable drawable) {
        Drawable drawable2 = this.f34175f;
        if (drawable2 == null) {
            drawable2 = this.f34174e;
        }
        if (drawable == drawable2 || drawable == this.f34176g) {
            super.setBackground(drawable);
        } else {
            Log.w("Chip", "Do not set the background; Chip manages its own background drawable.");
        }
    }

    @Override // android.view.View
    public final void setBackgroundColor(int i5) {
        Log.w("Chip", "Do not set the background color; Chip manages its own background drawable.");
    }

    @Override // r.n, android.view.View
    public final void setBackgroundDrawable(Drawable drawable) {
        Drawable drawable2 = this.f34175f;
        if (drawable2 == null) {
            drawable2 = this.f34174e;
        }
        if (drawable == drawable2 || drawable == this.f34176g) {
            super.setBackgroundDrawable(drawable);
        } else {
            Log.w("Chip", "Do not set the background drawable; Chip manages its own background drawable.");
        }
    }

    @Override // r.n, android.view.View
    public final void setBackgroundResource(int i5) {
        Log.w("Chip", "Do not set the background resource; Chip manages its own background drawable.");
    }

    @Override // android.view.View
    public final void setBackgroundTintList(ColorStateList colorStateList) {
        Log.w("Chip", "Do not set the background tint list; Chip manages its own background drawable.");
    }

    @Override // android.view.View
    public final void setBackgroundTintMode(PorterDuff.Mode mode) {
        Log.w("Chip", "Do not set the background tint mode; Chip manages its own background drawable.");
    }

    @Override // android.widget.CompoundButton, android.widget.Checkable
    public final void setChecked(boolean z11) {
        d dVar = this.f34174e;
        if (dVar == null) {
            this.f34178i = z11;
        } else if (dVar.Q) {
            super.setChecked(z11);
        }
    }

    @Override // r.n, android.widget.TextView
    public final void setCompoundDrawables(Drawable drawable, Drawable drawable2, Drawable drawable3, Drawable drawable4) {
        if (drawable != null) {
            throw new UnsupportedOperationException("Please set start drawable using R.attr#chipIcon.");
        }
        if (drawable3 != null) {
            throw new UnsupportedOperationException("Please set end drawable using R.attr#closeIcon.");
        }
        super.setCompoundDrawables(drawable, drawable2, drawable3, drawable4);
    }

    @Override // r.n, android.widget.TextView
    public final void setCompoundDrawablesRelative(Drawable drawable, Drawable drawable2, Drawable drawable3, Drawable drawable4) {
        if (drawable != null) {
            throw new UnsupportedOperationException("Please set start drawable using R.attr#chipIcon.");
        }
        if (drawable3 != null) {
            throw new UnsupportedOperationException("Please set end drawable using R.attr#closeIcon.");
        }
        super.setCompoundDrawablesRelative(drawable, drawable2, drawable3, drawable4);
    }

    @Override // android.widget.TextView
    public final void setCompoundDrawablesRelativeWithIntrinsicBounds(int i5, int i11, int i12, int i13) {
        if (i5 != 0) {
            throw new UnsupportedOperationException("Please set start drawable using R.attr#chipIcon.");
        }
        if (i12 != 0) {
            throw new UnsupportedOperationException("Please set end drawable using R.attr#closeIcon.");
        }
        super.setCompoundDrawablesRelativeWithIntrinsicBounds(i5, i11, i12, i13);
    }

    @Override // android.widget.TextView
    public final void setCompoundDrawablesWithIntrinsicBounds(int i5, int i11, int i12, int i13) {
        if (i5 != 0) {
            throw new UnsupportedOperationException("Please set start drawable using R.attr#chipIcon.");
        }
        if (i12 != 0) {
            throw new UnsupportedOperationException("Please set end drawable using R.attr#closeIcon.");
        }
        super.setCompoundDrawablesWithIntrinsicBounds(i5, i11, i12, i13);
    }

    @Override // android.view.View
    public final void setElevation(float f11) {
        super.setElevation(f11);
        d dVar = this.f34174e;
        if (dVar != null) {
            dVar.k(f11);
        }
    }

    @Override // android.widget.TextView
    public final void setEllipsize(TextUtils.TruncateAt truncateAt) {
        if (this.f34174e == null) {
            return;
        }
        if (truncateAt == TextUtils.TruncateAt.MARQUEE) {
            throw new UnsupportedOperationException("Text within a chip are not allowed to scroll.");
        }
        super.setEllipsize(truncateAt);
        d dVar = this.f34174e;
        if (dVar != null) {
            dVar.f74982z0 = truncateAt;
        }
    }

    @Override // android.widget.TextView
    public final void setGravity(int i5) {
        if (i5 != 8388627) {
            Log.w("Chip", "Chip text must be vertically center and start aligned");
        } else {
            super.setGravity(i5);
        }
    }

    @Override // android.view.View
    public final void setLayoutDirection(int i5) {
        if (this.f34174e == null) {
            return;
        }
        super.setLayoutDirection(i5);
    }

    @Override // android.widget.TextView
    public final void setLines(int i5) {
        if (i5 > 1) {
            throw new UnsupportedOperationException("Chip does not support multi-line text");
        }
        super.setLines(i5);
    }

    @Override // android.widget.TextView
    public final void setMaxLines(int i5) {
        if (i5 > 1) {
            throw new UnsupportedOperationException("Chip does not support multi-line text");
        }
        super.setMaxLines(i5);
    }

    @Override // android.widget.TextView
    public final void setMaxWidth(int i5) {
        super.setMaxWidth(i5);
        d dVar = this.f34174e;
        if (dVar != null) {
            dVar.B0 = i5;
        }
    }

    @Override // android.widget.TextView
    public final void setMinLines(int i5) {
        if (i5 > 1) {
            throw new UnsupportedOperationException("Chip does not support multi-line text");
        }
        super.setMinLines(i5);
    }

    @Override // android.widget.CompoundButton
    public final void setOnCheckedChangeListener(CompoundButton.OnCheckedChangeListener onCheckedChangeListener) {
        this.f34177h = onCheckedChangeListener;
    }

    @Override // android.widget.TextView
    public final void setSingleLine(boolean z11) {
        if (!z11) {
            throw new UnsupportedOperationException("Chip does not support multi-line text");
        }
        super.setSingleLine(z11);
    }

    @Override // android.widget.TextView
    public final void setText(CharSequence charSequence, TextView.BufferType bufferType) {
        d dVar = this.f34174e;
        if (dVar == null) {
            return;
        }
        if (charSequence == null) {
            charSequence = b.f42142b;
        }
        super.setText(dVar.A0 ? null : charSequence, bufferType);
        d dVar2 = this.f34174e;
        if (dVar2 == null || TextUtils.equals(dVar2.F, charSequence)) {
            return;
        }
        dVar2.F = charSequence;
        dVar2.f74963i0.f89391d = true;
        dVar2.invalidateSelf();
        dVar2.x();
    }

    @Override // android.widget.TextView
    public final void setTextAppearance(Context context, int i5) {
        super.setTextAppearance(context, i5);
        d dVar = this.f34174e;
        if (dVar != null) {
            dVar.C(new yj.c(dVar.f74957c0, i5));
        }
        f();
    }

    @Override // android.widget.TextView
    public final void setTextSize(int i5, float f11) {
        super.setTextSize(i5, f11);
        d dVar = this.f34174e;
        if (dVar != null) {
            float fApplyDimension = TypedValue.applyDimension(i5, f11, getResources().getDisplayMetrics());
            g gVar = dVar.f74963i0;
            yj.c cVar = gVar.f89393f;
            if (cVar != null) {
                cVar.f97363k = fApplyDimension;
                gVar.f89388a.setTextSize(fApplyDimension);
                dVar.x();
                dVar.invalidateSelf();
            }
        }
        f();
    }

    @Override // android.widget.TextView
    public final void setCompoundDrawablesRelativeWithIntrinsicBounds(Drawable drawable, Drawable drawable2, Drawable drawable3, Drawable drawable4) {
        if (drawable != null) {
            throw new UnsupportedOperationException("Please set start drawable using R.attr#chipIcon.");
        }
        if (drawable3 == null) {
            super.setCompoundDrawablesRelativeWithIntrinsicBounds(drawable, drawable2, drawable3, drawable4);
            return;
        }
        throw new UnsupportedOperationException("Please set end drawable using R.attr#closeIcon.");
    }

    @Override // android.widget.TextView
    public final void setCompoundDrawablesWithIntrinsicBounds(Drawable drawable, Drawable drawable2, Drawable drawable3, Drawable drawable4) {
        if (drawable != null) {
            throw new UnsupportedOperationException("Please set left drawable using R.attr#chipIcon.");
        }
        if (drawable3 == null) {
            super.setCompoundDrawablesWithIntrinsicBounds(drawable, drawable2, drawable3, drawable4);
            return;
        }
        throw new UnsupportedOperationException("Please set right drawable using R.attr#closeIcon.");
    }

    @Override // android.widget.TextView
    public final void setTextAppearance(int i5) {
        super.setTextAppearance(i5);
        d dVar = this.f34174e;
        if (dVar != null) {
            dVar.C(new yj.c(dVar.f74957c0, i5));
        }
        f();
    }
}
