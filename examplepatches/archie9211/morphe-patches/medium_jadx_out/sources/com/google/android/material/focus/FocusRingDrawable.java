package com.google.android.material.focus;

import android.R;
import android.animation.ObjectAnimator;
import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Outline;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.DrawableWrapper;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.graphics.drawable.ShapeDrawable;
import android.os.Build;
import android.util.AttributeSet;
import android.util.StateSet;
import android.util.TypedValue;
import android.view.animation.OvershootInterpolator;
import defpackage.cmb;
import defpackage.dk7;
import defpackage.l3b;
import defpackage.n3c;
import defpackage.no3;
import defpackage.p3c;
import defpackage.sgg;
import defpackage.ura;
import defpackage.v5;
import defpackage.wr4;
import defpackage.x;
import defpackage.xr4;
import java.io.IOException;
import java.lang.ref.WeakReference;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class FocusRingDrawable extends DrawableWrapper {
    public static final ColorDrawable p = new ColorDrawable(0);
    public static final int[] q = {R.attr.state_focused, R.attr.state_window_focused};
    public static final OvershootInterpolator r = new OvershootInterpolator(4.0f);
    public static final wr4 s = new wr4();
    public final Paint a;
    public final RectF b;
    public final Rect c;
    public final Path d;
    public final Path e;
    public final Matrix f;
    public final l3b g;
    public WeakReference h;
    public float i;
    public ObjectAnimator j;
    public float k;
    public boolean l;
    public boolean m;
    public boolean n;
    public xr4 o;

    public FocusRingDrawable(xr4 xr4Var, Resources resources) {
        super(null);
        Paint paint = new Paint(1);
        this.a = paint;
        this.b = new RectF();
        this.c = new Rect();
        this.d = new Path();
        this.e = new Path();
        this.f = new Matrix();
        this.g = l3b.h();
        this.i = -1.0f;
        this.k = 1.0f;
        this.m = false;
        this.n = false;
        xr4 xr4Var2 = new xr4(xr4Var);
        this.o = xr4Var2;
        Drawable.ConstantState constantState = xr4Var2.a;
        if (constantState != null) {
            setDrawable(resources != null ? constantState.newDrawable(resources) : constantState.newDrawable());
        }
        paint.setStyle(Paint.Style.STROKE);
        if (Float.isNaN(this.o.j)) {
            return;
        }
        paint.setStrokeWidth(this.o.j);
    }

    public static int c(TypedArray typedArray, int i) {
        if (typedArray.getType(i) != 2) {
            return Integer.MIN_VALUE;
        }
        TypedValue typedValue = new TypedValue();
        if (typedArray.getValue(i, typedValue)) {
            return typedValue.data;
        }
        return Integer.MIN_VALUE;
    }

    public static FocusRingDrawable e(Context context, RippleDrawable rippleDrawable) {
        if (Build.VERSION.SDK_INT < 24 || !sgg.V(context.getTheme(), com.medium.reader.R.attr.focusRingsEnabled, false)) {
            return null;
        }
        FocusRingDrawable focusRingDrawable = new FocusRingDrawable(context, p);
        rippleDrawable.addLayer(focusRingDrawable);
        focusRingDrawable.setCallback(rippleDrawable);
        return focusRingDrawable;
    }

    public static float f(float f, Resources.Theme theme, int i, TypedArray typedArray, int i2, int i3) {
        if (!Float.isNaN(f)) {
            return f;
        }
        Resources resources = theme.getResources();
        if (i != Float.MIN_VALUE) {
            TypedValue typedValue = new TypedValue();
            if (theme.resolveAttribute(i, typedValue, true)) {
                return typedValue.getDimension(resources.getDisplayMetrics());
            }
        }
        float dimension = typedArray.getDimension(i2, Float.NaN);
        if (!Float.isNaN(dimension)) {
            return dimension;
        }
        if (i3 == 0) {
            return Float.NaN;
        }
        return resources.getDimension(i3);
    }

    public final void a(RectF rectF) {
        Rect rect = this.o.w;
        if (rect != null) {
            rectF.set(rect);
            return;
        }
        WeakReference weakReference = this.h;
        if (weakReference != null && weakReference.get() != null) {
            rectF.set(((dk7) this.h.get()).getBounds());
            return;
        }
        if (!(getDrawable() instanceof RippleDrawable)) {
            rectF.set(getBounds());
            return;
        }
        RippleDrawable rippleDrawable = (RippleDrawable) getDrawable();
        Rect rect2 = this.c;
        rippleDrawable.getHotspotBounds(rect2);
        int radius = rippleDrawable.getRadius();
        if (radius > 0) {
            rect2.inset(Math.max(0, (rect2.width() / 2) - radius), Math.max(0, (rect2.height() / 2) - radius));
        }
        rectF.set(rect2);
    }

    @Override // android.graphics.drawable.DrawableWrapper, android.graphics.drawable.Drawable
    public final void applyTheme(Resources.Theme theme) {
        super.applyTheme(theme);
        d(theme);
    }

    public final void b(Canvas canvas, Path path, float f, float f2, int i) {
        RectF rectF = this.b;
        a(rectF);
        float f3 = f * 2.0f;
        float fWidth = 1.0f - (f3 / rectF.width());
        float fHeight = 1.0f - (f3 / rectF.height());
        Matrix matrix = this.f;
        matrix.reset();
        matrix.postScale(fWidth, fHeight, rectF.centerX(), rectF.centerY());
        Path path2 = this.d;
        path.transform(matrix, path2);
        float f4 = f2 * this.k;
        Paint paint = this.a;
        paint.setStrokeWidth(f4);
        paint.setColor(i);
        canvas.drawPath(path2, paint);
    }

    @Override // android.graphics.drawable.DrawableWrapper, android.graphics.drawable.Drawable
    public final boolean canApplyTheme() {
        return true;
    }

    /* JADX WARN: Removed duplicated region for block: B:27:0x005a  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x007c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void d(android.content.res.Resources.Theme r9) {
        /*
            Method dump skipped, instruction units count: 315
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.material.focus.FocusRingDrawable.d(android.content.res.Resources$Theme):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x0049  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x00b7  */
    @Override // android.graphics.drawable.DrawableWrapper, android.graphics.drawable.Drawable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void draw(android.graphics.Canvas r11) {
        /*
            Method dump skipped, instruction units count: 266
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.material.focus.FocusRingDrawable.draw(android.graphics.Canvas):void");
    }

    public final void g(n3c n3cVar) {
        RectF rectF = this.b;
        a(rectF);
        p3c p3cVarB = n3cVar.b(q);
        boolean zH = p3cVarB.h(rectF);
        Path path = this.e;
        if (!zH) {
            this.g.a(p3cVarB, null, 1.0f, rectF, null, path);
            this.i = -1.0f;
            return;
        }
        xr4 xr4Var = this.o;
        float f = ((xr4Var.j / 2.0f) * this.k) + xr4Var.p;
        rectF.inset(f, f);
        this.i = p3cVarB.e.a(rectF);
        path.reset();
    }

    @Override // android.graphics.drawable.DrawableWrapper, android.graphics.drawable.Drawable
    public final Drawable.ConstantState getConstantState() {
        xr4 xr4Var = this.o;
        if (xr4Var.a == null) {
            return null;
        }
        xr4Var.b = getChangingConfigurations();
        return this.o;
    }

    @Override // android.graphics.drawable.DrawableWrapper, android.graphics.drawable.Drawable
    public final boolean hasFocusStateSpecified() {
        try {
            if (super.hasFocusStateSpecified()) {
                return true;
            }
            return this.o.c;
        } catch (NoSuchMethodError unused) {
            return this.o.c;
        }
    }

    @Override // android.graphics.drawable.DrawableWrapper, android.graphics.drawable.Drawable
    public final void inflate(Resources resources, XmlPullParser xmlPullParser, AttributeSet attributeSet, Resources.Theme theme) throws XmlPullParserException, IOException {
        super.inflate(resources, xmlPullParser, attributeSet, theme);
        int[] iArr = ura.e;
        TypedArray typedArrayObtainStyledAttributes = theme != null ? theme.obtainStyledAttributes(attributeSet, iArr, 0, 0) : resources.obtainAttributes(attributeSet, iArr);
        this.o.d = c(typedArrayObtainStyledAttributes, 0);
        if (this.o.d == Integer.MIN_VALUE && typedArrayObtainStyledAttributes.hasValue(0)) {
            xr4 xr4Var = this.o;
            xr4Var.c = typedArrayObtainStyledAttributes.getBoolean(0, xr4Var.c);
            this.o.e = true;
        }
        this.o.g = c(typedArrayObtainStyledAttributes, 5);
        xr4 xr4Var2 = this.o;
        if (xr4Var2.g == Integer.MIN_VALUE) {
            xr4Var2.f = typedArrayObtainStyledAttributes.getColor(5, Integer.MIN_VALUE);
        }
        this.o.i = c(typedArrayObtainStyledAttributes, 1);
        xr4 xr4Var3 = this.o;
        if (xr4Var3.i == Integer.MIN_VALUE) {
            xr4Var3.h = typedArrayObtainStyledAttributes.getColor(1, Integer.MIN_VALUE);
        }
        this.o.k = c(typedArrayObtainStyledAttributes, 6);
        xr4 xr4Var4 = this.o;
        if (xr4Var4.k == Integer.MIN_VALUE) {
            xr4Var4.j = typedArrayObtainStyledAttributes.getDimension(6, Float.NaN);
        }
        this.o.m = c(typedArrayObtainStyledAttributes, 3);
        xr4 xr4Var5 = this.o;
        if (xr4Var5.m == Integer.MIN_VALUE) {
            xr4Var5.l = typedArrayObtainStyledAttributes.getDimension(3, Float.NaN);
        }
        this.o.m = c(typedArrayObtainStyledAttributes, 3);
        xr4 xr4Var6 = this.o;
        if (xr4Var6.m == Integer.MIN_VALUE) {
            xr4Var6.l = typedArrayObtainStyledAttributes.getDimension(3, Float.NaN);
        }
        this.o.o = c(typedArrayObtainStyledAttributes, 7);
        xr4 xr4Var7 = this.o;
        if (xr4Var7.o == Integer.MIN_VALUE) {
            xr4Var7.n = typedArrayObtainStyledAttributes.getDimension(7, Float.NaN);
        }
        this.o.q = c(typedArrayObtainStyledAttributes, 4);
        xr4 xr4Var8 = this.o;
        if (xr4Var8.q == Integer.MIN_VALUE) {
            xr4Var8.p = typedArrayObtainStyledAttributes.getDimension(4, Float.NaN);
        }
        this.o.s = c(typedArrayObtainStyledAttributes, 2);
        xr4 xr4Var9 = this.o;
        if (xr4Var9.s == Integer.MIN_VALUE) {
            xr4Var9.r = typedArrayObtainStyledAttributes.getDimension(2, Float.NaN);
        }
        this.o.v = c(typedArrayObtainStyledAttributes, 8);
        this.o.u = typedArrayObtainStyledAttributes.getType(8) == 1 ? typedArrayObtainStyledAttributes.getResourceId(8, Integer.MIN_VALUE) : Integer.MIN_VALUE;
        typedArrayObtainStyledAttributes.recycle();
        int depth = xmlPullParser.getDepth();
        Drawable drawableCreateFromXmlInner = null;
        while (true) {
            int next = xmlPullParser.next();
            if (next == 1 || (next == 3 && xmlPullParser.getDepth() <= depth)) {
                break;
            } else if (next == 2) {
                drawableCreateFromXmlInner = Drawable.createFromXmlInner(resources, xmlPullParser, attributeSet, theme);
            }
        }
        if (drawableCreateFromXmlInner != null) {
            setDrawable(drawableCreateFromXmlInner);
            this.o.a = drawableCreateFromXmlInner.getConstantState();
        } else {
            ColorDrawable colorDrawable = p;
            setDrawable(colorDrawable);
            this.o.a = colorDrawable.getConstantState();
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final boolean isProjected() {
        Drawable drawable = getDrawable();
        return drawable != null && drawable.isProjected();
    }

    @Override // android.graphics.drawable.DrawableWrapper, android.graphics.drawable.Drawable
    public final boolean isStateful() {
        return super.isStateful() || this.o.c;
    }

    @Override // android.graphics.drawable.DrawableWrapper, android.graphics.drawable.Drawable
    public final void jumpToCurrentState() {
        super.jumpToCurrentState();
        ObjectAnimator objectAnimator = this.j;
        if (objectAnimator != null) {
            objectAnimator.end();
            this.j = null;
        }
    }

    @Override // android.graphics.drawable.DrawableWrapper, android.graphics.drawable.Drawable
    public final Drawable mutate() {
        if (!this.n && super.mutate() == this) {
            this.o = new xr4(this.o);
            Drawable drawable = getDrawable();
            if (drawable != null) {
                this.o.a = drawable.getConstantState();
            }
            this.n = true;
        }
        return this;
    }

    @Override // android.graphics.drawable.DrawableWrapper, android.graphics.drawable.Drawable
    public final void onBoundsChange(Rect rect) {
        float[] cornerRadii;
        float cornerRadius;
        p3c p3cVar;
        super.onBoundsChange(rect);
        xr4 xr4Var = this.o;
        if (xr4Var.c) {
            n3c n3cVar = xr4Var.t;
            if (n3cVar != null) {
                g(n3cVar);
                return;
            }
            Drawable drawable = getDrawable();
            int i = 0;
            n3c n3cVar2 = null;
            if (drawable instanceof ShapeDrawable) {
                ShapeDrawable shapeDrawable = (ShapeDrawable) drawable;
                if (Build.VERSION.SDK_INT >= 24) {
                    Outline outline = new Outline();
                    shapeDrawable.getOutline(outline);
                    if (outline.getRadius() > 0.0f) {
                        cmb cmbVar = new cmb();
                        cmb cmbVar2 = new cmb();
                        cmb cmbVar3 = new cmb();
                        cmb cmbVar4 = new cmb();
                        no3 no3Var = new no3(i);
                        no3 no3Var2 = new no3(i);
                        no3 no3Var3 = new no3(i);
                        no3 no3Var4 = new no3(i);
                        float radius = outline.getRadius();
                        x xVar = new x(radius);
                        x xVar2 = new x(radius);
                        x xVar3 = new x(radius);
                        x xVar4 = new x(radius);
                        p3cVar = new p3c();
                        p3cVar.a = cmbVar;
                        p3cVar.b = cmbVar2;
                        p3cVar.c = cmbVar3;
                        p3cVar.d = cmbVar4;
                        p3cVar.e = xVar;
                        p3cVar.f = xVar2;
                        p3cVar.g = xVar3;
                        p3cVar.h = xVar4;
                        p3cVar.i = no3Var;
                        p3cVar.j = no3Var2;
                        p3cVar.k = no3Var3;
                        p3cVar.l = no3Var4;
                        n3cVar2 = p3cVar;
                    }
                }
            } else if (drawable instanceof GradientDrawable) {
                GradientDrawable gradientDrawable = (GradientDrawable) drawable;
                if (Build.VERSION.SDK_INT >= 24) {
                    try {
                        cornerRadii = gradientDrawable.getCornerRadii();
                    } catch (NullPointerException unused) {
                        cornerRadii = null;
                    }
                    if (cornerRadii != null) {
                        cmb cmbVar5 = new cmb();
                        cmb cmbVar6 = new cmb();
                        cmb cmbVar7 = new cmb();
                        cmb cmbVar8 = new cmb();
                        no3 no3Var5 = new no3(i);
                        no3 no3Var6 = new no3(i);
                        no3 no3Var7 = new no3(i);
                        no3 no3Var8 = new no3(i);
                        x xVar5 = new x(Math.min(cornerRadii[0], cornerRadii[1]));
                        x xVar6 = new x(Math.min(cornerRadii[2], cornerRadii[3]));
                        x xVar7 = new x(Math.min(cornerRadii[4], cornerRadii[5]));
                        x xVar8 = new x(Math.min(cornerRadii[6], cornerRadii[7]));
                        p3cVar = new p3c();
                        p3cVar.a = cmbVar5;
                        p3cVar.b = cmbVar6;
                        p3cVar.c = cmbVar7;
                        p3cVar.d = cmbVar8;
                        p3cVar.e = xVar5;
                        p3cVar.f = xVar6;
                        p3cVar.g = xVar7;
                        p3cVar.h = xVar8;
                        p3cVar.i = no3Var5;
                        p3cVar.j = no3Var6;
                        p3cVar.k = no3Var7;
                        p3cVar.l = no3Var8;
                        n3cVar2 = p3cVar;
                    } else {
                        try {
                            cornerRadius = gradientDrawable.getCornerRadius();
                        } catch (NullPointerException unused2) {
                            cornerRadius = -1.0f;
                        }
                        if (cornerRadius > 0.0f) {
                            cmb cmbVar9 = new cmb();
                            cmb cmbVar10 = new cmb();
                            cmb cmbVar11 = new cmb();
                            cmb cmbVar12 = new cmb();
                            no3 no3Var9 = new no3(i);
                            no3 no3Var10 = new no3(i);
                            no3 no3Var11 = new no3(i);
                            no3 no3Var12 = new no3(i);
                            x xVar9 = new x(cornerRadius);
                            x xVar10 = new x(cornerRadius);
                            x xVar11 = new x(cornerRadius);
                            x xVar12 = new x(cornerRadius);
                            p3c p3cVar2 = new p3c();
                            p3cVar2.a = cmbVar9;
                            p3cVar2.b = cmbVar10;
                            p3cVar2.c = cmbVar11;
                            p3cVar2.d = cmbVar12;
                            p3cVar2.e = xVar9;
                            p3cVar2.f = xVar10;
                            p3cVar2.g = xVar11;
                            p3cVar2.h = xVar12;
                            p3cVar2.i = no3Var9;
                            p3cVar2.j = no3Var10;
                            p3cVar2.k = no3Var11;
                            p3cVar2.l = no3Var12;
                            n3cVar2 = p3cVar2;
                        }
                    }
                }
            }
            if (n3cVar2 != null) {
                g(n3cVar2);
            } else {
                this.i = -1.0f;
                this.e.reset();
            }
        }
    }

    @Override // android.graphics.drawable.DrawableWrapper, android.graphics.drawable.Drawable
    public final boolean onStateChange(int[] iArr) {
        xr4 xr4Var = this.o;
        if (!xr4Var.c) {
            this.m = false;
            return super.onStateChange(iArr);
        }
        boolean zStateSetMatches = StateSet.stateSetMatches(xr4Var.x, iArr);
        boolean z = this.m != zStateSetMatches;
        this.m = zStateSetMatches;
        if (z && iArr.length > 0 && !this.l) {
            ObjectAnimator objectAnimator = this.j;
            if (objectAnimator != null) {
                objectAnimator.cancel();
                this.j = null;
            }
            if (!zStateSetMatches) {
                this.k = 1.0f;
            } else if (Build.VERSION.SDK_INT >= 24) {
                ObjectAnimator objectAnimatorOfFloat = ObjectAnimator.ofFloat(this, s, 0.0f, 1.0f);
                objectAnimatorOfFloat.setDuration(300L);
                objectAnimatorOfFloat.setInterpolator(r);
                objectAnimatorOfFloat.addListener(new v5(3, this));
                this.j = objectAnimatorOfFloat;
                objectAnimatorOfFloat.start();
            }
        }
        this.l = iArr.length == 0;
        return super.onStateChange(iArr) || z;
    }

    public FocusRingDrawable(Context context, Drawable drawable) {
        super(drawable);
        this.a = new Paint(1);
        this.b = new RectF();
        this.c = new Rect();
        this.d = new Path();
        this.e = new Path();
        this.f = new Matrix();
        this.g = l3b.h();
        this.i = -1.0f;
        this.k = 1.0f;
        this.m = false;
        this.n = false;
        xr4 xr4Var = new xr4(null);
        this.o = xr4Var;
        if (drawable != null) {
            xr4Var.a = drawable.getConstantState();
        }
        d(context.getTheme());
    }

    public FocusRingDrawable() {
        super(null);
        this.a = new Paint(1);
        this.b = new RectF();
        this.c = new Rect();
        this.d = new Path();
        this.e = new Path();
        this.f = new Matrix();
        this.g = l3b.h();
        this.i = -1.0f;
        this.k = 1.0f;
        this.m = false;
        this.n = false;
        this.o = new xr4(null);
    }

    @Override // android.graphics.drawable.Drawable
    public final void inflate(Resources resources, XmlPullParser xmlPullParser, AttributeSet attributeSet) throws XmlPullParserException, IOException {
        inflate(resources, xmlPullParser, attributeSet, null);
    }
}
