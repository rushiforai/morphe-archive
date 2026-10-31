package io.branch.search.internal.client.ads;

import android.net.Uri;
import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import io.branch.search.internal.C3248l8;
import io.branch.search.ui.BranchEntity;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u0018\b\u0087\b\u0018\u00002\u00020\u0001BE\u0012\u0006\u0010\u0011\u001a\u00020\u0002\u0012\u0006\u0010\u0012\u001a\u00020\u0002\u0012\b\u0010\u0013\u001a\u0004\u0018\u00010\u0002\u0012\b\u0010\u0014\u001a\u0004\u0018\u00010\u0007\u0012\b\u0010\u0015\u001a\u0004\u0018\u00010\u0002\u0012\u0006\u0010\u0016\u001a\u00020\u000b\u0012\u0006\u0010\u0017\u001a\u00020\u000e¢\u0006\u0004\b4\u00105J\u0010\u0010\u0003\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0003\u0010\u0004J\u0010\u0010\u0005\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0005\u0010\u0004J\u0012\u0010\u0006\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0004J\u0012\u0010\b\u001a\u0004\u0018\u00010\u0007HÆ\u0003¢\u0006\u0004\b\b\u0010\tJ\u0012\u0010\n\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\n\u0010\u0004J\u0010\u0010\f\u001a\u00020\u000bHÆ\u0003¢\u0006\u0004\b\f\u0010\rJ\u0010\u0010\u000f\u001a\u00020\u000eHÆ\u0003¢\u0006\u0004\b\u000f\u0010\u0010J\\\u0010\u0018\u001a\u00020\u00002\b\b\u0002\u0010\u0011\u001a\u00020\u00022\b\b\u0002\u0010\u0012\u001a\u00020\u00022\n\b\u0002\u0010\u0013\u001a\u0004\u0018\u00010\u00022\n\b\u0002\u0010\u0014\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\u0015\u001a\u0004\u0018\u00010\u00022\b\b\u0002\u0010\u0016\u001a\u00020\u000b2\b\b\u0002\u0010\u0017\u001a\u00020\u000eHÆ\u0001¢\u0006\u0004\b\u0018\u0010\u0019J\u0010\u0010\u001a\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u001a\u0010\u0004J\u0010\u0010\u001c\u001a\u00020\u001bHÖ\u0001¢\u0006\u0004\b\u001c\u0010\u001dJ\u001a\u0010 \u001a\u00020\u000b2\b\u0010\u001f\u001a\u0004\u0018\u00010\u001eHÖ\u0003¢\u0006\u0004\b \u0010!R\u0017\u0010\u0011\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\"\u0010#\u001a\u0004\b$\u0010\u0004R\u0017\u0010\u0012\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b%\u0010#\u001a\u0004\b&\u0010\u0004R\u0019\u0010\u0013\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b'\u0010#\u001a\u0004\b(\u0010\u0004R\u0019\u0010\u0014\u001a\u0004\u0018\u00010\u00078\u0006¢\u0006\f\n\u0004\b)\u0010*\u001a\u0004\b+\u0010\tR\u0019\u0010\u0015\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b,\u0010#\u001a\u0004\b-\u0010\u0004R\u0017\u0010\u0016\u001a\u00020\u000b8\u0006¢\u0006\f\n\u0004\b.\u0010/\u001a\u0004\b0\u0010\rR\u001a\u0010\u0017\u001a\u00020\u000e8\u0016X\u0096\u0004¢\u0006\f\n\u0004\b1\u00102\u001a\u0004\b3\u0010\u0010¨\u00066"}, d2 = {"Lio/branch/search/internal/client/ads/ReengagementAd;", "Lio/branch/search/internal/client/ads/IconAd;", b.f42142b, "component1", "()Ljava/lang/String;", "component2", "component3", "Landroid/net/Uri;", "component4", "()Landroid/net/Uri;", "component5", b.f42142b, "component6", "()Z", "Lio/branch/search/ui/BranchEntity$App;", "component7", "()Lio/branch/search/ui/BranchEntity$App;", PendingUpgradeStore.KEY_NAME, "packageName", "targetPackage", "uri", "targetPackageNameAfterRedirects", "followRedirects", "ad", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;Ljava/lang/String;ZLio/branch/search/ui/BranchEntity$App;)Lio/branch/search/internal/client/ads/ReengagementAd;", "toString", b.f42142b, "hashCode", "()I", b.f42142b, InneractiveMediationNameConsts.OTHER, "equals", "(Ljava/lang/Object;)Z", "a", "Ljava/lang/String;", "getName", "b", "getPackageName", "c", "getTargetPackage", "d", "Landroid/net/Uri;", "getUri", "e", "getTargetPackageNameAfterRedirects", InneractiveMediationDefs.GENDER_FEMALE, "Z", "getFollowRedirects", "g", "Lio/branch/search/ui/BranchEntity$App;", "getAd", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;Ljava/lang/String;ZLio/branch/search/ui/BranchEntity$App;)V", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1})
/* loaded from: classes4.dex */
public final /* data */ class ReengagementAd implements IconAd {

    /* renamed from: a, reason: collision with root package name and from kotlin metadata */
    @NotNull
    public final String name;

    /* renamed from: b, reason: collision with root package name and from kotlin metadata */
    @NotNull
    public final String packageName;

    /* renamed from: c, reason: collision with root package name and from kotlin metadata */
    @Nullable
    public final String targetPackage;

    /* renamed from: d, reason: collision with root package name and from kotlin metadata */
    @Nullable
    public final Uri uri;

    /* renamed from: e, reason: collision with root package name and from kotlin metadata */
    @Nullable
    public final String targetPackageNameAfterRedirects;

    /* renamed from: f, reason: collision with root package name and from kotlin metadata */
    public final boolean followRedirects;

    /* renamed from: g, reason: collision with root package name and from kotlin metadata */
    @NotNull
    public final BranchEntity.App ad;

    public ReengagementAd(@NotNull String name, @NotNull String packageName, @Nullable String str, @Nullable Uri uri, @Nullable String str2, boolean z11, @NotNull BranchEntity.App ad) {
        Intrinsics.g(name, "name");
        Intrinsics.g(packageName, "packageName");
        Intrinsics.g(ad, "ad");
        this.name = name;
        this.packageName = packageName;
        this.targetPackage = str;
        this.uri = uri;
        this.targetPackageNameAfterRedirects = str2;
        this.followRedirects = z11;
        this.ad = ad;
    }

    public static /* synthetic */ ReengagementAd copy$default(ReengagementAd reengagementAd, String str, String str2, String str3, Uri uri, String str4, boolean z11, BranchEntity.App app, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = reengagementAd.name;
        }
        if ((i5 & 2) != 0) {
            str2 = reengagementAd.packageName;
        }
        if ((i5 & 4) != 0) {
            str3 = reengagementAd.targetPackage;
        }
        if ((i5 & 8) != 0) {
            uri = reengagementAd.uri;
        }
        if ((i5 & 16) != 0) {
            str4 = reengagementAd.targetPackageNameAfterRedirects;
        }
        if ((i5 & 32) != 0) {
            z11 = reengagementAd.followRedirects;
        }
        if ((i5 & 64) != 0) {
            app = reengagementAd.getAd();
        }
        boolean z12 = z11;
        BranchEntity.App app2 = app;
        String str5 = str4;
        String str6 = str3;
        return reengagementAd.copy(str, str2, str6, uri, str5, z12, app2);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getName() {
        return this.name;
    }

    @NotNull
    /* renamed from: component2, reason: from getter */
    public final String getPackageName() {
        return this.packageName;
    }

    @Nullable
    /* renamed from: component3, reason: from getter */
    public final String getTargetPackage() {
        return this.targetPackage;
    }

    @Nullable
    /* renamed from: component4, reason: from getter */
    public final Uri getUri() {
        return this.uri;
    }

    @Nullable
    /* renamed from: component5, reason: from getter */
    public final String getTargetPackageNameAfterRedirects() {
        return this.targetPackageNameAfterRedirects;
    }

    /* renamed from: component6, reason: from getter */
    public final boolean getFollowRedirects() {
        return this.followRedirects;
    }

    @NotNull
    public final BranchEntity.App component7() {
        return getAd();
    }

    @NotNull
    public final ReengagementAd copy(@NotNull String name, @NotNull String packageName, @Nullable String targetPackage, @Nullable Uri uri, @Nullable String targetPackageNameAfterRedirects, boolean followRedirects, @NotNull BranchEntity.App ad) {
        Intrinsics.g(name, "name");
        Intrinsics.g(packageName, "packageName");
        Intrinsics.g(ad, "ad");
        return new ReengagementAd(name, packageName, targetPackage, uri, targetPackageNameAfterRedirects, followRedirects, ad);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof ReengagementAd)) {
            return false;
        }
        ReengagementAd reengagementAd = (ReengagementAd) other;
        return Intrinsics.b(this.name, reengagementAd.name) && Intrinsics.b(this.packageName, reengagementAd.packageName) && Intrinsics.b(this.targetPackage, reengagementAd.targetPackage) && Intrinsics.b(this.uri, reengagementAd.uri) && Intrinsics.b(this.targetPackageNameAfterRedirects, reengagementAd.targetPackageNameAfterRedirects) && this.followRedirects == reengagementAd.followRedirects && Intrinsics.b(getAd(), reengagementAd.getAd());
    }

    @Override // io.branch.search.internal.client.ads.IconAd
    @NotNull
    public BranchEntity.App getAd() {
        return this.ad;
    }

    public final boolean getFollowRedirects() {
        return this.followRedirects;
    }

    @NotNull
    public final String getName() {
        return this.name;
    }

    @NotNull
    public final String getPackageName() {
        return this.packageName;
    }

    @Nullable
    public final String getTargetPackage() {
        return this.targetPackage;
    }

    @Nullable
    public final String getTargetPackageNameAfterRedirects() {
        return this.targetPackageNameAfterRedirects;
    }

    @Nullable
    public final Uri getUri() {
        return this.uri;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public int hashCode() {
        int iA = C3248l8.a(this.packageName, this.name.hashCode() * 31, 31);
        String str = this.targetPackage;
        int iHashCode = (iA + (str == null ? 0 : str.hashCode())) * 31;
        Uri uri = this.uri;
        int iHashCode2 = (iHashCode + (uri == null ? 0 : uri.hashCode())) * 31;
        String str2 = this.targetPackageNameAfterRedirects;
        int iHashCode3 = (iHashCode2 + (str2 != null ? str2.hashCode() : 0)) * 31;
        boolean z11 = this.followRedirects;
        int i5 = z11;
        if (z11 != 0) {
            i5 = 1;
        }
        return getAd().hashCode() + ((iHashCode3 + i5) * 31);
    }

    @NotNull
    public String toString() {
        return "ReengagementAd(name=" + this.name + ", packageName=" + this.packageName + ", targetPackage=" + this.targetPackage + ", uri=" + this.uri + ", targetPackageNameAfterRedirects=" + this.targetPackageNameAfterRedirects + ", followRedirects=" + this.followRedirects + ", ad=" + getAd() + ')';
    }
}
