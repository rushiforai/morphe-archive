package defpackage;

import com.medium.android.core.push.MediumPushNotification;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ic {
    public final String a;
    public final MediumPushNotification b;

    public ic(String str, MediumPushNotification mediumPushNotification) {
        this.a = str;
        this.b = mediumPushNotification;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ic)) {
            return false;
        }
        ic icVar = (ic) obj;
        return this.a.equals(icVar.a) && this.b.equals(icVar.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return "PushNotificationItem(name=" + this.a + ", pushNotification=" + this.b + ")";
    }
}
