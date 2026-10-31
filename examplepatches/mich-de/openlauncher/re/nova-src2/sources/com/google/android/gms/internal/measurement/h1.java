package com.google.android.gms.internal.measurement;

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
public final class h1 {

    /* renamed from: b, reason: collision with root package name */
    public static final h1 f32586b;

    /* renamed from: c, reason: collision with root package name */
    public static final h1 f32587c;

    /* renamed from: d, reason: collision with root package name */
    public static final h1[] f32588d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ h1[] f32589e;

    /* renamed from: a, reason: collision with root package name */
    public final int f32590a;

    /* JADX INFO: Fake field, exist only in values array */
    h1 EF0;

    static {
        z1 z1Var = z1.f33278e;
        h1 h1Var = new h1("DOUBLE", 0, 0, 1, z1Var);
        z1 z1Var2 = z1.f33277d;
        h1 h1Var2 = new h1("FLOAT", 1, 1, 1, z1Var2);
        z1 z1Var3 = z1.f33276c;
        h1 h1Var3 = new h1("INT64", 2, 2, 1, z1Var3);
        h1 h1Var4 = new h1("UINT64", 3, 3, 1, z1Var3);
        z1 z1Var4 = z1.f33275b;
        h1 h1Var5 = new h1("INT32", 4, 4, 1, z1Var4);
        h1 h1Var6 = new h1("FIXED64", 5, 5, 1, z1Var3);
        h1 h1Var7 = new h1("FIXED32", 6, 6, 1, z1Var4);
        z1 z1Var5 = z1.f33279f;
        h1 h1Var8 = new h1("BOOL", 7, 7, 1, z1Var5);
        z1 z1Var6 = z1.f33280g;
        h1 h1Var9 = new h1("STRING", 8, 8, 1, z1Var6);
        z1 z1Var7 = z1.f33283j;
        h1 h1Var10 = new h1("MESSAGE", 9, 9, 1, z1Var7);
        z1 z1Var8 = z1.f33281h;
        h1 h1Var11 = new h1("BYTES", 10, 10, 1, z1Var8);
        h1 h1Var12 = new h1("UINT32", 11, 11, 1, z1Var4);
        z1 z1Var9 = z1.f33282i;
        h1 h1Var13 = new h1("ENUM", 12, 12, 1, z1Var9);
        h1 h1Var14 = new h1("SFIXED32", 13, 13, 1, z1Var4);
        h1 h1Var15 = new h1("SFIXED64", 14, 14, 1, z1Var3);
        h1 h1Var16 = new h1("SINT32", 15, 15, 1, z1Var4);
        h1 h1Var17 = new h1("SINT64", 16, 16, 1, z1Var3);
        h1 h1Var18 = new h1("GROUP", 17, 17, 1, z1Var7);
        h1 h1Var19 = new h1("DOUBLE_LIST", 18, 18, 2, z1Var);
        h1 h1Var20 = new h1("FLOAT_LIST", 19, 19, 2, z1Var2);
        h1 h1Var21 = new h1("INT64_LIST", 20, 20, 2, z1Var3);
        h1 h1Var22 = new h1("UINT64_LIST", 21, 21, 2, z1Var3);
        h1 h1Var23 = new h1("INT32_LIST", 22, 22, 2, z1Var4);
        h1 h1Var24 = new h1("FIXED64_LIST", 23, 23, 2, z1Var3);
        h1 h1Var25 = new h1("FIXED32_LIST", 24, 24, 2, z1Var4);
        h1 h1Var26 = new h1("BOOL_LIST", 25, 25, 2, z1Var5);
        h1 h1Var27 = new h1("STRING_LIST", 26, 26, 2, z1Var6);
        h1 h1Var28 = new h1("MESSAGE_LIST", 27, 27, 2, z1Var7);
        h1 h1Var29 = new h1("BYTES_LIST", 28, 28, 2, z1Var8);
        h1 h1Var30 = new h1("UINT32_LIST", 29, 29, 2, z1Var4);
        h1 h1Var31 = new h1("ENUM_LIST", 30, 30, 2, z1Var9);
        h1 h1Var32 = new h1("SFIXED32_LIST", 31, 31, 2, z1Var4);
        h1 h1Var33 = new h1("SFIXED64_LIST", 32, 32, 2, z1Var3);
        h1 h1Var34 = new h1("SINT32_LIST", 33, 33, 2, z1Var4);
        h1 h1Var35 = new h1("SINT64_LIST", 34, 34, 2, z1Var3);
        h1 h1Var36 = new h1("DOUBLE_LIST_PACKED", 35, 35, 3, z1Var);
        f32586b = h1Var36;
        h1 h1Var37 = new h1("FLOAT_LIST_PACKED", 36, 36, 3, z1Var2);
        h1 h1Var38 = new h1("INT64_LIST_PACKED", 37, 37, 3, z1Var3);
        h1 h1Var39 = new h1("UINT64_LIST_PACKED", 38, 38, 3, z1Var3);
        h1 h1Var40 = new h1("INT32_LIST_PACKED", 39, 39, 3, z1Var4);
        h1 h1Var41 = new h1("FIXED64_LIST_PACKED", 40, 40, 3, z1Var3);
        h1 h1Var42 = new h1("FIXED32_LIST_PACKED", 41, 41, 3, z1Var4);
        h1 h1Var43 = new h1("BOOL_LIST_PACKED", 42, 42, 3, z1Var5);
        h1 h1Var44 = new h1("UINT32_LIST_PACKED", 43, 43, 3, z1Var4);
        h1 h1Var45 = new h1("ENUM_LIST_PACKED", 44, 44, 3, z1Var9);
        h1 h1Var46 = new h1("SFIXED32_LIST_PACKED", 45, 45, 3, z1Var4);
        h1 h1Var47 = new h1("SFIXED64_LIST_PACKED", 46, 46, 3, z1Var3);
        h1 h1Var48 = new h1("SINT32_LIST_PACKED", 47, 47, 3, z1Var4);
        h1 h1Var49 = new h1("SINT64_LIST_PACKED", 48, 48, 3, z1Var3);
        f32587c = h1Var49;
        f32589e = new h1[]{h1Var, h1Var2, h1Var3, h1Var4, h1Var5, h1Var6, h1Var7, h1Var8, h1Var9, h1Var10, h1Var11, h1Var12, h1Var13, h1Var14, h1Var15, h1Var16, h1Var17, h1Var18, h1Var19, h1Var20, h1Var21, h1Var22, h1Var23, h1Var24, h1Var25, h1Var26, h1Var27, h1Var28, h1Var29, h1Var30, h1Var31, h1Var32, h1Var33, h1Var34, h1Var35, h1Var36, h1Var37, h1Var38, h1Var39, h1Var40, h1Var41, h1Var42, h1Var43, h1Var44, h1Var45, h1Var46, h1Var47, h1Var48, h1Var49, new h1("GROUP_LIST", 49, 49, 2, z1Var7), new h1("MAP", 50, 50, 4, z1.f33274a)};
        h1[] h1VarArrValues = values();
        f32588d = new h1[h1VarArrValues.length];
        for (h1 h1Var50 : h1VarArrValues) {
            f32588d[h1Var50.f32590a] = h1Var50;
        }
    }

    public h1(String str, int i5, int i11, int i12, z1 z1Var) {
        this.f32590a = i11;
        int i13 = i12 - 1;
        if (i13 == 1 || i13 == 3) {
            z1Var.getClass();
        }
        if (i12 == 1) {
            z1 z1Var2 = z1.f33274a;
            z1Var.getClass();
        }
    }

    public static h1[] values() {
        return (h1[]) f32589e.clone();
    }
}
