package sprig.j;

import android.os.Build;
import com.drew.metadata.wav.WavDirectory;
import com.userleap.SprigLoggingLevel;
import defpackage.ajb;
import defpackage.bjb;
import defpackage.bu1;
import defpackage.c1e;
import defpackage.co6;
import defpackage.ev6;
import defpackage.g76;
import defpackage.gy2;
import defpackage.ho2;
import defpackage.jhf;
import defpackage.k80;
import defpackage.ka1;
import defpackage.muc;
import defpackage.x45;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import kotlin.Metadata;
import org.json.JSONException;
import org.json.JSONObject;
import sprig.b.g;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u00004\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u000f\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0005\u0018\u0000 *2\u00020\u0001:\u0001\u0015B\u0007¢\u0006\u0004\b\u0002\u0010\u0003JK\u0010\f\u001a\u00020\u000b2\u0006\u0010\u0005\u001a\u00020\u00042\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00042\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00042\b\b\u0002\u0010\b\u001a\u00020\u00042\b\b\u0002\u0010\t\u001a\u00020\u00042\b\b\u0002\u0010\n\u001a\u00020\u0004¢\u0006\u0004\b\f\u0010\rJK\u0010\u000e\u001a\u00020\u000b2\u0006\u0010\u0005\u001a\u00020\u00042\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00042\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00042\b\b\u0002\u0010\b\u001a\u00020\u00042\b\b\u0002\u0010\t\u001a\u00020\u00042\b\b\u0002\u0010\n\u001a\u00020\u0004¢\u0006\u0004\b\u000e\u0010\rJK\u0010\u000f\u001a\u00020\u000b2\u0006\u0010\u0005\u001a\u00020\u00042\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00042\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00042\b\b\u0002\u0010\b\u001a\u00020\u00042\b\b\u0002\u0010\t\u001a\u00020\u00042\b\b\u0002\u0010\n\u001a\u00020\u0004¢\u0006\u0004\b\u000f\u0010\rJK\u0010\u0010\u001a\u00020\u000b2\u0006\u0010\u0005\u001a\u00020\u00042\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00042\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00042\b\b\u0002\u0010\b\u001a\u00020\u00042\b\b\u0002\u0010\t\u001a\u00020\u00042\b\b\u0002\u0010\n\u001a\u00020\u0004¢\u0006\u0004\b\u0010\u0010\rJ!\u0010\u0013\u001a\u00020\u000b2\u0006\u0010\u0011\u001a\u00020\u00042\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u0004¢\u0006\u0004\b\u0013\u0010\u0014JM\u0010\u0015\u001a\u00020\u000b2\u0006\u0010\u0005\u001a\u00020\u00042\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00042\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00042\b\b\u0002\u0010\b\u001a\u00020\u00042\b\b\u0002\u0010\t\u001a\u00020\u00042\b\b\u0002\u0010\n\u001a\u00020\u0004H\u0002¢\u0006\u0004\b\u0015\u0010\rJO\u0010\u0015\u001a\u00020\u00042\u0006\u0010\u0016\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u00042\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00042\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00042\u0006\u0010\t\u001a\u00020\u00042\u0006\u0010\n\u001a\u00020\u00042\u0006\u0010\b\u001a\u00020\u0004H\u0002¢\u0006\u0004\b\u0015\u0010\u0017J#\u0010\u0015\u001a\u00020\u000b2\u0006\u0010\u0005\u001a\u00020\u00042\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0004H\u0002¢\u0006\u0004\b\u0015\u0010\u0014J\u000f\u0010\u0018\u001a\u00020\u0004H\u0002¢\u0006\u0004\b\u0018\u0010\u0019J\u000f\u0010\u001a\u001a\u00020\u0004H\u0002¢\u0006\u0004\b\u001a\u0010\u0019J\u0011\u0010\u0015\u001a\u0004\u0018\u00010\u001bH\u0002¢\u0006\u0004\b\u0015\u0010\u001cJ\u000f\u0010\u001d\u001a\u00020\u0004H\u0002¢\u0006\u0004\b\u001d\u0010\u0019J\u0019\u0010\u0015\u001a\u00020\u001e2\b\b\u0002\u0010\u001f\u001a\u00020\u001eH\u0002¢\u0006\u0004\b\u0015\u0010 J\u000f\u0010!\u001a\u00020\u001eH\u0002¢\u0006\u0004\b!\u0010\"J\u000f\u0010#\u001a\u00020\u001eH\u0002¢\u0006\u0004\b#\u0010\"R\u0014\u0010%\u001a\u00020\u00048\u0002X\u0082D¢\u0006\u0006\n\u0004\b\u0015\u0010$R\u0014\u0010(\u001a\u00020&8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u001a\u0010'R\u0014\u0010)\u001a\u00020\u00048\u0002X\u0082D¢\u0006\u0006\n\u0004\b\u0018\u0010$¨\u0006+"}, d2 = {"Lsprig/j/e;", "", "<init>", "()V", "", "message", "detail", "additionalDetails", "stackTrace", "callingMethod", "callingFile", "Lc1e;", "logError", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "logDebug", "logInfo", "logWarning", "value", "details", "logBreadCrumb", "(Ljava/lang/String;Ljava/lang/String;)V", "a", "level", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;", "c", "()Ljava/lang/String;", "b", "Ljava/lang/StackTraceElement;", "()Ljava/lang/StackTraceElement;", "d", "", "isError", "(Z)Z", "f", "()Z", "e", "Ljava/lang/String;", "TAG", "Ljhf;", "Ljhf;", "networkService", "errorsPath", "Companion", "userleap_release"}, k = 1, mv = {1, 8, 0})
public final class e {
    public static final d d;

    /* JADX INFO: renamed from: a, reason: from kotlin metadata */
    public final String TAG = "SprigLogger";

    /* JADX INFO: renamed from: b, reason: from kotlin metadata */
    public final jhf networkService = new jhf(null);

    /* JADX INFO: renamed from: c, reason: from kotlin metadata */
    public final String errorsPath = "/sdk/1/errors";

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0010\n\u0000\n\u0002\u0010\r\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\u0010\u0000\u001a\u00020\u00012\u000e\u0010\u0002\u001a\n \u0004*\u0004\u0018\u00010\u00030\u0003H\n¢\u0006\u0002\b\u0005"}, d2 = {"<anonymous>", "", "it", "Ljava/lang/StackTraceElement;", "kotlin.jvm.PlatformType", "invoke"}, k = 3, mv = {1, 8, 0}, xi = 48)
    public static final class b extends co6 implements x45 {
        public static final b INSTANCE = new b();

        public b() {
            super(1);
        }

        @Override // defpackage.x45
        public final CharSequence invoke(StackTraceElement stackTraceElement) {
            String fileName = stackTraceElement.getFileName();
            int lineNumber = stackTraceElement.getLineNumber();
            String className = stackTraceElement.getClassName();
            String methodName = stackTraceElement.getMethodName();
            StringBuilder sb = new StringBuilder();
            sb.append(fileName);
            sb.append(":");
            sb.append(lineNumber);
            sb.append(" ");
            sb.append(className);
            return ka1.v(sb, ".", methodName);
        }
    }

    static {
        gy2 gy2Var = null;
        INSTANCE = new Companion(gy2Var);
        d = new d(0, 1, gy2Var);
    }

    public static /* synthetic */ String buildLogMessage$default(e eVar, String str, String str2, String str3, String str4, String str5, String str6, String str7, int i, Object obj) {
        if ((i & 4) != 0) {
            str3 = null;
        }
        if ((i & 8) != 0) {
            str4 = null;
        }
        return eVar.a(str, str2, str3, str4, str5, str6, str7);
    }

    public static /* synthetic */ void logBreadCrumb$default(e eVar, String str, String str2, int i, Object obj) {
        if ((i & 2) != 0) {
            str2 = null;
        }
        eVar.logBreadCrumb(str, str2);
    }

    public static /* synthetic */ void logDebug$default(e eVar, String str, String str2, String str3, String str4, String str5, String str6, int i, Object obj) {
        if ((i & 2) != 0) {
            str2 = null;
        }
        if ((i & 4) != 0) {
            str3 = null;
        }
        if ((i & 8) != 0) {
            str4 = eVar.d();
        }
        if ((i & 16) != 0) {
            str5 = eVar.c();
        }
        if ((i & 32) != 0) {
            str6 = eVar.b();
        }
        eVar.logDebug(str, str2, str3, str4, str5, str6);
    }

    public static /* synthetic */ void logError$default(e eVar, String str, String str2, String str3, String str4, String str5, String str6, int i, Object obj) throws JSONException {
        if ((i & 2) != 0) {
            str2 = null;
        }
        if ((i & 4) != 0) {
            str3 = null;
        }
        if ((i & 8) != 0) {
            str4 = eVar.d();
        }
        if ((i & 16) != 0) {
            str5 = eVar.c();
        }
        if ((i & 32) != 0) {
            str6 = eVar.b();
        }
        eVar.logError(str, str2, str3, str4, str5, str6);
    }

    public static /* synthetic */ void logInfo$default(e eVar, String str, String str2, String str3, String str4, String str5, String str6, int i, Object obj) {
        if ((i & 2) != 0) {
            str2 = null;
        }
        if ((i & 4) != 0) {
            str3 = null;
        }
        if ((i & 8) != 0) {
            str4 = eVar.d();
        }
        if ((i & 16) != 0) {
            str5 = eVar.c();
        }
        if ((i & 32) != 0) {
            str6 = eVar.b();
        }
        eVar.logInfo(str, str2, str3, str4, str5, str6);
    }

    public static /* synthetic */ void logLocalError$default(e eVar, String str, String str2, String str3, String str4, String str5, String str6, int i, Object obj) {
        if ((i & 2) != 0) {
            str2 = null;
        }
        if ((i & 4) != 0) {
            str3 = null;
        }
        if ((i & 8) != 0) {
            str4 = eVar.d();
        }
        if ((i & 16) != 0) {
            str5 = eVar.c();
        }
        if ((i & 32) != 0) {
            str6 = eVar.b();
        }
        eVar.a(str, str2, str3, str4, str5, str6);
    }

    public static /* synthetic */ void logWarning$default(e eVar, String str, String str2, String str3, String str4, String str5, String str6, int i, Object obj) {
        if ((i & 2) != 0) {
            str2 = null;
        }
        if ((i & 4) != 0) {
            str3 = null;
        }
        if ((i & 8) != 0) {
            str4 = eVar.d();
        }
        if ((i & 16) != 0) {
            str5 = eVar.c();
        }
        if ((i & 32) != 0) {
            str6 = eVar.b();
        }
        eVar.logWarning(str, str2, str3, str4, str5, str6);
    }

    public static /* synthetic */ void printErrorToConsole$default(e eVar, String str, String str2, int i, Object obj) {
        if ((i & 2) != 0) {
            str2 = "";
        }
        eVar.a(str, str2);
    }

    public static /* synthetic */ boolean shouldLogToLogcat$default(e eVar, boolean z, int i, Object obj) {
        if ((i & 1) != 0) {
            z = false;
        }
        return eVar.a(z);
    }

    public final String a(String level, String message, String detail, String additionalDetails, String callingMethod, String callingFile, String stackTrace) {
        StringBuilder sb = new StringBuilder(ev6.y("[", level, "] ", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS", Locale.getDefault()).format(new Date()), "\n"));
        sb.append("BuildConfig.DEBUG: false\n");
        sb.append("Message: " + message + "\n");
        if (detail != null) {
            sb.append("Detail: " + detail + "\n");
        }
        sb.append("Method: " + callingMethod + "\n");
        sb.append("File: " + callingFile + "\n");
        g gVar = g.INSTANCE;
        String visitorIdentifierString = gVar.getVisitorIdentifierString();
        if (visitorIdentifierString == null) {
            visitorIdentifierString = "(no vid)";
        }
        String environmentId = gVar.getEnvironmentId();
        sb.append("Visitor ID: " + visitorIdentifierString + "\n");
        sb.append("Environment ID: " + environmentId + "\n");
        sb.append(ev6.y("Device: ", Build.MODEL, " (Android ", Build.VERSION.RELEASE, ")\n"));
        if (additionalDetails != null) {
            sb.append("Additional Details: " + additionalDetails + "\n");
        }
        List<c> recent = d.getRecent(5);
        if (!recent.isEmpty()) {
            sb.append("Recent Breadcrumbs:\n");
            Iterator<T> it2 = recent.iterator();
            while (it2.hasNext()) {
                sb.append("  " + ((c) it2.next()) + "\n");
            }
        }
        if (g76.L(level, "DEBUG")) {
            sb.append("Stack: ".concat(bu1.F0(bu1.g1(muc.p0(stackTrace, new String[]{", "}, 0, 6), 3), " -> ", null, null, null, 62)));
        } else {
            sb.append("Stack: ".concat(bu1.F0(bu1.g1(muc.p0(stackTrace, new String[]{", "}, 0, 6), 5), " -> ", null, null, null, 62)));
        }
        return sb.toString();
    }

    public final String b() {
        Object ajbVar;
        try {
            StackTraceElement stackTraceElementA = a();
            ajbVar = stackTraceElementA != null ? stackTraceElementA.getFileName() : null;
            if (ajbVar == null) {
                ajbVar = "UnknownFile";
            }
        } catch (Throwable th) {
            ajbVar = new ajb(th);
        }
        return (String) (ajbVar instanceof ajb ? "UnknownFile" : ajbVar);
    }

    public final String c() {
        Object ajbVar;
        try {
            StackTraceElement stackTraceElementA = a();
            ajbVar = stackTraceElementA != null ? stackTraceElementA.getMethodName() : null;
            if (ajbVar == null) {
                ajbVar = "UnknownMethod";
            }
        } catch (Throwable th) {
            ajbVar = new ajb(th);
        }
        return (String) (ajbVar instanceof ajb ? "UnknownMethod" : ajbVar);
    }

    public final String d() {
        try {
            StackTraceElement[] stackTrace = new Throwable().getStackTrace();
            stackTrace.getClass();
            return k80.D0(stackTrace, ", ", null, null, b.INSTANCE, 30);
        } catch (Throwable th) {
            return bjb.b(new ajb(th)) != null ? "UnknownStackTrace" : "";
        }
    }

    public final boolean e() {
        String property;
        try {
            property = System.getProperty("java.class.path");
        } catch (Exception unused) {
        }
        if ((property == null || !muc.Q(property, "test", false)) && System.getProperty("org.gradle.test.worker") == null) {
            if (System.getProperty("idea.test.cyclic.buffer.size") == null) {
                return false;
            }
        }
        return true;
    }

    public final boolean f() {
        try {
            StackTraceElement[] stackTrace = Thread.currentThread().getStackTrace();
            stackTrace.getClass();
            for (StackTraceElement stackTraceElement : stackTrace) {
                String className = stackTraceElement.getClassName();
                className.getClass();
                if (muc.Q(className, "junit", true)) {
                    break;
                }
                String className2 = stackTraceElement.getClassName();
                className2.getClass();
                if (muc.Q(className2, "test", true)) {
                    break;
                }
                String className3 = stackTraceElement.getClassName();
                className3.getClass();
                if (muc.Q(className3, "robolectric", true)) {
                    break;
                }
                String className4 = stackTraceElement.getClassName();
                className4.getClass();
                if (muc.Q(className4, "mockito", true)) {
                    break;
                }
                String methodName = stackTraceElement.getMethodName();
                methodName.getClass();
                if (muc.Q(methodName, "test", true)) {
                    break;
                }
            }
        } catch (Exception unused) {
        }
        if (!e()) {
            return false;
        }
        return true;
    }

    public final void logBreadCrumb(String value, String details) {
        value.getClass();
        d.add(new c(null, value, details, 1, null));
    }

    public final void logDebug(String message, String detail, String additionalDetails, String stackTrace, String callingMethod, String callingFile) {
        ho2.Q(message, stackTrace, callingMethod, callingFile);
        if (shouldLogToLogcat$default(this, false, 1, null)) {
            a("DEBUG", message, detail, additionalDetails, callingMethod, callingFile, stackTrace);
        }
    }

    public final void logError(String message, String detail, String additionalDetails, String stackTrace, String callingMethod, String callingFile) throws JSONException {
        Object ajbVar;
        ho2.Q(message, stackTrace, callingMethod, callingFile);
        a(message, detail, additionalDetails, stackTrace, callingMethod, callingFile);
        if (f()) {
            return;
        }
        JSONObject jSONObject = new JSONObject();
        jSONObject.put("message", detail);
        jSONObject.put("stack", stackTrace);
        JSONObject jSONObject2 = new JSONObject();
        jSONObject2.put("device.name", Build.MODEL);
        jSONObject2.put("device.OSVersion", Build.VERSION.RELEASE);
        if (additionalDetails == null) {
            additionalDetails = "";
        }
        String str = additionalDetails + "\n" + d;
        JSONObject jSONObject3 = new JSONObject();
        jSONObject3.put("additional.details", str);
        jSONObject3.put("method", callingMethod);
        jSONObject3.put("file", callingFile);
        jSONObject3.put("tags", jSONObject2);
        JSONObject jSONObject4 = new JSONObject();
        jSONObject4.put("action", message);
        jSONObject4.put("err", jSONObject);
        jSONObject4.put("meta", jSONObject3);
        g gVar = g.INSTANCE;
        String visitorIdentifierString = gVar.getVisitorIdentifierString();
        if (visitorIdentifierString == null) {
            visitorIdentifierString = "(no vid)";
        }
        jSONObject4.put("vid", visitorIdentifierString);
        jSONObject4.put("envId", gVar.getEnvironmentId());
        Map mapSingletonMap = Collections.singletonMap("x-ul-error", "userleap-" + System.currentTimeMillis() + "-error");
        mapSingletonMap.getClass();
        try {
            jhf jhfVar = this.networkService;
            String str2 = this.errorsPath;
            String string = jSONObject4.toString();
            string.getClass();
            jhfVar.b(str2, string, mapSingletonMap);
            sprig.b.b.sendEngineeringLoggingEvent$default(sprig.b.b.INSTANCE, "Error logged: " + jSONObject4, SprigLoggingLevel.ERROR, 0, 4, null);
            ajbVar = c1e.a;
        } catch (Throwable th) {
            ajbVar = new ajb(th);
        }
        Throwable thB = bjb.b(ajbVar);
        if (thB != null) {
            a("Failed to send error report", thB.getMessage());
        }
    }

    public final void logInfo(String message, String detail, String additionalDetails, String stackTrace, String callingMethod, String callingFile) {
        ho2.Q(message, stackTrace, callingMethod, callingFile);
        if (shouldLogToLogcat$default(this, false, 1, null)) {
            a(WavDirectory.LIST_INFO, message, detail, additionalDetails, callingMethod, callingFile, stackTrace);
        }
    }

    public final void logWarning(String message, String detail, String additionalDetails, String stackTrace, String callingMethod, String callingFile) {
        ho2.Q(message, stackTrace, callingMethod, callingFile);
        if (shouldLogToLogcat$default(this, false, 1, null)) {
            a("WARNING", message, detail, additionalDetails, callingMethod, callingFile, stackTrace);
        }
    }

    public final boolean a(boolean isError) {
        return isError;
    }

    public final void a(String message, String detail, String additionalDetails, String stackTrace, String callingMethod, String callingFile) {
        if (a(true)) {
            a("ERROR", message, detail, additionalDetails, callingMethod, callingFile, stackTrace);
        }
    }

    public final void a(String message, String detail) {
    }

    public final StackTraceElement a() {
        StackTraceElement[] stackTrace = new Throwable().getStackTrace();
        stackTrace.getClass();
        for (StackTraceElement stackTraceElement : stackTrace) {
            String className = stackTraceElement.getClassName();
            className.getClass();
            if (!muc.Q(className, e.class.getName(), false)) {
                return stackTraceElement;
            }
        }
        return null;
    }
}
