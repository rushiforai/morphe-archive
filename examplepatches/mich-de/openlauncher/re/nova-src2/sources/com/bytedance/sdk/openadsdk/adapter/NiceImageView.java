package com.bytedance.sdk.openadsdk.adapter;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.RectF;
import android.graphics.Xfermode;
import android.os.Build;
import android.util.AttributeSet;
import com.bytedance.sdk.openadsdk.core.lt.dj;
import com.bytedance.sdk.openadsdk.utils.dc;

/* loaded from: classes2.dex */
public class NiceImageView extends dj {

    /* renamed from: dj, reason: collision with root package name */
    private int f24639dj;

    /* renamed from: dv, reason: collision with root package name */
    private Path f24640dv;

    /* renamed from: dy, reason: collision with root package name */
    private int f24641dy;

    /* renamed from: ea, reason: collision with root package name */
    private int f24642ea;
    private int fby;
    private RectF htf;

    /* renamed from: jc, reason: collision with root package name */
    private int f24643jc;

    /* renamed from: jw, reason: collision with root package name */
    private int f24644jw;

    /* renamed from: lt, reason: collision with root package name */
    private int f24645lt;
    private int lud;

    /* renamed from: ok, reason: collision with root package name */
    private int f24646ok;
    private final float[] pmi;

    /* renamed from: ry, reason: collision with root package name */
    private int f24647ry;
    private boolean sya;
    private int syc;
    private final RectF thx;

    /* renamed from: tn, reason: collision with root package name */
    private final Path f24648tn;

    /* renamed from: uh, reason: collision with root package name */
    private final float[] f24649uh;

    /* renamed from: ul, reason: collision with root package name */
    private int f24650ul;
    private float wie;
    private final Paint wwx;
    private final Xfermode xkz;
    private final Context ycx;

    /* renamed from: zb, reason: collision with root package name */
    private boolean f24651zb;

    public NiceImageView(Context context) {
        this(context, null);
    }

    private void dj() {
        if (this.f24651zb) {
            return;
        }
        this.f24645lt = 0;
    }

    private void sya() {
        if (this.f24651zb) {
            return;
        }
        int i5 = 0;
        if (this.fby <= 0) {
            float[] fArr = this.pmi;
            int i11 = this.f24644jw;
            float f11 = i11;
            fArr[1] = f11;
            fArr[0] = f11;
            int i12 = this.f24643jc;
            float f12 = i12;
            fArr[3] = f12;
            fArr[2] = f12;
            int i13 = this.f24646ok;
            float f13 = i13;
            fArr[5] = f13;
            fArr[4] = f13;
            int i14 = this.f24642ea;
            float f14 = i14;
            fArr[7] = f14;
            fArr[6] = f14;
            float[] fArr2 = this.f24649uh;
            int i15 = this.f24639dj;
            float f15 = i11 - (i15 / 2.0f);
            fArr2[1] = f15;
            fArr2[0] = f15;
            float f16 = i12 - (i15 / 2.0f);
            fArr2[3] = f16;
            fArr2[2] = f16;
            float f17 = i13 - (i15 / 2.0f);
            fArr2[5] = f17;
            fArr2[4] = f17;
            float f18 = i14 - (i15 / 2.0f);
            fArr2[7] = f18;
            fArr2[6] = f18;
            return;
        }
        while (true) {
            float[] fArr3 = this.pmi;
            if (i5 >= fArr3.length) {
                return;
            }
            int i16 = this.fby;
            fArr3[i5] = i16;
            this.f24649uh[i5] = i16 - (this.f24639dj / 2.0f);
            i5++;
        }
    }

    private void ycx(Canvas canvas) {
        if (!this.f24651zb) {
            int i5 = this.f24639dj;
            if (i5 > 0) {
                ycx(canvas, i5, this.lud, this.thx, this.pmi);
                return;
            }
            return;
        }
        int i11 = this.f24639dj;
        if (i11 > 0) {
            ycx(canvas, i11, this.lud, this.wie - (i11 / 2.0f));
        }
        int i12 = this.f24645lt;
        if (i12 > 0) {
            ycx(canvas, i12, this.f24650ul, (this.wie - this.f24639dj) - (i12 / 2.0f));
        }
    }

    private void zb() {
        if (!this.f24651zb) {
            this.htf.set(0.0f, 0.0f, this.syc, this.f24641dy);
            if (this.sya) {
                this.htf = this.thx;
                return;
            }
            return;
        }
        float fMin = Math.min(this.syc, this.f24641dy) / 2.0f;
        this.wie = fMin;
        RectF rectF = this.htf;
        int i5 = this.syc;
        int i11 = this.f24641dy;
        rectF.set((i5 / 2.0f) - fMin, (i11 / 2.0f) - fMin, (i5 / 2.0f) + fMin, (i11 / 2.0f) + fMin);
    }

    public void isCircle(boolean z11) {
        this.f24651zb = z11;
        dj();
        zb();
        invalidate();
    }

    public void isCoverSrc(boolean z11) {
        this.sya = z11;
        zb();
        invalidate();
    }

    @Override // android.widget.ImageView, android.view.View
    public void onDraw(Canvas canvas) {
        canvas.saveLayer(this.htf, null, 31);
        if (!this.sya) {
            int i5 = this.syc;
            int i11 = this.f24639dj;
            int i12 = this.f24645lt;
            int i13 = this.f24641dy;
            canvas.scale((((i5 - (i11 * 2)) - (i12 * 2)) * 1.0f) / i5, (((i13 - (i11 * 2)) - (i12 * 2)) * 1.0f) / i13, i5 / 2.0f, i13 / 2.0f);
        }
        super.onDraw(canvas);
        this.wwx.reset();
        this.f24648tn.reset();
        if (this.f24651zb) {
            this.f24648tn.addCircle(this.syc / 2.0f, this.f24641dy / 2.0f, this.wie, Path.Direction.CCW);
        } else {
            this.f24648tn.addRoundRect(this.htf, this.f24649uh, Path.Direction.CCW);
        }
        this.wwx.setAntiAlias(true);
        this.wwx.setStyle(Paint.Style.FILL);
        this.wwx.setXfermode(this.xkz);
        if (Build.VERSION.SDK_INT <= 27) {
            canvas.drawPath(this.f24648tn, this.wwx);
        } else {
            this.f24640dv.addRect(this.htf, Path.Direction.CCW);
            this.f24640dv.op(this.f24648tn, Path.Op.DIFFERENCE);
            canvas.drawPath(this.f24640dv, this.wwx);
        }
        this.wwx.setXfermode(null);
        int i14 = this.f24647ry;
        if (i14 != 0) {
            this.wwx.setColor(i14);
            canvas.drawPath(this.f24648tn, this.wwx);
        }
        canvas.restore();
        ycx(canvas);
    }

    @Override // android.view.View
    public void onSizeChanged(int i5, int i11, int i12, int i13) {
        super.onSizeChanged(i5, i11, i12, i13);
        this.syc = i5;
        this.f24641dy = i11;
        ycx();
        zb();
    }

    public void setBorderColor(int i5) {
        this.lud = i5;
        invalidate();
    }

    public void setBorderWidth(int i5) {
        this.f24639dj = dc.zb(this.ycx, i5);
        ycx(false);
    }

    public void setCornerBottomLeftRadius(int i5) {
        this.f24642ea = dc.zb(this.ycx, i5);
        ycx(true);
    }

    public void setCornerBottomRightRadius(int i5) {
        this.f24646ok = dc.zb(this.ycx, i5);
        ycx(true);
    }

    public void setCornerRadius(int i5) {
        this.fby = dc.zb(this.ycx, i5);
        ycx(false);
    }

    public void setCornerTopLeftRadius(int i5) {
        this.f24644jw = dc.zb(this.ycx, i5);
        ycx(true);
    }

    public void setCornerTopRightRadius(int i5) {
        this.f24643jc = dc.zb(this.ycx, i5);
        ycx(true);
    }

    public void setInnerBorderColor(int i5) {
        this.f24650ul = i5;
        invalidate();
    }

    public void setInnerBorderWidth(int i5) {
        this.f24645lt = dc.zb(this.ycx, i5);
        dj();
        invalidate();
    }

    public void setMaskColor(int i5) {
        this.f24647ry = i5;
        invalidate();
    }

    public NiceImageView(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public NiceImageView(Context context, AttributeSet attributeSet, int i5) {
        super(context, attributeSet, i5);
        this.lud = -1;
        this.f24650ul = -1;
        this.ycx = context;
        this.fby = dc.zb(context, 10.0f);
        this.pmi = new float[8];
        this.f24649uh = new float[8];
        this.thx = new RectF();
        this.htf = new RectF();
        this.wwx = new Paint();
        this.f24648tn = new Path();
        if (Build.VERSION.SDK_INT <= 27) {
            this.xkz = new PorterDuffXfermode(PorterDuff.Mode.DST_IN);
        } else {
            this.xkz = new PorterDuffXfermode(PorterDuff.Mode.DST_OUT);
            this.f24640dv = new Path();
        }
        sya();
        dj();
    }

    private void ycx(Canvas canvas, int i5, int i11, float f11) {
        ycx(i5, i11);
        this.f24648tn.addCircle(this.syc / 2.0f, this.f24641dy / 2.0f, f11, Path.Direction.CCW);
        canvas.drawPath(this.f24648tn, this.wwx);
    }

    private void ycx(Canvas canvas, int i5, int i11, RectF rectF, float[] fArr) {
        ycx(i5, i11);
        this.f24648tn.addRoundRect(rectF, fArr, Path.Direction.CCW);
        canvas.drawPath(this.f24648tn, this.wwx);
    }

    private void ycx(int i5, int i11) {
        this.f24648tn.reset();
        this.wwx.setStrokeWidth(i5);
        this.wwx.setColor(i11);
        this.wwx.setStyle(Paint.Style.STROKE);
    }

    private void ycx() {
        if (this.f24651zb) {
            return;
        }
        RectF rectF = this.thx;
        int i5 = this.f24639dj;
        rectF.set(i5 / 2.0f, i5 / 2.0f, this.syc - (i5 / 2.0f), this.f24641dy - (i5 / 2.0f));
    }

    private void ycx(boolean z11) {
        if (z11) {
            this.fby = 0;
        }
        sya();
        ycx();
        invalidate();
    }
}
