package lj;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Outline;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PointF;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffColorFilter;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.RippleDrawable;
import android.graphics.drawable.ShapeDrawable;
import android.graphics.drawable.shapes.OvalShape;
import android.text.TextPaint;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.util.TypedValue;
import bk.g;
import bk.j;
import bk.l;
import com.google.android.material.chip.Chip;
import java.lang.ref.WeakReference;
import java.util.Arrays;
import tj.f;

/* loaded from: classes3.dex */
public final class d extends g implements Drawable.Callback, f {
    public static final int[] D0 = {16842910};
    public static final ShapeDrawable E0 = new ShapeDrawable(new OvalShape());
    public float A;
    public boolean A0;
    public float B;
    public int B0;
    public ColorStateList C;
    public boolean C0;
    public float D;
    public ColorStateList E;
    public CharSequence F;
    public boolean G;
    public Drawable H;
    public ColorStateList I;
    public float J;
    public boolean K;
    public boolean L;
    public Drawable M;
    public RippleDrawable N;
    public ColorStateList O;
    public float P;
    public boolean Q;
    public boolean R;
    public Drawable S;
    public ColorStateList T;
    public float U;
    public float V;
    public float W;
    public float X;
    public float Y;
    public float Z;

    /* renamed from: a0, reason: collision with root package name */
    public float f74955a0;

    /* renamed from: b0, reason: collision with root package name */
    public float f74956b0;

    /* renamed from: c0, reason: collision with root package name */
    public final Context f74957c0;

    /* renamed from: d0, reason: collision with root package name */
    public final Paint f74958d0;

    /* renamed from: e0, reason: collision with root package name */
    public final Paint.FontMetrics f74959e0;

    /* renamed from: f0, reason: collision with root package name */
    public final RectF f74960f0;

    /* renamed from: g0, reason: collision with root package name */
    public final PointF f74961g0;

    /* renamed from: h0, reason: collision with root package name */
    public final Path f74962h0;

    /* renamed from: i0, reason: collision with root package name */
    public final tj.g f74963i0;

    /* renamed from: j0, reason: collision with root package name */
    public int f74964j0;

    /* renamed from: k0, reason: collision with root package name */
    public int f74965k0;

    /* renamed from: l0, reason: collision with root package name */
    public int f74966l0;

    /* renamed from: m0, reason: collision with root package name */
    public int f74967m0;

    /* renamed from: n0, reason: collision with root package name */
    public int f74968n0;

    /* renamed from: o0, reason: collision with root package name */
    public int f74969o0;

    /* renamed from: p0, reason: collision with root package name */
    public boolean f74970p0;

    /* renamed from: q0, reason: collision with root package name */
    public int f74971q0;

    /* renamed from: r0, reason: collision with root package name */
    public int f74972r0;

    /* renamed from: s0, reason: collision with root package name */
    public ColorFilter f74973s0;

    /* renamed from: t0, reason: collision with root package name */
    public PorterDuffColorFilter f74974t0;

    /* renamed from: u0, reason: collision with root package name */
    public ColorStateList f74975u0;

    /* renamed from: v0, reason: collision with root package name */
    public PorterDuff.Mode f74976v0;

    /* renamed from: w0, reason: collision with root package name */
    public int[] f74977w0;

    /* renamed from: x0, reason: collision with root package name */
    public ColorStateList f74978x0;

    /* renamed from: y, reason: collision with root package name */
    public ColorStateList f74979y;

    /* renamed from: y0, reason: collision with root package name */
    public WeakReference f74980y0;

    /* renamed from: z, reason: collision with root package name */
    public ColorStateList f74981z;

    /* renamed from: z0, reason: collision with root package name */
    public TextUtils.TruncateAt f74982z0;

    public d(Context context, AttributeSet attributeSet) {
        super(context, attributeSet, 2130968893, 2132083972);
        this.B = -1.0f;
        this.f74958d0 = new Paint(1);
        this.f74959e0 = new Paint.FontMetrics();
        this.f74960f0 = new RectF();
        this.f74961g0 = new PointF();
        this.f74962h0 = new Path();
        this.f74972r0 = 255;
        this.f74976v0 = PorterDuff.Mode.SRC_IN;
        this.f74980y0 = new WeakReference(null);
        j(context);
        this.f74957c0 = context;
        tj.g gVar = new tj.g(this);
        this.f74963i0 = gVar;
        this.F = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        gVar.f89388a.density = context.getResources().getDisplayMetrics().density;
        int[] iArr = D0;
        setState(iArr);
        if (!Arrays.equals(this.f74977w0, iArr)) {
            this.f74977w0 = iArr;
            if (F()) {
                y(getState(), iArr);
            }
        }
        this.A0 = true;
        int[] iArr2 = zj.a.f98535a;
        E0.setTint(-1);
    }

    public static void G(Drawable drawable) {
        if (drawable != null) {
            drawable.setCallback(null);
        }
    }

    public static boolean v(ColorStateList colorStateList) {
        return colorStateList != null && colorStateList.isStateful();
    }

    public static boolean w(Drawable drawable) {
        return drawable != null && drawable.isStateful();
    }

    public final void A(boolean z11) {
        if (this.G != z11) {
            boolean zE = E();
            this.G = z11;
            boolean zE2 = E();
            if (zE != zE2) {
                if (zE2) {
                    q(this.H);
                } else {
                    G(this.H);
                }
                invalidateSelf();
                x();
            }
        }
    }

    public final void B(boolean z11) {
        if (this.L != z11) {
            boolean zF = F();
            this.L = z11;
            boolean zF2 = F();
            if (zF != zF2) {
                if (zF2) {
                    q(this.M);
                } else {
                    G(this.M);
                }
                invalidateSelf();
                x();
            }
        }
    }

    public final void C(yj.c cVar) {
        tj.g gVar = this.f74963i0;
        a aVar = gVar.f89389b;
        TextPaint textPaint = gVar.f89388a;
        if (gVar.f89393f != cVar) {
            gVar.f89393f = cVar;
            Context context = this.f74957c0;
            cVar.f(context, textPaint, aVar);
            f fVar = (f) gVar.f89392e.get();
            if (fVar != null) {
                textPaint.drawableState = fVar.getState();
            }
            cVar.e(context, textPaint, aVar);
            gVar.f89391d = true;
            f fVar2 = (f) gVar.f89392e.get();
            if (fVar2 != null) {
                d dVar = (d) fVar2;
                dVar.x();
                dVar.invalidateSelf();
                dVar.onStateChange(fVar2.getState());
            }
        }
    }

    public final boolean D() {
        return this.R && this.S != null && this.f74970p0;
    }

    public final boolean E() {
        return this.G && this.H != null;
    }

    public final boolean F() {
        return this.L && this.M != null;
    }

    @Override // bk.g, android.graphics.drawable.Drawable
    public final void draw(Canvas canvas) {
        int i5;
        Canvas canvas2;
        int iSaveLayerAlpha;
        int i11;
        Rect bounds = getBounds();
        if (bounds.isEmpty() || (i5 = this.f74972r0) == 0) {
            return;
        }
        if (i5 < 255) {
            canvas2 = canvas;
            iSaveLayerAlpha = canvas2.saveLayerAlpha(bounds.left, bounds.top, bounds.right, bounds.bottom, i5);
        } else {
            canvas2 = canvas;
            iSaveLayerAlpha = 0;
        }
        boolean z11 = this.C0;
        Paint paint = this.f74958d0;
        RectF rectF = this.f74960f0;
        if (!z11) {
            paint.setColor(this.f74964j0);
            paint.setStyle(Paint.Style.FILL);
            rectF.set(bounds);
            canvas2.drawRoundRect(rectF, u(), u(), paint);
        }
        if (!this.C0) {
            paint.setColor(this.f74965k0);
            paint.setStyle(Paint.Style.FILL);
            ColorFilter colorFilter = this.f74973s0;
            if (colorFilter == null) {
                colorFilter = this.f74974t0;
            }
            paint.setColorFilter(colorFilter);
            rectF.set(bounds);
            canvas2.drawRoundRect(rectF, u(), u(), paint);
        }
        if (this.C0) {
            super.draw(canvas);
        }
        if (this.D > 0.0f && !this.C0) {
            paint.setColor(this.f74967m0);
            paint.setStyle(Paint.Style.STROKE);
            if (!this.C0) {
                ColorFilter colorFilter2 = this.f74973s0;
                if (colorFilter2 == null) {
                    colorFilter2 = this.f74974t0;
                }
                paint.setColorFilter(colorFilter2);
            }
            float f11 = bounds.left;
            float f12 = this.D / 2.0f;
            rectF.set(f11 + f12, bounds.top + f12, bounds.right - f12, bounds.bottom - f12);
            float f13 = this.B - (this.D / 2.0f);
            canvas2.drawRoundRect(rectF, f13, f13, paint);
        }
        paint.setColor(this.f74968n0);
        paint.setStyle(Paint.Style.FILL);
        rectF.set(bounds);
        if (this.C0) {
            RectF rectF2 = new RectF(bounds);
            bk.f fVar = this.f17980a;
            j jVar = fVar.f17964a;
            float f14 = fVar.f17972i;
            a5.d dVar = this.f17994q;
            l lVar = this.f17995r;
            Path path = this.f74962h0;
            lVar.b(jVar, f14, rectF2, dVar, path);
            e(canvas2, paint, path, this.f17980a.f17964a, g());
        } else {
            canvas2.drawRoundRect(rectF, u(), u(), paint);
        }
        if (E()) {
            r(bounds, rectF);
            float f15 = rectF.left;
            float f16 = rectF.top;
            canvas2.translate(f15, f16);
            this.H.setBounds(0, 0, (int) rectF.width(), (int) rectF.height());
            this.H.draw(canvas2);
            canvas2.translate(-f15, -f16);
        }
        if (D()) {
            r(bounds, rectF);
            float f17 = rectF.left;
            float f18 = rectF.top;
            canvas2.translate(f17, f18);
            this.S.setBounds(0, 0, (int) rectF.width(), (int) rectF.height());
            this.S.draw(canvas2);
            canvas2.translate(-f17, -f18);
        }
        if (this.A0 && this.F != null) {
            PointF pointF = this.f74961g0;
            pointF.set(0.0f, 0.0f);
            Paint.Align align = Paint.Align.LEFT;
            CharSequence charSequence = this.F;
            tj.g gVar = this.f74963i0;
            if (charSequence != null) {
                float fS = s() + this.U + this.X;
                if (getLayoutDirection() == 0) {
                    pointF.x = bounds.left + fS;
                } else {
                    pointF.x = bounds.right - fS;
                    align = Paint.Align.RIGHT;
                }
                float fCenterY = bounds.centerY();
                TextPaint textPaint = gVar.f89388a;
                Paint.FontMetrics fontMetrics = this.f74959e0;
                textPaint.getFontMetrics(fontMetrics);
                pointF.y = fCenterY - ((fontMetrics.descent + fontMetrics.ascent) / 2.0f);
            }
            rectF.setEmpty();
            if (this.F != null) {
                float fS2 = s() + this.U + this.X;
                float fT = t() + this.f74956b0 + this.Y;
                if (getLayoutDirection() == 0) {
                    rectF.left = bounds.left + fS2;
                    rectF.right = bounds.right - fT;
                } else {
                    rectF.left = bounds.left + fT;
                    rectF.right = bounds.right - fS2;
                }
                rectF.top = bounds.top;
                rectF.bottom = bounds.bottom;
            }
            yj.c cVar = gVar.f89393f;
            TextPaint textPaint2 = gVar.f89388a;
            if (cVar != null) {
                textPaint2.drawableState = getState();
                gVar.f89393f.e(this.f74957c0, textPaint2, gVar.f89389b);
            }
            textPaint2.setTextAlign(align);
            boolean z12 = Math.round(gVar.a(this.F.toString())) > Math.round(rectF.width());
            if (z12) {
                int iSave = canvas2.save();
                canvas2.clipRect(rectF);
                i11 = iSave;
            } else {
                i11 = 0;
            }
            CharSequence charSequenceEllipsize = this.F;
            if (z12 && this.f74982z0 != null) {
                charSequenceEllipsize = TextUtils.ellipsize(charSequenceEllipsize, textPaint2, rectF.width(), this.f74982z0);
            }
            canvas.drawText(charSequenceEllipsize, 0, charSequenceEllipsize.length(), pointF.x, pointF.y, textPaint2);
            canvas2 = canvas;
            if (z12) {
                canvas2.restoreToCount(i11);
            }
        }
        if (F()) {
            rectF.setEmpty();
            if (F()) {
                float f19 = this.f74956b0 + this.f74955a0;
                if (getLayoutDirection() == 0) {
                    float f21 = bounds.right - f19;
                    rectF.right = f21;
                    rectF.left = f21 - this.P;
                } else {
                    float f22 = bounds.left + f19;
                    rectF.left = f22;
                    rectF.right = f22 + this.P;
                }
                float fExactCenterY = bounds.exactCenterY();
                float f23 = this.P;
                float f24 = fExactCenterY - (f23 / 2.0f);
                rectF.top = f24;
                rectF.bottom = f24 + f23;
            }
            float f25 = rectF.left;
            float f26 = rectF.top;
            canvas2.translate(f25, f26);
            this.M.setBounds(0, 0, (int) rectF.width(), (int) rectF.height());
            int[] iArr = zj.a.f98535a;
            this.N.setBounds(this.M.getBounds());
            this.N.jumpToCurrentState();
            this.N.draw(canvas2);
            canvas2.translate(-f25, -f26);
        }
        if (this.f74972r0 < 255) {
            canvas2.restoreToCount(iSaveLayerAlpha);
        }
    }

    @Override // bk.g, android.graphics.drawable.Drawable
    public final int getAlpha() {
        return this.f74972r0;
    }

    @Override // android.graphics.drawable.Drawable
    public final ColorFilter getColorFilter() {
        return this.f74973s0;
    }

    @Override // android.graphics.drawable.Drawable
    public final int getIntrinsicHeight() {
        return (int) this.A;
    }

    @Override // android.graphics.drawable.Drawable
    public final int getIntrinsicWidth() {
        return Math.min(Math.round(t() + this.f74963i0.a(this.F.toString()) + s() + this.U + this.X + this.Y + this.f74956b0), this.B0);
    }

    @Override // bk.g, android.graphics.drawable.Drawable
    public final int getOpacity() {
        return -3;
    }

    @Override // bk.g, android.graphics.drawable.Drawable
    public final void getOutline(Outline outline) {
        Outline outline2;
        if (this.C0) {
            super.getOutline(outline);
            return;
        }
        Rect bounds = getBounds();
        if (bounds.isEmpty()) {
            outline2 = outline;
            outline2.setRoundRect(0, 0, getIntrinsicWidth(), (int) this.A, this.B);
        } else {
            outline.setRoundRect(bounds, this.B);
            outline2 = outline;
        }
        outline2.setAlpha(this.f74972r0 / 255.0f);
    }

    @Override // android.graphics.drawable.Drawable.Callback
    public final void invalidateDrawable(Drawable drawable) {
        Drawable.Callback callback = getCallback();
        if (callback != null) {
            callback.invalidateDrawable(this);
        }
    }

    @Override // bk.g, android.graphics.drawable.Drawable
    public final boolean isStateful() {
        ColorStateList colorStateList;
        if (v(this.f74979y) || v(this.f74981z) || v(this.C)) {
            return true;
        }
        yj.c cVar = this.f74963i0.f89393f;
        if (cVar == null || (colorStateList = cVar.f97362j) == null || !colorStateList.isStateful()) {
            return (this.R && this.S != null && this.Q) || w(this.H) || w(this.S) || v(this.f74975u0);
        }
        return true;
    }

    @Override // android.graphics.drawable.Drawable
    public final boolean onLayoutDirectionChanged(int i5) {
        boolean zOnLayoutDirectionChanged = super.onLayoutDirectionChanged(i5);
        if (E()) {
            zOnLayoutDirectionChanged |= this.H.setLayoutDirection(i5);
        }
        if (D()) {
            zOnLayoutDirectionChanged |= this.S.setLayoutDirection(i5);
        }
        if (F()) {
            zOnLayoutDirectionChanged |= this.M.setLayoutDirection(i5);
        }
        if (!zOnLayoutDirectionChanged) {
            return true;
        }
        invalidateSelf();
        return true;
    }

    @Override // android.graphics.drawable.Drawable
    public final boolean onLevelChange(int i5) {
        boolean zOnLevelChange = super.onLevelChange(i5);
        if (E()) {
            zOnLevelChange |= this.H.setLevel(i5);
        }
        if (D()) {
            zOnLevelChange |= this.S.setLevel(i5);
        }
        if (F()) {
            zOnLevelChange |= this.M.setLevel(i5);
        }
        if (zOnLevelChange) {
            invalidateSelf();
        }
        return zOnLevelChange;
    }

    @Override // bk.g, android.graphics.drawable.Drawable
    public final boolean onStateChange(int[] iArr) {
        if (this.C0) {
            super.onStateChange(iArr);
        }
        return y(iArr, this.f74977w0);
    }

    public final void q(Drawable drawable) {
        if (drawable == null) {
            return;
        }
        drawable.setCallback(this);
        drawable.setLayoutDirection(getLayoutDirection());
        drawable.setLevel(getLevel());
        drawable.setVisible(isVisible(), false);
        if (drawable == this.M) {
            if (drawable.isStateful()) {
                drawable.setState(this.f74977w0);
            }
            drawable.setTintList(this.O);
            return;
        }
        Drawable drawable2 = this.H;
        if (drawable == drawable2 && this.K) {
            drawable2.setTintList(this.I);
        }
        if (drawable.isStateful()) {
            drawable.setState(getState());
        }
    }

    public final void r(Rect rect, RectF rectF) {
        rectF.setEmpty();
        if (E() || D()) {
            float f11 = this.U + this.V;
            Drawable drawable = this.f74970p0 ? this.S : this.H;
            float intrinsicWidth = this.J;
            if (intrinsicWidth <= 0.0f && drawable != null) {
                intrinsicWidth = drawable.getIntrinsicWidth();
            }
            if (getLayoutDirection() == 0) {
                float f12 = rect.left + f11;
                rectF.left = f12;
                rectF.right = f12 + intrinsicWidth;
            } else {
                float f13 = rect.right - f11;
                rectF.right = f13;
                rectF.left = f13 - intrinsicWidth;
            }
            Drawable drawable2 = this.f74970p0 ? this.S : this.H;
            float fCeil = this.J;
            if (fCeil <= 0.0f && drawable2 != null) {
                fCeil = (float) Math.ceil(TypedValue.applyDimension(1, 24, this.f74957c0.getResources().getDisplayMetrics()));
                if (drawable2.getIntrinsicHeight() <= fCeil) {
                    fCeil = drawable2.getIntrinsicHeight();
                }
            }
            float fExactCenterY = rect.exactCenterY() - (fCeil / 2.0f);
            rectF.top = fExactCenterY;
            rectF.bottom = fExactCenterY + fCeil;
        }
    }

    public final float s() {
        if (!E() && !D()) {
            return 0.0f;
        }
        float f11 = this.V;
        Drawable drawable = this.f74970p0 ? this.S : this.H;
        float intrinsicWidth = this.J;
        if (intrinsicWidth <= 0.0f && drawable != null) {
            intrinsicWidth = drawable.getIntrinsicWidth();
        }
        return intrinsicWidth + f11 + this.W;
    }

    @Override // android.graphics.drawable.Drawable.Callback
    public final void scheduleDrawable(Drawable drawable, Runnable runnable, long j11) {
        Drawable.Callback callback = getCallback();
        if (callback != null) {
            callback.scheduleDrawable(this, runnable, j11);
        }
    }

    @Override // bk.g, android.graphics.drawable.Drawable
    public final void setAlpha(int i5) {
        if (this.f74972r0 != i5) {
            this.f74972r0 = i5;
            invalidateSelf();
        }
    }

    @Override // bk.g, android.graphics.drawable.Drawable
    public final void setColorFilter(ColorFilter colorFilter) {
        if (this.f74973s0 != colorFilter) {
            this.f74973s0 = colorFilter;
            invalidateSelf();
        }
    }

    @Override // bk.g, android.graphics.drawable.Drawable
    public final void setTintList(ColorStateList colorStateList) {
        if (this.f74975u0 != colorStateList) {
            this.f74975u0 = colorStateList;
            onStateChange(getState());
        }
    }

    @Override // bk.g, android.graphics.drawable.Drawable
    public final void setTintMode(PorterDuff.Mode mode) {
        if (this.f74976v0 != mode) {
            this.f74976v0 = mode;
            ColorStateList colorStateList = this.f74975u0;
            this.f74974t0 = (colorStateList == null || mode == null) ? null : new PorterDuffColorFilter(colorStateList.getColorForState(getState(), 0), mode);
            invalidateSelf();
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final boolean setVisible(boolean z11, boolean z12) {
        boolean visible = super.setVisible(z11, z12);
        if (E()) {
            visible |= this.H.setVisible(z11, z12);
        }
        if (D()) {
            visible |= this.S.setVisible(z11, z12);
        }
        if (F()) {
            visible |= this.M.setVisible(z11, z12);
        }
        if (visible) {
            invalidateSelf();
        }
        return visible;
    }

    public final float t() {
        if (F()) {
            return this.Z + this.P + this.f74955a0;
        }
        return 0.0f;
    }

    public final float u() {
        return this.C0 ? h() : this.B;
    }

    @Override // android.graphics.drawable.Drawable.Callback
    public final void unscheduleDrawable(Drawable drawable, Runnable runnable) {
        Drawable.Callback callback = getCallback();
        if (callback != null) {
            callback.unscheduleDrawable(this, runnable);
        }
    }

    public final void x() {
        c cVar = (c) this.f74980y0.get();
        if (cVar != null) {
            Chip chip = (Chip) cVar;
            chip.a(chip.o);
            chip.requestLayout();
            chip.invalidateOutline();
        }
    }

    public final boolean y(int[] iArr, int[] iArr2) {
        boolean z11;
        boolean z12;
        ColorStateList colorStateList;
        boolean zOnStateChange = super.onStateChange(iArr);
        ColorStateList colorStateList2 = this.f74979y;
        int iB = b(colorStateList2 != null ? colorStateList2.getColorForState(iArr, this.f74964j0) : 0);
        boolean state = true;
        if (this.f74964j0 != iB) {
            this.f74964j0 = iB;
            zOnStateChange = true;
        }
        ColorStateList colorStateList3 = this.f74981z;
        int iB2 = b(colorStateList3 != null ? colorStateList3.getColorForState(iArr, this.f74965k0) : 0);
        if (this.f74965k0 != iB2) {
            this.f74965k0 = iB2;
            zOnStateChange = true;
        }
        int iJ = r4.a.j(iB2, iB);
        if ((this.f74966l0 != iJ) | (this.f17980a.f17966c == null)) {
            this.f74966l0 = iJ;
            l(ColorStateList.valueOf(iJ));
            zOnStateChange = true;
        }
        ColorStateList colorStateList4 = this.C;
        int colorForState = colorStateList4 != null ? colorStateList4.getColorForState(iArr, this.f74967m0) : 0;
        if (this.f74967m0 != colorForState) {
            this.f74967m0 = colorForState;
            zOnStateChange = true;
        }
        int colorForState2 = (this.f74978x0 == null || !zj.a.b(iArr)) ? 0 : this.f74978x0.getColorForState(iArr, this.f74968n0);
        if (this.f74968n0 != colorForState2) {
            this.f74968n0 = colorForState2;
        }
        yj.c cVar = this.f74963i0.f89393f;
        int colorForState3 = (cVar == null || (colorStateList = cVar.f97362j) == null) ? 0 : colorStateList.getColorForState(iArr, this.f74969o0);
        if (this.f74969o0 != colorForState3) {
            this.f74969o0 = colorForState3;
            zOnStateChange = true;
        }
        int[] state2 = getState();
        if (state2 == null) {
            z11 = false;
        } else {
            int length = state2.length;
            int i5 = 0;
            while (true) {
                if (i5 >= length) {
                    break;
                }
                if (state2[i5] != 16842912) {
                    i5++;
                } else if (this.Q) {
                    z11 = true;
                }
            }
            z11 = false;
        }
        if (this.f74970p0 == z11 || this.S == null) {
            z12 = false;
        } else {
            float fS = s();
            this.f74970p0 = z11;
            if (fS != s()) {
                zOnStateChange = true;
                z12 = true;
            } else {
                z12 = false;
                zOnStateChange = true;
            }
        }
        ColorStateList colorStateList5 = this.f74975u0;
        int colorForState4 = colorStateList5 != null ? colorStateList5.getColorForState(iArr, this.f74971q0) : 0;
        if (this.f74971q0 != colorForState4) {
            this.f74971q0 = colorForState4;
            ColorStateList colorStateList6 = this.f74975u0;
            PorterDuff.Mode mode = this.f74976v0;
            this.f74974t0 = (colorStateList6 == null || mode == null) ? null : new PorterDuffColorFilter(colorStateList6.getColorForState(getState(), 0), mode);
        } else {
            state = zOnStateChange;
        }
        if (w(this.H)) {
            state |= this.H.setState(iArr);
        }
        if (w(this.S)) {
            state |= this.S.setState(iArr);
        }
        if (w(this.M)) {
            int[] iArr3 = new int[iArr.length + iArr2.length];
            System.arraycopy(iArr, 0, iArr3, 0, iArr.length);
            System.arraycopy(iArr2, 0, iArr3, iArr.length, iArr2.length);
            state |= this.M.setState(iArr3);
        }
        int[] iArr4 = zj.a.f98535a;
        if (w(this.N)) {
            state |= this.N.setState(iArr2);
        }
        if (state) {
            invalidateSelf();
        }
        if (z12) {
            x();
        }
        return state;
    }

    public final void z(boolean z11) {
        if (this.R != z11) {
            boolean zD = D();
            this.R = z11;
            boolean zD2 = D();
            if (zD != zD2) {
                if (zD2) {
                    q(this.S);
                } else {
                    G(this.S);
                }
                invalidateSelf();
                x();
            }
        }
    }
}
