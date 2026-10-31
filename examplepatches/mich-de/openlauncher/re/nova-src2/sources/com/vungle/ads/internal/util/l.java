package com.vungle.ads.internal.util;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import com.vungle.ads.LinkError;
import com.vungle.ads.internal.protos.Sdk;
import java.net.URISyntaxException;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class l {
    public static boolean a(String str, String str2, Context context, s sVar, com.vungle.ads.internal.ui.m mVar) {
        Intrinsics.g(context, "context");
        if ((str != null && str.length() != 0) || (str2 != null && str2.length() != 0)) {
            boolean z11 = !(context instanceof Activity);
            try {
                Intent intentA = a(z11, str);
                Intent intentA2 = a(z11, str2);
                d dVar = d.f47677f;
                return a.a(context, intentA, intentA2, mVar);
            } catch (Exception e3) {
                if (str == null || str.length() == 0) {
                    new LinkError(Sdk.SDKError.Reason.LINK_COMMAND_OPEN_FAILED, com.iab.omid.library.vungle.d.a("Fail to open ", str2)).setLogEntry$vungle_ads_release(sVar).logErrorNoReturnValue$vungle_ads_release();
                } else {
                    new LinkError(Sdk.SDKError.Reason.DEEPLINK_OPEN_FAILED, com.iab.omid.library.vungle.d.a("Fail to open ", str)).setLogEntry$vungle_ads_release(sVar).logErrorNoReturnValue$vungle_ads_release();
                }
                boolean z12 = u.f47714a;
                StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("Error while opening url");
                sbA.append(e3.getLocalizedMessage());
                t.b("ExternalRouter", sbA.toString());
                t.a("ExternalRouter", "Cannot open url " + str2);
            }
        }
        return false;
    }

    public static Intent a(boolean z11, String str) throws URISyntaxException {
        Intent uri = null;
        if (str != null) {
            try {
                if (str.length() != 0) {
                    uri = Intent.parseUri(str, 0);
                }
            } catch (URISyntaxException e3) {
                boolean z12 = u.f47714a;
                StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("url format is not correct ");
                sbA.append(e3.getLocalizedMessage());
                t.b("ExternalRouter", sbA.toString());
            }
        }
        if (uri != null && z11) {
            uri.setFlags(268435456);
            return uri;
        }
        return uri;
    }
}
