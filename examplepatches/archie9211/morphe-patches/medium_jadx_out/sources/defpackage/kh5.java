package defpackage;

import java.io.IOException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class kh5 extends jud {
    @Override // defpackage.jud
    public final Object b(gd6 gd6Var) {
        dc6 dc6VarK = vn7.K(gd6Var);
        dc6VarK.getClass();
        return ((dc6VarK instanceof pc6) || !(dc6VarK instanceof zc6)) ? "" : ((zc6) dc6VarK).m();
    }

    @Override // defpackage.jud
    public final void c(yd6 yd6Var, Object obj) throws IOException {
        String str = (String) obj;
        if (str == null) {
            zc6 zc6Var = new zc6("");
            jc6.a.getClass();
            jc6.g(yd6Var, zc6Var);
        } else {
            zc6 zc6Var2 = new zc6(str);
            jc6.a.getClass();
            jc6.g(yd6Var, zc6Var2);
        }
    }
}
