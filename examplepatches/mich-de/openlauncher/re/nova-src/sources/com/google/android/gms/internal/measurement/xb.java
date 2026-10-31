package com.google.android.gms.internal.measurement;

import java.util.Iterator;

/* loaded from: classes3.dex */
public abstract class xb {

    /* renamed from: a, reason: collision with root package name */
    public static final z.e f33224a = new z.e(0);

    public static synchronized void a() {
        z.e eVar = f33224a;
        Iterator it = ((z.d) eVar.values()).iterator();
        if (it.hasNext()) {
            if (it.next() != null) {
                throw new ClassCastException();
            }
            throw null;
        }
        eVar.clear();
    }
}
