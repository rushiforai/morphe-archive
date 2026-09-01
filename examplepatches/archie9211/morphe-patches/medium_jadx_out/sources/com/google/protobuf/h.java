package com.google.protobuf;

import defpackage.aq1;
import defpackage.brb;
import defpackage.cz7;
import defpackage.f21;
import defpackage.l70;
import defpackage.lv8;
import defpackage.p74;
import defpackage.s74;
import defpackage.y30;
import defpackage.zm7;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class h implements brb {
    public final cz7 a;
    public final j b;
    public final s74 c;

    public h(j jVar, s74 s74Var, cz7 cz7Var) {
        this.b = jVar;
        s74Var.getClass();
        this.c = s74Var;
        this.a = cz7Var;
    }

    @Override // defpackage.brb
    public final void a(Object obj, Object obj2) {
        i.w(this.b, obj, obj2);
    }

    @Override // defpackage.brb
    public final void b(Object obj) {
        ((l) this.b).getClass();
        ((e) obj).unknownFields.e = false;
        this.c.getClass();
        lv8.z(obj);
        throw null;
    }

    @Override // defpackage.brb
    public final boolean c(Object obj) {
        this.c.getClass();
        lv8.z(obj);
        throw null;
    }

    @Override // defpackage.brb
    public final Object d() {
        cz7 cz7Var = this.a;
        return cz7Var instanceof e ? ((e) cz7Var).newMutableInstance() : cz7Var.newBuilderForType().buildPartial();
    }

    @Override // defpackage.brb
    public final void e(Object obj, d dVar, p74 p74Var) {
        this.b.a(obj);
        this.c.getClass();
        obj.getClass();
        throw new ClassCastException();
    }

    @Override // defpackage.brb
    public final int f(e eVar) {
        ((l) this.b).getClass();
        return eVar.unknownFields.hashCode();
    }

    @Override // defpackage.brb
    public final int g(e eVar) {
        ((l) this.b).getClass();
        k kVar = eVar.unknownFields;
        int i = kVar.d;
        if (i != -1) {
            return i;
        }
        int iA = 0;
        for (int i2 = 0; i2 < kVar.a; i2++) {
            int i3 = kVar.b[i2] >>> 3;
            iA += aq1.a(3, (f21) kVar.c[i2]) + aq1.i(2, i3) + (aq1.h(1) * 2);
        }
        kVar.d = iA;
        return iA;
    }

    @Override // defpackage.brb
    public final boolean h(e eVar, e eVar2) {
        l lVar = (l) this.b;
        lVar.getClass();
        k kVar = eVar.unknownFields;
        lVar.getClass();
        return kVar.equals(eVar2.unknownFields);
    }

    @Override // defpackage.brb
    public final void i(Object obj, zm7 zm7Var) {
        this.c.getClass();
        lv8.z(obj);
        throw null;
    }

    @Override // defpackage.brb
    public final void j(Object obj, byte[] bArr, int i, int i2, l70 l70Var) {
        e eVar = (e) obj;
        if (eVar.unknownFields == k.f) {
            eVar.unknownFields = new k();
        }
        throw y30.k(obj);
    }
}
