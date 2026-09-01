package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class uc6 extends dc6 {
    public final b17 a;

    public uc6() {
        js4 js4Var = b17.i;
        this.a = new b17(false);
    }

    public final boolean equals(Object obj) {
        if (obj != this) {
            return (obj instanceof uc6) && ((uc6) obj).a.equals(this.a);
        }
        return true;
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final void p(String str, dc6 dc6Var) {
        if (dc6Var == null) {
            dc6Var = pc6.a;
        }
        this.a.put(str, dc6Var);
    }

    public final void q(Number number, String str) {
        p(str, number == null ? pc6.a : new zc6(number));
    }

    public final void r(String str, String str2) {
        p(str, str2 == null ? pc6.a : new zc6(str2));
    }

    public final dc6 s(String str) {
        return (dc6) this.a.get(str);
    }
}
