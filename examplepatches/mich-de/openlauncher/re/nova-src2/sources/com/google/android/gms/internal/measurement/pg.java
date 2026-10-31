package com.google.android.gms.internal.measurement;

import java.util.UUID;

/* loaded from: classes3.dex */
public final class pg extends gg {

    /* renamed from: g, reason: collision with root package name */
    public static final pg f32968g;

    static {
        UUID uuidRandomUUID = UUID.randomUUID();
        f32968g = new pg("<skip trace>", uuidRandomUUID, dg.a(uuidRandomUUID), sg.f33071e, jg.c());
    }

    @Override // com.google.android.gms.internal.measurement.zg
    public final zg F(String str, tg tgVar, yg ygVar) {
        throw new IllegalStateException("Can't create child trace for no trace!");
    }

    @Override // com.google.android.gms.internal.measurement.zg
    public final tg zzl() {
        return sg.f33071e;
    }
}
