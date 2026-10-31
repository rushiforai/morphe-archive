package com.google.android.gms.internal.consent_sdk;

import android.app.Application;

/* loaded from: classes.dex */
public final class i implements l7 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f32096a;

    /* renamed from: b, reason: collision with root package name */
    public final vm.c f32097b;

    public /* synthetic */ i(vm.c cVar, int i5) {
        this.f32096a = i5;
        this.f32097b = cVar;
    }

    @Override // com.google.android.gms.internal.consent_sdk.m7
    public final Object zzb() {
        switch (this.f32096a) {
            case 0:
                return new h((Application) this.f32097b.f92857b);
            default:
                return new c0((Application) this.f32097b.f92857b);
        }
    }
}
