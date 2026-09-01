package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ac7 {
    public final Integer a;
    public final Integer b;
    public final Integer c;

    public ac7(Integer num, Integer num2) {
        this.a = num;
        this.b = num2;
        this.c = num2;
    }

    public final float a(bc7 bc7Var) {
        bc7Var.getClass();
        if (this.c == null) {
            return 1.0f;
        }
        return iq7.u(r1.intValue() / bc7Var.m, 0.0f, 1.0f);
    }

    public final float b(bc7 bc7Var) {
        bc7Var.getClass();
        return iq7.u(this.a.intValue() / bc7Var.m, 0.0f, 1.0f);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ac7)) {
            return false;
        }
        ac7 ac7Var = (ac7) obj;
        return this.a.equals(ac7Var.a) && this.b.equals(ac7Var.b);
    }

    public final int hashCode() {
        return ((this.b.hashCode() + (this.a.hashCode() * 31)) * 31) + 1231;
    }

    public final String toString() {
        return "Frame(min=" + this.a + ", max=" + this.b + ", maxInclusive=true)";
    }
}
