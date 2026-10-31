package id;

import android.os.Bundle;
import com.google.ads.mediation.moloco.MolocoMediationAdapter;
import eg.s;
import java.util.NoSuchElementException;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes3.dex */
public abstract class k {
    public static Object a(s sVar, eg.f fVar) {
        Bundle bundle = sVar.f52735d;
        Intrinsics.f(bundle, "getServerParameters(...)");
        String string = bundle.getString(MolocoMediationAdapter.KEY_AD_UNIT_ID);
        if (string == null || string.length() == 0) {
            fVar.onFailure(new bg.a(102, MolocoMediationAdapter.ERROR_MSG_MISSING_AD_UNIT, MolocoMediationAdapter.ADAPTER_ERROR_DOMAIN));
            int i5 = Result.f71687b;
            return ResultKt.a(new NoSuchElementException(MolocoMediationAdapter.ERROR_MSG_MISSING_AD_UNIT));
        }
        String str = sVar.f52734c;
        Intrinsics.f(str, "getBidResponse(...)");
        String str2 = sVar.f52739h;
        Intrinsics.f(str2, "getWatermark(...)");
        int i11 = Result.f71687b;
        return new o(fVar, string, str, str2);
    }
}
