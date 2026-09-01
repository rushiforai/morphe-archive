package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class jh8 {
    public final o78 a = new o78(new yg8[16]);
    public final x68 b = new x68(10);

    public boolean a(ab7 ab7Var, hp6 hp6Var, o72 o72Var, boolean z) {
        o78 o78Var = this.a;
        Object[] objArr = o78Var.a;
        int i = o78Var.c;
        boolean z2 = false;
        for (int i2 = 0; i2 < i; i2++) {
            z2 = ((yg8) objArr[i2]).a(ab7Var, hp6Var, o72Var, z) || z2;
        }
        return z2;
    }

    public void b(o72 o72Var) {
        o78 o78Var = this.a;
        int i = o78Var.c;
        while (true) {
            i--;
            if (-1 >= i) {
                return;
            }
            if (((yg8) o78Var.a[i]).d.b == 0) {
                o78Var.m(i);
            }
        }
    }
}
