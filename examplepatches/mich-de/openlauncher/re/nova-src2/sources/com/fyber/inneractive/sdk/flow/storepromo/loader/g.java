package com.fyber.inneractive.sdk.flow.storepromo.loader;

import android.text.TextUtils;
import com.fyber.inneractive.sdk.config.IAConfigManager;
import com.fyber.inneractive.sdk.model.vast.v;
import com.fyber.inneractive.sdk.network.l0;
import com.fyber.inneractive.sdk.network.t0;
import com.fyber.inneractive.sdk.util.IAlog;
import com.fyber.inneractive.sdk.util.r;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.concurrent.CountDownLatch;

/* loaded from: classes3.dex */
public final class g {

    /* renamed from: a, reason: collision with root package name */
    public final v f28323a;

    /* renamed from: b, reason: collision with root package name */
    public CountDownLatch f28324b;

    /* renamed from: c, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.flow.storepromo.b f28325c;

    /* renamed from: d, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.flow.storepromo.model.c f28326d;

    /* renamed from: f, reason: collision with root package name */
    public final int f28328f;

    /* renamed from: e, reason: collision with root package name */
    public final ArrayList f28327e = new ArrayList();

    /* renamed from: g, reason: collision with root package name */
    public int f28329g = 0;

    /* renamed from: h, reason: collision with root package name */
    public boolean f28330h = false;

    /* renamed from: i, reason: collision with root package name */
    public boolean f28331i = false;

    public g(v vVar, com.fyber.inneractive.sdk.flow.storepromo.b bVar) {
        this.f28323a = vVar;
        this.f28328f = vVar.f28645f.size();
        this.f28325c = bVar;
        this.f28326d = new com.fyber.inneractive.sdk.flow.storepromo.model.c(vVar);
    }

    public final void a(com.fyber.inneractive.sdk.flow.storepromo.events.a aVar, boolean z11, String str, String str2) {
        f fVar;
        this.f28324b.countDown();
        if (this.f28331i) {
            return;
        }
        if (z11) {
            this.f28331i = true;
            this.f28330h = true;
            a();
            if (TextUtils.isEmpty(str)) {
                str = "Something went wrong during promo's resources download";
            }
            com.fyber.inneractive.sdk.flow.storepromo.b bVar = this.f28325c;
            if (bVar != null) {
                if (aVar == null) {
                    aVar = com.fyber.inneractive.sdk.flow.storepromo.events.a.DOWNLOAD_RESOURCE_ERROR;
                }
                bVar.a(aVar.name(), str, str2);
                return;
            }
            return;
        }
        if (this.f28324b.getCount() != 0 || this.f28330h) {
            return;
        }
        this.f28331i = true;
        Collections.sort(this.f28326d.f28363a);
        this.f28327e.clear();
        com.fyber.inneractive.sdk.flow.storepromo.b bVar2 = this.f28325c;
        if (bVar2 != null) {
            com.fyber.inneractive.sdk.flow.storepromo.model.c cVar = this.f28326d;
            IAlog.a("StorePromoManager : onPromoLoadSucceed", new Object[0]);
            com.fyber.inneractive.sdk.flow.storepromo.controller.b bVar3 = new com.fyber.inneractive.sdk.flow.storepromo.controller.b(cVar, bVar2, bVar2, bVar2, bVar2.f28282b, bVar2.f28283c);
            bVar2.f28284d = bVar3;
            bVar2.f28287g = cVar.f28371i;
            com.fyber.inneractive.sdk.flow.storepromo.controller.c cVar2 = bVar3.f28293c;
            if (cVar2 == null || (fVar = cVar2.f28303d) == null) {
                return;
            }
            r.f31215a.execute(new e(fVar, new d(fVar)));
        }
    }

    public final void a() {
        Iterator it = this.f28327e.iterator();
        while (it.hasNext()) {
            t0 t0Var = (t0) it.next();
            l0 l0Var = IAConfigManager.Q.f27759s;
            String str = t0Var.f28783g;
            l0Var.getClass();
            t0Var.c();
        }
        this.f28327e.clear();
    }
}
