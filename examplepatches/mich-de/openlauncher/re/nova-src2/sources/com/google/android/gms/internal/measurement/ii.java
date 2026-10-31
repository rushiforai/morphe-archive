package com.google.android.gms.internal.measurement;

/* loaded from: classes3.dex */
public final class ii {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f32665a;

    public /* synthetic */ ii(int i5) {
        this.f32665a = i5;
    }

    private final void b(th thVar, Object obj, fi fiVar) {
    }

    public final void a(th thVar, Object obj, fi fiVar) {
        switch (this.f32665a) {
            case 0:
                break;
            default:
                if (thVar.f33095d && ((g0) g0.f32549b.get()).f32550a > 20) {
                    fiVar.a(obj, thVar.f33092a);
                    break;
                } else {
                    thVar.b(obj, fiVar);
                    break;
                }
                break;
        }
    }
}
