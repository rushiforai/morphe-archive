package androidx.appcompat.widget;

import a5.a1;
import android.animation.ObjectAnimator;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.PorterDuff;
import android.graphics.Rect;
import android.graphics.Region;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.text.InputFilter;
import android.text.Layout;
import android.text.StaticLayout;
import android.text.TextPaint;
import android.text.TextUtils;
import android.text.method.TransformationMethod;
import android.util.AttributeSet;
import android.view.ActionMode;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.CompoundButton;
import cl.k0;
import r.c2;
import r.n0;
import r.p2;
import r.r;
import x7.u;

/* loaded from: classes2.dex */
public class SwitchCompat extends CompoundButton {
    public static final jz.b Q = new jz.b(2, Float.class, "thumbPos");
    public static final int[] R = {16842912};
    public int A;
    public int B;
    public int C;
    public int D;
    public int E;
    public int F;
    public int G;
    public final boolean H;
    public final TextPaint I;
    public final ColorStateList J;
    public StaticLayout K;
    public StaticLayout L;
    public final p.a M;
    public ObjectAnimator N;
    public r O;
    public final Rect P;

    /* renamed from: a, reason: collision with root package name */
    public final Drawable f13776a;

    /* renamed from: b, reason: collision with root package name */
    public final ColorStateList f13777b;

    /* renamed from: c, reason: collision with root package name */
    public final PorterDuff.Mode f13778c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f13779d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f13780e;

    /* renamed from: f, reason: collision with root package name */
    public final Drawable f13781f;

    /* renamed from: g, reason: collision with root package name */
    public final ColorStateList f13782g;

    /* renamed from: h, reason: collision with root package name */
    public final PorterDuff.Mode f13783h;

    /* renamed from: i, reason: collision with root package name */
    public final boolean f13784i;

    /* renamed from: j, reason: collision with root package name */
    public final boolean f13785j;

    /* renamed from: k, reason: collision with root package name */
    public final int f13786k;

    /* renamed from: l, reason: collision with root package name */
    public final int f13787l;

    /* renamed from: m, reason: collision with root package name */
    public final int f13788m;
    public final boolean n;
    public CharSequence o;

    /* renamed from: p, reason: collision with root package name */
    public CharSequence f13789p;

    /* renamed from: q, reason: collision with root package name */
    public CharSequence f13790q;

    /* renamed from: r, reason: collision with root package name */
    public CharSequence f13791r;

    /* renamed from: s, reason: collision with root package name */
    public final boolean f13792s;

    /* renamed from: t, reason: collision with root package name */
    public int f13793t;

    /* renamed from: u, reason: collision with root package name */
    public final int f13794u;

    /* renamed from: v, reason: collision with root package name */
    public float f13795v;

    /* renamed from: w, reason: collision with root package name */
    public float f13796w;

    /* renamed from: x, reason: collision with root package name */
    public final VelocityTracker f13797x;

    /* renamed from: y, reason: collision with root package name */
    public final int f13798y;

    /* renamed from: z, reason: collision with root package name */
    public float f13799z;

    public SwitchCompat(Context context, AttributeSet attributeSet) throws Resources.NotFoundException {
        int resourceId;
        super(context, attributeSet, 2130970086);
        this.f13777b = null;
        this.f13778c = null;
        this.f13779d = false;
        this.f13780e = false;
        this.f13782g = null;
        this.f13783h = null;
        this.f13784i = false;
        this.f13785j = false;
        this.f13797x = VelocityTracker.obtain();
        this.H = true;
        this.P = new Rect();
        c2.a(getContext(), this);
        TextPaint textPaint = new TextPaint(1);
        this.I = textPaint;
        textPaint.density = getResources().getDisplayMetrics().density;
        int[] iArr = l.a.f72907v;
        u uVarR = u.r(context, attributeSet, iArr, 2130970086);
        TypedArray typedArray = (TypedArray) uVarR.f95209b;
        a1.j(this, context, iArr, attributeSet, typedArray, 2130970086);
        Drawable drawableL = uVarR.l(2);
        this.f13776a = drawableL;
        if (drawableL != null) {
            drawableL.setCallback(this);
        }
        Drawable drawableL2 = uVarR.l(11);
        this.f13781f = drawableL2;
        if (drawableL2 != null) {
            drawableL2.setCallback(this);
        }
        f(typedArray.getText(0));
        e(typedArray.getText(1));
        this.f13792s = typedArray.getBoolean(3, true);
        this.f13786k = typedArray.getDimensionPixelSize(8, 0);
        this.f13787l = typedArray.getDimensionPixelSize(5, 0);
        this.f13788m = typedArray.getDimensionPixelSize(6, 0);
        this.n = typedArray.getBoolean(4, false);
        ColorStateList colorStateListK = uVarR.k(9);
        if (colorStateListK != null) {
            this.f13777b = colorStateListK;
            this.f13779d = true;
        }
        PorterDuff.Mode modeC = r.a1.c(typedArray.getInt(10, -1), null);
        if (modeC != null) {
            this.f13778c = modeC;
            this.f13780e = true;
        }
        boolean z11 = this.f13779d;
        if (z11 || this.f13780e) {
            boolean z12 = this.f13780e;
            Drawable drawable = this.f13776a;
            if (drawable != null && (z11 || z12)) {
                Drawable drawableMutate = drawable.mutate();
                this.f13776a = drawableMutate;
                if (z11) {
                    drawableMutate.setTintList(this.f13777b);
                }
                if (z12) {
                    this.f13776a.setTintMode(this.f13778c);
                }
                if (this.f13776a.isStateful()) {
                    this.f13776a.setState(getDrawableState());
                }
            }
        }
        ColorStateList colorStateListK2 = uVarR.k(12);
        if (colorStateListK2 != null) {
            this.f13782g = colorStateListK2;
            this.f13784i = true;
        }
        PorterDuff.Mode modeC2 = r.a1.c(typedArray.getInt(13, -1), null);
        if (modeC2 != null) {
            this.f13783h = modeC2;
            this.f13785j = true;
        }
        boolean z13 = this.f13784i;
        if (z13 || this.f13785j) {
            boolean z14 = this.f13785j;
            Drawable drawable2 = this.f13781f;
            if (drawable2 != null && (z13 || z14)) {
                Drawable drawableMutate2 = drawable2.mutate();
                this.f13781f = drawableMutate2;
                if (z13) {
                    drawableMutate2.setTintList(this.f13782g);
                }
                if (z14) {
                    this.f13781f.setTintMode(this.f13783h);
                }
                if (this.f13781f.isStateful()) {
                    this.f13781f.setState(getDrawableState());
                }
            }
        }
        int resourceId2 = typedArray.getResourceId(7, 0);
        if (resourceId2 != 0) {
            TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(resourceId2, l.a.f72908w);
            ColorStateList colorStateList = (!typedArrayObtainStyledAttributes.hasValue(3) || (resourceId = typedArrayObtainStyledAttributes.getResourceId(3, 0)) == 0 || (colorStateList = o4.a.b(context, resourceId)) == null) ? typedArrayObtainStyledAttributes.getColorStateList(3) : colorStateList;
            if (colorStateList != null) {
                this.J = colorStateList;
            } else {
                this.J = getTextColors();
            }
            int dimensionPixelSize = typedArrayObtainStyledAttributes.getDimensionPixelSize(0, 0);
            if (dimensionPixelSize != 0) {
                float f11 = dimensionPixelSize;
                if (f11 != textPaint.getTextSize()) {
                    textPaint.setTextSize(f11);
                    requestLayout();
                }
            }
            int i5 = typedArrayObtainStyledAttributes.getInt(1, -1);
            int i11 = typedArrayObtainStyledAttributes.getInt(2, -1);
            Typeface typeface = i5 != 1 ? i5 != 2 ? i5 != 3 ? null : Typeface.MONOSPACE : Typeface.SERIF : Typeface.SANS_SERIF;
            if (i11 > 0) {
                Typeface typefaceDefaultFromStyle = typeface == null ? Typeface.defaultFromStyle(i11) : Typeface.create(typeface, i11);
                d(typefaceDefaultFromStyle);
                int i12 = (~(typefaceDefaultFromStyle != null ? typefaceDefaultFromStyle.getStyle() : 0)) & i11;
                textPaint.setFakeBoldText((i12 & 1) != 0);
                textPaint.setTextSkewX((2 & i12) != 0 ? -0.25f : 0.0f);
            } else {
                textPaint.setFakeBoldText(false);
                textPaint.setTextSkewX(0.0f);
                d(typeface);
            }
            if (typedArrayObtainStyledAttributes.getBoolean(14, false)) {
                this.M = new p.a(getContext());
            } else {
                this.M = null;
            }
            f(this.o);
            e(this.f13790q);
            typedArrayObtainStyledAttributes.recycle();
        }
        new n0(this).d(attributeSet, 2130970086);
        uVarR.s();
        ViewConfiguration viewConfiguration = ViewConfiguration.get(context);
        this.f13794u = viewConfiguration.getScaledTouchSlop();
        this.f13798y = viewConfiguration.getScaledMinimumFlingVelocity();
        a().b(attributeSet, 2130970086);
        refreshDrawableState();
        setChecked(isChecked());
    }

    public final r a() {
        if (this.O == null) {
            this.O = new r(this);
        }
        return this.O;
    }

    public final int b() {
        boolean z11 = p2.f84838a;
        return (int) (((getLayoutDirection() == 1 ? 1.0f - this.f13799z : this.f13799z) * c()) + 0.5f);
    }

    public final int c() {
        Drawable drawable = this.f13781f;
        if (drawable == null) {
            return 0;
        }
        Rect rect = this.P;
        drawable.getPadding(rect);
        Drawable drawable2 = this.f13776a;
        Rect rectB = drawable2 != null ? r.a1.b(drawable2) : r.a1.f84668c;
        return ((((this.A - this.C) - rect.left) - rect.right) - rectB.left) - rectB.right;
    }

    public final void d(Typeface typeface) {
        TextPaint textPaint = this.I;
        if ((textPaint.getTypeface() == null || textPaint.getTypeface().equals(typeface)) && (textPaint.getTypeface() != null || typeface == null)) {
            return;
        }
        textPaint.setTypeface(typeface);
        requestLayout();
        invalidate();
    }

    @Override // android.view.View
    public final void draw(Canvas canvas) {
        int i5;
        int i11;
        int i12 = this.D;
        int i13 = this.E;
        int i14 = this.F;
        int i15 = this.G;
        int iB = b() + i12;
        Drawable drawable = this.f13776a;
        Rect rectB = drawable != null ? r.a1.b(drawable) : r.a1.f84668c;
        Rect rect = this.P;
        Drawable drawable2 = this.f13781f;
        if (drawable2 != null) {
            drawable2.getPadding(rect);
            int i16 = rect.left;
            iB += i16;
            if (rectB != null) {
                int i17 = rectB.left;
                if (i17 > i16) {
                    i12 += i17 - i16;
                }
                int i18 = rectB.top;
                int i19 = rect.top;
                i5 = i18 > i19 ? (i18 - i19) + i13 : i13;
                int i21 = rectB.right;
                int i22 = rect.right;
                if (i21 > i22) {
                    i14 -= i21 - i22;
                }
                int i23 = rectB.bottom;
                int i24 = rect.bottom;
                if (i23 > i24) {
                    i11 = i15 - (i23 - i24);
                }
                this.f13781f.setBounds(i12, i5, i14, i11);
            } else {
                i5 = i13;
            }
            i11 = i15;
            this.f13781f.setBounds(i12, i5, i14, i11);
        }
        Drawable drawable3 = this.f13776a;
        if (drawable3 != null) {
            drawable3.getPadding(rect);
            int i25 = iB - rect.left;
            int i26 = iB + this.C + rect.right;
            this.f13776a.setBounds(i25, i13, i26, i15);
            Drawable background = getBackground();
            if (background != null) {
                background.setHotspotBounds(i25, i13, i26, i15);
            }
        }
        super.draw(canvas);
    }

    @Override // android.widget.CompoundButton, android.widget.TextView, android.view.View
    public final void drawableHotspotChanged(float f11, float f12) {
        super.drawableHotspotChanged(f11, f12);
        Drawable drawable = this.f13776a;
        if (drawable != null) {
            drawable.setHotspot(f11, f12);
        }
        Drawable drawable2 = this.f13781f;
        if (drawable2 != null) {
            drawable2.setHotspot(f11, f12);
        }
    }

    @Override // android.widget.CompoundButton, android.widget.TextView, android.view.View
    public final void drawableStateChanged() {
        super.drawableStateChanged();
        int[] drawableState = getDrawableState();
        Drawable drawable = this.f13776a;
        boolean state = (drawable == null || !drawable.isStateful()) ? false : drawable.setState(drawableState);
        Drawable drawable2 = this.f13781f;
        if (drawable2 != null && drawable2.isStateful()) {
            state |= drawable2.setState(drawableState);
        }
        if (state) {
            invalidate();
        }
    }

    public final void e(CharSequence charSequence) {
        this.f13790q = charSequence;
        TransformationMethod transformationMethodV = ((k0) a().f84850b.f267b).V(this.M);
        if (transformationMethodV != null) {
            charSequence = transformationMethodV.getTransformation(charSequence, this);
        }
        this.f13791r = charSequence;
        this.L = null;
        if (this.f13792s) {
            ((k0) this.O.f84850b.f267b).G();
        }
    }

    public final void f(CharSequence charSequence) {
        this.o = charSequence;
        TransformationMethod transformationMethodV = ((k0) a().f84850b.f267b).V(this.M);
        if (transformationMethodV != null) {
            charSequence = transformationMethodV.getTransformation(charSequence, this);
        }
        this.f13789p = charSequence;
        this.K = null;
        if (this.f13792s) {
            ((k0) this.O.f84850b.f267b).G();
        }
    }

    @Override // android.widget.CompoundButton, android.widget.TextView
    public final int getCompoundPaddingLeft() {
        boolean z11 = p2.f84838a;
        if (getLayoutDirection() != 1) {
            return super.getCompoundPaddingLeft();
        }
        int compoundPaddingLeft = super.getCompoundPaddingLeft() + this.A;
        return !TextUtils.isEmpty(getText()) ? compoundPaddingLeft + this.f13788m : compoundPaddingLeft;
    }

    @Override // android.widget.CompoundButton, android.widget.TextView
    public final int getCompoundPaddingRight() {
        boolean z11 = p2.f84838a;
        if (getLayoutDirection() == 1) {
            return super.getCompoundPaddingRight();
        }
        int compoundPaddingRight = super.getCompoundPaddingRight() + this.A;
        return !TextUtils.isEmpty(getText()) ? compoundPaddingRight + this.f13788m : compoundPaddingRight;
    }

    @Override // android.widget.TextView
    public final ActionMode.Callback getCustomSelectionActionModeCallback() {
        return android.support.v4.media.session.b.p0(super.getCustomSelectionActionModeCallback());
    }

    @Override // android.widget.CompoundButton, android.widget.TextView, android.view.View
    public final void jumpDrawablesToCurrentState() {
        super.jumpDrawablesToCurrentState();
        Drawable drawable = this.f13776a;
        if (drawable != null) {
            drawable.jumpToCurrentState();
        }
        Drawable drawable2 = this.f13781f;
        if (drawable2 != null) {
            drawable2.jumpToCurrentState();
        }
        ObjectAnimator objectAnimator = this.N;
        if (objectAnimator == null || !objectAnimator.isStarted()) {
            return;
        }
        this.N.end();
        this.N = null;
    }

    @Override // android.widget.CompoundButton, android.widget.TextView, android.view.View
    public final int[] onCreateDrawableState(int i5) {
        int[] iArrOnCreateDrawableState = super.onCreateDrawableState(i5 + 1);
        if (isChecked()) {
            View.mergeDrawableStates(iArrOnCreateDrawableState, R);
        }
        return iArrOnCreateDrawableState;
    }

    @Override // android.widget.CompoundButton, android.widget.TextView, android.view.View
    public final void onDraw(Canvas canvas) {
        int width;
        super.onDraw(canvas);
        Rect rect = this.P;
        Drawable drawable = this.f13781f;
        if (drawable != null) {
            drawable.getPadding(rect);
        } else {
            rect.setEmpty();
        }
        int i5 = this.E;
        int i11 = this.G;
        int i12 = i5 + rect.top;
        int i13 = i11 - rect.bottom;
        Drawable drawable2 = this.f13776a;
        if (drawable != null) {
            if (!this.n || drawable2 == null) {
                drawable.draw(canvas);
            } else {
                Rect rectB = r.a1.b(drawable2);
                drawable2.copyBounds(rect);
                rect.left += rectB.left;
                rect.right -= rectB.right;
                int iSave = canvas.save();
                canvas.clipRect(rect, Region.Op.DIFFERENCE);
                drawable.draw(canvas);
                canvas.restoreToCount(iSave);
            }
        }
        int iSave2 = canvas.save();
        if (drawable2 != null) {
            drawable2.draw(canvas);
        }
        StaticLayout staticLayout = this.f13799z > 0.5f ? this.K : this.L;
        if (staticLayout != null) {
            int[] drawableState = getDrawableState();
            TextPaint textPaint = this.I;
            ColorStateList colorStateList = this.J;
            if (colorStateList != null) {
                textPaint.setColor(colorStateList.getColorForState(drawableState, 0));
            }
            textPaint.drawableState = drawableState;
            if (drawable2 != null) {
                Rect bounds = drawable2.getBounds();
                width = bounds.left + bounds.right;
            } else {
                width = getWidth();
            }
            canvas.translate((width / 2) - (staticLayout.getWidth() / 2), ((i12 + i13) / 2) - (staticLayout.getHeight() / 2));
            staticLayout.draw(canvas);
        }
        canvas.restoreToCount(iSave2);
    }

    @Override // android.view.View
    public final void onInitializeAccessibilityEvent(AccessibilityEvent accessibilityEvent) {
        super.onInitializeAccessibilityEvent(accessibilityEvent);
        accessibilityEvent.setClassName("android.widget.Switch");
    }

    @Override // android.view.View
    public final void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo accessibilityNodeInfo) {
        super.onInitializeAccessibilityNodeInfo(accessibilityNodeInfo);
        accessibilityNodeInfo.setClassName("android.widget.Switch");
        if (Build.VERSION.SDK_INT < 30) {
            CharSequence charSequence = isChecked() ? this.o : this.f13790q;
            if (TextUtils.isEmpty(charSequence)) {
                return;
            }
            CharSequence text = accessibilityNodeInfo.getText();
            if (TextUtils.isEmpty(text)) {
                accessibilityNodeInfo.setText(charSequence);
                return;
            }
            StringBuilder sb2 = new StringBuilder();
            sb2.append(text);
            sb2.append(' ');
            sb2.append(charSequence);
            accessibilityNodeInfo.setText(sb2);
        }
    }

    @Override // android.widget.TextView, android.view.View
    public final void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        int iMax;
        int width;
        int paddingLeft;
        int height;
        int paddingTop;
        super.onLayout(z11, i5, i11, i12, i13);
        int iMax2 = 0;
        Drawable drawable = this.f13776a;
        if (drawable != null) {
            Rect rect = this.P;
            Drawable drawable2 = this.f13781f;
            if (drawable2 != null) {
                drawable2.getPadding(rect);
            } else {
                rect.setEmpty();
            }
            Rect rectB = r.a1.b(drawable);
            iMax = Math.max(0, rectB.left - rect.left);
            iMax2 = Math.max(0, rectB.right - rect.right);
        } else {
            iMax = 0;
        }
        boolean z12 = p2.f84838a;
        if (getLayoutDirection() == 1) {
            paddingLeft = getPaddingLeft() + iMax;
            width = ((this.A + paddingLeft) - iMax) - iMax2;
        } else {
            width = (getWidth() - getPaddingRight()) - iMax2;
            paddingLeft = (width - this.A) + iMax + iMax2;
        }
        int gravity = getGravity() & 112;
        if (gravity == 16) {
            int height2 = ((getHeight() + getPaddingTop()) - getPaddingBottom()) / 2;
            int i14 = this.B;
            int i15 = height2 - (i14 / 2);
            height = i14 + i15;
            paddingTop = i15;
        } else if (gravity != 80) {
            paddingTop = getPaddingTop();
            height = this.B + paddingTop;
        } else {
            height = getHeight() - getPaddingBottom();
            paddingTop = height - this.B;
        }
        this.D = paddingLeft;
        this.E = paddingTop;
        this.G = height;
        this.F = width;
    }

    @Override // android.widget.TextView, android.view.View
    public final void onMeasure(int i5, int i11) {
        int intrinsicWidth;
        int intrinsicHeight;
        int intrinsicHeight2 = 0;
        boolean z11 = this.f13792s;
        if (z11) {
            StaticLayout staticLayout = this.K;
            TextPaint textPaint = this.I;
            if (staticLayout == null) {
                CharSequence charSequence = this.f13789p;
                this.K = new StaticLayout(charSequence, textPaint, charSequence != null ? (int) Math.ceil(Layout.getDesiredWidth(charSequence, textPaint)) : 0, Layout.Alignment.ALIGN_NORMAL, 1.0f, 0.0f, true);
            }
            if (this.L == null) {
                CharSequence charSequence2 = this.f13791r;
                this.L = new StaticLayout(charSequence2, textPaint, charSequence2 != null ? (int) Math.ceil(Layout.getDesiredWidth(charSequence2, textPaint)) : 0, Layout.Alignment.ALIGN_NORMAL, 1.0f, 0.0f, true);
            }
        }
        Rect rect = this.P;
        Drawable drawable = this.f13776a;
        if (drawable != null) {
            drawable.getPadding(rect);
            intrinsicWidth = (this.f13776a.getIntrinsicWidth() - rect.left) - rect.right;
            intrinsicHeight = this.f13776a.getIntrinsicHeight();
        } else {
            intrinsicWidth = 0;
            intrinsicHeight = 0;
        }
        this.C = Math.max(z11 ? (this.f13786k * 2) + Math.max(this.K.getWidth(), this.L.getWidth()) : 0, intrinsicWidth);
        Drawable drawable2 = this.f13781f;
        if (drawable2 != null) {
            drawable2.getPadding(rect);
            intrinsicHeight2 = this.f13781f.getIntrinsicHeight();
        } else {
            rect.setEmpty();
        }
        int iMax = rect.left;
        int iMax2 = rect.right;
        Drawable drawable3 = this.f13776a;
        if (drawable3 != null) {
            Rect rectB = r.a1.b(drawable3);
            iMax = Math.max(iMax, rectB.left);
            iMax2 = Math.max(iMax2, rectB.right);
        }
        boolean z12 = this.H;
        int iMax3 = this.f13787l;
        if (z12) {
            iMax3 = Math.max(iMax3, (this.C * 2) + iMax + iMax2);
        }
        int iMax4 = Math.max(intrinsicHeight2, intrinsicHeight);
        this.A = iMax3;
        this.B = iMax4;
        super.onMeasure(i5, i11);
        if (getMeasuredHeight() < iMax4) {
            setMeasuredDimension(getMeasuredWidthAndState(), iMax4);
        }
    }

    @Override // android.view.View
    public final void onPopulateAccessibilityEvent(AccessibilityEvent accessibilityEvent) {
        super.onPopulateAccessibilityEvent(accessibilityEvent);
        CharSequence charSequence = isChecked() ? this.o : this.f13790q;
        if (charSequence != null) {
            accessibilityEvent.getText().add(charSequence);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:40:0x0090  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x00cc  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x00ce  */
    @Override // android.widget.TextView, android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean onTouchEvent(MotionEvent motionEvent) throws Resources.NotFoundException {
        Drawable drawable;
        boolean z11;
        VelocityTracker velocityTracker = this.f13797x;
        velocityTracker.addMovement(motionEvent);
        int actionMasked = motionEvent.getActionMasked();
        int i5 = this.f13794u;
        if (actionMasked != 0) {
            if (actionMasked == 1) {
                if (this.f13793t == 2) {
                    this.f13793t = 0;
                    boolean z12 = motionEvent.getAction() == 1 && isEnabled();
                    boolean zIsChecked = isChecked();
                    if (z12) {
                        velocityTracker.computeCurrentVelocity(1000);
                        float xVelocity = velocityTracker.getXVelocity();
                        if (Math.abs(xVelocity) > this.f13798y) {
                            boolean z13 = p2.f84838a;
                            z11 = getLayoutDirection() != 1 ? xVelocity > 0.0f : xVelocity < 0.0f;
                        } else if (this.f13799z > 0.5f) {
                        }
                    } else {
                        z11 = zIsChecked;
                    }
                    if (z11 != zIsChecked) {
                        playSoundEffect(0);
                    }
                    setChecked(z11);
                    MotionEvent motionEventObtain = MotionEvent.obtain(motionEvent);
                    motionEventObtain.setAction(3);
                    super.onTouchEvent(motionEventObtain);
                    motionEventObtain.recycle();
                    super.onTouchEvent(motionEvent);
                    return true;
                }
                this.f13793t = 0;
                velocityTracker.clear();
            } else if (actionMasked == 2) {
                int i11 = this.f13793t;
                if (i11 == 1) {
                    float x11 = motionEvent.getX();
                    float y11 = motionEvent.getY();
                    float f11 = i5;
                    if (Math.abs(x11 - this.f13795v) > f11 || Math.abs(y11 - this.f13796w) > f11) {
                        this.f13793t = 2;
                        getParent().requestDisallowInterceptTouchEvent(true);
                        this.f13795v = x11;
                        this.f13796w = y11;
                        return true;
                    }
                } else if (i11 == 2) {
                    float x12 = motionEvent.getX();
                    int iC = c();
                    float f12 = x12 - this.f13795v;
                    float f13 = iC != 0 ? f12 / iC : f12 > 0.0f ? 1.0f : -1.0f;
                    boolean z14 = p2.f84838a;
                    if (getLayoutDirection() == 1) {
                        f13 = -f13;
                    }
                    float f14 = this.f13799z;
                    float f15 = f13 + f14;
                    float f16 = f15 >= 0.0f ? f15 > 1.0f ? 1.0f : f15 : 0.0f;
                    if (f16 != f14) {
                        this.f13795v = x12;
                        this.f13799z = f16;
                        invalidate();
                    }
                    return true;
                }
            } else if (actionMasked == 3) {
            }
        } else {
            float x13 = motionEvent.getX();
            float y12 = motionEvent.getY();
            if (isEnabled() && (drawable = this.f13776a) != null) {
                int iB = b();
                Rect rect = this.P;
                drawable.getPadding(rect);
                int i12 = this.E - i5;
                int i13 = (this.D + iB) - i5;
                int i14 = this.C + i13 + rect.left + rect.right + i5;
                int i15 = this.G + i5;
                if (x13 > i13 && x13 < i14 && y12 > i12 && y12 < i15) {
                    this.f13793t = 1;
                    this.f13795v = x13;
                    this.f13796w = y12;
                }
            }
        }
        return super.onTouchEvent(motionEvent);
    }

    @Override // android.widget.TextView
    public final void setAllCaps(boolean z11) {
        super.setAllCaps(z11);
        a().c(z11);
    }

    @Override // android.widget.CompoundButton, android.widget.Checkable
    public final void setChecked(boolean z11) throws Resources.NotFoundException {
        super.setChecked(z11);
        boolean zIsChecked = isChecked();
        if (zIsChecked) {
            if (Build.VERSION.SDK_INT >= 30) {
                CharSequence string = this.o;
                if (string == null) {
                    string = getResources().getString(2132017169);
                }
                a1.m(this, string);
            }
        } else if (Build.VERSION.SDK_INT >= 30) {
            CharSequence string2 = this.f13790q;
            if (string2 == null) {
                string2 = getResources().getString(2132017168);
            }
            a1.m(this, string2);
        }
        if (getWindowToken() == null || !isLaidOut()) {
            ObjectAnimator objectAnimator = this.N;
            if (objectAnimator != null) {
                objectAnimator.cancel();
            }
            this.f13799z = zIsChecked ? 1.0f : 0.0f;
            invalidate();
            return;
        }
        ObjectAnimator objectAnimatorOfFloat = ObjectAnimator.ofFloat(this, Q, zIsChecked ? 1.0f : 0.0f);
        this.N = objectAnimatorOfFloat;
        objectAnimatorOfFloat.setDuration(250L);
        this.N.setAutoCancel(true);
        this.N.start();
    }

    @Override // android.widget.TextView
    public final void setCustomSelectionActionModeCallback(ActionMode.Callback callback) {
        super.setCustomSelectionActionModeCallback(android.support.v4.media.session.b.q0(callback, this));
    }

    @Override // android.widget.TextView
    public final void setFilters(InputFilter[] inputFilterArr) {
        super.setFilters(a().a(inputFilterArr));
    }

    @Override // android.widget.CompoundButton, android.widget.Checkable
    public final void toggle() throws Resources.NotFoundException {
        setChecked(!isChecked());
    }

    @Override // android.widget.CompoundButton, android.widget.TextView, android.view.View
    public final boolean verifyDrawable(Drawable drawable) {
        return super.verifyDrawable(drawable) || drawable == this.f13776a || drawable == this.f13781f;
    }
}
