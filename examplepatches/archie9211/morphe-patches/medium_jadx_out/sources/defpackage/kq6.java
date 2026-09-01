package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class kq6 extends xp6 {
    public final /* synthetic */ nq6 b;
    public final /* synthetic */ b55 c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public kq6(nq6 nq6Var, b55 b55Var, String str) {
        super(str);
        this.b = nq6Var;
        this.c = b55Var;
    }

    @Override // defpackage.zk7
    public final al7 b(bl7 bl7Var, List list, long j) {
        nq6 nq6Var = this.b;
        iq6 iq6Var = nq6Var.h;
        iq6Var.a = bl7Var.getLayoutDirection();
        iq6Var.b = bl7Var.b();
        iq6Var.c = bl7Var.U();
        boolean zW = bl7Var.W();
        b55 b55Var = this.c;
        if (zW || nq6Var.a.h == null) {
            nq6Var.d = 0;
            al7 al7Var = (al7) b55Var.invoke(iq6Var, new f72(j));
            return new jq6(al7Var, nq6Var, nq6Var.d, al7Var, 1);
        }
        nq6Var.e = 0;
        al7 al7Var2 = (al7) b55Var.invoke(nq6Var.i, new f72(j));
        return new jq6(al7Var2, nq6Var, nq6Var.e, al7Var2, 0);
    }
}
