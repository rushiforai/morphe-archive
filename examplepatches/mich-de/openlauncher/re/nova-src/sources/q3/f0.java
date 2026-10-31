package q3;

import android.content.Context;
import android.os.Build;

/* loaded from: classes2.dex */
public abstract class f0 {
    public static final int a(Context context) {
        if (context == null || Build.VERSION.SDK_INT < 31 || context.getResources().getConfiguration().fontWeightAdjustment == Integer.MAX_VALUE) {
            return 0;
        }
        return context.getResources().getConfiguration().fontWeightAdjustment;
    }
}
