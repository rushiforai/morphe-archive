package defpackage;

import com.google.gson.JsonParseException;
import com.squareup.wire.sjIw.ezwlgQm;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.util.Arrays;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class f2b extends c2b {
    public static final HashMap e;
    public final Constructor b;
    public final Object[] c;
    public final HashMap d;

    static {
        HashMap map = new HashMap();
        map.put(Byte.TYPE, (byte) 0);
        map.put(Short.TYPE, (short) 0);
        map.put(Integer.TYPE, 0);
        map.put(Long.TYPE, 0L);
        map.put(Float.TYPE, Float.valueOf(0.0f));
        map.put(Double.TYPE, Double.valueOf(0.0d));
        map.put(Character.TYPE, (char) 0);
        map.put(Boolean.TYPE, Boolean.FALSE);
        e = map;
    }

    public f2b(Class cls, e2b e2bVar, boolean z) {
        super(e2bVar);
        this.d = new HashMap();
        to7 to7Var = w1b.a;
        Constructor constructorL = to7Var.l(cls);
        this.b = constructorL;
        if (z) {
            g2b.b(null, constructorL);
        } else {
            w1b.f(constructorL);
        }
        String[] strArrN = to7Var.n(cls);
        for (int i = 0; i < strArrN.length; i++) {
            this.d.put(strArrN[i], Integer.valueOf(i));
        }
        Class<?>[] parameterTypes = this.b.getParameterTypes();
        this.c = new Object[parameterTypes.length];
        for (int i2 = 0; i2 < parameterTypes.length; i2++) {
            this.c[i2] = e.get(parameterTypes[i2]);
        }
    }

    @Override // defpackage.c2b
    public final Object d() {
        return (Object[]) this.c.clone();
    }

    @Override // defpackage.c2b
    public final Object e(Object obj) {
        Object[] objArr = (Object[]) obj;
        Constructor constructor = this.b;
        try {
            return constructor.newInstance(objArr);
        } catch (IllegalAccessException e2) {
            to7 to7Var = w1b.a;
            lg8.p("Unexpected IllegalAccessException occurred (Gson 2.14.0). Certain ReflectionAccessFilter features require Java >= 9 to work correctly. If you are not using ReflectionAccessFilter, report this to the Gson maintainers.", e2);
            return null;
        } catch (IllegalArgumentException e3) {
            e = e3;
            throw new RuntimeException("Failed to invoke constructor '" + w1b.b(constructor) + "' with args " + Arrays.toString(objArr), e);
        } catch (InstantiationException e4) {
            e = e4;
            throw new RuntimeException("Failed to invoke constructor '" + w1b.b(constructor) + "' with args " + Arrays.toString(objArr), e);
        } catch (InvocationTargetException e5) {
            lg8.p("Failed to invoke constructor '" + w1b.b(constructor) + "' with args " + Arrays.toString(objArr), e5.getCause());
            return null;
        }
    }

    @Override // defpackage.c2b
    public final void f(Object obj, gd6 gd6Var, b2b b2bVar) {
        Object[] objArr = (Object[]) obj;
        String str = b2bVar.c;
        Integer num = (Integer) this.d.get(str);
        if (num == null) {
            throw new IllegalStateException("Could not find the index in the constructor '" + w1b.b(this.b) + ezwlgQm.loogXw + str + "', unable to determine which argument in the constructor the field corresponds to. This is unexpected behavior, as we expect the RecordComponents to have the same names as the fields in the Java class, and that the order of the RecordComponents is the same as the order of the canonical constructor parameters.");
        }
        int iIntValue = num.intValue();
        Object objB = b2bVar.g.b(gd6Var);
        if (objB != null || !b2bVar.h) {
            objArr[iIntValue] = objB;
        } else {
            StringBuilder sbU = lv8.u("null is not allowed as value for record component '", str, "' of primitive type; at path ");
            sbU.append(gd6Var.N());
            throw new JsonParseException(sbU.toString());
        }
    }
}
