package com.google.android.gms.internal.measurement;

/* loaded from: classes3.dex */
public final class sg extends tg {

    /* renamed from: e, reason: collision with root package name */
    public static final tg f33071e;

    /* renamed from: f, reason: collision with root package name */
    public static final tg f33072f;

    static {
        tg tgVarB = new sg(null, new z.c1(0)).b();
        f33071e = tgVarB;
        sg sgVar = new sg(tgVarB, new z.c1(0));
        boolean z11 = !sgVar.f33091c;
        Boolean bool = Boolean.TRUE;
        vk.b0.j("Can't mutate after handing to trace", z11);
        vk.b0.j("Key already present", !sgVar.c());
        sgVar.f33090b.put(tg.f33088d, bool);
        f33072f = sgVar.b();
    }
}
