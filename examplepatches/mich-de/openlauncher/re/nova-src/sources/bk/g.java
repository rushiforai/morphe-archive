package bk;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Bitmap;
import android.graphics.Canvas;
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
import android.os.Looper;
import android.util.AttributeSet;
import android.util.Log;
import com.google.android.gms.internal.consent_sdk.k0;
import java.util.BitSet;
import java.util.Objects;

/* loaded from: classes3.dex */
public class g extends Drawable implements u {

    /* renamed from: x, reason: collision with root package name */
    public static final Paint f17979x;

    /* renamed from: a, reason: collision with root package name */
    public f f17980a;

    /* renamed from: b, reason: collision with root package name */
    public final s[] f17981b;

    /* renamed from: c, reason: collision with root package name */
    public final s[] f17982c;

    /* renamed from: d, reason: collision with root package name */
    public final BitSet f17983d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f17984e;

    /* renamed from: f, reason: collision with root package name */
    public final Matrix f17985f;

    /* renamed from: g, reason: collision with root package name */
    public final Path f17986g;

    /* renamed from: h, reason: collision with root package name */
    public final Path f17987h;

    /* renamed from: i, reason: collision with root package name */
    public final RectF f17988i;

    /* renamed from: j, reason: collision with root package name */
    public final RectF f17989j;

    /* renamed from: k, reason: collision with root package name */
    public final Region f17990k;

    /* renamed from: l, reason: collision with root package name */
    public final Region f17991l;

    /* renamed from: m, reason: collision with root package name */
    public j f17992m;
    public final Paint n;
    public final Paint o;

    /* renamed from: p, reason: collision with root package name */
    public final ak.a f17993p;

    /* renamed from: q, reason: collision with root package name */
    public final a5.d f17994q;

    /* renamed from: r, reason: collision with root package name */
    public final l f17995r;

    /* renamed from: s, reason: collision with root package name */
    public PorterDuffColorFilter f17996s;

    /* renamed from: t, reason: collision with root package name */
    public PorterDuffColorFilter f17997t;

    /* renamed from: u, reason: collision with root package name */
    public int f17998u;

    /* renamed from: v, reason: collision with root package name */
    public final RectF f17999v;

    /* renamed from: w, reason: collision with root package name */
    public boolean f18000w;

    static {
        Paint paint = new Paint(1);
        f17979x = paint;
        paint.setColor(-1);
        paint.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.DST_OUT));
    }

    public g() {
        this(new j(0));
    }

    public final void a(RectF rectF, Path path) {
        f fVar = this.f17980a;
        this.f17995r.b(fVar.f17964a, fVar.f17972i, rectF, this.f17994q, path);
        if (this.f17980a.f17971h != 1.0f) {
            Matrix matrix = this.f17985f;
            matrix.reset();
            float f11 = this.f17980a.f17971h;
            matrix.setScale(f11, f11, rectF.width() / 2.0f, rectF.height() / 2.0f);
            path.transform(matrix);
        }
        path.computeBounds(this.f17999v, true);
    }

    public final int b(int i5) {
        f fVar = this.f17980a;
        float f11 = fVar.f17976m + 0.0f + fVar.f17975l;
        pj.a aVar = fVar.f17965b;
        return aVar != null ? aVar.a(f11, i5) : i5;
    }

    @Override // bk.u
    public final void c(j jVar) {
        this.f17980a.f17964a = jVar;
        invalidateSelf();
    }

    public final void d(Canvas canvas) {
        if (this.f17983d.cardinality() > 0) {
            Log.w("g", "Compatibility shadow requested but can't be drawn for all operations in this shape.");
        }
        int i5 = this.f17980a.o;
        Path path = this.f17986g;
        ak.a aVar = this.f17993p;
        if (i5 != 0) {
            canvas.drawPath(path, aVar.f13528a);
        }
        for (int i11 = 0; i11 < 4; i11++) {
            s sVar = this.f17981b[i11];
            int i12 = this.f17980a.n;
            Matrix matrix = s.f18044b;
            sVar.a(matrix, aVar, i12, canvas);
            this.f17982c[i11].a(matrix, aVar, this.f17980a.n, canvas);
        }
        if (this.f18000w) {
            f fVar = this.f17980a;
            int iSin = (int) (Math.sin(Math.toRadians(fVar.f17977p)) * fVar.o);
            f fVar2 = this.f17980a;
            int iCos = (int) (Math.cos(Math.toRadians(fVar2.f17977p)) * fVar2.o);
            canvas.translate(-iSin, -iCos);
            canvas.drawPath(path, f17979x);
            canvas.translate(iSin, iCos);
        }
    }

    @Override // android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        PorterDuffColorFilter porterDuffColorFilter = this.f17996s;
        Paint paint = this.n;
        paint.setColorFilter(porterDuffColorFilter);
        int alpha = paint.getAlpha();
        int i5 = this.f17980a.f17974k;
        paint.setAlpha(((i5 + (i5 >>> 7)) * alpha) >>> 8);
        PorterDuffColorFilter porterDuffColorFilter2 = this.f17997t;
        Paint paint2 = this.o;
        paint2.setColorFilter(porterDuffColorFilter2);
        paint2.setStrokeWidth(this.f17980a.f17973j);
        int alpha2 = paint2.getAlpha();
        int i11 = this.f17980a.f17974k;
        paint2.setAlpha(((i11 + (i11 >>> 7)) * alpha2) >>> 8);
        boolean z11 = this.f17984e;
        Path path = this.f17986g;
        if (z11) {
            float f11 = -(i() ? paint2.getStrokeWidth() / 2.0f : 0.0f);
            j jVar = this.f17980a.f17964a;
            j jVarF = jVar.f();
            c bVar = jVar.f18007e;
            if (!(bVar instanceof h)) {
                bVar = new b(f11, bVar);
            }
            jVarF.f18007e = bVar;
            c bVar2 = jVar.f18008f;
            if (!(bVar2 instanceof h)) {
                bVar2 = new b(f11, bVar2);
            }
            jVarF.f18008f = bVar2;
            c bVar3 = jVar.f18010h;
            if (!(bVar3 instanceof h)) {
                bVar3 = new b(f11, bVar3);
            }
            jVarF.f18010h = bVar3;
            c bVar4 = jVar.f18009g;
            if (!(bVar4 instanceof h)) {
                bVar4 = new b(f11, bVar4);
            }
            jVarF.f18009g = bVar4;
            j jVarA = jVarF.a();
            this.f17992m = jVarA;
            float f12 = this.f17980a.f17972i;
            RectF rectFG = g();
            RectF rectF = this.f17989j;
            rectF.set(rectFG);
            float strokeWidth = i() ? paint2.getStrokeWidth() / 2.0f : 0.0f;
            rectF.inset(strokeWidth, strokeWidth);
            this.f17995r.b(jVarA, f12, rectF, null, this.f17987h);
            a(g(), path);
            this.f17984e = false;
        }
        f fVar = this.f17980a;
        fVar.getClass();
        if (fVar.n > 0) {
            int i12 = Build.VERSION.SDK_INT;
            if (!this.f17980a.f17964a.e(g()) && !path.isConvex() && i12 < 29) {
                canvas.save();
                f fVar2 = this.f17980a;
                int iSin = (int) (Math.sin(Math.toRadians(fVar2.f17977p)) * fVar2.o);
                f fVar3 = this.f17980a;
                canvas.translate(iSin, (int) (Math.cos(Math.toRadians(fVar3.f17977p)) * fVar3.o));
                if (this.f18000w) {
                    RectF rectF2 = this.f17999v;
                    int iWidth = (int) (rectF2.width() - getBounds().width());
                    int iHeight = (int) (rectF2.height() - getBounds().height());
                    if (iWidth < 0 || iHeight < 0) {
                        throw new IllegalStateException("Invalid shadow bounds. Check that the treatments result in a valid path.");
                    }
                    Bitmap bitmapCreateBitmap = Bitmap.createBitmap((this.f17980a.n * 2) + ((int) rectF2.width()) + iWidth, (this.f17980a.n * 2) + ((int) rectF2.height()) + iHeight, Bitmap.Config.ARGB_8888);
                    Canvas canvas2 = new Canvas(bitmapCreateBitmap);
                    float f13 = (getBounds().left - this.f17980a.n) - iWidth;
                    float f14 = (getBounds().top - this.f17980a.n) - iHeight;
                    canvas2.translate(-f13, -f14);
                    d(canvas2);
                    canvas.drawBitmap(bitmapCreateBitmap, f13, f14, (Paint) null);
                    bitmapCreateBitmap.recycle();
                    canvas.restore();
                } else {
                    d(canvas);
                    canvas.restore();
                }
            }
        }
        f fVar4 = this.f17980a;
        Paint.Style style = fVar4.f17978q;
        if (style == Paint.Style.FILL_AND_STROKE || style == Paint.Style.FILL) {
            e(canvas, paint, path, fVar4.f17964a, g());
        }
        if (i()) {
            f(canvas);
        }
        paint.setAlpha(alpha);
        paint2.setAlpha(alpha2);
    }

    public final void e(Canvas canvas, Paint paint, Path path, j jVar, RectF rectF) {
        if (!jVar.e(rectF)) {
            canvas.drawPath(path, paint);
        } else {
            float fA = jVar.f18008f.a(rectF) * this.f17980a.f17972i;
            canvas.drawRoundRect(rectF, fA, fA, paint);
        }
    }

    public void f(Canvas canvas) {
        j jVar = this.f17992m;
        RectF rectFG = g();
        RectF rectF = this.f17989j;
        rectF.set(rectFG);
        boolean zI = i();
        Paint paint = this.o;
        float strokeWidth = zI ? paint.getStrokeWidth() / 2.0f : 0.0f;
        rectF.inset(strokeWidth, strokeWidth);
        e(canvas, paint, this.f17987h, jVar, rectF);
    }

    public final RectF g() {
        Rect bounds = getBounds();
        RectF rectF = this.f17988i;
        rectF.set(bounds);
        return rectF;
    }

    @Override // android.graphics.drawable.Drawable
    public int getAlpha() {
        return this.f17980a.f17974k;
    }

    @Override // android.graphics.drawable.Drawable
    public final Drawable.ConstantState getConstantState() {
        return this.f17980a;
    }

    @Override // android.graphics.drawable.Drawable
    public int getOpacity() {
        return -3;
    }

    @Override // android.graphics.drawable.Drawable
    public void getOutline(Outline outline) {
        this.f17980a.getClass();
        if (this.f17980a.f17964a.e(g())) {
            outline.setRoundRect(getBounds(), h() * this.f17980a.f17972i);
        } else {
            RectF rectFG = g();
            Path path = this.f17986g;
            a(rectFG, path);
            k0.D(outline, path);
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final boolean getPadding(Rect rect) {
        Rect rect2 = this.f17980a.f17970g;
        if (rect2 == null) {
            return super.getPadding(rect);
        }
        rect.set(rect2);
        return true;
    }

    @Override // android.graphics.drawable.Drawable
    public final Region getTransparentRegion() {
        Rect bounds = getBounds();
        Region region = this.f17990k;
        region.set(bounds);
        RectF rectFG = g();
        Path path = this.f17986g;
        a(rectFG, path);
        Region region2 = this.f17991l;
        region2.setPath(path, region);
        region.op(region2, Region.Op.DIFFERENCE);
        return region;
    }

    public final float h() {
        return this.f17980a.f17964a.f18007e.a(g());
    }

    public final boolean i() {
        Paint.Style style = this.f17980a.f17978q;
        return (style == Paint.Style.FILL_AND_STROKE || style == Paint.Style.STROKE) && this.o.getStrokeWidth() > 0.0f;
    }

    @Override // android.graphics.drawable.Drawable
    public final void invalidateSelf() {
        this.f17984e = true;
        super.invalidateSelf();
    }

    @Override // android.graphics.drawable.Drawable
    public boolean isStateful() {
        if (super.isStateful()) {
            return true;
        }
        ColorStateList colorStateList = this.f17980a.f17968e;
        if (colorStateList != null && colorStateList.isStateful()) {
            return true;
        }
        this.f17980a.getClass();
        ColorStateList colorStateList2 = this.f17980a.f17967d;
        if (colorStateList2 != null && colorStateList2.isStateful()) {
            return true;
        }
        ColorStateList colorStateList3 = this.f17980a.f17966c;
        return colorStateList3 != null && colorStateList3.isStateful();
    }

    public final void j(Context context) {
        this.f17980a.f17965b = new pj.a(context);
        p();
    }

    public final void k(float f11) {
        f fVar = this.f17980a;
        if (fVar.f17976m != f11) {
            fVar.f17976m = f11;
            p();
        }
    }

    public final void l(ColorStateList colorStateList) {
        f fVar = this.f17980a;
        if (fVar.f17966c != colorStateList) {
            fVar.f17966c = colorStateList;
            onStateChange(getState());
        }
    }

    public final void m() {
        this.f17993p.a(-12303292);
        this.f17980a.getClass();
        super.invalidateSelf();
    }

    @Override // android.graphics.drawable.Drawable
    public Drawable mutate() {
        this.f17980a = new f(this.f17980a);
        return this;
    }

    public final boolean n(int[] iArr) {
        boolean z11;
        Paint paint;
        int color;
        int colorForState;
        Paint paint2;
        int color2;
        int colorForState2;
        if (this.f17980a.f17966c == null || color2 == (colorForState2 = this.f17980a.f17966c.getColorForState(iArr, (color2 = (paint2 = this.n).getColor())))) {
            z11 = false;
        } else {
            paint2.setColor(colorForState2);
            z11 = true;
        }
        if (this.f17980a.f17967d == null || color == (colorForState = this.f17980a.f17967d.getColorForState(iArr, (color = (paint = this.o).getColor())))) {
            return z11;
        }
        paint.setColor(colorForState);
        return true;
    }

    public final boolean o() {
        PorterDuffColorFilter porterDuffColorFilter;
        PorterDuffColorFilter porterDuffColorFilter2 = this.f17996s;
        PorterDuffColorFilter porterDuffColorFilter3 = this.f17997t;
        f fVar = this.f17980a;
        ColorStateList colorStateList = fVar.f17968e;
        PorterDuff.Mode mode = fVar.f17969f;
        if (colorStateList == null || mode == null) {
            int color = this.n.getColor();
            int iB = b(color);
            this.f17998u = iB;
            porterDuffColorFilter = iB != color ? new PorterDuffColorFilter(iB, PorterDuff.Mode.SRC_IN) : null;
        } else {
            int iB2 = b(colorStateList.getColorForState(getState(), 0));
            this.f17998u = iB2;
            porterDuffColorFilter = new PorterDuffColorFilter(iB2, mode);
        }
        this.f17996s = porterDuffColorFilter;
        this.f17980a.getClass();
        this.f17997t = null;
        this.f17980a.getClass();
        return (Objects.equals(porterDuffColorFilter2, this.f17996s) && Objects.equals(porterDuffColorFilter3, this.f17997t)) ? false : true;
    }

    @Override // android.graphics.drawable.Drawable
    public final void onBoundsChange(Rect rect) {
        this.f17984e = true;
        super.onBoundsChange(rect);
    }

    @Override // android.graphics.drawable.Drawable
    public boolean onStateChange(int[] iArr) {
        boolean z11 = n(iArr) || o();
        if (z11) {
            invalidateSelf();
        }
        return z11;
    }

    public final void p() {
        f fVar = this.f17980a;
        float f11 = fVar.f17976m + 0.0f;
        fVar.n = (int) Math.ceil(0.75f * f11);
        this.f17980a.o = (int) Math.ceil(f11 * 0.25f);
        o();
        super.invalidateSelf();
    }

    @Override // android.graphics.drawable.Drawable
    public void setAlpha(int i5) {
        f fVar = this.f17980a;
        if (fVar.f17974k != i5) {
            fVar.f17974k = i5;
            super.invalidateSelf();
        }
    }

    @Override // android.graphics.drawable.Drawable
    public void setColorFilter(ColorFilter colorFilter) {
        this.f17980a.getClass();
        super.invalidateSelf();
    }

    @Override // android.graphics.drawable.Drawable
    public final void setTint(int i5) {
        setTintList(ColorStateList.valueOf(i5));
    }

    @Override // android.graphics.drawable.Drawable
    public void setTintList(ColorStateList colorStateList) {
        this.f17980a.f17968e = colorStateList;
        o();
        super.invalidateSelf();
    }

    @Override // android.graphics.drawable.Drawable
    public void setTintMode(PorterDuff.Mode mode) {
        f fVar = this.f17980a;
        if (fVar.f17969f != mode) {
            fVar.f17969f = mode;
            o();
            super.invalidateSelf();
        }
    }

    public g(Context context, AttributeSet attributeSet, int i5, int i11) {
        this(j.c(context, attributeSet, i5, i11).a());
    }

    public g(j jVar) {
        this(new f(jVar));
    }

    public g(f fVar) {
        l lVar;
        this.f17981b = new s[4];
        this.f17982c = new s[4];
        this.f17983d = new BitSet(8);
        this.f17985f = new Matrix();
        this.f17986g = new Path();
        this.f17987h = new Path();
        this.f17988i = new RectF();
        this.f17989j = new RectF();
        this.f17990k = new Region();
        this.f17991l = new Region();
        Paint paint = new Paint(1);
        this.n = paint;
        Paint paint2 = new Paint(1);
        this.o = paint2;
        this.f17993p = new ak.a();
        if (Looper.getMainLooper().getThread() == Thread.currentThread()) {
            lVar = k.f18015a;
        } else {
            lVar = new l(0);
        }
        this.f17995r = lVar;
        this.f17999v = new RectF();
        this.f18000w = true;
        this.f17980a = fVar;
        paint2.setStyle(Paint.Style.STROKE);
        paint.setStyle(Paint.Style.FILL);
        o();
        n(getState());
        this.f17994q = new a5.d(this, 21);
    }
}
