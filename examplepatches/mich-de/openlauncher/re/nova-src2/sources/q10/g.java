package q10;

import android.app.admin.DevicePolicyManager;
import android.content.Context;
import android.content.Intent;
import com.teslacoilsw.launcher.NovaDeviceAdminReceiver;
import com.teslacoilsw.launcher.screenoff.DeviceAdminEnableActivity;
import kotlin.coroutines.Continuation;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class g extends l {
    @Override // q10.l
    public final boolean g(Context context) {
        Object systemService = context.getSystemService("device_policy");
        Intrinsics.e(systemService, "null cannot be cast to non-null type android.app.admin.DevicePolicyManager");
        return ((DevicePolicyManager) systemService).isAdminActive(NovaDeviceAdminReceiver.f45645a);
    }

    @Override // q10.l
    public final Object i(Context context, Continuation continuation) {
        Object systemService = context.getSystemService("device_policy");
        Intrinsics.e(systemService, "null cannot be cast to non-null type android.app.admin.DevicePolicyManager");
        ((DevicePolicyManager) systemService).lockNow();
        return Boolean.TRUE;
    }

    @Override // q10.l
    public final void j(Context context) {
        context.startActivity(new Intent(context, (Class<?>) DeviceAdminEnableActivity.class));
    }
}
