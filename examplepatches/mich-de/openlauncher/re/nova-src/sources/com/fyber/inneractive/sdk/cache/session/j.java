package com.fyber.inneractive.sdk.cache.session;

import java.util.Comparator;

/* loaded from: classes.dex */
public final class j implements Comparator {
    @Override // java.util.Comparator
    public final int compare(Object obj, Object obj2) {
        g gVar = (g) obj;
        g gVar2 = (g) obj2;
        if (gVar == null || gVar2 == null) {
            return 0;
        }
        return gVar2.f27694d - gVar.f27694d > 0 ? 1 : -1;
    }
}
