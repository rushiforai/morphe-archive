package com.bytedance.sdk.openadsdk.core.xkz;

import android.text.TextUtils;
import android.view.View;
import android.webkit.WebView;
import com.iab.omid.library.bytedance2.adsession.AdEvents;
import com.iab.omid.library.bytedance2.adsession.AdSession;
import com.iab.omid.library.bytedance2.adsession.AdSessionConfiguration;
import com.iab.omid.library.bytedance2.adsession.AdSessionContext;
import com.iab.omid.library.bytedance2.adsession.CreativeType;
import com.iab.omid.library.bytedance2.adsession.ImpressionType;
import com.iab.omid.library.bytedance2.adsession.Owner;
import com.iab.omid.library.bytedance2.adsession.Partner;
import com.iab.omid.library.bytedance2.adsession.VerificationScriptResource;
import com.iab.omid.library.bytedance2.adsession.media.MediaEvents;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/* loaded from: classes2.dex */
public class fby {
    public static ul ycx(View view, Set<jc> set) {
        AdSession adSessionYcx = ycx(CreativeType.VIDEO, set, Owner.NATIVE);
        return new jw(adSessionYcx, AdEvents.createAdEvents(adSessionYcx), view, MediaEvents.createMediaEvents(adSessionYcx));
    }

    public static ul ycx(WebView webView) {
        Partner partnerYcx = lud.ycx();
        if (partnerYcx != null) {
            AdSession adSessionCreateAdSession = AdSession.createAdSession(AdSessionConfiguration.createAdSessionConfiguration(CreativeType.HTML_DISPLAY, ImpressionType.BEGIN_TO_RENDER, Owner.NATIVE, Owner.NONE, false), AdSessionContext.createHtmlAdSessionContext(partnerYcx, webView, b.f42142b, b.f42142b));
            return new ul(adSessionCreateAdSession, AdEvents.createAdEvents(adSessionCreateAdSession), webView);
        }
        throw new IllegalArgumentException("Parameter 'partner' may not be null.");
    }

    private static AdSession ycx(CreativeType creativeType, Set<jc> set, Owner owner) {
        List<VerificationScriptResource> listYcx = ycx(set);
        listYcx.isEmpty();
        Partner partnerYcx = lud.ycx();
        if (partnerYcx == null) {
            return null;
        }
        return AdSession.createAdSession(AdSessionConfiguration.createAdSessionConfiguration(creativeType, ImpressionType.BEGIN_TO_RENDER, Owner.NATIVE, owner, false), AdSessionContext.createNativeAdSessionContext(partnerYcx, lud.zb(), listYcx, b.f42142b, b.f42142b));
    }

    private static List<VerificationScriptResource> ycx(Set<jc> set) {
        ArrayList arrayList = new ArrayList();
        for (jc jcVar : set) {
            try {
                if (!TextUtils.isEmpty(jcVar.ycx()) && !TextUtils.isEmpty(jcVar.zb())) {
                    arrayList.add(VerificationScriptResource.createVerificationScriptResourceWithParameters(jcVar.ycx(), jcVar.sya(), jcVar.zb()));
                } else {
                    arrayList.add(VerificationScriptResource.createVerificationScriptResourceWithoutParameters(jcVar.sya()));
                }
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+CyGFw==", "becoggK+YMuJXs5pnhCjI178C5QAqGbVmQ==", "WPwolBe5X8KSQ9FUjxC0IVTgH5AQs3zVg0/E", Sdk.SDKError.Reason.OMSDK_DOWNLOAD_JS_ERROR_VALUE);
            }
        }
        return arrayList;
    }
}
