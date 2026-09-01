package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class yqd implements crd {
    public final String a;
    public final int b;

    public yqd(String str, int i) {
        this.a = str;
        this.b = i;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof yqd)) {
            return false;
        }
        yqd yqdVar = (yqd) obj;
        return this.a.equals(yqdVar.a) && this.b == yqdVar.b;
    }

    @Override // defpackage.crd
    public final int getCount() {
        return this.b;
    }

    public final int hashCode() {
        return (this.a.hashCode() * 31) + this.b;
    }

    public final String toString() {
        return ho2.C(this.b, "Default(name=", this.a, ", count=", ")");
    }
}
