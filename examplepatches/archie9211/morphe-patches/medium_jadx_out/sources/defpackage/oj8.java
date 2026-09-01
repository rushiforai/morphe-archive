package defpackage;

import com.medium.android.data.settings.NotificationNetwork;
import sprig.b.VPIE.dpBiLjNeNsiASg;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class oj8 implements pj8 {
    public final String a;
    public final int b;
    public final NotificationNetwork c;

    public oj8(String str, int i, NotificationNetwork notificationNetwork) {
        notificationNetwork.getClass();
        this.a = str;
        this.b = i;
        this.c = notificationNetwork;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof oj8)) {
            return false;
        }
        oj8 oj8Var = (oj8) obj;
        return this.a.equals(oj8Var.a) && this.b == oj8Var.b && this.c == oj8Var.c;
    }

    @Override // defpackage.pj8
    public final String getName() {
        return this.a;
    }

    public final int hashCode() {
        return this.c.hashCode() + (((this.a.hashCode() * 31) + this.b) * 31);
    }

    public final String toString() {
        StringBuilder sbT = y30.t(this.b, "Network(name=", this.a, ", labelResId=", ", value=");
        sbT.append(this.c);
        sbT.append(dpBiLjNeNsiASg.xXXSgBHhtlldg);
        return sbT.toString();
    }
}
