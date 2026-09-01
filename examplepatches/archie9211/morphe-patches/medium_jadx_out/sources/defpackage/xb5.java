package defpackage;

import com.medium.android.graphql.GetRootTagsQuery;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class xb5 extends p4d implements b55 {
    public int b;
    public /* synthetic */ Object c;
    public final /* synthetic */ yb5 d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public xb5(yb5 yb5Var, n92 n92Var) {
        super(2, n92Var);
        this.d = yb5Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        xb5 xb5Var = new xb5(this.d, n92Var);
        xb5Var.c = obj;
        return xb5Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((xb5) create((yd4) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        Object objD;
        yd4 yd4Var = (yd4) this.c;
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.b;
        if (i == 0) {
            br7.v(obj);
            yad yadVar = this.d.a;
            this.c = null;
            this.b = 1;
            objD = yadVar.d(yd4Var, this);
            if (objD == tb2Var) {
                return tb2Var;
            }
        } else {
            if (i != 1) {
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            }
            br7.v(obj);
            objD = ((bjb) obj).a;
        }
        if (!(objD instanceof ajb)) {
            List<GetRootTagsQuery.RootTag> rootTags = ((GetRootTagsQuery.Data) objD).getRootTags();
            ArrayList arrayList = new ArrayList(cu1.k0(rootTags, 10));
            for (GetRootTagsQuery.RootTag rootTag : rootTags) {
                w7d w7dVarA = f9d.a(rootTag.getTagData());
                List<GetRootTagsQuery.ChildTag> childTags = rootTag.getChildTags();
                ArrayList arrayList2 = new ArrayList(cu1.k0(childTags, 10));
                for (GetRootTagsQuery.ChildTag childTag : childTags) {
                    w7d w7dVarA2 = f9d.a(childTag.getTagData());
                    List<GetRootTagsQuery.ChildTag1> childTags2 = childTag.getChildTags();
                    ArrayList arrayList3 = new ArrayList(cu1.k0(childTags2, 10));
                    Iterator<T> it2 = childTags2.iterator();
                    while (it2.hasNext()) {
                        arrayList3.add(new wbd(f9d.a(((GetRootTagsQuery.ChildTag1) it2.next()).getTagData()), 2, ey3.a));
                    }
                    arrayList2.add(new wbd(w7dVarA2, 1, arrayList3));
                }
                arrayList.add(new wbd(w7dVarA, 1, arrayList2));
            }
            objD = arrayList;
        }
        return new bjb(objD);
    }
}
