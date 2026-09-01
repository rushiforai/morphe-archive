package defpackage;

import com.medium.android.graphql.type.UserDismissableFlags;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class d86 extends p92 {
    public UserDismissableFlags b;
    public /* synthetic */ Object c;
    public final /* synthetic */ rz2 d;
    public int e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d86(rz2 rz2Var, p92 p92Var) {
        super(p92Var);
        this.d = rz2Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.c = obj;
        this.e |= Integer.MIN_VALUE;
        return this.d.K(null, this);
    }
}
