package com.google.android.gms.internal.measurement;

import java.util.UUID;

/* loaded from: classes3.dex */
public abstract class gg extends dg {

    /* renamed from: f, reason: collision with root package name */
    public final tg f32578f;

    public gg(String str, dg dgVar, tg tgVar, yg ygVar) {
        super(str, dgVar, ygVar);
        vk.b0.c(tgVar.f33091c);
        this.f32578f = tgVar;
    }

    @Override // com.google.android.gms.internal.measurement.zg
    public final tg zzh() {
        return tg.a(this.f32578f, zzl());
    }

    public gg(String str, UUID uuid, String str2, tg tgVar, yg ygVar) {
        super(str, uuid, str2, ygVar);
        vk.b0.c(tgVar.f33091c);
        this.f32578f = tgVar;
    }
}
