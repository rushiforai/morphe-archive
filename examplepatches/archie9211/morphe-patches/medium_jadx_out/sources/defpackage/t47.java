package defpackage;

import com.medium.android.graphql.fragment.CatalogPreviewData;
import com.medium.android.graphql.fragment.EntityCatalogsConnectionData;
import com.medium.android.graphql.type.PredefinedCatalogType;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class t47 extends p4d implements b55 {
    public /* synthetic */ Object b;
    public final /* synthetic */ x47 c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public t47(x47 x47Var, n92 n92Var) {
        super(2, n92Var);
        this.c = x47Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        t47 t47Var = new t47(this.c, n92Var);
        t47Var.b = obj;
        return t47Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((t47) create((sb2) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        EntityCatalogsConnectionData.PredefinedContainingThi predefinedContainingThi;
        Object next;
        sb2 sb2Var = (sb2) this.b;
        br7.v(obj);
        x47 x47Var = this.c;
        CatalogPreviewData catalogPreviewData = x47Var.p;
        EntityCatalogsConnectionData entityCatalogsConnectionData = x47Var.s;
        o33 o33VarG = null;
        if (entityCatalogsConnectionData != null) {
            Iterator<T> it2 = entityCatalogsConnectionData.getPredefinedContainingThis().iterator();
            while (true) {
                if (!it2.hasNext()) {
                    next = null;
                    break;
                }
                next = it2.next();
                if (((EntityCatalogsConnectionData.PredefinedContainingThi) next).getPredefined() == PredefinedCatalogType.READING_LIST) {
                    break;
                }
            }
            predefinedContainingThi = (EntityCatalogsConnectionData.PredefinedContainingThi) next;
        } else {
            predefinedContainingThi = null;
        }
        List list = (List) x47Var.t.getValue();
        if (list == null) {
            list = ey3.a;
        }
        if (catalogPreviewData != null) {
            if (list.contains(catalogPreviewData.getId()) && predefinedContainingThi == null) {
                o33VarG = vx0.G(sb2Var, null, new p47(x47Var, catalogPreviewData, null, 1), 3);
            } else if (!list.contains(catalogPreviewData.getId()) && predefinedContainingThi != null) {
                o33VarG = vx0.G(sb2Var, null, new s47(x47Var, catalogPreviewData, predefinedContainingThi, null), 3);
            }
        }
        return d46.S(o33VarG);
    }
}
