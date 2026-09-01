package defpackage;

import com.medium.android.data.notification.YMl.DtuT;
import java.lang.reflect.Type;

/* JADX WARN: Enum visitor error
jadx.core.utils.exceptions.JadxRuntimeException: Init of enum field 'DOUBLE' uses external variables
	at jadx.core.dex.visitors.EnumVisitor.createEnumFieldByConstructor(EnumVisitor.java:451)
	at jadx.core.dex.visitors.EnumVisitor.processEnumFieldByRegister(EnumVisitor.java:395)
	at jadx.core.dex.visitors.EnumVisitor.extractEnumFieldsFromFilledArray(EnumVisitor.java:324)
	at jadx.core.dex.visitors.EnumVisitor.extractEnumFieldsFromInsn(EnumVisitor.java:262)
	at jadx.core.dex.visitors.EnumVisitor.convertToEnum(EnumVisitor.java:151)
	at jadx.core.dex.visitors.EnumVisitor.visit(EnumVisitor.java:100)
 */
/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class fg4 {
    public static final fg4 BOOL;
    public static final fg4 BOOL_LIST;
    public static final fg4 BOOL_LIST_PACKED;
    public static final fg4 BYTES;
    public static final fg4 BYTES_LIST;
    public static final fg4 DOUBLE;
    public static final fg4 DOUBLE_LIST;
    public static final fg4 DOUBLE_LIST_PACKED;
    public static final fg4 ENUM;
    public static final fg4 ENUM_LIST;
    public static final fg4 ENUM_LIST_PACKED;
    public static final fg4 FIXED32;
    public static final fg4 FIXED32_LIST;
    public static final fg4 FIXED32_LIST_PACKED;
    public static final fg4 FIXED64;
    public static final fg4 FIXED64_LIST;
    public static final fg4 FIXED64_LIST_PACKED;
    public static final fg4 FLOAT;
    public static final fg4 FLOAT_LIST;
    public static final fg4 FLOAT_LIST_PACKED;
    public static final fg4 GROUP;
    public static final fg4 GROUP_LIST;
    public static final fg4 INT32;
    public static final fg4 INT32_LIST;
    public static final fg4 INT32_LIST_PACKED;
    public static final fg4 INT64;
    public static final fg4 INT64_LIST;
    public static final fg4 INT64_LIST_PACKED;
    public static final fg4 MAP;
    public static final fg4 MESSAGE;
    public static final fg4 MESSAGE_LIST;
    public static final fg4 SFIXED32;
    public static final fg4 SFIXED32_LIST;
    public static final fg4 SFIXED32_LIST_PACKED;
    public static final fg4 SFIXED64;
    public static final fg4 SFIXED64_LIST;
    public static final fg4 SFIXED64_LIST_PACKED;
    public static final fg4 SINT32;
    public static final fg4 SINT32_LIST;
    public static final fg4 SINT32_LIST_PACKED;
    public static final fg4 SINT64;
    public static final fg4 SINT64_LIST;
    public static final fg4 SINT64_LIST_PACKED;
    public static final fg4 STRING;
    public static final fg4 STRING_LIST;
    public static final fg4 UINT32;
    public static final fg4 UINT32_LIST;
    public static final fg4 UINT32_LIST_PACKED;
    public static final fg4 UINT64;
    public static final fg4 UINT64_LIST;
    public static final fg4 UINT64_LIST_PACKED;
    public static final fg4[] f;
    public static final Type[] g;
    public static final /* synthetic */ fg4[] h;
    public final t96 a;
    public final int b;
    public final dg4 c;
    public final Class d;
    public final boolean e;

    public fg4(String str, int i, int i2, dg4 dg4Var, t96 t96Var) {
        int i3;
        this.b = i2;
        this.c = dg4Var;
        this.a = t96Var;
        int i4 = bg4.a[dg4Var.ordinal()];
        if (i4 == 1 || i4 == 2) {
            this.d = t96Var.getBoxedType();
        } else {
            this.d = null;
        }
        this.e = (dg4Var != dg4.SCALAR || (i3 = bg4.b[t96Var.ordinal()]) == 1 || i3 == 2 || i3 == 3) ? false : true;
    }

    public static fg4 forId(int i) {
        if (i < 0) {
            return null;
        }
        fg4[] fg4VarArr = f;
        if (i >= fg4VarArr.length) {
            return null;
        }
        return fg4VarArr[i];
    }

    public static fg4 valueOf(String str) {
        return (fg4) Enum.valueOf(fg4.class, str);
    }

    public static fg4[] values() {
        return (fg4[]) h.clone();
    }

    public t96 getJavaType() {
        return this.a;
    }

    public int id() {
        return this.b;
    }

    public boolean isList() {
        return this.c.isList();
    }

    public boolean isMap() {
        return this.c == dg4.MAP;
    }

    public boolean isPacked() {
        return dg4.PACKED_VECTOR.equals(this.c);
    }

    public boolean isPrimitiveScalar() {
        return this.e;
    }

    public boolean isScalar() {
        return this.c == dg4.SCALAR;
    }

    /* JADX WARN: Code restructure failed: missing block: B:67:0x0030, code lost:
    
        r11 = r3;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public boolean isValidForField(java.lang.reflect.Field r11) {
        /*
            Method dump skipped, instruction units count: 249
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.fg4.isValidForField(java.lang.reflect.Field):boolean");
    }

    static {
        dg4 dg4Var = dg4.SCALAR;
        t96 t96Var = t96.DOUBLE;
        fg4 fg4Var = new fg4("DOUBLE", 0, 0, dg4Var, t96Var);
        DOUBLE = fg4Var;
        t96 t96Var2 = t96.FLOAT;
        fg4 fg4Var2 = new fg4("FLOAT", 1, 1, dg4Var, t96Var2);
        FLOAT = fg4Var2;
        t96 t96Var3 = t96.LONG;
        fg4 fg4Var3 = new fg4("INT64", 2, 2, dg4Var, t96Var3);
        INT64 = fg4Var3;
        fg4 fg4Var4 = new fg4("UINT64", 3, 3, dg4Var, t96Var3);
        UINT64 = fg4Var4;
        t96 t96Var4 = t96.INT;
        fg4 fg4Var5 = new fg4("INT32", 4, 4, dg4Var, t96Var4);
        INT32 = fg4Var5;
        fg4 fg4Var6 = new fg4("FIXED64", 5, 5, dg4Var, t96Var3);
        FIXED64 = fg4Var6;
        fg4 fg4Var7 = new fg4("FIXED32", 6, 6, dg4Var, t96Var4);
        FIXED32 = fg4Var7;
        t96 t96Var5 = t96.BOOLEAN;
        fg4 fg4Var8 = new fg4("BOOL", 7, 7, dg4Var, t96Var5);
        BOOL = fg4Var8;
        t96 t96Var6 = t96.STRING;
        fg4 fg4Var9 = new fg4("STRING", 8, 8, dg4Var, t96Var6);
        STRING = fg4Var9;
        t96 t96Var7 = t96.MESSAGE;
        fg4 fg4Var10 = new fg4("MESSAGE", 9, 9, dg4Var, t96Var7);
        MESSAGE = fg4Var10;
        t96 t96Var8 = t96.BYTE_STRING;
        fg4 fg4Var11 = new fg4("BYTES", 10, 10, dg4Var, t96Var8);
        BYTES = fg4Var11;
        fg4 fg4Var12 = new fg4("UINT32", 11, 11, dg4Var, t96Var4);
        UINT32 = fg4Var12;
        t96 t96Var9 = t96.ENUM;
        fg4 fg4Var13 = new fg4("ENUM", 12, 12, dg4Var, t96Var9);
        ENUM = fg4Var13;
        fg4 fg4Var14 = new fg4("SFIXED32", 13, 13, dg4Var, t96Var4);
        SFIXED32 = fg4Var14;
        fg4 fg4Var15 = new fg4("SFIXED64", 14, 14, dg4Var, t96Var3);
        SFIXED64 = fg4Var15;
        fg4 fg4Var16 = new fg4("SINT32", 15, 15, dg4Var, t96Var4);
        SINT32 = fg4Var16;
        fg4 fg4Var17 = new fg4(DtuT.XuB, 16, 16, dg4Var, t96Var3);
        SINT64 = fg4Var17;
        fg4 fg4Var18 = new fg4("GROUP", 17, 17, dg4Var, t96Var7);
        GROUP = fg4Var18;
        dg4 dg4Var2 = dg4.VECTOR;
        fg4 fg4Var19 = new fg4("DOUBLE_LIST", 18, 18, dg4Var2, t96Var);
        DOUBLE_LIST = fg4Var19;
        fg4 fg4Var20 = new fg4("FLOAT_LIST", 19, 19, dg4Var2, t96Var2);
        FLOAT_LIST = fg4Var20;
        fg4 fg4Var21 = new fg4("INT64_LIST", 20, 20, dg4Var2, t96Var3);
        INT64_LIST = fg4Var21;
        fg4 fg4Var22 = new fg4("UINT64_LIST", 21, 21, dg4Var2, t96Var3);
        UINT64_LIST = fg4Var22;
        fg4 fg4Var23 = new fg4("INT32_LIST", 22, 22, dg4Var2, t96Var4);
        INT32_LIST = fg4Var23;
        fg4 fg4Var24 = new fg4("FIXED64_LIST", 23, 23, dg4Var2, t96Var3);
        FIXED64_LIST = fg4Var24;
        fg4 fg4Var25 = new fg4("FIXED32_LIST", 24, 24, dg4Var2, t96Var4);
        FIXED32_LIST = fg4Var25;
        fg4 fg4Var26 = new fg4("BOOL_LIST", 25, 25, dg4Var2, t96Var5);
        BOOL_LIST = fg4Var26;
        fg4 fg4Var27 = new fg4("STRING_LIST", 26, 26, dg4Var2, t96Var6);
        STRING_LIST = fg4Var27;
        fg4 fg4Var28 = new fg4("MESSAGE_LIST", 27, 27, dg4Var2, t96Var7);
        MESSAGE_LIST = fg4Var28;
        fg4 fg4Var29 = new fg4("BYTES_LIST", 28, 28, dg4Var2, t96Var8);
        BYTES_LIST = fg4Var29;
        fg4 fg4Var30 = new fg4("UINT32_LIST", 29, 29, dg4Var2, t96Var4);
        UINT32_LIST = fg4Var30;
        fg4 fg4Var31 = new fg4("ENUM_LIST", 30, 30, dg4Var2, t96Var9);
        ENUM_LIST = fg4Var31;
        fg4 fg4Var32 = new fg4("SFIXED32_LIST", 31, 31, dg4Var2, t96Var4);
        SFIXED32_LIST = fg4Var32;
        fg4 fg4Var33 = new fg4("SFIXED64_LIST", 32, 32, dg4Var2, t96Var3);
        SFIXED64_LIST = fg4Var33;
        fg4 fg4Var34 = new fg4("SINT32_LIST", 33, 33, dg4Var2, t96Var4);
        SINT32_LIST = fg4Var34;
        fg4 fg4Var35 = new fg4("SINT64_LIST", 34, 34, dg4Var2, t96Var3);
        SINT64_LIST = fg4Var35;
        dg4 dg4Var3 = dg4.PACKED_VECTOR;
        fg4 fg4Var36 = new fg4("DOUBLE_LIST_PACKED", 35, 35, dg4Var3, t96Var);
        DOUBLE_LIST_PACKED = fg4Var36;
        fg4 fg4Var37 = new fg4("FLOAT_LIST_PACKED", 36, 36, dg4Var3, t96Var2);
        FLOAT_LIST_PACKED = fg4Var37;
        fg4 fg4Var38 = new fg4("INT64_LIST_PACKED", 37, 37, dg4Var3, t96Var3);
        INT64_LIST_PACKED = fg4Var38;
        fg4 fg4Var39 = new fg4("UINT64_LIST_PACKED", 38, 38, dg4Var3, t96Var3);
        UINT64_LIST_PACKED = fg4Var39;
        fg4 fg4Var40 = new fg4("INT32_LIST_PACKED", 39, 39, dg4Var3, t96Var4);
        INT32_LIST_PACKED = fg4Var40;
        fg4 fg4Var41 = new fg4("FIXED64_LIST_PACKED", 40, 40, dg4Var3, t96Var3);
        FIXED64_LIST_PACKED = fg4Var41;
        fg4 fg4Var42 = new fg4("FIXED32_LIST_PACKED", 41, 41, dg4Var3, t96Var4);
        FIXED32_LIST_PACKED = fg4Var42;
        fg4 fg4Var43 = new fg4("BOOL_LIST_PACKED", 42, 42, dg4Var3, t96Var5);
        BOOL_LIST_PACKED = fg4Var43;
        fg4 fg4Var44 = new fg4("UINT32_LIST_PACKED", 43, 43, dg4Var3, t96Var4);
        UINT32_LIST_PACKED = fg4Var44;
        fg4 fg4Var45 = new fg4("ENUM_LIST_PACKED", 44, 44, dg4Var3, t96Var9);
        ENUM_LIST_PACKED = fg4Var45;
        fg4 fg4Var46 = new fg4("SFIXED32_LIST_PACKED", 45, 45, dg4Var3, t96Var4);
        SFIXED32_LIST_PACKED = fg4Var46;
        fg4 fg4Var47 = new fg4("SFIXED64_LIST_PACKED", 46, 46, dg4Var3, t96Var3);
        SFIXED64_LIST_PACKED = fg4Var47;
        fg4 fg4Var48 = new fg4("SINT32_LIST_PACKED", 47, 47, dg4Var3, t96Var4);
        SINT32_LIST_PACKED = fg4Var48;
        fg4 fg4Var49 = new fg4("SINT64_LIST_PACKED", 48, 48, dg4Var3, t96Var3);
        SINT64_LIST_PACKED = fg4Var49;
        fg4 fg4Var50 = new fg4("GROUP_LIST", 49, 49, dg4Var2, t96Var7);
        GROUP_LIST = fg4Var50;
        fg4 fg4Var51 = new fg4("MAP", 50, 50, dg4.MAP, t96.VOID);
        MAP = fg4Var51;
        h = new fg4[]{fg4Var, fg4Var2, fg4Var3, fg4Var4, fg4Var5, fg4Var6, fg4Var7, fg4Var8, fg4Var9, fg4Var10, fg4Var11, fg4Var12, fg4Var13, fg4Var14, fg4Var15, fg4Var16, fg4Var17, fg4Var18, fg4Var19, fg4Var20, fg4Var21, fg4Var22, fg4Var23, fg4Var24, fg4Var25, fg4Var26, fg4Var27, fg4Var28, fg4Var29, fg4Var30, fg4Var31, fg4Var32, fg4Var33, fg4Var34, fg4Var35, fg4Var36, fg4Var37, fg4Var38, fg4Var39, fg4Var40, fg4Var41, fg4Var42, fg4Var43, fg4Var44, fg4Var45, fg4Var46, fg4Var47, fg4Var48, fg4Var49, fg4Var50, fg4Var51};
        g = new Type[0];
        fg4[] fg4VarArrValues = values();
        f = new fg4[fg4VarArrValues.length];
        for (fg4 fg4Var52 : fg4VarArrValues) {
            f[fg4Var52.b] = fg4Var52;
        }
    }
}
