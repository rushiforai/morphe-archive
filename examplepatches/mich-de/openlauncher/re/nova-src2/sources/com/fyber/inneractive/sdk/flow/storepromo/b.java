package com.fyber.inneractive.sdk.flow.storepromo;

import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import com.fyber.inneractive.sdk.external.InneractiveAdRequest;
import com.fyber.inneractive.sdk.flow.storepromo.loader.f;
import com.fyber.inneractive.sdk.flow.storepromo.loader.g;
import com.fyber.inneractive.sdk.flow.storepromo.ui.c;
import com.fyber.inneractive.sdk.model.vast.v;
import com.fyber.inneractive.sdk.network.t;
import com.fyber.inneractive.sdk.response.e;
import com.fyber.inneractive.sdk.util.IAlog;
import com.fyber.inneractive.sdk.util.g1;
import com.fyber.inneractive.sdk.util.o;
import java.util.HashMap;
import java.util.Iterator;
import java.util.concurrent.CopyOnWriteArrayList;

/* loaded from: classes3.dex */
public final class b implements com.fyber.inneractive.sdk.flow.storepromo.loader.b, com.fyber.inneractive.sdk.flow.storepromo.controller.listener.a {

    /* renamed from: k, reason: collision with root package name */
    public static final Object f28280k = new Object();

    /* renamed from: a, reason: collision with root package name */
    public final g f28281a;

    /* renamed from: b, reason: collision with root package name */
    public final e f28282b;

    /* renamed from: c, reason: collision with root package name */
    public final InneractiveAdRequest f28283c;

    /* renamed from: d, reason: collision with root package name */
    public com.fyber.inneractive.sdk.flow.storepromo.controller.b f28284d;

    /* renamed from: e, reason: collision with root package name */
    public com.fyber.inneractive.sdk.flow.storepromo.loader.b f28285e;

    /* renamed from: f, reason: collision with root package name */
    public final String f28286f;

    /* renamed from: g, reason: collision with root package name */
    public int f28287g = 0;

    /* renamed from: h, reason: collision with root package name */
    public final CopyOnWriteArrayList f28288h = new CopyOnWriteArrayList();

    /* renamed from: i, reason: collision with root package name */
    public boolean f28289i = false;

    /* renamed from: j, reason: collision with root package name */
    public a f28290j = new a();

    public b(v vVar, e eVar, InneractiveAdRequest inneractiveAdRequest) {
        this.f28281a = new g(vVar, this);
        this.f28286f = vVar.f28642c;
        this.f28282b = eVar;
        this.f28283c = inneractiveAdRequest;
    }

    public final void a() {
        com.fyber.inneractive.sdk.flow.storepromo.controller.b bVar = this.f28284d;
        if (bVar != null) {
            c cVar = bVar.f28294d;
            if (cVar != null) {
                if (cVar.f28380b != null && cVar.f28379a != null) {
                    cVar.f28382d.setAnimationListener(cVar.f28387i);
                    cVar.f28379a.setAnimation(cVar.f28382d);
                    cVar.f28379a.setVisibility(8);
                }
                View view = cVar.f28379a;
                if (view != null) {
                    view.setAnimation(null);
                    com.fyber.inneractive.sdk.util.v.a(cVar.f28379a);
                }
                ViewGroup viewGroup = cVar.f28380b;
                if (viewGroup != null) {
                    viewGroup.removeAllViewsInLayout();
                    com.fyber.inneractive.sdk.util.v.a(cVar.f28380b);
                }
                cVar.f28379a = null;
                cVar.f28380b = null;
                com.fyber.inneractive.sdk.flow.storepromo.ui.b bVar2 = cVar.f28383e;
                if (bVar2 != null) {
                    try {
                        o.f31210a.unregisterReceiver(bVar2);
                    } catch (Exception unused) {
                    }
                    cVar.f28383e.f28378a.clear();
                    cVar.f28383e = null;
                }
                cVar.f28384f = null;
                bVar.f28294d = null;
            }
            com.fyber.inneractive.sdk.flow.storepromo.controller.c cVar2 = bVar.f28293c;
            if (cVar2 != null) {
                f fVar = cVar2.f28303d;
                if (fVar != null) {
                    com.fyber.inneractive.sdk.flow.storepromo.controller.webview.a aVar = fVar.f28317a;
                    if (aVar != null) {
                        com.fyber.inneractive.sdk.util.v.a(aVar);
                        fVar.f28317a.destroy();
                        fVar.f28317a = null;
                    }
                    fVar.f28321e = null;
                    fVar.f28320d = null;
                    fVar.f28319c = null;
                    fVar.f28322f = null;
                    fVar.f28318b = null;
                }
                com.fyber.inneractive.sdk.flow.storepromo.controller.webview.a aVar2 = cVar2.f28301b;
                if (aVar2 != null) {
                    com.fyber.inneractive.sdk.util.v.a(aVar2);
                    cVar2.f28301b.destroy();
                    cVar2.f28301b = null;
                }
                cVar2.f28305f = null;
                cVar2.f28306g = null;
                cVar2.f28302c = null;
                cVar2.f28303d = null;
                bVar.f28293c = null;
            }
            bVar.f28299i = null;
            bVar.f28295e = null;
            bVar.f28296f = null;
            bVar.f28298h = null;
            this.f28284d = null;
        }
    }

    @Override // com.fyber.inneractive.sdk.flow.storepromo.loader.b
    public final void a(g1 g1Var) {
        c cVar;
        View view;
        this.f28289i = true;
        com.fyber.inneractive.sdk.flow.storepromo.loader.b bVar = this.f28285e;
        if (bVar != null) {
            bVar.a(g1Var);
        }
        com.fyber.inneractive.sdk.flow.storepromo.controller.b bVar2 = this.f28284d;
        com.fyber.inneractive.sdk.flow.storepromo.observer.b bVar3 = new com.fyber.inneractive.sdk.flow.storepromo.observer.b((bVar2 == null || (cVar = bVar2.f28294d) == null || cVar.f28380b == null || (view = cVar.f28379a) == null || view.getParent() == null || cVar.f28380b.getVisibility() != 0) ? false : true, this.f28289i);
        Iterator it = this.f28288h.iterator();
        while (it.hasNext()) {
            ((com.fyber.inneractive.sdk.flow.storepromo.observer.a) it.next()).a(bVar3);
        }
    }

    @Override // com.fyber.inneractive.sdk.flow.storepromo.controller.listener.a
    public final void a(com.fyber.inneractive.sdk.network.events.b bVar, String str, String str2) {
        a(bVar.name(), str, str2);
    }

    public final void a(String str, String str2, String str3) {
        IAlog.b("StorePromoManager: reportStorePromoError: %s, msg: %s", str, str2);
        if (this.f28290j != null) {
            InneractiveAdRequest inneractiveAdRequest = this.f28283c;
            e eVar = this.f28282b;
            HashMap map = new HashMap(1);
            if (!TextUtils.isEmpty(str2)) {
                map.put("error", str2);
            }
            if (!TextUtils.isEmpty(str3)) {
                map.put("failedURL", str3);
            }
            com.fyber.inneractive.sdk.network.events.a.a(t.ERROR_STORE_PROMO_FAILURE, str, (String) null, inneractiveAdRequest, eVar, map, (Boolean) null);
            this.f28290j = null;
        }
    }
}
