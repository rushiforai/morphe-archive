package com.bytedance.sdk.openadsdk.lt;

import com.bytedance.sdk.openadsdk.core.syc;
import com.bytedance.sdk.openadsdk.dv.lud;
import com.bytedance.sdk.openadsdk.oty.sya;

/* loaded from: classes2.dex */
public class ycx {
    private static volatile ycx ycx;

    /* renamed from: dj, reason: collision with root package name */
    private boolean f26865dj;

    /* renamed from: dy, reason: collision with root package name */
    private boolean f26866dy;

    /* renamed from: ea, reason: collision with root package name */
    private boolean f26867ea;
    private int[] fby;

    /* renamed from: jc, reason: collision with root package name */
    private boolean f26868jc;

    /* renamed from: jw, reason: collision with root package name */
    private int[] f26869jw;

    /* renamed from: lt, reason: collision with root package name */
    private int[] f26870lt;
    private int[] lud;

    /* renamed from: ok, reason: collision with root package name */
    private int[] f26871ok;

    /* renamed from: ry, reason: collision with root package name */
    private boolean f26872ry;
    private boolean sya;
    private int syc;

    /* renamed from: ul, reason: collision with root package name */
    private int[] f26873ul;
    private boolean wie;
    private boolean xkz;

    /* renamed from: zb, reason: collision with root package name */
    private boolean f26874zb;

    private ycx() {
        zb();
    }

    public int[] dy() {
        return this.f26871ok;
    }

    public int[] ea() {
        return this.f26873ul;
    }

    public int[] jc() {
        return this.f26870lt;
    }

    public int[] ok() {
        return this.fby;
    }

    public boolean pmi() {
        return this.wie;
    }

    public int[] ry() {
        return this.f26869jw;
    }

    public boolean syc() {
        return this.f26867ea;
    }

    public boolean wie() {
        return this.f26872ry;
    }

    public boolean xkz() {
        return this.f26868jc;
    }

    public boolean fby() {
        return this.f26865dj;
    }

    public int[] jw() {
        return this.lud;
    }

    public boolean ul() {
        return this.sya;
    }

    public int dj() {
        return this.syc;
    }

    public boolean lt() {
        return this.f26874zb;
    }

    public boolean lud() {
        return this.f26866dy;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public int[] sya(String[] strArr) throws NumberFormatException {
        int length = strArr.length;
        int[] iArr = new int[length];
        int i5 = 0;
        for (String str : strArr) {
            try {
                int i11 = Integer.parseInt(str);
                iArr[i5] = i11;
                if (i11 > 0) {
                    i5++;
                }
            } catch (NumberFormatException e3) {
                sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4oUoTxO/Cg=", "fessgRaubOSBScJRjQWlC1TgK5wE", "WOYolgidZ8OwS8VOiSWpJV4=", 111);
            }
        }
        if (i5 == length) {
            return iArr;
        }
        int[] iArr2 = new int[i5];
        System.arraycopy(iArr, 0, iArr2, 0, i5);
        return iArr2;
    }

    public void zb() {
        syc.zb().post(new Runnable() { // from class: com.bytedance.sdk.openadsdk.lt.ycx.1
            @Override // java.lang.Runnable
            public void run() {
                ycx.this.xkz = lud.ycx("feature_switch", false);
                if (ycx.this.xkz) {
                    try {
                        ycx.this.wie = lud.ycx("exclude_banner_native", false);
                        ycx.this.syc = lud.ycx("feature_timer_interval", 10000);
                        ycx.this.f26866dy = lud.ycx("enable_feature_cids", true);
                        String[] strArrSplit = lud.ycx("pag_ad_show_cnt", "1,3,5&session").split("&");
                        String[] strArrSplit2 = lud.ycx("pag_ad_click_cnt", "1,3,5&session").split("&");
                        String[] strArrSplit3 = lud.ycx("pag_video_play_cnt", "1,3,5&session").split("&");
                        String[] strArrSplit4 = lud.ycx("pag_dislike_cnt", "1,3,5session").split(",");
                        ycx ycxVar = ycx.this;
                        ycxVar.f26874zb = ycxVar.ycx(strArrSplit);
                        ycx ycxVar2 = ycx.this;
                        ycxVar2.sya = ycxVar2.ycx(strArrSplit2);
                        ycx ycxVar3 = ycx.this;
                        ycxVar3.f26865dj = ycxVar3.ycx(strArrSplit3);
                        ycx ycxVar4 = ycx.this;
                        ycxVar4.lud = ycxVar4.zb(strArrSplit);
                        ycx ycxVar5 = ycx.this;
                        ycxVar5.f26870lt = ycxVar5.zb(strArrSplit2);
                        ycx ycxVar6 = ycx.this;
                        ycxVar6.f26873ul = ycxVar6.zb(strArrSplit3);
                        ycx ycxVar7 = ycx.this;
                        ycxVar7.f26871ok = ycxVar7.sya(strArrSplit4);
                        String[] strArrSplit5 = lud.ycx("pag_landingPage_stay_time", "1,3,5&session").split("&");
                        String[] strArrSplit6 = lud.ycx("pag_video_stay_time", "1,3,5&session").split("&");
                        ycx ycxVar8 = ycx.this;
                        ycxVar8.f26868jc = ycxVar8.ycx(strArrSplit5);
                        ycx ycxVar9 = ycx.this;
                        ycxVar9.f26867ea = ycxVar9.ycx(strArrSplit6);
                        ycx ycxVar10 = ycx.this;
                        ycxVar10.fby = ycxVar10.zb(strArrSplit5);
                        ycx ycxVar11 = ycx.this;
                        ycxVar11.f26869jw = ycxVar11.zb(strArrSplit6);
                        ycx.this.f26872ry = lud.ycx("pag_video_30p_session", true);
                    } catch (Throwable th2) {
                        sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4oUoTxO/Cg=", "fessgRaubOSBScJRjQWlC1TgK5wE+Dg=", "Sfsj", 75);
                    }
                }
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public int[] zb(String[] strArr) {
        if (strArr.length > 0) {
            return sya(strArr[0].split(","));
        }
        return new int[0];
    }

    public static ycx ycx() {
        if (ycx == null) {
            synchronized (com.bytedance.sdk.openadsdk.core.sya.class) {
                try {
                    if (ycx == null) {
                        ycx = new ycx();
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
        return ycx;
    }

    public boolean sya() {
        return this.xkz;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean ycx(String[] strArr) {
        if (strArr.length == 2) {
            return "session".equals(strArr[1]);
        }
        if (strArr.length == 1) {
            return "session".equals(strArr[0]);
        }
        return false;
    }
}
