package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jm2 {
    public String a;
    public int b;
    public int c;
    public float d;

    public static String a(int i) {
        return "#".concat(("00000000" + Integer.toHexString(i)).substring(r2.length() - 8));
    }

    public final String toString() {
        String strZ = ev6.z(new StringBuilder(), this.a, ':');
        switch (this.b) {
            case 900:
                return strZ + this.c;
            case 901:
                return strZ + this.d;
            case 902:
                return strZ.concat(a(this.c));
            case 903:
                return strZ.concat("null");
            default:
                return strZ.concat("????");
        }
    }
}
