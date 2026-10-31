package com.bytedance.sdk.openadsdk.component.reward.ycx;

import android.os.Handler;
import android.os.Message;
import com.bytedance.sdk.openadsdk.core.model.av;
import com.bytedance.sdk.openadsdk.utils.DeviceUtils;
import com.bytedance.sdk.openadsdk.wwx.ycx.ycx;
import org.json.JSONException;

/* loaded from: classes2.dex */
public class fby extends jc implements Handler.Callback {

    /* renamed from: dj, reason: collision with root package name */
    int f25064dj;

    /* renamed from: dv, reason: collision with root package name */
    private boolean f25065dv;

    /* renamed from: hf, reason: collision with root package name */
    private int f25066hf;
    private final Handler htf;

    /* renamed from: lt, reason: collision with root package name */
    boolean f25067lt;
    int lud;
    private int oty;
    int sya;
    private boolean thx;

    /* renamed from: tn, reason: collision with root package name */
    private int f25068tn;
    private boolean tru;

    /* renamed from: ul, reason: collision with root package name */
    protected int f25069ul;
    private int wwx;
    boolean ycx;

    /* renamed from: zb, reason: collision with root package name */
    long f25070zb;

    public fby(zb zbVar) {
        super(zbVar);
        this.htf = new Handler(this);
        this.ycx = false;
        this.f25070zb = 0L;
        this.sya = 0;
        this.f25064dj = 0;
        this.lud = 0;
        this.f25067lt = false;
        this.thx = false;
        this.wwx = 0;
        this.f25065dv = false;
        this.oty = 0;
        this.f25066hf = 0;
        this.tru = false;
        this.f25069ul = av.jw(this.f25082jc);
        this.f25064dj = this.f25082jc.qu();
        int iOm = this.f25082jc.om();
        this.lud = iOm;
        this.oty = Math.max(0, this.f25064dj - iOm);
    }

    private boolean dy() {
        if (this.f25084ok.f25188sg) {
            return false;
        }
        int i5 = this.f25069ul;
        return 1 == i5 || 2 == i5;
    }

    private boolean pmi() {
        return this.fby && av.sya(this.f25084ok.f25203zb) && !this.f25086uh.get();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void wie() {
        int i5 = !this.f25065dv ? this.lud - this.sya : this.lud + this.f25066hf;
        int i11 = com.bytedance.sdk.openadsdk.core.pmi.dj().tru(String.valueOf(this.f25084ok.f25181lt)).f26131lt;
        int i12 = this.f25064dj;
        boolean z11 = false;
        boolean z12 = i12 <= 0 || (((float) i5) / ((float) i12)) * 100.0f >= ((float) i11);
        int iYcx = com.bytedance.sdk.openadsdk.core.pmi.dj().ycx(String.valueOf(this.f25084ok.f25181lt));
        if (iYcx == 0) {
            com.bytedance.sdk.openadsdk.wwx.ycx.ycx ycxVar = this.pmi;
            boolean zLt = ycxVar != null ? ycxVar.lt() : false;
            if (this.syc) {
                zLt = true;
            }
            if (z12 && zLt) {
                z11 = true;
            }
        } else if (iYcx == 1) {
            z11 = z12;
        }
        if (z11) {
            this.f25084ok.dwi.zb(true);
        }
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.ycx.jc
    public void dj() throws JSONException {
        com.bytedance.sdk.openadsdk.core.widget.zb zbVar;
        if (this.xkz) {
            super.dj();
            if (DeviceUtils.ul() == 0) {
                this.f25084ok.f25202yi = true;
            }
            zb zbVar2 = this.f25084ok;
            if (zbVar2.f25202yi) {
                zbVar2.f25201xz.zb(true);
                sya(true);
            }
            com.bytedance.sdk.openadsdk.component.reward.zb.zb zbVar3 = this.f25084ok.f25195ur;
            if ((zbVar3 == null || (zbVar = zbVar3.f25217ok) == null || !zbVar.isShowing()) && ea() && ul() > 0) {
                ycx(0L);
            }
        }
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.ycx.jc
    public int fby() {
        return this.f25068tn;
    }

    @Override // android.os.Handler.Callback
    public boolean handleMessage(Message message) {
        if (message.what != 900 || !pmi()) {
            return true;
        }
        int i5 = message.arg1;
        boolean z11 = false;
        if (this.f25065dv) {
            int i11 = this.lud;
            int i12 = this.f25066hf;
            int i13 = i11 + i12;
            int i14 = this.f25064dj;
            if (i13 < i14) {
                this.f25066hf = i12 + 1;
                Message messageObtain = Message.obtain();
                messageObtain.what = 900;
                messageObtain.arg1 = 0;
                this.htf.sendMessageDelayed(messageObtain, 1000L);
            } else {
                this.f25066hf = i14 - i11;
            }
        } else if (i5 > 0) {
            if (this.wwx == 0 && 2 == this.f25069ul) {
                z11 = true;
            }
            this.f25084ok.f25201xz.dj(true);
            if (!z11) {
                this.f25084ok.f25201xz.ycx(String.valueOf(i5), null);
            }
            Message messageObtain2 = Message.obtain();
            messageObtain2.what = 900;
            int i15 = i5 - 1;
            messageObtain2.arg1 = i15;
            this.htf.sendMessageDelayed(messageObtain2, 1000L);
            this.sya = i15;
            this.f25068tn = i5;
        } else {
            this.f25067lt = true;
            if (!av.fby(this.f25082jc) || (av.htf(this.f25082jc) && this.pmi.lud())) {
                this.f25084ok.f25201xz.dj(false);
                this.f25084ok.f25175dy.set(true);
                this.f25084ok.f25195ur.ry();
            } else {
                this.f25084ok.f25201xz.sya();
                this.f25084ok.f25201xz.lud(true);
            }
            com.bytedance.sdk.openadsdk.wwx.ycx.ycx ycxVar = this.pmi;
            if (ycxVar == null || ycxVar.lud()) {
                this.syc = true;
            }
            if (this.oty > 0) {
                this.f25065dv = true;
                this.f25066hf++;
                Message messageObtain3 = Message.obtain();
                messageObtain3.what = 900;
                messageObtain3.arg1 = 0;
                this.htf.sendMessageDelayed(messageObtain3, 1000L);
            }
            this.f25068tn = 0;
        }
        wie();
        return true;
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.ycx.jc
    public boolean jc() {
        return this.f25067lt;
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.ycx.jc
    public void jw() {
        if (this.xkz) {
            this.thx = true;
            this.htf.removeMessages(900);
            this.htf.removeMessages(600);
        }
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.ycx.jc
    public void lt() {
        if (this.xkz && !this.f25080dy) {
            super.lt();
            this.htf.removeCallbacksAndMessages(null);
        }
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.ycx.jc
    public void lud() throws JSONException {
        if (this.xkz) {
            super.lud();
            jw();
        }
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.ycx.jc
    public void sya() throws JSONException {
        if (this.xkz) {
            this.fby = true;
            boolean zDy = dy();
            if (zDy) {
                this.pmi.ycx(new ycx.InterfaceC0113ycx() { // from class: com.bytedance.sdk.openadsdk.component.reward.ycx.fby.2
                    @Override // com.bytedance.sdk.openadsdk.wwx.ycx.ycx.InterfaceC0113ycx
                    public void ycx(int i5) {
                        if (fby.this.tru) {
                            return;
                        }
                        fby.this.wwx = i5;
                        fby.this.pmi.ycx((ycx.InterfaceC0113ycx) null);
                        fby.this.zb(i5);
                    }
                });
            }
            this.pmi.ycx();
            if (av.fby(this.f25082jc)) {
                this.f25084ok.rmf.lt();
            }
            this.f25070zb = System.currentTimeMillis();
            if (!zDy) {
                zb(0);
            }
            this.f25084ok.dwi.dqs();
            com.bytedance.sdk.openadsdk.component.reward.ok okVar = this.f25084ok.f25200xf;
            if (okVar != null) {
                okVar.ycx(this.f25064dj);
            }
        }
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.ycx.jc
    public int ul() {
        return this.sya;
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.ycx.jc
    public void ycx() {
        if (this.xkz && !this.f25085ry) {
            super.ycx();
        }
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.ycx.jc
    public com.bytedance.sdk.openadsdk.ry.ul zb() {
        return new com.bytedance.sdk.openadsdk.ry.ul() { // from class: com.bytedance.sdk.openadsdk.component.reward.ycx.fby.1
            @Override // com.bytedance.sdk.openadsdk.ry.ul
            public void ycx() {
                fby.this.wie();
            }
        };
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zb(int i5) {
        ycx(this.lud);
        if (this.thx) {
            return;
        }
        Handler handler = this.htf;
        handler.sendMessage(handler.obtainMessage(900, this.lud, i5));
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.ycx.jc
    public void ycx(boolean z11) {
        if (this.wie != null) {
            try {
                com.bytedance.sdk.openadsdk.wwx.ycx.zb zbVarYcx = com.bytedance.sdk.openadsdk.wwx.ycx.dj.ycx().ycx(this.f25082jc, this.wie, zb());
                this.pmi = zbVarYcx;
                zbVarYcx.ycx(this.f25084ok.dwi);
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48erThU4CibF/J7wpdLxVnCHKEmWukohw==", "aes6lBG4T9KMRvhTgAiQJFr3LJcPuUfCl2fWU40WpTo=", "XOs5pQ+9cMaCRtJwjR+hL178", 93);
                com.bytedance.sdk.component.utils.htf.sya("RVIVPlayableNewManager", "PreRender injection exception" + th2.getMessage());
            }
            if (this.pmi == null) {
                super.ycx(z11);
            }
        }
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.ycx.jc
    public void ycx(int i5) {
        this.sya = i5;
        this.f25068tn = i5;
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.ycx.jc
    public void ycx(long j11) {
        if (this.xkz && this.fby && !this.f25084ok.f25179jc.get() && this.thx) {
            this.thx = false;
            Message messageObtain = Message.obtain();
            messageObtain.what = 900;
            messageObtain.arg1 = ul();
            messageObtain.arg2 = this.wwx;
            this.htf.sendMessageDelayed(messageObtain, j11);
        }
    }
}
