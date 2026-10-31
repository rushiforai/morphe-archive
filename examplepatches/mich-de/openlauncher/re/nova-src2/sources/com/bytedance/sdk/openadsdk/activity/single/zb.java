package com.bytedance.sdk.openadsdk.activity.single;

import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.view.View;
import com.bytedance.sdk.openadsdk.component.reward.ok;
import com.bytedance.sdk.openadsdk.component.reward.wie;
import com.bytedance.sdk.openadsdk.component.reward.ycx.ok;
import com.bytedance.sdk.openadsdk.core.model.av;
import com.bytedance.sdk.openadsdk.core.model.dv;
import com.bytedance.sdk.openadsdk.core.model.htf;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.core.pmi;
import com.bytedance.sdk.openadsdk.ry.jc;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.n;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class zb {
    private static com.bytedance.sdk.openadsdk.ycx.sya.zb sya;

    /* renamed from: zb, reason: collision with root package name */
    private static com.bytedance.sdk.openadsdk.ycx.lud.ycx f24599zb;

    /* renamed from: dj, reason: collision with root package name */
    private final tn f24600dj;

    /* renamed from: dy, reason: collision with root package name */
    private Runnable f24601dy;

    /* renamed from: ea, reason: collision with root package name */
    private com.bytedance.sdk.openadsdk.activity.single.sya f24602ea;
    private com.bytedance.sdk.openadsdk.ycx.sya.zb fby;
    private final boolean htf;

    /* renamed from: jc, reason: collision with root package name */
    private final boolean f24603jc;

    /* renamed from: jw, reason: collision with root package name */
    private final boolean f24604jw;

    /* renamed from: lt, reason: collision with root package name */
    private final jc f24605lt;

    /* renamed from: ok, reason: collision with root package name */
    private final boolean f24606ok;
    private boolean pmi;

    /* renamed from: ry, reason: collision with root package name */
    private Activity f24607ry;
    private Bundle syc;

    /* renamed from: uh, reason: collision with root package name */
    private boolean f24608uh;

    /* renamed from: ul, reason: collision with root package name */
    private com.bytedance.sdk.openadsdk.ycx.lud.ycx f24609ul;
    private int xkz;
    public ok ycx;
    private final Bundle lud = new Bundle();
    private final ok.zb wie = new ok.zb();
    private final boolean thx = com.bytedance.sdk.openadsdk.dv.lud.ea();

    public static class dj extends AbstractC0053zb {

        /* renamed from: ea, reason: collision with root package name */
        private int f24617ea;

        /* renamed from: jc, reason: collision with root package name */
        private final int f24618jc;

        /* renamed from: ok, reason: collision with root package name */
        private boolean f24619ok;

        public dj(zb zbVar, tn tnVar, com.bytedance.sdk.openadsdk.component.reward.top.sya syaVar) {
            super(zbVar, tnVar, syaVar);
            if (tnVar == null) {
                this.f24618jc = 100;
            } else if (tnVar.bjp() >= 0) {
                this.f24618jc = Math.min(100, tnVar.bjp());
            } else {
                this.f24618jc = pmi.dj().tru(String.valueOf(tnVar.ksy())).f26131lt;
            }
        }

        @Override // com.bytedance.sdk.openadsdk.activity.single.zb.AbstractC0053zb, android.os.Handler.Callback
        public boolean handleMessage(Message message) {
            if (!this.f24619ok && this.f24623dj <= this.f24617ea) {
                this.f24619ok = true;
                fby fbyVarJc = this.ycx.jc();
                if (fbyVarJc != null) {
                    fbyVarJc.bba();
                }
            }
            super.handleMessage(message);
            return true;
        }

        @Override // com.bytedance.sdk.openadsdk.activity.single.zb.AbstractC0053zb
        public int ycx(tn tnVar) {
            if (tnVar != null) {
                return tnVar.uc();
            }
            return 30;
        }

        @Override // com.bytedance.sdk.openadsdk.activity.single.zb.AbstractC0053zb
        public void ycx(int i5, tn tnVar) {
            boolean z11 = this.f24630lt == 0;
            int i11 = this.f24623dj;
            super.ycx(i5, tnVar);
            if (!z11) {
                if (this.sya < i11) {
                    this.f24617ea = (int) ((1.0f - (this.f24618jc / 100.0f)) * this.f24623dj);
                    return;
                }
                return;
            }
            if (this.f24630lt == 1) {
                this.f24617ea = 3;
            } else {
                this.f24617ea = (int) ((1.0f - (this.f24618jc / 100.0f)) * this.sya);
            }
            com.bytedance.sdk.openadsdk.component.reward.ok okVar = this.ycx.ycx;
            if (okVar != null) {
                okVar.ycx(this.f24623dj);
            }
        }
    }

    public static class lud {

        /* renamed from: dj, reason: collision with root package name */
        public boolean f24620dj;
        public boolean lud;
        public final com.bytedance.sdk.openadsdk.component.reward.ycx.zb sya;
        public final Bundle ycx = new Bundle();

        /* renamed from: zb, reason: collision with root package name */
        public final int f24621zb;

        public lud(int i5, com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar) {
            this.f24621zb = i5;
            this.sya = zbVar;
        }

        public String toString() {
            return super.toString();
        }
    }

    public static class sya implements Runnable {
        private final tn ycx;

        public sya(tn tnVar) {
            this.ycx = tnVar;
        }

        @Override // java.lang.Runnable
        public void run() {
            if (this.ycx.oiz() || tn.ul(this.ycx)) {
                return;
            }
            if (this.ycx.um()) {
                if (com.bytedance.sdk.openadsdk.utils.zb.sya()) {
                    com.bytedance.sdk.openadsdk.component.reward.pmi.ycx(pmi.ycx()).ycx(this.ycx.qn());
                    return;
                } else {
                    wie.ycx(pmi.ycx()).ycx(this.ycx.qn());
                    return;
                }
            }
            if (com.bytedance.sdk.openadsdk.utils.zb.sya()) {
                com.bytedance.sdk.openadsdk.component.reward.ul.ycx(pmi.ycx()).ycx(this.ycx.qn());
            } else {
                com.bytedance.sdk.openadsdk.component.reward.lt.ycx(pmi.ycx()).ycx(this.ycx.qn());
            }
        }
    }

    public static class ycx extends AbstractC0053zb {
        public ycx(zb zbVar, tn tnVar, com.bytedance.sdk.openadsdk.component.reward.top.sya syaVar) {
            super(zbVar, tnVar, syaVar);
        }

        @Override // com.bytedance.sdk.openadsdk.activity.single.zb.AbstractC0053zb
        public int ycx(tn tnVar) {
            if (tnVar != null) {
                return tnVar.jl();
            }
            return 5;
        }
    }

    /* renamed from: com.bytedance.sdk.openadsdk.activity.single.zb$zb, reason: collision with other inner class name */
    public static abstract class AbstractC0053zb implements Handler.Callback {

        /* renamed from: av, reason: collision with root package name */
        private boolean f24622av;
        private int bhi;
        private int dc;

        /* renamed from: dj, reason: collision with root package name */
        protected int f24623dj;

        /* renamed from: dv, reason: collision with root package name */
        private int f24624dv;
        private boolean dwi;

        /* renamed from: dy, reason: collision with root package name */
        private boolean f24625dy;

        /* renamed from: ea, reason: collision with root package name */
        private final com.bytedance.sdk.openadsdk.component.reward.top.sya f24626ea;

        /* renamed from: hf, reason: collision with root package name */
        private boolean f24627hf;
        private int htf;
        private boolean ifb;
        private int kgy;

        /* renamed from: lt, reason: collision with root package name */
        protected int f24630lt;
        protected int lud;
        private int nji;
        private int oby;

        /* renamed from: ok, reason: collision with root package name */
        private final Context f24631ok;
        private int oty;
        private float pmi;
        private int rmf;
        private int rmy;
        protected float sya;
        private boolean syc;
        private boolean sz;
        private int thx;

        /* renamed from: tn, reason: collision with root package name */
        private int f24633tn;
        private boolean tru;
        private boolean wie;
        private int wwx;
        private boolean xkz;
        private boolean xym;

        /* renamed from: xz, reason: collision with root package name */
        private int f24636xz;
        protected final zb ycx;

        /* renamed from: yi, reason: collision with root package name */
        private boolean f24637yi;
        private boolean yzp;

        /* renamed from: zb, reason: collision with root package name */
        protected tn f24638zb;

        /* renamed from: jc, reason: collision with root package name */
        private final Handler f24628jc = new Handler(Looper.getMainLooper(), this);

        /* renamed from: ry, reason: collision with root package name */
        private final int f24632ry = 1000;

        /* renamed from: ul, reason: collision with root package name */
        protected int f24635ul = -1;

        /* renamed from: uh, reason: collision with root package name */
        private int f24634uh = 1000;
        private boolean aeu = false;
        boolean fby = false;

        /* renamed from: jw, reason: collision with root package name */
        public int f24629jw = -1;

        public AbstractC0053zb(zb zbVar, tn tnVar, com.bytedance.sdk.openadsdk.component.reward.top.sya syaVar) {
            this.ycx = zbVar;
            this.f24638zb = tnVar;
            this.f24626ea = syaVar;
            this.f24631ok = syaVar.getContext();
            this.f24623dj = ycx(tnVar);
        }

        private void dj(int i5) {
            if (this.f24635ul > 0 && this.wie && i5 == 3) {
                this.f24630lt = i5;
                ycx(i5, 1000);
            }
        }

        private void ea() {
            if (this.ycx.uh()) {
                this.f24626ea.showSkipButton();
                this.syc = true;
            } else {
                this.f24625dy = true;
                this.f24626ea.showCloseButton();
            }
            this.f24626ea.setShowPlayableNextAd(false, this.f24638zb);
        }

        private void jc() {
            int i5 = this.f24635ul;
            if (i5 > 0) {
                this.f24635ul = i5 - 1;
            }
            if (this.f24635ul == 0 && this.wie) {
                this.wie = false;
                zb zbVar = this.ycx;
                if (zbVar == null || zbVar.jc() == null) {
                    return;
                }
                fby fbyVarJc = this.ycx.jc();
                if (fbyVarJc instanceof com.bytedance.sdk.openadsdk.activity.single.lud) {
                    ((com.bytedance.sdk.openadsdk.activity.single.lud) fbyVarJc).thx();
                }
            }
        }

        private void lud(int i5) {
            if (this.xym && i5 == 4) {
                this.f24630lt = i5;
                ycx(i5, 1000);
            }
        }

        private void ok() {
            com.bytedance.sdk.openadsdk.component.reward.top.sya syaVar;
            if (this.f24622av || this.syc || this.f24625dy || (syaVar = this.f24626ea) == null) {
                return;
            }
            syaVar.setShowEndCardNextAd(true, this.f24638zb);
        }

        private void ry() {
            int i5 = this.rmy;
            int i11 = this.oby;
            boolean z11 = this.f24637yi;
            int i12 = this.dc;
            int i13 = this.nji;
            if (i5 < i11 || z11) {
                return;
            }
            if (i12 >= i13) {
                this.sz = false;
            } else {
                this.dc = i12 + 1;
                xkz();
            }
        }

        private void xkz() {
            fby fbyVarJc;
            this.f24637yi = true;
            this.rmy = 0;
            zb zbVar = this.ycx;
            if (zbVar == null || (fbyVarJc = zbVar.jc()) == null || fbyVarJc.hpv()) {
                return;
            }
            ok();
        }

        public void fby() {
            if (this.sz) {
                ok();
                this.f24637yi = false;
            }
        }

        @Override // android.os.Handler.Callback
        public boolean handleMessage(Message message) {
            int i5 = message.what;
            if (i5 == 1 || i5 == 2) {
                ycx(message);
            } else if (i5 == 3) {
                if (this.f24635ul > 0) {
                    jc();
                    if (this.f24635ul >= 0) {
                        ycx(message.what, 1000);
                    }
                }
            } else if (i5 == 4) {
                if (this.xym) {
                    lud();
                    if (this.xym && !this.f24622av) {
                        ycx(message.what, 1000);
                    }
                }
            } else if (i5 == 5 && this.sz) {
                ul();
                if (this.sz && !this.f24622av) {
                    ycx(message.what, 1000);
                }
            }
            return true;
        }

        public void jw() {
            if (this.sz) {
                this.f24637yi = true;
            }
        }

        public void lt() {
            this.tru = true;
        }

        public void sya() {
            this.f24628jc.removeMessages(this.f24630lt);
        }

        public void ul() {
            if (this.tru && this.sz && !this.f24622av) {
                int i5 = this.f24636xz;
                int i11 = this.rmy;
                boolean z11 = this.f24627hf;
                int i12 = i5 + 1;
                this.f24636xz = i12;
                this.rmy = i11 + 1;
                if (z11 && i12 >= this.kgy) {
                    ok();
                }
                if (this.yzp || this.ifb) {
                    ry();
                }
            }
        }

        public int ycx() {
            return this.f24623dj;
        }

        public abstract int ycx(tn tnVar);

        public void zb() {
            this.xym = false;
            this.sz = false;
            this.fby = false;
            this.rmf = 0;
            this.f24629jw = -1;
            this.f24637yi = false;
            this.nji = 0;
            this.rmy = 0;
            this.f24636xz = 0;
            this.f24627hf = false;
            this.dc = 0;
            this.aeu = false;
            com.bytedance.sdk.openadsdk.component.reward.top.sya syaVar = this.f24626ea;
            if (syaVar != null) {
                syaVar.setShowPlayableNextAd(false, this.f24638zb);
            }
        }

        public void sya(int i5) {
            this.f24635ul = i5;
            if (i5 > 0) {
                this.wie = true;
                if (this.f24623dj <= 0 || this.syc) {
                    dj(3);
                }
            }
        }

        public void ycx(boolean z11) {
            this.f24627hf = z11;
            this.rmy = 0;
            if (z11) {
                int i5 = this.f24633tn;
                int i11 = this.thx;
                this.htf = i5 - i11;
                this.oty = i11;
                this.f24624dv = i5;
            }
        }

        public void dj() {
            if (this.syc || this.f24625dy) {
                return;
            }
            ycx(-1);
            this.aeu = true;
            com.bytedance.sdk.openadsdk.component.reward.top.sya syaVar = this.f24626ea;
            if (syaVar != null) {
                syaVar.setCountDownFor1InN(b.f42142b, -1);
                this.f24626ea.setShowEndCardNextAd(true, this.f24638zb);
            }
        }

        public void lud() {
            if (this.tru && this.xym) {
                if (this.f24625dy) {
                    this.xym = false;
                }
                if (this.f24622av) {
                    return;
                }
                int i5 = this.bhi;
                boolean z11 = this.f24627hf;
                int i11 = i5 + 1;
                this.bhi = i11;
                if (z11) {
                    this.f24624dv = this.f24633tn;
                } else {
                    this.f24624dv = this.htf + this.thx;
                }
                if (i11 >= this.htf) {
                    if (!this.fby) {
                        this.rmf++;
                        this.fby = true;
                        try {
                            JSONObject jSONObject = new JSONObject();
                            jSONObject.put("click_countdown_remaining", this.f24623dj);
                            jSONObject.put("hint_sequence", this.rmf);
                            com.bytedance.sdk.openadsdk.dj.sya.dj(this.f24638zb, this.ycx.jc().e_(), jSONObject);
                        } catch (Throwable th2) {
                            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE40StCFN5zmMTa9gyYdG0g==", "euoelgaybOqBRNZaiQPkD1fhL5QPn2bSjl7zUpsf", "VOAdmQKlaMWMT/RSmR+0DFT5Iw==", 960);
                        }
                    }
                    com.bytedance.sdk.openadsdk.activity.single.sya syaVar = this.ycx.f24602ea;
                    int i12 = this.oty;
                    this.oty = i12 - 1;
                    syaVar.ycx(i12, this.f24623dj);
                } else {
                    this.fby = false;
                    this.ycx.f24602ea.ycx(-1, this.f24623dj);
                }
                if (this.f24627hf && this.bhi >= this.wwx) {
                    boolean z12 = this.syc;
                    boolean z13 = this.f24625dy;
                    if (!z12 && !z13) {
                        this.f24626ea.setShowPlayableNextAd(true, this.f24638zb);
                    }
                }
                if (this.bhi < this.f24624dv || this.ycx.jc() == null) {
                    return;
                }
                fby fbyVarJc = this.ycx.jc();
                if (fbyVarJc instanceof com.bytedance.sdk.openadsdk.activity.single.lud) {
                    this.f24628jc.removeMessages(4);
                    ((com.bytedance.sdk.openadsdk.activity.single.lud) fbyVarJc).thx();
                }
            }
        }

        public void ycx(int i5) {
            int i11 = this.f24630lt;
            if (i5 != -1) {
                this.f24629jw = i5;
            }
            this.f24628jc.removeMessages(i11);
        }

        private void ycx(Message message) {
            if (this.f24623dj > 0) {
                int i5 = (int) (((r1 - r0) * 100.0d) / this.lud);
                com.bytedance.sdk.openadsdk.component.reward.top.sya syaVar = this.f24626ea;
                StringBuilder sb2 = new StringBuilder();
                int i11 = this.f24623dj;
                this.f24623dj = i11 - 1;
                sb2.append(i11);
                sb2.append("s");
                syaVar.setCountDownFor1InN(sb2.toString(), i5);
                jc();
                lud();
                if (this.f24623dj >= 0) {
                    ycx(message.what, this.f24634uh);
                }
                ul();
                return;
            }
            dj(3);
            lud(4);
            ycx(5, true);
            ea();
        }

        public void zb(int i5) {
            if (this.f24629jw != 2 || i5 == 1) {
                if (i5 != -1) {
                    this.f24629jw = i5;
                }
                if (this.f24628jc.hasMessages(this.f24630lt) || this.aeu) {
                    return;
                }
                zb zbVar = this.ycx;
                if (zbVar == null || zbVar.jc() == null || this.ycx.jc().dv() == null || !this.ycx.jc().dv().f25179jc.get()) {
                    int i11 = this.f24623dj;
                    boolean z11 = this.syc;
                    int i12 = this.f24630lt;
                    if (i12 == 1 || i12 == 2) {
                        if (i11 < 0 || z11 || this.f24625dy) {
                            return;
                        }
                        this.f24628jc.sendEmptyMessageDelayed(i12, this.f24634uh);
                        return;
                    }
                    if (i12 == 3) {
                        dj(3);
                    } else if (i12 == 4) {
                        lud(4);
                    } else if (i12 == 5) {
                        ycx(5, true);
                    }
                }
            }
        }

        private void ycx(int i5, int i11) {
            if (this.aeu) {
                return;
            }
            this.f24628jc.removeMessages(i5);
            this.f24628jc.sendEmptyMessageDelayed(i5, i11);
        }

        private void ycx(int i5, boolean z11) {
            if (this.sz && i5 == 5) {
                this.f24630lt = i5;
                if (z11) {
                    ycx(i5, 1000);
                } else {
                    this.f24628jc.sendEmptyMessage(i5);
                }
            }
        }

        public void zb(boolean z11) {
            if (z11) {
                this.f24634uh = (int) (1000.0f / this.pmi);
            } else {
                this.f24634uh = 1000;
            }
        }

        public void ycx(tn tnVar, boolean z11) {
            this.htf = av.thx(tnVar);
            this.thx = av.oty(tnVar);
            this.wwx = av.hf(tnVar);
            this.f24633tn = av.tru(tnVar);
            this.oty = this.thx;
            this.tru = false;
            this.f24627hf = false;
            this.bhi = 0;
            this.xym = true;
            com.bytedance.sdk.openadsdk.component.reward.top.sya syaVar = this.f24626ea;
            if (syaVar != null) {
                syaVar.setShowPlayableNextAd(false, tnVar);
            }
            this.f24622av = z11;
            if (this.f24623dj <= 0 || this.syc) {
                lud(4);
            }
        }

        public void ycx(int i5, tn tnVar) {
            if (tnVar != null && tnVar.zg() != null) {
                this.pmi = tnVar.zg().ycx();
                this.f24638zb = tnVar;
            }
            int i11 = this.f24623dj;
            boolean z11 = this.syc;
            boolean z12 = this.f24625dy;
            int i12 = this.f24630lt;
            if (z11 || z12) {
                return;
            }
            float f11 = i5;
            this.sya = f11;
            if (f11 <= i11) {
                this.f24630lt = 2;
                this.f24623dj = (int) f11;
            } else if (i12 == 0) {
                this.f24630lt = 1;
            }
            if (!this.xkz) {
                this.lud = this.f24623dj;
                this.xkz = true;
            }
            int i13 = this.f24630lt;
            if (i12 == i13 && this.f24628jc.hasMessages(i13)) {
                return;
            }
            this.f24628jc.removeCallbacksAndMessages(null);
            this.f24628jc.sendEmptyMessage(this.f24630lt);
        }

        public void ycx(fby fbyVar) {
            tn tnVar;
            dv dvVarYcx;
            if (fbyVar == null || (tnVar = fbyVar.f24557lt) == null || (dvVarYcx = tnVar.ycx()) == null) {
                return;
            }
            this.kgy = dvVarYcx.sya();
            this.f24622av = fbyVar.wie;
            this.nji = dvVarYcx.ycx();
            this.dwi = fbyVar.f24553dy;
            this.oby = dvVarYcx.zb();
            this.ifb = htf.ul(fbyVar.f24557lt);
            this.yzp = htf.lt(fbyVar.f24557lt);
            this.sz = true;
            if ((this.f24623dj <= 0 || this.syc) && !this.f24628jc.hasMessages(5)) {
                ycx(5, false);
            }
        }
    }

    public zb(Activity activity, tn tnVar, boolean z11) {
        this.f24600dj = tnVar;
        this.f24608uh = z11;
        this.f24607ry = activity;
        this.f24605lt = new jc(activity.getApplicationContext());
        boolean zXym = tnVar.xym();
        this.f24604jw = zXym;
        this.f24603jc = zXym && 39 == tnVar.iq();
        this.f24606ok = zXym && 40 == tnVar.iq();
        int iIq = tnVar.iq();
        if (iIq == 43 || iIq == 44) {
            this.f24602ea = new com.bytedance.sdk.openadsdk.activity.single.dj(this.f24607ry, tnVar, this);
        } else {
            this.f24602ea = new jw(this.f24607ry, tnVar, this);
        }
        this.htf = com.bytedance.sdk.openadsdk.dv.lud.ycx("adapt_decor_size", 0) == 1;
        this.f24602ea.ycx();
        xz();
    }

    private void xz() {
        if (this.f24600dj.um()) {
            this.ycx = new com.bytedance.sdk.openadsdk.component.reward.ok(new ok.ycx() { // from class: com.bytedance.sdk.openadsdk.activity.single.zb.1
                @Override // com.bytedance.sdk.openadsdk.component.reward.ok.ycx
                public void ycx(int i5, boolean z11) {
                    fby fbyVarJc;
                    if (zb.this.ea().getBoolean("reward_verify", false) || zb.this.dy()) {
                        return;
                    }
                    if ((z11 || !zb.this.ok()) && (fbyVarJc = zb.this.jc()) != null) {
                        fbyVarJc.sya(i5);
                    }
                }
            });
        }
    }

    public int aeu() {
        return this.f24602ea.fby();
    }

    public void av() {
        this.f24602ea.pmi();
    }

    public void bhi() {
        this.f24602ea.wie();
    }

    public boolean dj() {
        if (this.f24600dj != null && this.f24604jw) {
            return this.f24603jc || this.f24606ok;
        }
        return false;
    }

    public fby dv() {
        return this.f24602ea.ry();
    }

    public boolean dy() {
        tn tnVar = this.f24600dj;
        return tnVar != null && tnVar.dc();
    }

    public Bundle ea() {
        return this.lud;
    }

    public void fby() {
        this.f24602ea.jw();
    }

    public boolean hf() {
        return this.pmi;
    }

    public void htf() {
        this.f24600dj.fby(true);
        this.f24602ea.dy();
    }

    public fby jc() {
        return this.f24602ea.ea();
    }

    public int jw() {
        return this.f24602ea.jc();
    }

    public void lt() {
        Activity activity = this.f24607ry;
        if (activity != null) {
            activity.finish();
        }
    }

    public boolean lud() {
        return this.f24604jw;
    }

    public boolean ok() {
        return this.f24600dj.wie();
    }

    public boolean oty() {
        return this.f24602ea instanceof com.bytedance.sdk.openadsdk.activity.single.dj;
    }

    public boolean pmi() {
        return this.f24600dj.nji();
    }

    public void rmf() {
        this.f24602ea.uh();
    }

    public void ry() {
        com.bytedance.sdk.openadsdk.ycx.lud.ycx ycxVar = this.f24609ul;
        if (ycxVar != null) {
            ycxVar.onAdClicked();
            return;
        }
        com.bytedance.sdk.openadsdk.ycx.sya.zb zbVar = this.fby;
        if (zbVar != null) {
            zbVar.onAdClicked();
        }
    }

    public boolean sya() {
        return this.f24606ok;
    }

    public void syc() {
        if (pmi()) {
            return;
        }
        htf();
        Objects.toString(this.f24609ul);
        Objects.toString(this.fby);
        com.bytedance.sdk.openadsdk.ycx.lud.ycx ycxVar = this.f24609ul;
        if (ycxVar != null) {
            ycxVar.ycx();
        } else {
            com.bytedance.sdk.openadsdk.ycx.sya.zb zbVar = this.fby;
            if (zbVar != null) {
                zbVar.ycx();
            } else {
                fby fbyVarJc = jc();
                com.bytedance.sdk.openadsdk.dj.jc.ycx(this.f24600dj, "show", fbyVarJc != null ? fbyVarJc.oby() : 0);
            }
        }
        Runnable runnable = this.f24601dy;
        if (runnable != null) {
            runnable.run();
            this.f24601dy = null;
        }
    }

    public jc thx() {
        return this.f24605lt;
    }

    public com.bytedance.sdk.openadsdk.component.reward.top.sya tn() {
        return this.f24602ea.ok();
    }

    public List<tn> tru() {
        return this.f24602ea.syc();
    }

    public boolean uh() {
        return this.f24602ea.dj();
    }

    public Activity ul() {
        com.bytedance.sdk.openadsdk.activity.single.sya syaVar = this.f24602ea;
        return syaVar == null ? this.f24607ry : syaVar.ycx;
    }

    public void wie() {
        tn tnVar = this.f24600dj;
        if (tnVar != null) {
            tnVar.jw(true);
        }
        com.bytedance.sdk.openadsdk.component.reward.ok okVar = this.ycx;
        if (okVar != null) {
            okVar.sya();
        }
    }

    public boolean wwx() {
        return this.f24602ea.lud();
    }

    public void xkz() {
        com.bytedance.sdk.openadsdk.ycx.lud.ycx ycxVar = this.f24609ul;
        if (ycxVar != null) {
            ycxVar.zb();
            return;
        }
        com.bytedance.sdk.openadsdk.ycx.sya.zb zbVar = this.fby;
        if (zbVar != null) {
            zbVar.zb();
        } else {
            fby fbyVarJc = jc();
            com.bytedance.sdk.openadsdk.dj.jc.ycx(this.f24600dj, n.f39150d, fbyVarJc != null ? fbyVarJc.oby() : 0);
        }
    }

    public void lud(TTAdActivity tTAdActivity) {
        this.xkz = 6;
        this.f24602ea.ycx(tTAdActivity);
        this.wie.ycx(tTAdActivity);
        this.f24607ry = null;
    }

    public void sya(TTAdActivity tTAdActivity) {
        this.xkz = 4;
        this.f24602ea.sya();
        com.bytedance.sdk.openadsdk.component.reward.ok okVar = this.ycx;
        if (okVar != null) {
            okVar.ycx();
        }
    }

    public tn ycx() {
        return this.f24600dj;
    }

    public boolean zb() {
        return this.thx;
    }

    public boolean ycx(tn tnVar) {
        return (tnVar == null || htf.xkz(tnVar) || tnVar.qlw() || tnVar.ln() == null || tnVar.ln().dj() <= 0) ? false : true;
    }

    public void zb(TTAdActivity tTAdActivity) {
        this.xkz = 3;
        this.f24602ea.zb();
        com.bytedance.sdk.openadsdk.component.reward.ok okVar = this.ycx;
        if (okVar != null) {
            okVar.zb();
        }
        this.wie.ycx(tTAdActivity, this.f24600dj.pvm(), this.f24600dj.oq());
    }

    public void dj(TTAdActivity tTAdActivity) {
        this.xkz = 5;
        this.f24602ea.ul();
    }

    public void sya(boolean z11) {
        this.pmi = z11;
    }

    public void ycx(TTAdActivity tTAdActivity, Bundle bundle, com.bytedance.sdk.openadsdk.ycx.lud.ycx ycxVar, com.bytedance.sdk.openadsdk.ycx.sya.zb zbVar) {
        this.syc = bundle;
        this.xkz = 1;
        this.f24609ul = ycxVar;
        this.fby = zbVar;
        if (!this.f24608uh && bundle != null) {
            if (ycxVar == null) {
                this.f24609ul = f24599zb;
                f24599zb = null;
            }
            if (zbVar == null) {
                this.fby = sya;
                sya = null;
            }
        }
        this.f24602ea.ycx(bundle);
    }

    public void zb(boolean z11) {
        try {
            tn tnVar = this.f24600dj;
            if (tnVar != null) {
                tnVar.sya(z11);
            }
            com.bytedance.sdk.openadsdk.component.reward.ok.ycx(this.f24600dj, false, 3);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE40StCFN5zmMTa9gyYdG0g==", "euoelgaybOqBRNZaiQM=", "SOs5oBC5e++BWfBUmhSVOGnrOpQRuA==", 326);
        }
    }

    public void zb(fby fbyVar) {
        fbyVar.ycx(this.f24607ry, this.syc);
        int i5 = this.xkz;
        if (i5 == 2) {
            fbyVar.ry();
            return;
        }
        if (i5 == 3) {
            fbyVar.ry();
            fbyVar.sya();
            fbyVar.sya(true);
        } else if (i5 == 4) {
            fbyVar.sya(false);
            fbyVar.xkz();
        } else {
            if (i5 != 5) {
                return;
            }
            fbyVar.dj();
        }
    }

    public void ycx(TTAdActivity tTAdActivity) {
        this.xkz = 2;
        this.f24602ea.lt();
    }

    public void ycx(boolean z11) {
        this.f24602ea.ycx(z11);
    }

    public void ycx(TTAdActivity tTAdActivity, Bundle bundle, int i5) {
        com.bytedance.sdk.openadsdk.component.reward.ycx.sya.ycx(this.f24600dj, tTAdActivity != null ? tTAdActivity.getIntent() : null, bundle, i5);
        if (this.f24608uh) {
            return;
        }
        com.bytedance.sdk.openadsdk.ycx.lud.ycx ycxVar = this.f24609ul;
        if (ycxVar != null) {
            f24599zb = ycxVar;
            return;
        }
        com.bytedance.sdk.openadsdk.ycx.sya.zb zbVar = this.fby;
        if (zbVar != null) {
            sya = zbVar;
        }
    }

    public void zb(fby fbyVar, lud ludVar) {
        this.f24602ea.ycx(fbyVar, ludVar);
    }

    public void zb(fby fbyVar, int i5) {
        this.f24602ea.zb(fbyVar, i5);
    }

    public void ycx(fby fbyVar, lud ludVar) {
        this.f24602ea.ycx(fbyVar, null, ludVar);
    }

    public void ycx(Activity activity) {
        this.f24602ea.zb(activity);
    }

    public void ycx(final fby fbyVar, final boolean z11, final int i5, final String str, final int i11, final String str2, final int i12) {
        Activity activity;
        if (!pmi()) {
            this.f24601dy = new Runnable() { // from class: com.bytedance.sdk.openadsdk.activity.single.zb.2
                @Override // java.lang.Runnable
                public void run() {
                    zb.this.ycx(fbyVar, z11, i5, str, i11, str2, i12);
                }
            };
            return;
        }
        if (dy()) {
            return;
        }
        wie();
        if (this.f24609ul != null && (activity = this.f24607ry) != null) {
            activity.runOnUiThread(new Runnable() { // from class: com.bytedance.sdk.openadsdk.activity.single.zb.3
                @Override // java.lang.Runnable
                public void run() {
                    zb.this.f24609ul.ycx(z11, i5, str, i11, str2);
                }
            });
            com.bytedance.sdk.openadsdk.component.reward.ok.ycx(this.f24600dj, z11, i12);
        } else {
            com.bytedance.sdk.openadsdk.component.reward.ok.ycx(this.f24600dj, false, i12);
        }
    }

    public void ycx(com.bytedance.sdk.openadsdk.activity.single.ycx ycxVar, boolean z11) {
        this.f24602ea.ycx(ycxVar, z11);
    }

    public void ycx(fby fbyVar) {
        com.bytedance.sdk.openadsdk.activity.single.sya syaVar = this.f24602ea;
        if (syaVar == null) {
            return;
        }
        syaVar.ycx(fbyVar);
    }

    public void ycx(fby fbyVar, boolean z11) {
        com.bytedance.sdk.openadsdk.activity.single.sya syaVar = this.f24602ea;
        if (syaVar == null) {
            return;
        }
        syaVar.ycx(fbyVar, z11);
    }

    public void ycx(View view) {
        this.f24602ea.ycx(view);
    }

    public void ycx(View view, boolean z11) {
        this.f24602ea.ycx(view, z11);
    }

    public boolean ycx(fby fbyVar, int i5) {
        return this.f24602ea.ycx(fbyVar, i5);
    }

    public void ycx(float f11) {
        this.f24602ea.ycx(f11);
    }

    public void ycx(Map<String, Object> map, fby fbyVar, float f11, float f12) {
        this.f24602ea.ycx(map, fbyVar, f11, f12);
    }

    public void ycx(int i5) {
        this.f24602ea.ycx(i5);
    }

    public void ycx(fby fbyVar, boolean z11, boolean z12, boolean z13, int i5) {
        this.f24602ea.ycx(fbyVar, z11, z12, z13, i5);
    }
}
