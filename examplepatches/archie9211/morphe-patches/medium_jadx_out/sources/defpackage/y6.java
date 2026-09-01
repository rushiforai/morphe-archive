package defpackage;

import android.app.ActivityOptions;
import android.os.Build;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class y6 extends z6 {
    public final ActivityOptions a;

    public y6(ActivityOptions activityOptions) {
        this.a = activityOptions;
    }

    public final y6 a(int i) {
        int i2 = Build.VERSION.SDK_INT;
        ActivityOptions activityOptions = this.a;
        if (i2 >= 34) {
            activityOptions.setPendingIntentBackgroundActivityStartMode(i);
            return this;
        }
        if (i2 >= 33) {
            activityOptions.setPendingIntentBackgroundActivityLaunchAllowed(i != 2);
        }
        return this;
    }
}
