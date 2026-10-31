package com.teslacoilsw.launcher.icon;

import aa.n;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.os.SystemClock;
import fz.y;
import java.util.Calendar;

/* loaded from: classes4.dex */
public final class c extends n implements Runnable {
    public final Calendar o;

    /* renamed from: p, reason: collision with root package name */
    public final NovaClockDrawableWrapper$ClockBitmapInfo f45793p;

    /* renamed from: q, reason: collision with root package name */
    public final a f45794q;

    /* renamed from: r, reason: collision with root package name */
    public final LayerDrawable f45795r;

    /* renamed from: s, reason: collision with root package name */
    public Rect f45796s;

    /* renamed from: t, reason: collision with root package name */
    public Canvas f45797t;

    /* renamed from: u, reason: collision with root package name */
    public Bitmap f45798u;

    public c(NovaClockDrawableWrapper$ClockBitmapInfo novaClockDrawableWrapper$ClockBitmapInfo) {
        super(novaClockDrawableWrapper$ClockBitmapInfo);
        this.o = Calendar.getInstance();
        this.f45796s = null;
        this.f45797t = null;
        this.f45798u = null;
        this.f45793p = novaClockDrawableWrapper$ClockBitmapInfo;
        a aVar = (a) ((Drawable.ConstantState) novaClockDrawableWrapper$ClockBitmapInfo.f45767g.f56393g).newDrawable().mutate();
        this.f45794q = aVar;
        this.f45795r = (LayerDrawable) aVar.i();
    }

    @Override // aa.n
    public final void f(Canvas canvas, Rect rect) {
        NovaClockDrawableWrapper$ClockBitmapInfo novaClockDrawableWrapper$ClockBitmapInfo = this.f45793p;
        if (novaClockDrawableWrapper$ClockBitmapInfo == null) {
            super.f(canvas, rect);
            return;
        }
        int i5 = novaClockDrawableWrapper$ClockBitmapInfo.f45766f;
        Paint paint = this.f626a;
        ColorFilter colorFilter = paint.getColorFilter();
        ColorFilter colorFilter2 = novaClockDrawableWrapper$ClockBitmapInfo.f45769i;
        if (colorFilter2 != null) {
            paint.setColorFilter(colorFilter2);
        }
        canvas.drawBitmap(novaClockDrawableWrapper$ClockBitmapInfo.f45768h, (Rect) null, rect, paint);
        paint.setColorFilter(colorFilter);
        y yVar = novaClockDrawableWrapper$ClockBitmapInfo.f45767g;
        Calendar calendar = this.o;
        LayerDrawable layerDrawable = this.f45795r;
        yVar.a(calendar, layerDrawable);
        float f11 = novaClockDrawableWrapper$ClockBitmapInfo.f45765e;
        canvas.scale(f11, f11, rect.exactCenterX() + i5, rect.exactCenterY() + i5);
        canvas.clipPath(this.f45794q.j());
        layerDrawable.draw(canvas);
        l();
    }

    @Override // aa.n
    public final Bitmap g() {
        if (this.f45798u == null) {
            this.f45798u = Bitmap.createBitmap(this.f627b.getWidth(), this.f627b.getHeight(), Bitmap.Config.ARGB_8888);
            this.f45797t = new Canvas(this.f45798u);
            this.f45796s = new Rect(0, 0, this.f627b.getWidth(), this.f627b.getHeight());
        }
        this.f45798u.eraseColor(0);
        int iSave = this.f45797t.save();
        f(this.f45797t, this.f45796s);
        this.f45797t.restoreToCount(iSave);
        return this.f45798u;
    }

    @Override // aa.n, android.graphics.drawable.Drawable
    public final Drawable.ConstantState getConstantState() {
        return new b(this.f45793p, this.f631f);
    }

    @Override // aa.n
    public final boolean i() {
        return this.f45793p.f45769i != null;
    }

    @Override // aa.n
    public final void k() {
        super.k();
        this.f45794q.setColorFilter(this.f626a.getColorFilter());
    }

    public final void l() {
        if (isVisible()) {
            unscheduleSelf(this);
            long jUptimeMillis = SystemClock.uptimeMillis();
            long j11 = d.f45799v;
            scheduleSelf(this, (jUptimeMillis - (jUptimeMillis % j11)) + j11);
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final void onBoundsChange(Rect rect) {
        super.onBoundsChange(rect);
        this.f45794q.setBounds(rect);
    }

    @Override // java.lang.Runnable
    public final void run() {
        if (this.f45793p.f45767g.a(this.o, this.f45795r)) {
            invalidateSelf();
        } else {
            l();
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final boolean setVisible(boolean z11, boolean z12) {
        boolean visible = super.setVisible(z11, z12);
        if (z11) {
            l();
            return visible;
        }
        unscheduleSelf(this);
        return visible;
    }
}
