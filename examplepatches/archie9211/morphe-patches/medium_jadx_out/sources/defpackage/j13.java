package defpackage;

import com.apollographql.apollo.exception.ApolloException;
import com.apollographql.apollo.exception.ApolloNetworkException;
import com.medium.android.responses.ResponsesViewModel$WriteState$Highlight;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class j13 extends p4d implements b55 {
    public final /* synthetic */ int b = 1;
    public /* synthetic */ Object c;
    public final /* synthetic */ boolean d;
    public final /* synthetic */ Object e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public j13(boolean z, mya myaVar, yd4 yd4Var, n92 n92Var) {
        super(2, n92Var);
        this.d = z;
        this.c = myaVar;
        this.e = yd4Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        Object obj2 = this.e;
        boolean z = this.d;
        switch (i) {
            case 0:
                j13 j13Var = new j13(z, (pya) obj2, n92Var);
                j13Var.c = obj;
                return j13Var;
            case 1:
                j13 j13Var2 = new j13((nib) obj2, z, n92Var);
                j13Var2.c = obj;
                return j13Var2;
            default:
                return new j13(z, (mya) this.c, (yd4) obj2, n92Var);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) throws ljb {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                ((j13) create((j00) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 1:
                ((j13) create((qgb) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            default:
                ((j13) create((do4) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
        }
        return c1eVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) throws ljb {
        ApolloException apolloException;
        bib bibVarA;
        int i = this.b;
        n92 n92Var = null;
        c1e c1eVar = c1e.a;
        Object obj2 = this.e;
        boolean z = this.d;
        switch (i) {
            case 0:
                br7.v(obj);
                j00 j00Var = (j00) this.c;
                if (z && (apolloException = j00Var.e) != null) {
                    int i2 = njb.a;
                    if (apolloException instanceof ApolloNetworkException) {
                        throw ljb.a;
                    }
                }
                ((pya) obj2).a = 0;
                return c1eVar;
            case 1:
                qgb qgbVar = (qgb) this.c;
                br7.v(obj);
                nib nibVar = (nib) obj2;
                vob vobVar = nibVar.A;
                bib bibVarE = nibVar.e();
                if (z && bibVarE.e == null) {
                    jl5 jl5Var = qgbVar.k;
                    bibVarA = bib.a(bibVarE, null, null, null, null, false, null, false, jl5Var != null ? new ResponsesViewModel$WriteState$Highlight(jl5Var.a, jl5Var.b, jl5Var.c, jl5Var.d, jl5Var.e) : null, 511);
                } else {
                    bibVarA = bib.a(bibVarE, null, null, null, null, false, null, false, null, 511);
                }
                vobVar.d("write_state", bibVarA);
                return c1eVar;
            default:
                br7.v(obj);
                if (z) {
                    mya myaVar = (mya) this.c;
                    vx0.c0((sb2) myaVar.c, null, null, new cfd(myaVar, (yd4) obj2, n92Var, 22), 3);
                }
                return c1eVar;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public j13(nib nibVar, boolean z, n92 n92Var) {
        super(2, n92Var);
        this.e = nibVar;
        this.d = z;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public j13(boolean z, pya pyaVar, n92 n92Var) {
        super(2, n92Var);
        this.d = z;
        this.e = pyaVar;
    }
}
