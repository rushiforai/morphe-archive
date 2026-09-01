package defpackage;

import java.io.IOException;
import java.lang.reflect.AccessibleObject;
import java.lang.reflect.Field;
import java.util.Arrays;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class q04 extends jud {
    public static final o04 d = new o04();
    public final HashMap a;
    public final HashMap b;
    public final HashMap c;

    public q04(Class cls) {
        try {
            Field[] declaredFields = cls.getDeclaredFields();
            int i = 0;
            for (Field field : declaredFields) {
                if (field.isEnumConstant()) {
                    declaredFields[i] = field;
                    i++;
                }
            }
            Field[] fieldArr = (Field[]) Arrays.copyOf(declaredFields, i);
            int iCeil = (int) Math.ceil(i / 0.75f);
            this.a = new HashMap(iCeil);
            this.b = new HashMap(iCeil);
            this.c = new HashMap(iCeil);
            AccessibleObject.setAccessible(fieldArr, true);
            for (Field field2 : fieldArr) {
                Enum r5 = (Enum) field2.get(null);
                String strName = r5.name();
                String string = r5.toString();
                g0c g0cVar = (g0c) field2.getAnnotation(g0c.class);
                if (g0cVar != null) {
                    strName = g0cVar.value();
                    for (String str : g0cVar.alternate()) {
                        this.a.put(str, r5);
                    }
                }
                this.a.put(strName, r5);
                this.b.put(string, r5);
                this.c.put(r5, strName);
            }
        } catch (IllegalAccessException e) {
            ay0.d(e);
            throw null;
        }
    }

    @Override // defpackage.jud
    public final Object b(gd6 gd6Var) throws IOException {
        if (gd6Var.p0() == jd6.NULL) {
            gd6Var.a0();
            return null;
        }
        String strQ = gd6Var.q();
        Enum r0 = (Enum) this.a.get(strQ);
        return r0 == null ? (Enum) this.b.get(strQ) : r0;
    }

    @Override // defpackage.jud
    public final void c(yd6 yd6Var, Object obj) throws IOException {
        Enum r2 = (Enum) obj;
        yd6Var.A0(r2 == null ? null : (String) this.c.get(r2));
    }
}
