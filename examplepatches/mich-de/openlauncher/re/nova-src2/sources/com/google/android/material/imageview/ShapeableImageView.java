package com.google.android.material.imageview;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.RectF;
import android.util.AttributeSet;
import androidx.appcompat.widget.AppCompatImageView;
import bk.g;
import bk.j;
import bk.k;
import bk.l;
import bk.u;
import hk.a;
import ps.f0;

/* loaded from: classes3.dex */
public class ShapeableImageView extends AppCompatImageView implements u {

    /* renamed from: d, reason: collision with root package name */
    public final l f34296d;

    /* renamed from: e, reason: collision with root package name */
    public final RectF f34297e;

    /* renamed from: f, reason: collision with root package name */
    public final RectF f34298f;

    /* renamed from: g, reason: collision with root package name */
    public final Paint f34299g;

    /* renamed from: h, reason: collision with root package name */
    public final Paint f34300h;

    /* renamed from: i, reason: collision with root package name */
    public final Path f34301i;

    /* renamed from: j, reason: collision with root package name */
    public final ColorStateList f34302j;

    /* renamed from: k, reason: collision with root package name */
    public g f34303k;

    /* renamed from: l, reason: collision with root package name */
    public j f34304l;

    /* renamed from: m, reason: collision with root package name */
    public final float f34305m;
    public final Path n;
    public final int o;

    /* renamed from: p, reason: collision with root package name */
    public final int f34306p;

    /* renamed from: q, reason: collision with root package name */
    public final int f34307q;

    /* renamed from: r, reason: collision with root package name */
    public final int f34308r;

    /* renamed from: s, reason: collision with root package name */
    public final int f34309s;

    /* renamed from: t, reason: collision with root package name */
    public final int f34310t;

    /* renamed from: u, reason: collision with root package name */
    public boolean f34311u;

    public ShapeableImageView(Context context, AttributeSet attributeSet) {
        super(a.a(context, attributeSet, 0, 2132084027), attributeSet, 0);
        this.f34296d = k.f18015a;
        this.f34301i = new Path();
        this.f34311u = false;
        Context context2 = getContext();
        Paint paint = new Paint();
        this.f34300h = paint;
        paint.setAntiAlias(true);
        paint.setColor(-1);
        paint.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.DST_OUT));
        this.f34297e = new RectF();
        this.f34298f = new RectF();
        this.n = new Path();
        TypedArray typedArrayObtainStyledAttributes = context2.obtainStyledAttributes(attributeSet, bj.a.H, 0, 2132084027);
        setLayerType(2, null);
        this.f34302j = f0.m(context2, typedArrayObtainStyledAttributes, 9);
        this.f34305m = typedArrayObtainStyledAttributes.getDimensionPixelSize(10, 0);
        int dimensionPixelSize = typedArrayObtainStyledAttributes.getDimensionPixelSize(0, 0);
        this.o = dimensionPixelSize;
        this.f34306p = dimensionPixelSize;
        this.f34307q = dimensionPixelSize;
        this.f34308r = dimensionPixelSize;
        this.o = typedArrayObtainStyledAttributes.getDimensionPixelSize(3, dimensionPixelSize);
        this.f34306p = typedArrayObtainStyledAttributes.getDimensionPixelSize(6, dimensionPixelSize);
        this.f34307q = typedArrayObtainStyledAttributes.getDimensionPixelSize(4, dimensionPixelSize);
        this.f34308r = typedArrayObtainStyledAttributes.getDimensionPixelSize(1, dimensionPixelSize);
        this.f34309s = typedArrayObtainStyledAttributes.getDimensionPixelSize(5, Integer.MIN_VALUE);
        this.f34310t = typedArrayObtainStyledAttributes.getDimensionPixelSize(2, Integer.MIN_VALUE);
        typedArrayObtainStyledAttributes.recycle();
        Paint paint2 = new Paint();
        this.f34299g = paint2;
        paint2.setStyle(Paint.Style.STROKE);
        paint2.setAntiAlias(true);
        this.f34304l = j.c(context2, attributeSet, 0, 2132084027).a();
        setOutlineProvider(new sj.a(this));
    }

    @Override // bk.u
    public final void c(j jVar) {
        this.f34304l = jVar;
        g gVar = this.f34303k;
        if (gVar != null) {
            gVar.c(jVar);
        }
        g(getWidth(), getHeight());
        invalidate();
        invalidateOutline();
    }

    public final int d() {
        int i5 = this.f34310t;
        int i11 = this.f34309s;
        if (i11 != Integer.MIN_VALUE || i5 != Integer.MIN_VALUE) {
            if (f() && i5 != Integer.MIN_VALUE) {
                return i5;
            }
            if (!f() && i11 != Integer.MIN_VALUE) {
                return i11;
            }
        }
        return this.o;
    }

    public final int e() {
        int i5 = this.f34310t;
        int i11 = this.f34309s;
        if (i11 != Integer.MIN_VALUE || i5 != Integer.MIN_VALUE) {
            if (f() && i11 != Integer.MIN_VALUE) {
                return i11;
            }
            if (!f() && i5 != Integer.MIN_VALUE) {
                return i5;
            }
        }
        return this.f34307q;
    }

    public final boolean f() {
        return getLayoutDirection() == 1;
    }

    public final void g(int i5, int i11) {
        float paddingLeft = getPaddingLeft();
        float paddingTop = getPaddingTop();
        float paddingRight = i5 - getPaddingRight();
        float paddingBottom = i11 - getPaddingBottom();
        RectF rectF = this.f34297e;
        rectF.set(paddingLeft, paddingTop, paddingRight, paddingBottom);
        j jVar = this.f34304l;
        l lVar = this.f34296d;
        Path path = this.f34301i;
        lVar.b(jVar, 1.0f, rectF, null, path);
        Path path2 = this.n;
        path2.rewind();
        path2.addPath(path);
        RectF rectF2 = this.f34298f;
        rectF2.set(0.0f, 0.0f, i5, i11);
        path2.addRect(rectF2, Path.Direction.CCW);
    }

    @Override // android.view.View
    public final int getPaddingBottom() {
        return super.getPaddingBottom() - this.f34308r;
    }

    @Override // android.view.View
    public final int getPaddingEnd() {
        int paddingEnd = super.getPaddingEnd();
        int i5 = this.f34310t;
        if (i5 == Integer.MIN_VALUE) {
            i5 = f() ? this.o : this.f34307q;
        }
        return paddingEnd - i5;
    }

    @Override // android.view.View
    public final int getPaddingLeft() {
        return super.getPaddingLeft() - d();
    }

    @Override // android.view.View
    public final int getPaddingRight() {
        return super.getPaddingRight() - e();
    }

    @Override // android.view.View
    public final int getPaddingStart() {
        int paddingStart = super.getPaddingStart();
        int i5 = this.f34309s;
        if (i5 == Integer.MIN_VALUE) {
            i5 = f() ? this.f34307q : this.o;
        }
        return paddingStart - i5;
    }

    @Override // android.view.View
    public final int getPaddingTop() {
        return super.getPaddingTop() - this.f34306p;
    }

    @Override // android.widget.ImageView, android.view.View
    public final void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        canvas.drawPath(this.n, this.f34300h);
        ColorStateList colorStateList = this.f34302j;
        if (colorStateList == null) {
            return;
        }
        Paint paint = this.f34299g;
        float f11 = this.f34305m;
        paint.setStrokeWidth(f11);
        int colorForState = colorStateList.getColorForState(getDrawableState(), colorStateList.getDefaultColor());
        if (f11 <= 0.0f || colorForState == 0) {
            return;
        }
        paint.setColor(colorForState);
        canvas.drawPath(this.f34301i, paint);
    }

    @Override // android.widget.ImageView, android.view.View
    public final void onMeasure(int i5, int i11) {
        super.onMeasure(i5, i11);
        if (!this.f34311u && isLayoutDirectionResolved()) {
            this.f34311u = true;
            if (!isPaddingRelative() && this.f34309s == Integer.MIN_VALUE && this.f34310t == Integer.MIN_VALUE) {
                setPadding(super.getPaddingLeft(), super.getPaddingTop(), super.getPaddingRight(), super.getPaddingBottom());
            } else {
                setPaddingRelative(super.getPaddingStart(), super.getPaddingTop(), super.getPaddingEnd(), super.getPaddingBottom());
            }
        }
    }

    @Override // android.view.View
    public final void onSizeChanged(int i5, int i11, int i12, int i13) {
        super.onSizeChanged(i5, i11, i12, i13);
        g(i5, i11);
    }

    @Override // android.view.View
    public final void setPadding(int i5, int i11, int i12, int i13) {
        super.setPadding(d() + i5, i11 + this.f34306p, e() + i12, i13 + this.f34308r);
    }

    @Override // android.view.View
    public final void setPaddingRelative(int i5, int i11, int i12, int i13) {
        int i14 = this.o;
        int i15 = this.f34307q;
        int i16 = this.f34309s;
        if (i16 == Integer.MIN_VALUE) {
            i16 = f() ? i15 : i14;
        }
        int i17 = i16 + i5;
        int i18 = i11 + this.f34306p;
        int i19 = this.f34310t;
        if (i19 != Integer.MIN_VALUE) {
            i14 = i19;
        } else if (!f()) {
            i14 = i15;
        }
        super.setPaddingRelative(i17, i18, i14 + i12, i13 + this.f34308r);
    }
}
