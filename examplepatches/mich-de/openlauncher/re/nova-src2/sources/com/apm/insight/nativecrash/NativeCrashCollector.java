package com.apm.insight.nativecrash;

import android.os.Looper;
import android.os.SystemClock;
import android.text.TextUtils;
import androidx.annotation.Keep;
import com.apm.insight.CrashType;
import com.apm.insight.ICrashCallback;
import com.apm.insight.Npth;
import com.apm.insight.e;
import com.apm.insight.l.m;
import com.apm.insight.runtime.a.c;
import com.apm.insight.runtime.a.f;
import com.apm.insight.runtime.j;
import com.apm.insight.runtime.l;
import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import java.io.File;
import java.io.IOException;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class NativeCrashCollector {
    public static int a() {
        return 6;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static String b(String str) {
        if (TextUtils.isEmpty(str)) {
            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        if ("main".equalsIgnoreCase(str)) {
            return m.a(Looper.getMainLooper().getThread().getStackTrace());
        }
        ThreadGroup threadGroup = Looper.getMainLooper().getThread().getThreadGroup();
        int iActiveCount = threadGroup.activeCount();
        Thread[] threadArr = new Thread[(iActiveCount / 2) + iActiveCount];
        int iEnumerate = threadGroup.enumerate(threadArr);
        for (int i5 = 0; i5 < iEnumerate; i5++) {
            String name = threadArr[i5].getName();
            if (!TextUtils.isEmpty(name) && (name.equals(str) || name.startsWith(str) || name.endsWith(str))) {
                return m.a(threadArr[i5].getStackTrace());
            }
        }
        try {
            for (Map.Entry<Thread, StackTraceElement[]> entry : Thread.getAllStackTraces().entrySet()) {
                String name2 = entry.getKey().getName();
                if (!name2.equals(str) && !name2.startsWith(str) && !name2.endsWith(str)) {
                }
                return m.a(entry.getValue());
            }
        } catch (Throwable th2) {
            com.apm.insight.c.a();
            j.a(th2, "NPTH_CATCH");
        }
        return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    }

    @Keep
    public static void onNativeCrash(final String str) {
        final long jCurrentTimeMillis = System.currentTimeMillis();
        com.apm.insight.a.a((Object) "[onNativeCrash] enter");
        try {
            com.apm.insight.k.b.a().b();
            final File fileE = com.apm.insight.l.j.e(new File(com.apm.insight.l.j.a(), e.f()));
            com.apm.insight.entity.a aVarA = f.a().a(CrashType.NATIVE, new c.a() { // from class: com.apm.insight.nativecrash.NativeCrashCollector.1
                @Override // com.apm.insight.runtime.a.c.a
                public final com.apm.insight.entity.a a(int i5, com.apm.insight.entity.a aVar) throws JSONException {
                    String str2 = InneractiveMediationDefs.SHOW_HOUSE_AD_YES;
                    if (i5 == 1) {
                        String str3 = str;
                        if (str3 != null && str3.length() != 0) {
                            aVar.a("java_data", (Object) NativeCrashCollector.b(str));
                        }
                        if (!Npth.hasCrashWhenNativeCrash()) {
                            str2 = "false";
                        }
                        aVar.a("crash_after_crash", str2);
                        return aVar;
                    }
                    if (i5 != 2) {
                        if (i5 != 3) {
                            if (i5 == 4) {
                                com.apm.insight.l.a.a(e.g(), aVar.c());
                                return aVar;
                            }
                        } else if (com.apm.insight.runtime.a.d()) {
                            aVar.a("all_thread_stacks", m.b(str));
                            aVar.a("has_all_thread_stack", InneractiveMediationDefs.SHOW_HOUSE_AD_YES);
                        }
                        return aVar;
                    }
                    if (e.x()) {
                        JSONArray jSONArrayB = com.apm.insight.b.f.b().b();
                        long jUptimeMillis = SystemClock.uptimeMillis();
                        JSONObject jSONObjectA = com.apm.insight.b.f.b().a(jUptimeMillis).a();
                        JSONArray jSONArrayA = com.apm.insight.b.j.a(jUptimeMillis);
                        aVar.a("history_message", (Object) jSONArrayB);
                        aVar.a("current_message", jSONObjectA);
                        aVar.a("pending_messages", (Object) jSONArrayA);
                    }
                    aVar.a("disable_looper_monitor", String.valueOf(com.apm.insight.runtime.a.c()));
                    aVar.a("npth_force_apm_crash", String.valueOf(com.apm.insight.c.a.a()));
                    return aVar;
                }

                @Override // com.apm.insight.runtime.a.c.a
                public final com.apm.insight.entity.a b(int i5, com.apm.insight.entity.a aVar) {
                    try {
                        JSONObject jSONObjectC = aVar.c();
                        if (jSONObjectC.length() > 0) {
                            com.apm.insight.l.f.a(new File(fileE.getAbsolutePath() + '.' + i5), jSONObjectC);
                        }
                    } catch (IOException e3) {
                        com.apm.insight.c.a();
                        j.a(e3, "NPTH_CATCH");
                    }
                    if (i5 == 0) {
                        com.apm.insight.a.a.a();
                        com.apm.insight.a.a.a();
                        CrashType crashType = CrashType.LAUNCH;
                        e.f();
                    }
                    return aVar;
                }
            });
            JSONObject jSONObjectC = aVarA.c();
            if (jSONObjectC != null && jSONObjectC.length() != 0) {
                long jCurrentTimeMillis2 = System.currentTimeMillis();
                long j11 = jCurrentTimeMillis2 - jCurrentTimeMillis;
                try {
                    jSONObjectC.put("java_end", jCurrentTimeMillis2);
                    aVarA.b("crash_cost", String.valueOf(j11));
                    aVarA.a("crash_cost", String.valueOf(j11 / 1000));
                } catch (Throwable unused) {
                }
                File file = new File(fileE.getAbsolutePath() + ".tmp");
                com.apm.insight.l.f.a(file, jSONObjectC);
                file.renameTo(fileE);
            }
            try {
                if (l.a().d().isEmpty()) {
                    return;
                }
                File file2 = new File(com.apm.insight.l.j.a(), e.f());
                c cVar = new c(file2);
                cVar.b(file2);
                a(cVar.c(), cVar.a(), str);
            } catch (Throwable unused2) {
                a(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, null, str);
            }
        } catch (Throwable th2) {
            try {
                com.apm.insight.c.a();
                j.a(th2, "NPTH_CATCH");
            } finally {
                try {
                    if (!l.a().d().isEmpty()) {
                        File file3 = new File(com.apm.insight.l.j.a(), e.f());
                        c cVar2 = new c(file3);
                        cVar2.b(file3);
                        a(cVar2.c(), cVar2.a(), str);
                    }
                } catch (Throwable unused3) {
                    a(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, null, str);
                }
            }
        }
    }

    private static void a(String str, String str2, String str3) {
        for (ICrashCallback iCrashCallback : l.a().d()) {
            try {
                if (iCrashCallback instanceof com.apm.insight.b) {
                    ((com.apm.insight.b) iCrashCallback).a(CrashType.NATIVE, str, str3, str2);
                } else {
                    iCrashCallback.onCrash(CrashType.NATIVE, str, null);
                }
            } catch (Throwable th2) {
                com.apm.insight.c.a();
                j.a(th2, "NPTH_CATCH");
            }
        }
    }
}
