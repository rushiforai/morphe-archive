package l30;

import android.animation.ObjectAnimator;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Insets;
import android.graphics.PorterDuff;
import android.graphics.Rect;
import android.graphics.Region;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.text.Layout;
import android.text.StaticLayout;
import android.text.TextPaint;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.ViewConfiguration;
import android.widget.CompoundButton;
import android.widget.TextView;
import o9.u2;

/* loaded from: classes4.dex */
public abstract class k extends CompoundButton implements j {
    public static final int[] N = {16842912};
    public static final eb.b O = new eb.b("thumbPos", 3);
    public int A;
    public int B;
    public int C;
    public int D;
    public int E;
    public int F;
    public final TextPaint G;
    public final ColorStateList H;
    public StaticLayout I;
    public StaticLayout J;
    public final p.a K;
    public ObjectAnimator L;
    public final Rect M;

    /* renamed from: a, reason: collision with root package name */
    public Drawable f74641a;

    /* renamed from: b, reason: collision with root package name */
    public ColorStateList f74642b;

    /* renamed from: c, reason: collision with root package name */
    public PorterDuff.Mode f74643c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f74644d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f74645e;

    /* renamed from: f, reason: collision with root package name */
    public Drawable f74646f;

    /* renamed from: g, reason: collision with root package name */
    public ColorStateList f74647g;

    /* renamed from: h, reason: collision with root package name */
    public PorterDuff.Mode f74648h;

    /* renamed from: i, reason: collision with root package name */
    public boolean f74649i;

    /* renamed from: j, reason: collision with root package name */
    public boolean f74650j;

    /* renamed from: k, reason: collision with root package name */
    public final int f74651k;

    /* renamed from: l, reason: collision with root package name */
    public final int f74652l;

    /* renamed from: m, reason: collision with root package name */
    public final int f74653m;
    public final boolean n;
    public final CharSequence o;

    /* renamed from: p, reason: collision with root package name */
    public final CharSequence f74654p;

    /* renamed from: q, reason: collision with root package name */
    public final boolean f74655q;

    /* renamed from: r, reason: collision with root package name */
    public final boolean f74656r;

    /* renamed from: s, reason: collision with root package name */
    public int f74657s;

    /* renamed from: t, reason: collision with root package name */
    public final int f74658t;

    /* renamed from: u, reason: collision with root package name */
    public float f74659u;

    /* renamed from: v, reason: collision with root package name */
    public float f74660v;

    /* renamed from: w, reason: collision with root package name */
    public final VelocityTracker f74661w;

    /* renamed from: x, reason: collision with root package name */
    public final int f74662x;

    /* renamed from: y, reason: collision with root package name */
    public float f74663y;

    /* renamed from: z, reason: collision with root package name */
    public int f74664z;

    public k(Context context, AttributeSet attributeSet) throws Resources.NotFoundException {
        super(context, attributeSet, 16843839, 0);
        this.f74642b = null;
        this.f74643c = null;
        this.f74644d = false;
        this.f74645e = false;
        this.f74647g = null;
        this.f74648h = null;
        this.f74649i = false;
        this.f74650j = false;
        this.f74661w = VelocityTracker.obtain();
        this.M = new Rect();
        TextPaint textPaint = new TextPaint(1);
        this.G = textPaint;
        textPaint.density = getResources().getDisplayMetrics().density;
        int[] iArr = u2.E;
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, iArr, 16843839, 0);
        if (Build.VERSION.SDK_INT >= 29) {
            saveAttributeDataForStyleable(context, iArr, attributeSet, typedArrayObtainStyledAttributes, 16843839, 0);
        }
        Drawable drawable = typedArrayObtainStyledAttributes.getDrawable(3);
        this.f74641a = drawable;
        if (drawable != null) {
            drawable.setCallback(this);
        }
        Drawable drawable2 = typedArrayObtainStyledAttributes.getDrawable(5);
        this.f74646f = drawable2;
        if (drawable2 != null) {
            drawable2.setCallback(this);
        }
        this.o = typedArrayObtainStyledAttributes.getText(1);
        this.f74654p = typedArrayObtainStyledAttributes.getText(2);
        this.f74655q = typedArrayObtainStyledAttributes.getBoolean(12, true);
        this.f74651k = typedArrayObtainStyledAttributes.getDimensionPixelSize(8, 0);
        this.f74652l = typedArrayObtainStyledAttributes.getDimensionPixelSize(6, 0);
        this.f74653m = typedArrayObtainStyledAttributes.getDimensionPixelSize(7, 0);
        this.n = typedArrayObtainStyledAttributes.getBoolean(9, false);
        this.f74656r = true;
        ColorStateList colorStateList = typedArrayObtainStyledAttributes.getColorStateList(10);
        if (colorStateList != null) {
            this.f74642b = colorStateList;
            this.f74644d = true;
        }
        PorterDuff.Mode modeG = g(typedArrayObtainStyledAttributes.getInt(11, -1));
        if (this.f74643c != modeG) {
            this.f74643c = modeG;
            this.f74645e = true;
        }
        if (this.f74644d || this.f74645e) {
            a();
        }
        ColorStateList colorStateList2 = typedArrayObtainStyledAttributes.getColorStateList(13);
        if (colorStateList2 != null) {
            this.f74647g = colorStateList2;
            this.f74649i = true;
        }
        PorterDuff.Mode modeG2 = g(typedArrayObtainStyledAttributes.getInt(14, -1));
        if (this.f74648h != modeG2) {
            this.f74648h = modeG2;
            this.f74650j = true;
        }
        if (this.f74649i || this.f74650j) {
            b();
        }
        int resourceId = typedArrayObtainStyledAttributes.getResourceId(4, 0);
        if (resourceId != 0) {
            TypedArray typedArrayObtainStyledAttributes2 = context.obtainStyledAttributes(resourceId, l.a.f72908w);
            ColorStateList colorStateList3 = typedArrayObtainStyledAttributes2.getColorStateList(3);
            if (colorStateList3 != null) {
                this.H = colorStateList3;
            } else {
                this.H = getTextColors();
            }
            int dimensionPixelSize = typedArrayObtainStyledAttributes2.getDimensionPixelSize(0, 0);
            if (dimensionPixelSize != 0) {
                float f11 = dimensionPixelSize;
                if (f11 != textPaint.getTextSize()) {
                    textPaint.setTextSize(f11);
                    requestLayout();
                }
            }
            int i5 = typedArrayObtainStyledAttributes2.getInt(1, -1);
            int i11 = typedArrayObtainStyledAttributes2.getInt(2, -1);
            Typeface typeface = i5 != 1 ? i5 != 2 ? i5 != 3 ? null : Typeface.MONOSPACE : Typeface.SERIF : Typeface.SANS_SERIF;
            if (i11 > 0) {
                Typeface typefaceDefaultFromStyle = typeface == null ? Typeface.defaultFromStyle(i11) : Typeface.create(typeface, i11);
                if (textPaint.getTypeface() != typefaceDefaultFromStyle) {
                    textPaint.setTypeface(typefaceDefaultFromStyle);
                    requestLayout();
                    invalidate();
                }
                int i12 = (~(typefaceDefaultFromStyle != null ? typefaceDefaultFromStyle.getStyle() : 0)) & i11;
                textPaint.setFakeBoldText((i12 & 1) != 0);
                textPaint.setTextSkewX((i12 & 2) != 0 ? -0.25f : 0.0f);
            } else {
                textPaint.setFakeBoldText(false);
                textPaint.setTextSkewX(0.0f);
                if (textPaint.getTypeface() != typeface) {
                    textPaint.setTypeface(typeface);
                    requestLayout();
                    invalidate();
                }
            }
            if (typedArrayObtainStyledAttributes2.getBoolean(14, false)) {
                this.K = new p.a(getContext());
            } else {
                this.K = null;
            }
            typedArrayObtainStyledAttributes2.recycle();
        }
        typedArrayObtainStyledAttributes.recycle();
        ViewConfiguration viewConfiguration = ViewConfiguration.get(context);
        this.f74658t = viewConfiguration.getScaledTouchSlop();
        this.f74662x = viewConfiguration.getScaledMinimumFlingVelocity();
        refreshDrawableState();
        h(isChecked(), true);
        i(aa.p.b(getContext(), 2130968934));
    }

    public static PorterDuff.Mode g(int i5) {
        if (i5 == 3) {
            return PorterDuff.Mode.SRC_OVER;
        }
        if (i5 == 5) {
            return PorterDuff.Mode.SRC_IN;
        }
        if (i5 == 9) {
            return PorterDuff.Mode.SRC_ATOP;
        }
        switch (i5) {
            case 14:
                return PorterDuff.Mode.MULTIPLY;
            case 15:
                return PorterDuff.Mode.SCREEN;
            case 16:
                return PorterDuff.Mode.ADD;
            default:
                return null;
        }
    }

    public final void a() {
        Drawable drawable = this.f74641a;
        if (drawable != null) {
            if (this.f74644d || this.f74645e) {
                Drawable drawableMutate = drawable.mutate();
                this.f74641a = drawableMutate;
                if (this.f74644d) {
                    drawableMutate.setTintList(this.f74642b);
                }
                if (this.f74645e) {
                    this.f74641a.setTintMode(this.f74643c);
                }
                if (this.f74641a.isStateful()) {
                    this.f74641a.setState(getDrawableState());
                }
            }
        }
    }

    public final void b() {
        Drawable drawable = this.f74646f;
        if (drawable != null) {
            if (this.f74649i || this.f74650j) {
                Drawable drawableMutate = drawable.mutate();
                this.f74646f = drawableMutate;
                if (this.f74649i) {
                    drawableMutate.setTintList(this.f74647g);
                }
                if (this.f74650j) {
                    this.f74646f.setTintMode(this.f74648h);
                }
                if (this.f74646f.isStateful()) {
                    this.f74646f.setState(getDrawableState());
                }
            }
        }
    }

    public final int c() {
        Drawable drawable = this.f74646f;
        if (drawable == null) {
            return 0;
        }
        Rect rect = this.M;
        drawable.getPadding(rect);
        Drawable drawable2 = this.f74641a;
        Insets opticalInsets = drawable2 != null ? drawable2.getOpticalInsets() : Insets.NONE;
        return ((((this.f74664z - this.B) - rect.left) - rect.right) - opticalInsets.left) - opticalInsets.right;
    }

    public boolean d(float f11, float f12) {
        if (this.f74641a == null) {
            return false;
        }
        int iC = (int) (((e() ? 1.0f - this.f74663y : this.f74663y) * c()) + 0.5f);
        Drawable drawable = this.f74641a;
        Rect rect = this.M;
        drawable.getPadding(rect);
        int i5 = this.D;
        int i11 = this.f74658t;
        int i12 = i5 - i11;
        int i13 = (this.C + iC) - i11;
        return f11 > ((float) i13) && f11 < ((float) ((((this.B + i13) + rect.left) + rect.right) + i11)) && f12 > ((float) i12) && f12 < ((float) (this.F + i11));
    }

    @Override // android.view.View
    public final void draw(Canvas canvas) {
        int i5;
        int i11;
        int i12 = this.C;
        int i13 = this.D;
        int i14 = this.E;
        int i15 = this.F;
        int iC = ((int) (((e() ? 1.0f - this.f74663y : this.f74663y) * c()) + 0.5f)) + i12;
        Drawable drawable = this.f74641a;
        Insets opticalInsets = drawable != null ? drawable.getOpticalInsets() : Insets.NONE;
        Drawable drawable2 = this.f74646f;
        Rect rect = this.M;
        if (drawable2 != null) {
            drawable2.getPadding(rect);
            iC += rect.left;
            if (opticalInsets != Insets.NONE) {
                if (opticalInsets.left > rect.left) {
                    i12 += opticalInsets.left - rect.left;
                }
                i5 = opticalInsets.top > rect.top ? (opticalInsets.top - rect.top) + i13 : i13;
                if (opticalInsets.right > rect.right) {
                    i14 -= opticalInsets.right - rect.right;
                }
                if (opticalInsets.bottom > rect.bottom) {
                    i11 = i15 - (opticalInsets.bottom - rect.bottom);
                }
                this.f74646f.setBounds(i12, i5, i14, i11);
            } else {
                i5 = i13;
            }
            i11 = i15;
            this.f74646f.setBounds(i12, i5, i14, i11);
        }
        Drawable drawable3 = this.f74641a;
        if (drawable3 != null) {
            drawable3.getPadding(rect);
            int i16 = iC - rect.left;
            int i17 = iC + this.B + rect.right;
            this.f74641a.setBounds(i16, i13, i17, i15);
            Drawable background = getBackground();
            if (background != null && TextUtils.isEmpty(getText())) {
                background.setHotspotBounds(i16, i13, i17, i15);
            }
        }
        super.draw(canvas);
    }

    @Override // android.widget.CompoundButton, android.widget.TextView, android.view.View
    public final void drawableHotspotChanged(float f11, float f12) {
        super.drawableHotspotChanged(f11, f12);
        Drawable drawable = this.f74641a;
        if (drawable != null) {
            drawable.setHotspot(f11, f12);
        }
        Drawable drawable2 = this.f74646f;
        if (drawable2 != null) {
            drawable2.setHotspot(f11, f12);
        }
    }

    @Override // android.widget.CompoundButton, android.widget.TextView, android.view.View
    public final void drawableStateChanged() {
        super.drawableStateChanged();
        int[] drawableState = getDrawableState();
        Drawable drawable = this.f74641a;
        boolean state = (drawable == null || !drawable.isStateful()) ? false : drawable.setState(drawableState);
        Drawable drawable2 = this.f74646f;
        if (drawable2 != null && drawable2.isStateful()) {
            state |= drawable2.setState(drawableState);
        }
        if (state) {
            invalidate();
        }
    }

    public final boolean e() {
        return getLayoutDirection() == 1;
    }

    public final StaticLayout f(CharSequence charSequence) {
        p.a aVar = this.K;
        if (aVar != null) {
            charSequence = aVar.getTransformation(charSequence, this);
        }
        CharSequence charSequence2 = charSequence;
        int length = charSequence2.length();
        TextPaint textPaint = this.G;
        int iCeil = (int) Math.ceil(Layout.getDesiredWidth(charSequence2, 0, length, textPaint));
        return Build.VERSION.SDK_INT >= 28 ? StaticLayout.Builder.obtain(charSequence2, 0, charSequence2.length(), textPaint, iCeil).setUseLineSpacingFromFallbacks(this.f74656r).build() : new StaticLayout(charSequence2, textPaint, iCeil, Layout.Alignment.ALIGN_NORMAL, 1.0f, 0.0f, true);
    }

    @Override // android.widget.CompoundButton, android.widget.Button, android.widget.TextView, android.view.View
    public final CharSequence getAccessibilityClassName() {
        return k.class.getName();
    }

    @Override // android.widget.CompoundButton, android.widget.TextView
    public final int getCompoundPaddingLeft() {
        if (!e()) {
            return super.getCompoundPaddingLeft();
        }
        int compoundPaddingLeft = super.getCompoundPaddingLeft() + this.f74664z;
        return !TextUtils.isEmpty(getText()) ? compoundPaddingLeft + this.f74653m : compoundPaddingLeft;
    }

    @Override // android.widget.CompoundButton, android.widget.TextView
    public final int getCompoundPaddingRight() {
        if (e()) {
            return super.getCompoundPaddingRight();
        }
        int compoundPaddingRight = super.getCompoundPaddingRight() + this.f74664z;
        return !TextUtils.isEmpty(getText()) ? compoundPaddingRight + this.f74653m : compoundPaddingRight;
    }

    @Override // l30.j
    public final void h(boolean z11, boolean z12) {
        super.setChecked(z11);
        boolean zIsChecked = isChecked();
        if (isAttachedToWindow() && isLaidOut() && z12) {
            ObjectAnimator objectAnimatorOfFloat = ObjectAnimator.ofFloat(this, O, zIsChecked ? 1.0f : 0.0f);
            this.L = objectAnimatorOfFloat;
            objectAnimatorOfFloat.setDuration(250L);
            this.L.setAutoCancel(true);
            this.L.start();
            return;
        }
        ObjectAnimator objectAnimator = this.L;
        if (objectAnimator != null) {
            objectAnimator.cancel();
        }
        this.f74663y = zIsChecked ? 1.0f : 0.0f;
        invalidate();
    }

    public final void i(int i5) {
        this.f74648h = PorterDuff.Mode.SRC_IN;
        this.f74650j = true;
        b();
        this.f74643c = PorterDuff.Mode.MULTIPLY;
        this.f74645e = true;
        a();
        Context context = getContext();
        this.f74642b = new ColorStateList(new int[][]{new int[]{-16842910, 16842912}, new int[]{-16842910}, new int[]{16842912}, new int[0]}, new int[]{r4.a.n(i5, 128), r4.a.n(aa.p.b(context, 2130968987), 230), i5, aa.p.b(context, 2130968987)});
        this.f74644d = true;
        a();
        Context context2 = getContext();
        this.f74647g = new ColorStateList(new int[][]{new int[]{-16842910, 16842912}, new int[]{-16842910}, new int[]{16842912}, new int[0]}, new int[]{r4.a.n(i5, 25), r4.a.n(aa.p.b(context2, 16842800), 26), i5, aa.p.b(context2, 16842800)});
        this.f74649i = true;
        b();
        jumpDrawablesToCurrentState();
    }

    @Override // android.widget.CompoundButton, android.widget.TextView, android.view.View
    public final void jumpDrawablesToCurrentState() {
        super.jumpDrawablesToCurrentState();
        Drawable drawable = this.f74641a;
        if (drawable != null) {
            drawable.jumpToCurrentState();
        }
        Drawable drawable2 = this.f74646f;
        if (drawable2 != null) {
            drawable2.jumpToCurrentState();
        }
        ObjectAnimator objectAnimator = this.L;
        if (objectAnimator == null || !objectAnimator.isStarted()) {
            return;
        }
        this.L.end();
        this.L = null;
    }

    @Override // android.widget.CompoundButton, android.widget.TextView, android.view.View
    public final int[] onCreateDrawableState(int i5) {
        int[] iArrOnCreateDrawableState = super.onCreateDrawableState(i5 + 1);
        if (isChecked()) {
            View.mergeDrawableStates(iArrOnCreateDrawableState, N);
        }
        return iArrOnCreateDrawableState;
    }

    @Override // android.widget.CompoundButton, android.widget.TextView, android.view.View
    public void onDraw(Canvas canvas) {
        int width;
        super.onDraw(canvas);
        Drawable drawable = this.f74646f;
        Rect rect = this.M;
        if (drawable != null) {
            drawable.getPadding(rect);
        } else {
            rect.setEmpty();
        }
        int i5 = this.D;
        int i11 = this.F;
        int i12 = i5 + rect.top;
        int i13 = i11 - rect.bottom;
        Drawable drawable2 = this.f74641a;
        if (drawable != null) {
            if (!this.n || drawable2 == null) {
                drawable.draw(canvas);
            } else {
                Insets opticalInsets = drawable2.getOpticalInsets();
                drawable2.copyBounds(rect);
                rect.left = opticalInsets.left + rect.left;
                rect.right -= opticalInsets.right;
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
        StaticLayout staticLayout = this.f74663y > 0.5f ? this.I : this.J;
        if (staticLayout != null) {
            int[] drawableState = getDrawableState();
            TextPaint textPaint = this.G;
            ColorStateList colorStateList = this.H;
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

    @Override // android.widget.TextView, android.view.View
    public final void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        int iMax;
        int width;
        int paddingLeft;
        int height;
        int paddingTop;
        super.onLayout(z11, i5, i11, i12, i13);
        int iMax2 = 0;
        if (this.f74641a != null) {
            Drawable drawable = this.f74646f;
            Rect rect = this.M;
            if (drawable != null) {
                drawable.getPadding(rect);
            } else {
                rect.setEmpty();
            }
            Insets opticalInsets = this.f74641a.getOpticalInsets();
            iMax = Math.max(0, opticalInsets.left - rect.left);
            iMax2 = Math.max(0, opticalInsets.right - rect.right);
        } else {
            iMax = 0;
        }
        if (e()) {
            paddingLeft = getPaddingLeft() + iMax;
            width = ((this.f74664z + paddingLeft) - iMax) - iMax2;
        } else {
            width = (getWidth() - getPaddingRight()) - iMax2;
            paddingLeft = (width - this.f74664z) + iMax + iMax2;
        }
        int gravity = getGravity() & 112;
        if (gravity == 16) {
            int height2 = ((getHeight() + getPaddingTop()) - getPaddingBottom()) / 2;
            int i14 = this.A;
            int i15 = height2 - (i14 / 2);
            height = i14 + i15;
            paddingTop = i15;
        } else if (gravity != 80) {
            paddingTop = getPaddingTop();
            height = this.A + paddingTop;
        } else {
            height = getHeight() - getPaddingBottom();
            paddingTop = height - this.A;
        }
        this.C = paddingLeft;
        this.D = paddingTop;
        this.F = height;
        this.E = width;
    }

    @Override // android.widget.TextView, android.view.View
    public final void onMeasure(int i5, int i11) {
        int intrinsicWidth;
        int intrinsicHeight;
        int iMax;
        boolean z11 = this.f74655q;
        if (z11) {
            if (this.I == null) {
                this.I = f(this.o);
            }
            if (this.J == null) {
                this.J = f(this.f74654p);
            }
        }
        Drawable drawable = this.f74641a;
        int intrinsicHeight2 = 0;
        Rect rect = this.M;
        if (drawable != null) {
            drawable.getPadding(rect);
            intrinsicWidth = (this.f74641a.getIntrinsicWidth() - rect.left) - rect.right;
            intrinsicHeight = this.f74641a.getIntrinsicHeight();
        } else {
            intrinsicWidth = 0;
            intrinsicHeight = 0;
        }
        if (z11) {
            iMax = (this.f74651k * 2) + Math.max(this.I.getWidth(), this.J.getWidth());
        } else {
            iMax = 0;
        }
        this.B = Math.max(iMax, intrinsicWidth);
        Drawable drawable2 = this.f74646f;
        if (drawable2 != null) {
            drawable2.getPadding(rect);
            intrinsicHeight2 = this.f74646f.getIntrinsicHeight();
        } else {
            rect.setEmpty();
        }
        int iMax2 = rect.left;
        int iMax3 = rect.right;
        Drawable drawable3 = this.f74641a;
        if (drawable3 != null) {
            Insets opticalInsets = drawable3.getOpticalInsets();
            iMax2 = Math.max(iMax2, opticalInsets.left);
            iMax3 = Math.max(iMax3, opticalInsets.right);
        }
        int iMax4 = Math.max(this.f74652l, (this.B * 2) + iMax2 + iMax3);
        int iMax5 = Math.max(intrinsicHeight2, intrinsicHeight);
        this.f74664z = iMax4;
        this.A = iMax5;
        super.onMeasure(i5, i11);
        if (getMeasuredHeight() < iMax5) {
            setMeasuredDimension(getMeasuredWidthAndState(), iMax5);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:40:0x008e  */
    @Override // android.widget.TextView, android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public boolean onTouchEvent(MotionEvent motionEvent) {
        boolean z11;
        VelocityTracker velocityTracker = this.f74661w;
        velocityTracker.addMovement(motionEvent);
        int actionMasked = motionEvent.getActionMasked();
        if (actionMasked != 0) {
            if (actionMasked == 1) {
                if (this.f74657s == 2) {
                    this.f74657s = 0;
                    boolean z12 = motionEvent.getAction() == 1 && isEnabled();
                    boolean zIsChecked = isChecked();
                    if (z12) {
                        velocityTracker.computeCurrentVelocity(1000);
                        float xVelocity = velocityTracker.getXVelocity();
                        z11 = Math.abs(xVelocity) <= ((float) this.f74662x) ? this.f74663y > 0.5f : !(!e() ? xVelocity > 0.0f : xVelocity < 0.0f);
                    } else {
                        z11 = zIsChecked;
                    }
                    if (z11 != zIsChecked) {
                        playSoundEffect(0);
                    }
                    h(z11, true);
                    MotionEvent motionEventObtain = MotionEvent.obtain(motionEvent);
                    motionEventObtain.setAction(3);
                    super.onTouchEvent(motionEventObtain);
                    motionEventObtain.recycle();
                    super.onTouchEvent(motionEvent);
                    return true;
                }
                this.f74657s = 0;
                velocityTracker.clear();
            } else if (actionMasked == 2) {
                int i5 = this.f74657s;
                if (i5 == 1) {
                    float x11 = motionEvent.getX();
                    float y11 = motionEvent.getY();
                    float fAbs = Math.abs(x11 - this.f74659u);
                    float f11 = this.f74658t;
                    if (fAbs > f11 || Math.abs(y11 - this.f74660v) > f11) {
                        this.f74657s = 2;
                        getParent().requestDisallowInterceptTouchEvent(true);
                        this.f74659u = x11;
                        this.f74660v = y11;
                        return true;
                    }
                } else if (i5 == 2) {
                    float x12 = motionEvent.getX();
                    int iC = c();
                    float f12 = x12 - this.f74659u;
                    float f13 = iC != 0 ? f12 / iC : f12 > 0.0f ? 1.0f : -1.0f;
                    if (e()) {
                        f13 = -f13;
                    }
                    float f14 = this.f74663y;
                    float f15 = f13 + f14;
                    float f16 = f15 >= 0.0f ? f15 > 1.0f ? 1.0f : f15 : 0.0f;
                    if (f16 != f14) {
                        this.f74659u = x12;
                        this.f74663y = f16;
                        invalidate();
                    }
                    return true;
                }
            } else if (actionMasked == 3) {
            }
        } else {
            float x13 = motionEvent.getX();
            float y12 = motionEvent.getY();
            if (isEnabled() && d(x13, y12)) {
                this.f74657s = 1;
                this.f74659u = x13;
                this.f74660v = y12;
            }
        }
        return super.onTouchEvent(motionEvent);
    }

    @Override // android.widget.CompoundButton, android.widget.Checkable
    public final void setChecked(boolean z11) {
        h(z11, true);
    }

    @Override // android.widget.TextView
    public final void setText(CharSequence charSequence, TextView.BufferType bufferType) {
        super.setText(charSequence, bufferType);
        if (TextUtils.isEmpty(charSequence)) {
            setBackgroundResource(2131231244);
            return;
        }
        TypedArray typedArrayObtainStyledAttributes = getContext().obtainStyledAttributes(new int[]{2130969920});
        Drawable drawable = typedArrayObtainStyledAttributes.getDrawable(0);
        typedArrayObtainStyledAttributes.recycle();
        setBackground(drawable);
    }

    @Override // android.widget.CompoundButton, android.widget.Checkable
    public final void toggle() {
        h(!isChecked(), true);
    }

    @Override // android.widget.CompoundButton, android.widget.TextView, android.view.View
    public final boolean verifyDrawable(Drawable drawable) {
        return super.verifyDrawable(drawable) || drawable == this.f74641a || drawable == this.f74646f;
    }
}
