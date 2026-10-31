package com.bytedance.adsdk.zb.lt;

import android.view.Choreographer;
import com.bytedance.adsdk.zb.ul;

/* loaded from: classes2.dex */
public class sya extends ycx implements Choreographer.FrameCallback {

    /* renamed from: jc, reason: collision with root package name */
    private ul f22918jc;

    /* renamed from: zb, reason: collision with root package name */
    private float f22922zb = 1.0f;
    private boolean sya = false;

    /* renamed from: dj, reason: collision with root package name */
    private long f22916dj = 0;
    private float lud = 0.0f;

    /* renamed from: lt, reason: collision with root package name */
    private float f22920lt = 0.0f;

    /* renamed from: ul, reason: collision with root package name */
    private int f22921ul = 0;
    private float fby = -2.1474836E9f;

    /* renamed from: jw, reason: collision with root package name */
    private float f22919jw = 2.1474836E9f;
    protected boolean ycx = false;

    /* renamed from: ea, reason: collision with root package name */
    private boolean f22917ea = false;

    private boolean htf() {
        return jc() < 0.0f;
    }

    private void thx() {
        if (this.f22918jc == null) {
            return;
        }
        float f11 = this.f22920lt;
        if (f11 < this.fby || f11 > this.f22919jw) {
            throw new IllegalStateException(String.format("Frame must be [%f,%f]. It is %f", Float.valueOf(this.fby), Float.valueOf(this.f22919jw), Float.valueOf(this.f22920lt)));
        }
    }

    private float uh() {
        ul ulVar = this.f22918jc;
        if (ulVar == null) {
            return Float.MAX_VALUE;
        }
        return (1.0E9f / ulVar.ok()) / Math.abs(this.f22922zb);
    }

    @Override // android.animation.ValueAnimator, android.animation.Animator
    public void cancel() {
        zb();
        pmi();
    }

    public void dj(boolean z11) {
        Choreographer.getInstance().removeFrameCallback(this);
        if (z11) {
            this.ycx = false;
        }
    }

    @Override // android.view.Choreographer.FrameCallback
    public void doFrame(long j11) {
        wie();
        if (this.f22918jc == null || !isRunning()) {
            return;
        }
        com.bytedance.adsdk.zb.lud.ycx("LottieValueAnimator#doFrame");
        float fUh = (this.f22916dj != 0 ? j11 - r1 : 0L) / uh();
        float f11 = this.lud;
        if (htf()) {
            fUh = -fUh;
        }
        float f12 = f11 + fUh;
        boolean zSya = lud.sya(f12, syc(), dy());
        float f13 = this.lud;
        float fZb = lud.zb(f12, syc(), dy());
        this.lud = fZb;
        if (this.f22917ea) {
            fZb = (float) Math.floor(fZb);
        }
        this.f22920lt = fZb;
        this.f22916dj = j11;
        if (!this.f22917ea || this.lud != f13) {
            sya();
        }
        if (!zSya) {
            if (getRepeatCount() == -1 || this.f22921ul < getRepeatCount()) {
                ycx();
                this.f22921ul++;
                if (getRepeatMode() == 2) {
                    this.sya = !this.sya;
                    jw();
                } else {
                    float fDy = htf() ? dy() : syc();
                    this.lud = fDy;
                    this.f22920lt = fDy;
                }
                this.f22916dj = j11;
            } else {
                float fSyc = this.f22922zb < 0.0f ? syc() : dy();
                this.lud = fSyc;
                this.f22920lt = fSyc;
                pmi();
                zb(htf());
            }
        }
        thx();
        com.bytedance.adsdk.zb.lud.zb("LottieValueAnimator#doFrame");
    }

    public float dy() {
        ul ulVar = this.f22918jc;
        if (ulVar == null) {
            return 0.0f;
        }
        float f11 = this.f22919jw;
        return f11 == 2.1474836E9f ? ulVar.ul() : f11;
    }

    public void ea() {
        this.ycx = true;
        ycx(htf());
        ycx((int) (htf() ? dy() : syc()));
        this.f22916dj = 0L;
        this.f22921ul = 0;
        wie();
    }

    public void fby() {
        this.f22918jc = null;
        this.fby = -2.1474836E9f;
        this.f22919jw = 2.1474836E9f;
    }

    @Override // android.animation.ValueAnimator
    public float getAnimatedFraction() {
        float fSyc;
        float fDy;
        float fSyc2;
        if (this.f22918jc == null) {
            return 0.0f;
        }
        if (htf()) {
            fSyc = dy() - this.f22920lt;
            fDy = dy();
            fSyc2 = syc();
        } else {
            fSyc = this.f22920lt - syc();
            fDy = dy();
            fSyc2 = syc();
        }
        return fSyc / (fDy - fSyc2);
    }

    @Override // android.animation.ValueAnimator
    public Object getAnimatedValue() {
        return Float.valueOf(lt());
    }

    @Override // android.animation.ValueAnimator, android.animation.Animator
    public long getDuration() {
        ul ulVar = this.f22918jc;
        if (ulVar == null) {
            return 0L;
        }
        return (long) ulVar.lud();
    }

    @Override // android.animation.ValueAnimator, android.animation.Animator
    public boolean isRunning() {
        return this.ycx;
    }

    public float jc() {
        return this.f22922zb;
    }

    public void jw() {
        sya(-jc());
    }

    public float lt() {
        ul ulVar = this.f22918jc;
        if (ulVar == null) {
            return 0.0f;
        }
        return (this.f22920lt - ulVar.lt()) / (this.f22918jc.ul() - this.f22918jc.lt());
    }

    public void ok() {
        pmi();
        zb(htf());
    }

    public void pmi() {
        dj(true);
    }

    public void ry() {
        pmi();
        dj();
    }

    @Override // android.animation.ValueAnimator
    public void setRepeatMode(int i5) {
        super.setRepeatMode(i5);
        if (i5 == 2 || !this.sya) {
            return;
        }
        this.sya = false;
        jw();
    }

    public void sya(boolean z11) {
        this.f22917ea = z11;
    }

    public float syc() {
        ul ulVar = this.f22918jc;
        if (ulVar == null) {
            return 0.0f;
        }
        float f11 = this.fby;
        return f11 == -2.1474836E9f ? ulVar.lt() : f11;
    }

    public float ul() {
        return this.f22920lt;
    }

    public void wie() {
        if (isRunning()) {
            dj(false);
            Choreographer.getInstance().postFrameCallback(this);
        }
    }

    public void xkz() {
        this.ycx = true;
        wie();
        this.f22916dj = 0L;
        if (htf() && ul() == syc()) {
            ycx(dy());
        } else if (!htf() && ul() == dy()) {
            ycx(syc());
        }
        lud();
    }

    public void ycx(ul ulVar) {
        boolean z11 = this.f22918jc == null;
        this.f22918jc = ulVar;
        if (z11) {
            ycx(Math.max(this.fby, ulVar.lt()), Math.min(this.f22919jw, ulVar.ul()));
        } else {
            ycx((int) ulVar.lt(), (int) ulVar.ul());
        }
        float f11 = this.f22920lt;
        this.f22920lt = 0.0f;
        this.lud = 0.0f;
        ycx((int) f11);
        sya();
    }

    public void zb(float f11) {
        ycx(this.fby, f11);
    }

    public void sya(float f11) {
        this.f22922zb = f11;
    }

    @Override // com.bytedance.adsdk.zb.lt.ycx
    public void zb() {
        super.zb();
        zb(htf());
    }

    public void ycx(float f11) {
        if (this.lud == f11) {
            return;
        }
        float fZb = lud.zb(f11, syc(), dy());
        this.lud = fZb;
        if (this.f22917ea) {
            fZb = (float) Math.floor(fZb);
        }
        this.f22920lt = fZb;
        this.f22916dj = 0L;
        sya();
    }

    public void ycx(int i5) {
        ycx(i5, (int) this.f22919jw);
    }

    public void ycx(float f11, float f12) {
        if (f11 <= f12) {
            ul ulVar = this.f22918jc;
            float fLt = ulVar == null ? -3.4028235E38f : ulVar.lt();
            ul ulVar2 = this.f22918jc;
            float fUl = ulVar2 == null ? Float.MAX_VALUE : ulVar2.ul();
            float fZb = lud.zb(f11, fLt, fUl);
            float fZb2 = lud.zb(f12, fLt, fUl);
            if (fZb == this.fby && fZb2 == this.f22919jw) {
                return;
            }
            this.fby = fZb;
            this.f22919jw = fZb2;
            ycx((int) lud.zb(this.f22920lt, fZb, fZb2));
            return;
        }
        throw new IllegalArgumentException("minFrame (" + f11 + ") must be <= maxFrame (" + f12 + ")");
    }
}
