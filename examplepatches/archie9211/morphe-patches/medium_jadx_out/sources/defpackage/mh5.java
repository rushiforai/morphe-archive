package defpackage;

import java.io.Serializable;
import java.lang.reflect.Type;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class mh5 implements ac6 {
    @Override // defpackage.ac6
    public final Object a(dc6 dc6Var, Type type, qlb qlbVar) {
        if (dc6Var == null) {
            return Boolean.FALSE;
        }
        if (!(dc6Var instanceof zc6)) {
            return Boolean.FALSE;
        }
        zc6 zc6Var = (zc6) dc6Var;
        Serializable serializable = zc6Var.a;
        if (serializable instanceof Number) {
            return Boolean.valueOf(zc6Var.d() != 0);
        }
        if (!(serializable instanceof String)) {
            return Boolean.valueOf(zc6Var.q());
        }
        String strM = zc6Var.m();
        if (!strM.isEmpty() && !"false".equalsIgnoreCase(strM)) {
            z = true;
        }
        return Boolean.valueOf(z);
    }
}
