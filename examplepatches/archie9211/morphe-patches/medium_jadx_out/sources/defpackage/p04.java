package defpackage;

import com.google.gson.JsonSyntaxException;
import com.squareup.wire.WireEnum;
import com.squareup.wire.internal.JsonFormatter;
import java.io.IOException;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class p04 extends jud {
    public final /* synthetic */ int a;
    public final Object b;

    public p04(ch5 ch5Var, Type type, jud judVar) {
        this.a = 2;
        this.b = new lud(ch5Var, judVar, type, 0);
    }

    @Override // defpackage.jud
    public final Object b(gd6 gd6Var) throws IOException {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                gd6Var.getClass();
                String strN = gd6Var.N();
                String strQ = gd6Var.q();
                strQ.getClass();
                Enum r3 = (Enum) ((WireEnum) ((xl2) obj).a.get(strQ));
                if (r3 != null) {
                    return r3;
                }
                ik4.g(lv8.r("Unexpected ", strQ, " at path ", strN));
                return null;
            case 1:
                gd6Var.getClass();
                String strQ2 = gd6Var.q();
                try {
                    strQ2.getClass();
                    return ((JsonFormatter) obj).fromString(strQ2);
                } catch (RuntimeException unused) {
                    throw new JsonSyntaxException(lv8.r("decode failed: ", strQ2, " at path ", gd6Var.N()));
                }
            default:
                gd6Var.getClass();
                if (gd6Var.p0() == jd6.NULL) {
                    gd6Var.a0();
                    return ey3.a;
                }
                ArrayList arrayList = new ArrayList();
                gd6Var.f();
                while (gd6Var.hasNext()) {
                    arrayList.add(((lud) obj).c.b(gd6Var));
                }
                gd6Var.D();
                return arrayList;
        }
    }

    @Override // defpackage.jud
    public final void c(yd6 yd6Var, Object obj) throws IOException {
        int i = this.a;
        Object obj2 = this.b;
        switch (i) {
            case 0:
                Comparable comparable = (Enum) obj;
                yd6Var.getClass();
                comparable.getClass();
                yd6Var.z0(Integer.valueOf(((WireEnum) comparable).getValue()));
                break;
            case 1:
                yd6Var.getClass();
                obj.getClass();
                if (!(obj instanceof WireEnum)) {
                    Object stringOrNumber = ((JsonFormatter) obj2).toStringOrNumber(obj);
                    if (!(stringOrNumber instanceof Number)) {
                        stringOrNumber.getClass();
                        yd6Var.A0((String) stringOrNumber);
                    } else {
                        yd6Var.z0((Number) stringOrNumber);
                    }
                } else {
                    yd6Var.z0(Integer.valueOf(((WireEnum) obj).getValue()));
                }
                break;
            default:
                List list = (List) obj;
                yd6Var.getClass();
                yd6Var.m();
                if (list != null) {
                    Iterator it2 = list.iterator();
                    while (it2.hasNext()) {
                        ((lud) obj2).c(yd6Var, it2.next());
                    }
                }
                yd6Var.D();
                break;
        }
    }

    public /* synthetic */ p04(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }
}
