package com.bytedance.sdk.component.zb.ycx.ycx.ycx;

import android.text.TextUtils;
import com.bytedance.sdk.component.zb.ycx.ok;
import com.bytedance.sdk.component.zb.ycx.syc;
import com.bytedance.sdk.component.zb.ycx.xkz;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/* loaded from: classes2.dex */
public class fby extends xkz {
    public static int ycx = -1;

    /* renamed from: zb, reason: collision with root package name */
    public static int f24209zb = -2;

    /* renamed from: dj, reason: collision with root package name */
    ok f24210dj;

    /* renamed from: lt, reason: collision with root package name */
    String f24211lt;
    final int lud;
    HttpURLConnection sya;

    /* renamed from: ul, reason: collision with root package name */
    String f24212ul;

    public fby(HttpURLConnection httpURLConnection, ok okVar, int i5) {
        this.sya = httpURLConnection;
        this.f24210dj = okVar;
        this.lud = i5;
    }

    @Override // com.bytedance.sdk.component.zb.ycx.xkz, java.io.Closeable, java.lang.AutoCloseable
    public void close() {
        try {
            syc sycVarLt = lt();
            if (sycVarLt != null) {
                sycVarLt.close();
            }
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VryMV5X7bArho15RPxROCFLQ=", "des5pwaveciOWdI=", "WOIihgY=", 155);
        }
    }

    @Override // com.bytedance.sdk.component.zb.ycx.xkz
    public boolean dj() {
        int i5 = this.lud;
        return i5 >= 200 && i5 < 300;
    }

    public ok ea() {
        return this.f24210dj;
    }

    @Override // com.bytedance.sdk.component.zb.ycx.xkz
    public com.bytedance.sdk.component.zb.ycx.jc fby() {
        if (ea() == null || ea().f24184zb == null) {
            return null;
        }
        return new com.bytedance.sdk.component.zb.ycx.jc(ea().f24184zb);
    }

    @Override // com.bytedance.sdk.component.zb.ycx.xkz
    public Map<String, List<String>> jc() {
        HttpURLConnection httpURLConnection = this.sya;
        return httpURLConnection == null ? new HashMap() : httpURLConnection.getHeaderFields();
    }

    @Override // com.bytedance.sdk.component.zb.ycx.xkz
    public String jw() {
        return this.f24212ul;
    }

    @Override // com.bytedance.sdk.component.zb.ycx.xkz
    public syc lt() {
        com.bytedance.sdk.component.sya.ycx.ycx ycxVar;
        com.bytedance.sdk.component.sya.ycx.ycx ycxVar2;
        com.bytedance.sdk.component.sya.ycx.ycx ycxVar3;
        com.bytedance.sdk.component.sya.ycx.ycx ycxVar4;
        com.bytedance.sdk.component.sya.ycx.ycx ycxVar5;
        ok okVar = this.f24210dj;
        if (okVar != null && (ycxVar5 = okVar.f24184zb) != null) {
            ycxVar5.ea();
        }
        jw jwVar = null;
        try {
            try {
                HttpURLConnection httpURLConnection = this.sya;
                if (httpURLConnection == null) {
                    ok okVar2 = this.f24210dj;
                    if (okVar2 != null && (ycxVar4 = okVar2.f24184zb) != null) {
                        ycxVar4.ry();
                    }
                    return null;
                }
                jw jwVar2 = new jw(httpURLConnection);
                ok okVar3 = this.f24210dj;
                if (okVar3 != null && (ycxVar3 = okVar3.f24184zb) != null) {
                    ycxVar3.ry();
                }
                return jwVar2;
            } catch (Exception e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VryMV5X7bArho15RPxROCFLQ=", "des5pwaveciOWdI=", "WeEpjA==", 100);
                try {
                    HttpURLConnection httpURLConnection2 = this.sya;
                    jwVar = new jw(httpURLConnection2, httpURLConnection2.getErrorStream());
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VryMV5X7bArho15RPxROCFLQ=", "des5pwaveciOWdI=", "WeEpjA==", 103);
                    th2.getMessage();
                }
                ok okVar4 = this.f24210dj;
                if (okVar4 != null && (ycxVar = okVar4.f24184zb) != null) {
                    ycxVar.ry();
                }
                return jwVar;
            }
        } catch (Throwable th3) {
            ok okVar5 = this.f24210dj;
            if (okVar5 != null && (ycxVar2 = okVar5.f24184zb) != null) {
                ycxVar2.ry();
            }
            throw th3;
        }
    }

    @Override // com.bytedance.sdk.component.zb.ycx.xkz
    public String lud() throws IOException {
        return !TextUtils.isEmpty(this.f24211lt) ? this.f24211lt : this.sya.getResponseMessage();
    }

    @Override // com.bytedance.sdk.component.zb.ycx.xkz
    public int sya() {
        return this.lud;
    }

    public String toString() {
        return b.f42142b;
    }

    @Override // com.bytedance.sdk.component.zb.ycx.xkz
    public com.bytedance.sdk.component.zb.ycx.lt ul() {
        if (this.sya == null) {
            return new com.bytedance.sdk.component.zb.ycx.lt(new String[0]);
        }
        ArrayList arrayList = new ArrayList();
        for (Map.Entry<String, List<String>> entry : this.sya.getHeaderFields().entrySet()) {
            for (String str : entry.getValue()) {
                if (!"Content-Range".equalsIgnoreCase(entry.getKey()) || sya() != 206) {
                    arrayList.add(entry.getKey());
                    arrayList.add(str);
                }
            }
        }
        return new com.bytedance.sdk.component.zb.ycx.lt((String[]) arrayList.toArray(new String[arrayList.size()]));
    }

    @Override // com.bytedance.sdk.component.zb.ycx.xkz
    public long ycx() {
        return 0L;
    }

    @Override // com.bytedance.sdk.component.zb.ycx.xkz
    public long zb() {
        return 0L;
    }

    public void ycx(String str) {
        this.f24212ul = str;
    }

    public fby(int i5, String str, ok okVar) {
        this.f24211lt = str;
        this.f24210dj = okVar;
        this.lud = i5;
    }

    public fby(int i5, String str, ok okVar, String str2) {
        this.f24211lt = str;
        this.f24210dj = okVar;
        this.lud = i5;
        this.f24212ul = str2;
    }
}
