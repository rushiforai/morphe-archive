package com.bytedance.sdk.openadsdk.core.ry.zb.zb;

import android.animation.Animator;
import android.animation.ValueAnimator;
import android.annotation.SuppressLint;
import android.content.Context;
import android.graphics.Camera;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.view.animation.AccelerateDecelerateInterpolator;

/* loaded from: classes2.dex */
class ycx extends View {
    private final Path aeu;

    /* renamed from: av, reason: collision with root package name */
    private final Path f26065av;
    private zb[] bba;
    private final Path bhi;
    private float dc;

    /* renamed from: dj, reason: collision with root package name */
    private int f26066dj;

    /* renamed from: dv, reason: collision with root package name */
    private final RectF f26067dv;
    private int dwi;

    /* renamed from: dy, reason: collision with root package name */
    private float[] f26068dy;

    /* renamed from: ea, reason: collision with root package name */
    private String[] f26069ea;
    private Paint fby;

    /* renamed from: hf, reason: collision with root package name */
    private final RectF f26070hf;
    private ValueAnimator[] htf;
    private long ifb;

    /* renamed from: jc, reason: collision with root package name */
    private Handler f26071jc;

    /* renamed from: jw, reason: collision with root package name */
    private com.bytedance.adsdk.ugeno.jc.lt.ycx f26072jw;
    private Paint kgy;

    /* renamed from: lt, reason: collision with root package name */
    private float f26073lt;
    private int lud;

    /* renamed from: mp, reason: collision with root package name */
    private C0081ycx[] f26074mp;
    private int nji;
    private int oby;

    /* renamed from: ok, reason: collision with root package name */
    private Camera f26075ok;
    private final RectF oty;
    private boolean[] pmi;

    /* renamed from: rl, reason: collision with root package name */
    private float f26076rl;
    private final Path rmf;
    private final float[] rmy;

    /* renamed from: ry, reason: collision with root package name */
    private Matrix f26077ry;
    private int sya;
    private float[] syc;
    private float sz;
    private float[] thx;

    /* renamed from: tn, reason: collision with root package name */
    private final AccelerateDecelerateInterpolator f26078tn;
    private final RectF tru;

    /* renamed from: uf, reason: collision with root package name */
    private final Runnable f26079uf;

    /* renamed from: uh, reason: collision with root package name */
    private ValueAnimator[] f26080uh;

    /* renamed from: ul, reason: collision with root package name */
    private com.bytedance.sdk.openadsdk.core.ry.zb.zb.zb f26081ul;
    private boolean[] wie;
    private float[] wwx;
    private String[] xkz;
    private float xym;

    /* renamed from: xz, reason: collision with root package name */
    private final float[] f26082xz;
    private int ycx;

    /* renamed from: yi, reason: collision with root package name */
    private float f26083yi;
    private int yzp;

    /* renamed from: zb, reason: collision with root package name */
    private int f26084zb;

    /* renamed from: zr, reason: collision with root package name */
    private float f26085zr;

    /* renamed from: com.bytedance.sdk.openadsdk.core.ry.zb.zb.ycx$ycx, reason: collision with other inner class name */
    public static class C0081ycx implements Animator.AnimatorListener {
        private final int ycx;

        /* renamed from: zb, reason: collision with root package name */
        private final ycx f26086zb;

        public C0081ycx(ycx ycxVar, int i5) {
            this.f26086zb = ycxVar;
            this.ycx = i5;
        }

        @Override // android.animation.Animator.AnimatorListener
        public void onAnimationCancel(Animator animator) {
        }

        @Override // android.animation.Animator.AnimatorListener
        public void onAnimationEnd(Animator animator) {
            this.f26086zb.pmi[this.ycx] = false;
            this.f26086zb.f26069ea[this.ycx] = this.f26086zb.xkz[this.ycx];
        }

        @Override // android.animation.Animator.AnimatorListener
        public void onAnimationRepeat(Animator animator) {
        }

        @Override // android.animation.Animator.AnimatorListener
        public void onAnimationStart(Animator animator) {
        }
    }

    public static class zb implements Animator.AnimatorListener {
        private final int ycx;

        /* renamed from: zb, reason: collision with root package name */
        private final ycx f26087zb;

        public zb(ycx ycxVar, int i5) {
            this.f26087zb = ycxVar;
            this.ycx = i5;
        }

        @Override // android.animation.Animator.AnimatorListener
        public void onAnimationCancel(Animator animator) {
        }

        @Override // android.animation.Animator.AnimatorListener
        public void onAnimationEnd(Animator animator) {
            this.f26087zb.wie[this.ycx] = false;
            this.f26087zb.htf[this.ycx].start();
        }

        @Override // android.animation.Animator.AnimatorListener
        public void onAnimationRepeat(Animator animator) {
        }

        @Override // android.animation.Animator.AnimatorListener
        public void onAnimationStart(Animator animator) {
        }
    }

    public ycx(Context context) {
        super(context);
        this.f26071jc = new Handler(Looper.getMainLooper());
        this.f26069ea = new String[3];
        this.f26075ok = new Camera();
        this.f26077ry = new Matrix();
        this.xkz = new String[3];
        this.syc = new float[3];
        this.f26068dy = new float[3];
        this.wie = new boolean[3];
        this.pmi = new boolean[3];
        this.f26080uh = new ValueAnimator[3];
        this.htf = new ValueAnimator[3];
        this.thx = new float[3];
        this.wwx = new float[3];
        this.f26078tn = new AccelerateDecelerateInterpolator();
        this.f26067dv = new RectF();
        this.oty = new RectF();
        this.f26070hf = new RectF();
        this.tru = new RectF();
        this.bhi = new Path();
        this.f26065av = new Path();
        this.rmf = new Path();
        this.aeu = new Path();
        this.f26082xz = new float[8];
        this.rmy = new float[8];
        this.ifb = 0L;
        this.f26079uf = new Runnable() { // from class: com.bytedance.sdk.openadsdk.core.ry.zb.zb.ycx.1
            @Override // java.lang.Runnable
            public void run() {
                ycx.ycx(ycx.this);
                ycx.this.invalidate();
                if (ycx.this.ycx > 0) {
                    ycx.this.f26071jc.postDelayed(this, 1000L);
                } else {
                    ycx.this.f26071jc.removeCallbacks(this);
                    ycx.this.zb();
                }
            }
        };
        dj();
        lud();
        sya();
    }

    public static /* synthetic */ int ycx(ycx ycxVar) {
        int i5 = ycxVar.ycx;
        ycxVar.ycx = i5 - 1;
        return i5;
    }

    @Override // android.view.View
    @SuppressLint({"DefaultLocale"})
    public void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        if (this.f26066dj <= 0 || this.lud <= 0) {
            return;
        }
        this.f26067dv.set((getWidth() - this.f26066dj) / 2.0f, (getHeight() - this.lud) / 2.0f, (getWidth() + this.f26066dj) / 2.0f, (getHeight() + this.lud) / 2.0f);
        RectF rectF = this.f26067dv;
        float f11 = this.f26073lt;
        canvas.drawRoundRect(rectF, f11, f11, this.fby);
        int i5 = this.ycx;
        this.yzp = i5 / 3600;
        int i11 = i5 % 3600;
        this.dwi = i11;
        this.oby = i11 / 60;
        this.nji = i11 % 60;
        this.dc = this.f26066dj;
        this.sz = this.lud;
        float width = (getWidth() - getPaddingLeft()) - getPaddingRight();
        this.f26083yi = width;
        float f12 = this.dc * 3.0f;
        this.xym = f12;
        float f13 = width - f12;
        this.f26076rl = f13;
        this.f26085zr = f13 > 0.0f ? f13 / 2.0f : 10.0f;
        ycx(this.yzp, this.oby, this.nji);
        float paddingLeft = getPaddingLeft();
        float fCenterY = this.f26067dv.centerY();
        float f14 = this.sz;
        ycx(canvas, paddingLeft, fCenterY - (f14 / 2.0f), this.dc, f14, String.format("%02d", Integer.valueOf(this.yzp)), 0);
        float paddingLeft2 = this.f26085zr + getPaddingLeft() + this.dc;
        float fCenterY2 = this.f26067dv.centerY();
        float f15 = this.sz;
        ycx(canvas, paddingLeft2, fCenterY2 - (f15 / 2.0f), this.dc, f15, String.format("%02d", Integer.valueOf(this.oby)), 1);
        float paddingLeft3 = ((this.dc + this.f26085zr) * 2.0f) + getPaddingLeft();
        float fCenterY3 = this.f26067dv.centerY();
        float f16 = this.sz;
        ycx(canvas, paddingLeft3, fCenterY3 - (f16 / 2.0f), this.dc, f16, String.format("%02d", Integer.valueOf(this.nji)), 2);
        ycx(canvas, (this.f26085zr / 2.0f) + getPaddingLeft() + this.dc, this.f26067dv.centerY());
        ycx(canvas, ((this.f26085zr * 3.0f) / 2.0f) + (this.dc * 2.0f) + getPaddingLeft(), this.f26067dv.centerY());
        com.bytedance.sdk.openadsdk.core.ry.zb.zb.zb zbVar = this.f26081ul;
        if (zbVar != null) {
            zbVar.ycx(canvas);
        }
    }

    @Override // android.view.View
    public void onMeasure(int i5, int i11) {
        com.bytedance.sdk.openadsdk.core.ry.zb.zb.zb zbVar = this.f26081ul;
        if (zbVar == null) {
            super.onMeasure(i5, i11);
            return;
        }
        int[] iArrYcx = zbVar.ycx(i5, i11);
        if (this.lud > 0) {
            int mode = View.MeasureSpec.getMode(iArrYcx[1]);
            int size = View.MeasureSpec.getSize(iArrYcx[1]);
            if (mode == 0 || size > this.lud) {
                iArrYcx[1] = View.MeasureSpec.makeMeasureSpec(this.lud, 1073741824);
            }
        }
        super.onMeasure(iArrYcx[0], iArrYcx[1]);
    }

    private void dj() {
        Paint paint = new Paint();
        this.fby = paint;
        paint.setColor(this.f26084zb);
        this.fby.setAntiAlias(true);
    }

    private void lud() {
        if (this.f26072jw == null) {
            com.bytedance.adsdk.ugeno.jc.lt.ycx ycxVar = new com.bytedance.adsdk.ugeno.jc.lt.ycx(getContext());
            this.f26072jw = ycxVar;
            this.kgy = ycxVar.getPaint();
        }
    }

    private void sya() {
        this.bba = new zb[3];
        this.f26074mp = new C0081ycx[3];
        for (int i5 = 0; i5 < 3; i5++) {
            this.bba[i5] = new zb(this, i5);
            this.f26074mp[i5] = new C0081ycx(this, i5);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void zb(int i5, ValueAnimator valueAnimator) {
        float fFloatValue = ((Float) valueAnimator.getAnimatedValue()).floatValue();
        this.syc[i5] = fFloatValue;
        this.thx[i5] = 1.0f - (fFloatValue / (-90.0f));
        long jCurrentTimeMillis = System.currentTimeMillis();
        if (jCurrentTimeMillis - this.ifb >= 16) {
            invalidate();
            this.ifb = jCurrentTimeMillis;
        }
    }

    public void ycx(int i5, int i11, int i12, int i13, int i14, float f11) {
        int iMin = Math.min(i5, 360060);
        this.f26084zb = i11;
        this.sya = i12;
        this.f26066dj = i13;
        this.lud = i14;
        this.f26073lt = f11;
        this.ycx = iMin;
        this.f26071jc.post(this.f26079uf);
        Paint paint = this.fby;
        if (paint != null) {
            paint.setColor(this.f26084zb);
        }
        float[] fArr = this.f26082xz;
        float f12 = this.f26073lt;
        fArr[3] = f12;
        fArr[2] = f12;
        fArr[1] = f12;
        fArr[0] = f12;
        fArr[7] = 0.0f;
        fArr[6] = 0.0f;
        fArr[5] = 0.0f;
        fArr[4] = 0.0f;
        float[] fArr2 = this.rmy;
        fArr2[3] = 0.0f;
        fArr2[2] = 0.0f;
        fArr2[1] = 0.0f;
        fArr2[0] = 0.0f;
        fArr2[7] = f12;
        fArr2[6] = f12;
        fArr2[5] = f12;
        fArr2[4] = f12;
        invalidate();
    }

    public void zb() {
        for (int i5 = 0; i5 < 3; i5++) {
            ValueAnimator valueAnimator = this.f26080uh[i5];
            if (valueAnimator != null && valueAnimator.isRunning()) {
                this.f26080uh[i5].cancel();
            }
            ValueAnimator valueAnimator2 = this.htf[i5];
            if (valueAnimator2 != null && valueAnimator2.isRunning()) {
                this.htf[i5].cancel();
            }
        }
    }

    public void ycx(com.bytedance.sdk.openadsdk.core.ry.zb.zb.zb zbVar) {
        this.f26081ul = zbVar;
    }

    private void ycx(Canvas canvas, float f11, float f12, float f13, float f14, String str, int i5) {
        this.oty.set(f11, f12, f13 + f11, f14 + f12);
        float fCenterY = this.oty.centerY();
        float fCenterY2 = this.oty.centerY() - ((this.f26072jw.getPaint().ascent() + this.f26072jw.getPaint().descent()) / 2.0f);
        RectF rectF = this.f26070hf;
        RectF rectF2 = this.oty;
        rectF.set(rectF2.left, rectF2.top, rectF2.right, fCenterY);
        this.bhi.reset();
        Path path = this.bhi;
        RectF rectF3 = this.f26070hf;
        float[] fArr = this.f26082xz;
        Path.Direction direction = Path.Direction.CW;
        path.addRoundRect(rectF3, fArr, direction);
        this.fby.setColor(this.f26084zb);
        canvas.drawPath(this.bhi, this.fby);
        this.kgy.setTextAlign(Paint.Align.CENTER);
        canvas.drawText(str, this.oty.centerX(), fCenterY2, this.kgy);
        RectF rectF4 = this.tru;
        RectF rectF5 = this.oty;
        rectF4.set(rectF5.left, fCenterY, rectF5.right, rectF5.bottom);
        this.f26065av.reset();
        this.f26065av.addRoundRect(this.tru, this.rmy, direction);
        this.fby.setColor(this.sya);
        canvas.drawPath(this.f26065av, this.fby);
        canvas.drawText(str, this.oty.centerX(), fCenterY2, this.f26072jw.getPaint());
        boolean z11 = this.wie[i5];
        if (z11 || this.pmi[i5]) {
            if (z11) {
                canvas.save();
                this.f26077ry.reset();
                this.f26075ok.save();
                this.f26075ok.rotateX(this.syc[i5]);
                this.f26075ok.getMatrix(this.f26077ry);
                this.f26077ry.preTranslate(-this.oty.centerX(), -fCenterY);
                this.f26077ry.postTranslate(this.oty.centerX(), fCenterY);
                canvas.concat(this.f26077ry);
                this.rmf.reset();
                this.rmf.addRoundRect(this.f26070hf, this.f26082xz, direction);
                this.fby.setColor(this.f26084zb);
                canvas.drawPath(this.rmf, this.fby);
                int alpha = this.kgy.getAlpha();
                this.kgy.setAlpha((int) (this.thx[i5] * 255.0f));
                canvas.drawText(this.f26069ea[i5], this.oty.centerX(), fCenterY2, this.kgy);
                this.kgy.setAlpha(alpha);
                this.f26075ok.restore();
                canvas.restore();
            }
            if (this.pmi[i5]) {
                canvas.save();
                this.f26077ry.reset();
                this.f26075ok.save();
                this.f26075ok.rotateX(this.f26068dy[i5]);
                this.f26075ok.getMatrix(this.f26077ry);
                this.f26077ry.preTranslate(-this.oty.centerX(), -fCenterY);
                this.f26077ry.postTranslate(this.oty.centerX(), fCenterY);
                canvas.concat(this.f26077ry);
                this.aeu.reset();
                this.aeu.addRoundRect(this.tru, this.rmy, direction);
                this.fby.setColor(this.sya);
                canvas.drawPath(this.aeu, this.fby);
                int alpha2 = this.kgy.getAlpha();
                this.kgy.setAlpha((int) (this.wwx[i5] * 255.0f));
                canvas.drawText(this.xkz[i5], this.oty.centerX(), fCenterY2, this.kgy);
                this.kgy.setAlpha(alpha2);
                this.f26075ok.restore();
                canvas.restore();
            }
        }
    }

    private void ycx(Canvas canvas, float f11, float f12) {
        canvas.drawText(":", f11, f12 - ((this.kgy.ascent() + this.kgy.descent()) / 2.0f), this.kgy);
    }

    @SuppressLint({"DefaultLocale"})
    private void ycx(int i5, int i11, int i12) {
        String str = this.f26069ea[0];
        String str2 = String.format("%02d", Integer.valueOf(i5));
        if (!str2.equals(str) && !this.wie[0] && !this.pmi[0] && str != null) {
            ycx(0, str, str2);
        }
        String str3 = this.f26069ea[1];
        String str4 = String.format("%02d", Integer.valueOf(i11));
        if (!str4.equals(str3) && !this.wie[1] && !this.pmi[1] && str3 != null) {
            ycx(1, str3, str4);
        }
        String str5 = this.f26069ea[2];
        String str6 = String.format("%02d", Integer.valueOf(i12));
        if (!str6.equals(str5) && !this.wie[2] && !this.pmi[2] && str5 != null) {
            ycx(2, str5, str6);
        }
        String[] strArr = this.f26069ea;
        if (strArr[0] == null) {
            strArr[0] = str2;
        }
        if (strArr[1] == null) {
            strArr[1] = str4;
        }
        if (strArr[2] == null) {
            strArr[2] = str6;
        }
    }

    private void ycx(final int i5, String str, String str2) {
        this.f26069ea[i5] = str;
        this.xkz[i5] = str2;
        final int i11 = 1;
        this.wie[i5] = true;
        this.pmi[i5] = true;
        this.syc[i5] = 0.0f;
        this.f26068dy[i5] = 90.0f;
        this.thx[i5] = 1.0f;
        this.wwx[i5] = 0.0f;
        ValueAnimator[] valueAnimatorArr = this.f26080uh;
        ValueAnimator valueAnimator = valueAnimatorArr[i5];
        if (valueAnimator == null) {
            valueAnimatorArr[i5] = ValueAnimator.ofFloat(0.0f, -90.0f);
            this.f26080uh[i5].setDuration(250L);
            this.f26080uh[i5].setInterpolator(this.f26078tn);
            final int i12 = 0;
            this.f26080uh[i5].addUpdateListener(new ValueAnimator.AnimatorUpdateListener(this) { // from class: com.bytedance.sdk.openadsdk.core.ry.zb.zb.a

                /* renamed from: b, reason: collision with root package name */
                public final /* synthetic */ ycx f26063b;

                {
                    this.f26063b = this;
                }

                @Override // android.animation.ValueAnimator.AnimatorUpdateListener
                public final void onAnimationUpdate(ValueAnimator valueAnimator2) {
                    switch (i12) {
                        case 0:
                            this.f26063b.zb(i5, valueAnimator2);
                            break;
                        default:
                            this.f26063b.ycx(i5, valueAnimator2);
                            break;
                    }
                }
            });
            this.f26080uh[i5].addListener(this.bba[i5]);
        } else {
            valueAnimator.setFloatValues(0.0f, -90.0f);
        }
        ValueAnimator[] valueAnimatorArr2 = this.htf;
        ValueAnimator valueAnimator2 = valueAnimatorArr2[i5];
        if (valueAnimator2 == null) {
            valueAnimatorArr2[i5] = ValueAnimator.ofFloat(-90.0f, 0.0f);
            this.htf[i5].setDuration(250L);
            this.htf[i5].setInterpolator(this.f26078tn);
            this.htf[i5].addUpdateListener(new ValueAnimator.AnimatorUpdateListener(this) { // from class: com.bytedance.sdk.openadsdk.core.ry.zb.zb.a

                /* renamed from: b, reason: collision with root package name */
                public final /* synthetic */ ycx f26063b;

                {
                    this.f26063b = this;
                }

                @Override // android.animation.ValueAnimator.AnimatorUpdateListener
                public final void onAnimationUpdate(ValueAnimator valueAnimator22) {
                    switch (i11) {
                        case 0:
                            this.f26063b.zb(i5, valueAnimator22);
                            break;
                        default:
                            this.f26063b.ycx(i5, valueAnimator22);
                            break;
                    }
                }
            });
            this.htf[i5].addListener(this.f26074mp[i5]);
        } else {
            valueAnimator2.setFloatValues(-90.0f, 0.0f);
        }
        if (this.f26080uh[i5].isRunning()) {
            this.f26080uh[i5].cancel();
        }
        if (this.htf[i5].isRunning()) {
            this.htf[i5].cancel();
        }
        this.f26080uh[i5].start();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void ycx(int i5, ValueAnimator valueAnimator) {
        float fFloatValue = ((Float) valueAnimator.getAnimatedValue()).floatValue();
        this.f26068dy[i5] = fFloatValue;
        this.wwx[i5] = (fFloatValue + 90.0f) / 90.0f;
        long jCurrentTimeMillis = System.currentTimeMillis();
        if (jCurrentTimeMillis - this.ifb >= 16) {
            invalidate();
            this.ifb = jCurrentTimeMillis;
        }
    }

    public com.bytedance.adsdk.ugeno.jc.lt.ycx ycx() {
        return this.f26072jw;
    }

    public void ycx(com.bytedance.adsdk.ugeno.jc.lt.ycx ycxVar) {
        this.f26072jw = ycxVar;
    }
}
