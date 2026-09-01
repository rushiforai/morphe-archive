package defpackage;

import com.medium.refinerecommendations.following.seeall.tags.AllFollowedTagsFragment;
import gen.model.SourceParameter;
import java.util.LinkedHashSet;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class cf implements e9d {
    public final /* synthetic */ zg7 a;
    public final /* synthetic */ qf b;

    public cf(zg7 zg7Var, qf qfVar) {
        this.a = zg7Var;
        this.b = qfVar;
    }

    @Override // defpackage.e9d
    public final void B(SourceParameter sourceParameter, String str, boolean z) {
        str.getClass();
        sourceParameter.getClass();
        qf qfVar = this.b;
        if (z) {
            vx0.c0(f76.F(qfVar), null, null, new ra((que) qfVar, str, sourceParameter, (n92) null, 5), 3);
        } else {
            vx0.c0(f76.F(qfVar), null, null, new ra((que) qfVar, str, sourceParameter, (n92) null, 6), 3);
        }
    }

    @Override // defpackage.e9d
    public final void p(String str, SourceParameter sourceParameter) {
        String strU = gp7.u(sourceParameter);
        AllFollowedTagsFragment allFollowedTagsFragment = (AllFollowedTagsFragment) this.a.b;
        ((p13) allFollowedTagsFragment.Z()).N(allFollowedTagsFragment.S(), str, strU);
    }

    @Override // defpackage.e9d
    public final void y(String str, SourceParameter sourceParameter) {
        qf qfVar = this.b;
        Set linkedHashSet = (Set) qfVar.c.a("tag_ids_presented");
        if (linkedHashSet == null) {
            linkedHashSet = new LinkedHashSet();
        }
        if (linkedHashSet.add(str)) {
            qfVar.g.g(str, qfVar.b, gp7.u(sourceParameter), qfVar.k);
        }
    }
}
