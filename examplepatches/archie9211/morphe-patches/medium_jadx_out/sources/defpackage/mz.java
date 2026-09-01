package defpackage;

import com.apollographql.apollo.exception.ApolloException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mz extends p4d implements b55 {
    public final /* synthetic */ int b;
    public /* synthetic */ Object c;
    public final /* synthetic */ rya d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ mz(rya ryaVar, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = ryaVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        rya ryaVar = this.d;
        switch (i) {
            case 0:
                mz mzVar = new mz(ryaVar, n92Var, 0);
                mzVar.c = obj;
                return mzVar;
            default:
                mz mzVar2 = new mz(ryaVar, n92Var, 1);
                mzVar2.c = obj;
                return mzVar2;
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        j00 j00Var = (j00) obj;
        n92 n92Var = (n92) obj2;
        switch (i) {
            case 0:
                ((mz) create(j00Var, n92Var)).invokeSuspend(c1eVar);
                break;
            default:
                ((mz) create(j00Var, n92Var)).invokeSuspend(c1eVar);
                break;
        }
        return c1eVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        rya ryaVar = this.d;
        switch (i) {
            case 0:
                br7.v(obj);
                ryaVar.a = ((j00) this.c).e;
                break;
            default:
                br7.v(obj);
                ApolloException apolloException = ((j00) this.c).e;
                if (apolloException != null && ryaVar.a == null) {
                    ryaVar.a = apolloException;
                }
                break;
        }
        return c1eVar;
    }
}
