package defpackage;

import com.medium.android.graphql.fragment.CatalogPreviewData;
import com.medium.android.graphql.fragment.EntityCatalogsConnectionData;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class r47 extends p4d implements b55 {
    public /* synthetic */ Object b;
    public final /* synthetic */ x47 c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public r47(x47 x47Var, n92 n92Var) {
        super(2, n92Var);
        this.c = x47Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        r47 r47Var = new r47(this.c, n92Var);
        r47Var.b = obj;
        return r47Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((r47) create((sb2) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        EntityCatalogsConnectionData.CatalogsContainingThi catalogsContainingThi;
        List<EntityCatalogsConnectionData.CatalogsContainingThi> catalogsContainingThis;
        Object next;
        sb2 sb2Var = (sb2) this.b;
        br7.v(obj);
        x47 x47Var = this.c;
        List list = (List) x47Var.t.getValue();
        List<CatalogPreviewData> list2 = ey3.a;
        if (list == null) {
            list = list2;
        }
        List list3 = x47Var.r;
        if (list3 != null) {
            list2 = list3;
        }
        ArrayList arrayList = new ArrayList();
        for (CatalogPreviewData catalogPreviewData : list2) {
            EntityCatalogsConnectionData entityCatalogsConnectionData = x47Var.s;
            o33 o33VarG = null;
            if (entityCatalogsConnectionData == null || (catalogsContainingThis = entityCatalogsConnectionData.getCatalogsContainingThis()) == null) {
                catalogsContainingThi = null;
            } else {
                Iterator<T> it2 = catalogsContainingThis.iterator();
                while (true) {
                    if (!it2.hasNext()) {
                        next = null;
                        break;
                    }
                    next = it2.next();
                    if (g76.L(((EntityCatalogsConnectionData.CatalogsContainingThi) next).getCatalogId(), catalogPreviewData.getId())) {
                        break;
                    }
                }
                catalogsContainingThi = (EntityCatalogsConnectionData.CatalogsContainingThi) next;
            }
            if (list.contains(catalogPreviewData.getId()) && catalogsContainingThi == null) {
                o33VarG = vx0.G(sb2Var, null, new p47(x47Var, catalogPreviewData, null, 0), 3);
            } else if (!list.contains(catalogPreviewData.getId()) && catalogsContainingThi != null) {
                o33VarG = vx0.G(sb2Var, null, new q47(x47Var, catalogPreviewData, catalogsContainingThi, null), 3);
            }
            if (o33VarG != null) {
                arrayList.add(o33VarG);
            }
        }
        return arrayList;
    }
}
