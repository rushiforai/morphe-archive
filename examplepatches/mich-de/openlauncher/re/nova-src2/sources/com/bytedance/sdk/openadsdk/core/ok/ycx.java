package com.bytedance.sdk.openadsdk.core.ok;

import android.content.Context;
import android.text.TextUtils;
import android.view.MotionEvent;
import com.bytedance.sdk.component.utils.htf;
import com.bytedance.sdk.openadsdk.BuildConfig;
import com.bytedance.sdk.openadsdk.core.jc;
import com.bytedance.sdk.openadsdk.core.pmi;
import com.bytedance.sdk.openadsdk.core.ry;
import com.bytedance.sdk.openadsdk.core.settings.ea;
import com.bytedance.sdk.openadsdk.core.syc;
import com.bytedance.sdk.openadsdk.dv.lud;
import com.bytedance.sdk.openadsdk.dy.dj;
import com.bytedance.sdk.openadsdk.utils.oby;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.pgl.ssdk.ces.out.PglSSCallBack;
import com.pgl.ssdk.ces.out.PglSSConfig;
import com.pgl.ssdk.ces.out.PglSSManager;
import com.vungle.ads.internal.protos.Sdk;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

/* loaded from: classes2.dex */
class ycx {
    private PglSSManager ycx;

    /* renamed from: zb, reason: collision with root package name */
    private volatile boolean f25887zb;
    private volatile boolean sya = true;

    /* renamed from: dj, reason: collision with root package name */
    private volatile boolean f25886dj = false;

    public ycx() {
        ycx();
    }

    private boolean fby() {
        if (!this.f25887zb && this.sya) {
            ycx();
        }
        return this.f25887zb;
    }

    /* JADX WARN: Unreachable blocks removed: 2, instructions: 2 */
    private Class jc() {
        try {
            this.sya = true;
            return PglSSManager.class;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V/SiW", "dt0ekQiVZNeM", "Uv0Amge5ZeKYQ8RJ", 366);
            this.sya = false;
            return PglSSManager.class;
        }
    }

    private void jw() {
        if (this.ycx == null) {
            this.ycx = PglSSManager.getInstance();
        }
    }

    public String dj() {
        String strZb = com.bytedance.sdk.openadsdk.core.sya.ycx().zb("sec_token", b.f42142b);
        if (fby()) {
            jw();
            PglSSManager pglSSManager = this.ycx;
            if (pglSSManager != null) {
                String token = pglSSManager.getToken();
                if (!TextUtils.isEmpty(token) && !TextUtils.equals(strZb, token)) {
                    com.bytedance.sdk.openadsdk.core.sya.ycx().ycx("sec_token", token);
                }
                return token;
            }
        }
        return strZb;
    }

    public long lt() {
        if (!fby()) {
            return 0L;
        }
        jw();
        PglSSManager pglSSManager = this.ycx;
        if (pglSSManager != null) {
            return pglSSManager.getECForBidding();
        }
        return 0L;
    }

    public String lud() {
        if (!fby()) {
            return b.f42142b;
        }
        jw();
        PglSSManager pglSSManager = this.ycx;
        return pglSSManager != null ? pglSSManager.getSofChara() : b.f42142b;
    }

    public void sya() {
        if (fby()) {
            jw();
            if (this.ycx != null) {
                syc.zb().post(new Runnable() { // from class: com.bytedance.sdk.openadsdk.core.ok.ycx.3
                    @Override // java.lang.Runnable
                    public void run() {
                        try {
                            HashMap map = new HashMap();
                            map.put(PglSSConfig.CUSTOMINFO_KEY_CHECKCLAZZ, pmi.dj().thx());
                            ycx.this.ycx.setCustomInfo(map);
                        } catch (Throwable th2) {
                            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V/SiW", "dt0ekQiVZNeMDoQ=", "Sfsj", 245);
                            htf.sya("MSSdkImpl", "setCustomInfo", th2.getMessage());
                        }
                    }
                });
            }
        }
    }

    public int ul() {
        if (this.sya) {
            return PglSSManager.getInitStatus();
        }
        return 5;
    }

    public boolean zb() {
        return this.f25887zb;
    }

    public synchronized void ycx() {
        Context contextYcx;
        String strDj;
        Set<String> setVbt;
        if (com.bytedance.sdk.openadsdk.core.ea.zb.ycx().lud()) {
            return;
        }
        if (!this.f25887zb) {
            try {
                contextYcx = pmi.ycx();
                strDj = jc.zb().dj();
                if (TextUtils.isEmpty(strDj)) {
                    strDj = jc.ycx("app_id", Long.MAX_VALUE);
                }
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V/SiW", "dt0ekQiVZNeM", "UuAkgQ==", Sdk.SDKError.Reason.PRIVACY_URL_ERROR_VALUE);
                jc();
                this.f25887zb = false;
            }
            if (TextUtils.isEmpty(strDj)) {
                return;
            }
            String strYcx = ry.ycx(contextYcx);
            String strZb = com.bytedance.sdk.openadsdk.thx.ycx.zb.ycx.ycx().zb();
            PglSSConfig pglSSConfigBuild = PglSSConfig.builder().setAppId(strDj).setOVRegionType(2).setAdsdkVersion(BuildConfig.VERSION_NAME).build();
            String strZb2 = com.bytedance.sdk.openadsdk.uh.dj.ycx.zb("ttopenadsdk", PglSSConfig.CUSTOMINFO_KEY_IPV6, b.f42142b);
            HashMap map = new HashMap();
            if (!TextUtils.isEmpty(strZb2)) {
                map.put(PglSSConfig.CUSTOMINFO_KEY_IPV6, strZb2);
            }
            Set<String> setQt = ea.zb().qt();
            if (setQt != null && !setQt.isEmpty()) {
                map.put(PglSSConfig.CUSTOMINFO_KEY_ALLOWED_FIELDS, setQt);
            }
            String strPmi = oby.pmi();
            if (!TextUtils.isEmpty(strPmi)) {
                map.put(PglSSConfig.CUSTOMINFO_KEY_TRANSFER_HOST, strPmi);
            }
            if (!com.bytedance.sdk.openadsdk.utils.zb.zb() || (setVbt = ea.zb().vbt()) == null || setVbt.isEmpty()) {
                map.put(PglSSConfig.CUSTOMINFO_KEY_ADS_URL_BACKUP, new HashSet());
            } else {
                map.put(PglSSConfig.CUSTOMINFO_KEY_ADS_URL_BACKUP, setVbt);
            }
            map.put(PglSSConfig.CUSTOMINFO_KEY_TARGET_IDC, ea.zb().pg());
            String strYcx2 = lud.ycx(PglSSConfig.CUSTOMINFO_KEY_SEC_CONFIG_STR, b.f42142b);
            if (!TextUtils.isEmpty(strYcx2)) {
                map.put(PglSSConfig.CUSTOMINFO_KEY_SEC_CONFIG_STR, strYcx2);
            }
            pglSSConfigBuild.setCustomInfo(map);
            pglSSConfigBuild.setCallBack(new PglSSCallBack() { // from class: com.bytedance.sdk.openadsdk.core.ok.ycx.1
                @Override // com.pgl.ssdk.ces.out.PglSSCallBack
                public void reportSoftDecData(final String str, final String str2) {
                    dj.ycx(str, false, new com.bytedance.sdk.openadsdk.dy.zb() { // from class: com.bytedance.sdk.openadsdk.core.ok.ycx.1.1
                        @Override // com.bytedance.sdk.openadsdk.dy.zb
                        public com.bytedance.sdk.openadsdk.dy.ycx.sya ycx() throws Exception {
                            return com.bytedance.sdk.openadsdk.dy.ycx.dj.zb().ycx(str).zb(str2);
                        }
                    });
                }
            });
            PglSSManager.init(contextYcx, pglSSConfigBuild, null, null, strYcx, strZb);
            jw();
            this.f25887zb = true;
            try {
                if (this.sya) {
                    sya(PglSSManager.getLoadError());
                }
            } catch (Throwable th3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V/SiW", "dt0ekQiVZNeM", "UuAkgQ==", 146);
                htf.sya("mssdk", th3.getMessage());
            }
        }
    }

    public void zb(String str) {
        if (fby()) {
            jw();
            PglSSManager pglSSManager = this.ycx;
            if (pglSSManager != null) {
                pglSSManager.setDeviceId(str);
            }
        }
    }

    private void sya(final String str) {
        if (this.f25886dj || TextUtils.isEmpty(str)) {
            return;
        }
        pmi.lud().ycx(new com.bytedance.sdk.openadsdk.dy.zb() { // from class: com.bytedance.sdk.openadsdk.core.ok.ycx.4
            @Override // com.bytedance.sdk.openadsdk.dy.zb
            public com.bytedance.sdk.openadsdk.dy.ycx.sya ycx() throws Exception {
                return com.bytedance.sdk.openadsdk.dy.ycx.dj.zb().ycx("secsdk_init_error").zb(str);
            }
        }, false);
        this.f25886dj = true;
    }

    public void ycx(String str) {
        if (fby()) {
            jw();
            PglSSManager pglSSManager = this.ycx;
            if (pglSSManager != null) {
                pglSSManager.setGaid(str);
            }
        }
    }

    public void ycx(final Map<String, Object> map) {
        if (fby()) {
            jw();
            if (this.ycx != null) {
                syc.zb().post(new Runnable() { // from class: com.bytedance.sdk.openadsdk.core.ok.ycx.2
                    @Override // java.lang.Runnable
                    public void run() {
                        try {
                            ycx.this.ycx.setCustomInfo(map);
                        } catch (Throwable th2) {
                            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V/SiW", "dt0ekQiVZNeMDoU=", "Sfsj", Sdk.SDKError.Reason.INVALID_WATERFALL_PLACEMENT_ID_VALUE);
                            htf.sya("MSSdkImpl", "setCustomInfo", th2.getMessage());
                        }
                    }
                });
            }
        }
    }

    public void ycx(String str, Map<String, Object> map) {
        if (fby()) {
            jw();
            PglSSManager pglSSManager = this.ycx;
            if (pglSSManager != null) {
                pglSSManager.reportNow(str, map);
            }
        }
    }

    public void ycx(MotionEvent motionEvent) {
        if (zb()) {
            jw();
            PglSSManager pglSSManager = this.ycx;
            if (pglSSManager != null) {
                pglSSManager.checkEventVirtual(motionEvent);
            }
        }
    }

    public Map<String, String> ycx(String str, byte[] bArr) {
        Map<String, String> featureHash;
        return (!fby() || (featureHash = this.ycx.getFeatureHash(str, bArr)) == null) ? new HashMap() : featureHash;
    }
}
