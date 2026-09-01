package defpackage;

import java.io.Serializable;

/* JADX INFO: loaded from: classes5.dex */
public final class qo4 extends p92 {
    public /* synthetic */ Object b;
    public int c;
    public final /* synthetic */ ro4 d;
    public do4 e;
    public Serializable f;
    public int g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public qo4(ro4 ro4Var, n92 n92Var) {
        super(n92Var);
        this.d = ro4Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.b = obj;
        this.c |= Integer.MIN_VALUE;
        return this.d.b(null, this);
    }
}
