package com.google.android.gms.internal.measurement;

import java.util.Iterator;

/* loaded from: classes3.dex */
public final class ji {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f32705a;

    public /* synthetic */ ji(int i5) {
        this.f32705a = i5;
    }

    private final void b(th thVar, Iterator it, fi fiVar) {
    }

    public final void a(th thVar, Iterator it, fi fiVar) {
        switch (this.f32705a) {
            case 0:
                return;
            default:
                if (!thVar.f33094c) {
                    throw new IllegalStateException("non repeating key");
                }
                if (!thVar.f33095d || ((g0) g0.f32549b.get()).f32550a <= 20) {
                    thVar.a(it, fiVar);
                    return;
                }
                while (it.hasNext()) {
                    fiVar.a(it.next(), thVar.f33092a);
                }
                return;
        }
    }
}
