package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class g82 {
    public final sy0 a;
    public final x51 b;

    public g82(sy0 sy0Var, x51 x51Var) {
        this.a = sy0Var;
        this.b = x51Var;
    }

    public final String toString() {
        x51 x51Var = this.b;
        String str = ((nb2) x51Var.e.o0(nb2.b)) != null ? "Room Invalidation Tracker Refresh" : null;
        StringBuilder sb = new StringBuilder("Request@");
        int iHashCode = hashCode();
        kyd.I(16);
        String string = Integer.toString(iHashCode, 16);
        string.getClass();
        sb.append(string);
        sb.append(str != null ? ev6.x("[", str, "](") : "(");
        sb.append("currentBounds()=");
        sb.append(this.a.invoke());
        sb.append(", continuation=");
        sb.append(x51Var);
        sb.append(')');
        return sb.toString();
    }
}
