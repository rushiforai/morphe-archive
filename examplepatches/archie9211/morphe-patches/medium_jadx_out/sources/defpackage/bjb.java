package defpackage;

import java.io.Serializable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class bjb implements Serializable {
    public final Object a;

    public /* synthetic */ bjb(Object obj) {
        this.a = obj;
    }

    public static final /* synthetic */ bjb a(Object obj) {
        return new bjb(obj);
    }

    public static final Throwable b(Object obj) {
        if (obj instanceof ajb) {
            return ((ajb) obj).a;
        }
        return null;
    }

    public static final boolean c(Object obj) {
        return !(obj instanceof ajb);
    }

    public static String d(Object obj) {
        if (obj instanceof ajb) {
            return ((ajb) obj).toString();
        }
        return "Success(" + obj + ')';
    }

    public final boolean equals(Object obj) {
        if (obj instanceof bjb) {
            return g76.L(this.a, ((bjb) obj).a);
        }
        return false;
    }

    public final int hashCode() {
        Object obj = this.a;
        if (obj == null) {
            return 0;
        }
        return obj.hashCode();
    }

    public final String toString() {
        return d(this.a);
    }
}
