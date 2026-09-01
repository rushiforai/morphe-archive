package com.datadog.android.rum;

import android.app.ActivityManager;
import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.os.Process;
import android.util.Log;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class DdRumContentProvider extends ContentProvider {
    public static int a;
    public static final long b = System.nanoTime();

    @Override // android.content.ContentProvider
    public final int delete(Uri uri, String str, String[] strArr) {
        uri.getClass();
        return 0;
    }

    @Override // android.content.ContentProvider
    public final String getType(Uri uri) {
        uri.getClass();
        return null;
    }

    @Override // android.content.ContentProvider
    public final Uri insert(Uri uri, ContentValues contentValues) {
        uri.getClass();
        return null;
    }

    @Override // android.content.ContentProvider
    public final boolean onCreate() {
        List<ActivityManager.RunningAppProcessInfo> runningAppProcesses;
        if (a != 0) {
            return true;
        }
        Context context = getContext();
        ActivityManager.RunningAppProcessInfo runningAppProcessInfo = null;
        Object obj = null;
        runningAppProcessInfo = null;
        Object systemService = context != null ? context.getSystemService("activity") : null;
        ActivityManager activityManager = systemService instanceof ActivityManager ? (ActivityManager) systemService : null;
        int iMyPid = Process.myPid();
        if (activityManager != null && (runningAppProcesses = activityManager.getRunningAppProcesses()) != null) {
            Iterator<T> it2 = runningAppProcesses.iterator();
            while (true) {
                if (!it2.hasNext()) {
                    break;
                }
                Object next = it2.next();
                if (((ActivityManager.RunningAppProcessInfo) next).pid == iMyPid) {
                    obj = next;
                    break;
                }
            }
            runningAppProcessInfo = (ActivityManager.RunningAppProcessInfo) obj;
        }
        int i = runningAppProcessInfo != null ? runningAppProcessInfo.importance : 100;
        a = i;
        Log.w("DdRumContentProvider", "processImportance:" + i);
        return true;
    }

    @Override // android.content.ContentProvider
    public final Cursor query(Uri uri, String[] strArr, String str, String[] strArr2, String str2) {
        uri.getClass();
        return null;
    }

    @Override // android.content.ContentProvider
    public final int update(Uri uri, ContentValues contentValues, String str, String[] strArr) {
        uri.getClass();
        return 0;
    }
}
