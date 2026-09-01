package defpackage;

import android.app.PendingIntent;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ukf extends xjb {
    public final PendingIntent a;
    public final boolean b;

    public ukf(PendingIntent pendingIntent, boolean z) {
        if (pendingIntent == null) {
            z72.c("Null pendingIntent");
            throw null;
        }
        this.a = pendingIntent;
        this.b = z;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof xjb) {
            ukf ukfVar = (ukf) ((xjb) obj);
            if (this.a.equals(ukfVar.a) && this.b == ukfVar.b) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return (true != this.b ? 1237 : 1231) ^ ((this.a.hashCode() ^ 1000003) * 1000003);
    }

    public final String toString() {
        return lv8.t(lv8.u("ReviewInfo{pendingIntent=", this.a.toString(), ", isNoOp="), this.b, "}");
    }
}
