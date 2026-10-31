package com.bytedance.sdk.openadsdk.core.ea;

import android.text.TextUtils;
import com.bytedance.sdk.openadsdk.ApmHelper;
import com.bytedance.sdk.openadsdk.core.jc.ry;
import com.bytedance.sdk.openadsdk.core.settings.ea;
import com.bytedance.sdk.openadsdk.dv.lud;
import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import java.util.concurrent.atomic.AtomicBoolean;

/* loaded from: classes2.dex */
public class zb {
    public static final Long ycx = 0L;

    /* renamed from: zb, reason: collision with root package name */
    private AtomicBoolean f25359zb;

    public static final class ycx {
        static final zb ycx = new zb();
    }

    private void dy() {
        if (ycx().lud() || this.f25359zb.getAndSet(true)) {
            return;
        }
        ApmHelper.initAPM();
        lud.zb();
        ry.zb();
        com.bytedance.sdk.openadsdk.core.syc.sya.ycx.ycx().zb();
    }

    public static zb ycx() {
        return ycx.ycx;
    }

    public boolean dj() {
        long jRy = ry();
        return ok() && jRy != 0 && System.currentTimeMillis() < jRy;
    }

    public boolean ea() {
        return com.bytedance.sdk.openadsdk.uh.dj.ycx.ycx("sp_compliance_file", "user_compliance_status", -1) == 1;
    }

    public int fby() {
        return com.bytedance.sdk.openadsdk.uh.dj.ycx.ycx("sp_compliance_file", "user_compliance_status", -1);
    }

    public boolean jc() {
        return com.bytedance.sdk.openadsdk.uh.dj.ycx.ycx("sp_compliance_file", "user_compliance_status", -1) == -1;
    }

    public boolean jw() {
        int iYcx = com.bytedance.sdk.openadsdk.uh.dj.ycx.ycx("sp_compliance_file", "user_compliance_status", -1);
        return iYcx == 1 || iYcx == 2;
    }

    public boolean lt() {
        return com.bytedance.sdk.openadsdk.uh.dj.ycx.ycx("sp_compliance_file", "app_reg", -1) == 1;
    }

    public boolean lud() {
        return (!dj() && lt() && jw()) ? false : true;
    }

    public boolean ok() {
        return com.bytedance.sdk.openadsdk.uh.dj.ycx.ycx("sp_compliance_file", "user_compliance_status", -1) == 3;
    }

    public long ry() {
        return com.bytedance.sdk.openadsdk.uh.dj.ycx.ycx("sp_compliance_file", "allow_req_time", ycx.longValue());
    }

    public int sya() {
        return com.bytedance.sdk.openadsdk.uh.dj.ycx.ycx("sp_compliance_file", "app_reg", -1);
    }

    public void syc() {
        dy();
    }

    public boolean ul() {
        return com.bytedance.sdk.openadsdk.uh.dj.ycx.ycx("sp_compliance_file", "app_reg", -1) == -1;
    }

    public void xkz() {
        ycx().zb();
    }

    public void zb() {
        String strLv = ea.zb().lv();
        if (TextUtils.isEmpty(strLv)) {
            return;
        }
        if (TextUtils.equals(InneractiveMediationDefs.SHOW_HOUSE_AD_YES, strLv)) {
            ycx(1);
        } else if (TextUtils.equals("false", strLv)) {
            ycx(0);
        }
    }

    private zb() {
        this.f25359zb = new AtomicBoolean(false);
    }

    public void ycx(int i5) {
        com.bytedance.sdk.openadsdk.uh.dj.ycx.ycx("sp_compliance_file", "app_reg", Integer.valueOf(i5));
    }

    public void ycx(long j11) {
        com.bytedance.sdk.openadsdk.uh.dj.ycx.ycx("sp_compliance_file", "allow_req_time", Long.valueOf(j11));
    }

    public void ycx(String str) {
        com.bytedance.sdk.openadsdk.uh.dj.ycx.ycx("sp_compliance_file", "user_compliance_status_reason", str);
    }

    public void ycx(final dj djVar, final boolean z11) {
        sya syaVar = new sya();
        syaVar.ycx(new dj() { // from class: com.bytedance.sdk.openadsdk.core.ea.zb.1
            @Override // com.bytedance.sdk.openadsdk.core.ea.dj
            public void ycx(boolean z12) {
                if (!z12) {
                    djVar.ycx(false);
                    return;
                }
                com.bytedance.sdk.openadsdk.core.ea.ycx ycxVar = new com.bytedance.sdk.openadsdk.core.ea.ycx(z11);
                ycxVar.ycx(new dj() { // from class: com.bytedance.sdk.openadsdk.core.ea.zb.1.1
                    @Override // com.bytedance.sdk.openadsdk.core.ea.dj
                    public void ycx(boolean z13) {
                        djVar.ycx(z13);
                    }
                });
                ycxVar.ycx();
            }
        });
        syaVar.ycx();
    }

    public void zb(int i5) {
        com.bytedance.sdk.openadsdk.uh.dj.ycx.ycx("sp_compliance_file", "user_compliance_status", Integer.valueOf(i5));
    }
}
