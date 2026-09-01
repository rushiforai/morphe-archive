package defpackage;

import com.medium.android.core.navigation.ResponsesReference;
import com.medium.android.graphql.fragment.PostMetaData;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ov9 extends p4d implements b55 {
    public int b;
    public final /* synthetic */ sw9 c;
    public final /* synthetic */ PostMetaData d;
    public final /* synthetic */ String e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ov9(n92 n92Var, sw9 sw9Var, PostMetaData postMetaData, String str) {
        super(2, n92Var);
        this.c = sw9Var;
        this.d = postMetaData;
        this.e = str;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        return new ov9(n92Var, this.c, this.d, this.e);
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((ov9) create((sb2) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.b;
        if (i == 0) {
            br7.v(obj);
            r6c r6cVar = this.c.x0;
            dt9 dt9Var = new dt9(new ResponsesReference.Post(this.d.getId(), null, null, null, null, 30, null), this.e);
            this.b = 1;
            if (r6cVar.a(dt9Var, this) == tb2Var) {
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
