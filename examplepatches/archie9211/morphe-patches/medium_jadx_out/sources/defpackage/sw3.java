package defpackage;

import java.lang.reflect.Type;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class sw3 implements ac6 {
    @Override // defpackage.ac6
    public final Object a(dc6 dc6Var, Type type, qlb qlbVar) {
        String strM;
        dc6Var.getClass();
        type.getClass();
        qlbVar.getClass();
        Object obj = null;
        if (!(dc6Var instanceof zc6)) {
            dc6Var = null;
        }
        if (dc6Var == null || (strM = ((zc6) dc6Var).m()) == null) {
            return null;
        }
        tw3.Companion.getClass();
        Iterator<E> it2 = tw3.getEntries().iterator();
        while (true) {
            if (!it2.hasNext()) {
                break;
            }
            Object next = it2.next();
            if (g76.L(((tw3) next).getValue(), strM)) {
                obj = next;
                break;
            }
        }
        return (tw3) obj;
    }
}
