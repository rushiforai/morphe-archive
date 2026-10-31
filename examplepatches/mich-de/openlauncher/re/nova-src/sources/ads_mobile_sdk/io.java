package ads_mobile_sdk;

import android.content.Context;
import b.p1;
import java.util.Optional;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public abstract class io extends vb1 {

    /* renamed from: m, reason: collision with root package name */
    public final p1 f4896m;
    public boolean n;
    public boolean o;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public io(String adId, z1 adConfiguration, hv commonConfiguration, mi3 traceMetaSet, Optional webView, y2 adEventEmitter, ih0 delegatingAdListener, p1 fullScreenAdPresenter, hf2 phantomReferences, z03 safeBrowsingManager, eg2 placementIdWrapper, ni.q baseRequest) {
        super(adId, adConfiguration, commonConfiguration, traceMetaSet, webView, adEventEmitter, delegatingAdListener, phantomReferences, safeBrowsingManager, placementIdWrapper, baseRequest);
        Intrinsics.g(adId, "adId");
        Intrinsics.g(adConfiguration, "adConfiguration");
        Intrinsics.g(commonConfiguration, "commonConfiguration");
        Intrinsics.g(traceMetaSet, "traceMetaSet");
        Intrinsics.g(webView, "webView");
        Intrinsics.g(adEventEmitter, "adEventEmitter");
        Intrinsics.g(delegatingAdListener, "delegatingAdListener");
        Intrinsics.g(fullScreenAdPresenter, "fullScreenAdPresenter");
        Intrinsics.g(phantomReferences, "phantomReferences");
        Intrinsics.g(safeBrowsingManager, "safeBrowsingManager");
        Intrinsics.g(placementIdWrapper, "placementIdWrapper");
        Intrinsics.g(baseRequest, "baseRequest");
        this.f4896m = fullScreenAdPresenter;
    }

    public final void a(Context context) {
        Intrinsics.g(context, "context");
        this.f4896m.a(context, this.n, this.o);
    }
}
