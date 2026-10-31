package com.amplitude.android.utilities;

import android.content.pm.PackageInfo;
import android.os.Build;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;

@Metadata(d1 = {"\u0000\f\n\u0000\n\u0002\u0010\u0004\n\u0002\u0018\u0002\n\u0000\u001a\f\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\u0002¨\u0006\u0003"}, d2 = {"getVersionCode", b.f42142b, "Landroid/content/pm/PackageInfo;", "android_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class DefaultEventUtilsKt {
    /* JADX INFO: Access modifiers changed from: private */
    public static final Number getVersionCode(PackageInfo packageInfo) {
        return Build.VERSION.SDK_INT >= 28 ? Long.valueOf(packageInfo.getLongVersionCode()) : Integer.valueOf(packageInfo.versionCode);
    }
}
