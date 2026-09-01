package defpackage;

import com.medium.android.graphql.fragment.PostMetaData;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class sv9 extends p4d implements b55 {
    public int b;
    public final /* synthetic */ sw9 c;
    public final /* synthetic */ String d;
    public final /* synthetic */ String e;
    public final /* synthetic */ PostMetaData f;
    public final /* synthetic */ String g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public sv9(sw9 sw9Var, String str, String str2, PostMetaData postMetaData, String str3, n92 n92Var) {
        super(2, n92Var);
        this.c = sw9Var;
        this.d = str;
        this.e = str2;
        this.f = postMetaData;
        this.g = str3;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        return new sv9(this.c, this.d, this.e, this.f, this.g, n92Var);
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((sv9) create((sb2) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        PostMetaData.ViewerEdge2 viewerEdge;
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.b;
        if (i == 0) {
            br7.v(obj);
            r6c r6cVar = this.c.x0;
            PostMetaData postMetaData = this.f;
            String id = postMetaData.getId();
            PostMetaData.Creator creator = postMetaData.getCreator();
            ct9 ct9Var = new ct9(this.d, this.e, id, this.g, (creator == null || (viewerEdge = creator.getViewerEdge()) == null || !viewerEdge.isUser()) ? false : true);
            this.b = 1;
            if (r6cVar.a(ct9Var, this) == tb2Var) {
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
