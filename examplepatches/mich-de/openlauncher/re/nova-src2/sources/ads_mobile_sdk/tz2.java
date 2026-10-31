package ads_mobile_sdk;

import b.c0;
import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.vungle.ads.internal.protos.Sdk;
import kotlin.Metadata;
import kotlin.jvm.JvmField;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u000e\n\u0002\b\u000b\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0010\t\n\u0002\b\u0004\b\u0086\b\u0018\u00002\u00020\u0001R\u0016\u0010\u0005\u001a\u0004\u0018\u00010\u00028\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0003\u0010\u0004R\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00028\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0004R\u0016\u0010\t\u001a\u0004\u0018\u00010\u00028\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0004R\u0018\u0010\u000b\u001a\u0004\u0018\u00010\u00028\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\b\n\u0010\u0004R\u0018\u0010\r\u001a\u0004\u0018\u00010\u00028\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\b\f\u0010\u0004R\u0018\u0010\u0011\u001a\u0004\u0018\u00010\u000e8\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\b\u000f\u0010\u0010R\u0018\u0010\u0015\u001a\u0004\u0018\u00010\u00128\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\b\u0013\u0010\u0014¨\u0006\u0016"}, d2 = {"Lads_mobile_sdk/tz2;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "a", "Ljava/lang/String;", "adapterClassName", "b", "adapterVersion", "c", "sdkVersion", "d", "signals", "e", "signalErrorMessage", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationDefs.GENDER_FEMALE, "Ljava/lang/Integer;", "signalErrorCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "g", "Ljava/lang/Long;", "latency", "ads-mobile-sdk_release"}, k = 1, mv = {1, 9, 0})
/* loaded from: classes2.dex */
public final /* data */ class tz2 {

    /* renamed from: a, reason: collision with root package name and from kotlin metadata */
    @gn.c(PendingUpgradeStore.KEY_NAME)
    @JvmField
    @Nullable
    public final String adapterClassName;

    /* renamed from: b, reason: collision with root package name and from kotlin metadata */
    @gn.c("adapter_version")
    @JvmField
    @Nullable
    public final String adapterVersion;

    /* renamed from: c, reason: collision with root package name and from kotlin metadata */
    @gn.c("sdk_version")
    @JvmField
    @Nullable
    public final String sdkVersion;

    /* renamed from: d, reason: collision with root package name and from kotlin metadata */
    @gn.c("signals")
    @JvmField
    @Nullable
    public String signals;

    /* renamed from: e, reason: collision with root package name and from kotlin metadata */
    @gn.c("signal_error")
    @JvmField
    @Nullable
    public String signalErrorMessage;

    /* renamed from: f, reason: collision with root package name and from kotlin metadata */
    @gn.c("signal_error_code")
    @JvmField
    @Nullable
    public Integer signalErrorCode;

    /* renamed from: g, reason: collision with root package name and from kotlin metadata */
    @gn.c("latency")
    @JvmField
    @Nullable
    public Long latency;

    public tz2() {
        this(null, null, null, null, null, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof tz2)) {
            return false;
        }
        tz2 tz2Var = (tz2) obj;
        return Intrinsics.b(this.adapterClassName, tz2Var.adapterClassName) && Intrinsics.b(this.adapterVersion, tz2Var.adapterVersion) && Intrinsics.b(this.sdkVersion, tz2Var.sdkVersion) && Intrinsics.b(this.signals, tz2Var.signals) && Intrinsics.b(this.signalErrorMessage, tz2Var.signalErrorMessage) && Intrinsics.b(this.signalErrorCode, tz2Var.signalErrorCode) && Intrinsics.b(this.latency, tz2Var.latency);
    }

    public final int hashCode() {
        String str = this.adapterClassName;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        String str2 = this.adapterVersion;
        int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.sdkVersion;
        int iHashCode3 = (iHashCode2 + (str3 == null ? 0 : str3.hashCode())) * 31;
        String str4 = this.signals;
        int iHashCode4 = (iHashCode3 + (str4 == null ? 0 : str4.hashCode())) * 31;
        String str5 = this.signalErrorMessage;
        int iHashCode5 = (iHashCode4 + (str5 == null ? 0 : str5.hashCode())) * 31;
        Integer num = this.signalErrorCode;
        int iHashCode6 = (iHashCode5 + (num == null ? 0 : num.hashCode())) * 31;
        Long l9 = this.latency;
        return iHashCode6 + (l9 != null ? l9.hashCode() : 0);
    }

    public final String toString() {
        String str = this.adapterClassName;
        String str2 = this.adapterVersion;
        String str3 = this.sdkVersion;
        String str4 = this.signals;
        String str5 = this.signalErrorMessage;
        Integer num = this.signalErrorCode;
        Long l9 = this.latency;
        StringBuilder sbW = c0.w("RtbAdapterData(adapterClassName=", str, ", adapterVersion=", str2, ", sdkVersion=");
        c0.D(sbW, str3, ", signals=", str4, ", signalErrorMessage=");
        sbW.append(str5);
        sbW.append(", signalErrorCode=");
        sbW.append(num);
        sbW.append(", latency=");
        sbW.append(l9);
        sbW.append(")");
        return sbW.toString();
    }

    public tz2(String str, String str2, String str3, String str4, Integer num, int i5) {
        str = (i5 & 1) != 0 ? null : str;
        str2 = (i5 & 2) != 0 ? null : str2;
        str3 = (i5 & 4) != 0 ? null : str3;
        str4 = (i5 & 16) != 0 ? null : str4;
        num = (i5 & 32) != 0 ? null : num;
        this.adapterClassName = str;
        this.adapterVersion = str2;
        this.sdkVersion = str3;
        this.signals = null;
        this.signalErrorMessage = str4;
        this.signalErrorCode = num;
        this.latency = null;
    }
}
