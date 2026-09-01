package defpackage;

import android.app.ActivityManager;
import android.app.Application;
import android.content.Context;
import android.os.Build;
import android.os.Process;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class x1a {
    public static final x1a a = new x1a();

    public static ArrayList a(Context context) {
        List<ActivityManager.RunningAppProcessInfo> runningAppProcesses;
        context.getClass();
        int i = context.getApplicationInfo().uid;
        String str = context.getApplicationInfo().processName;
        Object systemService = context.getSystemService("activity");
        ActivityManager activityManager = systemService instanceof ActivityManager ? (ActivityManager) systemService : null;
        if (activityManager == null || (runningAppProcesses = activityManager.getRunningAppProcesses()) == null) {
            runningAppProcesses = ey3.a;
        }
        ArrayList arrayListV0 = bu1.v0(runningAppProcesses);
        ArrayList<ActivityManager.RunningAppProcessInfo> arrayList = new ArrayList();
        for (Object obj : arrayListV0) {
            if (((ActivityManager.RunningAppProcessInfo) obj).uid == i) {
                arrayList.add(obj);
            }
        }
        ArrayList arrayList2 = new ArrayList(cu1.k0(arrayList, 10));
        for (ActivityManager.RunningAppProcessInfo runningAppProcessInfo : arrayList) {
            ti0 ti0Var = new ti0();
            String str2 = runningAppProcessInfo.processName;
            if (str2 == null) {
                z72.c("Null processName");
                return null;
            }
            ti0Var.a = str2;
            ti0Var.b = runningAppProcessInfo.pid;
            byte b = (byte) (ti0Var.e | 1);
            ti0Var.c = runningAppProcessInfo.importance;
            ti0Var.e = (byte) (b | 2);
            ti0Var.d = g76.L(str2, str);
            ti0Var.e = (byte) (ti0Var.e | 4);
            arrayList2.add(ti0Var.a());
        }
        return arrayList2;
    }

    public final ed2 b(Context context) {
        Object next;
        String processName;
        context.getClass();
        int iMyPid = Process.myPid();
        Iterator it2 = a(context).iterator();
        while (true) {
            if (!it2.hasNext()) {
                next = null;
                break;
            }
            next = it2.next();
            if (((ui0) ((ed2) next)).b == iMyPid) {
                break;
            }
        }
        ed2 ed2Var = (ed2) next;
        if (ed2Var != null) {
            return ed2Var;
        }
        int i = Build.VERSION.SDK_INT;
        if (i > 33) {
            processName = Process.myProcessName();
            processName.getClass();
        } else if (i < 28 || (processName = Application.getProcessName()) == null) {
            processName = "";
        }
        ti0 ti0Var = new ti0();
        ti0Var.a = processName;
        ti0Var.b = iMyPid;
        byte b = (byte) (ti0Var.e | 1);
        ti0Var.c = 0;
        ti0Var.d = false;
        ti0Var.e = (byte) (((byte) (b | 2)) | 4);
        return ti0Var.a();
    }
}
