package defpackage;

import androidx.compose.runtime.tooling.Dp.CspinKvYN;
import com.apollographql.apollo.exception.ApolloException;
import com.medium.android.data.common.RitoException;
import com.medium.android.graphql.CurrentUserDismissableFlagsQuery;
import com.medium.android.graphql.type.UserDismissableFlags;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.CancellationException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class xk2 extends p4d implements b55 {
    public int b;
    public final /* synthetic */ zk2 c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public xk2(zk2 zk2Var, n92 n92Var) {
        super(2, n92Var);
        this.c = zk2Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        return new xk2(this.c, n92Var);
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((xk2) create((do4) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        List list;
        du8 du8Var;
        ApolloException apolloException;
        List list2;
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.b;
        Object ajbVar = null;
        zk2 zk2Var = this.c;
        try {
            if (i == 0) {
                br7.v(obj);
                e00 e00Var = zk2Var.a;
                CurrentUserDismissableFlagsQuery currentUserDismissableFlagsQuery = new CurrentUserDismissableFlagsQuery(zk2Var.m());
                e00Var.getClass();
                uz uzVar = (uz) gr7.i(new uz(e00Var, currentUserDismissableFlagsQuery), yd4.CacheFirst);
                this.b = 1;
                obj = uzVar.b(this);
                if (obj == tb2Var) {
                    return tb2Var;
                }
            } else {
                if (i != 1) {
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
            }
            j00 j00Var = (j00) obj;
            try {
                du8Var = j00Var.c;
                apolloException = j00Var.e;
                list2 = j00Var.d;
            } catch (Throwable th) {
                ajbVar = new ajb(th);
            }
        } catch (CancellationException e) {
            throw e;
        } catch (Exception e2) {
            ajbVar = new ajb(e2);
        }
        if (apolloException != null) {
            throw apolloException;
        }
        if (list2 != null) {
            throw new RitoException(bu1.F0(list2, null, null, null, a00.b, 31));
        }
        if (du8Var == null) {
            throw new RitoException(CspinKvYN.yZa);
        }
        CurrentUserDismissableFlagsQuery.User user = ((CurrentUserDismissableFlagsQuery.Data) du8Var).getUser();
        if (user != null) {
            ajbVar = user.getDismissableFlags();
        }
        if (!(ajbVar instanceof ajb) && (list = (List) ajbVar) != null) {
            vr7 vr7Var = zk2Var.c;
            ArrayList arrayList = new ArrayList(cu1.k0(list, 10));
            Iterator it2 = list.iterator();
            while (it2.hasNext()) {
                arrayList.add(((UserDismissableFlags) it2.next()).name());
            }
            vr7Var.Q(bu1.q1(arrayList));
        }
        return c1e.a;
    }
}
