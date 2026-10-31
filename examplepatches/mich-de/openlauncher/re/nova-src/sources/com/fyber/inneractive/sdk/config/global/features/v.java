package com.fyber.inneractive.sdk.config.global.features;

/* loaded from: classes.dex */
public final class v extends i {

    /* renamed from: e, reason: collision with root package name */
    public static final u f27822e = u.NONE;

    public v() {
        super("video_player");
    }

    @Override // com.fyber.inneractive.sdk.config.global.features.i
    public final i b() {
        v vVar = new v();
        a(vVar);
        return vVar;
    }

    public final u c() {
        String strA = a("click_action", f27822e.mKey);
        for (u uVar : u.values()) {
            if (strA.equalsIgnoreCase(uVar.mKey)) {
                return uVar;
            }
        }
        return u.NONE;
    }
}
