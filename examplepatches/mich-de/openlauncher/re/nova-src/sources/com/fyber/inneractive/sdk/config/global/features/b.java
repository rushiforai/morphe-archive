package com.fyber.inneractive.sdk.config.global.features;

/* loaded from: classes.dex */
public final class b extends i {

    /* renamed from: e, reason: collision with root package name */
    public static final a f27816e = a.OPEN;

    public b() {
        super("ad_identifier");
    }

    @Override // com.fyber.inneractive.sdk.config.global.features.i
    public final i b() {
        b bVar = new b();
        a(bVar);
        return bVar;
    }

    public final a c() {
        String strA = a("identifier_click_action", f27816e.mKey);
        for (a aVar : a.values()) {
            if (strA.equalsIgnoreCase(aVar.mKey)) {
                return aVar;
            }
        }
        return a.NONE;
    }
}
