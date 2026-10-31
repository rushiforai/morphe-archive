package jk;

import ai.k4;

/* loaded from: classes3.dex */
public final class d implements kk.c {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f69575a;

    /* renamed from: b, reason: collision with root package name */
    public final je.f f69576b;

    public /* synthetic */ d(je.f fVar, int i5) {
        this.f69575a = i5;
        this.f69576b = fVar;
    }

    @Override // kk.c
    public final Object zza() {
        switch (this.f69575a) {
            case 0:
                return new c(((k4) this.f69576b.f69487b).f13083a);
            default:
                return new i(((k4) this.f69576b.f69487b).f13083a);
        }
    }
}
