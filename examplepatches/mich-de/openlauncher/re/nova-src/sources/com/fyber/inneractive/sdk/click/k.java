package com.fyber.inneractive.sdk.click;

import android.content.pm.ActivityInfo;
import android.content.pm.ResolveInfo;
import java.util.Comparator;

/* loaded from: classes3.dex */
public final class k implements Comparator {
    @Override // java.util.Comparator
    public final int compare(Object obj, Object obj2) {
        ActivityInfo activityInfo;
        String str;
        ResolveInfo resolveInfo = (ResolveInfo) obj2;
        ActivityInfo activityInfo2 = ((ResolveInfo) obj).activityInfo;
        if (activityInfo2 == null || (activityInfo = resolveInfo.activityInfo) == null || (str = activityInfo2.packageName) == null) {
            return 1;
        }
        return str.compareTo(activityInfo.packageName);
    }
}
