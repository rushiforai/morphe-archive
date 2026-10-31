package y7;

import android.content.ComponentName;
import android.content.Context;

/* loaded from: classes.dex */
public abstract class l {
    static {
        o7.r.e("PackageManagerHelper");
    }

    public static void a(Context context, Class cls, boolean z11) {
        try {
            int componentEnabledSetting = context.getPackageManager().getComponentEnabledSetting(new ComponentName(context, cls.getName()));
            boolean z12 = false;
            if (componentEnabledSetting != 0 && componentEnabledSetting == 1) {
                z12 = true;
            }
            if (z11 == z12) {
                o7.r.c().getClass();
            } else {
                context.getPackageManager().setComponentEnabledSetting(new ComponentName(context, cls.getName()), z11 ? 1 : 2, 1);
                o7.r.c().getClass();
            }
        } catch (Exception unused) {
            o7.r.c().getClass();
        }
    }
}
