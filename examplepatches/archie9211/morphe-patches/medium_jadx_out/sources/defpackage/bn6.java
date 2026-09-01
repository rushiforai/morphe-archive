package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class bn6 {
    public final String a;
    public final jb6 b;
    public final xi6 c;
    public final ri6 d;
    public final int e;

    public bn6(String str, jb6 jb6Var, xi6 xi6Var, ri6 ri6Var, int i) {
        str.getClass();
        this.a = str;
        this.b = jb6Var;
        this.c = xi6Var;
        this.d = ri6Var;
        this.e = i;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof bn6)) {
            return false;
        }
        bn6 bn6Var = (bn6) obj;
        return g76.L(this.a, bn6Var.a) && this.b.equals(bn6Var.b) && this.c.equals(bn6Var.c) && g76.L(this.d, bn6Var.d) && this.e == bn6Var.e;
    }

    public final int hashCode() {
        int iHashCode = (this.c.hashCode() + ((this.b.hashCode() + (this.a.hashCode() * 31)) * 31)) * 31;
        ri6 ri6Var = this.d;
        return ((iHashCode + (ri6Var == null ? 0 : ri6Var.hashCode())) * 31) + this.e;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("Binding(jsonName=");
        sb.append(this.a);
        sb.append(", adapter=");
        sb.append(this.b);
        sb.append(", property=");
        sb.append(this.c);
        sb.append(", parameter=");
        sb.append(this.d);
        sb.append(", propertyIndex=");
        return km4.A(sb, this.e, ')');
    }
}
