package defpackage;

import androidx.fragment.app.strictmode.YLGt.ZVsviyDAr;
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
public final class gg4 {
    public static final gg4 BOOL;
    public static final gg4 BOOL_LIST;
    public static final gg4 BOOL_LIST_PACKED;
    public static final gg4 BYTES;
    public static final gg4 BYTES_LIST;
    public static final gg4 DOUBLE;
    public static final gg4 DOUBLE_LIST;
    public static final gg4 DOUBLE_LIST_PACKED;
    public static final gg4 ENUM;
    public static final gg4 ENUM_LIST;
    public static final gg4 ENUM_LIST_PACKED;
    public static final gg4 FIXED32;
    public static final gg4 FIXED32_LIST;
    public static final gg4 FIXED32_LIST_PACKED;
    public static final gg4 FIXED64;
    public static final gg4 FIXED64_LIST;
    public static final gg4 FIXED64_LIST_PACKED;
    public static final gg4 FLOAT;
    public static final gg4 FLOAT_LIST;
    public static final gg4 FLOAT_LIST_PACKED;
    public static final gg4 GROUP;
    public static final gg4 GROUP_LIST;
    public static final gg4 INT32;
    public static final gg4 INT32_LIST;
    public static final gg4 INT32_LIST_PACKED;
    public static final gg4 INT64;
    public static final gg4 INT64_LIST;
    public static final gg4 INT64_LIST_PACKED;
    public static final gg4 MAP;
    public static final gg4 MESSAGE;
    public static final gg4 MESSAGE_LIST;
    public static final gg4 SFIXED32;
    public static final gg4 SFIXED32_LIST;
    public static final gg4 SFIXED32_LIST_PACKED;
    public static final gg4 SFIXED64;
    public static final gg4 SFIXED64_LIST;
    public static final gg4 SFIXED64_LIST_PACKED;
    public static final gg4 SINT32;
    public static final gg4 SINT32_LIST;
    public static final gg4 SINT32_LIST_PACKED;
    public static final gg4 SINT64;
    public static final gg4 SINT64_LIST;
    public static final gg4 SINT64_LIST_PACKED;
    public static final gg4 STRING;
    public static final gg4 STRING_LIST;
    public static final gg4 UINT32;
    public static final gg4 UINT32_LIST;
    public static final gg4 UINT32_LIST_PACKED;
    public static final gg4 UINT64;
    public static final gg4 UINT64_LIST;
    public static final gg4 UINT64_LIST_PACKED;
    public static final gg4[] f;
    public static final Type[] g;
    public static final /* synthetic */ gg4[] h;
    public final u96 a;
    public final int b;
    public final eg4 c;
    public final Class d;
    public final boolean e;

    public gg4(String str, int i, int i2, eg4 eg4Var, u96 u96Var) {
        int i3;
        this.b = i2;
        this.c = eg4Var;
        this.a = u96Var;
        int i4 = cg4.a[eg4Var.ordinal()];
        if (i4 == 1 || i4 == 2) {
            this.d = u96Var.getBoxedType();
        } else {
            this.d = null;
        }
        this.e = (eg4Var != eg4.SCALAR || (i3 = cg4.b[u96Var.ordinal()]) == 1 || i3 == 2 || i3 == 3) ? false : true;
    }

    public static gg4 forId(int i) {
        if (i < 0) {
            return null;
        }
        gg4[] gg4VarArr = f;
        if (i >= gg4VarArr.length) {
            return null;
        }
        return gg4VarArr[i];
    }

    public static gg4 valueOf(String str) {
        return (gg4) Enum.valueOf(gg4.class, str);
    }

    public static gg4[] values() {
        return (gg4[]) h.clone();
    }

    public u96 getJavaType() {
        return this.a;
    }

    public int id() {
        return this.b;
    }

    public boolean isList() {
        return this.c.isList();
    }

    public boolean isMap() {
        return this.c == eg4.MAP;
    }

    public boolean isPacked() {
        return eg4.PACKED_VECTOR.equals(this.c);
    }

    public boolean isPrimitiveScalar() {
        return this.e;
    }

    public boolean isScalar() {
        return this.c == eg4.SCALAR;
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
        throw new UnsupportedOperationException("Method not decompiled: defpackage.gg4.isValidForField(java.lang.reflect.Field):boolean");
    }

    static {
        eg4 eg4Var = eg4.SCALAR;
        u96 u96Var = u96.DOUBLE;
        gg4 gg4Var = new gg4("DOUBLE", 0, 0, eg4Var, u96Var);
        DOUBLE = gg4Var;
        u96 u96Var2 = u96.FLOAT;
        gg4 gg4Var2 = new gg4("FLOAT", 1, 1, eg4Var, u96Var2);
        FLOAT = gg4Var2;
        u96 u96Var3 = u96.LONG;
        gg4 gg4Var3 = new gg4("INT64", 2, 2, eg4Var, u96Var3);
        INT64 = gg4Var3;
        gg4 gg4Var4 = new gg4("UINT64", 3, 3, eg4Var, u96Var3);
        UINT64 = gg4Var4;
        u96 u96Var4 = u96.INT;
        gg4 gg4Var5 = new gg4("INT32", 4, 4, eg4Var, u96Var4);
        INT32 = gg4Var5;
        gg4 gg4Var6 = new gg4("FIXED64", 5, 5, eg4Var, u96Var3);
        FIXED64 = gg4Var6;
        gg4 gg4Var7 = new gg4("FIXED32", 6, 6, eg4Var, u96Var4);
        FIXED32 = gg4Var7;
        u96 u96Var5 = u96.BOOLEAN;
        gg4 gg4Var8 = new gg4("BOOL", 7, 7, eg4Var, u96Var5);
        BOOL = gg4Var8;
        u96 u96Var6 = u96.STRING;
        gg4 gg4Var9 = new gg4("STRING", 8, 8, eg4Var, u96Var6);
        STRING = gg4Var9;
        u96 u96Var7 = u96.MESSAGE;
        gg4 gg4Var10 = new gg4("MESSAGE", 9, 9, eg4Var, u96Var7);
        MESSAGE = gg4Var10;
        u96 u96Var8 = u96.BYTE_STRING;
        gg4 gg4Var11 = new gg4("BYTES", 10, 10, eg4Var, u96Var8);
        BYTES = gg4Var11;
        gg4 gg4Var12 = new gg4("UINT32", 11, 11, eg4Var, u96Var4);
        UINT32 = gg4Var12;
        u96 u96Var9 = u96.ENUM;
        gg4 gg4Var13 = new gg4("ENUM", 12, 12, eg4Var, u96Var9);
        ENUM = gg4Var13;
        gg4 gg4Var14 = new gg4("SFIXED32", 13, 13, eg4Var, u96Var4);
        SFIXED32 = gg4Var14;
        gg4 gg4Var15 = new gg4("SFIXED64", 14, 14, eg4Var, u96Var3);
        SFIXED64 = gg4Var15;
        gg4 gg4Var16 = new gg4("SINT32", 15, 15, eg4Var, u96Var4);
        SINT32 = gg4Var16;
        gg4 gg4Var17 = new gg4("SINT64", 16, 16, eg4Var, u96Var3);
        SINT64 = gg4Var17;
        gg4 gg4Var18 = new gg4("GROUP", 17, 17, eg4Var, u96Var7);
        GROUP = gg4Var18;
        eg4 eg4Var2 = eg4.VECTOR;
        gg4 gg4Var19 = new gg4("DOUBLE_LIST", 18, 18, eg4Var2, u96Var);
        DOUBLE_LIST = gg4Var19;
        gg4 gg4Var20 = new gg4("FLOAT_LIST", 19, 19, eg4Var2, u96Var2);
        FLOAT_LIST = gg4Var20;
        gg4 gg4Var21 = new gg4("INT64_LIST", 20, 20, eg4Var2, u96Var3);
        INT64_LIST = gg4Var21;
        gg4 gg4Var22 = new gg4("UINT64_LIST", 21, 21, eg4Var2, u96Var3);
        UINT64_LIST = gg4Var22;
        gg4 gg4Var23 = new gg4("INT32_LIST", 22, 22, eg4Var2, u96Var4);
        INT32_LIST = gg4Var23;
        gg4 gg4Var24 = new gg4("FIXED64_LIST", 23, 23, eg4Var2, u96Var3);
        FIXED64_LIST = gg4Var24;
        gg4 gg4Var25 = new gg4("FIXED32_LIST", 24, 24, eg4Var2, u96Var4);
        FIXED32_LIST = gg4Var25;
        gg4 gg4Var26 = new gg4("BOOL_LIST", 25, 25, eg4Var2, u96Var5);
        BOOL_LIST = gg4Var26;
        gg4 gg4Var27 = new gg4("STRING_LIST", 26, 26, eg4Var2, u96Var6);
        STRING_LIST = gg4Var27;
        gg4 gg4Var28 = new gg4("MESSAGE_LIST", 27, 27, eg4Var2, u96Var7);
        MESSAGE_LIST = gg4Var28;
        gg4 gg4Var29 = new gg4("BYTES_LIST", 28, 28, eg4Var2, u96Var8);
        BYTES_LIST = gg4Var29;
        gg4 gg4Var30 = new gg4("UINT32_LIST", 29, 29, eg4Var2, u96Var4);
        UINT32_LIST = gg4Var30;
        gg4 gg4Var31 = new gg4("ENUM_LIST", 30, 30, eg4Var2, u96Var9);
        ENUM_LIST = gg4Var31;
        gg4 gg4Var32 = new gg4("SFIXED32_LIST", 31, 31, eg4Var2, u96Var4);
        SFIXED32_LIST = gg4Var32;
        gg4 gg4Var33 = new gg4(ZVsviyDAr.qAyNtXdIwCuF, 32, 32, eg4Var2, u96Var3);
        SFIXED64_LIST = gg4Var33;
        gg4 gg4Var34 = new gg4("SINT32_LIST", 33, 33, eg4Var2, u96Var4);
        SINT32_LIST = gg4Var34;
        gg4 gg4Var35 = new gg4("SINT64_LIST", 34, 34, eg4Var2, u96Var3);
        SINT64_LIST = gg4Var35;
        eg4 eg4Var3 = eg4.PACKED_VECTOR;
        gg4 gg4Var36 = new gg4("DOUBLE_LIST_PACKED", 35, 35, eg4Var3, u96Var);
        DOUBLE_LIST_PACKED = gg4Var36;
        gg4 gg4Var37 = new gg4("FLOAT_LIST_PACKED", 36, 36, eg4Var3, u96Var2);
        FLOAT_LIST_PACKED = gg4Var37;
        gg4 gg4Var38 = new gg4("INT64_LIST_PACKED", 37, 37, eg4Var3, u96Var3);
        INT64_LIST_PACKED = gg4Var38;
        gg4 gg4Var39 = new gg4("UINT64_LIST_PACKED", 38, 38, eg4Var3, u96Var3);
        UINT64_LIST_PACKED = gg4Var39;
        gg4 gg4Var40 = new gg4("INT32_LIST_PACKED", 39, 39, eg4Var3, u96Var4);
        INT32_LIST_PACKED = gg4Var40;
        gg4 gg4Var41 = new gg4("FIXED64_LIST_PACKED", 40, 40, eg4Var3, u96Var3);
        FIXED64_LIST_PACKED = gg4Var41;
        gg4 gg4Var42 = new gg4("FIXED32_LIST_PACKED", 41, 41, eg4Var3, u96Var4);
        FIXED32_LIST_PACKED = gg4Var42;
        gg4 gg4Var43 = new gg4("BOOL_LIST_PACKED", 42, 42, eg4Var3, u96Var5);
        BOOL_LIST_PACKED = gg4Var43;
        gg4 gg4Var44 = new gg4("UINT32_LIST_PACKED", 43, 43, eg4Var3, u96Var4);
        UINT32_LIST_PACKED = gg4Var44;
        gg4 gg4Var45 = new gg4("ENUM_LIST_PACKED", 44, 44, eg4Var3, u96Var9);
        ENUM_LIST_PACKED = gg4Var45;
        gg4 gg4Var46 = new gg4("SFIXED32_LIST_PACKED", 45, 45, eg4Var3, u96Var4);
        SFIXED32_LIST_PACKED = gg4Var46;
        gg4 gg4Var47 = new gg4("SFIXED64_LIST_PACKED", 46, 46, eg4Var3, u96Var3);
        SFIXED64_LIST_PACKED = gg4Var47;
        gg4 gg4Var48 = new gg4("SINT32_LIST_PACKED", 47, 47, eg4Var3, u96Var4);
        SINT32_LIST_PACKED = gg4Var48;
        gg4 gg4Var49 = new gg4("SINT64_LIST_PACKED", 48, 48, eg4Var3, u96Var3);
        SINT64_LIST_PACKED = gg4Var49;
        gg4 gg4Var50 = new gg4("GROUP_LIST", 49, 49, eg4Var2, u96Var7);
        GROUP_LIST = gg4Var50;
        gg4 gg4Var51 = new gg4("MAP", 50, 50, eg4.MAP, u96.VOID);
        MAP = gg4Var51;
        h = new gg4[]{gg4Var, gg4Var2, gg4Var3, gg4Var4, gg4Var5, gg4Var6, gg4Var7, gg4Var8, gg4Var9, gg4Var10, gg4Var11, gg4Var12, gg4Var13, gg4Var14, gg4Var15, gg4Var16, gg4Var17, gg4Var18, gg4Var19, gg4Var20, gg4Var21, gg4Var22, gg4Var23, gg4Var24, gg4Var25, gg4Var26, gg4Var27, gg4Var28, gg4Var29, gg4Var30, gg4Var31, gg4Var32, gg4Var33, gg4Var34, gg4Var35, gg4Var36, gg4Var37, gg4Var38, gg4Var39, gg4Var40, gg4Var41, gg4Var42, gg4Var43, gg4Var44, gg4Var45, gg4Var46, gg4Var47, gg4Var48, gg4Var49, gg4Var50, gg4Var51};
        g = new Type[0];
        gg4[] gg4VarArrValues = values();
        f = new gg4[gg4VarArrValues.length];
        for (gg4 gg4Var52 : gg4VarArrValues) {
            f[gg4Var52.b] = gg4Var52;
        }
    }
}
