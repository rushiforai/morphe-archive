package com.google.android.gms.internal.consent_sdk;

/* JADX WARN: Enum visitor error
jadx.core.utils.exceptions.JadxRuntimeException: Init of enum field 'c' uses external variables
	at jadx.core.dex.visitors.EnumVisitor.createEnumFieldByConstructor(EnumVisitor.java:451)
	at jadx.core.dex.visitors.EnumVisitor.processEnumFieldByRegister(EnumVisitor.java:395)
	at jadx.core.dex.visitors.EnumVisitor.extractEnumFieldsFromFilledArray(EnumVisitor.java:324)
	at jadx.core.dex.visitors.EnumVisitor.extractEnumFieldsFromInsn(EnumVisitor.java:262)
	at jadx.core.dex.visitors.EnumVisitor.convertToEnum(EnumVisitor.java:151)
	at jadx.core.dex.visitors.EnumVisitor.visit(EnumVisitor.java:100)
 */
/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* loaded from: classes3.dex */
public final class h7 {

    /* renamed from: c, reason: collision with root package name */
    public static final h7 f32090c;

    /* renamed from: d, reason: collision with root package name */
    public static final h7 f32091d;

    /* renamed from: e, reason: collision with root package name */
    public static final h7 f32092e;

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ h7[] f32093f;

    /* renamed from: a, reason: collision with root package name */
    public final i7 f32094a;

    /* renamed from: b, reason: collision with root package name */
    public final int f32095b;

    /* JADX INFO: Fake field, exist only in values array */
    h7 EF1;

    /* JADX INFO: Fake field, exist only in values array */
    h7 EF2;

    static {
        h7 h7Var = new h7("DOUBLE", 0, i7.f32104d, 1);
        h7 h7Var2 = new h7("FLOAT", 1, i7.f32103c, 5);
        i7 i7Var = i7.f32102b;
        h7 h7Var3 = new h7("INT64", 2, i7Var, 0);
        f32090c = h7Var3;
        h7 h7Var4 = new h7("UINT64", 3, i7Var, 0);
        i7 i7Var2 = i7.f32101a;
        h7 h7Var5 = new h7("INT32", 4, i7Var2, 0);
        h7 h7Var6 = new h7("FIXED64", 5, i7Var, 1);
        h7 h7Var7 = new h7("FIXED32", 6, i7Var2, 5);
        h7 h7Var8 = new h7("BOOL", 7, i7.f32105e, 0);
        h7 h7Var9 = new h7("STRING", 8, i7.f32106f, 2);
        f32091d = h7Var9;
        i7 i7Var3 = i7.f32109i;
        h7 h7Var10 = new h7("GROUP", 9, i7Var3, 3);
        f32092e = h7Var10;
        f32093f = new h7[]{h7Var, h7Var2, h7Var3, h7Var4, h7Var5, h7Var6, h7Var7, h7Var8, h7Var9, h7Var10, new h7("MESSAGE", 10, i7Var3, 2), new h7("BYTES", 11, i7.f32107g, 2), new h7("UINT32", 12, i7Var2, 0), new h7("ENUM", 13, i7.f32108h, 0), new h7("SFIXED32", 14, i7Var2, 5), new h7("SFIXED64", 15, i7Var, 1), new h7("SINT32", 16, i7Var2, 0), new h7("SINT64", 17, i7Var, 0)};
    }

    public h7(String str, int i5, i7 i7Var, int i11) {
        this.f32094a = i7Var;
        this.f32095b = i11;
    }

    public static h7[] values() {
        return (h7[]) f32093f.clone();
    }
}
