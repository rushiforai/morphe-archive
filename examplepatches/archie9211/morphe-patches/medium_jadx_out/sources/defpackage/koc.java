package defpackage;

import com.medium.proto.event.OnboardingStarterPackEntitySkipped;
import gen.model.EntityClientPresentedType;
import gen.model.SourceParameter;
import java.util.Iterator;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class koc {
    public final /* synthetic */ eoc a;
    public final /* synthetic */ uoc b;

    public koc(eoc eocVar, uoc uocVar) {
        this.a = eocVar;
        this.b = uocVar;
    }

    public final void a(String str, SourceParameter sourceParameter) {
        str.getClass();
        uoc uocVar = this.b;
        vx0.c0(f76.F(uocVar), null, null, new soc(uocVar, str, sourceParameter, null, 0), 3);
    }

    public final void b(String str, SourceParameter sourceParameter) {
        str.getClass();
        uoc uocVar = this.b;
        vx0.c0(f76.F(uocVar), null, null, new soc(uocVar, str, sourceParameter, null, 1), 3);
    }

    public final void c(String str) {
        EntityClientPresentedType entityClientPresentedType;
        str.getClass();
        uoc uocVar = this.b;
        Object value = uocVar.y.a.getValue();
        Object obj = null;
        noc nocVar = value instanceof noc ? (noc) value : null;
        if (nocVar != null) {
            Iterator it2 = nocVar.b.iterator();
            while (true) {
                if (!it2.hasNext()) {
                    break;
                }
                Object next = it2.next();
                if (g76.L(((boc) next).getId(), str)) {
                    obj = next;
                    break;
                }
            }
            boc bocVar = (boc) obj;
            if (bocVar != null) {
                if (bocVar instanceof hae) {
                    entityClientPresentedType = EntityClientPresentedType.ENTITY_CLIENT_PRESENTED_TYPE_AUTHOR_ENTITY;
                } else if (bocVar instanceof nca) {
                    entityClientPresentedType = EntityClientPresentedType.ENTITY_CLIENT_PRESENTED_TYPE_COLLECTION_ENTITY;
                }
                EntityClientPresentedType entityClientPresentedType2 = entityClientPresentedType;
                ax2 ax2Var = uocVar.k;
                String str2 = uocVar.b;
                String str3 = uocVar.c;
                String strU = gp7.u(bocVar.a());
                String str4 = uocVar.n;
                ax2Var.getClass();
                str2.getClass();
                entityClientPresentedType2.getClass();
                str3.getClass();
                str4.getClass();
                rqd.a(ax2Var.b, new OnboardingStarterPackEntitySkipped(null, str2, str, entityClientPresentedType2, null, 17, null), str3, strU, false, null, str4, 24);
            }
        }
        uocVar.m.d("dismissed_entity_ids", qo7.w((Set) uocVar.q.a.getValue(), str));
    }
}
