package ads_mobile_sdk;

import android.view.View;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Optional;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class od1 extends vb1 {

    /* renamed from: m, reason: collision with root package name */
    public final View f7841m;
    public final b.c7 n;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public od1(View view, String adId, z1 adConfiguration, hv commonConfiguration, mi3 traceMetaSet, Optional gmaWebView, y2 adEventEmitter, ih0 delegatingAdEventListener, hf2 phantomReferences, z03 safeBrowsingManager, eg2 placementIdWrapper, b.c7 refreshListener, ni.q baseRequest) {
        super(adId, adConfiguration, commonConfiguration, traceMetaSet, gmaWebView, adEventEmitter, delegatingAdEventListener, phantomReferences, safeBrowsingManager, placementIdWrapper, baseRequest);
        Intrinsics.g(view, "view");
        Intrinsics.g(adId, "adId");
        Intrinsics.g(adConfiguration, "adConfiguration");
        Intrinsics.g(commonConfiguration, "commonConfiguration");
        Intrinsics.g(traceMetaSet, "traceMetaSet");
        Intrinsics.g(gmaWebView, "gmaWebView");
        Intrinsics.g(adEventEmitter, "adEventEmitter");
        Intrinsics.g(delegatingAdEventListener, "delegatingAdEventListener");
        Intrinsics.g(phantomReferences, "phantomReferences");
        Intrinsics.g(safeBrowsingManager, "safeBrowsingManager");
        Intrinsics.g(placementIdWrapper, "placementIdWrapper");
        Intrinsics.g(refreshListener, "refreshListener");
        Intrinsics.g(baseRequest, "baseRequest");
        this.f7841m = view;
        this.n = refreshListener;
    }

    public final mi.a l() {
        if (b().f12400r0) {
            ArrayList arrayList = b().f12368a0;
            if (!arrayList.isEmpty()) {
                Iterator it = arrayList.iterator();
                while (it.hasNext()) {
                    if (r70.k.K0((String) it.next(), "FirstParty", false)) {
                    }
                }
            }
            View view = this.f7841m;
            return new mi.a(view.getWidth(), view.getHeight());
        }
        g2 g2Var = !b().f12413y.isEmpty() ? (g2) b().f12413y.get(0) : (g2) b().f12379g.get(0);
        return g2Var.f3620c ? mi.a.f76403i : new mi.a(g2Var.f3618a, g2Var.f3619b);
    }
}
