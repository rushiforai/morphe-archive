package xg;

import android.os.StrictMode;

/* loaded from: classes.dex */
public abstract class e {
    public static StrictMode.VmPolicy.Builder a(StrictMode.VmPolicy.Builder builder) {
        return builder.permitUnsafeIntentLaunch();
    }
}
