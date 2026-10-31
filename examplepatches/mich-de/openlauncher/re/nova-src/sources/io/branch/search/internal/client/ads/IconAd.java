package io.branch.search.internal.client.ads;

import io.branch.search.ui.BranchEntity;
import kotlin.Metadata;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bw\u0018\u00002\u00020\u00012\u00020\u0002R\u0012\u0010\u0003\u001a\u00020\u0004X¦\u0004¢\u0006\u0006\u001a\u0004\b\u0005\u0010\u0006\u0082\u0001\u0002\u0007\b¨\u0006\t"}, d2 = {"Lio/branch/search/internal/client/ads/IconAd;", "Lio/branch/search/internal/client/ads/Impressable;", "Lio/branch/search/internal/client/ads/Clickable;", "ad", "Lio/branch/search/ui/BranchEntity$App;", "getAd", "()Lio/branch/search/ui/BranchEntity$App;", "Lio/branch/search/internal/client/ads/InstallAd;", "Lio/branch/search/internal/client/ads/ReengagementAd;", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1}, xi = 48)
/* loaded from: classes4.dex */
public interface IconAd extends Impressable, Clickable {
    @NotNull
    BranchEntity.App getAd();
}
