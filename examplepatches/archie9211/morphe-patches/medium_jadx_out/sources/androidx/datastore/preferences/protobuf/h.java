package androidx.datastore.preferences.protobuf;

import defpackage.crb;
import defpackage.d21;
import defpackage.h75;
import defpackage.lv8;
import defpackage.r74;
import defpackage.r75;
import defpackage.t74;
import defpackage.zg7;
import defpackage.zp1;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class h implements crb {
    public final a a;
    public final j b;
    public final t74 c;

    public h(j jVar, t74 t74Var, a aVar) {
        this.b = jVar;
        t74Var.getClass();
        this.c = t74Var;
        this.a = aVar;
    }

    @Override // defpackage.crb
    public final void a(Object obj, Object obj2) {
        i.k(this.b, obj, obj2);
    }

    @Override // defpackage.crb
    public final void b(Object obj) {
        ((l) this.b).getClass();
        k kVar = ((e) obj).unknownFields;
        if (kVar.e) {
            kVar.e = false;
        }
        this.c.getClass();
        lv8.z(obj);
        throw null;
    }

    @Override // defpackage.crb
    public final boolean c(Object obj) {
        this.c.getClass();
        lv8.z(obj);
        throw null;
    }

    @Override // defpackage.crb
    public final e d() {
        a aVar = this.a;
        return aVar instanceof e ? ((e) aVar).i() : ((h75) ((e) aVar).c(r75.NEW_BUILDER)).b();
    }

    @Override // defpackage.crb
    public final void e(Object obj, d dVar, r74 r74Var) {
        this.b.a(obj);
        this.c.getClass();
        obj.getClass();
        throw new ClassCastException();
    }

    @Override // defpackage.crb
    public final void f(Object obj, zg7 zg7Var) {
        this.c.getClass();
        lv8.z(obj);
        throw null;
    }

    @Override // defpackage.crb
    public final int g(e eVar) {
        ((l) this.b).getClass();
        k kVar = eVar.unknownFields;
        int i = kVar.d;
        if (i != -1) {
            return i;
        }
        int iF = 0;
        for (int i2 = 0; i2 < kVar.a; i2++) {
            int i3 = kVar.b[i2] >>> 3;
            iF += zp1.f(3, (d21) kVar.c[i2]) + zp1.i(i3) + zp1.h(2) + (zp1.h(1) * 2);
        }
        kVar.d = iF;
        return iF;
    }

    @Override // defpackage.crb
    public final int h(e eVar) {
        ((l) this.b).getClass();
        return eVar.unknownFields.hashCode();
    }

    @Override // defpackage.crb
    public final boolean i(e eVar, e eVar2) {
        l lVar = (l) this.b;
        lVar.getClass();
        k kVar = eVar.unknownFields;
        lVar.getClass();
        return kVar.equals(eVar2.unknownFields);
    }
}
