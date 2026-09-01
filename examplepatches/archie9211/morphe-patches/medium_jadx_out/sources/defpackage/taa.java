package defpackage;

import com.medium.android.core.models.EntityType;
import com.medium.android.graphql.fragment.PublicationStaffData;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class taa extends p4d implements c55 {
    public final /* synthetic */ int b;
    public /* synthetic */ bt4 c;
    public /* synthetic */ cg8 d;
    public final /* synthetic */ PublicationStaffData e;
    public final /* synthetic */ String f;
    public final /* synthetic */ vaa g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ taa(PublicationStaffData publicationStaffData, String str, vaa vaaVar, n92 n92Var, int i) {
        super(3, n92Var);
        this.b = i;
        this.e = publicationStaffData;
        this.f = str;
        this.g = vaaVar;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        bt4 bt4Var = (bt4) obj;
        cg8 cg8Var = (cg8) obj2;
        n92 n92Var = (n92) obj3;
        switch (i) {
            case 0:
                taa taaVar = new taa(this.e, this.f, this.g, n92Var, 0);
                taaVar.c = bt4Var;
                taaVar.d = cg8Var;
                return taaVar.invokeSuspend(c1eVar);
            default:
                taa taaVar2 = new taa(this.e, this.f, this.g, n92Var, 1);
                taaVar2.c = bt4Var;
                taaVar2.d = cg8Var;
                return taaVar2.invokeSuspend(c1eVar);
        }
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        vaa vaaVar = this.g;
        PublicationStaffData publicationStaffData = this.e;
        switch (i) {
            case 0:
                bt4 bt4Var = this.c;
                cg8 cg8Var = this.d;
                br7.v(obj);
                return new wu4(publicationStaffData.getId(), this.f, EntityType.AUTHOR, bt4Var, cg8Var, vaaVar.p);
            default:
                bt4 bt4Var2 = this.c;
                cg8 cg8Var2 = this.d;
                br7.v(obj);
                return new wu4(publicationStaffData.getId(), this.f, EntityType.AUTHOR, bt4Var2, cg8Var2, vaaVar.p);
        }
    }
}
