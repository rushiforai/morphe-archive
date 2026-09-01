package defpackage;

import com.medium.android.graphql.LatestDigestQuery;
import com.medium.android.graphql.fragment.DigestData;
import com.medium.android.graphql.fragment.DigestSectionData;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class z95 extends p4d implements b55 {
    public int b;
    public /* synthetic */ Object c;
    public final /* synthetic */ q95 d;
    public final /* synthetic */ xi1 e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public z95(q95 q95Var, xi1 xi1Var, n92 n92Var) {
        super(2, n92Var);
        this.d = q95Var;
        this.e = xi1Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        z95 z95Var = new z95(this.d, this.e, n92Var);
        z95Var.c = obj;
        return z95Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((z95) create((yd4) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        Object objC;
        LatestDigestQuery.Node node;
        yd4 yd4Var = (yd4) this.c;
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.b;
        if (i == 0) {
            br7.v(obj);
            km4.I(wld.a, null, "Get latest digest", new Object[0], "Get latest digest");
            dd3 dd3Var = this.d.a;
            this.c = null;
            this.b = 1;
            objC = dd3Var.c(yd4Var, this);
            if (objC == tb2Var) {
                return tb2Var;
            }
        } else {
            if (i != 1) {
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            }
            br7.v(obj);
            objC = ((bjb) obj).a;
        }
        if (!(objC instanceof ajb)) {
            LatestDigestQuery.Edge edge = (LatestDigestQuery.Edge) bu1.z0(((LatestDigestQuery.OnDigestsConnection) objC).getEdges());
            DigestData digestData = (edge == null || (node = edge.getNode()) == null) ? null : node.getDigestData();
            if (digestData != null) {
                String id = digestData.getId();
                long createdAt = digestData.getCreatedAt();
                List<DigestData.Section> sections = digestData.getSections();
                ArrayList arrayList = new ArrayList();
                Iterator<T> it2 = sections.iterator();
                while (it2.hasNext()) {
                    DigestSectionData digestSectionData = ((DigestData.Section) it2.next()).getDigestSectionData();
                    sd3 sd3VarA = sd3.Companion.a(digestSectionData.getType());
                    nd3 nd3Var = sd3VarA == null ? null : new nd3(sd3VarA, digestSectionData.getTitle(), od3.a(digestSectionData.getEntries(), this.e));
                    if (nd3Var != null) {
                        arrayList.add(nd3Var);
                    }
                }
                objC = new gc3(id, createdAt, arrayList, null);
            } else {
                objC = new gc3("UNUSED_DIGEST_ID", 0L, ey3.a, new hc3("Digest not found"));
            }
        }
        if (!(objC instanceof ajb)) {
            km4.I(wld.a, null, "Get latest digest successful", new Object[0], "Get latest digest successful");
        }
        Throwable thB = bjb.b(objC);
        if (thB != null) {
            wld.a.e(thB, "Get latest digest failed", new Object[0]);
        }
        return new bjb(objC);
    }
}
