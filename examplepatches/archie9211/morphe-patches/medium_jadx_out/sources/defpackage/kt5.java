package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class kt5 {
    public String a;
    public int b;

    public char a() {
        int i = this.b;
        String str = this.a;
        if (i < str.length()) {
            return str.charAt(this.b);
        }
        return (char) 0;
    }

    public char b(int i) {
        String str = this.a;
        if (i < str.length()) {
            return str.charAt(i);
        }
        return (char) 0;
    }

    public int c(int i, String str) {
        char cB = b(this.b);
        int i2 = 0;
        boolean z = false;
        while ('0' <= cB && cB <= '9') {
            i2 = (i2 * 10) + (cB - '0');
            z = true;
            int i3 = this.b + 1;
            this.b = i3;
            cB = b(i3);
        }
        if (!z) {
            ywb.e(5, str);
            return 0;
        }
        if (i2 > i) {
            return i;
        }
        if (i2 < 0) {
            return 0;
        }
        return i2;
    }

    public boolean d() {
        return this.b < this.a.length();
    }

    public void e() {
        this.b++;
    }
}
