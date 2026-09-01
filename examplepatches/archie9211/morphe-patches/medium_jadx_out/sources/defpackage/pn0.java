package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pn0 implements on0 {
    public final List a;
    public uk6 c = null;
    public float d = -1.0f;
    public uk6 b = a(0.0f);

    public pn0(List list) {
        this.a = list;
    }

    public final uk6 a(float f) {
        List list = this.a;
        uk6 uk6Var = (uk6) list.get(list.size() - 1);
        if (f >= uk6Var.b()) {
            return uk6Var;
        }
        for (int size = list.size() - 2; size >= 1; size--) {
            uk6 uk6Var2 = (uk6) list.get(size);
            if (this.b != uk6Var2 && f >= uk6Var2.b() && f < uk6Var2.a()) {
                return uk6Var2;
            }
        }
        return (uk6) list.get(0);
    }

    @Override // defpackage.on0
    public final boolean b(float f) {
        uk6 uk6Var = this.c;
        uk6 uk6Var2 = this.b;
        if (uk6Var == uk6Var2 && this.d == f) {
            return true;
        }
        this.c = uk6Var2;
        this.d = f;
        return false;
    }

    @Override // defpackage.on0
    public final uk6 d() {
        return this.b;
    }

    @Override // defpackage.on0
    public final boolean h(float f) {
        uk6 uk6Var = this.b;
        if (f >= uk6Var.b() && f < uk6Var.a()) {
            return !this.b.c();
        }
        this.b = a(f);
        return true;
    }

    @Override // defpackage.on0
    public final boolean isEmpty() {
        return false;
    }

    @Override // defpackage.on0
    public final float m() {
        return ((uk6) this.a.get(r1.size() - 1)).a();
    }

    @Override // defpackage.on0
    public final float o() {
        return ((uk6) this.a.get(0)).b();
    }
}
