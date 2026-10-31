package qi;

import android.os.Bundle;
import b.c0;
import b.k9;
import b.t2;
import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import com.google.gson.m;
import com.google.gson.r;
import gn.c;
import java.util.ArrayList;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.JvmField;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u00008\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0010 \n\u0002\b\u000f\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0087\b\u0018\u00002\u00020\u0001R\u0014\u0010\u0005\u001a\u00020\u00028\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0003\u0010\u0004R\u0014\u0010\u0007\u001a\u00020\u00028\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0004R\u001a\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\u00020\b8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\t\u0010\nR\u001a\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00020\b8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\f\u0010\nR\u001a\u0010\u000f\u001a\b\u0012\u0004\u0012\u00020\u00020\b8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000e\u0010\nR\u001a\u0010\u0011\u001a\b\u0012\u0004\u0012\u00020\u00020\b8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0010\u0010\nR\u001a\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00020\b8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0012\u0010\nR\u001a\u0010\u0015\u001a\b\u0012\u0004\u0012\u00020\u00020\b8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0014\u0010\nR\u001a\u0010\u0017\u001a\b\u0012\u0004\u0012\u00020\u00020\b8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0016\u0010\nR\u0014\u0010\u001b\u001a\u00020\u00188\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0019\u0010\u001aR\u0014\u0010\u001f\u001a\u00020\u001c8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u001d\u0010\u001eR\u0014\u0010!\u001a\u00020\u00188\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b \u0010\u001aR\u001e\u0010$\u001a\n\u0012\u0004\u0012\u00020\"\u0018\u00010\b8\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\b#\u0010\nR\u0016\u0010(\u001a\u0004\u0018\u00010%8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b&\u0010'¨\u0006)"}, d2 = {"Lqi/a;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "a", "Ljava/lang/String;", "innerAdUnitId", "b", "adSourceName", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "c", "Ljava/util/List;", "clickUrls", "d", "impressionUrls", "e", "manualTrackingUrls", InneractiveMediationDefs.GENDER_FEMALE, "fillUrls", "g", "videoStartUrls", "h", "videoRewardsUrls", "i", "videoCompleteUrls", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "j", "Z", "isClosableAreaDisabled", "Lcom/google/gson/r;", "k", "Lcom/google/gson/r;", "recursiveRequestParameters", "l", "isAnalyticsLoggingEnabled", "Landroid/os/Bundle;", InneractiveMediationDefs.GENDER_MALE, "rewardsBundles", "Lcom/google/gson/m;", "n", "Lcom/google/gson/m;", "recursiveSignalCollectionConfig", "ads-mobile-sdk_release"}, k = 1, mv = {1, 9, 0})
/* loaded from: classes.dex */
public final /* data */ class a {

    /* renamed from: a, reason: collision with root package name and from kotlin metadata */
    @c("initial_ad_unit_id")
    @JvmField
    @NotNull
    public final String innerAdUnitId;

    /* renamed from: b, reason: collision with root package name and from kotlin metadata */
    @c("ad_source_name")
    @JvmField
    @NotNull
    public final String adSourceName;

    /* renamed from: c, reason: collision with root package name and from kotlin metadata */
    @c("click_urls")
    @JvmField
    @NotNull
    public final List<String> clickUrls;

    /* renamed from: d, reason: collision with root package name and from kotlin metadata */
    @c("imp_urls")
    @JvmField
    @NotNull
    public final List<String> impressionUrls;

    /* renamed from: e, reason: collision with root package name and from kotlin metadata */
    @c("manual_tracking_urls")
    @JvmField
    @NotNull
    public final List<String> manualTrackingUrls;

    /* renamed from: f, reason: collision with root package name and from kotlin metadata */
    @c("fill_urls")
    @JvmField
    @NotNull
    public final List<String> fillUrls;

    /* renamed from: g, reason: collision with root package name and from kotlin metadata */
    @c("video_start_urls")
    @JvmField
    @NotNull
    public final List<String> videoStartUrls;

    /* renamed from: h, reason: collision with root package name and from kotlin metadata */
    @c("video_reward_urls")
    @JvmField
    @NotNull
    public final List<String> videoRewardsUrls;

    /* renamed from: i, reason: collision with root package name and from kotlin metadata */
    @c("video_complete_urls")
    @JvmField
    @NotNull
    public final List<String> videoCompleteUrls;

    /* renamed from: j, reason: collision with root package name and from kotlin metadata */
    @c("is_closable_area_disabled")
    @JvmField
    public final boolean isClosableAreaDisabled;

    /* renamed from: k, reason: collision with root package name and from kotlin metadata */
    @c("recursive_request_parameters")
    @JvmField
    @NotNull
    public final r recursiveRequestParameters;

    /* renamed from: l, reason: collision with root package name and from kotlin metadata */
    @c("is_analytics_logging_enabled")
    @JvmField
    public final boolean isAnalyticsLoggingEnabled;

    /* renamed from: m, reason: collision with root package name and from kotlin metadata */
    @c("rewards")
    @JvmField
    @Nullable
    public List<Bundle> rewardsBundles;

    /* renamed from: n, reason: from kotlin metadata */
    @c("recursive_signal_collection")
    @JvmField
    @Nullable
    public final m recursiveSignalCollectionConfig;

    public a(String innerAdUnitId, String str, ArrayList arrayList, ArrayList arrayList2, ArrayList arrayList3, ArrayList arrayList4, ArrayList arrayList5, ArrayList arrayList6, ArrayList arrayList7, boolean z11, r rVar, boolean z12, List list, m mVar) {
        Intrinsics.g(innerAdUnitId, "innerAdUnitId");
        this.innerAdUnitId = innerAdUnitId;
        this.adSourceName = str;
        this.clickUrls = arrayList;
        this.impressionUrls = arrayList2;
        this.manualTrackingUrls = arrayList3;
        this.fillUrls = arrayList4;
        this.videoStartUrls = arrayList5;
        this.videoRewardsUrls = arrayList6;
        this.videoCompleteUrls = arrayList7;
        this.isClosableAreaDisabled = z11;
        this.recursiveRequestParameters = rVar;
        this.isAnalyticsLoggingEnabled = z12;
        this.rewardsBundles = list;
        this.recursiveSignalCollectionConfig = mVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a)) {
            return false;
        }
        a aVar = (a) obj;
        return Intrinsics.b(this.innerAdUnitId, aVar.innerAdUnitId) && Intrinsics.b(this.adSourceName, aVar.adSourceName) && Intrinsics.b(this.clickUrls, aVar.clickUrls) && Intrinsics.b(this.impressionUrls, aVar.impressionUrls) && Intrinsics.b(this.manualTrackingUrls, aVar.manualTrackingUrls) && Intrinsics.b(this.fillUrls, aVar.fillUrls) && Intrinsics.b(this.videoStartUrls, aVar.videoStartUrls) && Intrinsics.b(this.videoRewardsUrls, aVar.videoRewardsUrls) && Intrinsics.b(this.videoCompleteUrls, aVar.videoCompleteUrls) && this.isClosableAreaDisabled == aVar.isClosableAreaDisabled && Intrinsics.b(this.recursiveRequestParameters, aVar.recursiveRequestParameters) && this.isAnalyticsLoggingEnabled == aVar.isAnalyticsLoggingEnabled && Intrinsics.b(this.rewardsBundles, aVar.rewardsBundles) && Intrinsics.b(this.recursiveSignalCollectionConfig, aVar.recursiveSignalCollectionConfig);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final int hashCode() {
        int iD = k9.d(k9.d(k9.d(k9.d(k9.d(k9.d(k9.d(t2.a(this.adSourceName, this.innerAdUnitId.hashCode() * 31), this.clickUrls), this.impressionUrls), this.manualTrackingUrls), this.fillUrls), this.videoStartUrls), this.videoRewardsUrls), this.videoCompleteUrls);
        boolean z11 = this.isClosableAreaDisabled;
        int i5 = z11;
        if (z11 != 0) {
            i5 = 1;
        }
        int iHashCode = (this.recursiveRequestParameters.f34795a.hashCode() + ((iD + i5) * 31)) * 31;
        boolean z12 = this.isAnalyticsLoggingEnabled;
        int i11 = (iHashCode + (z12 ? 1 : z12 ? 1 : 0)) * 31;
        List<Bundle> list = this.rewardsBundles;
        int iHashCode2 = (i11 + (list == null ? 0 : list.hashCode())) * 31;
        m mVar = this.recursiveSignalCollectionConfig;
        return iHashCode2 + (mVar != null ? mVar.f34793a.hashCode() : 0);
    }

    public final String toString() {
        String str = this.innerAdUnitId;
        String str2 = this.adSourceName;
        List<String> list = this.clickUrls;
        List<String> list2 = this.impressionUrls;
        List<String> list3 = this.manualTrackingUrls;
        List<String> list4 = this.fillUrls;
        List<String> list5 = this.videoStartUrls;
        List<String> list6 = this.videoRewardsUrls;
        List<String> list7 = this.videoCompleteUrls;
        boolean z11 = this.isClosableAreaDisabled;
        r rVar = this.recursiveRequestParameters;
        boolean z12 = this.isAnalyticsLoggingEnabled;
        List<Bundle> list8 = this.rewardsBundles;
        m mVar = this.recursiveSignalCollectionConfig;
        StringBuilder sbW = c0.w("ParentAdConfig(innerAdUnitId=", str, ", adSourceName=", str2, ", clickUrls=");
        sbW.append(list);
        sbW.append(", impressionUrls=");
        sbW.append(list2);
        sbW.append(", manualTrackingUrls=");
        sbW.append(list3);
        sbW.append(", fillUrls=");
        sbW.append(list4);
        sbW.append(", videoStartUrls=");
        sbW.append(list5);
        sbW.append(", videoRewardsUrls=");
        sbW.append(list6);
        sbW.append(", videoCompleteUrls=");
        sbW.append(list7);
        sbW.append(", isClosableAreaDisabled=");
        sbW.append(z11);
        sbW.append(", recursiveRequestParameters=");
        sbW.append(rVar);
        sbW.append(", isAnalyticsLoggingEnabled=");
        sbW.append(z12);
        sbW.append(", rewardsBundles=");
        sbW.append(list8);
        sbW.append(", recursiveSignalCollectionConfig=");
        sbW.append(mVar);
        sbW.append(")");
        return sbW.toString();
    }
}
