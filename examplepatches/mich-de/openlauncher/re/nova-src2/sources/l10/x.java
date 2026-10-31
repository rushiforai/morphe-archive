package l10;

import aa.l0;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PorterDuffXfermode;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;

/* loaded from: classes.dex */
public final class x extends Drawable implements a {

    /* renamed from: a, reason: collision with root package name */
    public final int f74468a;

    /* renamed from: b, reason: collision with root package name */
    public final t f74469b;

    /* renamed from: c, reason: collision with root package name */
    public final t f74470c;

    /* renamed from: d, reason: collision with root package name */
    public int f74471d;

    /* renamed from: e, reason: collision with root package name */
    public final l0 f74472e;

    /* renamed from: f, reason: collision with root package name */
    public final float f74473f;

    /* renamed from: g, reason: collision with root package name */
    public final float f74474g;

    /* renamed from: h, reason: collision with root package name */
    public float f74475h;

    /* renamed from: i, reason: collision with root package name */
    public Bitmap f74476i;

    /* renamed from: j, reason: collision with root package name */
    public final float f74477j;

    /* renamed from: k, reason: collision with root package name */
    public final float f74478k;

    /* renamed from: l, reason: collision with root package name */
    public Bitmap f74479l;

    /* renamed from: m, reason: collision with root package name */
    public final x7.u f74480m;
    public final x7.u n;
    public boolean o;

    /* renamed from: p, reason: collision with root package name */
    public int f74481p;

    /* renamed from: q, reason: collision with root package name */
    public final Rect f74482q;

    /* renamed from: r, reason: collision with root package name */
    public final float[] f74483r;

    /* renamed from: s, reason: collision with root package name */
    public int f74484s;

    /* renamed from: t, reason: collision with root package name */
    public boolean f74485t;

    /* renamed from: u, reason: collision with root package name */
    public boolean f74486u;

    /* renamed from: v, reason: collision with root package name */
    public float f74487v;

    /* renamed from: w, reason: collision with root package name */
    public Boolean f74488w;

    /* renamed from: x, reason: collision with root package name */
    public float f74489x;

    public x(Resources resources, int i5, t tVar, t tVar2) throws Resources.NotFoundException {
        this.f74468a = i5;
        this.f74469b = tVar;
        this.f74470c = tVar2;
        l0 l0Var = new l0();
        this.f74472e = l0Var;
        float f11 = (resources.getDisplayMetrics().density * 56.0f) / 96.0f;
        this.f74473f = f11;
        float f12 = (resources.getDisplayMetrics().density * 56.0f) / 48.0f;
        this.f74474g = f12;
        tVar = tVar2 != null ? tVar2 : tVar;
        float f13 = tVar.f74457d;
        int i11 = tVar.f74456c;
        boolean z11 = tVar.f74454a;
        boolean z12 = tVar.f74455b;
        this.f74475h = (i5 / 2.0f) * f13;
        this.f74476i = b(tVar.f74454a, f11, f12, tVar.f74456c, z12 ? 25 : 0, null);
        float dimension = resources.getDimension(2131165546);
        this.f74477j = dimension;
        float dimension2 = resources.getDimension(2131165545);
        this.f74478k = dimension2;
        this.f74479l = b(tVar.f74454a, dimension, dimension2, 0, l0Var.f608b, null);
        this.f74480m = new x7.u(12);
        x7.u uVar = new x7.u(12);
        ((Paint) uVar.f95210c).setAlpha(0);
        this.n = uVar;
        this.o = z11;
        this.f74481p = i11;
        this.f74482q = new Rect();
        this.f74483r = new float[8];
        this.f74484s = i11;
        this.f74485t = z11;
        this.f74486u = z12;
        this.f74487v = this.f74475h;
        this.f74488w = Boolean.valueOf(z11);
    }

    @Override // l10.a
    public final void a(int i5) {
        int iE0 = this.f74469b.f74455b ? kotlin.ranges.a.e0(i5, 0, 255) : 0;
        x7.u uVar = this.n;
        if (iE0 != ((Paint) uVar.f95210c).getAlpha()) {
            ((Paint) uVar.f95210c).setAlpha(iE0);
            invalidateSelf();
        }
    }

    public final Bitmap b(boolean z11, float f11, float f12, int i5, int i11, Bitmap bitmap) {
        l0 l0Var = this.f74472e;
        l0Var.f609c = f11;
        l0Var.f610d = f12;
        l0Var.f611e = i11;
        l0Var.f608b = i11;
        int i12 = this.f74468a;
        if (!z11) {
            return l0Var.a(i12 + 20, i12, this.f74475h, i5, bitmap);
        }
        float f13 = this.f74475h;
        int iK = w20.e.k(3);
        PorterDuffXfermode porterDuffXfermode = l0.f606i;
        Canvas canvas = l0Var.f614h;
        l0Var.f612f = f13;
        float f14 = i12 + 20;
        float f15 = f14 / 2.0f;
        int iMax = Math.max(Math.round(l0Var.f609c + f15), Math.round(l0Var.f612f + l0Var.f609c + l0Var.f610d));
        RectF rectF = l0Var.f607a;
        float f16 = i12;
        rectF.set(0.0f, 0.0f, f14, f16);
        float f17 = iMax;
        rectF.offsetTo(f17 - f15, f17 - (f16 / 2.0f));
        int i13 = iMax * 2;
        if (bitmap != null && bitmap.getWidth() == i13 && bitmap.getHeight() == i13 && bitmap.getConfig() == Bitmap.Config.ARGB_8888) {
            bitmap.eraseColor(0);
        } else {
            bitmap = Bitmap.createBitmap(i13, i13, Bitmap.Config.ARGB_8888);
        }
        canvas.setBitmap(bitmap);
        canvas.save();
        float f18 = iK;
        float fHeight = (rectF.height() - f18) / rectF.height();
        canvas.scale(fHeight, fHeight, rectF.centerX(), rectF.centerY());
        Paint paintC = l0Var.c();
        paintC.setStrokeWidth(f18);
        paintC.setStyle(Paint.Style.STROKE);
        paintC.setColor(i5);
        paintC.setShadowLayer(l0Var.f609c, 0.0f, l0Var.f610d, aa.p.d(-16777216, l0Var.f611e));
        float f19 = l0Var.f612f;
        canvas.drawRoundRect(rectF, f19, f19, paintC);
        paintC.setShadowLayer(l0Var.f609c, 0.0f, 0.0f, aa.p.d(-16777216, l0Var.f608b));
        float f21 = l0Var.f612f;
        canvas.drawRoundRect(rectF, f21, f21, paintC);
        if (Color.alpha(i5) < 255) {
            paintC.setXfermode(porterDuffXfermode);
            paintC.clearShadowLayer();
            paintC.setColor(-16777216);
            float f22 = l0Var.f612f;
            canvas.drawRoundRect(rectF, f22, f22, paintC);
            paintC.setXfermode(null);
            paintC.setColor(i5);
            float f23 = l0Var.f612f;
            canvas.drawRoundRect(rectF, f23, f23, paintC);
        }
        canvas.restore();
        l0Var.c();
        canvas.setBitmap(null);
        return bitmap;
    }

    @Override // android.graphics.drawable.Drawable
    public final void draw(Canvas canvas) {
        int iSave;
        Rect bounds = getBounds();
        Rect rect = this.f74482q;
        rect.set(bounds);
        if (rect.width() < rect.height()) {
            iSave = canvas.save();
            canvas.rotate(90.0f, rect.exactCenterX(), (rect.width() / 2.0f) + rect.top);
            rect.set(rect.top, rect.left, rect.bottom, rect.right);
        } else {
            iSave = 0;
        }
        int i5 = iSave;
        if (((Paint) this.n.f95210c).getAlpha() > 0.0f) {
            int iHeight = (rect.height() - this.f74479l.getHeight()) / 2;
            Bitmap bitmap = this.f74479l;
            float f11 = rect.left;
            int i11 = this.f74471d;
            this.n.f(bitmap, canvas, f11 + i11, rect.top + iHeight, rect.right - i11);
        }
        int iHeight2 = (rect.height() - this.f74476i.getHeight()) / 2;
        int width = (this.f74479l.getWidth() - this.f74476i.getWidth()) / 2;
        float f12 = width;
        int i12 = this.f74471d;
        this.f74480m.f(this.f74476i, canvas, rect.left + f12 + i12, rect.top + iHeight2, (rect.right - f12) - i12);
        if (i5 >= 1) {
            canvas.restoreToCount(i5);
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final int getAlpha() {
        return ((Paint) this.f74480m.f95210c).getAlpha();
    }

    @Override // android.graphics.drawable.Drawable
    public final int getIntrinsicHeight() {
        return this.f74468a;
    }

    @Override // android.graphics.drawable.Drawable
    public final int getIntrinsicWidth() {
        return this.f74468a + 20;
    }

    @Override // android.graphics.drawable.Drawable
    public final int getOpacity() {
        return -1;
    }

    @Override // android.graphics.drawable.Drawable
    public final void setAlpha(int i5) {
        ((Paint) this.f74480m.f95210c).setAlpha(i5);
        invalidateSelf();
    }

    @Override // android.graphics.drawable.Drawable
    public final void setColorFilter(ColorFilter colorFilter) {
        ((Paint) this.f74480m.f95210c).setColorFilter(colorFilter);
        invalidateSelf();
    }
}
