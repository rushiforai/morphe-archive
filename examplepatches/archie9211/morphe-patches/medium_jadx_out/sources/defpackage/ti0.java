package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ti0 {
    public String a;
    public int b;
    public int c;
    public boolean d;
    public byte e;

    public final ui0 a() {
        String str;
        if (this.e == 7 && (str = this.a) != null) {
            return new ui0(str, this.b, this.c, this.d);
        }
        StringBuilder sb = new StringBuilder();
        if (this.a == null) {
            sb.append(" processName");
        }
        if ((this.e & 1) == 0) {
            sb.append(" pid");
        }
        if ((this.e & 2) == 0) {
            sb.append(" importance");
        }
        if ((this.e & 4) == 0) {
            sb.append(" defaultProcess");
        }
        ygf.f(ka1.u("Missing required properties:", sb));
        return null;
    }
}
