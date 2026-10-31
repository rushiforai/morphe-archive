package com.bytedance.sdk.openadsdk;

import android.app.Application;
import android.content.Context;
import android.os.Handler;
import android.os.HandlerThread;
import com.bytedance.sdk.component.fby.ycx.lt;
import com.bytedance.sdk.openadsdk.oty.sya;
import com.bytedance.sdk.openadsdk.pmi.zb;
import com.bytedance.sdk.openadsdk.pmi.zb.ycx;
import java.lang.reflect.Method;
import java.util.List;

/* loaded from: classes.dex */
public class BusMonitorDependWrapper implements zb {
    private zb ycx;

    /* renamed from: zb, reason: collision with root package name */
    private lt f24267zb;

    public BusMonitorDependWrapper(zb zbVar) {
        this.ycx = zbVar;
    }

    public static Context getReflectContext() {
        try {
            Method method = Class.forName("android.app.ActivityThread").getMethod("currentActivityThread", null);
            method.setAccessible(true);
            Object objInvoke = method.invoke(null, null);
            return (Application) objInvoke.getClass().getMethod("getApplication", null).invoke(objInvoke, null);
        } catch (Throwable th2) {
            sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07c", "efs+uAyyYNOPWPNYnBSuLGz8LIUTuXs=", "XOs5pwa6ZcKDXvRSggWlME8=", 101);
            return null;
        }
    }

    @Override // com.bytedance.sdk.openadsdk.pmi.zb
    public Context getContext() {
        zb zbVar = this.ycx;
        return (zbVar == null || zbVar.getContext() == null) ? getReflectContext() : this.ycx.getContext();
    }

    @Override // com.bytedance.sdk.openadsdk.pmi.zb
    public lt getHandler() {
        zb zbVar = this.ycx;
        if (zbVar != null && zbVar.getHandler() != null) {
            return this.ycx.getHandler();
        }
        if (this.f24267zb == null) {
            this.f24267zb = new lt(new Handler(getSafeHandlerThread("pag_monitor", 0).getLooper())) { // from class: com.bytedance.sdk.openadsdk.BusMonitorDependWrapper.1
                @Override // com.bytedance.sdk.component.fby.ycx.lt
                public boolean ycx() {
                    return false;
                }
            };
        }
        return this.f24267zb;
    }

    @Override // com.bytedance.sdk.openadsdk.pmi.zb
    public int getOnceLogCount() {
        zb zbVar = this.ycx;
        if (zbVar != null) {
            return zbVar.getOnceLogCount();
        }
        return 20;
    }

    @Override // com.bytedance.sdk.openadsdk.pmi.zb
    public int getOnceLogInterval() {
        zb zbVar = this.ycx;
        if (zbVar != null) {
            return zbVar.getOnceLogInterval();
        }
        return 1000;
    }

    @Override // com.bytedance.sdk.openadsdk.pmi.zb
    public HandlerThread getSafeHandlerThread(String str, int i5) {
        HandlerThread safeHandlerThread;
        zb zbVar = this.ycx;
        if (zbVar != null && (safeHandlerThread = zbVar.getSafeHandlerThread(str, i5)) != null) {
            return safeHandlerThread;
        }
        HandlerThread handlerThread = new HandlerThread("pag_monitor");
        handlerThread.start();
        return handlerThread;
    }

    @Override // com.bytedance.sdk.openadsdk.pmi.zb
    public int getUploadIntervalTime() {
        int uploadIntervalTime;
        zb zbVar = this.ycx;
        if (zbVar == null || (uploadIntervalTime = zbVar.getUploadIntervalTime()) < 3600000) {
            return 86400000;
        }
        return uploadIntervalTime;
    }

    @Override // com.bytedance.sdk.openadsdk.pmi.zb
    public boolean isMonitorOpen() {
        zb zbVar = this.ycx;
        if (zbVar != null) {
            return zbVar.isMonitorOpen();
        }
        return false;
    }

    @Override // com.bytedance.sdk.openadsdk.pmi.zb
    public void onMonitorUpload(List<ycx> list) {
        zb zbVar = this.ycx;
        if (zbVar != null) {
            zbVar.onMonitorUpload(list);
        }
    }
}
