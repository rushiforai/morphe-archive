package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class atb {
    public static final mya d = new mya(new mpb(29), 3, new dsb(1));
    public final uid a;
    public final boolean b;
    public final boolean c;

    public atb(uid uidVar, boolean z, boolean z2) {
        uidVar.getClass();
        this.a = uidVar;
        this.b = z;
        this.c = z2;
    }

    public static atb a(atb atbVar, uid uidVar, boolean z, boolean z2, int i) {
        if ((i & 1) != 0) {
            uidVar = atbVar.a;
        }
        if ((i & 2) != 0) {
            z = atbVar.b;
        }
        if ((i & 4) != 0) {
            z2 = atbVar.c;
        }
        uidVar.getClass();
        return new atb(uidVar, z, z2);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof atb)) {
            return false;
        }
        atb atbVar = (atb) obj;
        return g76.L(this.a, atbVar.a) && this.b == atbVar.b && this.c == atbVar.c;
    }

    public final int hashCode() {
        return (((this.a.hashCode() * 31) + (this.b ? 1231 : 1237)) * 31) + (this.c ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("SearchBarState(search=");
        sb.append(this.a);
        sb.append(", isEnabled=");
        sb.append(this.b);
        sb.append(", isFocused=");
        return lv8.t(sb, this.c, ")");
    }
}
