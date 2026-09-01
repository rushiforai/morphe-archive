package defpackage;

import java.util.ArrayList;
import java.util.HashSet;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class vn1 {
    public final String a;
    public final ArrayList b = new ArrayList();
    public final HashSet c = new HashSet();
    public final ArrayList d = new ArrayList();
    public final ArrayList e = new ArrayList();
    public final ArrayList f = new ArrayList();

    public vn1(String str) {
        this.a = str;
    }

    public static void a(vn1 vn1Var, String str, xzb xzbVar) {
        xzbVar.getClass();
        if (!vn1Var.c.add(str)) {
            StringBuilder sbU = lv8.u("Element with name '", str, "' is already registered in ");
            sbU.append(vn1Var.a);
            throw new IllegalArgumentException(sbU.toString().toString());
        }
        vn1Var.b.add(str);
        vn1Var.d.add(xzbVar);
        vn1Var.e.add(ey3.a);
        vn1Var.f.add(false);
    }
}
