package defpackage;

import com.medium.android.graphql.TagParentsQuery;
import com.medium.android.graphql.fragment.TagData;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class oc5 extends p4d implements b55 {
    public int b;
    public /* synthetic */ Object c;
    public final /* synthetic */ hx4 d;
    public final /* synthetic */ String e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public oc5(n92 n92Var, hx4 hx4Var, String str) {
        super(2, n92Var);
        this.d = hx4Var;
        this.e = str;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        oc5 oc5Var = new oc5(n92Var, this.d, this.e);
        oc5Var.c = obj;
        return oc5Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((oc5) create((yd4) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        Object objH;
        TagParentsQuery.ParentTag1 parentTag;
        TagData tagData;
        TagData tagData2;
        yd4 yd4Var = (yd4) this.c;
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.b;
        w7d w7dVarA = null;
        if (i == 0) {
            br7.v(obj);
            yad yadVar = (yad) this.d.b;
            this.c = null;
            this.b = 1;
            objH = yadVar.h(this.e, yd4Var, this);
            if (objH == tb2Var) {
                return tb2Var;
            }
        } else {
            if (i != 1) {
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            }
            br7.v(obj);
            objH = ((bjb) obj).a;
        }
        if (!(objH instanceof ajb)) {
            TagParentsQuery.TagFromSlug tagFromSlug = (TagParentsQuery.TagFromSlug) objH;
            TagParentsQuery.ParentTag parentTag2 = tagFromSlug.getParentTag();
            w7d w7dVarA2 = (parentTag2 == null || (tagData2 = parentTag2.getTagData()) == null) ? null : f9d.a(tagData2);
            TagParentsQuery.ParentTag parentTag3 = tagFromSlug.getParentTag();
            if (parentTag3 != null && (parentTag = parentTag3.getParentTag()) != null && (tagData = parentTag.getTagData()) != null) {
                w7dVarA = f9d.a(tagData);
            }
            objH = k80.s0(new w7d[]{w7dVarA2, w7dVarA});
        }
        return new bjb(objH);
    }
}
