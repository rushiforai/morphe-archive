package defpackage;

import com.medium.android.core.models.CurrentUserEntity;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class l95 {
    public final zk2 a;

    public l95(zk2 zk2Var) {
        zk2Var.getClass();
        this.a = zk2Var;
    }

    public final rj2 a() {
        CurrentUserEntity currentUserEntity = (CurrentUserEntity) ((vpc) this.a.f.getValue()).getValue();
        if (currentUserEntity != null) {
            return m40.X(currentUserEntity);
        }
        return null;
    }
}
