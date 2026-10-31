package com.google.android.gms.internal.consent_sdk;

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
public final class t5 {

    /* renamed from: b, reason: collision with root package name */
    public static final t5 f32245b;

    /* renamed from: c, reason: collision with root package name */
    public static final t5 f32246c;

    /* renamed from: d, reason: collision with root package name */
    public static final t5[] f32247d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ t5[] f32248e;

    /* renamed from: a, reason: collision with root package name */
    public final int f32249a;

    /* JADX INFO: Fake field, exist only in values array */
    t5 EF0;

    static {
        c6 c6Var = c6.f32018e;
        t5 t5Var = new t5("DOUBLE", 0, 0, 1, c6Var);
        c6 c6Var2 = c6.f32017d;
        t5 t5Var2 = new t5("FLOAT", 1, 1, 1, c6Var2);
        c6 c6Var3 = c6.f32016c;
        t5 t5Var3 = new t5("INT64", 2, 2, 1, c6Var3);
        t5 t5Var4 = new t5("UINT64", 3, 3, 1, c6Var3);
        c6 c6Var4 = c6.f32015b;
        t5 t5Var5 = new t5("INT32", 4, 4, 1, c6Var4);
        t5 t5Var6 = new t5("FIXED64", 5, 5, 1, c6Var3);
        t5 t5Var7 = new t5("FIXED32", 6, 6, 1, c6Var4);
        c6 c6Var5 = c6.f32019f;
        t5 t5Var8 = new t5("BOOL", 7, 7, 1, c6Var5);
        c6 c6Var6 = c6.f32020g;
        t5 t5Var9 = new t5("STRING", 8, 8, 1, c6Var6);
        c6 c6Var7 = c6.f32023j;
        t5 t5Var10 = new t5("MESSAGE", 9, 9, 1, c6Var7);
        c6 c6Var8 = c6.f32021h;
        t5 t5Var11 = new t5("BYTES", 10, 10, 1, c6Var8);
        t5 t5Var12 = new t5("UINT32", 11, 11, 1, c6Var4);
        c6 c6Var9 = c6.f32022i;
        t5 t5Var13 = new t5("ENUM", 12, 12, 1, c6Var9);
        t5 t5Var14 = new t5("SFIXED32", 13, 13, 1, c6Var4);
        t5 t5Var15 = new t5("SFIXED64", 14, 14, 1, c6Var3);
        t5 t5Var16 = new t5("SINT32", 15, 15, 1, c6Var4);
        t5 t5Var17 = new t5("SINT64", 16, 16, 1, c6Var3);
        t5 t5Var18 = new t5("GROUP", 17, 17, 1, c6Var7);
        t5 t5Var19 = new t5("DOUBLE_LIST", 18, 18, 2, c6Var);
        t5 t5Var20 = new t5("FLOAT_LIST", 19, 19, 2, c6Var2);
        t5 t5Var21 = new t5("INT64_LIST", 20, 20, 2, c6Var3);
        t5 t5Var22 = new t5("UINT64_LIST", 21, 21, 2, c6Var3);
        t5 t5Var23 = new t5("INT32_LIST", 22, 22, 2, c6Var4);
        t5 t5Var24 = new t5("FIXED64_LIST", 23, 23, 2, c6Var3);
        t5 t5Var25 = new t5("FIXED32_LIST", 24, 24, 2, c6Var4);
        t5 t5Var26 = new t5("BOOL_LIST", 25, 25, 2, c6Var5);
        t5 t5Var27 = new t5("STRING_LIST", 26, 26, 2, c6Var6);
        t5 t5Var28 = new t5("MESSAGE_LIST", 27, 27, 2, c6Var7);
        t5 t5Var29 = new t5("BYTES_LIST", 28, 28, 2, c6Var8);
        t5 t5Var30 = new t5("UINT32_LIST", 29, 29, 2, c6Var4);
        t5 t5Var31 = new t5("ENUM_LIST", 30, 30, 2, c6Var9);
        t5 t5Var32 = new t5("SFIXED32_LIST", 31, 31, 2, c6Var4);
        t5 t5Var33 = new t5("SFIXED64_LIST", 32, 32, 2, c6Var3);
        t5 t5Var34 = new t5("SINT32_LIST", 33, 33, 2, c6Var4);
        t5 t5Var35 = new t5("SINT64_LIST", 34, 34, 2, c6Var3);
        t5 t5Var36 = new t5("DOUBLE_LIST_PACKED", 35, 35, 3, c6Var);
        f32245b = t5Var36;
        t5 t5Var37 = new t5("FLOAT_LIST_PACKED", 36, 36, 3, c6Var2);
        t5 t5Var38 = new t5("INT64_LIST_PACKED", 37, 37, 3, c6Var3);
        t5 t5Var39 = new t5("UINT64_LIST_PACKED", 38, 38, 3, c6Var3);
        t5 t5Var40 = new t5("INT32_LIST_PACKED", 39, 39, 3, c6Var4);
        t5 t5Var41 = new t5("FIXED64_LIST_PACKED", 40, 40, 3, c6Var3);
        t5 t5Var42 = new t5("FIXED32_LIST_PACKED", 41, 41, 3, c6Var4);
        t5 t5Var43 = new t5("BOOL_LIST_PACKED", 42, 42, 3, c6Var5);
        t5 t5Var44 = new t5("UINT32_LIST_PACKED", 43, 43, 3, c6Var4);
        t5 t5Var45 = new t5("ENUM_LIST_PACKED", 44, 44, 3, c6Var9);
        t5 t5Var46 = new t5("SFIXED32_LIST_PACKED", 45, 45, 3, c6Var4);
        t5 t5Var47 = new t5("SFIXED64_LIST_PACKED", 46, 46, 3, c6Var3);
        t5 t5Var48 = new t5("SINT32_LIST_PACKED", 47, 47, 3, c6Var4);
        t5 t5Var49 = new t5("SINT64_LIST_PACKED", 48, 48, 3, c6Var3);
        f32246c = t5Var49;
        f32248e = new t5[]{t5Var, t5Var2, t5Var3, t5Var4, t5Var5, t5Var6, t5Var7, t5Var8, t5Var9, t5Var10, t5Var11, t5Var12, t5Var13, t5Var14, t5Var15, t5Var16, t5Var17, t5Var18, t5Var19, t5Var20, t5Var21, t5Var22, t5Var23, t5Var24, t5Var25, t5Var26, t5Var27, t5Var28, t5Var29, t5Var30, t5Var31, t5Var32, t5Var33, t5Var34, t5Var35, t5Var36, t5Var37, t5Var38, t5Var39, t5Var40, t5Var41, t5Var42, t5Var43, t5Var44, t5Var45, t5Var46, t5Var47, t5Var48, t5Var49, new t5("GROUP_LIST", 49, 49, 2, c6Var7), new t5("MAP", 50, 50, 4, c6.f32014a)};
        t5[] t5VarArrValues = values();
        f32247d = new t5[t5VarArrValues.length];
        for (t5 t5Var50 : t5VarArrValues) {
            f32247d[t5Var50.f32249a] = t5Var50;
        }
    }

    public t5(String str, int i5, int i11, int i12, c6 c6Var) {
        this.f32249a = i11;
        int i13 = i12 - 1;
        if (i13 == 1 || i13 == 3) {
            c6Var.getClass();
        }
        if (i12 == 1) {
            c6 c6Var2 = c6.f32014a;
            c6Var.getClass();
        }
    }

    public static t5[] values() {
        return (t5[]) f32248e.clone();
    }
}
