package defpackage;

import android.os.Build;
import com.medium.android.data.preferences.DarkMode;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class bt2 {
    public static DarkMode a() {
        return Build.VERSION.SDK_INT >= 29 ? DarkMode.FOLLOW_SYSTEM : DarkMode.AUTO_BATTERY;
    }
}
