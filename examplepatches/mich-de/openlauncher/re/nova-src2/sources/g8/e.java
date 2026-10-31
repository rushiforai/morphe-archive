package g8;

import android.graphics.Paint;
import android.graphics.RectF;

/* loaded from: classes2.dex */
public final class e {

    /* renamed from: a, reason: collision with root package name */
    public final RectF f57205a = new RectF();

    /* renamed from: b, reason: collision with root package name */
    public final Paint f57206b;

    /* renamed from: c, reason: collision with root package name */
    public final c f57207c;

    /* renamed from: d, reason: collision with root package name */
    public float f57208d;

    /* renamed from: e, reason: collision with root package name */
    public float f57209e;

    /* renamed from: f, reason: collision with root package name */
    public float f57210f;

    /* renamed from: g, reason: collision with root package name */
    public float f57211g;

    /* renamed from: h, reason: collision with root package name */
    public float f57212h;

    /* renamed from: i, reason: collision with root package name */
    public int[] f57213i;

    /* renamed from: j, reason: collision with root package name */
    public int f57214j;

    /* renamed from: k, reason: collision with root package name */
    public float f57215k;

    /* renamed from: l, reason: collision with root package name */
    public float f57216l;

    /* renamed from: m, reason: collision with root package name */
    public float f57217m;
    public float n;
    public double o;

    /* renamed from: p, reason: collision with root package name */
    public int f57218p;

    /* renamed from: q, reason: collision with root package name */
    public final Paint f57219q;

    public e(c cVar) {
        Paint paint = new Paint();
        this.f57206b = paint;
        Paint paint2 = new Paint();
        this.f57208d = 0.0f;
        this.f57209e = 0.0f;
        this.f57210f = 0.0f;
        this.f57211g = 5.0f;
        this.f57212h = 2.5f;
        this.f57219q = new Paint();
        this.f57207c = cVar;
        paint.setStrokeCap(Paint.Cap.SQUARE);
        paint.setAntiAlias(true);
        paint.setStyle(Paint.Style.STROKE);
        paint2.setStyle(Paint.Style.FILL);
        paint2.setAntiAlias(true);
    }

    public final void a() {
        this.f57207c.invalidateDrawable(null);
    }
}
