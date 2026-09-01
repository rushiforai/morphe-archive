package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class o4g implements Comparable {
    public int a;
    public long b;
    public long c;

    @Override // java.lang.Comparable
    public final int compareTo(Object obj) {
        return pwd.D(Long.valueOf(this.b), Long.valueOf(((o4g) obj).b));
    }

    public final String toString() {
        String strG0 = muc.g0(10, String.valueOf(this.b / ((long) this.a)));
        String strG02 = muc.g0(10, String.valueOf(this.c));
        String strG03 = muc.g0(10, String.valueOf(this.b));
        String strG04 = muc.g0(5, String.valueOf(this.a));
        int length = String.valueOf(strG0).length();
        int length2 = String.valueOf(strG02).length();
        StringBuilder sb = new StringBuilder(length + 41 + length2 + 16 + String.valueOf(strG03).length() + 14 + String.valueOf(strG04).length());
        ka1.C(sb, "avgExecutionTime: ", strG0, " us| maxExecutionTime: ", strG02);
        return km4.C(sb, " us| totalTime: ", strG03, " us| #Usages: ", strG04);
    }
}
