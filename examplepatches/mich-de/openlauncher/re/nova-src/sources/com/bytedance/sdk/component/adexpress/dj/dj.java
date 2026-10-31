package com.bytedance.sdk.component.adexpress.dj;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;

/* loaded from: classes2.dex */
public class dj {
    public static void ycx(com.bytedance.sdk.component.fby.zb.sya syaVar, int i5) {
        if (syaVar == null) {
            return;
        }
        com.bytedance.sdk.component.adexpress.ycx.ycx.sya syaVarSya = com.bytedance.sdk.component.adexpress.ycx.ycx.ycx.ycx().sya();
        ExecutorService executorServiceXkz = syaVarSya != null ? syaVarSya.xkz() : null;
        if (executorServiceXkz != null) {
            syaVar.setPriority(i5);
            executorServiceXkz.execute(syaVar);
        }
    }

    public static void zb(com.bytedance.sdk.component.fby.zb.sya syaVar, int i5) {
        if (syaVar == null) {
            return;
        }
        com.bytedance.sdk.component.adexpress.ycx.ycx.sya syaVarSya = com.bytedance.sdk.component.adexpress.ycx.ycx.ycx.ycx().sya();
        ExecutorService executorServiceRy = syaVarSya != null ? syaVarSya.ry() : null;
        if (executorServiceRy != null) {
            syaVar.setPriority(i5);
            executorServiceRy.execute(syaVar);
        }
    }

    public static ScheduledFuture ycx(Runnable runnable, long j11, TimeUnit timeUnit) {
        if (runnable == null) {
            return null;
        }
        com.bytedance.sdk.component.adexpress.ycx.ycx.sya syaVarSya = com.bytedance.sdk.component.adexpress.ycx.ycx.ycx.ycx().sya();
        ScheduledExecutorService scheduledExecutorServiceSyc = syaVarSya != null ? syaVarSya.syc() : null;
        if (scheduledExecutorServiceSyc != null) {
            return scheduledExecutorServiceSyc.schedule(runnable, j11, timeUnit);
        }
        return null;
    }
}
