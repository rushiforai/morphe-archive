package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class sga {
    public final boolean a;
    public final Integer b;
    public final boolean c;

    public sga(boolean z, Integer num, boolean z2) {
        this.a = z;
        this.b = num;
        this.c = z2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof sga)) {
            return false;
        }
        sga sgaVar = (sga) obj;
        return this.a == sgaVar.a && g76.L(this.b, sgaVar.b) && this.c == sgaVar.c;
    }

    public final int hashCode() {
        int i = (this.a ? 1231 : 1237) * 31;
        Integer num = this.b;
        return ((i + (num == null ? 0 : num.hashCode())) * 31) + (this.c ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("NewsletterConfigurationData(showNewsletter=");
        sb.append(this.a);
        sb.append(", subscribers=");
        sb.append(this.b);
        sb.append(", isChecked=");
        return lv8.t(sb, this.c, ")");
    }
}
