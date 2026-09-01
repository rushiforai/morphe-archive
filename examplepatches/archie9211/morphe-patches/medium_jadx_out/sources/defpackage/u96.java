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
public final class u96 {
    public static final u96 BOOLEAN;
    public static final u96 BYTE_STRING;
    public static final u96 DOUBLE;
    public static final u96 ENUM;
    public static final u96 FLOAT;
    public static final u96 INT;
    public static final u96 LONG;
    public static final u96 MESSAGE;
    public static final u96 STRING;
    public static final u96 VOID;
    public static final /* synthetic */ u96[] d;
    public final Class a;
    public final Class b;
    public final Object c;

    static {
        u96 u96Var = new u96("VOID", 0, Void.class, Void.class, null);
        VOID = u96Var;
        Class cls = Integer.TYPE;
        u96 u96Var2 = new u96("INT", 1, cls, Integer.class, 0);
        INT = u96Var2;
        u96 u96Var3 = new u96("LONG", 2, Long.TYPE, Long.class, 0L);
        LONG = u96Var3;
        u96 u96Var4 = new u96("FLOAT", 3, Float.TYPE, Float.class, Float.valueOf(0.0f));
        FLOAT = u96Var4;
        u96 u96Var5 = new u96("DOUBLE", 4, Double.TYPE, Double.class, Double.valueOf(0.0d));
        DOUBLE = u96Var5;
        u96 u96Var6 = new u96("BOOLEAN", 5, Boolean.TYPE, Boolean.class, Boolean.FALSE);
        BOOLEAN = u96Var6;
        u96 u96Var7 = new u96("STRING", 6, String.class, String.class, "");
        STRING = u96Var7;
        u96 u96Var8 = new u96("BYTE_STRING", 7, d21.class, d21.class, d21.c);
        BYTE_STRING = u96Var8;
        u96 u96Var9 = new u96("ENUM", 8, cls, Integer.class, null);
        ENUM = u96Var9;
        u96 u96Var10 = new u96("MESSAGE", 9, Object.class, Object.class, null);
        MESSAGE = u96Var10;
        d = new u96[]{u96Var, u96Var2, u96Var3, u96Var4, u96Var5, u96Var6, u96Var7, u96Var8, u96Var9, u96Var10};
    }

    public u96(String str, int i, Class cls, Class cls2, Serializable serializable) {
        this.a = cls;
        this.b = cls2;
        this.c = serializable;
    }

    public static u96 valueOf(String str) {
        return (u96) Enum.valueOf(u96.class, str);
    }

    public static u96[] values() {
        return (u96[]) d.clone();
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
