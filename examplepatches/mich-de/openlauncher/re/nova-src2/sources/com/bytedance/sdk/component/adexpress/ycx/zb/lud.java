package com.bytedance.sdk.component.adexpress.ycx.zb;

import android.content.Context;
import android.text.TextUtils;
import com.bytedance.sdk.component.adexpress.ycx.sya.ycx;
import com.bytedance.sdk.component.utils.thx;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;

/* loaded from: classes2.dex */
public class lud extends sya {
    private static File ycx;

    /* renamed from: zb, reason: collision with root package name */
    private static volatile lud f23676zb;
    private AtomicBoolean sya = new AtomicBoolean(true);

    /* renamed from: dj, reason: collision with root package name */
    private AtomicBoolean f23677dj = new AtomicBoolean(false);
    private boolean lud = false;

    /* renamed from: lt, reason: collision with root package name */
    private AtomicBoolean f23678lt = new AtomicBoolean(false);

    /* renamed from: ul, reason: collision with root package name */
    private AtomicInteger f23679ul = new AtomicInteger(0);
    private AtomicLong fby = new AtomicLong();

    private lud() {
        jw();
    }

    public static File fby() {
        if (ycx == null) {
            try {
                File fileYcx = dj.ycx();
                Context contextZb = com.bytedance.sdk.component.adexpress.ycx.ycx.ycx.ycx().sya().zb();
                File file = new File(contextZb != null ? com.bytedance.sdk.component.utils.ul.ycx(contextZb, "tt_tmpl_pkg") : new File(fileYcx, "tt_tmpl_pkg"), "template");
                file.mkdirs();
                ycx = file;
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJsyYdD2VjCEqErU+s=", "b+sghQ+9fcKtS9lcixSy", "XOs5oQaxecuBXtJ5hQM=", 274);
            }
        }
        return ycx;
    }

    private void jc() {
        if (this.f23679ul.getAndSet(0) <= 0 || System.currentTimeMillis() - this.fby.get() <= TTAdConstant.AD_MAX_EVENT_TIME) {
            return;
        }
        ul();
    }

    private void jw() {
        com.bytedance.sdk.component.adexpress.dj.dj.zb(new com.bytedance.sdk.component.fby.zb.sya("init") { // from class: com.bytedance.sdk.component.adexpress.ycx.zb.lud.1
            @Override // java.lang.Runnable
            public void run() throws IOException {
                fby.ycx();
                lud.this.sya.set(false);
                lud.this.dj();
                lud.this.ul();
                if (com.bytedance.sdk.component.adexpress.ycx.ycx.ycx.ycx().sya() == null || !thx.ycx(com.bytedance.sdk.component.adexpress.ycx.ycx.ycx.ycx().sya().zb()) || com.bytedance.sdk.component.adexpress.ycx.ycx.ycx.ycx().sya() == null) {
                    return;
                }
                com.bytedance.sdk.component.adexpress.ycx.ycx.ycx.ycx().sya().dj();
            }
        }, 10);
    }

    public static lud zb() {
        if (f23676zb == null) {
            synchronized (lud.class) {
                try {
                    if (f23676zb == null) {
                        f23676zb = new lud();
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
        return f23676zb;
    }

    public void dj() {
        com.bytedance.sdk.component.adexpress.ycx.sya.ycx ycxVarZb = fby.zb();
        if (ycxVarZb == null || !ycxVarZb.fby()) {
            return;
        }
        boolean zYcx = ycx(ycxVarZb);
        if (!zYcx) {
            fby.dj();
        }
        this.lud = zYcx;
    }

    public com.bytedance.sdk.component.adexpress.ycx.sya.ycx lt() {
        return fby.zb();
    }

    public boolean lud() {
        return this.lud;
    }

    public void sya() {
        jw();
    }

    public void ul() {
        ycx(false);
    }

    public boolean ycx(com.bytedance.sdk.component.adexpress.ycx.sya.ycx ycxVar) {
        if (ycxVar == null) {
            return false;
        }
        return ycx(ycxVar.ycx()) || ycx(ycxVar.lud()) || ycx(ycxVar.lt());
    }

    @Override // com.bytedance.sdk.component.adexpress.ycx.zb.sya
    public File ycx() {
        return fby();
    }

    public void ycx(boolean z11) {
        List<ycx.C0036ycx> listYcx;
        boolean z12;
        if (this.sya.get()) {
            return;
        }
        try {
            if (this.f23677dj.get()) {
                if (z11) {
                    this.f23679ul.getAndIncrement();
                    return;
                }
                return;
            }
            boolean z13 = true;
            this.f23677dj.set(true);
            com.bytedance.sdk.component.adexpress.ycx.sya.ycx ycxVarLud = com.bytedance.sdk.component.adexpress.ycx.ycx.ycx.ycx().sya().lud();
            com.bytedance.sdk.component.adexpress.ycx.sya.ycx ycxVarZb = fby.zb();
            if (ycxVarLud != null && ycxVarLud.fby()) {
                if (!fby.zb(ycxVarLud)) {
                    this.f23677dj.set(false);
                    this.fby.set(System.currentTimeMillis());
                    return;
                }
                if (com.bytedance.sdk.component.adexpress.ycx.ycx.ycx.ycx().sya() != null) {
                    com.bytedance.sdk.component.adexpress.ycx.ycx.ycx.ycx().sya().sya().post(new Runnable() { // from class: com.bytedance.sdk.component.adexpress.ycx.zb.lud.2
                        @Override // java.lang.Runnable
                        public void run() {
                            com.bytedance.sdk.component.adexpress.lud.lud.ycx().zb();
                        }
                    });
                }
                fby.ycx(ycxVarLud);
                boolean zYcx = (ycxVarLud.lud() == null || TextUtils.isEmpty(ycxVarLud.lud().ycx())) ? false : ycx(ycxVarLud.lud().ycx());
                if (ycxVarLud.ycx().size() != 0) {
                    listYcx = ycx(ycxVarLud, ycxVarZb);
                    z12 = listYcx != null;
                } else {
                    listYcx = null;
                    z12 = zYcx;
                }
                if (!zYcx) {
                    List<ycx.C0036ycx> listZb = zb(ycxVarLud, ycxVarZb);
                    if (listYcx == null || listZb == null) {
                        listYcx = listZb;
                    } else {
                        listYcx.addAll(listZb);
                    }
                    if (listZb == null) {
                        z13 = false;
                    }
                    if (listZb == null) {
                        this.f23677dj.set(false);
                    }
                    z12 = z13;
                }
                if (z12 && ycx(ycxVarLud)) {
                    fby.ycx(ycxVarLud);
                    fby.sya();
                    zb(listYcx);
                }
                dj();
                this.f23677dj.set(false);
                this.fby.set(System.currentTimeMillis());
                jc();
                return;
            }
            this.f23677dj.set(false);
            ycx(109);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJsyYdD2VjCEqErU+s=", "b+sghQ+9fcKtS9lcixSy", "V+EskTe5ZNeMS8NY", 239);
        }
    }
}
