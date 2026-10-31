package com.bytedance.sdk.component.lt.ycx;

import android.content.Context;
import android.os.Looper;
import android.text.TextUtils;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Executor;

/* loaded from: classes2.dex */
public class dj {
    public static final dj ycx = new dj();

    private void zb(ycx ycxVar, Context context) {
        sya.ycx(context, "context == null");
        sya.ycx(ycxVar, "AdLogConfig == null");
        sya.ycx(ycxVar.dj(), "AdLogDepend ==null");
    }

    public void ycx(ycx ycxVar, Context context) {
        zb(ycxVar, context);
        ul.lt().ycx(context);
        ul.lt().ycx(ycxVar.jc());
        ul.lt().zb(ycxVar.ul());
        ul.lt().sya(ycxVar.fby());
        ul.lt().ycx(ycxVar.zb());
        ul.lt().dj(ycxVar.jw());
        ul.lt().lud(ycxVar.lt());
        ul.lt().ycx(ycxVar.ycx() == null ? com.bytedance.sdk.component.lt.ycx.ycx.ycx.lud.ycx : ycxVar.ycx());
        ul.lt().ycx(ycxVar.dj());
        ul.lt().ycx(ycxVar.sya());
        ul.lt().ycx(ycxVar.lud());
        com.bytedance.sdk.component.lt.ycx.zb.zb.sya.ycx(ycxVar.ok());
        com.bytedance.sdk.component.lt.ycx.zb.zb.sya.zb(ycxVar.ea());
        ycx(ycxVar);
    }

    public void zb() {
        lud ludVarSyc = ul.lt().syc();
        if (ludVarSyc == null || ul.lt().lud() == null || ludVarSyc.dj() == null) {
            return;
        }
        ul.lt().jc();
    }

    private void zb(com.bytedance.sdk.component.lt.ycx.dj.ycx ycxVar) {
        lud ludVarSyc = ul.lt().syc();
        if (ycxVar == null || ludVarSyc == null || ul.lt().lud() == null || ludVarSyc.dj() == null) {
            return;
        }
        ul.lt().ycx(ycxVar);
    }

    private void ycx(ycx ycxVar) {
        Executor executorLud;
        if (Looper.myLooper() != Looper.getMainLooper() && com.bytedance.sdk.component.lt.ycx.sya.ycx.zb()) {
            com.bytedance.sdk.component.lt.ycx.sya.ycx.ycx();
            return;
        }
        lud ludVarDj = ycxVar.dj();
        if (ludVarDj == null || !com.bytedance.sdk.component.lt.ycx.sya.ycx.zb() || (executorLud = ludVarDj.lud()) == null) {
            return;
        }
        executorLud.execute(new Runnable() { // from class: com.bytedance.sdk.component.lt.ycx.dj.1
            @Override // java.lang.Runnable
            public void run() {
                com.bytedance.sdk.component.lt.ycx.sya.ycx.ycx();
            }
        });
    }

    public void ycx(boolean z11) {
        ul.lt().ycx(z11);
    }

    public void ycx() {
        lud ludVarSyc = ul.lt().syc();
        if (ludVarSyc == null || ul.lt().lud() == null || ludVarSyc.dj() == null) {
            return;
        }
        ul.lt().fby();
    }

    public void ycx(com.bytedance.sdk.component.lt.ycx.dj.ycx ycxVar) {
        zb(ycxVar);
    }

    public void ycx(String str, List<String> list, boolean z11, Map<String, String> map, int i5, String str2) {
        lud ludVarSyc = ul.lt().syc();
        if (ludVarSyc == null || ul.lt().lud() == null || ludVarSyc.dj() == null || !ludVarSyc.fby()) {
            return;
        }
        if (ludVarSyc.lt() == 1) {
            if (list == null || list.isEmpty()) {
                return;
            }
        } else if (ludVarSyc.lt() == 0 && (TextUtils.isEmpty(str) || list == null || list.isEmpty())) {
            return;
        }
        ul.lt().ycx(str, list, z11, map, i5, str2);
    }

    public void ycx(String str, boolean z11) {
        lud ludVarSyc = ul.lt().syc();
        if (ludVarSyc == null || ul.lt().lud() == null || ludVarSyc.dj() == null || !ludVarSyc.fby()) {
            return;
        }
        if (ludVarSyc.lt() == 0 && TextUtils.isEmpty(str)) {
            return;
        }
        ul.lt().ycx(str, z11);
    }
}
