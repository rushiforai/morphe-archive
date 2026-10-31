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
public final class o4 {

    /* renamed from: c, reason: collision with root package name */
    public static final o4 f33469c;

    /* renamed from: d, reason: collision with root package name */
    public static final o4 f33470d;

    /* renamed from: e, reason: collision with root package name */
    public static final o4 f33471e;

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ o4[] f33472f;

    /* renamed from: a, reason: collision with root package name */
    public final p4 f33473a;

    /* renamed from: b, reason: collision with root package name */
    public final int f33474b;

    /* JADX INFO: Fake field, exist only in values array */
    o4 EF1;

    /* JADX INFO: Fake field, exist only in values array */
    o4 EF2;

    /* JADX INFO: Fake field, exist only in values array */
    o4 EF0;

    static {
        o4 o4Var = new o4("DOUBLE", 0, p4.f33484d, 1);
        o4 o4Var2 = new o4("FLOAT", 1, p4.f33483c, 5);
        p4 p4Var = p4.f33482b;
        o4 o4Var3 = new o4("INT64", 2, p4Var, 0);
        o4 o4Var4 = new o4("UINT64", 3, p4Var, 0);
        p4 p4Var2 = p4.f33481a;
        o4 o4Var5 = new o4("INT32", 4, p4Var2, 0);
        o4 o4Var6 = new o4("FIXED64", 5, p4Var, 1);
        o4 o4Var7 = new o4("FIXED32", 6, p4Var2, 5);
        o4 o4Var8 = new o4("BOOL", 7, p4.f33485e, 0);
        o4 o4Var9 = new o4("STRING", 8, p4.f33486f, 2);
        f33469c = o4Var9;
        p4 p4Var3 = p4.f33489i;
        o4 o4Var10 = new o4("GROUP", 9, p4Var3, 3);
        f33470d = o4Var10;
        o4 o4Var11 = new o4("MESSAGE", 10, p4Var3, 2);
        f33471e = o4Var11;
        f33472f = new o4[]{o4Var, o4Var2, o4Var3, o4Var4, o4Var5, o4Var6, o4Var7, o4Var8, o4Var9, o4Var10, o4Var11, new o4("BYTES", 11, p4.f33487g, 2), new o4("UINT32", 12, p4Var2, 0), new o4("ENUM", 13, p4.f33488h, 0), new o4("SFIXED32", 14, p4Var2, 5), new o4("SFIXED64", 15, p4Var, 1), new o4("SINT32", 16, p4Var2, 0), new o4("SINT64", 17, p4Var, 0)};
    }

    public o4(String str, int i5, p4 p4Var, int i11) {
        this.f33473a = p4Var;
        this.f33474b = i11;
    }

    public static o4[] values() {
        return (o4[]) f33472f.clone();
    }
}
