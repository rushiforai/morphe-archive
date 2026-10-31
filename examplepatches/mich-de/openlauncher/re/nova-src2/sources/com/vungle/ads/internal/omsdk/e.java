package com.vungle.ads.internal.omsdk;

import android.webkit.WebView;
import com.iab.omid.library.vungle.Omid;
import com.iab.omid.library.vungle.adsession.AdSession;
import com.iab.omid.library.vungle.adsession.AdSessionConfiguration;
import com.iab.omid.library.vungle.adsession.AdSessionContext;
import com.iab.omid.library.vungle.adsession.CreativeType;
import com.iab.omid.library.vungle.adsession.ImpressionType;
import com.iab.omid.library.vungle.adsession.Owner;
import com.iab.omid.library.vungle.adsession.Partner;
import com.vungle.ads.BuildConfig;
import java.util.concurrent.TimeUnit;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class e implements f {

    /* renamed from: d, reason: collision with root package name */
    public static final long f47317d = TimeUnit.SECONDS.toMillis(1);

    /* renamed from: a, reason: collision with root package name */
    public final boolean f47318a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f47319b;

    /* renamed from: c, reason: collision with root package name */
    public AdSession f47320c;

    public e(boolean z11) {
        this.f47318a = z11;
    }

    public final void a() {
        if (this.f47318a && Omid.isActive()) {
            this.f47319b = true;
        }
    }

    public final void a(WebView webView) {
        Intrinsics.g(webView, "webView");
        if (this.f47319b && this.f47320c == null) {
            CreativeType creativeType = CreativeType.DEFINED_BY_JAVASCRIPT;
            ImpressionType impressionType = ImpressionType.DEFINED_BY_JAVASCRIPT;
            Owner owner = Owner.JAVASCRIPT;
            AdSession adSessionCreateAdSession = AdSession.createAdSession(AdSessionConfiguration.createAdSessionConfiguration(creativeType, impressionType, owner, owner, false), AdSessionContext.createHtmlAdSessionContext(Partner.createPartner(BuildConfig.OMSDK_PARTNER_NAME, BuildConfig.VERSION_NAME), webView, null, null));
            this.f47320c = adSessionCreateAdSession;
            if (adSessionCreateAdSession != null) {
                adSessionCreateAdSession.registerAdView(webView);
            }
            AdSession adSession = this.f47320c;
            if (adSession != null) {
                adSession.start();
            }
        }
    }
}
