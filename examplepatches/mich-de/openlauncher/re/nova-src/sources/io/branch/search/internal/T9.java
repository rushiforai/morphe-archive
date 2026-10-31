package io.branch.search.internal;

import android.content.pm.LauncherActivityInfo;
import java.util.Iterator;
import java.util.List;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class T9 {
    @JvmStatic
    @NotNull
    public static final LauncherActivityInfo a(@NotNull List<? extends LauncherActivityInfo> activities) throws IllegalStateException {
        Object next;
        Intrinsics.g(activities, "activities");
        if (activities.size() == 1) {
            return activities.get(0);
        }
        if (activities.size() <= 1) {
            throw new IllegalStateException("No activities to launch");
        }
        Iterator<T> it = activities.iterator();
        while (true) {
            if (!it.hasNext()) {
                next = null;
                break;
            }
            next = it.next();
            LauncherActivityInfo launcherActivityInfo = (LauncherActivityInfo) next;
            if (Intrinsics.b(launcherActivityInfo.getComponentName().getPackageName(), "com.google.android.googlequicksearchbox") && Intrinsics.b(launcherActivityInfo.getComponentName().getClassName(), "com.google.android.googlequicksearchbox.SearchActivity")) {
                break;
            }
        }
        LauncherActivityInfo launcherActivityInfo2 = (LauncherActivityInfo) next;
        return launcherActivityInfo2 == null ? activities.get(0) : launcherActivityInfo2;
    }
}
