package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class t2c implements v2c {
    public final x2c a;

    public t2c(x2c x2cVar) {
        x2cVar.getClass();
        this.a = x2cVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof t2c) && this.a == ((t2c) obj).a;
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return "SocialDisconnectConfirmation(socialNetwork=" + this.a + ")";
    }
}
