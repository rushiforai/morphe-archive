package defpackage;

import com.medium.android.core.models.CurrentUserEntity;
import com.medium.android.graphql.UserIsBlockedQuery;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class u0f {
    public final zk2 a;
    public final ble b;

    public u0f(zk2 zk2Var, ble bleVar) {
        zk2Var.getClass();
        this.a = zk2Var;
        this.b = bleVar;
    }

    public final bo4 a(String str) {
        bo4 mxeVar;
        str.getClass();
        CurrentUserEntity currentUserEntity = (CurrentUserEntity) ((vpc) this.a.f.getValue()).getValue();
        if (str.equals(currentUserEntity != null ? currentUserEntity.getId() : null)) {
            mxeVar = new u50(7, new os0(currentUserEntity.getName(), ns0.CANT_BLOCK));
        } else {
            e00 e00Var = this.b.a;
            UserIsBlockedQuery userIsBlockedQuery = new UserIsBlockedQuery(str);
            e00Var.getClass();
            uz uzVar = new uz(e00Var, userIsBlockedQuery);
            yd4 yd4Var = yd4.CacheFirst;
            mxeVar = new mxe(new zz(new xz(gr7.F((uz) gr7.x((h68) gr7.i(uzVar, yd4Var), yd4.CacheOnly)), yd4Var, 18), 0), str, 3);
        }
        return m40.J(mxeVar);
    }
}
