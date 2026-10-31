package io.branch.search.internal.client.ads;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.n;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import y40.w;

@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\bg\u0018\u00002\u00020\u0001:\u0001\u0007J\u0019\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H¦@ø\u0001\u0000¢\u0006\u0002\u0010\u0006\u0082\u0002\u0004\n\u0002\b\u0019¨\u0006\b"}, d2 = {"Lio/branch/search/internal/client/ads/AdsClient;", b.f42142b, "newSession", "Lio/branch/search/internal/client/ads/AdsClient$Session;", "forPkg", b.f42142b, "(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "Session", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1}, xi = 48)
/* loaded from: classes4.dex */
public interface AdsClient {

    @Metadata(d1 = {"\u00004\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\b\bf\u0018\u00002\u00020\u0001J'\u0010\u0007\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00060\u00050\u00042\u0006\u0010\u0003\u001a\u00020\u0002H¦@ø\u0001\u0000¢\u0006\u0004\b\u0007\u0010\bJ\u001b\u0010\f\u001a\u00020\u000b2\u0006\u0010\n\u001a\u00020\tH¦@ø\u0001\u0000¢\u0006\u0004\b\f\u0010\rJ\u001b\u0010\u000f\u001a\u00020\u000b2\u0006\u0010\n\u001a\u00020\u000eH¦@ø\u0001\u0000¢\u0006\u0004\b\u000f\u0010\u0010J\u001b\u0010\u0012\u001a\u00020\u000b2\u0006\u0010\u0011\u001a\u00020\u0006H¦@ø\u0001\u0000¢\u0006\u0004\b\u0012\u0010\u0013J\u0013\u0010\u0014\u001a\u00020\u000bH¦@ø\u0001\u0000¢\u0006\u0004\b\u0014\u0010\u0015\u0082\u0002\u0004\n\u0002\b\u0019¨\u0006\u0016"}, d2 = {"Lio/branch/search/internal/client/ads/AdsClient$Session;", b.f42142b, b.f42142b, "count", "Ly40/w;", b.f42142b, "Lio/branch/search/internal/client/ads/IconAd;", "getSuggestedAppsAds", "(ILkotlin/coroutines/Continuation;)Ljava/lang/Object;", "Lio/branch/search/internal/client/ads/ImpressionInfo;", "info", b.f42142b, "onImpressed", "(Lio/branch/search/internal/client/ads/ImpressionInfo;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "Lio/branch/search/internal/client/ads/ClickInfo;", "onClicked", "(Lio/branch/search/internal/client/ads/ClickInfo;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "entity", "block", "(Lio/branch/search/internal/client/ads/IconAd;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", n.f39150d, "(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1}, xi = 48)
    public interface Session {
        @Nullable
        Object block(@NotNull IconAd iconAd, @NotNull Continuation<? super Unit> continuation);

        @Nullable
        Object close(@NotNull Continuation<? super Unit> continuation);

        @Nullable
        Object getSuggestedAppsAds(int i5, @NotNull Continuation<? super w> continuation);

        @Nullable
        Object onClicked(@NotNull ClickInfo clickInfo, @NotNull Continuation<? super Unit> continuation);

        @Nullable
        Object onImpressed(@NotNull ImpressionInfo impressionInfo, @NotNull Continuation<? super Unit> continuation);
    }

    @Nullable
    Object newSession(@NotNull String str, @NotNull Continuation<? super Session> continuation);
}
