package j7;

import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;

/* loaded from: classes2.dex */
public final class m extends Drawable.ConstantState {

    /* renamed from: a, reason: collision with root package name */
    public int f69126a;

    /* renamed from: b, reason: collision with root package name */
    public l f69127b;

    /* renamed from: c, reason: collision with root package name */
    public ColorStateList f69128c;

    /* renamed from: d, reason: collision with root package name */
    public PorterDuff.Mode f69129d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f69130e;

    /* renamed from: f, reason: collision with root package name */
    public Bitmap f69131f;

    /* renamed from: g, reason: collision with root package name */
    public ColorStateList f69132g;

    /* renamed from: h, reason: collision with root package name */
    public PorterDuff.Mode f69133h;

    /* renamed from: i, reason: collision with root package name */
    public int f69134i;

    /* renamed from: j, reason: collision with root package name */
    public boolean f69135j;

    /* renamed from: k, reason: collision with root package name */
    public boolean f69136k;

    /* renamed from: l, reason: collision with root package name */
    public Paint f69137l;

    public m(m mVar) {
        this.f69128c = null;
        this.f69129d = o.f69139j;
        if (mVar != null) {
            this.f69126a = mVar.f69126a;
            l lVar = new l(mVar.f69127b);
            this.f69127b = lVar;
            if (mVar.f69127b.f69117e != null) {
                lVar.f69117e = new Paint(mVar.f69127b.f69117e);
            }
            if (mVar.f69127b.f69116d != null) {
                this.f69127b.f69116d = new Paint(mVar.f69127b.f69116d);
            }
            this.f69128c = mVar.f69128c;
            this.f69129d = mVar.f69129d;
            this.f69130e = mVar.f69130e;
        }
    }

    public final boolean a() {
        return !this.f69136k && this.f69132g == this.f69128c && this.f69133h == this.f69129d && this.f69135j == this.f69130e && this.f69134i == this.f69127b.getRootAlpha();
    }

    public final void b(int i5, int i11) {
        Bitmap bitmap = this.f69131f;
        if (bitmap != null && i5 == bitmap.getWidth() && i11 == this.f69131f.getHeight()) {
            return;
        }
        this.f69131f = Bitmap.createBitmap(i5, i11, Bitmap.Config.ARGB_8888);
        this.f69136k = true;
    }

    public final void c(Canvas canvas, ColorFilter colorFilter, Rect rect) {
        Paint paint;
        if (this.f69127b.getRootAlpha() >= 255 && colorFilter == null) {
            paint = null;
        } else {
            if (this.f69137l == null) {
                Paint paint2 = new Paint();
                this.f69137l = paint2;
                paint2.setFilterBitmap(true);
            }
            this.f69137l.setAlpha(this.f69127b.getRootAlpha());
            this.f69137l.setColorFilter(colorFilter);
            paint = this.f69137l;
        }
        canvas.drawBitmap(this.f69131f, (Rect) null, rect, paint);
    }

    public final boolean d() {
        l lVar = this.f69127b;
        if (lVar.n == null) {
            lVar.n = Boolean.valueOf(lVar.f69119g.a());
        }
        return lVar.n.booleanValue();
    }

    public final boolean e(int[] iArr) {
        boolean zB = this.f69127b.f69119g.b(iArr);
        this.f69136k |= zB;
        return zB;
    }

    public final void f() {
        this.f69132g = this.f69128c;
        this.f69133h = this.f69129d;
        this.f69134i = this.f69127b.getRootAlpha();
        this.f69135j = this.f69130e;
        this.f69136k = false;
    }

    public final void g(int i5, int i11) {
        this.f69131f.eraseColor(0);
        Canvas canvas = new Canvas(this.f69131f);
        l lVar = this.f69127b;
        lVar.a(lVar.f69119g, l.f69112p, canvas, i5, i11);
    }

    @Override // android.graphics.drawable.Drawable.ConstantState
    public int getChangingConfigurations() {
        return this.f69126a;
    }

    @Override // android.graphics.drawable.Drawable.ConstantState
    public final Drawable newDrawable() {
        return new o(this);
    }

    @Override // android.graphics.drawable.Drawable.ConstantState
    public final Drawable newDrawable(Resources resources) {
        return new o(this);
    }

    public m() {
        this.f69128c = null;
        this.f69129d = o.f69139j;
        this.f69127b = new l();
    }
}
