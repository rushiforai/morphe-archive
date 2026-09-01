package defpackage;

import j$.util.Objects;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ujg extends ydg {
    public final int a;
    public final int b;
    public final sjg c;
    public final tjg d;

    public ujg(int i, int i2, sjg sjgVar, tjg tjgVar) {
        this.a = i;
        this.b = i2;
        this.c = sjgVar;
        this.d = tjgVar;
    }

    public static rjg b() {
        rjg rjgVar = new rjg();
        rjgVar.a = null;
        rjgVar.b = null;
        rjgVar.c = null;
        rjgVar.d = sjg.e;
        return rjgVar;
    }

    @Override // defpackage.bzf
    public final boolean a() {
        return this.c != sjg.e;
    }

    public final int c() {
        sjg sjgVar = sjg.e;
        int i = this.b;
        sjg sjgVar2 = this.c;
        if (sjgVar2 == sjgVar) {
            return i;
        }
        if (sjgVar2 == sjg.b) {
            return i + 5;
        }
        if (sjgVar2 == sjg.c) {
            return i + 5;
        }
        if (sjgVar2 == sjg.d) {
            return i + 5;
        }
        ygf.f("Unknown variant");
        return 0;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof ujg)) {
            return false;
        }
        ujg ujgVar = (ujg) obj;
        return ujgVar.a == this.a && ujgVar.c() == c() && ujgVar.c == this.c && ujgVar.d == this.d;
    }

    public final int hashCode() {
        return Objects.hash(ujg.class, Integer.valueOf(this.a), Integer.valueOf(this.b), this.c, this.d);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("HMAC Parameters (variant: ", String.valueOf(this.c), ", hashType: ", String.valueOf(this.d), ", ");
        sbU.append(this.b);
        sbU.append("-byte tags, and ");
        sbU.append(this.a);
        sbU.append("-byte key)");
        return sbU.toString();
    }
}
