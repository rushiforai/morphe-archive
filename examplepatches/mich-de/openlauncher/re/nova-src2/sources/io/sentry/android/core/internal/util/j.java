package io.sentry.android.core.internal.util;

import android.content.Context;
import android.os.Process;

/* loaded from: classes4.dex */
public abstract class j {
    public static boolean a(Context context, String str) {
        i30.j.Q(context, "The application context is required.");
        return context.checkPermission(str, Process.myPid(), Process.myUid()) == 0;
    }
}
