package fo;

import b.c0;
import b.c9;
import com.instabridge.ai.auth.AiAuthMode;
import com.instabridge.ai.auth.TokenProvider;
import com.instabridge.ai.proactive.NotificationConfig;
import com.instabridge.ai.proactive.ProactiveGenerationConfig;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes3.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final String f55436a;

    /* renamed from: b, reason: collision with root package name */
    public final String f55437b;

    /* renamed from: c, reason: collision with root package name */
    public final String f55438c;

    /* renamed from: d, reason: collision with root package name */
    public final TokenProvider f55439d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f55440e;

    /* renamed from: f, reason: collision with root package name */
    public final String f55441f;

    /* renamed from: g, reason: collision with root package name */
    public final NotificationConfig f55442g;

    /* renamed from: h, reason: collision with root package name */
    public final boolean f55443h;

    /* renamed from: i, reason: collision with root package name */
    public final String f55444i;

    /* renamed from: j, reason: collision with root package name */
    public final boolean f55445j;

    /* renamed from: k, reason: collision with root package name */
    public final String f55446k;

    /* renamed from: l, reason: collision with root package name */
    public final String f55447l;

    /* renamed from: m, reason: collision with root package name */
    public final ProactiveGenerationConfig f55448m;
    public final String n;
    public final AiAuthMode o;

    public a(String str, String baseUrl, String webAppUrl, TokenProvider tokenProvider, boolean z11, String str2, NotificationConfig notificationConfig, boolean z12, String str3, boolean z13, String str4, String str5, ProactiveGenerationConfig proactiveGenerationConfig, String str6, AiAuthMode aiAuthMode) {
        Intrinsics.g(baseUrl, "baseUrl");
        Intrinsics.g(webAppUrl, "webAppUrl");
        Intrinsics.g(proactiveGenerationConfig, "proactiveGenerationConfig");
        this.f55436a = str;
        this.f55437b = baseUrl;
        this.f55438c = webAppUrl;
        this.f55439d = tokenProvider;
        this.f55440e = z11;
        this.f55441f = str2;
        this.f55442g = notificationConfig;
        this.f55443h = z12;
        this.f55444i = str3;
        this.f55445j = z13;
        this.f55446k = str4;
        this.f55447l = str5;
        this.f55448m = proactiveGenerationConfig;
        this.n = str6;
        this.o = aiAuthMode;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a)) {
            return false;
        }
        a aVar = (a) obj;
        return this.f55436a.equals(aVar.f55436a) && Intrinsics.b(this.f55437b, aVar.f55437b) && Intrinsics.b(this.f55438c, aVar.f55438c) && Intrinsics.b(this.f55439d, aVar.f55439d) && this.f55440e == aVar.f55440e && this.f55441f.equals(aVar.f55441f) && Intrinsics.b(this.f55442g, aVar.f55442g) && this.f55443h == aVar.f55443h && this.f55444i.equals(aVar.f55444i) && this.f55445j == aVar.f55445j && this.f55446k.equals(aVar.f55446k) && this.f55447l.equals(aVar.f55447l) && Intrinsics.b(this.f55448m, aVar.f55448m) && this.n.equals(aVar.n) && Intrinsics.b(this.o, aVar.o);
    }

    public final int hashCode() {
        int iE = c0.e(c0.e(this.f55436a.hashCode() * 31, 31, this.f55437b), 31, this.f55438c);
        TokenProvider tokenProvider = this.f55439d;
        int iE2 = c0.e(c9.f(c9.f((iE + (tokenProvider == null ? 0 : tokenProvider.hashCode())) * 31, 31, this.f55440e), 31, false), 31, this.f55441f);
        NotificationConfig notificationConfig = this.f55442g;
        int iE3 = c0.e((this.f55448m.hashCode() + c0.e(c0.e(c9.f(c0.e(c9.f((iE2 + (notificationConfig == null ? 0 : notificationConfig.hashCode())) * 31, 31, this.f55443h), 31, this.f55444i), 31, this.f55445j), 31, this.f55446k), 31, this.f55447l)) * 31, 31, this.n);
        AiAuthMode aiAuthMode = this.o;
        return iE3 + (aiAuthMode != null ? aiAuthMode.hashCode() : 0);
    }

    public final String toString() {
        return "Config(appId=" + this.f55436a + ", baseUrl=" + this.f55437b + ", webAppUrl=" + this.f55438c + ", tokenProvider=" + this.f55439d + ", useAnonymousAuth=" + this.f55440e + ", debugLogging=false, debugTag=" + this.f55441f + ", notificationConfig=" + this.f55442g + ", modelSelectorEnabled=" + this.f55443h + ", appDisplayName=" + this.f55444i + ", playBillingEnabled=" + this.f55445j + ", premiumPlanDisplayName=" + this.f55446k + ", premiumPlanBadgeLabel=" + this.f55447l + ", proactiveGenerationConfig=" + this.f55448m + ", contextProductSurface=" + this.n + ", authMode=" + this.o + ')';
    }
}
