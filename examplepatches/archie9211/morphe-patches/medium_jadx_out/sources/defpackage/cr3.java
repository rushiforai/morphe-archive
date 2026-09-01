package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class cr3 implements gr3 {
    public final mq3 a;
    public final String b;

    public cr3(mq3 mq3Var) {
        mq3Var.getClass();
        this.a = mq3Var;
        String str = mq3Var.getPost().id;
        if (str != null) {
            this.b = str;
        } else {
            ay0.e("Required value was null.");
            throw null;
        }
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof cr3) && g76.L(this.a, ((cr3) obj).a);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return "Created(editPostResponse=" + this.a + ")";
    }
}
