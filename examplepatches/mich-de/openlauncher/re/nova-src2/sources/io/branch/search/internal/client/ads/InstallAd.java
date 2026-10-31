package io.branch.search.internal.client.ads;

import android.net.Uri;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import io.branch.search.ui.BranchEntity;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0010\b\u0087\b\u0018\u00002\u00020\u0001B'\u0012\u0006\u0010\f\u001a\u00020\u0002\u0012\u0006\u0010\r\u001a\u00020\u0005\u0012\u0006\u0010\u000e\u001a\u00020\u0005\u0012\u0006\u0010\u000f\u001a\u00020\t¢\u0006\u0004\b&\u0010'J\u0010\u0010\u0003\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0003\u0010\u0004J\u0010\u0010\u0006\u001a\u00020\u0005HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u0010\u0010\b\u001a\u00020\u0005HÆ\u0003¢\u0006\u0004\b\b\u0010\u0007J\u0010\u0010\n\u001a\u00020\tHÆ\u0003¢\u0006\u0004\b\n\u0010\u000bJ8\u0010\u0010\u001a\u00020\u00002\b\b\u0002\u0010\f\u001a\u00020\u00022\b\b\u0002\u0010\r\u001a\u00020\u00052\b\b\u0002\u0010\u000e\u001a\u00020\u00052\b\b\u0002\u0010\u000f\u001a\u00020\tHÆ\u0001¢\u0006\u0004\b\u0010\u0010\u0011J\u0010\u0010\u0012\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u0012\u0010\u0004J\u0010\u0010\u0014\u001a\u00020\u0013HÖ\u0001¢\u0006\u0004\b\u0014\u0010\u0015J\u001a\u0010\u0019\u001a\u00020\u00182\b\u0010\u0017\u001a\u0004\u0018\u00010\u0016HÖ\u0003¢\u0006\u0004\b\u0019\u0010\u001aR\u0017\u0010\f\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u001b\u0010\u001c\u001a\u0004\b\u001d\u0010\u0004R\u0017\u0010\r\u001a\u00020\u00058\u0006¢\u0006\f\n\u0004\b\u001e\u0010\u001f\u001a\u0004\b \u0010\u0007R\u0017\u0010\u000e\u001a\u00020\u00058\u0006¢\u0006\f\n\u0004\b!\u0010\u001f\u001a\u0004\b\"\u0010\u0007R\u001a\u0010\u000f\u001a\u00020\t8\u0016X\u0096\u0004¢\u0006\f\n\u0004\b#\u0010$\u001a\u0004\b%\u0010\u000b¨\u0006("}, d2 = {"Lio/branch/search/internal/client/ads/InstallAd;", "Lio/branch/search/internal/client/ads/IconAd;", b.f42142b, "component1", "()Ljava/lang/String;", "Landroid/net/Uri;", "component2", "()Landroid/net/Uri;", "component3", "Lio/branch/search/ui/BranchEntity$App;", "component4", "()Lio/branch/search/ui/BranchEntity$App;", PendingUpgradeStore.KEY_NAME, "icon", "uri", "ad", "copy", "(Ljava/lang/String;Landroid/net/Uri;Landroid/net/Uri;Lio/branch/search/ui/BranchEntity$App;)Lio/branch/search/internal/client/ads/InstallAd;", "toString", b.f42142b, "hashCode", "()I", b.f42142b, InneractiveMediationNameConsts.OTHER, b.f42142b, "equals", "(Ljava/lang/Object;)Z", "a", "Ljava/lang/String;", "getName", "b", "Landroid/net/Uri;", "getIcon", "c", "getUri", "d", "Lio/branch/search/ui/BranchEntity$App;", "getAd", "<init>", "(Ljava/lang/String;Landroid/net/Uri;Landroid/net/Uri;Lio/branch/search/ui/BranchEntity$App;)V", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1})
/* loaded from: classes4.dex */
public final /* data */ class InstallAd implements IconAd {

    /* renamed from: a, reason: collision with root package name and from kotlin metadata */
    @NotNull
    public final String name;

    /* renamed from: b, reason: collision with root package name and from kotlin metadata */
    @NotNull
    public final Uri icon;

    /* renamed from: c, reason: collision with root package name and from kotlin metadata */
    @NotNull
    public final Uri uri;

    /* renamed from: d, reason: collision with root package name and from kotlin metadata */
    @NotNull
    public final BranchEntity.App ad;

    public InstallAd(@NotNull String name, @NotNull Uri icon, @NotNull Uri uri, @NotNull BranchEntity.App ad) {
        Intrinsics.g(name, "name");
        Intrinsics.g(icon, "icon");
        Intrinsics.g(uri, "uri");
        Intrinsics.g(ad, "ad");
        this.name = name;
        this.icon = icon;
        this.uri = uri;
        this.ad = ad;
    }

    public static /* synthetic */ InstallAd copy$default(InstallAd installAd, String str, Uri uri, Uri uri2, BranchEntity.App app, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = installAd.name;
        }
        if ((i5 & 2) != 0) {
            uri = installAd.icon;
        }
        if ((i5 & 4) != 0) {
            uri2 = installAd.uri;
        }
        if ((i5 & 8) != 0) {
            app = installAd.getAd();
        }
        return installAd.copy(str, uri, uri2, app);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getName() {
        return this.name;
    }

    @NotNull
    /* renamed from: component2, reason: from getter */
    public final Uri getIcon() {
        return this.icon;
    }

    @NotNull
    /* renamed from: component3, reason: from getter */
    public final Uri getUri() {
        return this.uri;
    }

    @NotNull
    public final BranchEntity.App component4() {
        return getAd();
    }

    @NotNull
    public final InstallAd copy(@NotNull String name, @NotNull Uri icon, @NotNull Uri uri, @NotNull BranchEntity.App ad) {
        Intrinsics.g(name, "name");
        Intrinsics.g(icon, "icon");
        Intrinsics.g(uri, "uri");
        Intrinsics.g(ad, "ad");
        return new InstallAd(name, icon, uri, ad);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof InstallAd)) {
            return false;
        }
        InstallAd installAd = (InstallAd) other;
        return Intrinsics.b(this.name, installAd.name) && Intrinsics.b(this.icon, installAd.icon) && Intrinsics.b(this.uri, installAd.uri) && Intrinsics.b(getAd(), installAd.getAd());
    }

    @Override // io.branch.search.internal.client.ads.IconAd
    @NotNull
    public BranchEntity.App getAd() {
        return this.ad;
    }

    @NotNull
    public final Uri getIcon() {
        return this.icon;
    }

    @NotNull
    public final String getName() {
        return this.name;
    }

    @NotNull
    public final Uri getUri() {
        return this.uri;
    }

    public int hashCode() {
        return getAd().hashCode() + ((this.uri.hashCode() + ((this.icon.hashCode() + (this.name.hashCode() * 31)) * 31)) * 31);
    }

    @NotNull
    public String toString() {
        return "InstallAd(name=" + this.name + ", icon=" + this.icon + ", uri=" + this.uri + ", ad=" + getAd() + ')';
    }
}
