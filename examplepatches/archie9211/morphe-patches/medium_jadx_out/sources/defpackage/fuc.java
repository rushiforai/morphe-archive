package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fuc implements ix {
    public final String a;

    public /* synthetic */ fuc(String str) {
        this.a = str;
    }

    public final boolean equals(Object obj) {
        if (obj instanceof fuc) {
            return this.a.equals(((fuc) obj).a);
        }
        return false;
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return wgd.t(')', "StringAnnotation(value=", this.a);
    }
}
