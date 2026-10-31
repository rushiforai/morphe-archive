package com.pgl.ssdk.ces.out;

import android.content.Context;
import android.text.TextUtils;
import android.view.MotionEvent;
import com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.h;
import com.pgl.ssdk.a4;
import com.pgl.ssdk.ces.b;
import java.util.Map;

/* loaded from: classes.dex */
public class PglSSManager {
    public static final int INIT_STATUS_FAIL_CONTEXT_NULL = 4;
    public static final int INIT_STATUS_FAIL_SO_LOADFAIL = 3;
    public static final int INIT_STATUS_FAIL_SO_MISSING = 2;
    public static final int INIT_STATUS_OK = 0;
    public static final int INIT_STATUS_UNINITIALIZE = 1;
    public static final String REPORT_SCENE_ADSHOW = "AdShow";

    /* renamed from: a, reason: collision with root package name */
    private static volatile PglSSManager f42352a;

    /* renamed from: b, reason: collision with root package name */
    private final b f42353b;

    /* renamed from: c, reason: collision with root package name */
    private volatile int f42354c = 0;

    /* renamed from: d, reason: collision with root package name */
    private volatile PglSSCallBack f42355d;

    private PglSSManager(Context context, PglSSConfig pglSSConfig) {
        this.f42353b = b.a(context, pglSSConfig.getAppId(), pglSSConfig.getOVRegionType(), pglSSConfig.getCollectMode(), pglSSConfig.getAdSdkVersion());
    }

    public static int getInitStatus() {
        return b.d();
    }

    public static PglSSManager getInstance() {
        return f42352a;
    }

    public static String getLoadError() {
        if (b.f() != null) {
            return b.f().f42320b;
        }
        return null;
    }

    @DungeonFlag
    public static PglSSManager init(Context context, PglSSConfig pglSSConfig, String str, String str2, String str3, String str4) {
        if (context == null && pglSSConfig == null) {
            return null;
        }
        if (f42352a == null) {
            synchronized (PglSSManager.class) {
                try {
                    if (f42352a == null) {
                        f42352a = new PglSSManager(context, pglSSConfig);
                        if (b.d() == 0) {
                            f42352a.f42355d = pglSSConfig.getCallBack();
                            f42352a.f42353b.a(pglSSConfig.getCustomInfo());
                            f42352a.f42353b.a(str, str3, str2, str4);
                        }
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
        return f42352a;
    }

    public void checkEventVirtual(MotionEvent motionEvent) {
        if (b.d() == 0) {
            this.f42353b.a(motionEvent);
        }
    }

    public long getECForBidding() {
        return 0L;
    }

    public Map<String, String> getFeatureHash(String str, byte[] bArr) {
        if (b.d() == 0) {
            return this.f42353b.a(str, bArr);
        }
        return null;
    }

    public PglSSCallBack getPglCallBack() {
        return this.f42355d;
    }

    public String getSofChara() {
        return null;
    }

    public String getToken() {
        if (b.d() == 0) {
            return this.f42353b.g();
        }
        return null;
    }

    public void reportNow(String str, Map<String, Object> map) {
        if (b.d() == 0) {
            this.f42353b.a(str);
            int i5 = this.f42354c;
            b bVar = this.f42353b;
            if (i5 % bVar.f42337l == 0) {
                bVar.a(str, map, !TextUtils.isEmpty(a4.a()) ? 0L : h.f42227c);
            }
            this.f42354c++;
        }
    }

    public void setCustomInfo(Map<String, Object> map) {
        if (b.d() == 0) {
            this.f42353b.a(map);
        }
    }

    public void setDeviceId(String str) {
        if (b.d() == 0) {
            this.f42353b.c(str);
        }
    }

    public void setGaid(String str) {
        if (b.d() == 0) {
            this.f42353b.d(str);
        }
    }
}
