package wj;

import android.animation.ObjectAnimator;
import android.animation.ValueAnimator;
import android.content.ContentResolver;
import android.content.Context;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.Drawable;
import android.provider.Settings;
import java.util.ArrayList;

/* loaded from: classes3.dex */
public abstract class l extends Drawable implements Animatable {

    /* renamed from: k, reason: collision with root package name */
    public static final jz.b f94448k = new jz.b(5, Float.class, "growFraction");

    /* renamed from: a, reason: collision with root package name */
    public final Context f94449a;

    /* renamed from: b, reason: collision with root package name */
    public final d f94450b;

    /* renamed from: d, reason: collision with root package name */
    public ObjectAnimator f94452d;

    /* renamed from: e, reason: collision with root package name */
    public ObjectAnimator f94453e;

    /* renamed from: f, reason: collision with root package name */
    public ArrayList f94454f;

    /* renamed from: g, reason: collision with root package name */
    public boolean f94455g;

    /* renamed from: h, reason: collision with root package name */
    public float f94456h;

    /* renamed from: j, reason: collision with root package name */
    public int f94458j;

    /* renamed from: i, reason: collision with root package name */
    public final Paint f94457i = new Paint();

    /* renamed from: c, reason: collision with root package name */
    public final w6.b f94451c = new w6.b();

    public l(Context context, d dVar) {
        this.f94449a = context;
        this.f94450b = dVar;
        setAlpha(255);
    }

    public final float b() {
        d dVar = this.f94450b;
        if (dVar.f94417e == 0 && dVar.f94418f == 0) {
            return 1.0f;
        }
        return this.f94456h;
    }

    public final boolean c(boolean z11, boolean z12, boolean z13) {
        ContentResolver contentResolver = this.f94449a.getContentResolver();
        this.f94451c.getClass();
        return d(z11, z12, z13 && Settings.Global.getFloat(contentResolver, "animator_duration_scale", 1.0f) > 0.0f);
    }

    public boolean d(boolean z11, boolean z12, boolean z13) {
        ObjectAnimator objectAnimator = this.f94452d;
        int i5 = 0;
        jz.b bVar = f94448k;
        if (objectAnimator == null) {
            ObjectAnimator objectAnimatorOfFloat = ObjectAnimator.ofFloat(this, bVar, 0.0f, 1.0f);
            this.f94452d = objectAnimatorOfFloat;
            objectAnimatorOfFloat.setDuration(500L);
            this.f94452d.setInterpolator(cj.a.f19952b);
            ObjectAnimator objectAnimator2 = this.f94452d;
            if (objectAnimator2 != null && objectAnimator2.isRunning()) {
                throw new IllegalArgumentException("Cannot set showAnimator while the current showAnimator is running.");
            }
            this.f94452d = objectAnimator2;
            objectAnimator2.addListener(new k(this, i5));
        }
        int i11 = 1;
        if (this.f94453e == null) {
            ObjectAnimator objectAnimatorOfFloat2 = ObjectAnimator.ofFloat(this, bVar, 1.0f, 0.0f);
            this.f94453e = objectAnimatorOfFloat2;
            objectAnimatorOfFloat2.setDuration(500L);
            this.f94453e.setInterpolator(cj.a.f19952b);
            ObjectAnimator objectAnimator3 = this.f94453e;
            if (objectAnimator3 != null && objectAnimator3.isRunning()) {
                throw new IllegalArgumentException("Cannot set hideAnimator while the current hideAnimator is running.");
            }
            this.f94453e = objectAnimator3;
            objectAnimator3.addListener(new k(this, i11));
        }
        if (isVisible() || z11) {
            ObjectAnimator objectAnimator4 = z11 ? this.f94452d : this.f94453e;
            ObjectAnimator objectAnimator5 = z11 ? this.f94453e : this.f94452d;
            if (!z13) {
                if (objectAnimator5.isRunning()) {
                    boolean z14 = this.f94455g;
                    this.f94455g = true;
                    new ValueAnimator[]{objectAnimator5}[0].cancel();
                    this.f94455g = z14;
                }
                if (objectAnimator4.isRunning()) {
                    objectAnimator4.end();
                } else {
                    boolean z15 = this.f94455g;
                    this.f94455g = true;
                    new ValueAnimator[]{objectAnimator4}[0].end();
                    this.f94455g = z15;
                }
                return super.setVisible(z11, false);
            }
            if (!objectAnimator4.isRunning()) {
                boolean z16 = !z11 || super.setVisible(z11, false);
                d dVar = this.f94450b;
                if (!z11 ? dVar.f94418f != 0 : dVar.f94417e != 0) {
                    boolean z17 = this.f94455g;
                    this.f94455g = true;
                    new ValueAnimator[]{objectAnimator4}[0].end();
                    this.f94455g = z17;
                    return z16;
                }
                if (z12 || !objectAnimator4.isPaused()) {
                    objectAnimator4.start();
                    return z16;
                }
                objectAnimator4.resume();
                return z16;
            }
        }
        return false;
    }

    public final void e(b bVar) {
        ArrayList arrayList = this.f94454f;
        if (arrayList == null || !arrayList.contains(bVar)) {
            return;
        }
        this.f94454f.remove(bVar);
        if (this.f94454f.isEmpty()) {
            this.f94454f = null;
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final int getAlpha() {
        return this.f94458j;
    }

    @Override // android.graphics.drawable.Drawable
    public final int getOpacity() {
        return -3;
    }

    @Override // android.graphics.drawable.Animatable
    public final boolean isRunning() {
        ObjectAnimator objectAnimator = this.f94452d;
        if (objectAnimator != null && objectAnimator.isRunning()) {
            return true;
        }
        ObjectAnimator objectAnimator2 = this.f94453e;
        return objectAnimator2 != null && objectAnimator2.isRunning();
    }

    @Override // android.graphics.drawable.Drawable
    public final void setAlpha(int i5) {
        this.f94458j = i5;
        invalidateSelf();
    }

    @Override // android.graphics.drawable.Drawable
    public final void setColorFilter(ColorFilter colorFilter) {
        this.f94457i.setColorFilter(colorFilter);
        invalidateSelf();
    }

    @Override // android.graphics.drawable.Drawable
    public final boolean setVisible(boolean z11, boolean z12) {
        return c(z11, z12, true);
    }

    @Override // android.graphics.drawable.Animatable
    public final void start() {
        d(true, true, false);
    }

    @Override // android.graphics.drawable.Animatable
    public final void stop() {
        d(false, true, false);
    }
}
