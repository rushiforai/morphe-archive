package defpackage;

import android.app.ActivityManager;
import android.os.Looper;
import android.os.Process;
import java.util.List;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import org.json.JSONArray;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class f {
    public static final int a = Process.myUid();
    public static final ScheduledExecutorService b = Executors.newSingleThreadScheduledExecutor();
    public static String c = "";
    public static final e d = new e(0);

    public static final void a(ActivityManager activityManager) {
        if (ec2.a.contains(f.class)) {
            return;
        }
        try {
            List<ActivityManager.ProcessErrorStateInfo> processesInErrorState = activityManager.getProcessesInErrorState();
            if (processesInErrorState != null) {
                for (ActivityManager.ProcessErrorStateInfo processErrorStateInfo : processesInErrorState) {
                    if (processErrorStateInfo.condition == 2 && processErrorStateInfo.uid == a) {
                        Thread thread = Looper.getMainLooper().getThread();
                        thread.getClass();
                        StackTraceElement[] stackTrace = thread.getStackTrace();
                        JSONArray jSONArray = new JSONArray();
                        stackTrace.getClass();
                        for (StackTraceElement stackTraceElement : stackTrace) {
                            jSONArray.put(stackTraceElement.toString());
                        }
                        String string = jSONArray.toString();
                        if (!g76.L(string, c) && xz5.d0(thread)) {
                            c = string;
                            vv2.t(processErrorStateInfo.shortMsg, string).b();
                        }
                    }
                }
            }
        } catch (Throwable th) {
            ec2.a(f.class, th);
        }
    }
}
