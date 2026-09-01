package defpackage;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class dn6 extends jb6 {
    public final /* synthetic */ int a = 1;
    public final gg5 b;
    public final Object c;
    public final Object d;
    public final Object e;

    public dn6(Class cls) {
        this.c = cls;
        try {
            Enum[] enumArr = (Enum[]) cls.getEnumConstants();
            this.e = enumArr;
            this.d = new String[enumArr.length];
            int i = 0;
            while (true) {
                Enum[] enumArr2 = (Enum[]) this.e;
                if (i >= enumArr2.length) {
                    this.b = gg5.X((String[]) this.d);
                    return;
                }
                String strName = enumArr2[i].name();
                String[] strArr = (String[]) this.d;
                Field field = cls.getField(strName);
                Set set = yoe.a;
                gb6 gb6Var = (gb6) field.getAnnotation(gb6.class);
                if (gb6Var != null) {
                    String strName2 = gb6Var.name();
                    if (!"\u0000".equals(strName2)) {
                        strName = strName2;
                    }
                }
                strArr[i] = strName;
                i++;
            }
        } catch (NoSuchFieldException e) {
            throw new AssertionError("Missing field in ".concat(cls.getName()), e);
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:84:0x01f6, code lost:
    
        return r13;
     */
    @Override // defpackage.jb6
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(defpackage.hd6 r17) throws java.io.EOFException, com.squareup.moshi.JsonEncodingException {
        /*
            Method dump skipped, instruction units count: 510
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.dn6.a(hd6):java.lang.Object");
    }

    @Override // defpackage.jb6
    public final void e(zd6 zd6Var, Object obj) {
        int i = this.a;
        Object obj2 = this.d;
        switch (i) {
            case 0:
                zd6Var.getClass();
                if (obj != null) {
                    zd6Var.m();
                    for (bn6 bn6Var : (ArrayList) obj2) {
                        if (bn6Var != null) {
                            zd6Var.D(bn6Var.a);
                            bn6Var.b.e(zd6Var, bn6Var.c.get(obj));
                        }
                    }
                    zd6Var.p();
                } else {
                    z72.c("value == null");
                }
                break;
            default:
                zd6Var.Q(((String[]) obj2)[((Enum) obj).ordinal()]);
                break;
        }
    }

    public final String toString() {
        int i = this.a;
        Object obj = this.c;
        switch (i) {
            case 0:
                return "KotlinJsonAdapter(" + ((qh6) obj).getReturnType() + ')';
            default:
                return "JsonAdapter(" + ((Class) obj).getName() + ")";
        }
    }

    public dn6(qh6 qh6Var, ArrayList arrayList, ArrayList arrayList2, gg5 gg5Var) {
        this.c = qh6Var;
        this.d = arrayList;
        this.e = arrayList2;
        this.b = gg5Var;
    }
}
