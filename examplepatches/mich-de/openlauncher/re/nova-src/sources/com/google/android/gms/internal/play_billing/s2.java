package com.google.android.gms.internal.play_billing;

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
/* loaded from: classes3.dex */
public final class s2 {

    /* renamed from: b, reason: collision with root package name */
    public static final s2 f33517b;

    /* renamed from: c, reason: collision with root package name */
    public static final s2 f33518c;

    /* renamed from: d, reason: collision with root package name */
    public static final s2[] f33519d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ s2[] f33520e;

    /* renamed from: a, reason: collision with root package name */
    public final int f33521a;

    /* JADX INFO: Fake field, exist only in values array */
    s2 EF0;

    static {
        f3 f3Var = f3.f33406e;
        s2 s2Var = new s2("DOUBLE", 0, 0, 1, f3Var);
        f3 f3Var2 = f3.f33405d;
        s2 s2Var2 = new s2("FLOAT", 1, 1, 1, f3Var2);
        f3 f3Var3 = f3.f33404c;
        s2 s2Var3 = new s2("INT64", 2, 2, 1, f3Var3);
        s2 s2Var4 = new s2("UINT64", 3, 3, 1, f3Var3);
        f3 f3Var4 = f3.f33403b;
        s2 s2Var5 = new s2("INT32", 4, 4, 1, f3Var4);
        s2 s2Var6 = new s2("FIXED64", 5, 5, 1, f3Var3);
        s2 s2Var7 = new s2("FIXED32", 6, 6, 1, f3Var4);
        f3 f3Var5 = f3.f33407f;
        s2 s2Var8 = new s2("BOOL", 7, 7, 1, f3Var5);
        f3 f3Var6 = f3.f33408g;
        s2 s2Var9 = new s2("STRING", 8, 8, 1, f3Var6);
        f3 f3Var7 = f3.f33411j;
        s2 s2Var10 = new s2("MESSAGE", 9, 9, 1, f3Var7);
        f3 f3Var8 = f3.f33409h;
        s2 s2Var11 = new s2("BYTES", 10, 10, 1, f3Var8);
        s2 s2Var12 = new s2("UINT32", 11, 11, 1, f3Var4);
        f3 f3Var9 = f3.f33410i;
        s2 s2Var13 = new s2("ENUM", 12, 12, 1, f3Var9);
        s2 s2Var14 = new s2("SFIXED32", 13, 13, 1, f3Var4);
        s2 s2Var15 = new s2("SFIXED64", 14, 14, 1, f3Var3);
        s2 s2Var16 = new s2("SINT32", 15, 15, 1, f3Var4);
        s2 s2Var17 = new s2("SINT64", 16, 16, 1, f3Var3);
        s2 s2Var18 = new s2("GROUP", 17, 17, 1, f3Var7);
        s2 s2Var19 = new s2("DOUBLE_LIST", 18, 18, 2, f3Var);
        s2 s2Var20 = new s2("FLOAT_LIST", 19, 19, 2, f3Var2);
        s2 s2Var21 = new s2("INT64_LIST", 20, 20, 2, f3Var3);
        s2 s2Var22 = new s2("UINT64_LIST", 21, 21, 2, f3Var3);
        s2 s2Var23 = new s2("INT32_LIST", 22, 22, 2, f3Var4);
        s2 s2Var24 = new s2("FIXED64_LIST", 23, 23, 2, f3Var3);
        s2 s2Var25 = new s2("FIXED32_LIST", 24, 24, 2, f3Var4);
        s2 s2Var26 = new s2("BOOL_LIST", 25, 25, 2, f3Var5);
        s2 s2Var27 = new s2("STRING_LIST", 26, 26, 2, f3Var6);
        s2 s2Var28 = new s2("MESSAGE_LIST", 27, 27, 2, f3Var7);
        s2 s2Var29 = new s2("BYTES_LIST", 28, 28, 2, f3Var8);
        s2 s2Var30 = new s2("UINT32_LIST", 29, 29, 2, f3Var4);
        s2 s2Var31 = new s2("ENUM_LIST", 30, 30, 2, f3Var9);
        s2 s2Var32 = new s2("SFIXED32_LIST", 31, 31, 2, f3Var4);
        s2 s2Var33 = new s2("SFIXED64_LIST", 32, 32, 2, f3Var3);
        s2 s2Var34 = new s2("SINT32_LIST", 33, 33, 2, f3Var4);
        s2 s2Var35 = new s2("SINT64_LIST", 34, 34, 2, f3Var3);
        s2 s2Var36 = new s2("DOUBLE_LIST_PACKED", 35, 35, 3, f3Var);
        f33517b = s2Var36;
        s2 s2Var37 = new s2("FLOAT_LIST_PACKED", 36, 36, 3, f3Var2);
        s2 s2Var38 = new s2("INT64_LIST_PACKED", 37, 37, 3, f3Var3);
        s2 s2Var39 = new s2("UINT64_LIST_PACKED", 38, 38, 3, f3Var3);
        s2 s2Var40 = new s2("INT32_LIST_PACKED", 39, 39, 3, f3Var4);
        s2 s2Var41 = new s2("FIXED64_LIST_PACKED", 40, 40, 3, f3Var3);
        s2 s2Var42 = new s2("FIXED32_LIST_PACKED", 41, 41, 3, f3Var4);
        s2 s2Var43 = new s2("BOOL_LIST_PACKED", 42, 42, 3, f3Var5);
        s2 s2Var44 = new s2("UINT32_LIST_PACKED", 43, 43, 3, f3Var4);
        s2 s2Var45 = new s2("ENUM_LIST_PACKED", 44, 44, 3, f3Var9);
        s2 s2Var46 = new s2("SFIXED32_LIST_PACKED", 45, 45, 3, f3Var4);
        s2 s2Var47 = new s2("SFIXED64_LIST_PACKED", 46, 46, 3, f3Var3);
        s2 s2Var48 = new s2("SINT32_LIST_PACKED", 47, 47, 3, f3Var4);
        s2 s2Var49 = new s2("SINT64_LIST_PACKED", 48, 48, 3, f3Var3);
        f33518c = s2Var49;
        f33520e = new s2[]{s2Var, s2Var2, s2Var3, s2Var4, s2Var5, s2Var6, s2Var7, s2Var8, s2Var9, s2Var10, s2Var11, s2Var12, s2Var13, s2Var14, s2Var15, s2Var16, s2Var17, s2Var18, s2Var19, s2Var20, s2Var21, s2Var22, s2Var23, s2Var24, s2Var25, s2Var26, s2Var27, s2Var28, s2Var29, s2Var30, s2Var31, s2Var32, s2Var33, s2Var34, s2Var35, s2Var36, s2Var37, s2Var38, s2Var39, s2Var40, s2Var41, s2Var42, s2Var43, s2Var44, s2Var45, s2Var46, s2Var47, s2Var48, s2Var49, new s2("GROUP_LIST", 49, 49, 2, f3Var7), new s2("MAP", 50, 50, 4, f3.f33402a)};
        s2[] s2VarArrValues = values();
        f33519d = new s2[s2VarArrValues.length];
        for (s2 s2Var50 : s2VarArrValues) {
            f33519d[s2Var50.f33521a] = s2Var50;
        }
    }

    public s2(String str, int i5, int i11, int i12, f3 f3Var) {
        this.f33521a = i11;
        int i13 = i12 - 1;
        if (i13 == 1 || i13 == 3) {
            f3Var.getClass();
        }
        if (i12 == 1) {
            f3 f3Var2 = f3.f33402a;
            f3Var.getClass();
        }
    }

    public static s2[] values() {
        return (s2[]) f33520e.clone();
    }
}
