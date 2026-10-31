package g8;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.Drawable;
import android.view.animation.AccelerateDecelerateInterpolator;
import android.view.animation.Animation;
import android.view.animation.LinearInterpolator;
import com.teslacoilsw.launcher.widget.MaterialProgressBar;
import h7.g;
import java.util.ArrayList;

/* loaded from: classes2.dex */
public final class f extends Drawable implements Animatable {

    /* renamed from: k, reason: collision with root package name */
    public static final LinearInterpolator f57220k = new LinearInterpolator();

    /* renamed from: l, reason: collision with root package name */
    public static final d f57221l = new d(0);

    /* renamed from: m, reason: collision with root package name */
    public static final d f57222m = new d(1);
    public static final AccelerateDecelerateInterpolator n = new AccelerateDecelerateInterpolator();

    /* renamed from: a, reason: collision with root package name */
    public final ArrayList f57223a = new ArrayList();

    /* renamed from: b, reason: collision with root package name */
    public final e f57224b;

    /* renamed from: c, reason: collision with root package name */
    public float f57225c;

    /* renamed from: d, reason: collision with root package name */
    public final Resources f57226d;

    /* renamed from: e, reason: collision with root package name */
    public final MaterialProgressBar f57227e;

    /* renamed from: f, reason: collision with root package name */
    public final b f57228f;

    /* renamed from: g, reason: collision with root package name */
    public float f57229g;

    /* renamed from: h, reason: collision with root package name */
    public double f57230h;

    /* renamed from: i, reason: collision with root package name */
    public double f57231i;

    /* renamed from: j, reason: collision with root package name */
    public final g f57232j;

    public f(Context context, MaterialProgressBar materialProgressBar) {
        c cVar = new c(this, 0);
        this.f57227e = materialProgressBar;
        this.f57226d = context.getResources();
        e eVar = new e(cVar);
        this.f57224b = eVar;
        eVar.f57213i = new int[]{-16777216};
        eVar.f57214j = 0;
        b(1);
        g gVar = new g(eVar, 4);
        gVar.setInterpolator(n);
        gVar.setDuration(666L);
        gVar.setAnimationListener(new a(this, eVar, 0));
        b bVar = new b(this, eVar);
        bVar.setRepeatCount(-1);
        bVar.setRepeatMode(1);
        bVar.setInterpolator(f57220k);
        bVar.setDuration(1333L);
        bVar.setAnimationListener(new a(this, eVar, 1));
        this.f57232j = gVar;
        this.f57228f = bVar;
    }

    public final void a(double d5, double d11, double d12, double d13, float f11, float f12) {
        float f13 = this.f57226d.getDisplayMetrics().density;
        double d14 = f13;
        this.f57230h = d5 * d14;
        this.f57231i = d11 * d14;
        float f14 = ((float) d13) * f13;
        e eVar = this.f57224b;
        eVar.f57211g = f14;
        eVar.f57206b.setStrokeWidth(f14);
        eVar.a();
        eVar.o = d12 * d14;
        eVar.f57214j = 0;
        float fMin = Math.min((int) this.f57230h, (int) this.f57231i);
        double d15 = eVar.o;
        eVar.f57212h = (d15 <= 0.0d || fMin < 0.0f) ? (float) Math.ceil(eVar.f57211g / 2.0f) : (float) ((fMin / 2.0f) - d15);
    }

    public final void b(int i5) {
        if (i5 == 0) {
            a(56.0d, 56.0d, 12.5d, 3.0d, 12.0f, 6.0f);
        } else {
            a(40.0d, 40.0d, 8.75d, 2.5d, 10.0f, 5.0f);
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final void draw(Canvas canvas) {
        Rect bounds = getBounds();
        int iSave = canvas.save();
        canvas.rotate(this.f57225c, bounds.exactCenterX(), bounds.exactCenterY());
        e eVar = this.f57224b;
        Paint paint = eVar.f57219q;
        RectF rectF = eVar.f57205a;
        rectF.set(bounds);
        float f11 = eVar.f57212h;
        rectF.inset(f11, f11);
        float f12 = eVar.f57208d;
        float f13 = eVar.f57210f;
        float f14 = (f12 + f13) * 360.0f;
        float f15 = ((eVar.f57209e + f13) * 360.0f) - f14;
        Paint paint2 = eVar.f57206b;
        paint2.setColor(eVar.f57213i[eVar.f57214j]);
        canvas.drawArc(rectF, f14, f15, false, paint2);
        if (eVar.f57218p < 255) {
            paint.setColor(0);
            paint.setAlpha(255 - eVar.f57218p);
            canvas.drawCircle(bounds.exactCenterX(), bounds.exactCenterY(), bounds.width() / 2, paint);
        }
        canvas.restoreToCount(iSave);
    }

    @Override // android.graphics.drawable.Drawable
    public final int getAlpha() {
        return this.f57224b.f57218p;
    }

    @Override // android.graphics.drawable.Drawable
    public final int getIntrinsicHeight() {
        return (int) this.f57231i;
    }

    @Override // android.graphics.drawable.Drawable
    public final int getIntrinsicWidth() {
        return (int) this.f57230h;
    }

    @Override // android.graphics.drawable.Drawable
    public final int getOpacity() {
        return -3;
    }

    @Override // android.graphics.drawable.Animatable
    public final boolean isRunning() {
        ArrayList arrayList = this.f57223a;
        int size = arrayList.size();
        for (int i5 = 0; i5 < size; i5++) {
            Animation animation = (Animation) arrayList.get(i5);
            if (animation.hasStarted() && !animation.hasEnded()) {
                return true;
            }
        }
        return false;
    }

    @Override // android.graphics.drawable.Drawable
    public final void setAlpha(int i5) {
        this.f57224b.f57218p = i5;
    }

    @Override // android.graphics.drawable.Drawable
    public final void setColorFilter(ColorFilter colorFilter) {
        e eVar = this.f57224b;
        eVar.f57206b.setColorFilter(colorFilter);
        eVar.a();
    }

    @Override // android.graphics.drawable.Animatable
    public final void start() {
        this.f57228f.reset();
        e eVar = this.f57224b;
        float f11 = eVar.f57208d;
        eVar.f57215k = f11;
        float f12 = eVar.f57209e;
        eVar.f57216l = f12;
        eVar.f57217m = eVar.f57210f;
        MaterialProgressBar materialProgressBar = this.f57227e;
        if (f12 != f11) {
            materialProgressBar.startAnimation(this.f57232j);
            return;
        }
        eVar.f57214j = 0;
        eVar.f57215k = 0.0f;
        eVar.f57216l = 0.0f;
        eVar.f57217m = 0.0f;
        eVar.f57208d = 0.0f;
        eVar.a();
        eVar.f57209e = 0.0f;
        eVar.a();
        eVar.f57210f = 0.0f;
        eVar.a();
        materialProgressBar.startAnimation(this.f57228f);
    }

    @Override // android.graphics.drawable.Animatable
    public final void stop() {
        this.f57227e.clearAnimation();
        this.f57225c = 0.0f;
        invalidateSelf();
        e eVar = this.f57224b;
        eVar.getClass();
        eVar.f57214j = 0;
        eVar.f57215k = 0.0f;
        eVar.f57216l = 0.0f;
        eVar.f57217m = 0.0f;
        eVar.f57208d = 0.0f;
        eVar.a();
        eVar.f57209e = 0.0f;
        eVar.a();
        eVar.f57210f = 0.0f;
        eVar.a();
    }
}
