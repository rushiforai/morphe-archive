package ads_mobile_sdk;

import b.p1;
import java.util.Optional;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class gh1 extends io {

    /* renamed from: p, reason: collision with root package name */
    public final a33 f3849p;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public gh1(String adId, z1 adConfiguration, hv commonConfiguration, mi3 traceMetaSet, Optional webView, y2 adEventEmitter, ih0 delegatingAdListener, p1 fullScreenAdPresenter, a33 serverSideVerificationOptionsHolder, v3 adMetadataHolder, hf2 phantomReferences, z03 safeBrowsingManager, eg2 placementIdWrapper, ni.q baseRequest) {
        super(adId, adConfiguration, commonConfiguration, traceMetaSet, webView, adEventEmitter, delegatingAdListener, fullScreenAdPresenter, phantomReferences, safeBrowsingManager, placementIdWrapper, baseRequest);
        Intrinsics.g(adId, "adId");
        Intrinsics.g(adConfiguration, "adConfiguration");
        Intrinsics.g(commonConfiguration, "commonConfiguration");
        Intrinsics.g(traceMetaSet, "traceMetaSet");
        Intrinsics.g(webView, "webView");
        Intrinsics.g(adEventEmitter, "adEventEmitter");
        Intrinsics.g(delegatingAdListener, "delegatingAdListener");
        Intrinsics.g(fullScreenAdPresenter, "fullScreenAdPresenter");
        Intrinsics.g(serverSideVerificationOptionsHolder, "serverSideVerificationOptionsHolder");
        Intrinsics.g(adMetadataHolder, "adMetadataHolder");
        Intrinsics.g(phantomReferences, "phantomReferences");
        Intrinsics.g(safeBrowsingManager, "safeBrowsingManager");
        Intrinsics.g(placementIdWrapper, "placementIdWrapper");
        Intrinsics.g(baseRequest, "baseRequest");
        this.f3849p = serverSideVerificationOptionsHolder;
    }
}
