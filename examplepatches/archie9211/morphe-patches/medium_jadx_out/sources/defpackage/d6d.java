package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class d6d {
    public final int a;
    public final int b;
    public final boolean c;

    public d6d(int i, int i2, boolean z) {
        this.a = i;
        this.b = i2;
        this.c = z;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof d6d)) {
            return false;
        }
        d6d d6dVar = (d6d) obj;
        return this.a == d6dVar.a && this.b == d6dVar.b && this.c == d6dVar.c;
    }

    public final int hashCode() {
        return (((this.a * 31) + this.b) * 31) + (this.c ? 1231 : 1237);
    }

    public final String toString() {
        return lv8.t(ev6.B(this.a, this.b, "Highlight(startOffset=", ", endOffset=", ", isMine="), this.c, ")");
    }
}
