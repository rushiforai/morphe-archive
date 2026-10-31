package androidx.datastore.preferences.protobuf;

/* loaded from: classes2.dex */
public final class r0 implements z0 {

    /* renamed from: a, reason: collision with root package name */
    public final a f14391a;

    /* renamed from: b, reason: collision with root package name */
    public final f1 f14392b;

    /* renamed from: c, reason: collision with root package name */
    public final q f14393c;

    public r0(f1 f1Var, q qVar, a aVar) {
        this.f14392b = f1Var;
        qVar.getClass();
        this.f14393c = qVar;
        this.f14391a = aVar;
    }

    public static r0 j(f1 f1Var, q qVar, a aVar) {
        return new r0(f1Var, qVar, aVar);
    }

    @Override // androidx.datastore.preferences.protobuf.z0
    public final void a(Object obj, Object obj2) {
        a1.k(this.f14392b, obj, obj2);
    }

    @Override // androidx.datastore.preferences.protobuf.z0
    public final void b(Object obj) {
        ((h1) this.f14392b).getClass();
        g1 g1Var = ((y) obj).unknownFields;
        if (g1Var.f14323e) {
            g1Var.f14323e = false;
        }
        this.f14393c.getClass();
        b.c0.y(obj);
        throw null;
    }

    @Override // androidx.datastore.preferences.protobuf.z0
    public final boolean c(Object obj) {
        this.f14393c.getClass();
        b.c0.y(obj);
        throw null;
    }

    @Override // androidx.datastore.preferences.protobuf.z0
    public final y d() {
        a aVar = this.f14391a;
        return aVar instanceof y ? ((y) aVar).h() : ((w) ((y) aVar).b(5)).c();
    }

    @Override // androidx.datastore.preferences.protobuf.z0
    public final void e(Object obj, j0 j0Var) {
        this.f14393c.getClass();
        b.c0.y(obj);
        throw null;
    }

    @Override // androidx.datastore.preferences.protobuf.z0
    public final void f(Object obj, l lVar, p pVar) {
        this.f14392b.a(obj);
        this.f14393c.getClass();
        obj.getClass();
        throw new ClassCastException();
    }

    @Override // androidx.datastore.preferences.protobuf.z0
    public final int g(y yVar) {
        ((h1) this.f14392b).getClass();
        g1 g1Var = yVar.unknownFields;
        int i5 = g1Var.f14322d;
        if (i5 != -1) {
            return i5;
        }
        int iI0 = 0;
        for (int i11 = 0; i11 < g1Var.f14319a; i11++) {
            int i12 = g1Var.f14320b[i11] >>> 3;
            h hVar = (h) g1Var.f14321c[i11];
            int iI02 = m.i0(i12) + m.h0(2) + (m.h0(1) * 2);
            int iH0 = m.h0(3);
            int size = hVar.size();
            iI0 += m.i0(size) + size + iH0 + iI02;
        }
        g1Var.f14322d = iI0;
        return iI0;
    }

    @Override // androidx.datastore.preferences.protobuf.z0
    public final int h(y yVar) {
        ((h1) this.f14392b).getClass();
        return yVar.unknownFields.hashCode();
    }

    @Override // androidx.datastore.preferences.protobuf.z0
    public final boolean i(y yVar, y yVar2) {
        h1 h1Var = (h1) this.f14392b;
        h1Var.getClass();
        g1 g1Var = yVar.unknownFields;
        h1Var.getClass();
        return g1Var.equals(yVar2.unknownFields);
    }
}
