package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class l05 implements Comparable {
    public final int a;
    public final int b;
    public final String c;
    public final String d;

    public l05(String str, int i, int i2, String str2) {
        str.getClass();
        str2.getClass();
        this.a = i;
        this.b = i2;
        this.c = str;
        this.d = str2;
    }

    @Override // java.lang.Comparable
    public final int compareTo(Object obj) {
        l05 l05Var = (l05) obj;
        l05Var.getClass();
        int i = this.a - l05Var.a;
        return i == 0 ? this.b - l05Var.b : i;
    }
}
