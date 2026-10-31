package id;

import android.os.Bundle;
import com.google.ads.mediation.moloco.MolocoMediationAdapter;
import eg.w;
import java.util.NoSuchElementException;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes3.dex */
public abstract class p {
    public static Object a(w wVar, eg.f fVar) {
        Bundle bundle = wVar.f52743d;
        Intrinsics.f(bundle, "getServerParameters(...)");
        String string = bundle.getString(MolocoMediationAdapter.KEY_AD_UNIT_ID);
        if (string == null || string.length() == 0) {
            fVar.onFailure(new bg.a(102, MolocoMediationAdapter.ERROR_MSG_MISSING_AD_UNIT, MolocoMediationAdapter.ADAPTER_ERROR_DOMAIN));
            int i5 = Result.f71687b;
            return ResultKt.a(new NoSuchElementException(MolocoMediationAdapter.ERROR_MSG_MISSING_AD_UNIT));
        }
        String str = wVar.f52742c;
        Intrinsics.f(str, "getBidResponse(...)");
        String str2 = wVar.f52747h;
        Intrinsics.f(str2, "getWatermark(...)");
        int i11 = Result.f71687b;
        return new r(fVar, string, str, str2);
    }
}
