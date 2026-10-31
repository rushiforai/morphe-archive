package com.fyber.inneractive.sdk.config;

import java.util.Iterator;

/* loaded from: classes.dex */
public final class t implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ v f27933a;

    public t(v vVar) {
        this.f27933a = vVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        v vVar = this.f27933a;
        Iterator it = vVar.f27937c.iterator();
        while (it.hasNext()) {
            ((u) it.next()).onGlobalConfigChanged(vVar, vVar.f27936b);
        }
    }
}
