package defpackage;

import android.content.ComponentName;
import android.content.Context;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class ay8 {
    public static final String a = d87.k("PackageManagerHelper");

    public static void a(Context context, Class cls, boolean z) {
        String str = a;
        try {
            int componentEnabledSetting = context.getPackageManager().getComponentEnabledSetting(new ComponentName(context, cls.getName()));
            boolean z2 = false;
            if (componentEnabledSetting != 0 && componentEnabledSetting == 1) {
                z2 = true;
            }
            if (z == z2) {
                d87.h().d(str, "Skipping component enablement for ".concat(cls.getName()));
                return;
            }
            context.getPackageManager().setComponentEnabledSetting(new ComponentName(context, cls.getName()), z ? 1 : 2, 1);
            d87 d87VarH = d87.h();
            StringBuilder sb = new StringBuilder();
            sb.append(cls.getName());
            sb.append(" ");
            sb.append(z ? "enabled" : "disabled");
            d87VarH.d(str, sb.toString());
        } catch (Exception e) {
            d87 d87VarH2 = d87.h();
            StringBuilder sb2 = new StringBuilder(cls.getName());
            sb2.append("could not be ");
            sb2.append(z ? "enabled" : "disabled");
            d87VarH2.e(str, sb2.toString(), e);
        }
    }
}
