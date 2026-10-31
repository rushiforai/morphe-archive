package ak;

import android.graphics.Paint;
import android.graphics.Path;

/* loaded from: classes3.dex */
public final class a {

    /* renamed from: i, reason: collision with root package name */
    public static final int[] f13524i = new int[3];

    /* renamed from: j, reason: collision with root package name */
    public static final float[] f13525j = {0.0f, 0.5f, 1.0f};

    /* renamed from: k, reason: collision with root package name */
    public static final int[] f13526k = new int[4];

    /* renamed from: l, reason: collision with root package name */
    public static final float[] f13527l = {0.0f, 0.0f, 0.5f, 1.0f};

    /* renamed from: a, reason: collision with root package name */
    public final Paint f13528a;

    /* renamed from: b, reason: collision with root package name */
    public final Paint f13529b;

    /* renamed from: c, reason: collision with root package name */
    public final Paint f13530c;

    /* renamed from: d, reason: collision with root package name */
    public int f13531d;

    /* renamed from: e, reason: collision with root package name */
    public int f13532e;

    /* renamed from: f, reason: collision with root package name */
    public int f13533f;

    /* renamed from: g, reason: collision with root package name */
    public final Path f13534g = new Path();

    /* renamed from: h, reason: collision with root package name */
    public final Paint f13535h;

    public a() {
        Paint paint = new Paint();
        this.f13535h = paint;
        this.f13528a = new Paint();
        a(-16777216);
        paint.setColor(0);
        Paint paint2 = new Paint(4);
        this.f13529b = paint2;
        paint2.setStyle(Paint.Style.FILL);
        this.f13530c = new Paint(paint2);
    }

    public final void a(int i5) {
        this.f13531d = r4.a.n(i5, 68);
        this.f13532e = r4.a.n(i5, 20);
        this.f13533f = r4.a.n(i5, 0);
        this.f13528a.setColor(this.f13531d);
    }
}
