package defpackage;

import android.app.PendingIntent;
import android.os.Build;
import com.medium.android.core.navigation.s;
import com.medium.android.donkey.main.MainActivity;
import com.medium.android.graphql.type.AppConfigSupportStatus;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ze7 implements do4 {
    public final /* synthetic */ int a;
    public final /* synthetic */ MainActivity b;

    public /* synthetic */ ze7(MainActivity mainActivity, int i) {
        this.a = i;
        this.b = mainActivity;
    }

    @Override // defpackage.do4
    public final Object a(Object obj, n92 n92Var) throws PendingIntent.CanceledException {
        int i = this.a;
        c1e c1eVar = c1e.a;
        MainActivity mainActivity = this.b;
        switch (i) {
            case 0:
                AppConfigSupportStatus appConfigSupportStatus = (AppConfigSupportStatus) obj;
                s sVarT = mainActivity.t();
                String str = mainActivity.w;
                if (str != null) {
                    wgf.H(mainActivity, appConfigSupportStatus, sVarT, str);
                    return c1eVar;
                }
                g76.g0("appVersionName");
                throw null;
            default:
                ((Boolean) obj).getClass();
                if (Build.VERSION.SDK_INT >= 33) {
                    if (mainActivity.shouldShowRequestPermissionRationale("android.permission.POST_NOTIFICATIONS")) {
                        ((p13) mainActivity.t()).o0(mainActivity, "");
                    } else {
                        mainActivity.C.a("android.permission.POST_NOTIFICATIONS", null);
                    }
                }
                return c1eVar;
        }
    }
}
