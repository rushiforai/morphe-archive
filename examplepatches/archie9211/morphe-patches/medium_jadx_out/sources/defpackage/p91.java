package defpackage;

import android.content.res.Resources;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class p91 extends p4d implements b55 {
    public final /* synthetic */ int b = 0;
    public int c;
    public final /* synthetic */ nhc d;
    public final /* synthetic */ bc1 e;
    public final /* synthetic */ Resources f;
    public final /* synthetic */ id1 g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public p91(nhc nhcVar, bc1 bc1Var, Resources resources, id1 id1Var, n92 n92Var) {
        super(2, n92Var);
        this.d = nhcVar;
        this.e = bc1Var;
        this.f = resources;
        this.g = id1Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                return new p91(this.d, this.f, this.g, this.e, n92Var);
            default:
                return new p91(this.d, this.e, this.f, this.g, n92Var);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        sb2 sb2Var = (sb2) obj;
        n92 n92Var = (n92) obj2;
        switch (i) {
        }
        return ((p91) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        Object objC;
        Object objC2;
        int i = this.b;
        c1e c1eVar = c1e.a;
        id1 id1Var = this.g;
        bc1 bc1Var = this.e;
        Resources resources = this.f;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    String string = resources.getString(R.string.catalog_detail_delete_story_failed);
                    string.getClass();
                    String string2 = resources.getString(R.string.common_retry);
                    bhc bhcVar = bhc.Long;
                    this.c = 1;
                    objC = nhc.c(this.d, string, string2, bhcVar, this, 4);
                    if (objC == tb2Var) {
                    }
                } else if (i2 != 1) {
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                } else {
                    br7.v(obj);
                    objC = obj;
                }
                if (((aic) objC) == aic.ActionPerformed) {
                    id1Var.l(((qb1) bc1Var).a);
                }
                break;
            default:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 == 0) {
                    br7.v(obj);
                    String string3 = ((ub1) bc1Var).b instanceof x14 ? resources.getString(R.string.common_undo_claps_network_failure) : resources.getString(R.string.common_undo_claps_failure);
                    string3.getClass();
                    String string4 = resources.getString(R.string.common_retry);
                    bhc bhcVar2 = bhc.Long;
                    this.c = 1;
                    objC2 = nhc.c(this.d, string3, string4, bhcVar2, this, 4);
                    if (objC2 == tb2Var2) {
                    }
                } else if (i3 != 1) {
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                } else {
                    br7.v(obj);
                    objC2 = obj;
                }
                if (((aic) objC2) == aic.ActionPerformed) {
                    vx0.c0(f76.F(id1Var), null, null, new cd1(((ub1) bc1Var).a, id1Var, null), 3);
                }
                break;
        }
        return c1eVar;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public p91(nhc nhcVar, Resources resources, id1 id1Var, bc1 bc1Var, n92 n92Var) {
        super(2, n92Var);
        this.d = nhcVar;
        this.f = resources;
        this.g = id1Var;
        this.e = bc1Var;
    }
}
