package defpackage;

import java.io.Serializable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class fj8 implements Serializable {
    public final Throwable a;

    public fj8(Throwable th) {
        this.a = th;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof fj8)) {
            return false;
        }
        Object obj2 = ((fj8) obj).a;
        Throwable th = this.a;
        if (th != obj2) {
            return th != null && th.equals(obj2);
        }
        return true;
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return "NotificationLite.Error[" + this.a + "]";
    }
}
