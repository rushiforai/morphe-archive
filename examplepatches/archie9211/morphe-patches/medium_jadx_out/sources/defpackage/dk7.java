package defpackage;

import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Matrix;
import android.graphics.Outline;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffColorFilter;
import android.graphics.PorterDuffXfermode;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Region;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.util.Log;
import j$.util.Objects;
import java.util.BitSet;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class dk7 extends Drawable implements v4c {
    public static final Paint E;
    public static final ck7[] F;
    public final tlc[] A;
    public float[] B;
    public float[] C;
    public f70 D;
    public final md5 a;
    public bk7 b;
    public final i4c[] c;
    public final i4c[] d;
    public final BitSet e;
    public boolean f;
    public boolean g;
    public final Matrix h;
    public final Path i;
    public final Path j;
    public final RectF k;
    public final RectF l;
    public final Region m;
    public final Region n;
    public final Paint o;
    public final Paint p;
    public final k3c q;
    public final my6 r;
    public final l3b s;
    public PorterDuffColorFilter t;
    public PorterDuffColorFilter u;
    public final RectF v;
    public final boolean w;
    public boolean x;
    public p3c y;
    public ulc z;

    static {
        Paint paint = new Paint(1);
        E = paint;
        paint.setColor(-1);
        paint.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.DST_OUT));
        F = new ck7[4];
        int i = 0;
        while (true) {
            ck7[] ck7VarArr = F;
            if (i >= ck7VarArr.length) {
                return;
            }
            ck7VarArr[i] = new ck7(i);
            i++;
        }
    }

    public dk7(bk7 bk7Var) {
        this.a = new md5(24, this);
        this.c = new i4c[4];
        this.d = new i4c[4];
        this.e = new BitSet(8);
        this.h = new Matrix();
        this.i = new Path();
        this.j = new Path();
        this.k = new RectF();
        this.l = new RectF();
        this.m = new Region();
        this.n = new Region();
        Paint paint = new Paint(1);
        this.o = paint;
        Paint paint2 = new Paint(1);
        this.p = paint2;
        this.q = new k3c();
        this.s = l3b.h();
        this.v = new RectF();
        this.w = true;
        this.x = true;
        this.A = new tlc[4];
        this.b = bk7Var;
        paint2.setStyle(Paint.Style.STROKE);
        paint.setStyle(Paint.Style.FILL);
        p();
        n(getState());
        this.r = new my6(this);
    }

    public final void a(RectF rectF, Path path) {
        this.s.a(this.b.a.c(), this.B, this.b.i, rectF, this.r, path);
        if (this.b.h != 1.0f) {
            Matrix matrix = this.h;
            matrix.reset();
            float f = this.b.h;
            matrix.setScale(f, f, rectF.width() / 2.0f, rectF.height() / 2.0f);
            path.transform(matrix);
        }
        path.computeBounds(this.v, true);
    }

    public final float b(RectF rectF, p3c p3cVar, float[] fArr) {
        if (fArr == null) {
            if (p3cVar.h(rectF)) {
                return p3cVar.e.a(rectF);
            }
            return -1.0f;
        }
        if (this.x) {
            return fArr[0];
        }
        return -1.0f;
    }

    public final int c(int i) {
        int i2;
        bk7 bk7Var = this.b;
        float f = bk7Var.m + 0.0f + bk7Var.l;
        ow3 ow3Var = bk7Var.b;
        if (ow3Var == null || !ow3Var.a || rv1.d(i, 255) != ow3Var.d) {
            return i;
        }
        float fMin = (ow3Var.e <= 0.0f || f <= 0.0f) ? 0.0f : Math.min(((((float) Math.log1p(f / r3)) * 4.5f) + 2.0f) / 100.0f, 1.0f);
        int iAlpha = Color.alpha(i);
        int iG = hlg.G(fMin, rv1.d(i, 255), ow3Var.b);
        if (fMin > 0.0f && (i2 = ow3Var.c) != 0) {
            iG = rv1.b(rv1.d(i2, ow3.f), iG);
        }
        return rv1.d(iG, iAlpha);
    }

    public final void d(Canvas canvas) {
        if (this.e.cardinality() > 0) {
            Log.w("dk7", "Compatibility shadow requested but can't be drawn for all operations in this shape.");
        }
        int i = this.b.o;
        Path path = this.i;
        k3c k3cVar = this.q;
        if (i != 0) {
            canvas.drawPath(path, k3cVar.a);
        }
        for (int i2 = 0; i2 < 4; i2++) {
            i4c i4cVar = this.c[i2];
            int i3 = this.b.n;
            Matrix matrix = i4c.b;
            i4cVar.a(matrix, k3cVar, i3, canvas);
            this.d[i2].a(matrix, k3cVar, this.b.n, canvas);
        }
        if (this.w) {
            int iSin = (int) (Math.sin(Math.toRadians(0.0d)) * ((double) this.b.o));
            int iCos = (int) (Math.cos(Math.toRadians(0.0d)) * ((double) this.b.o));
            canvas.translate(-iSin, -iCos);
            canvas.drawPath(path, E);
            canvas.translate(iSin, iCos);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:32:0x0129  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x0132  */
    @Override // android.graphics.drawable.Drawable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void draw(android.graphics.Canvas r26) {
        /*
            Method dump skipped, instruction units count: 537
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.dk7.draw(android.graphics.Canvas):void");
    }

    public final RectF e() {
        Rect bounds = getBounds();
        RectF rectF = this.k;
        rectF.set(bounds);
        return rectF;
    }

    public final float f() {
        if (h()) {
            return this.p.getStrokeWidth() / 2.0f;
        }
        return 0.0f;
    }

    public final boolean g() {
        bk7 bk7Var = this.b;
        bk7Var.getClass();
        return bk7Var.n > 0 && !i() && !this.i.isConvex() && Build.VERSION.SDK_INT < 29;
    }

    @Override // android.graphics.drawable.Drawable
    public final int getAlpha() {
        return this.b.k;
    }

    @Override // android.graphics.drawable.Drawable
    public final Drawable.ConstantState getConstantState() {
        return this.b;
    }

    @Override // android.graphics.drawable.Drawable
    public final int getOpacity() {
        return -3;
    }

    @Override // android.graphics.drawable.Drawable
    public final void getOutline(Outline outline) {
        this.b.getClass();
        RectF rectFE = e();
        if (rectFE.isEmpty()) {
            return;
        }
        float fB = b(rectFE, this.b.a.c(), this.B);
        if (fB >= 0.0f) {
            outline.setRoundRect(getBounds(), fB * this.b.i);
            return;
        }
        boolean z = this.f;
        Path path = this.i;
        if (z) {
            a(rectFE, path);
            this.f = false;
        }
        int i = Build.VERSION.SDK_INT;
        if (i >= 30) {
            km3.a(outline, path);
            return;
        }
        if (i >= 29) {
            try {
                jm3.a(outline, path);
            } catch (IllegalArgumentException unused) {
            }
        } else if (path.isConvex()) {
            jm3.a(outline, path);
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final boolean getPadding(Rect rect) {
        Rect rect2 = this.b.g;
        if (rect2 == null) {
            return super.getPadding(rect);
        }
        rect.set(rect2);
        return true;
    }

    @Override // android.graphics.drawable.Drawable
    public final Region getTransparentRegion() {
        Rect bounds = getBounds();
        Region region = this.m;
        region.set(bounds);
        RectF rectFE = e();
        Path path = this.i;
        a(rectFE, path);
        Region region2 = this.n;
        region2.setPath(path, region);
        region.op(region2, Region.Op.DIFFERENCE);
        return region;
    }

    public final boolean h() {
        Paint.Style style = this.b.p;
        return (style == Paint.Style.FILL_AND_STROKE || style == Paint.Style.STROKE) && this.p.getStrokeWidth() > 0.0f;
    }

    public final boolean i() {
        if (this.b.a.b(getState()).h(e())) {
            return this.B == null || this.x;
        }
        return false;
    }

    @Override // android.graphics.drawable.Drawable
    public final void invalidateSelf() {
        this.f = true;
        this.g = true;
        super.invalidateSelf();
    }

    @Override // android.graphics.drawable.Drawable
    public final boolean isStateful() {
        if (super.isStateful()) {
            return true;
        }
        ColorStateList colorStateList = this.b.e;
        if (colorStateList != null && colorStateList.isStateful()) {
            return true;
        }
        this.b.getClass();
        ColorStateList colorStateList2 = this.b.d;
        if (colorStateList2 != null && colorStateList2.isStateful()) {
            return true;
        }
        ColorStateList colorStateList3 = this.b.c;
        return (colorStateList3 != null && colorStateList3.isStateful()) || this.b.a.d();
    }

    public final void j(ulc ulcVar) {
        if (this.z == ulcVar) {
            return;
        }
        this.z = ulcVar;
        int i = 0;
        while (true) {
            tlc[] tlcVarArr = this.A;
            if (i >= tlcVarArr.length) {
                o(getState(), true);
                invalidateSelf();
                return;
            }
            if (tlcVarArr[i] == null) {
                tlcVarArr[i] = new tlc(this, F[i]);
            }
            tlc tlcVar = tlcVarArr[i];
            ulc ulcVar2 = new ulc();
            float f = (float) ulcVar.b;
            if (f < 0.0f) {
                ay0.e("Damping ratio must be non-negative");
                return;
            }
            ulcVar2.b = f;
            ulcVar2.c = false;
            double d = ulcVar.a;
            float f2 = (float) (d * d);
            if (f2 <= 0.0f) {
                ay0.e("Spring stiffness constant must be positive.");
                return;
            }
            ulcVar2.a = Math.sqrt(f2);
            ulcVar2.c = false;
            tlcVar.j = ulcVar2;
            i++;
        }
    }

    public final void k(float f) {
        bk7 bk7Var = this.b;
        if (bk7Var.m != f) {
            bk7Var.m = f;
            q();
        }
    }

    public final void l(ColorStateList colorStateList) {
        bk7 bk7Var = this.b;
        if (bk7Var.c != colorStateList) {
            bk7Var.c = colorStateList;
            onStateChange(getState());
        }
    }

    public final void m(n3c n3cVar) {
        if (n3cVar instanceof p3c) {
            setShapeAppearanceModel((p3c) n3cVar);
            return;
        }
        zpc zpcVar = (zpc) n3cVar;
        bk7 bk7Var = this.b;
        if (bk7Var.a != zpcVar) {
            bk7Var.a = zpcVar;
            o(getState(), true);
            invalidateSelf();
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final Drawable mutate() {
        bk7 bk7Var = this.b;
        bk7 bk7Var2 = new bk7();
        bk7Var2.c = null;
        bk7Var2.d = null;
        bk7Var2.e = null;
        bk7Var2.f = PorterDuff.Mode.SRC_IN;
        bk7Var2.g = null;
        bk7Var2.h = 1.0f;
        bk7Var2.i = 1.0f;
        bk7Var2.k = 255;
        bk7Var2.l = 0.0f;
        bk7Var2.m = 0.0f;
        bk7Var2.n = 0;
        bk7Var2.o = 0;
        bk7Var2.p = Paint.Style.FILL_AND_STROKE;
        bk7Var2.a = bk7Var.a;
        bk7Var2.b = bk7Var.b;
        bk7Var2.j = bk7Var.j;
        bk7Var2.c = bk7Var.c;
        bk7Var2.d = bk7Var.d;
        bk7Var2.f = bk7Var.f;
        bk7Var2.e = bk7Var.e;
        bk7Var2.k = bk7Var.k;
        bk7Var2.h = bk7Var.h;
        bk7Var2.o = bk7Var.o;
        bk7Var2.i = bk7Var.i;
        bk7Var2.l = bk7Var.l;
        bk7Var2.m = bk7Var.m;
        bk7Var2.n = bk7Var.n;
        bk7Var2.p = bk7Var.p;
        Rect rect = bk7Var.g;
        if (rect != null) {
            bk7Var2.g = new Rect(rect);
        }
        this.b = bk7Var2;
        return this;
    }

    public final boolean n(int[] iArr) {
        boolean z;
        Paint paint;
        int color;
        int colorForState;
        Paint paint2;
        int color2;
        int colorForState2;
        if (this.b.c == null || color2 == (colorForState2 = this.b.c.getColorForState(iArr, (color2 = (paint2 = this.o).getColor())))) {
            z = false;
        } else {
            paint2.setColor(colorForState2);
            z = true;
        }
        if (this.b.d == null || color == (colorForState = this.b.d.getColorForState(iArr, (color = (paint = this.p).getColor())))) {
            return z;
        }
        paint.setColor(colorForState);
        return true;
    }

    /* JADX WARN: Removed duplicated region for block: B:26:0x0051  */
    /* JADX WARN: Removed duplicated region for block: B:27:0x0053 A[EDGE_INSN: B:92:0x0053->B:27:0x0053 BREAK  A[LOOP:0: B:18:0x003a->B:23:0x0044]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void o(int[] r14, boolean r15) {
        /*
            Method dump skipped, instruction units count: 345
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.dk7.o(int[], boolean):void");
    }

    @Override // android.graphics.drawable.Drawable
    public final void onBoundsChange(Rect rect) {
        this.f = true;
        this.g = true;
        super.onBoundsChange(rect);
        if (!this.b.a.d() || rect.isEmpty()) {
            return;
        }
        int[] state = getState();
        tlc[] tlcVarArr = this.A;
        int length = tlcVarArr.length;
        boolean z = false;
        int i = 0;
        while (true) {
            if (i < length) {
                tlc tlcVar = tlcVarArr[i];
                if (tlcVar != null && tlcVar.e) {
                    z = true;
                    break;
                }
                i++;
            } else {
                break;
            }
        }
        o(state, true ^ z);
    }

    @Override // android.graphics.drawable.Drawable
    public final boolean onStateChange(int[] iArr) {
        if (this.b.a.d()) {
            o(iArr, false);
        }
        boolean z = n(iArr) || p();
        if (z) {
            invalidateSelf();
        }
        return z;
    }

    public final boolean p() {
        PorterDuffColorFilter porterDuffColorFilter;
        PorterDuffColorFilter porterDuffColorFilter2 = this.t;
        PorterDuffColorFilter porterDuffColorFilter3 = this.u;
        bk7 bk7Var = this.b;
        ColorStateList colorStateList = bk7Var.e;
        PorterDuff.Mode mode = bk7Var.f;
        if (colorStateList == null || mode == null) {
            int color = this.o.getColor();
            int iC = c(color);
            porterDuffColorFilter = iC != color ? new PorterDuffColorFilter(iC, PorterDuff.Mode.SRC_IN) : null;
        } else {
            porterDuffColorFilter = new PorterDuffColorFilter(c(colorStateList.getColorForState(getState(), 0)), mode);
        }
        this.t = porterDuffColorFilter;
        this.b.getClass();
        this.u = null;
        this.b.getClass();
        return (Objects.equals(porterDuffColorFilter2, this.t) && Objects.equals(porterDuffColorFilter3, this.u)) ? false : true;
    }

    public final void q() {
        bk7 bk7Var = this.b;
        float f = bk7Var.m + 0.0f;
        bk7Var.n = (int) Math.ceil(0.75f * f);
        this.b.o = (int) Math.ceil(f * 0.25f);
        p();
        if (g() || !i()) {
            invalidateSelf();
        } else {
            super.invalidateSelf();
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final void setAlpha(int i) {
        bk7 bk7Var = this.b;
        if (bk7Var.k != i) {
            bk7Var.k = i;
            super.invalidateSelf();
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final void setColorFilter(ColorFilter colorFilter) {
        this.b.getClass();
        super.invalidateSelf();
    }

    @Override // defpackage.v4c
    public final void setShapeAppearanceModel(p3c p3cVar) {
        this.b.a = p3cVar;
        this.B = null;
        this.C = null;
        invalidateSelf();
    }

    @Override // android.graphics.drawable.Drawable
    public final void setTint(int i) {
        setTintList(ColorStateList.valueOf(i));
    }

    @Override // android.graphics.drawable.Drawable
    public final void setTintList(ColorStateList colorStateList) {
        this.b.e = colorStateList;
        p();
        super.invalidateSelf();
    }

    @Override // android.graphics.drawable.Drawable
    public final void setTintMode(PorterDuff.Mode mode) {
        bk7 bk7Var = this.b;
        if (bk7Var.f != mode) {
            bk7Var.f = mode;
            p();
            super.invalidateSelf();
        }
    }

    public dk7(n3c n3cVar) {
        this(new bk7(n3cVar));
    }

    public dk7(p3c p3cVar) {
        this(new bk7(p3cVar));
    }
}
