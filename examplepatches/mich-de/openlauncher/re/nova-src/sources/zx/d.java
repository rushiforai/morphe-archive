package zx;

import android.view.animation.AccelerateInterpolator;
import android.view.animation.DecelerateInterpolator;
import o9.o2;

/* loaded from: classes4.dex */
public abstract class d {

    /* renamed from: a, reason: collision with root package name */
    public static final o2 f98805a = new o2();

    /* renamed from: b, reason: collision with root package name */
    public static final AccelerateInterpolator f98806b = new AccelerateInterpolator(1.0f);

    /* renamed from: c, reason: collision with root package name */
    public static final AccelerateInterpolator f98807c = new AccelerateInterpolator(1.5f);

    /* renamed from: d, reason: collision with root package name */
    public static final DecelerateInterpolator f98808d = new DecelerateInterpolator(1.0f);

    /* renamed from: e, reason: collision with root package name */
    public static final DecelerateInterpolator f98809e = new DecelerateInterpolator(0.75f);

    /* renamed from: f, reason: collision with root package name */
    public static final DecelerateInterpolator f98810f = new DecelerateInterpolator(1.5f);

    /* renamed from: g, reason: collision with root package name */
    public static final DecelerateInterpolator f98811g;

    /* renamed from: h, reason: collision with root package name */
    public static final c f98812h;

    /* renamed from: i, reason: collision with root package name */
    public static final c f98813i;

    /* renamed from: j, reason: collision with root package name */
    public static final f6.a f98814j;

    static {
        new DecelerateInterpolator(2.0f);
        f98811g = new DecelerateInterpolator(3.0f);
        f98812h = new c(1);
        f98813i = new c(0);
        f98814j = new f6.a(1);
    }
}
