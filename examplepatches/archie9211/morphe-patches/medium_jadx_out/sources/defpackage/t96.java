package defpackage;

import java.io.Serializable;

/* JADX WARN: Enum visitor error
jadx.core.utils.exceptions.JadxRuntimeException: Init of enum field 'INT' uses external variables
	at jadx.core.dex.visitors.EnumVisitor.createEnumFieldByConstructor(EnumVisitor.java:451)
	at jadx.core.dex.visitors.EnumVisitor.processEnumFieldByRegister(EnumVisitor.java:395)
	at jadx.core.dex.visitors.EnumVisitor.extractEnumFieldsFromFilledArray(EnumVisitor.java:324)
	at jadx.core.dex.visitors.EnumVisitor.extractEnumFieldsFromInsn(EnumVisitor.java:262)
	at jadx.core.dex.visitors.EnumVisitor.convertToEnum(EnumVisitor.java:151)
	at jadx.core.dex.visitors.EnumVisitor.visit(EnumVisitor.java:100)
 */
/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class t96 {
    public static final t96 BOOLEAN;
    public static final t96 BYTE_STRING;
    public static final t96 DOUBLE;
    public static final t96 ENUM;
    public static final t96 FLOAT;
    public static final t96 INT;
    public static final t96 LONG;
    public static final t96 MESSAGE;
    public static final t96 STRING;
    public static final t96 VOID;
    public static final /* synthetic */ t96[] d;
    public final Class a;
    public final Class b;
    public final Object c;

    static {
        t96 t96Var = new t96("VOID", 0, Void.class, Void.class, null);
        VOID = t96Var;
        Class cls = Integer.TYPE;
        t96 t96Var2 = new t96("INT", 1, cls, Integer.class, 0);
        INT = t96Var2;
        t96 t96Var3 = new t96("LONG", 2, Long.TYPE, Long.class, 0L);
        LONG = t96Var3;
        t96 t96Var4 = new t96("FLOAT", 3, Float.TYPE, Float.class, Float.valueOf(0.0f));
        FLOAT = t96Var4;
        t96 t96Var5 = new t96("DOUBLE", 4, Double.TYPE, Double.class, Double.valueOf(0.0d));
        DOUBLE = t96Var5;
        t96 t96Var6 = new t96("BOOLEAN", 5, Boolean.TYPE, Boolean.class, Boolean.FALSE);
        BOOLEAN = t96Var6;
        t96 t96Var7 = new t96("STRING", 6, String.class, String.class, "");
        STRING = t96Var7;
        t96 t96Var8 = new t96("BYTE_STRING", 7, f21.class, f21.class, f21.b);
        BYTE_STRING = t96Var8;
        t96 t96Var9 = new t96("ENUM", 8, cls, Integer.class, null);
        ENUM = t96Var9;
        t96 t96Var10 = new t96("MESSAGE", 9, Object.class, Object.class, null);
        MESSAGE = t96Var10;
        d = new t96[]{t96Var, t96Var2, t96Var3, t96Var4, t96Var5, t96Var6, t96Var7, t96Var8, t96Var9, t96Var10};
    }

    public t96(String str, int i, Class cls, Class cls2, Serializable serializable) {
        this.a = cls;
        this.b = cls2;
        this.c = serializable;
    }

    public static t96 valueOf(String str) {
        return (t96) Enum.valueOf(t96.class, str);
    }

    public static t96[] values() {
        return (t96[]) d.clone();
    }

    public Class<?> getBoxedType() {
        return this.b;
    }

    public Object getDefaultDefault() {
        return this.c;
    }

    public Class<?> getType() {
        return this.a;
    }

    public boolean isValidType(Class<?> cls) {
        return this.a.isAssignableFrom(cls);
    }
}
