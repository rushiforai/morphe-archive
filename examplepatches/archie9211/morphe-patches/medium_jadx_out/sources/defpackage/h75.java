package defpackage;

import androidx.datastore.preferences.protobuf.UninitializedMessageException;
import androidx.datastore.preferences.protobuf.e;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class h75 implements Cloneable {
    public final e a;
    public e b;

    public h75(e eVar) {
        this.a = eVar;
        if (eVar.g()) {
            ay0.e("Default instance must be immutable.");
            throw null;
        }
        this.b = eVar.i();
    }

    public final e a() {
        e eVarB = b();
        eVarB.getClass();
        if (e.f(eVarB, true)) {
            return eVarB;
        }
        throw new UninitializedMessageException();
    }

    public final e b() {
        boolean zG = this.b.g();
        e eVar = this.b;
        if (!zG) {
            return eVar;
        }
        eVar.getClass();
        u7a u7aVar = u7a.c;
        u7aVar.getClass();
        u7aVar.a(eVar.getClass()).b(eVar);
        eVar.h();
        return this.b;
    }

    public final void c() {
        if (this.b.g()) {
            return;
        }
        e eVarI = this.a.i();
        e eVar = this.b;
        u7a u7aVar = u7a.c;
        u7aVar.getClass();
        u7aVar.a(eVarI.getClass()).a(eVarI, eVar);
        this.b = eVarI;
    }

    public final Object clone() {
        h75 h75Var = (h75) this.a.c(r75.NEW_BUILDER);
        h75Var.b = b();
        return h75Var;
    }
}
