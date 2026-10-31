package id;

import android.os.Bundle;
import com.google.ads.mediation.moloco.MolocoMediationAdapter;
import java.util.NoSuchElementException;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes3.dex */
public abstract class a {
    public static Object a(eg.l lVar, eg.f fVar) {
        Bundle bundle = lVar.f52718d;
        Intrinsics.f(bundle, "getServerParameters(...)");
        bg.c cVar = lVar.f52722h;
        Intrinsics.f(cVar, "getAdSize(...)");
        String string = bundle.getString(MolocoMediationAdapter.KEY_AD_UNIT_ID);
        if (string == null || string.length() == 0) {
            fVar.onFailure(new bg.a(102, MolocoMediationAdapter.ERROR_MSG_MISSING_AD_UNIT, MolocoMediationAdapter.ADAPTER_ERROR_DOMAIN));
            int i5 = Result.f71687b;
            return ResultKt.a(new NoSuchElementException(MolocoMediationAdapter.ERROR_MSG_MISSING_AD_UNIT));
        }
        String str = lVar.f52717c;
        Intrinsics.f(str, "getBidResponse(...)");
        String str2 = lVar.f52723i;
        Intrinsics.f(str2, "getWatermark(...)");
        int i11 = Result.f71687b;
        return new c(fVar, cVar, string, str, str2);
    }
}
