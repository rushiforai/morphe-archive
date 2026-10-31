package com.bytedance.adsdk.ugeno.lud.zb;

import android.text.TextUtils;
import com.bytedance.adsdk.ugeno.lud.lt;
import com.google.ads.mediation.fyber.FyberMediationAdapter;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.n;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;

/* loaded from: classes2.dex */
public abstract class ycx {
    public static final HashSet<String> ycx = new HashSet<>(Arrays.asList("convert", "dislike", "openAppPermission", "openAppPolicy", "openPrivacy", "openAppFunction", n.f39150d, "skip", "videoControl", "pauseVideo", "resumeVideo", FyberMediationAdapter.KEY_MUTE_VIDEO, "preventEvent"));

    /* renamed from: dj, reason: collision with root package name */
    protected String f22484dj;
    protected String fby;

    /* renamed from: lt, reason: collision with root package name */
    protected Map<String, Object> f22485lt;
    protected String lud;
    protected com.bytedance.adsdk.ugeno.zb.sya sya;

    /* renamed from: ul, reason: collision with root package name */
    protected String f22486ul;

    /* renamed from: zb, reason: collision with root package name */
    protected lt.ycx f22487zb;

    /* renamed from: com.bytedance.adsdk.ugeno.lud.zb.ycx$ycx, reason: collision with other inner class name */
    public static class C0019ycx {
        public static ycx ycx(com.bytedance.adsdk.ugeno.zb.sya syaVar, String str, lt.ycx ycxVar) {
            ycx ycxVarYcx;
            if (ycxVar == null) {
                return null;
            }
            com.bytedance.adsdk.ugeno.lud.zb zbVarYcx = com.bytedance.adsdk.ugeno.lud.dj.ycx(ycxVar.zb());
            if (zbVarYcx == null && (TextUtils.isEmpty(ycxVar.ycx()) || !TextUtils.equals(ycxVar.ycx(), "global"))) {
                zbVarYcx = com.bytedance.adsdk.ugeno.lud.dj.ycx(ycxVar.lud());
            }
            return (zbVarYcx == null || (ycxVarYcx = zbVarYcx.ycx(syaVar, str, ycxVar)) == null) ? new sya(syaVar, str, ycxVar) : ycxVarYcx;
        }
    }

    public ycx(com.bytedance.adsdk.ugeno.zb.sya syaVar, String str, lt.ycx ycxVar) {
        this.sya = syaVar;
        this.f22487zb = ycxVar;
        this.f22486ul = str;
        lud();
    }

    private void lud() {
        lt.ycx ycxVar = this.f22487zb;
        if (ycxVar == null) {
            return;
        }
        this.f22484dj = ycxVar.ycx();
        this.lud = this.f22487zb.zb();
        Map<String, Object> mapSya = this.f22487zb.sya();
        this.f22485lt = mapSya;
        if (mapSya == null || mapSya.isEmpty() || !this.f22485lt.containsKey("emitCustomEvent") || !(this.f22485lt.get("emitCustomEvent") instanceof String)) {
            return;
        }
        this.fby = (String) this.f22485lt.get("emitCustomEvent");
    }

    public boolean dj() {
        return !TextUtils.isEmpty(this.fby);
    }

    public void sya() {
        if (dj()) {
            lt.ycx ycxVar = new lt.ycx();
            ycxVar.ycx("custom");
            ycxVar.zb("emit");
            HashMap map = new HashMap();
            map.put(PendingUpgradeStore.KEY_NAME, this.fby);
            ycxVar.ycx(map);
            new zb(this.sya, this.lud, ycxVar).ycx();
        }
    }

    public abstract void ycx();

    public void zb() {
        sya();
    }
}
