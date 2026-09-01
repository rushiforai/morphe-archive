package com.google.android.gms.internal.gtm;

import android.app.job.JobInfo;
import android.app.job.JobScheduler;
import android.os.Build;
import android.os.UserHandle;
import android.util.Log;
import java.lang.reflect.Method;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class zzft {
    private static final Method zza;
    private static final Method zzb;

    static {
        Method declaredMethod;
        Method declaredMethod2 = null;
        if (Build.VERSION.SDK_INT >= 24) {
            try {
                declaredMethod = JobScheduler.class.getDeclaredMethod("scheduleAsPackage", JobInfo.class, String.class, Integer.TYPE, String.class);
            } catch (NoSuchMethodException unused) {
                if (Log.isLoggable("JobSchedulerCompat", 6)) {
                    Log.e("JobSchedulerCompat", "No scheduleAsPackage method available, falling back to schedule");
                }
                declaredMethod = null;
            }
        } else {
            declaredMethod = null;
        }
        zza = declaredMethod;
        if (Build.VERSION.SDK_INT >= 24) {
            try {
                declaredMethod2 = UserHandle.class.getDeclaredMethod("myUserId", null);
            } catch (NoSuchMethodException unused2) {
                if (Log.isLoggable("JobSchedulerCompat", 6)) {
                    Log.e("JobSchedulerCompat", "No myUserId method available");
                }
            }
        }
        zzb = declaredMethod2;
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x0031  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static int zza(android.content.Context r5, android.app.job.JobInfo r6, java.lang.String r7, java.lang.String r8) {
        /*
            java.lang.String r7 = "jobscheduler"
            java.lang.Object r7 = r5.getSystemService(r7)
            android.app.job.JobScheduler r7 = (android.app.job.JobScheduler) r7
            r7.getClass()
            java.lang.reflect.Method r8 = com.google.android.gms.internal.gtm.zzft.zza
            if (r8 == 0) goto L76
            java.lang.String r8 = "android.permission.UPDATE_DEVICE_STATS"
            int r5 = r5.checkSelfPermission(r8)
            if (r5 == 0) goto L18
            goto L76
        L18:
            java.lang.reflect.Method r5 = com.google.android.gms.internal.gtm.zzft.zzb
            r8 = 0
            if (r5 == 0) goto L31
            java.lang.Class<android.os.UserHandle> r0 = android.os.UserHandle.class
            r1 = 0
            java.lang.Object r5 = r5.invoke(r0, r1)     // Catch: java.lang.reflect.InvocationTargetException -> L2d java.lang.IllegalAccessException -> L2f
            java.lang.Integer r5 = (java.lang.Integer) r5     // Catch: java.lang.reflect.InvocationTargetException -> L2d java.lang.IllegalAccessException -> L2f
            if (r5 == 0) goto L31
            int r5 = r5.intValue()     // Catch: java.lang.reflect.InvocationTargetException -> L2d java.lang.IllegalAccessException -> L2f
            goto L42
        L2d:
            r5 = move-exception
            goto L33
        L2f:
            r5 = move-exception
            goto L33
        L31:
            r5 = r8
            goto L42
        L33:
            r0 = 6
            java.lang.String r1 = "JobSchedulerCompat"
            boolean r0 = android.util.Log.isLoggable(r1, r0)
            if (r0 == 0) goto L31
            java.lang.String r0 = "myUserId invocation illegal"
            android.util.Log.e(r1, r0, r5)
            goto L31
        L42:
            java.lang.String r0 = "DispatchAlarm"
            java.lang.reflect.Method r1 = com.google.android.gms.internal.gtm.zzft.zza
            if (r1 == 0) goto L71
            java.lang.Integer r5 = java.lang.Integer.valueOf(r5)     // Catch: java.lang.reflect.InvocationTargetException -> L69 java.lang.IllegalAccessException -> L6b
            r2 = 4
            java.lang.Object[] r2 = new java.lang.Object[r2]     // Catch: java.lang.reflect.InvocationTargetException -> L69 java.lang.IllegalAccessException -> L6b
            r2[r8] = r6     // Catch: java.lang.reflect.InvocationTargetException -> L69 java.lang.IllegalAccessException -> L6b
            java.lang.String r3 = "com.google.android.gms"
            r4 = 1
            r2[r4] = r3     // Catch: java.lang.reflect.InvocationTargetException -> L69 java.lang.IllegalAccessException -> L6b
            r3 = 2
            r2[r3] = r5     // Catch: java.lang.reflect.InvocationTargetException -> L69 java.lang.IllegalAccessException -> L6b
            r5 = 3
            r2[r5] = r0     // Catch: java.lang.reflect.InvocationTargetException -> L69 java.lang.IllegalAccessException -> L6b
            java.lang.Object r5 = r1.invoke(r7, r2)     // Catch: java.lang.reflect.InvocationTargetException -> L69 java.lang.IllegalAccessException -> L6b
            java.lang.Integer r5 = (java.lang.Integer) r5     // Catch: java.lang.reflect.InvocationTargetException -> L69 java.lang.IllegalAccessException -> L6b
            if (r5 == 0) goto L75
            int r8 = r5.intValue()     // Catch: java.lang.reflect.InvocationTargetException -> L69 java.lang.IllegalAccessException -> L6b
            goto L75
        L69:
            r5 = move-exception
            goto L6c
        L6b:
            r5 = move-exception
        L6c:
            java.lang.String r8 = "error calling scheduleAsPackage"
            android.util.Log.e(r0, r8, r5)
        L71:
            int r8 = r7.schedule(r6)
        L75:
            return r8
        L76:
            int r5 = r7.schedule(r6)
            return r5
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.internal.gtm.zzft.zza(android.content.Context, android.app.job.JobInfo, java.lang.String, java.lang.String):int");
    }
}
