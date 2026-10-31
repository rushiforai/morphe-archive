package ti;

import b.c0;
import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import kotlin.Metadata;
import kotlin.jvm.JvmField;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\n\b\u0087\b\u0018\u00002\u00020\u0001R\u0018\u0010\u0005\u001a\u0004\u0018\u00010\u00028\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\b\u0003\u0010\u0004R\u0018\u0010\t\u001a\u0004\u0018\u00010\u00068\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\b\u0007\u0010\bR\u0018\u0010\u000b\u001a\u0004\u0018\u00010\u00068\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\b\n\u0010\bR\u0018\u0010\r\u001a\u0004\u0018\u00010\u00068\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\b\f\u0010\bR\u0018\u0010\u0011\u001a\u0004\u0018\u00010\u000e8\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\b\u000f\u0010\u0010R\u0018\u0010\u0013\u001a\u0004\u0018\u00010\u00068\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\b\u0012\u0010\bR\u0018\u0010\u0015\u001a\u0004\u0018\u00010\u00068\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\b\u0014\u0010\bR\u0018\u0010\u0017\u001a\u0004\u0018\u00010\u00068\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\b\u0016\u0010\b¨\u0006\u0018"}, d2 = {"Lti/g;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lti/p;", "a", "Lti/p;", "signals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "b", "Ljava/lang/String;", TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, "c", "postBody", "d", "error", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "e", "Ljava/lang/Boolean;", "cookiesInclude", InneractiveMediationDefs.GENDER_FEMALE, "requestId", "g", "params", "h", "cParams", "ads-mobile-sdk_release"}, k = 1, mv = {1, 9, 0})
/* loaded from: classes.dex */
public final /* data */ class g {

    /* renamed from: a, reason: collision with root package name and from kotlin metadata */
    @gn.c("signals")
    @JvmField
    @Nullable
    public p signals;

    /* renamed from: b, reason: collision with root package name and from kotlin metadata */
    @gn.c(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL)
    @JvmField
    @Nullable
    public String url;

    /* renamed from: c, reason: collision with root package name and from kotlin metadata */
    @gn.c("post_body")
    @JvmField
    @Nullable
    public String postBody;

    /* renamed from: d, reason: collision with root package name and from kotlin metadata */
    @gn.c("error")
    @JvmField
    @Nullable
    public String error;

    /* renamed from: e, reason: collision with root package name and from kotlin metadata */
    @gn.c("cookies_include")
    @JvmField
    @Nullable
    public Boolean cookiesInclude;

    /* renamed from: f, reason: collision with root package name and from kotlin metadata */
    @gn.c("request_id")
    @JvmField
    @Nullable
    public String requestId;

    /* renamed from: g, reason: collision with root package name and from kotlin metadata */
    @gn.c("params")
    @JvmField
    @Nullable
    public String params;

    /* renamed from: h, reason: collision with root package name and from kotlin metadata */
    @gn.c("c_params")
    @JvmField
    @Nullable
    public String cParams;

    public g() {
        this(255, null, null, null, null, null, null);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof g)) {
            return false;
        }
        g gVar = (g) obj;
        return Intrinsics.b(this.signals, gVar.signals) && Intrinsics.b(this.url, gVar.url) && Intrinsics.b(this.postBody, gVar.postBody) && Intrinsics.b(this.error, gVar.error) && Intrinsics.b(this.cookiesInclude, gVar.cookiesInclude) && Intrinsics.b(this.requestId, gVar.requestId) && Intrinsics.b(this.params, gVar.params) && Intrinsics.b(this.cParams, gVar.cParams);
    }

    public final int hashCode() {
        p pVar = this.signals;
        int iHashCode = (pVar == null ? 0 : pVar.hashCode()) * 31;
        String str = this.url;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.postBody;
        int iHashCode3 = (iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.error;
        int iHashCode4 = (iHashCode3 + (str3 == null ? 0 : str3.hashCode())) * 31;
        Boolean bool = this.cookiesInclude;
        int iHashCode5 = (iHashCode4 + (bool == null ? 0 : bool.hashCode())) * 31;
        String str4 = this.requestId;
        int iHashCode6 = (iHashCode5 + (str4 == null ? 0 : str4.hashCode())) * 31;
        String str5 = this.params;
        int iHashCode7 = (iHashCode6 + (str5 == null ? 0 : str5.hashCode())) * 31;
        String str6 = this.cParams;
        return iHashCode7 + (str6 != null ? str6.hashCode() : 0);
    }

    public final String toString() {
        p pVar = this.signals;
        String str = this.url;
        String str2 = this.postBody;
        String str3 = this.error;
        Boolean bool = this.cookiesInclude;
        String str4 = this.requestId;
        String str5 = this.params;
        String str6 = this.cParams;
        StringBuilder sb2 = new StringBuilder("ClientRequestBuildingData(signals=");
        sb2.append(pVar);
        sb2.append(", url=");
        sb2.append(str);
        sb2.append(", postBody=");
        c0.D(sb2, str2, ", error=", str3, ", cookiesInclude=");
        sb2.append(bool);
        sb2.append(", requestId=");
        sb2.append(str4);
        sb2.append(", params=");
        return c0.s(sb2, str5, ", cParams=", str6, ")");
    }

    public g(int i5, Boolean bool, String str, String str2, String str3, String str4, String str5) {
        str = (i5 & 2) != 0 ? null : str;
        str2 = (i5 & 4) != 0 ? null : str2;
        str3 = (i5 & 8) != 0 ? null : str3;
        bool = (i5 & 16) != 0 ? null : bool;
        str4 = (i5 & 32) != 0 ? null : str4;
        str5 = (i5 & 128) != 0 ? null : str5;
        this.signals = null;
        this.url = str;
        this.postBody = str2;
        this.error = str3;
        this.cookiesInclude = bool;
        this.requestId = str4;
        this.params = null;
        this.cParams = str5;
    }
}
