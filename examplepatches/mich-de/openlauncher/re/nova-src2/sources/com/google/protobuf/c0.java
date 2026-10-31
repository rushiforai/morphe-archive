package com.google.protobuf;

import java.lang.reflect.Type;

/* JADX WARN: Enum visitor error
jadx.core.utils.exceptions.JadxRuntimeException: Init of enum field 'EF0' uses external variables
	at jadx.core.dex.visitors.EnumVisitor.createEnumFieldByConstructor(EnumVisitor.java:451)
	at jadx.core.dex.visitors.EnumVisitor.processEnumFieldByRegister(EnumVisitor.java:395)
	at jadx.core.dex.visitors.EnumVisitor.extractEnumFieldsFromFilledArray(EnumVisitor.java:324)
	at jadx.core.dex.visitors.EnumVisitor.extractEnumFieldsFromInsn(EnumVisitor.java:262)
	at jadx.core.dex.visitors.EnumVisitor.convertToEnum(EnumVisitor.java:151)
	at jadx.core.dex.visitors.EnumVisitor.visit(EnumVisitor.java:100)
 */
/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* loaded from: classes.dex */
public final class c0 {

    /* renamed from: b, reason: collision with root package name */
    public static final c0 f34825b;

    /* renamed from: c, reason: collision with root package name */
    public static final c0 f34826c;

    /* renamed from: d, reason: collision with root package name */
    public static final c0[] f34827d;

    /* renamed from: e, reason: collision with root package name */
    public static final Type[] f34828e;

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ c0[] f34829f;

    /* renamed from: a, reason: collision with root package name */
    public final int f34830a;

    /* JADX INFO: Fake field, exist only in values array */
    c0 EF0;

    static {
        b1 b1Var = b1.DOUBLE;
        c0 c0Var = new c0("DOUBLE", 0, 0, 1, b1Var);
        b1 b1Var2 = b1.FLOAT;
        c0 c0Var2 = new c0("FLOAT", 1, 1, 1, b1Var2);
        b1 b1Var3 = b1.LONG;
        c0 c0Var3 = new c0("INT64", 2, 2, 1, b1Var3);
        c0 c0Var4 = new c0("UINT64", 3, 3, 1, b1Var3);
        b1 b1Var4 = b1.INT;
        c0 c0Var5 = new c0("INT32", 4, 4, 1, b1Var4);
        c0 c0Var6 = new c0("FIXED64", 5, 5, 1, b1Var3);
        c0 c0Var7 = new c0("FIXED32", 6, 6, 1, b1Var4);
        b1 b1Var5 = b1.BOOLEAN;
        c0 c0Var8 = new c0("BOOL", 7, 7, 1, b1Var5);
        b1 b1Var6 = b1.STRING;
        c0 c0Var9 = new c0("STRING", 8, 8, 1, b1Var6);
        b1 b1Var7 = b1.MESSAGE;
        c0 c0Var10 = new c0("MESSAGE", 9, 9, 1, b1Var7);
        b1 b1Var8 = b1.BYTE_STRING;
        c0 c0Var11 = new c0("BYTES", 10, 10, 1, b1Var8);
        c0 c0Var12 = new c0("UINT32", 11, 11, 1, b1Var4);
        b1 b1Var9 = b1.ENUM;
        c0 c0Var13 = new c0("ENUM", 12, 12, 1, b1Var9);
        c0 c0Var14 = new c0("SFIXED32", 13, 13, 1, b1Var4);
        c0 c0Var15 = new c0("SFIXED64", 14, 14, 1, b1Var3);
        c0 c0Var16 = new c0("SINT32", 15, 15, 1, b1Var4);
        c0 c0Var17 = new c0("SINT64", 16, 16, 1, b1Var3);
        c0 c0Var18 = new c0("GROUP", 17, 17, 1, b1Var7);
        c0 c0Var19 = new c0("DOUBLE_LIST", 18, 18, 2, b1Var);
        c0 c0Var20 = new c0("FLOAT_LIST", 19, 19, 2, b1Var2);
        c0 c0Var21 = new c0("INT64_LIST", 20, 20, 2, b1Var3);
        c0 c0Var22 = new c0("UINT64_LIST", 21, 21, 2, b1Var3);
        c0 c0Var23 = new c0("INT32_LIST", 22, 22, 2, b1Var4);
        c0 c0Var24 = new c0("FIXED64_LIST", 23, 23, 2, b1Var3);
        c0 c0Var25 = new c0("FIXED32_LIST", 24, 24, 2, b1Var4);
        c0 c0Var26 = new c0("BOOL_LIST", 25, 25, 2, b1Var5);
        c0 c0Var27 = new c0("STRING_LIST", 26, 26, 2, b1Var6);
        c0 c0Var28 = new c0("MESSAGE_LIST", 27, 27, 2, b1Var7);
        c0 c0Var29 = new c0("BYTES_LIST", 28, 28, 2, b1Var8);
        c0 c0Var30 = new c0("UINT32_LIST", 29, 29, 2, b1Var4);
        c0 c0Var31 = new c0("ENUM_LIST", 30, 30, 2, b1Var9);
        c0 c0Var32 = new c0("SFIXED32_LIST", 31, 31, 2, b1Var4);
        c0 c0Var33 = new c0("SFIXED64_LIST", 32, 32, 2, b1Var3);
        c0 c0Var34 = new c0("SINT32_LIST", 33, 33, 2, b1Var4);
        c0 c0Var35 = new c0("SINT64_LIST", 34, 34, 2, b1Var3);
        c0 c0Var36 = new c0("DOUBLE_LIST_PACKED", 35, 35, 3, b1Var);
        f34825b = c0Var36;
        c0 c0Var37 = new c0("FLOAT_LIST_PACKED", 36, 36, 3, b1Var2);
        c0 c0Var38 = new c0("INT64_LIST_PACKED", 37, 37, 3, b1Var3);
        c0 c0Var39 = new c0("UINT64_LIST_PACKED", 38, 38, 3, b1Var3);
        c0 c0Var40 = new c0("INT32_LIST_PACKED", 39, 39, 3, b1Var4);
        c0 c0Var41 = new c0("FIXED64_LIST_PACKED", 40, 40, 3, b1Var3);
        c0 c0Var42 = new c0("FIXED32_LIST_PACKED", 41, 41, 3, b1Var4);
        c0 c0Var43 = new c0("BOOL_LIST_PACKED", 42, 42, 3, b1Var5);
        c0 c0Var44 = new c0("UINT32_LIST_PACKED", 43, 43, 3, b1Var4);
        c0 c0Var45 = new c0("ENUM_LIST_PACKED", 44, 44, 3, b1Var9);
        c0 c0Var46 = new c0("SFIXED32_LIST_PACKED", 45, 45, 3, b1Var4);
        c0 c0Var47 = new c0("SFIXED64_LIST_PACKED", 46, 46, 3, b1Var3);
        c0 c0Var48 = new c0("SINT32_LIST_PACKED", 47, 47, 3, b1Var4);
        c0 c0Var49 = new c0("SINT64_LIST_PACKED", 48, 48, 3, b1Var3);
        f34826c = c0Var49;
        f34829f = new c0[]{c0Var, c0Var2, c0Var3, c0Var4, c0Var5, c0Var6, c0Var7, c0Var8, c0Var9, c0Var10, c0Var11, c0Var12, c0Var13, c0Var14, c0Var15, c0Var16, c0Var17, c0Var18, c0Var19, c0Var20, c0Var21, c0Var22, c0Var23, c0Var24, c0Var25, c0Var26, c0Var27, c0Var28, c0Var29, c0Var30, c0Var31, c0Var32, c0Var33, c0Var34, c0Var35, c0Var36, c0Var37, c0Var38, c0Var39, c0Var40, c0Var41, c0Var42, c0Var43, c0Var44, c0Var45, c0Var46, c0Var47, c0Var48, c0Var49, new c0("GROUP_LIST", 49, 49, 2, b1Var7), new c0("MAP", 50, 50, 4, b1.VOID)};
        f34828e = new Type[0];
        c0[] c0VarArrValues = values();
        f34827d = new c0[c0VarArrValues.length];
        for (c0 c0Var50 : c0VarArrValues) {
            f34827d[c0Var50.f34830a] = c0Var50;
        }
    }

    public c0(String str, int i5, int i11, int i12, b1 b1Var) {
        this.f34830a = i11;
        int iF = b.c0.F(i12);
        if (iF == 1 || iF == 3) {
            b1Var.getClass();
        }
        if (i12 == 1) {
            b1Var.getClass();
        }
    }

    public static c0 valueOf(String str) {
        return (c0) Enum.valueOf(c0.class, str);
    }

    public static c0[] values() {
        return (c0[]) f34829f.clone();
    }
}
