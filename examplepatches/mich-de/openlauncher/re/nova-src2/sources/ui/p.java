package ui;

import ads_mobile_sdk.au;
import ads_mobile_sdk.bu1;
import ads_mobile_sdk.mu0;
import android.content.Context;
import android.widget.ImageView;
import com.google.android.libraries.ads.mobile.sdk.nativead.NativeAdAssetNames;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes3.dex */
public final class p extends ni.o {
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public p(Context context) {
        super(context);
        Intrinsics.g(context, "context");
    }

    public final void a(d ad, mi.b bVar) {
        Intrinsics.g(ad, "ad");
        this.f78297a.a(bVar, NativeAdAssetNames.ASSET_MEDIA_CONTENT);
        if (bVar != null) {
            au auVar = new au(this, 2);
            synchronized (bVar) {
                bVar.f76413c = auVar;
                Unit unit = Unit.f71706a;
            }
            ImageView.ScaleType scaleType = (ImageView.ScaleType) bVar.f76412b;
            if (scaleType != null) {
                auVar.a(scaleType);
            }
        }
        if (ad instanceof bu1) {
            this.f78297a.a(((bu1) ad).f1561b);
        } else {
            mu0.c("Internal Error: Cannot display Native Ad", null);
        }
    }
}
