package defpackage;

import com.medium.android.core.navigation.NotificationFilterType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class vk8 {
    public final /* synthetic */ ek8 a;
    public final /* synthetic */ nl8 b;

    public vk8(ek8 ek8Var, nl8 nl8Var) {
        this.a = ek8Var;
        this.b = nl8Var;
    }

    public final void a(NotificationFilterType notificationFilterType) {
        notificationFilterType.getClass();
        nl8 nl8Var = this.b;
        if (nl8Var.k.add(notificationFilterType)) {
            vx0.c0(f76.F(nl8Var), null, null, new rc0(nl8Var, notificationFilterType, null, 27), 3);
        }
    }
}
