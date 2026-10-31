package y9;

import android.animation.ValueAnimator;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Rect;
import com.android.launcher3.CellLayout;
import com.android.launcher3.folder.FolderIcon;
import e10.i0;
import e10.y2;
import o9.d4;
import o9.u2;

/* loaded from: classes.dex */
public final class y extends o9.t {

    /* renamed from: f, reason: collision with root package name */
    public int f96979f;

    /* renamed from: g, reason: collision with root package name */
    public int f96980g;

    /* renamed from: i, reason: collision with root package name */
    public float f96982i;

    /* renamed from: l, reason: collision with root package name */
    public FolderIcon f96985l;

    /* renamed from: m, reason: collision with root package name */
    public int f96986m;
    public int n;
    public int o;

    /* renamed from: p, reason: collision with root package name */
    public CellLayout f96987p;

    /* renamed from: r, reason: collision with root package name */
    public ValueAnimator f96989r;

    /* renamed from: v, reason: collision with root package name */
    public fz.d f96993v;

    /* renamed from: c, reason: collision with root package name */
    public final Path f96976c = new Path();

    /* renamed from: d, reason: collision with root package name */
    public final Paint f96977d = new Paint(1);

    /* renamed from: e, reason: collision with root package name */
    public float f96978e = 1.0f;

    /* renamed from: h, reason: collision with root package name */
    public int f96981h = -1;

    /* renamed from: j, reason: collision with root package name */
    public int f96983j = 255;

    /* renamed from: k, reason: collision with root package name */
    public int f96984k = 255;

    /* renamed from: q, reason: collision with root package name */
    public boolean f96988q = true;

    /* renamed from: s, reason: collision with root package name */
    public final float f96990s = 1.0f;

    /* renamed from: t, reason: collision with root package name */
    public int f96991t = 255;

    /* renamed from: u, reason: collision with root package name */
    public int f96992u = 255;

    /* renamed from: w, reason: collision with root package name */
    public boolean f96994w = true;

    /* renamed from: x, reason: collision with root package name */
    public float f96995x = 1.125f;

    static {
        new aa.l(9, Integer.class, "strokeAlpha");
        new aa.l(10, Integer.class, "shadowAlpha");
        new Rect();
        new Rect();
    }

    public final void a(float f11, Runnable runnable, d4 d4Var) {
        float f12 = this.f96978e;
        ValueAnimator valueAnimator = this.f96989r;
        if (valueAnimator != null) {
            valueAnimator.cancel();
        }
        ValueAnimator valueAnimatorOfFloat = ValueAnimator.ofFloat(0.0f, 1.0f);
        this.f96989r = valueAnimatorOfFloat;
        valueAnimatorOfFloat.addUpdateListener(new w(this, f11, f12));
        this.f96989r.addListener(new x(this, runnable, d4Var));
        this.f96989r.setDuration(100L);
        this.f96989r.start();
    }

    public final void b(Canvas canvas) {
        Paint.Style style = Paint.Style.FILL;
        Paint paint = this.f96977d;
        paint.setStyle(style);
        paint.setColor(d());
        this.f96993v.f56204a.d(canvas, f(), g(), h(), paint);
    }

    public final void c(Canvas canvas) {
        if (this.f96994w) {
            int iD = aa.p.d(this.f96980g, this.f96983j);
            Paint paint = this.f96977d;
            paint.setColor(iD);
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeWidth(this.f96982i);
            this.f96993v.f56204a.d(canvas, f() + 1.0f, g() + 1.0f, h() - 1.0f, paint);
        }
    }

    public final int d() {
        return aa.p.d(this.f96979f, (int) Math.min(this.f96991t, this.f96992u * this.f96990s));
    }

    public final Path e() {
        Path path = this.f96976c;
        path.reset();
        float fH = h() * this.f96995x;
        float f11 = fH - (this.f96986m / 2);
        this.f96993v.f56204a.a(path, this.n - f11, this.o - f11, fH);
        return path;
    }

    public final int f() {
        return this.n - (h() - (this.f96986m / 2));
    }

    public final int g() {
        return this.o - (h() - (this.f96986m / 2));
    }

    public final int h() {
        return (int) (this.f96978e * (this.f96986m / 2));
    }

    public final void i() {
        FolderIcon folderIcon = this.f96985l;
        if (folderIcon != null) {
            folderIcon.invalidate();
        }
        CellLayout cellLayout = this.f96987p;
        if (cellLayout != null) {
            cellLayout.invalidate();
        }
    }

    public final void j(int i5) {
        int i11 = i5 | (-16777216);
        this.f96979f = i11;
        if (Color.red(i11) == Color.green(this.f96979f) && Color.red(this.f96979f) == Color.blue(this.f96979f)) {
            g30.b bVar = (g30.b) g30.b.f57016l.f95127b;
            this.f96980g = ((bVar != null ? bVar.f57022f : false) || Color.red(this.f96979f) < 128) ? 8423051 : -1;
        } else {
            this.f96980g = r4.a.n(this.f96979f, 255);
        }
        this.f96983j = Math.min(255, this.f96992u * 3);
        this.f96981h = r4.a.n(this.f96980g, 255);
    }

    public final void k(Context context, za.d dVar, FolderIcon folderIcon, int i5, int i11, int i12, int i13) {
        this.f96985l = folderIcon;
        context.getTheme().obtainStyledAttributes(u2.f80174y).recycle();
        this.f96986m = i12;
        this.n = (i5 - i12) / 2;
        this.o = i11 + i13;
        this.f96982i = context.getResources().getDisplayMetrics().density;
        i0 i0Var = folderIcon != null ? folderIcon.f21131d0 : (i0) y2.f51877a.i0().l();
        this.f96995x = i0Var.b() ? 1.0f : 1.125f;
        this.f96993v = i0Var.g();
        tz.d dVarC = dVar.C();
        if (i0Var.f51588d == 262914) {
            j(dVarC.f90102e.f90178a);
        } else {
            j(dVarC.f90101d.f90178a);
        }
        if (i0Var == i0.f()) {
            this.f96991t = Math.max(0, 255);
            this.f96992u = 0;
            this.f96983j = Math.min(255, 0);
        } else {
            int iAlpha = Color.alpha(dVarC.f90101d.f90178a);
            this.f96991t = Math.max(iAlpha, 255);
            this.f96992u = iAlpha;
            this.f96983j = Math.min(255, iAlpha * 3);
        }
        this.f96994w = i0Var.f51590f;
        i();
    }
}
