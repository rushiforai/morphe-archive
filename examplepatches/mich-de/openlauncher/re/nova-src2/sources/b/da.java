package b;

import ads_mobile_sdk.mu0;
import ads_mobile_sdk.tx0;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.net.Uri;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.util.List;
import java.util.Map;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;

/* loaded from: classes.dex */
public final class da implements gb {
    @Override // b.gb
    public final Object a(tx0 tx0Var, Map map, Continuation continuation) throws Throwable {
        String str = (String) map.get("urls");
        if (str == null || str.length() == 0) {
            mu0.c("URLs missing in canOpenURLs GMSG.", null);
            return Unit.f71706a;
        }
        List<String> listI1 = r70.k.i1(str, new String[]{","}, 6);
        com.google.gson.r rVar = new com.google.gson.r();
        PackageManager packageManager = tx0Var.getContext().getPackageManager();
        for (String str2 : listI1) {
            List listI12 = r70.k.i1(str2, new String[]{";"}, 2);
            boolean z11 = false;
            if (packageManager.resolveActivity(new Intent(listI12.size() > 1 ? r70.k.u1((String) listI12.get(1)).toString() : "android.intent.action.VIEW", Uri.parse(r70.k.u1((String) listI12.get(0)).toString())), SQLiteDatabase.OPEN_FULLMUTEX) != null) {
                z11 = true;
            }
            rVar.r(str2, Boolean.valueOf(z11));
        }
        String str3 = (String) map.get("ad_mid");
        if (str3 != null && !r70.k.U0(str3)) {
            rVar.s("ad_mid", str3);
        }
        Object objA = tx0Var.a(rVar, "openableURLs", continuation);
        return objA == CoroutineSingletons.f71806a ? objA : Unit.f71706a;
    }

    @Override // b.gb
    public final int b() {
        return 22;
    }
}
