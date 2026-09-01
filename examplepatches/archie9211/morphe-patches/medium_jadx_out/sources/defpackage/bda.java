package defpackage;

import com.medium.android.core.models.EntityType;
import com.medium.android.graphql.fragment.CreatorPreviewData;
import com.medium.android.graphql.fragment.PublicationStaffData;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class bda extends p4d implements c55 {
    public final /* synthetic */ int b;
    public /* synthetic */ bt4 c;
    public /* synthetic */ cg8 d;
    public final /* synthetic */ g15 e;
    public final /* synthetic */ String f;
    public final /* synthetic */ Object g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public bda(String str, CreatorPreviewData creatorPreviewData, SourceParameter sourceParameter, n92 n92Var) {
        super(3, n92Var);
        this.b = 2;
        this.f = str;
        this.e = creatorPreviewData;
        this.g = sourceParameter;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        Object obj4 = this.g;
        g15 g15Var = this.e;
        bt4 bt4Var = (bt4) obj;
        cg8 cg8Var = (cg8) obj2;
        switch (i) {
            case 0:
                String str = this.f;
                bda bdaVar = new bda((PublicationStaffData) g15Var, str, (dda) obj4, (n92) obj3, 0);
                bdaVar.c = bt4Var;
                bdaVar.d = cg8Var;
                return bdaVar.invokeSuspend(c1eVar);
            case 1:
                String str2 = this.f;
                bda bdaVar2 = new bda((PublicationStaffData) g15Var, str2, (eoa) obj4, (n92) obj3, 1);
                bdaVar2.c = bt4Var;
                bdaVar2.d = cg8Var;
                return bdaVar2.invokeSuspend(c1eVar);
            default:
                String str3 = this.f;
                bda bdaVar3 = new bda(str3, (CreatorPreviewData) g15Var, (SourceParameter) obj4, (n92) obj3);
                bdaVar3.c = bt4Var;
                bdaVar3.d = cg8Var;
                return bdaVar3.invokeSuspend(c1eVar);
        }
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        Object obj2 = this.g;
        g15 g15Var = this.e;
        switch (i) {
            case 0:
                bt4 bt4Var = this.c;
                cg8 cg8Var = this.d;
                br7.v(obj);
                return new wu4(((PublicationStaffData) g15Var).getId(), this.f, EntityType.AUTHOR, bt4Var, cg8Var, ((dda) obj2).n);
            case 1:
                bt4 bt4Var2 = this.c;
                cg8 cg8Var2 = this.d;
                br7.v(obj);
                return new wu4(((PublicationStaffData) g15Var).getId(), this.f, EntityType.AUTHOR, bt4Var2, cg8Var2, ((eoa) obj2).n);
            default:
                bt4 bt4Var3 = this.c;
                cg8 cg8Var3 = this.d;
                br7.v(obj);
                return new wu4(this.f, ((CreatorPreviewData) g15Var).getName(), EntityType.AUTHOR, bt4Var3, cg8Var3, (SourceParameter) obj2);
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ bda(PublicationStaffData publicationStaffData, String str, que queVar, n92 n92Var, int i) {
        super(3, n92Var);
        this.b = i;
        this.e = publicationStaffData;
        this.f = str;
        this.g = queVar;
    }
}
