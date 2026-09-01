package defpackage;

import java.lang.reflect.Type;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class j14 implements ac6 {
    @Override // defpackage.ac6
    public final Object a(dc6 dc6Var, Type type, qlb qlbVar) {
        dc6Var.getClass();
        type.getClass();
        qlbVar.getClass();
        wsd wsdVar = (wsd) qlbVar.a;
        if (!(dc6Var instanceof uc6)) {
            dc6Var = null;
        }
        if (dc6Var != null) {
            uc6 uc6VarE = dc6Var.e();
            b17 b17Var = uc6VarE.a;
            if (b17Var.containsKey("accessToken")) {
                ch5 ch5Var = wsdVar.b;
                ch5Var.getClass();
                return (l14) ch5Var.a(new od6(uc6VarE), kxd.b(k14.class));
            }
            if (b17Var.containsKey("code")) {
                ch5 ch5Var2 = wsdVar.b;
                ch5Var2.getClass();
                return (l14) ch5Var2.a(new od6(uc6VarE), kxd.b(i14.class));
            }
        }
        return null;
    }
}
