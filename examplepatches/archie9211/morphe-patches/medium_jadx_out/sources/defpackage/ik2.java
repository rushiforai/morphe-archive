package defpackage;

import com.medium.android.graphql.type.UserDismissableFlags;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ik2 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public final /* synthetic */ zk2 c;
    public final /* synthetic */ List d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ ik2(zk2 zk2Var, List list, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.c = zk2Var;
        this.d = list;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        List list = this.d;
        zk2 zk2Var = this.c;
        switch (i) {
            case 0:
                return new ik2(zk2Var, list, n92Var, 0);
            default:
                return new ik2(zk2Var, list, n92Var, 1);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        sb2 sb2Var = (sb2) obj;
        n92 n92Var = (n92) obj2;
        switch (i) {
            case 0:
                ((ik2) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
                break;
            default:
                ((ik2) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
                break;
        }
        return c1eVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        List list = this.d;
        zk2 zk2Var = this.c;
        switch (i) {
            case 0:
                br7.v(obj);
                vr7 vr7Var = zk2Var.c;
                ArrayList arrayList = new ArrayList(cu1.k0(list, 10));
                Iterator it2 = list.iterator();
                while (it2.hasNext()) {
                    arrayList.add(((UserDismissableFlags) it2.next()).name());
                }
                vr7Var.Q(bu1.q1(arrayList));
                break;
            default:
                br7.v(obj);
                vr7 vr7Var2 = zk2Var.c;
                ArrayList arrayList2 = new ArrayList(cu1.k0(list, 10));
                Iterator it3 = list.iterator();
                while (it3.hasNext()) {
                    arrayList2.add(((UserDismissableFlags) it3.next()).name());
                }
                vr7Var2.Q(bu1.q1(arrayList2));
                break;
        }
        return c1eVar;
    }
}
