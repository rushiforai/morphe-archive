package b;

import ads_mobile_sdk.au;
import ads_mobile_sdk.d62;
import ads_mobile_sdk.mu0;
import ads_mobile_sdk.sx2;
import ads_mobile_sdk.tu0;
import ads_mobile_sdk.wd1;
import ads_mobile_sdk.xu0;
import ads_mobile_sdk.y11;
import android.hardware.SensorEvent;
import android.util.Base64;
import android.widget.LinearLayout;
import com.google.android.libraries.ads.mobile.sdk.common.AdActivity;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import java.util.List;
import java.util.Map;
import kotlin.Unit;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.Charsets;

/* loaded from: classes2.dex */
public abstract class fb implements f4 {
    public static final float a(SensorEvent sensorEvent) {
        float[] fArr = sensorEvent.values;
        float f11 = fArr[0] / 9.80665f;
        float f12 = fArr[1] / 9.80665f;
        float f13 = fArr[2] / 9.80665f;
        return (float) Math.sqrt((f13 * f13) + (f12 * f12) + (f11 * f11));
    }

    public static /* synthetic */ au b(za zaVar) {
        return new au(zaVar, 18);
    }

    public static /* synthetic */ au c(ib ibVar) {
        return new au(ibVar, 0);
    }

    public static final sx2 d(com.google.gson.p pVar) {
        if (!(pVar instanceof com.google.gson.m)) {
            return null;
        }
        com.google.gson.m mVarH = pVar.h();
        if (mVarH.f34793a.isEmpty()) {
            return null;
        }
        com.google.gson.p pVarR = mVarH.r(0);
        pVarR.getClass();
        if (!(pVarR instanceof com.google.gson.r)) {
            return null;
        }
        com.google.gson.r rVarJ = pVarR.j();
        return new sx2(d62.a(rVarJ, "rb_type", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b), d62.a(rVarJ, "rb_amount", 1));
    }

    public static ads_mobile_sdk.va e(pi.a initializationState, String description, int i5) {
        Intrinsics.g(initializationState, "initializationState");
        Intrinsics.g(description, "description");
        return new ads_mobile_sdk.va(initializationState, description, i5);
    }

    public static a1 f(List nativeAdTypes, List customFormatIds, mi.a aVar, Integer num) {
        Intrinsics.g(nativeAdTypes, "nativeAdTypes");
        Intrinsics.g(customFormatIds, "customFormatIds");
        if (nativeAdTypes.isEmpty()) {
            return new tu0("Native ad types cannot be empty.", wd1.f11214b);
        }
        ui.a aVar2 = ui.a.f91273b;
        if (nativeAdTypes.contains(aVar2) && customFormatIds.isEmpty()) {
            return new tu0("When requesting custom native ads, you must set at least one custom format ID.", wd1.f11214b);
        }
        ui.a aVar3 = ui.a.f91274c;
        if (nativeAdTypes.contains(aVar3) && nativeAdTypes.size() == 1) {
            return new tu0("A native ad request for banner ads only is not allowed. Suggested action: Use BannerAd to request banner ads.", wd1.f11214b);
        }
        if (nativeAdTypes.contains(aVar3) && aVar == null) {
            return new tu0("When requesting a banner ad, you must set at least one AdSize. Suggested action: Call NativeRequest.setAdSizes() with at least one ad size.", wd1.f11214b);
        }
        if (num.intValue() < 1) {
            return new tu0("Number of ads requested must be greater than 0.", wd1.f11214b);
        }
        if (!customFormatIds.isEmpty() && !nativeAdTypes.contains(aVar2)) {
            mu0.c("Custom native ad format IDs were provided, but custom native ads were not requested.", null);
        }
        if (aVar != null && !nativeAdTypes.contains(aVar3)) {
            mu0.c("AdSize was provided, but banner ads were not requested. Suggested action: Update NativeRequest.nativeAdTypes to add NativeAdType.BANNER.", null);
        }
        return new xu0(Unit.f71706a);
    }

    public static final com.google.gson.r g(y11 y11Var) {
        com.google.gson.r rVar = new com.google.gson.r();
        com.google.gson.r rVar2 = new com.google.gson.r();
        rVar2.s("uri", y11Var.f11913a.toString());
        rVar2.s("verb", y11Var.f11914b);
        Unit unit = Unit.f71706a;
        rVar.p("firstline", rVar2);
        Map map = y11Var.f11915c;
        if (map != null && !map.isEmpty()) {
            com.google.gson.m mVar = new com.google.gson.m();
            for (Map.Entry entry : map.entrySet()) {
                String str = (String) entry.getKey();
                String str2 = (String) entry.getValue();
                com.google.gson.r rVar3 = new com.google.gson.r();
                rVar3.s(PendingUpgradeStore.KEY_NAME, str);
                rVar3.s("value", str2);
                mVar.p(rVar3);
            }
            Unit unit2 = Unit.f71706a;
            rVar.p("headers", mVar);
        }
        byte[] bArr = y11Var.f11916d;
        if (bArr != null) {
            byte[] bytes = bArr.toString().getBytes(Charsets.f72000b);
            Intrinsics.f(bytes, "getBytes(...)");
            rVar.s("body", Base64.encodeToString(bytes, 0));
        }
        return rVar;
    }

    public static /* synthetic */ ads_mobile_sdk.va h(pi.a aVar, String str, int i5) {
        if ((i5 & 1) != 0) {
            aVar = pi.a.f82594a;
        }
        if ((i5 & 2) != 0) {
            str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        return e(aVar, str, 0);
    }

    public abstract Object a(ja jaVar, SuspendLambda suspendLambda);

    public abstract void a();

    public abstract void a(AdActivity adActivity, LinearLayout linearLayout);

    public abstract void a(ni.v vVar);

    @Override // b.f4
    public void a(AdActivity adActivity) {
        LinearLayout linearLayout = new LinearLayout(adActivity);
        adActivity.setContentView(linearLayout);
        a(adActivity, linearLayout);
    }
}
