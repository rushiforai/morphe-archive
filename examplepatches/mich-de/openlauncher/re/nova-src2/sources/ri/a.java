package ri;

import b.c0;
import b.c9;
import b.t2;
import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import com.google.ads.mediation.moloco.MolocoMediationAdapter;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import gn.c;
import kotlin.Metadata;
import kotlin.jvm.JvmField;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0010\u000b\n\u0002\b\u0005\n\u0002\u0010\b\n\u0002\b\b\b\u0087\b\u0018\u00002\u00020\u0001R\u0014\u0010\u0005\u001a\u00020\u00028\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0003\u0010\u0004R\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00028\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0004R\u0014\u0010\u000b\u001a\u00020\b8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\t\u0010\nR\u0014\u0010\r\u001a\u00020\u00028\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\f\u0010\u0004R\u0016\u0010\u0011\u001a\u0004\u0018\u00010\u000e8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000f\u0010\u0010R\u0014\u0010\u0013\u001a\u00020\u00028\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0012\u0010\u0004R\u0014\u0010\u0015\u001a\u00020\u00028\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0014\u0010\u0004¨\u0006\u0016"}, d2 = {"Lri/a;", b.f42142b, b.f42142b, "a", "Ljava/lang/String;", "appId", "b", "adUnitId", b.f42142b, "c", "Z", "isCalledFromInit", "d", "packageName", b.f42142b, "e", "Ljava/lang/Integer;", "versionCode", InneractiveMediationDefs.GENDER_FEMALE, "afmaVersion", "g", "experimentIds", "ads-mobile-sdk_release"}, k = 1, mv = {1, 9, 0})
/* loaded from: classes3.dex */
public final /* data */ class a {

    /* renamed from: a, reason: collision with root package name and from kotlin metadata */
    @c("app_id")
    @JvmField
    @NotNull
    public final String appId;

    /* renamed from: b, reason: collision with root package name and from kotlin metadata */
    @c(MolocoMediationAdapter.KEY_AD_UNIT_ID)
    @JvmField
    @Nullable
    public final String adUnitId;

    /* renamed from: c, reason: collision with root package name and from kotlin metadata */
    @c("is_init")
    @JvmField
    public final boolean isCalledFromInit;

    /* renamed from: d, reason: collision with root package name and from kotlin metadata */
    @c("pn")
    @JvmField
    @NotNull
    public final String packageName;

    /* renamed from: e, reason: collision with root package name and from kotlin metadata */
    @c("version")
    @JvmField
    @Nullable
    public final Integer versionCode;

    /* renamed from: f, reason: collision with root package name and from kotlin metadata */
    @c("js")
    @JvmField
    @NotNull
    public final String afmaVersion;

    /* renamed from: g, reason: collision with root package name and from kotlin metadata */
    @c("experiment_ids")
    @JvmField
    @NotNull
    public final String experimentIds;

    public a(String str, String str2, boolean z11, String str3, Integer num, String afmaVersion, String experimentIds) {
        Intrinsics.g(afmaVersion, "afmaVersion");
        Intrinsics.g(experimentIds, "experimentIds");
        this.appId = str;
        this.adUnitId = str2;
        this.isCalledFromInit = z11;
        this.packageName = str3;
        this.versionCode = num;
        this.afmaVersion = afmaVersion;
        this.experimentIds = experimentIds;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a)) {
            return false;
        }
        a aVar = (a) obj;
        return Intrinsics.b(this.appId, aVar.appId) && Intrinsics.b(this.adUnitId, aVar.adUnitId) && this.isCalledFromInit == aVar.isCalledFromInit && Intrinsics.b(this.packageName, aVar.packageName) && Intrinsics.b(this.versionCode, aVar.versionCode) && Intrinsics.b(this.afmaVersion, aVar.afmaVersion) && Intrinsics.b(this.experimentIds, aVar.experimentIds);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final int hashCode() {
        int iHashCode = this.appId.hashCode() * 31;
        String str = this.adUnitId;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        boolean z11 = this.isCalledFromInit;
        int i5 = z11;
        if (z11 != 0) {
            i5 = 1;
        }
        int iA = t2.a(this.packageName, (iHashCode2 + i5) * 31);
        Integer num = this.versionCode;
        return this.experimentIds.hashCode() + t2.a(this.afmaVersion, (iA + (num != null ? num.hashCode() : 0)) * 31);
    }

    public final String toString() {
        String str = this.appId;
        String str2 = this.adUnitId;
        boolean z11 = this.isCalledFromInit;
        String str3 = this.packageName;
        Integer num = this.versionCode;
        String str4 = this.afmaVersion;
        String str5 = this.experimentIds;
        StringBuilder sbW = c0.w("ConfigLoaderRequest(appId=", str, ", adUnitId=", str2, ", isCalledFromInit=");
        c9.s(", packageName=", str3, ", versionCode=", sbW, z11);
        sbW.append(num);
        sbW.append(", afmaVersion=");
        sbW.append(str4);
        sbW.append(", experimentIds=");
        return c0.q(sbW, str5, ")");
    }
}
