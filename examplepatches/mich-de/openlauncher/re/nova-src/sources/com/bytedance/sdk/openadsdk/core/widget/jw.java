package com.bytedance.sdk.openadsdk.core.widget;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.RectF;
import android.graphics.Shader;
import android.view.View;
import java.util.ArrayList;
import java.util.Iterator;

/* loaded from: classes2.dex */
public class jw extends View {
    private static final int[] ycx = {Color.parseColor("#1AFFFFFF"), Color.parseColor("#4DFFFFFF"), Color.parseColor("#99FFFFFF")};

    /* renamed from: dj, reason: collision with root package name */
    private final ArrayList<ycx> f26313dj;
    private int fby;

    /* renamed from: jw, reason: collision with root package name */
    private int f26314jw;

    /* renamed from: lt, reason: collision with root package name */
    private final Paint f26315lt;
    private final Paint lud;
    private final RectF sya;

    /* renamed from: ul, reason: collision with root package name */
    private int f26316ul;

    /* renamed from: zb, reason: collision with root package name */
    private final RectF f26317zb;

    public static final class ycx {

        /* renamed from: dj, reason: collision with root package name */
        float f26318dj;
        float sya;
        public Paint ycx;

        /* renamed from: zb, reason: collision with root package name */
        public float f26319zb;

        public ycx(Paint paint, float f11, float f12, float f13) {
            this.ycx = paint;
            this.f26319zb = f11;
            this.sya = f12;
            this.f26318dj = f13;
        }
    }

    public jw(Context context) {
        super(context);
        this.f26317zb = new RectF();
        this.sya = new RectF();
        this.f26313dj = new ArrayList<>();
        this.f26315lt = new Paint();
        Paint paint = new Paint();
        this.lud = paint;
        paint.setColor(Color.parseColor("#D9D9D9"));
    }

    private void ycx() {
        if (this.f26316ul <= 0) {
            return;
        }
        int width = (int) (((this.fby * 1.0f) / 100.0f) * getWidth());
        this.sya.right = Math.max(this.f26314jw, width);
        invalidate();
    }

    @Override // android.view.View
    public void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        RectF rectF = this.f26317zb;
        int i5 = this.f26316ul;
        canvas.drawRoundRect(rectF, i5, i5, this.lud);
        RectF rectF2 = this.sya;
        int i11 = this.f26316ul;
        canvas.drawRoundRect(rectF2, i11, i11, this.f26315lt);
        int iSave = canvas.save();
        canvas.translate(this.sya.right - this.f26314jw, 0.0f);
        Iterator<ycx> it = this.f26313dj.iterator();
        while (it.hasNext()) {
            ycx next = it.next();
            canvas.drawCircle(next.sya, next.f26318dj, next.f26319zb, next.ycx);
        }
        canvas.restoreToCount(iSave);
    }

    @Override // android.view.View
    public void onSizeChanged(int i5, int i11, int i12, int i13) {
        super.onSizeChanged(i5, i11, i12, i13);
        int i14 = i11 / 2;
        this.f26316ul = i14;
        this.f26314jw = i14 * 5;
        float f11 = i5;
        float f12 = i11;
        this.f26317zb.set(0.0f, 0.0f, f11, f12);
        this.sya.set(0.0f, 0.0f, 0.0f, f12);
        this.f26315lt.setShader(new LinearGradient(0.0f, 0.0f, f11, f12, new int[]{Color.parseColor("#90C0FF"), Color.parseColor("#196BE4")}, (float[]) null, Shader.TileMode.CLAMP));
        this.f26313dj.clear();
        float f13 = this.f26316ul / 4.0f;
        for (int i15 : ycx) {
            Paint paint = new Paint();
            paint.setColor(i15);
            this.f26313dj.add(new ycx(paint, this.f26316ul / 2.0f, f13, f12 / 2.0f));
            f13 += (this.f26316ul / 2.0f) * 3.0f;
        }
        ycx();
    }

    public void setProgress(int i5) {
        int i11 = this.fby;
        if (i11 == i5) {
            return;
        }
        if (i5 < 0) {
            i5 = 0;
        } else if (i5 > 100) {
            i5 = 100;
        }
        if (i11 == i5) {
            return;
        }
        this.fby = i5;
        ycx();
    }
}
