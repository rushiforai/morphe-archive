package wk;

import java.util.logging.Logger;

/* loaded from: classes.dex */
public final class d {

    /* renamed from: c, reason: collision with root package name */
    public static final vk.y f94508c = new vk.y(new a());

    /* renamed from: d, reason: collision with root package name */
    public static final vk.a0 f94509d = new vk.a0();

    /* renamed from: a, reason: collision with root package name */
    public t f94510a;

    /* renamed from: b, reason: collision with root package name */
    public u f94511b;

    static {
        Logger.getLogger(d.class.getName());
    }

    public static d a() {
        return new d();
    }

    public final void b(u uVar) {
        u uVar2 = this.f94511b;
        if (!(uVar2 == null)) {
            throw new IllegalStateException(vk.b0.p("Value strength was already set to %s", uVar2));
        }
        this.f94511b = uVar;
    }

    public final String toString() {
        vk.j jVar = new vk.j(d.class.getSimpleName());
        t tVar = this.f94510a;
        if (tVar != null) {
            jVar.o("keyStrength", vk.b0.s(tVar.toString()));
        }
        u uVar = this.f94511b;
        if (uVar != null) {
            jVar.o("valueStrength", vk.b0.s(uVar.toString()));
        }
        return jVar.toString();
    }
}
