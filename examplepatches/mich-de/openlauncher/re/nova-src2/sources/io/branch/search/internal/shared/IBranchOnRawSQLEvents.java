package io.branch.search.internal.shared;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;

@Metadata(d1 = {"\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\t\n\u0002\b\u0002\bf\u0018\u00002\u00020\u0001J\u0018\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007H&J\b\u0010\b\u001a\u00020\u0003H&¨\u0006\t"}, d2 = {"Lio/branch/search/internal/shared/IBranchOnRawSQLEvents;", b.f42142b, "onBundleUpdateComplete", b.f42142b, "success", b.f42142b, "bundleUpdateInterval", b.f42142b, "onBundleUpdateInit", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1}, xi = 48)
/* loaded from: classes4.dex */
public interface IBranchOnRawSQLEvents {
    void onBundleUpdateComplete(boolean success, long bundleUpdateInterval);

    void onBundleUpdateInit();
}
