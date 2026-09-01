package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ok6 {
    public final akc a;
    public pk6 b;
    public lr4 c;

    public ok6(akc akcVar) {
        this.a = akcVar;
    }

    public final pk6 a() {
        pk6 pk6Var = this.b;
        if (pk6Var != null) {
            return pk6Var;
        }
        g76.g0("keyboardActions");
        throw null;
    }

    public final boolean b(int i) {
        x45 x45Var;
        akc akcVar;
        if (i == 7) {
            x45Var = a().a;
        } else if (i == 2) {
            x45Var = a().b;
        } else if (i == 6) {
            x45Var = a().c;
        } else if (i == 5) {
            x45Var = a().d;
        } else if (i == 3) {
            x45Var = a().e;
        } else if (i == 4) {
            x45Var = a().f;
        } else {
            if (i != 1 && i != 0) {
                ygf.f("invalid ImeAction");
                return false;
            }
            x45Var = null;
        }
        if (x45Var != null) {
            x45Var.invoke(this);
            return true;
        }
        if (i == 6) {
            lr4 lr4Var = this.c;
            if (lr4Var != null) {
                ((or4) lr4Var).g(1, true);
                return true;
            }
            g76.g0("focusManager");
            throw null;
        }
        if (i != 5) {
            if (i != 7 || (akcVar = this.a) == null) {
                return false;
            }
            ((n43) akcVar).a();
            return true;
        }
        lr4 lr4Var2 = this.c;
        if (lr4Var2 != null) {
            ((or4) lr4Var2).g(2, true);
            return true;
        }
        g76.g0("focusManager");
        throw null;
    }
}
