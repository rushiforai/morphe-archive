package defpackage;

import com.medium.android.graphql.fragment.PostMetaData;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class wu9 extends p4d implements b55 {
    public int b;
    public final /* synthetic */ sw9 c;
    public final /* synthetic */ PostMetaData d;
    public final /* synthetic */ rya e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public wu9(sw9 sw9Var, PostMetaData postMetaData, rya ryaVar, n92 n92Var) {
        super(2, n92Var);
        this.c = sw9Var;
        this.d = postMetaData;
        this.e = ryaVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        return new wu9(this.c, this.d, this.e, n92Var);
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((wu9) create((sb2) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.b;
        if (i == 0) {
            br7.v(obj);
            sw9 sw9Var = this.c;
            wjc wjcVar = sw9Var.A;
            PostMetaData.Collection collection = this.d.getCollection();
            bo4 bo4VarG = wjcVar.g(collection != null ? collection.getId() : null, false);
            vu9 vu9Var = new vu9(this.e, sw9Var, 0);
            this.b = 1;
            if (bo4VarG.b(vu9Var, this) == tb2Var) {
                return tb2Var;
            }
        } else {
            if (i != 1) {
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            }
            br7.v(obj);
        }
        return c1e.a;
    }
}
