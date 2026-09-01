package defpackage;

import com.medium.android.graphql.DigestByIdQuery;
import com.medium.android.graphql.fragment.DigestData;
import com.medium.android.graphql.fragment.DigestSectionData;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class p95 extends p4d implements b55 {
    public int b;
    public /* synthetic */ Object c;
    public final /* synthetic */ String d;
    public final /* synthetic */ q95 e;
    public final /* synthetic */ xi1 f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public p95(String str, q95 q95Var, xi1 xi1Var, n92 n92Var) {
        super(2, n92Var);
        this.d = str;
        this.e = q95Var;
        this.f = xi1Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        p95 p95Var = new p95(this.d, this.e, this.f, n92Var);
        p95Var.c = obj;
        return p95Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((p95) create((yd4) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        Object objA;
        gc3 gc3Var;
        yd4 yd4Var = (yd4) this.c;
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.b;
        String str = this.d;
        if (i == 0) {
            String strU = wgd.u(obj, "Get digest with id ", str);
            km4.I(wld.a, null, strU, new Object[0], strU);
            dd3 dd3Var = this.e.a;
            this.c = null;
            this.b = 1;
            objA = dd3Var.a(str, yd4Var, this);
            if (objA == tb2Var) {
                return tb2Var;
            }
        } else {
            if (i != 1) {
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            }
            br7.v(obj);
            objA = ((bjb) obj).a;
        }
        if (!(objA instanceof ajb)) {
            DigestByIdQuery.DigestById digestById = (DigestByIdQuery.DigestById) objA;
            DigestByIdQuery.OnNotFound onNotFound = digestById.getOnNotFound();
            DigestByIdQuery.OnDigest onDigest = digestById.getOnDigest();
            DigestData digestData = onDigest != null ? onDigest.getDigestData() : null;
            ey3 ey3Var = ey3.a;
            if (onNotFound != null) {
                String message = onNotFound.getMessage();
                if (message == null) {
                    message = "";
                }
                gc3Var = new gc3(message, 0L, ey3Var, new hc3(onNotFound.getMessage()));
            } else if (digestData != null) {
                String id = digestData.getId();
                long createdAt = digestData.getCreatedAt();
                List<DigestData.Section> sections = digestData.getSections();
                ArrayList arrayList = new ArrayList();
                Iterator<T> it2 = sections.iterator();
                while (it2.hasNext()) {
                    DigestSectionData digestSectionData = ((DigestData.Section) it2.next()).getDigestSectionData();
                    sd3 sd3VarA = sd3.Companion.a(digestSectionData.getType());
                    nd3 nd3Var = sd3VarA == null ? null : new nd3(sd3VarA, digestSectionData.getTitle(), od3.a(digestSectionData.getEntries(), this.f));
                    if (nd3Var != null) {
                        arrayList.add(nd3Var);
                    }
                }
                objA = new gc3(id, createdAt, arrayList, null);
            } else {
                gc3Var = new gc3(this.d, 0L, ey3Var, new hc3("Digest not found"));
            }
            objA = gc3Var;
        }
        if (!(objA instanceof ajb)) {
            String strX = ev6.x("Get digest with id ", str, " successful");
            km4.I(wld.a, null, strX, new Object[0], strX);
        }
        Throwable thB = bjb.b(objA);
        if (thB != null) {
            wld.a.e(thB, ev6.x("Get digest with id ", str, " failed"), new Object[0]);
        }
        return new bjb(objA);
    }
}
