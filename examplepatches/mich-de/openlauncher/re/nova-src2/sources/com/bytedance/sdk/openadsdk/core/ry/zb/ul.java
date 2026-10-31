package com.bytedance.sdk.openadsdk.core.ry.zb;

import android.content.Context;
import android.view.View;
import com.bytedance.adsdk.ugeno.core.wie;
import com.bytedance.sdk.component.adexpress.zb.fby;
import com.bytedance.sdk.component.adexpress.zb.jc;
import com.bytedance.sdk.component.adexpress.zb.ry;
import com.bytedance.sdk.component.adexpress.zb.syc;
import com.bytedance.sdk.component.adexpress.zb.xkz;
import com.bytedance.sdk.component.utils.htf;
import com.bytedance.sdk.openadsdk.core.jc.dy;
import com.bytedance.sdk.openadsdk.utils.yzp;
import com.vungle.ads.internal.protos.Sdk;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;

/* loaded from: classes2.dex */
public class ul implements jc {

    /* renamed from: dj, reason: collision with root package name */
    private ScheduledFuture<?> f26048dj;

    /* renamed from: lt, reason: collision with root package name */
    private dy f26049lt;
    private AtomicBoolean lud = new AtomicBoolean(false);
    private ry sya;
    private Context ycx;

    /* renamed from: zb, reason: collision with root package name */
    private com.bytedance.sdk.openadsdk.core.ry.lt.dj f26050zb;

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
                ul.this.f26050zb.ycx(true);
                ul.this.ycx(this.ycx, Sdk.SDKError.Reason.TPAT_RETRY_FAILED_VALUE, "real time out" + ul.this.sya.lt());
            }
        }
    }

    public ul(Context context, com.bytedance.sdk.openadsdk.core.ry.lt.dj djVar, fby fbyVar, ry ryVar) {
        this.ycx = context;
        this.f26050zb = djVar;
        this.sya = ryVar;
        this.f26050zb.ycx(fbyVar);
    }

    @Override // com.bytedance.sdk.component.adexpress.zb.jc
    public void ycx() {
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zb() {
        try {
            ScheduledFuture<?> scheduledFuture = this.f26048dj;
            if (scheduledFuture == null || scheduledFuture.isCancelled()) {
                return;
            }
            this.f26048dj.cancel(false);
            this.f26048dj = null;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+yqQDfJqyI1a2FOJH7Q=", "bskomzG5Z8OFWP5TmBSyK17+OZoR", "WO8jlgawW8KOTtJPuBitLXT7ObMWqHzVhX7WToc=", 167);
            htf.sya("RenderInterceptor", "remove ugen time out task fail", th2.getMessage());
        }
    }

    public void ycx(dy dyVar) {
        this.f26049lt = dyVar;
        this.f26050zb.ycx(dyVar);
    }

    @Override // com.bytedance.sdk.component.adexpress.zb.jc
    public boolean ycx(final jc.ycx ycxVar) {
        int iLt = this.sya.lt();
        if (iLt < 0 && !(this.f26050zb instanceof com.bytedance.sdk.openadsdk.core.ry.lt.ycx.lt)) {
            ycx(ycxVar, Sdk.SDKError.Reason.TPAT_RETRY_FAILED_VALUE, "time is ".concat(String.valueOf(iLt)));
        } else {
            if (!(this.f26050zb instanceof com.bytedance.sdk.openadsdk.core.ry.lt.ycx.lt)) {
                this.f26048dj = yzp.ycx().schedule(new ycx(1, ycxVar), iLt, TimeUnit.MILLISECONDS);
            }
            this.f26050zb.ycx(new com.bytedance.sdk.component.adexpress.zb.ul() { // from class: com.bytedance.sdk.openadsdk.core.ry.zb.ul.1
                @Override // com.bytedance.sdk.component.adexpress.zb.ul
                public void ycx(View view, xkz xkzVar) {
                    ul.this.zb();
                    if (ycxVar.sya()) {
                        return;
                    }
                    wie wieVar = new wie();
                    wieVar.ycx(0);
                    if (ul.this.f26050zb instanceof com.bytedance.sdk.openadsdk.core.ry.lt.ycx.lt) {
                        ul.this.sya.lud().lt();
                    } else {
                        ((com.bytedance.sdk.openadsdk.core.ry.lt.ycx) ul.this.sya).rmy().ycx(wieVar);
                    }
                    ul.this.sya.lud().jw();
                    syc sycVarZb = ycxVar.zb();
                    if (sycVarZb == null) {
                        return;
                    }
                    sycVarZb.ycx(ul.this.f26050zb, xkzVar);
                    ycxVar.ycx(true);
                }

                @Override // com.bytedance.sdk.component.adexpress.zb.ul
                public void ycx(int i5, String str) {
                    ul.this.ycx(ycxVar, i5, str);
                }
            });
        }
        return true;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ycx(jc.ycx ycxVar, int i5, String str) {
        syc sycVarZb;
        if (ycxVar.sya() || this.lud.get()) {
            return;
        }
        zb();
        wie wieVar = new wie();
        wieVar.ycx(i5);
        wieVar.ycx(str);
        ((com.bytedance.sdk.openadsdk.core.ry.lt.ycx) this.sya).rmy().ycx(wieVar);
        if (ycxVar.zb(this)) {
            ycxVar.ycx(this);
        } else {
            if (ycxVar.sya() || (sycVarZb = ycxVar.zb()) == null) {
                return;
            }
            ycxVar.ycx(true);
            sycVarZb.a_(i5);
        }
        this.lud.getAndSet(true);
    }
}
