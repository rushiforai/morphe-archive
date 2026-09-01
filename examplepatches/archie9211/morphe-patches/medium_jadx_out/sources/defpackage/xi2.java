package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class xi2 {
    public final int a;
    public final int b;
    public final int c;
    public final int d;

    public xi2(String str) {
        String[] strArrSplit = str.split("\\.");
        this.a = Integer.parseInt(strArrSplit[0]);
        this.b = Integer.parseInt(strArrSplit[1]);
        this.c = Integer.parseInt(strArrSplit[2]);
        this.d = Integer.parseInt(strArrSplit[3]);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(this.a);
        sb.append(".");
        sb.append(this.b);
        sb.append(".");
        sb.append(this.c);
        return b09.A(sb, this.d, ".");
    }
}
