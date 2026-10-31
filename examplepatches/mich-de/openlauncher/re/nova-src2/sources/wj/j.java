package wj;

import ai.u1;
import android.animation.ObjectAnimator;
import android.content.ContentResolver;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.provider.Settings;

/* loaded from: classes3.dex */
public final class j extends l {

    /* renamed from: q, reason: collision with root package name */
    public static final i f94442q = new i(0);

    /* renamed from: l, reason: collision with root package name */
    public final u1 f94443l;

    /* renamed from: m, reason: collision with root package name */
    public final z5.d f94444m;
    public final z5.c n;
    public final m o;

    /* renamed from: p, reason: collision with root package name */
    public boolean f94445p;

    public j(Context context, d dVar, u1 u1Var) {
        super(context, dVar);
        this.f94445p = false;
        this.f94443l = u1Var;
        this.o = new m();
        z5.d dVar2 = new z5.d();
        this.f94444m = dVar2;
        dVar2.a(1.0f);
        dVar2.b(50.0f);
        z5.c cVar = new z5.c(this, f94442q);
        this.n = cVar;
        cVar.f98238m = dVar2;
        if (this.f94456h != 1.0f) {
            this.f94456h = 1.0f;
            invalidateSelf();
        }
    }

    @Override // wj.l
    public final boolean d(boolean z11, boolean z12, boolean z13) {
        boolean zD = super.d(z11, z12, z13);
        ContentResolver contentResolver = this.f94449a.getContentResolver();
        this.f94451c.getClass();
        float f11 = Settings.Global.getFloat(contentResolver, "animator_duration_scale", 1.0f);
        if (f11 == 0.0f) {
            this.f94445p = true;
            return zD;
        }
        this.f94445p = false;
        this.f94444m.b(50.0f / f11);
        return zD;
    }

    @Override // android.graphics.drawable.Drawable
    public final void draw(Canvas canvas) {
        Rect rect = new Rect();
        if (!getBounds().isEmpty() && isVisible() && canvas.getClipBounds(rect)) {
            canvas.save();
            Rect bounds = getBounds();
            float fB = b();
            ObjectAnimator objectAnimator = this.f94452d;
            boolean z11 = objectAnimator != null && objectAnimator.isRunning();
            ObjectAnimator objectAnimator2 = this.f94453e;
            boolean z12 = objectAnimator2 != null && objectAnimator2.isRunning();
            u1 u1Var = this.f94443l;
            ((d) u1Var.f13368a).a();
            u1Var.g(canvas, bounds, fB, z11, z12);
            Paint.Style style = Paint.Style.FILL;
            Paint paint = this.f94457i;
            paint.setStyle(style);
            paint.setAntiAlias(true);
            d dVar = this.f94450b;
            int i5 = dVar.f94415c[0];
            m mVar = this.o;
            mVar.f94461c = i5;
            int iE = dVar.f94419g;
            if (iE > 0) {
                if (!(this.f94443l instanceof o)) {
                    iE = (int) ((v4.a.e(mVar.f94460b, 0.0f, 0.01f) * iE) / 0.01f);
                }
                this.f94443l.l(canvas, paint, mVar.f94460b, 1.0f, dVar.f94416d, this.f94458j, iE);
            } else {
                this.f94443l.l(canvas, paint, 0.0f, 1.0f, dVar.f94416d, this.f94458j, 0);
            }
            this.f94443l.k(canvas, paint, mVar, this.f94458j);
            this.f94443l.j(canvas, paint, dVar.f94415c[0], this.f94458j);
            canvas.restore();
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final int getIntrinsicHeight() {
        return this.f94443l.p();
    }

    @Override // android.graphics.drawable.Drawable
    public final int getIntrinsicWidth() {
        return this.f94443l.q();
    }

    @Override // android.graphics.drawable.Drawable
    public final void jumpToCurrentState() {
        this.n.d();
        this.o.f94460b = getLevel() / 10000.0f;
        invalidateSelf();
    }

    @Override // android.graphics.drawable.Drawable
    public final boolean onLevelChange(int i5) {
        boolean z11 = this.f94445p;
        m mVar = this.o;
        z5.c cVar = this.n;
        if (z11) {
            cVar.d();
            mVar.f94460b = i5 / 10000.0f;
            invalidateSelf();
            return true;
        }
        cVar.f98227b = mVar.f94460b * 10000.0f;
        cVar.f98228c = true;
        float f11 = i5;
        if (cVar.f98231f) {
            cVar.n = f11;
            return true;
        }
        if (cVar.f98238m == null) {
            cVar.f98238m = new z5.d(f11);
        }
        cVar.f98238m.f98247i = f11;
        cVar.e();
        return true;
    }
}
