package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class zkd implements gb2 {
    public final Object a;
    public final ThreadLocal b;
    public final bld c;

    public zkd(Object obj, ThreadLocal threadLocal) {
        this.a = obj;
        this.b = threadLocal;
        this.c = new bld(threadLocal);
    }

    @Override // defpackage.ib2
    public final Object N(b55 b55Var, Object obj) {
        return b55Var.invoke(obj, this);
    }

    @Override // defpackage.ib2
    public final ib2 T(hb2 hb2Var) {
        return this.c.equals(hb2Var) ? zx3.a : this;
    }

    public final void a(Object obj) {
        this.b.set(obj);
    }

    public final Object b() {
        ThreadLocal threadLocal = this.b;
        Object obj = threadLocal.get();
        threadLocal.set(this.a);
        return obj;
    }

    @Override // defpackage.gb2
    public final hb2 getKey() {
        return this.c;
    }

    @Override // defpackage.ib2
    public final ib2 j0(ib2 ib2Var) {
        return flb.p0(this, ib2Var);
    }

    @Override // defpackage.ib2
    public final gb2 o0(hb2 hb2Var) {
        if (this.c.equals(hb2Var)) {
            return this;
        }
        return null;
    }

    public final String toString() {
        return "ThreadLocal(value=" + this.a + ", threadLocal = " + this.b + ')';
    }
}
