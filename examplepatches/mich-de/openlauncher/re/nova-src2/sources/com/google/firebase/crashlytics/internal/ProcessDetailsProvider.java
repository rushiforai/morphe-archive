package com.google.firebase.crashlytics.internal;

import android.app.ActivityManager;
import android.app.Application;
import android.content.Context;
import android.os.Build;
import android.os.Process;
import b70.c;
import b70.g;
import com.google.firebase.crashlytics.internal.model.CrashlyticsReport;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;
import kotlin.collections.EmptyList;
import kotlin.jvm.JvmOverloads;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u00004\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0002\bÀ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0014\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u00052\u0006\u0010\u0007\u001a\u00020\bJ\u000e\u0010\t\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\bJ.\u0010\n\u001a\u00020\u00062\u0006\u0010\u000b\u001a\u00020\f2\b\b\u0002\u0010\r\u001a\u00020\u000e2\b\b\u0002\u0010\u000f\u001a\u00020\u000e2\b\b\u0002\u0010\u0010\u001a\u00020\u0011H\u0007J\b\u0010\u0012\u001a\u00020\fH\u0002¨\u0006\u0013"}, d2 = {"Lcom/google/firebase/crashlytics/internal/ProcessDetailsProvider;", b.f42142b, "<init>", "()V", "getAppProcessDetails", b.f42142b, "Lcom/google/firebase/crashlytics/internal/model/CrashlyticsReport$Session$Event$Application$ProcessDetails;", "context", "Landroid/content/Context;", "getCurrentProcessDetails", "buildProcessDetails", "processName", b.f42142b, "pid", b.f42142b, "importance", "isDefaultProcess", b.f42142b, "getProcessName", "com.google.firebase-firebase-crashlytics"}, k = 1, mv = {2, 0, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes.dex */
public final class ProcessDetailsProvider {

    @NotNull
    public static final ProcessDetailsProvider INSTANCE = new ProcessDetailsProvider();

    private ProcessDetailsProvider() {
    }

    public static /* synthetic */ CrashlyticsReport.Session.Event.Application.ProcessDetails buildProcessDetails$default(ProcessDetailsProvider processDetailsProvider, String str, int i5, int i11, boolean z11, int i12, Object obj) {
        if ((i12 & 2) != 0) {
            i5 = 0;
        }
        if ((i12 & 4) != 0) {
            i11 = 0;
        }
        if ((i12 & 8) != 0) {
            z11 = false;
        }
        return processDetailsProvider.buildProcessDetails(str, i5, i11, z11);
    }

    private final String getProcessName() {
        String processName;
        int i5 = Build.VERSION.SDK_INT;
        if (i5 <= 33) {
            return (i5 < 28 || (processName = Application.getProcessName()) == null) ? b.f42142b : processName;
        }
        String strMyProcessName = Process.myProcessName();
        Intrinsics.d(strMyProcessName);
        return strMyProcessName;
    }

    @JvmOverloads
    @NotNull
    public final CrashlyticsReport.Session.Event.Application.ProcessDetails buildProcessDetails(@NotNull String processName) {
        Intrinsics.g(processName, "processName");
        return buildProcessDetails$default(this, processName, 0, 0, false, 14, null);
    }

    @NotNull
    public final List<CrashlyticsReport.Session.Event.Application.ProcessDetails> getAppProcessDetails(@NotNull Context context) {
        List<ActivityManager.RunningAppProcessInfo> runningAppProcesses;
        Intrinsics.g(context, "context");
        int i5 = context.getApplicationInfo().uid;
        String str = context.getApplicationInfo().processName;
        Object systemService = context.getSystemService("activity");
        ActivityManager activityManager = systemService instanceof ActivityManager ? (ActivityManager) systemService : null;
        if (activityManager == null || (runningAppProcesses = activityManager.getRunningAppProcesses()) == null) {
            runningAppProcesses = EmptyList.f71733a;
        }
        ArrayList arrayListU0 = g.U0(runningAppProcesses);
        ArrayList arrayList = new ArrayList();
        Iterator it = arrayListU0.iterator();
        while (it.hasNext()) {
            Object next = it.next();
            if (((ActivityManager.RunningAppProcessInfo) next).uid == i5) {
                arrayList.add(next);
            }
        }
        ArrayList arrayList2 = new ArrayList(c.u0(arrayList, 10));
        Iterator it2 = arrayList.iterator();
        while (it2.hasNext()) {
            ActivityManager.RunningAppProcessInfo runningAppProcessInfo = (ActivityManager.RunningAppProcessInfo) it2.next();
            arrayList2.add(CrashlyticsReport.Session.Event.Application.ProcessDetails.builder().setProcessName(runningAppProcessInfo.processName).setPid(runningAppProcessInfo.pid).setImportance(runningAppProcessInfo.importance).setDefaultProcess(Intrinsics.b(runningAppProcessInfo.processName, str)).build());
        }
        return arrayList2;
    }

    @NotNull
    public final CrashlyticsReport.Session.Event.Application.ProcessDetails getCurrentProcessDetails(@NotNull Context context) {
        Object next;
        Intrinsics.g(context, "context");
        int iMyPid = Process.myPid();
        Iterator<T> it = getAppProcessDetails(context).iterator();
        while (true) {
            if (!it.hasNext()) {
                next = null;
                break;
            }
            next = it.next();
            if (((CrashlyticsReport.Session.Event.Application.ProcessDetails) next).getPid() == iMyPid) {
                break;
            }
        }
        CrashlyticsReport.Session.Event.Application.ProcessDetails processDetails = (CrashlyticsReport.Session.Event.Application.ProcessDetails) next;
        return processDetails == null ? buildProcessDetails$default(this, getProcessName(), iMyPid, 0, false, 12, null) : processDetails;
    }

    @JvmOverloads
    @NotNull
    public final CrashlyticsReport.Session.Event.Application.ProcessDetails buildProcessDetails(@NotNull String processName, int i5) {
        Intrinsics.g(processName, "processName");
        return buildProcessDetails$default(this, processName, i5, 0, false, 12, null);
    }

    @JvmOverloads
    @NotNull
    public final CrashlyticsReport.Session.Event.Application.ProcessDetails buildProcessDetails(@NotNull String processName, int i5, int i11) {
        Intrinsics.g(processName, "processName");
        return buildProcessDetails$default(this, processName, i5, i11, false, 8, null);
    }

    @JvmOverloads
    @NotNull
    public final CrashlyticsReport.Session.Event.Application.ProcessDetails buildProcessDetails(@NotNull String processName, int pid, int importance, boolean isDefaultProcess) {
        Intrinsics.g(processName, "processName");
        CrashlyticsReport.Session.Event.Application.ProcessDetails processDetailsBuild = CrashlyticsReport.Session.Event.Application.ProcessDetails.builder().setProcessName(processName).setPid(pid).setImportance(importance).setDefaultProcess(isDefaultProcess).build();
        Intrinsics.f(processDetailsBuild, "build(...)");
        return processDetailsBuild;
    }
}
