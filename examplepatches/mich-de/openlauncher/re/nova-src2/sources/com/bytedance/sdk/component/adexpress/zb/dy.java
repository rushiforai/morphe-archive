package com.bytedance.sdk.component.adexpress.zb;

import android.content.Context;
import android.view.View;
import com.bytedance.sdk.component.adexpress.zb.jc;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;

/* loaded from: classes2.dex */
public class dy implements jc {

    /* renamed from: dj, reason: collision with root package name */
    private ry f23686dj;

    /* renamed from: lt, reason: collision with root package name */
    private AtomicBoolean f23687lt = new AtomicBoolean(false);
    private ScheduledFuture<?> lud;
    private fby sya;
    private Context ycx;

    /* renamed from: zb, reason: collision with root package name */
    private com.bytedance.sdk.component.adexpress.lud.ycx f23688zb;

    public class ycx implements Runnable {
        private int sya;
        jc.ycx ycx;

        public ycx(int i5, jc.ycx ycxVar) {
            this.sya = i5;
            this.ycx = ycxVar;
        }

        @Override // java.lang.Runnable
        public void run() {
            if (this.sya == 1) {
                dy.this.f23688zb.ycx(true);
                dy.this.ycx(this.ycx, 107, null);
            }
        }
    }

    public dy(Context context, ry ryVar, com.bytedance.sdk.component.adexpress.lud.ycx ycxVar, fby fbyVar) {
        this.ycx = context;
        this.f23686dj = ryVar;
        this.sya = fbyVar;
        this.f23688zb = ycxVar;
        ycxVar.ycx(this.sya);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void sya() {
        try {
            ScheduledFuture<?> scheduledFuture = this.lud;
            if (scheduledFuture == null || scheduledFuture.isCancelled()) {
                return;
            }
            this.lud.cancel(false);
            this.lud = null;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJgyZRPxVONHQ==", "bOsvowq5fvWFRNNYnjiuPF78LpATqGbV", "WO8jlgawW8KOTtJPuBitLXT7ObMWqHzVhX7WToc=", 102);
        }
    }

    public com.bytedance.sdk.component.adexpress.lud.ycx zb() {
        return this.f23688zb;
    }

    @Override // com.bytedance.sdk.component.adexpress.zb.jc
    public boolean ycx(final jc.ycx ycxVar) {
        int iLt = this.f23686dj.lt();
        if (iLt < 0) {
            ycx(ycxVar, 107, "time is ".concat(String.valueOf(iLt)));
        } else {
            this.lud = com.bytedance.sdk.component.adexpress.dj.dj.ycx(new ycx(1, ycxVar), iLt, TimeUnit.MILLISECONDS);
            this.f23688zb.ycx(new ul() { // from class: com.bytedance.sdk.component.adexpress.zb.dy.1
                @Override // com.bytedance.sdk.component.adexpress.zb.ul
                public void ycx(View view, xkz xkzVar) {
                    syc sycVarZb;
                    dy.this.sya();
                    if (ycxVar.sya() || (sycVarZb = ycxVar.zb()) == null) {
                        return;
                    }
                    sycVarZb.ycx(dy.this.f23688zb, xkzVar);
                    ycxVar.ycx(true);
                }

                @Override // com.bytedance.sdk.component.adexpress.zb.ul
                public void ycx(int i5, String str) {
                    dy.this.ycx(ycxVar, i5, str);
                }
            });
        }
        return true;
    }

    @Override // com.bytedance.sdk.component.adexpress.zb.jc
    public void ycx() {
        this.f23688zb.fby();
        sya();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ycx(jc.ycx ycxVar, int i5, String str) {
        syc sycVarZb;
        if (ycxVar.sya() || this.f23687lt.get()) {
            return;
        }
        sya();
        this.f23686dj.lud().ycx(i5, str);
        if (ycxVar.zb(this)) {
            ycxVar.ycx(this);
        } else {
            if (ycxVar.sya() || (sycVarZb = ycxVar.zb()) == null) {
                return;
            }
            ycxVar.ycx(true);
            sycVarZb.a_(i5);
        }
        this.f23687lt.getAndSet(true);
    }
}
