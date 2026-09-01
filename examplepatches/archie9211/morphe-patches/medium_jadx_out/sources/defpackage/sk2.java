package defpackage;

import com.medium.android.graphql.type.UserDismissableFlags;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class sk2 extends p4d implements b55 {
    public final /* synthetic */ zk2 b;
    public final /* synthetic */ Throwable c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public sk2(zk2 zk2Var, Throwable th, n92 n92Var) {
        super(2, n92Var);
        this.b = zk2Var;
        this.c = th;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        return new sk2(this.b, this.c, n92Var);
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((sk2) create((sb2) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) throws Throwable {
        br7.v(obj);
        vr7 vr7Var = this.b.c;
        vr7Var.getClass();
        Set<String> setM = vr7Var.m(ek6.CURRENT_USER_DISMISSABLE_FLAGS);
        if (setM == null) {
            throw this.c;
        }
        ArrayList arrayList = new ArrayList();
        Iterator<T> it2 = setM.iterator();
        while (it2.hasNext()) {
            UserDismissableFlags userDismissableFlagsSafeValueOf = UserDismissableFlags.INSTANCE.safeValueOf((String) it2.next());
            if (userDismissableFlagsSafeValueOf == UserDismissableFlags.UNKNOWN__) {
                userDismissableFlagsSafeValueOf = null;
            }
            if (userDismissableFlagsSafeValueOf != null) {
                arrayList.add(userDismissableFlagsSafeValueOf);
            }
        }
        return arrayList;
    }
}
