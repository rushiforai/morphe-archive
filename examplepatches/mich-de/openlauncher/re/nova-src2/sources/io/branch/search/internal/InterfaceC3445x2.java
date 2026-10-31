package io.branch.search.internal;

import android.view.View;
import io.branch.search.AnalyticsEvent;
import io.branch.search.internal.C4;
import io.branch.search.ui.ClickInfo;
import io.branch.search.ui.ImpressionInfo;
import java.util.List;
import kotlin.Deprecated;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.x2, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public interface InterfaceC3445x2 extends y40.p {
    void a(@NotNull View view, @NotNull X x11);

    void a(@NotNull C4.j.b bVar);

    /* synthetic */ void activate();

    @NotNull
    /* synthetic */ y40.c appStoreRequest(@NotNull String str);

    @NotNull
    /* synthetic */ y40.e autoSuggestRequest(@NotNull String str);

    @Deprecated
    /* synthetic */ void clearLocalDrawableCache();

    /* synthetic */ void deactivate();

    /* synthetic */ void markPackageIgnored(@NotNull String str, @NotNull y40.n nVar);

    /* synthetic */ void markPackageIgnored(@NotNull String str, @NotNull y40.n nVar, @Nullable long[] jArr);

    /* synthetic */ void onClicked(@NotNull ClickInfo clickInfo);

    /* synthetic */ void onImpressed(@NotNull ImpressionInfo impressionInfo);

    /* synthetic */ void optIntoTracking();

    /* synthetic */ void optOutOfTracking();

    @NotNull
    /* synthetic */ y40.b0 searchRequest(@NotNull String str);

    /* synthetic */ void syncIgnoredPackages(@NotNull List list, @NotNull y40.n nVar);

    /* synthetic */ void syncIgnoredPackages(@NotNull List list, @NotNull y40.n nVar, boolean z11);

    /* synthetic */ void syncIgnoredPackages(@NotNull List list, @NotNull y40.n nVar, @Nullable long[] jArr);

    /* synthetic */ void syncIgnoredPackages(@NotNull List list, @NotNull y40.n nVar, @Nullable long[] jArr, boolean z11);

    /* synthetic */ void track(@NotNull AnalyticsEvent analyticsEvent);

    /* synthetic */ void unmarkPackageIgnored(@NotNull String str, @NotNull y40.n nVar);

    @NotNull
    /* synthetic */ y40.d0 zeroStateRequest();
}
