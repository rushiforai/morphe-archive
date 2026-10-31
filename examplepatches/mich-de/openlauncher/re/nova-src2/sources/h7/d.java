package h7;

import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;

/* loaded from: classes2.dex */
public final class d {

    /* renamed from: a, reason: collision with root package name */
    public final RectF f59501a = new RectF();

    /* renamed from: b, reason: collision with root package name */
    public final Paint f59502b;

    /* renamed from: c, reason: collision with root package name */
    public final Paint f59503c;

    /* renamed from: d, reason: collision with root package name */
    public final Paint f59504d;

    /* renamed from: e, reason: collision with root package name */
    public float f59505e;

    /* renamed from: f, reason: collision with root package name */
    public float f59506f;

    /* renamed from: g, reason: collision with root package name */
    public float f59507g;

    /* renamed from: h, reason: collision with root package name */
    public float f59508h;

    /* renamed from: i, reason: collision with root package name */
    public int[] f59509i;

    /* renamed from: j, reason: collision with root package name */
    public int f59510j;

    /* renamed from: k, reason: collision with root package name */
    public float f59511k;

    /* renamed from: l, reason: collision with root package name */
    public float f59512l;

    /* renamed from: m, reason: collision with root package name */
    public float f59513m;
    public boolean n;
    public Path o;

    /* renamed from: p, reason: collision with root package name */
    public float f59514p;

    /* renamed from: q, reason: collision with root package name */
    public float f59515q;

    /* renamed from: r, reason: collision with root package name */
    public int f59516r;

    /* renamed from: s, reason: collision with root package name */
    public int f59517s;

    /* renamed from: t, reason: collision with root package name */
    public int f59518t;

    /* renamed from: u, reason: collision with root package name */
    public int f59519u;

    public d() {
        Paint paint = new Paint();
        this.f59502b = paint;
        Paint paint2 = new Paint();
        this.f59503c = paint2;
        Paint paint3 = new Paint();
        this.f59504d = paint3;
        this.f59505e = 0.0f;
        this.f59506f = 0.0f;
        this.f59507g = 0.0f;
        this.f59508h = 5.0f;
        this.f59514p = 1.0f;
        this.f59518t = 255;
        paint.setStrokeCap(Paint.Cap.SQUARE);
        paint.setAntiAlias(true);
        paint.setStyle(Paint.Style.STROKE);
        paint2.setStyle(Paint.Style.FILL);
        paint2.setAntiAlias(true);
        paint3.setColor(0);
    }
}
