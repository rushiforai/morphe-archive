package m;

import android.app.Service;
import android.content.ComponentName;
import android.content.Context;
import android.content.pm.ServiceInfo;

/* loaded from: classes2.dex */
public abstract class l0 extends Service {
    public static ServiceInfo a(Context context) {
        return context.getPackageManager().getServiceInfo(new ComponentName(context, (Class<?>) l0.class), k0.a() | 128);
    }
}
