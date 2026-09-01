package defpackage;

import com.medium.android.core.navigation.NotificationFilterType;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class gl8 {
    public final NotificationFilterType a;
    public final Map b;

    public gl8(NotificationFilterType notificationFilterType, Map map) {
        notificationFilterType.getClass();
        map.getClass();
        this.a = notificationFilterType;
        this.b = map;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof gl8)) {
            return false;
        }
        gl8 gl8Var = (gl8) obj;
        return this.a == gl8Var.a && g76.L(this.b, gl8Var.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return "ViewState(selectedFilter=" + this.a + ", notificationsStatesByFilter=" + this.b + ")";
    }
}
