package defpackage;

import com.medium.android.graphql.PublicationNewsletterQuery;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class oka extends p4d implements d55 {
    public /* synthetic */ Object b;
    public /* synthetic */ cg8 c;
    public /* synthetic */ qz8 d;
    public final /* synthetic */ pka e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public oka(pka pkaVar, n92 n92Var) {
        super(4, n92Var);
        this.e = pkaVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        Object obj2 = this.b;
        cg8 cg8Var = this.c;
        qz8 qz8Var = this.d;
        br7.v(obj);
        pka pkaVar = this.e;
        String str = pkaVar.b;
        Throwable thB = bjb.b(obj2);
        if (thB != null) {
            return new hka(m4.I(thB));
        }
        PublicationNewsletterQuery.Data data = (PublicationNewsletterQuery.Data) obj2;
        PublicationNewsletterQuery.Publication publication = data.getPublication();
        if (publication == null) {
            wld.a.c(ev6.x("Publication with id ", str, " not found"), new Object[0]);
            return new hka(new w14(null, true));
        }
        PublicationNewsletterQuery.Newsletter newsletter = publication.getNewsletter();
        if (newsletter == null) {
            wld.a.c(ev6.x("Newsletter of publication ", str, " not found"), new Object[0]);
            return new hka(new w14(null, true));
        }
        PublicationNewsletterQuery.User user = data.getUser();
        String email = user != null ? user.getEmail() : null;
        if (qz8Var instanceof nz8) {
            return new hka(m4.I(((nz8) qz8Var).a));
        }
        if (!(qz8Var instanceof oz8)) {
            if (g76.L(qz8Var, pz8.a)) {
                return ika.a;
            }
            ygf.a();
            return null;
        }
        String name = publication.getName();
        if8 if8Var = new if8(pkaVar.b, publication.getName(), newsletter.getId(), newsletter.getName(), newsletter.getDescription(), new u50(7, cg8Var), email, pkaVar.p);
        oz8 oz8Var = (oz8) qz8Var;
        List list = oz8Var.a;
        HashSet hashSet = new HashSet();
        ArrayList arrayList = new ArrayList();
        for (Object obj3 : list) {
            if (hashSet.add(((dr9) obj3).a)) {
                arrayList.add(obj3);
            }
        }
        return new gka(name, if8Var, bo.f0(arrayList), oz8Var.c);
    }

    @Override // defpackage.d55
    public final Object k(Object obj, Object obj2, Object obj3, Object obj4) {
        Object obj5 = ((bjb) obj).a;
        oka okaVar = new oka(this.e, (n92) obj4);
        okaVar.b = obj5;
        okaVar.c = (cg8) obj2;
        okaVar.d = (qz8) obj3;
        return okaVar.invokeSuspend(c1e.a);
    }
}
