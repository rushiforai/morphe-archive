package com.fyber.inneractive.sdk.ignite;

import com.fyber.inneractive.sdk.util.IAlog;
import java.util.Iterator;

/* loaded from: classes3.dex */
public final class d implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ h f28473a;

    public d(h hVar) {
        this.f28473a = hVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        h hVar = this.f28473a;
        IAlog.a("onInstallTimeout after %d msec", Long.valueOf(hVar.f28488j));
        Iterator it = hVar.f28485g.iterator();
        while (it.hasNext()) {
            r rVar = (r) it.next();
            if (rVar != null) {
                rVar.a((String) null, j.INSTALL_TIMEOUT.a(), (String) null);
            }
        }
    }
}
