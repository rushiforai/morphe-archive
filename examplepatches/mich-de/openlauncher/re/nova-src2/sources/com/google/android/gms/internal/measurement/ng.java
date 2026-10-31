package com.google.android.gms.internal.measurement;

import java.util.UUID;
import java.util.concurrent.atomic.AtomicReference;

/* loaded from: classes3.dex */
public final class ng extends dg implements fg {

    /* renamed from: g, reason: collision with root package name */
    public static final zzvr f32857g = new zzvr();

    /* renamed from: f, reason: collision with root package name */
    public final Exception f32858f;

    public ng(UUID uuid, String str, zzvr zzvrVar, yg ygVar) {
        super("<missing root>", uuid, str, ygVar);
        this.f32858f = zzvrVar;
    }

    @Override // com.google.android.gms.internal.measurement.zg
    public final zg F(String str, tg tgVar, yg ygVar) {
        AtomicReference atomicReference = jg.f32692a;
        return X(str, tgVar, true, ygVar);
    }

    @Override // com.google.android.gms.internal.measurement.fg
    public final og X(String str, tg tgVar, boolean z11, yg ygVar) {
        if (z11) {
            AtomicReference atomicReference = jg.f32692a;
        }
        return new og(str, this, tgVar, z11, ygVar);
    }

    @Override // com.google.android.gms.internal.measurement.fg
    public final Exception zzf() {
        return this.f32858f;
    }

    @Override // com.google.android.gms.internal.measurement.zg
    public final tg zzh() {
        return sg.f33071e;
    }
}
