package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class xl8 implements c8 {
    public final c8 a;

    public xl8(c8 c8Var) {
        c8Var.getClass();
        this.a = c8Var;
        if (c8Var instanceof xl8) {
            ygf.f("The adapter is already nullable");
            throw null;
        }
    }

    @Override // defpackage.c8
    public final Object fromJson(fd6 fd6Var, yl2 yl2Var) {
        if (fd6Var.peek() != cd6.NULL) {
            return this.a.fromJson(fd6Var, yl2Var);
        }
        fd6Var.v();
        return null;
    }

    @Override // defpackage.c8
    public final void toJson(ae6 ae6Var, yl2 yl2Var, Object obj) {
        yl2Var.getClass();
        if (obj == null) {
            ae6Var.s0();
        } else {
            this.a.toJson(ae6Var, yl2Var, obj);
        }
    }
}
