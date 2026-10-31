package s9;

import android.animation.ArgbEvaluator;
import android.graphics.Path;
import android.view.animation.AccelerateDecelerateInterpolator;
import android.view.animation.AccelerateInterpolator;
import android.view.animation.BaseInterpolator;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.Interpolator;
import android.view.animation.LinearInterpolator;
import android.view.animation.OvershootInterpolator;
import android.view.animation.PathInterpolator;
import androidx.recyclerview.widget.j1;

/* loaded from: classes.dex */
public abstract class k {

    /* renamed from: a, reason: collision with root package name */
    public static final LinearInterpolator f86788a = new LinearInterpolator();

    /* renamed from: b, reason: collision with root package name */
    public static final AccelerateInterpolator f86789b = new AccelerateInterpolator();

    /* renamed from: c, reason: collision with root package name */
    public static final AccelerateInterpolator f86790c;

    /* renamed from: d, reason: collision with root package name */
    public static final AccelerateInterpolator f86791d;

    /* renamed from: e, reason: collision with root package name */
    public static final DecelerateInterpolator f86792e;

    /* renamed from: f, reason: collision with root package name */
    public static final DecelerateInterpolator f86793f;

    /* renamed from: g, reason: collision with root package name */
    public static final DecelerateInterpolator f86794g;

    /* renamed from: h, reason: collision with root package name */
    public static final DecelerateInterpolator f86795h;

    /* renamed from: i, reason: collision with root package name */
    public static final DecelerateInterpolator f86796i;

    /* renamed from: j, reason: collision with root package name */
    public static final DecelerateInterpolator f86797j;

    /* renamed from: k, reason: collision with root package name */
    public static final AccelerateDecelerateInterpolator f86798k;

    /* renamed from: l, reason: collision with root package name */
    public static final PathInterpolator f86799l;

    /* renamed from: m, reason: collision with root package name */
    public static final PathInterpolator f86800m;
    public static final PathInterpolator n;
    public static final PathInterpolator o;

    /* renamed from: p, reason: collision with root package name */
    public static final PathInterpolator f86801p;

    /* renamed from: q, reason: collision with root package name */
    public static final d20.e f86802q;

    /* renamed from: r, reason: collision with root package name */
    public static final d20.e f86803r;

    /* renamed from: s, reason: collision with root package name */
    public static final j1 f86804s;

    /* renamed from: t, reason: collision with root package name */
    public static final j1 f86805t;

    /* renamed from: u, reason: collision with root package name */
    public static final j1 f86806u;

    /* renamed from: v, reason: collision with root package name */
    public static final ArgbEvaluator f86807v;

    static {
        new AccelerateInterpolator(0.5f);
        new AccelerateInterpolator(0.75f);
        f86790c = new AccelerateInterpolator(1.5f);
        f86791d = new AccelerateInterpolator(2.0f);
        f86792e = new DecelerateInterpolator();
        f86793f = new DecelerateInterpolator(1.5f);
        f86794g = new DecelerateInterpolator(1.7f);
        f86795h = new DecelerateInterpolator(2.0f);
        f86796i = new DecelerateInterpolator(2.5f);
        f86797j = new DecelerateInterpolator(3.0f);
        f86798k = new AccelerateDecelerateInterpolator();
        f86799l = new PathInterpolator(0.4f, 0.0f, 0.2f, 1.0f);
        f86800m = new PathInterpolator(0.2f, 0.0f, 0.0f, 1.0f);
        new PathInterpolator(0.6f, 0.0f, 0.4f, 1.0f);
        n = new PathInterpolator(0.0f, 0.0f, 0.2f, 1.0f);
        o = new PathInterpolator(0.4f, 0.0f, 1.0f, 1.0f);
        f86802q = new d20.e(2);
        f86803r = new d20.e(3);
        Path path = new Path();
        path.moveTo(0.0f, 0.0f);
        path.cubicTo(0.05f, 0.0f, 0.133333f, 0.08f, 0.166666f, 0.4f);
        path.cubicTo(0.225f, 0.94f, 0.5f, 1.0f, 1.0f, 1.0f);
        f86801p = new PathInterpolator(path);
        new OvershootInterpolator(1.2f);
        new OvershootInterpolator(1.7f);
        new PathInterpolator(0.3f, 0.0f, 0.1f, 1.0f);
        f86804s = new j1(1);
        f86805t = new j1(2);
        f86806u = new j1(3);
        f86807v = new ArgbEvaluator();
    }

    public static j a(BaseInterpolator baseInterpolator, float f11, float f12) {
        if (f12 >= f11) {
            return new j(f11, f12, baseInterpolator);
        }
        throw new IllegalArgumentException(String.format("upperBound (%f) must be greater than lowerBound (%f)", Float.valueOf(f12), Float.valueOf(f11)));
    }

    public static Interpolator b(float f11) {
        return Math.abs(f11) > 10.0f ? f86805t : f86806u;
    }
}
