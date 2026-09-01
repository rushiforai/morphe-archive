package defpackage;

import j$.util.Objects;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gjg extends ydg {
    public final int a;
    public final int b;
    public final zwf c;

    public gjg(int i, int i2, zwf zwfVar) {
        this.a = i;
        this.b = i2;
        this.c = zwfVar;
    }

    public static tag b() {
        tag tagVar = new tag();
        tagVar.c = null;
        tagVar.a = null;
        tagVar.b = zwf.o;
        return tagVar;
    }

    @Override // defpackage.bzf
    public final boolean a() {
        return this.c != zwf.o;
    }

    public final int c() {
        zwf zwfVar = zwf.o;
        int i = this.b;
        zwf zwfVar2 = this.c;
        if (zwfVar2 == zwfVar) {
            return i;
        }
        if (zwfVar2 == zwf.l) {
            return i + 5;
        }
        if (zwfVar2 == zwf.m) {
            return i + 5;
        }
        if (zwfVar2 == zwf.n) {
            return i + 5;
        }
        ygf.f("Unknown variant");
        return 0;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof gjg)) {
            return false;
        }
        gjg gjgVar = (gjg) obj;
        return gjgVar.a == this.a && gjgVar.c() == c() && gjgVar.c == this.c;
    }

    public final int hashCode() {
        return Objects.hash(gjg.class, Integer.valueOf(this.a), Integer.valueOf(this.b), this.c);
    }

    public final String toString() {
        return ho2.H(y30.t(this.b, "AES-CMAC Parameters (variant: ", String.valueOf(this.c), ", ", "-byte tags, and "), this.a, "-byte key)");
    }
}
