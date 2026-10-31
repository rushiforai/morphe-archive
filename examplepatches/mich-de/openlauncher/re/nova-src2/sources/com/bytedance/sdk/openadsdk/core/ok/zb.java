package com.bytedance.sdk.openadsdk.core.ok;

import android.text.TextUtils;
import android.view.MotionEvent;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.HashMap;
import java.util.Map;

/* loaded from: classes2.dex */
class zb {
    private static com.bytedance.sdk.openadsdk.core.ok.ycx ycx;

    public static class ycx {
        private static final zb ycx = new zb();
    }

    public String dj() {
        String strDj;
        com.bytedance.sdk.openadsdk.core.ok.ycx ycxVar = ycx;
        return (ycxVar == null || (strDj = ycxVar.dj()) == null) ? b.f42142b : strDj;
    }

    public long lt() {
        com.bytedance.sdk.openadsdk.core.ok.ycx ycxVar = ycx;
        if (ycxVar != null) {
            return ycxVar.lt();
        }
        return 0L;
    }

    public String lud() {
        com.bytedance.sdk.openadsdk.core.ok.ycx ycxVar = ycx;
        return ycxVar != null ? ycxVar.lud() : b.f42142b;
    }

    public boolean sya() {
        com.bytedance.sdk.openadsdk.core.ok.ycx ycxVar = ycx;
        if (ycxVar == null) {
            return false;
        }
        return ycxVar.zb();
    }

    public int ul() {
        com.bytedance.sdk.openadsdk.core.ok.ycx ycxVar = ycx;
        if (ycxVar != null) {
            return ycxVar.ul();
        }
        return 1;
    }

    public void ycx(String str) {
        com.bytedance.sdk.openadsdk.core.ok.ycx ycxVar;
        if (TextUtils.isEmpty(str) || (ycxVar = ycx) == null) {
            return;
        }
        ycxVar.ycx(str);
    }

    public void zb(String str) {
        com.bytedance.sdk.openadsdk.core.ok.ycx ycxVar;
        if (TextUtils.isEmpty(str) || (ycxVar = ycx) == null) {
            return;
        }
        ycxVar.zb(str);
    }

    private zb() {
        ycx = new com.bytedance.sdk.openadsdk.core.ok.ycx();
    }

    public static zb zb() {
        return ycx.ycx;
    }

    public void ycx(Map<String, Object> map) {
        com.bytedance.sdk.openadsdk.core.ok.ycx ycxVar = ycx;
        if (ycxVar != null) {
            ycxVar.ycx(map);
        }
    }

    public void ycx() {
        com.bytedance.sdk.openadsdk.core.ok.ycx ycxVar = ycx;
        if (ycxVar != null) {
            ycxVar.sya();
        }
    }

    public void ycx(String str, Map<String, Object> map) {
        com.bytedance.sdk.openadsdk.core.ok.ycx ycxVar = ycx;
        if (ycxVar != null) {
            ycxVar.ycx(str, map);
        }
    }

    public Map<String, String> ycx(String str, byte[] bArr) {
        com.bytedance.sdk.openadsdk.core.ok.ycx ycxVar = ycx;
        if (ycxVar != null) {
            return ycxVar.ycx(str, bArr);
        }
        return new HashMap();
    }

    public void ycx(MotionEvent motionEvent) {
        com.bytedance.sdk.openadsdk.core.ok.ycx ycxVar = ycx;
        if (ycxVar != null) {
            ycxVar.ycx(motionEvent);
        }
    }
}
