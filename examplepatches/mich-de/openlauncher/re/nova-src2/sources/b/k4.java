package b;

import ads_mobile_sdk.dq2;
import ads_mobile_sdk.vw2;
import android.content.Context;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class k4 extends dq2 {
    @Override // ads_mobile_sdk.dq2
    public final vw2 a(Context context, mi.a adSize) {
        Intrinsics.g(adSize, "adSize");
        Intrinsics.g(context, "context");
        return new vw2(context, adSize);
    }
}
