package com.bytedance.sdk.component.ul.zb;

import android.text.TextUtils;
import com.bytedance.sdk.component.zb.ycx.ea;
import com.bytedance.sdk.component.zb.ycx.ok;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

/* loaded from: classes2.dex */
public abstract class sya {

    /* renamed from: jw, reason: collision with root package name */
    protected com.bytedance.sdk.openadsdk.pmi.dj f24085jw;

    /* renamed from: lt, reason: collision with root package name */
    int f24086lt;
    String lud;
    protected ea sya;

    /* renamed from: zb, reason: collision with root package name */
    private List<String> f24088zb;

    /* renamed from: dj, reason: collision with root package name */
    protected String f24082dj = null;

    /* renamed from: ul, reason: collision with root package name */
    protected final Map<String, String> f24087ul = new HashMap();
    protected String fby = null;
    private String ycx = null;

    /* renamed from: ea, reason: collision with root package name */
    private long f24083ea = 30000;

    /* renamed from: jc, reason: collision with root package name */
    protected boolean f24084jc = false;

    public sya(ea eaVar) {
        this.sya = eaVar;
        try {
            dj(UUID.randomUUID().toString());
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4IUtGZe9iiWFqhm1Q==", "des5sBu5atKURcU=", "B+cjnBfi", 93);
            th2.getMessage();
        }
    }

    public void dj(Map<String, String> map) {
        if (map != null) {
            for (Map.Entry<String, String> entry : map.entrySet()) {
                this.f24087ul.put(entry.getKey(), entry.getValue());
            }
        }
    }

    public void fby() {
        if (this.f24085jw == null) {
            return;
        }
        try {
            ea eaVar = this.sya;
            if (eaVar == null || eaVar.ycx() == null) {
                return;
            }
            this.sya.ycx().zb(this.f24085jw);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4IUtGZe9iiWFqhm1Q==", "des5sBu5atKURcU=", "SesumhG4WtKDSdJOnw==", Sdk.SDKError.Reason.AD_EXPIRED_VALUE);
        }
    }

    public void jw() {
        if (this.f24085jw == null) {
            return;
        }
        try {
            ea eaVar = this.sya;
            if (eaVar == null || eaVar.ycx() == null) {
                return;
            }
            this.sya.ycx().sya(this.f24085jw);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4IUtGZe9iiWFqhm1Q==", "des5sBu5atKURcU=", "SesumhG4T8aJRg==", Sdk.SDKError.Reason.AD_CLOSED_MISSING_HEARTBEAT_VALUE);
        }
    }

    public String lt() {
        return this.fby;
    }

    public final com.bytedance.sdk.component.ul.zb lud() {
        com.bytedance.sdk.component.ul.zb zbVarYcx;
        ul();
        try {
            zbVarYcx = ycx();
            if (zbVarYcx != null) {
                try {
                    if (zbVarYcx.lt()) {
                        fby();
                        return zbVarYcx;
                    }
                } catch (Throwable th2) {
                    th = th2;
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4IUtGZe9iiWFqhm1Q==", "des5sBu5atKURcU=", "XvYolhaobA==", 169);
                    jw();
                    return zbVarYcx;
                }
            }
            jw();
            return zbVarYcx;
        } catch (Throwable th3) {
            th = th3;
            zbVarYcx = null;
        }
    }

    public String sya() {
        return this.ycx;
    }

    public void ul() {
        if (this.f24085jw == null) {
            return;
        }
        try {
            ea eaVar = this.sya;
            if (eaVar == null || eaVar.ycx() == null) {
                return;
            }
            this.sya.ycx().ycx(this.f24085jw);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4IUtGZe9iiWFqhm1Q==", "des5sBu5atKURcU=", "SesumhG4WtOBWMM=", 289);
        }
    }

    public abstract com.bytedance.sdk.component.ul.zb ycx();

    public abstract void ycx(com.bytedance.sdk.component.ul.ycx.ycx ycxVar);

    public void ycx(com.bytedance.sdk.openadsdk.pmi.dj djVar) {
        this.f24085jw = djVar;
    }

    public void zb(String str) {
        this.lud = str;
    }

    public void sya(String str) {
        this.fby = str;
    }

    public void ycx(List<String> list) {
        this.f24088zb = list;
    }

    public void zb(String str, String str2) {
        this.f24087ul.put(str, str2);
    }

    public void dj(String str) {
        this.f24082dj = str;
    }

    public void ycx(long j11, TimeUnit timeUnit) {
        this.f24083ea = timeUnit.toMillis(j11);
    }

    public void zb() {
        ea eaVar;
        if (this.f24082dj == null || (eaVar = this.sya) == null) {
            return;
        }
        com.bytedance.sdk.component.zb.ycx.dj djVarZb = eaVar.zb();
        synchronized (djVarZb) {
            try {
                for (com.bytedance.sdk.component.zb.ycx.zb zbVar : djVarZb.sya()) {
                    if (this.f24082dj.equals(zbVar.ycx().sya())) {
                        zbVar.sya();
                    }
                }
                for (com.bytedance.sdk.component.zb.ycx.zb zbVar2 : djVarZb.dj()) {
                    if (this.f24082dj.equals(zbVar2.ycx().sya())) {
                        zbVar2.sya();
                    }
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public String dj() {
        return this.f24082dj;
    }

    public void ycx(ok.ycx ycxVar) {
        if (com.bytedance.sdk.component.ul.ycx.lt()) {
            List<String> list = this.f24088zb;
            if (list != null && !list.isEmpty()) {
                ycxVar.ycx(this.f24088zb);
            }
            ycxVar.ycx(this.f24083ea);
        }
    }

    public void ycx(String str) {
        this.ycx = str;
    }

    public void ycx(int i5) {
        this.f24086lt = i5;
    }

    public final void zb(final com.bytedance.sdk.component.ul.ycx.ycx ycxVar) {
        ul();
        ycx(new com.bytedance.sdk.component.ul.ycx.ycx() { // from class: com.bytedance.sdk.component.ul.zb.sya.1
            @Override // com.bytedance.sdk.component.ul.ycx.ycx
            public void ycx(sya syaVar, com.bytedance.sdk.component.ul.zb zbVar) {
                if (zbVar == null || !zbVar.lt()) {
                    sya.this.jw();
                } else {
                    sya.this.fby();
                }
                com.bytedance.sdk.component.ul.ycx.ycx ycxVar2 = ycxVar;
                if (ycxVar2 != null) {
                    ycxVar2.ycx(syaVar, zbVar);
                }
            }

            @Override // com.bytedance.sdk.component.ul.ycx.ycx
            public void ycx(sya syaVar, IOException iOException) {
                sya.this.jw();
                com.bytedance.sdk.component.ul.ycx.ycx ycxVar2 = ycxVar;
                if (ycxVar2 != null) {
                    ycxVar2.ycx(syaVar, iOException);
                }
            }
        });
    }

    public void zb(ok.ycx ycxVar) {
        if (ycxVar != null && this.f24087ul.size() > 0) {
            for (Map.Entry<String, String> entry : this.f24087ul.entrySet()) {
                String key = entry.getKey();
                if (!TextUtils.isEmpty(key)) {
                    String value = entry.getValue();
                    if (value == null) {
                        value = b.f42142b;
                    }
                    ycxVar.zb(key, value);
                }
            }
        }
    }
}
