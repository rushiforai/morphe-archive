package sd;

/* loaded from: classes.dex */
public final class u extends g0 {

    /* renamed from: a, reason: collision with root package name */
    public final Integer f87215a;

    public u(Integer num) {
        this.f87215a = num;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof g0)) {
            return false;
        }
        Integer num = this.f87215a;
        u uVar = (u) ((g0) obj);
        return num == null ? uVar.f87215a == null : num.equals(uVar.f87215a);
    }

    public final int hashCode() {
        Integer num = this.f87215a;
        return (num == null ? 0 : num.hashCode()) ^ 1000003;
    }

    public final String toString() {
        return "ExternalPRequestContext{originAssociatedProductId=" + this.f87215a + "}";
    }
}
