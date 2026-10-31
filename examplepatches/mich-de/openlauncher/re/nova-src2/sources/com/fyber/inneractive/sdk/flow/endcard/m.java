package com.fyber.inneractive.sdk.flow.endcard;

import java.util.ArrayList;
import java.util.Iterator;

/* loaded from: classes3.dex */
public final class m {

    /* renamed from: a, reason: collision with root package name */
    public final ArrayList f28113a = new ArrayList();

    /* renamed from: b, reason: collision with root package name */
    public final ArrayList f28114b = new ArrayList();

    /* renamed from: c, reason: collision with root package name */
    public int f28115c = -1;

    /* renamed from: d, reason: collision with root package name */
    public final g f28116d = new g();

    public final b a() {
        int i5 = this.f28115c;
        if (i5 >= 0) {
            return (b) this.f28113a.get(i5);
        }
        return null;
    }

    public final b a(com.fyber.inneractive.sdk.model.vast.i iVar) {
        Iterator it = this.f28114b.iterator();
        while (it.hasNext()) {
            b bVar = (b) it.next();
            if (bVar.i() == iVar) {
                return bVar;
            }
        }
        return null;
    }

    public final void a(b bVar) {
        if (((bVar instanceof o) || (bVar instanceof d)) && this.f28113a.contains(bVar)) {
            return;
        }
        this.f28113a.add(bVar);
        this.f28113a.sort(this.f28116d);
    }
}
