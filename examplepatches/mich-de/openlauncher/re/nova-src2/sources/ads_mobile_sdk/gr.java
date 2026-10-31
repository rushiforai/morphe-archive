package ads_mobile_sdk;

import android.content.Context;
import android.content.pm.PackageManager;
import android.os.Build;
import java.util.Map;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class gr implements b.gb {

    /* renamed from: a, reason: collision with root package name */
    public final Context f4034a;

    public gr(Context context) {
        Intrinsics.g(context, "context");
        this.f4034a = context;
    }

    @Override // b.gb
    public final Object a(tx0 tx0Var, Map map, Continuation continuation) throws Throwable {
        if (Build.VERSION.SDK_INT >= 30) {
            zi3.a(6, "CanOpenAppGmsgHandler not enabled on R+ devices.", null);
            return Unit.f71706a;
        }
        String str = (String) map.get("package_name");
        if (str == null || str.length() == 0) {
            zi3.a(6, "Package name missing in canOpenApp GMSG.", null);
            return Unit.f71706a;
        }
        PackageManager packageManager = this.f4034a.getPackageManager();
        boolean z11 = (packageManager != null ? packageManager.getLaunchIntentForPackage(str) : null) != null;
        com.google.gson.r rVar = new com.google.gson.r();
        rVar.r(str, Boolean.valueOf(z11));
        Object objA = tx0Var.a(rVar, "openableApp", continuation);
        return objA == CoroutineSingletons.f71806a ? objA : Unit.f71706a;
    }

    @Override // b.gb
    public final int b() {
        return 34;
    }
}
