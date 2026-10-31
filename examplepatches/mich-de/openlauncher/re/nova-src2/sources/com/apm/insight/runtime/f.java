package com.apm.insight.runtime;

import android.content.Context;
import com.apm.insight.l.c;
import com.instabridge.mobilesdk.internal.esim.CarrierConfigurator;
import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import org.json.JSONArray;

/* loaded from: classes2.dex */
public final class f {

    /* renamed from: a, reason: collision with root package name */
    private Context f21882a;

    /* renamed from: b, reason: collision with root package name */
    private HashMap<String, Long> f21883b;

    /* renamed from: c, reason: collision with root package name */
    private int f21884c;

    /* renamed from: d, reason: collision with root package name */
    private int f21885d;

    public f(Context context) {
        this.f21883b = null;
        this.f21884c = 50;
        this.f21885d = 100;
        this.f21882a = context;
        this.f21883b = b();
        this.f21884c = a.a(this.f21884c, "custom_event_settings", "npth_simple_setting", "crash_limit_issue");
        this.f21885d = a.a(this.f21885d, "custom_event_settings", "npth_simple_setting", "crash_limit_all");
    }

    private HashMap<String, Long> b() {
        File fileH = com.apm.insight.l.j.h(this.f21882a);
        HashMap<String, Long> map = new HashMap<>();
        map.put("time", Long.valueOf(System.currentTimeMillis()));
        try {
            JSONArray jSONArrayA = com.apm.insight.l.f.a(fileH.getAbsolutePath());
            if (!com.apm.insight.a.a(jSONArrayA)) {
                Long lDecode = Long.decode(jSONArrayA.optString(0, null));
                if (System.currentTimeMillis() - lDecode.longValue() > 86400000) {
                    File fileG = com.apm.insight.l.j.g(this.f21882a);
                    fileH.renameTo(new File(fileG, String.valueOf(System.currentTimeMillis())));
                    String[] list = fileG.list();
                    if (list != null && list.length > 5) {
                        Arrays.sort(list);
                        new File(fileG, list[0]).delete();
                        return map;
                    }
                } else {
                    map.put("time", lDecode);
                    for (int i5 = 1; i5 < jSONArrayA.length(); i5++) {
                        String[] strArrSplit = jSONArrayA.optString(i5, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b).split(" ");
                        if (strArrSplit.length == 2) {
                            map.put(strArrSplit[0], Long.decode(strArrSplit[1]));
                        }
                    }
                }
            }
        } catch (IOException unused) {
        } catch (Throwable th2) {
            com.apm.insight.c.a();
            j.a(th2, "NPTH_CATCH");
        }
        return map;
    }

    public final void a() throws Throwable {
        HashMap<String, Long> map = this.f21883b;
        Long lRemove = map.remove("time");
        if (lRemove == null) {
            com.apm.insight.c.a();
            j.a(new RuntimeException("err times, no time"), "NPTH_CATCH");
            return;
        }
        StringBuilder sb2 = new StringBuilder();
        sb2.append(lRemove);
        sb2.append('\n');
        for (Map.Entry<String, Long> entry : map.entrySet()) {
            sb2.append(entry.getKey());
            sb2.append(' ');
            sb2.append(entry.getValue());
            sb2.append('\n');
        }
        try {
            com.apm.insight.l.f.a(com.apm.insight.l.j.h(this.f21882a), sb2.toString(), false);
        } catch (IOException unused) {
        }
    }

    public final boolean a(String str) {
        if (str == null) {
            str = CarrierConfigurator.APN_TYPE;
        }
        return c.AnonymousClass1.a(this.f21883b, str, 1L).longValue() < ((long) this.f21884c) && c.AnonymousClass1.a(this.f21883b, "all", 1L).longValue() < ((long) this.f21885d);
    }
}
