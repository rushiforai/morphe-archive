package defpackage;

import com.squareup.moshi.JsonDataException;
import java.lang.reflect.Array;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Map;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class o70 extends jb6 {
    public static final n70 d = new n70(0);
    public static final n70 e = new n70(4);
    public final /* synthetic */ int a = 0;
    public final jb6 b;
    public final Object c;

    public o70(x38 x38Var, Type type, Type type2) {
        Set set = yoe.a;
        this.b = x38Var.a(type, set, null);
        this.c = x38Var.a(type2, set, null);
    }

    @Override // defpackage.jb6
    public final Object a(hd6 hd6Var) {
        int i = this.a;
        Object obj = this.c;
        jb6 jb6Var = this.b;
        switch (i) {
            case 0:
                ArrayList arrayList = new ArrayList();
                hd6Var.f();
                while (hd6Var.hasNext()) {
                    arrayList.add(jb6Var.a(hd6Var));
                }
                hd6Var.p();
                Object objNewInstance = Array.newInstance((Class<?>) obj, arrayList.size());
                for (int i2 = 0; i2 < arrayList.size(); i2++) {
                    Array.set(objNewInstance, i2, arrayList.get(i2));
                }
                return objNewInstance;
            default:
                w07 w07Var = new w07();
                hd6Var.m();
                while (hd6Var.hasNext()) {
                    sd6 sd6Var = (sd6) hd6Var;
                    if (sd6Var.hasNext()) {
                        sd6Var.j = sd6Var.X();
                        sd6Var.g = 11;
                    }
                    Object objA = jb6Var.a(hd6Var);
                    Object objA2 = ((jb6) obj).a(hd6Var);
                    Object objPut = w07Var.put(objA, objA2);
                    if (objPut != null) {
                        StringBuilder sb = new StringBuilder("Map key '");
                        sb.append(objA);
                        String strD = hd6Var.D();
                        sb.append("' has multiple values at path ");
                        sb.append(strD);
                        sb.append(": ");
                        sb.append(objPut);
                        sb.append(" and ");
                        sb.append(objA2);
                        throw new JsonDataException(sb.toString());
                    }
                }
                hd6Var.B();
                return w07Var;
        }
    }

    @Override // defpackage.jb6
    public final void e(zd6 zd6Var, Object obj) {
        int i = this.a;
        jb6 jb6Var = this.b;
        switch (i) {
            case 0:
                zd6Var.f();
                int length = Array.getLength(obj);
                for (int i2 = 0; i2 < length; i2++) {
                    jb6Var.e(zd6Var, Array.get(obj, i2));
                }
                ((ud6) zd6Var).T(1, 2, ']');
                return;
            default:
                zd6Var.m();
                for (Map.Entry entry : ((Map) obj).entrySet()) {
                    if (entry.getKey() == null) {
                        throw new JsonDataException("Map key is null at ".concat(zd6Var.B()));
                    }
                    int iL = zd6Var.L();
                    if (iL != 5 && iL != 3) {
                        ygf.f("Nesting problem.");
                        return;
                    } else {
                        zd6Var.e = true;
                        jb6Var.e(zd6Var, entry.getKey());
                        ((jb6) this.c).e(zd6Var, entry.getValue());
                    }
                }
                zd6Var.p();
                return;
        }
    }

    public final String toString() {
        int i = this.a;
        jb6 jb6Var = this.b;
        switch (i) {
            case 0:
                return jb6Var + ".array()";
            default:
                return "JsonAdapter(" + jb6Var + "=" + ((jb6) this.c) + ")";
        }
    }

    public o70(Class cls, jb6 jb6Var) {
        this.c = cls;
        this.b = jb6Var;
    }
}
