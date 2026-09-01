package defpackage;

import com.medium.android.graphql.type.UserDismissableFlags;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ng3 extends p92 {
    public UserDismissableFlags b;
    public /* synthetic */ Object c;
    public final /* synthetic */ og3 d;
    public int e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ng3(og3 og3Var, n92 n92Var) {
        super(n92Var);
        this.d = og3Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) throws Throwable {
        this.c = obj;
        this.e |= Integer.MIN_VALUE;
        Object objC = this.d.c(null, this);
        return objC == tb2.COROUTINE_SUSPENDED ? objC : new bjb(objC);
    }
}
