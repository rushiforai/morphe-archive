package uf;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Rect;
import android.text.Layout;
import android.text.StaticLayout;
import android.text.TextPaint;

/* loaded from: classes3.dex */
public final class v {
    public int A;
    public int B;
    public int C;
    public int D;
    public StaticLayout E;
    public StaticLayout F;
    public int G;
    public int H;
    public int I;
    public Rect J;

    /* renamed from: a, reason: collision with root package name */
    public final float f91240a;

    /* renamed from: b, reason: collision with root package name */
    public final float f91241b;

    /* renamed from: c, reason: collision with root package name */
    public final float f91242c;

    /* renamed from: d, reason: collision with root package name */
    public final float f91243d;

    /* renamed from: e, reason: collision with root package name */
    public final float f91244e;

    /* renamed from: f, reason: collision with root package name */
    public final TextPaint f91245f;

    /* renamed from: g, reason: collision with root package name */
    public final Paint f91246g;

    /* renamed from: h, reason: collision with root package name */
    public final Paint f91247h;

    /* renamed from: i, reason: collision with root package name */
    public CharSequence f91248i;

    /* renamed from: j, reason: collision with root package name */
    public Layout.Alignment f91249j;

    /* renamed from: k, reason: collision with root package name */
    public Bitmap f91250k;

    /* renamed from: l, reason: collision with root package name */
    public float f91251l;

    /* renamed from: m, reason: collision with root package name */
    public int f91252m;
    public int n;
    public float o;

    /* renamed from: p, reason: collision with root package name */
    public int f91253p;

    /* renamed from: q, reason: collision with root package name */
    public float f91254q;

    /* renamed from: r, reason: collision with root package name */
    public float f91255r;

    /* renamed from: s, reason: collision with root package name */
    public int f91256s;

    /* renamed from: t, reason: collision with root package name */
    public int f91257t;

    /* renamed from: u, reason: collision with root package name */
    public int f91258u;

    /* renamed from: v, reason: collision with root package name */
    public int f91259v;

    /* renamed from: w, reason: collision with root package name */
    public int f91260w;

    /* renamed from: x, reason: collision with root package name */
    public float f91261x;

    /* renamed from: y, reason: collision with root package name */
    public float f91262y;

    /* renamed from: z, reason: collision with root package name */
    public float f91263z;

    public v(Context context) {
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(null, new int[]{16843287, 16843288}, 0, 0);
        this.f91244e = typedArrayObtainStyledAttributes.getDimensionPixelSize(0, 0);
        this.f91243d = typedArrayObtainStyledAttributes.getFloat(1, 1.0f);
        typedArrayObtainStyledAttributes.recycle();
        float fRound = Math.round((context.getResources().getDisplayMetrics().densityDpi * 2.0f) / 160.0f);
        this.f91240a = fRound;
        this.f91241b = fRound;
        this.f91242c = fRound;
        TextPaint textPaint = new TextPaint();
        this.f91245f = textPaint;
        textPaint.setAntiAlias(true);
        textPaint.setSubpixelText(true);
        Paint paint = new Paint();
        this.f91246g = paint;
        paint.setAntiAlias(true);
        paint.setStyle(Paint.Style.FILL);
        Paint paint2 = new Paint();
        this.f91247h = paint2;
        paint2.setAntiAlias(true);
        paint2.setFilterBitmap(true);
    }

    public final void a(Canvas canvas, boolean z11) {
        Canvas canvas2;
        if (!z11) {
            this.J.getClass();
            this.f91250k.getClass();
            canvas.drawBitmap(this.f91250k, (Rect) null, this.J, this.f91247h);
            return;
        }
        StaticLayout staticLayout = this.E;
        StaticLayout staticLayout2 = this.F;
        if (staticLayout == null || staticLayout2 == null) {
            return;
        }
        int iSave = canvas.save();
        canvas.translate(this.G, this.H);
        if (Color.alpha(this.f91258u) > 0) {
            int i5 = this.f91258u;
            Paint paint = this.f91246g;
            paint.setColor(i5);
            canvas2 = canvas;
            canvas2.drawRect(-this.I, 0.0f, staticLayout.getWidth() + this.I, staticLayout.getHeight(), paint);
        } else {
            canvas2 = canvas;
        }
        int i11 = this.f91260w;
        TextPaint textPaint = this.f91245f;
        if (i11 == 1) {
            textPaint.setStrokeJoin(Paint.Join.ROUND);
            textPaint.setStrokeWidth(this.f91240a);
            textPaint.setColor(this.f91259v);
            textPaint.setStyle(Paint.Style.FILL_AND_STROKE);
            staticLayout2.draw(canvas2);
        } else {
            float f11 = this.f91241b;
            if (i11 == 2) {
                float f12 = this.f91242c;
                textPaint.setShadowLayer(f11, f12, f12, this.f91259v);
            } else if (i11 == 3 || i11 == 4) {
                boolean z12 = i11 == 3;
                int i12 = z12 ? -1 : this.f91259v;
                int i13 = z12 ? this.f91259v : -1;
                float f13 = f11 / 2.0f;
                textPaint.setColor(this.f91256s);
                textPaint.setStyle(Paint.Style.FILL);
                float f14 = -f13;
                textPaint.setShadowLayer(f11, f14, f14, i12);
                staticLayout2.draw(canvas2);
                textPaint.setShadowLayer(f11, f13, f13, i13);
            }
        }
        textPaint.setColor(this.f91256s);
        textPaint.setStyle(Paint.Style.FILL);
        staticLayout.draw(canvas2);
        textPaint.setShadowLayer(0.0f, 0.0f, 0.0f, 0);
        canvas2.restoreToCount(iSave);
    }
}
