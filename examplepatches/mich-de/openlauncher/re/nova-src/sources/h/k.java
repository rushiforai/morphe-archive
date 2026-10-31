package h;

import kotlin.Unit;

/* loaded from: classes.dex */
public final class k extends j.c {

    /* renamed from: a, reason: collision with root package name */
    public final a f58706a;

    public k(a aVar) {
        this.f58706a = aVar;
    }

    @Override // j.c
    public final void a(Object obj, n4.c cVar) {
        Unit unit;
        j.h hVar = this.f58706a.f58687a;
        if (hVar != null) {
            hVar.a(obj, cVar);
            unit = Unit.f71706a;
        } else {
            unit = null;
        }
        if (unit == null) {
            throw new IllegalStateException("Launcher has not been initialized");
        }
    }

    @Override // j.c
    public final void b() {
        throw new UnsupportedOperationException("Registration is automatically handled by rememberLauncherForActivityResult");
    }
}
