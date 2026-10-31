package com.apm.insight.runtime;

import android.text.TextUtils;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.json.JSONArray;

/* loaded from: classes.dex */
public final class n {

    /* renamed from: a, reason: collision with root package name */
    private static File f21912a;

    /* loaded from: classes2.dex */
    public static class a {

        /* renamed from: a, reason: collision with root package name */
        public String f21913a;

        /* renamed from: b, reason: collision with root package name */
        private String f21914b;

        /* renamed from: c, reason: collision with root package name */
        private long f21915c;

        public a(String str) {
            String[] strArrSplit = str.split("\\s+");
            if (strArrSplit.length != 3) {
                com.apm.insight.c.a();
                j.a(new RuntimeException("err ProcessTrack line:".concat(str)), "NPTH_CATCH");
                return;
            }
            this.f21914b = strArrSplit[0];
            this.f21913a = strArrSplit[1];
            try {
                this.f21915c = Long.parseLong(strArrSplit[2]);
            } catch (Throwable th2) {
                com.apm.insight.c.a();
                j.a(new RuntimeException("err ProcessTrack line:".concat(str), th2), "NPTH_CATCH");
            }
        }
    }

    public static File a(long j11) {
        return new File(com.apm.insight.l.j.j(com.apm.insight.e.g()), "apminsight/ProcessTrack/" + ((j11 - (j11 % 86400000)) / 86400000));
    }

    public static HashMap<String, a> a(long j11, String str) throws Throwable {
        File file = new File(com.apm.insight.l.j.j(com.apm.insight.e.g()), "apminsight/ProcessTrack/" + ((j11 - (j11 % 86400000)) / 86400000));
        String[] list = file.list();
        HashMap<String, a> map = new HashMap<>();
        if (list != null) {
            for (String str2 : list) {
                File file2 = new File(file, str2);
                long length = file2.length();
                try {
                    JSONArray jSONArrayA = com.apm.insight.l.f.a(file2, length > 1048576 ? length - 524288 : 0L);
                    int length2 = jSONArrayA.length() - 1;
                    while (true) {
                        if (length2 >= 0) {
                            String strOptString = jSONArrayA.optString(length2);
                            if (!TextUtils.isEmpty(strOptString) && strOptString.startsWith(str)) {
                                map.put(str2.replace('_', AbstractJsonLexerKt.COLON).replace(".txt", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b), new a(strOptString));
                                break;
                            }
                            length2--;
                        }
                    }
                } catch (IOException unused) {
                }
            }
        }
        return map;
    }

    public static void a(String str, String str2) {
        File file;
        try {
            if (f21912a == null) {
                com.apm.insight.e.g();
                String strB = com.apm.insight.l.a.b();
                if (strB == null) {
                    file = null;
                } else {
                    long jCurrentTimeMillis = System.currentTimeMillis();
                    f21912a = new File(com.apm.insight.l.j.j(com.apm.insight.e.g()), "apminsight/ProcessTrack/" + ((jCurrentTimeMillis - (jCurrentTimeMillis % 86400000)) / 86400000) + '/' + strB.replace(AbstractJsonLexerKt.COLON, '_') + ".txt");
                    file = f21912a;
                }
            } else {
                file = f21912a;
            }
            if (file != null) {
                com.apm.insight.l.f.a(file, str + ' ' + str2 + ' ' + System.currentTimeMillis() + '\n', true);
            }
        } catch (Throwable unused) {
        }
    }
}
