package com.google.android.gms.internal.measurement;

/* loaded from: classes3.dex */
public final class vh extends xh {

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ xh f33162c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ xh f33163d;

    public vh(xh xhVar, xh xhVar2) {
        this.f33162c = xhVar;
        this.f33163d = xhVar2;
    }

    @Override // com.google.android.gms.internal.measurement.xh
    public final void a() {
        xh xhVar = this.f33163d;
        try {
            this.f33162c.a();
        } finally {
            xhVar.a();
        }
    }
}
