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
public final class g3 {

    /* renamed from: c, reason: collision with root package name */
    public static final g3 f32555c;

    /* renamed from: d, reason: collision with root package name */
    public static final g3 f32556d;

    /* renamed from: e, reason: collision with root package name */
    public static final g3 f32557e;

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ g3[] f32558f;

    /* renamed from: a, reason: collision with root package name */
    public final h3 f32559a;

    /* renamed from: b, reason: collision with root package name */
    public final int f32560b;

    /* JADX INFO: Fake field, exist only in values array */
    g3 EF1;

    /* JADX INFO: Fake field, exist only in values array */
    g3 EF2;

    /* JADX INFO: Fake field, exist only in values array */
    g3 EF0;

    static {
        g3 g3Var = new g3("DOUBLE", 0, h3.f32595d, 1);
        g3 g3Var2 = new g3("FLOAT", 1, h3.f32594c, 5);
        h3 h3Var = h3.f32593b;
        g3 g3Var3 = new g3("INT64", 2, h3Var, 0);
        g3 g3Var4 = new g3("UINT64", 3, h3Var, 0);
        h3 h3Var2 = h3.f32592a;
        g3 g3Var5 = new g3("INT32", 4, h3Var2, 0);
        g3 g3Var6 = new g3("FIXED64", 5, h3Var, 1);
        g3 g3Var7 = new g3("FIXED32", 6, h3Var2, 5);
        g3 g3Var8 = new g3("BOOL", 7, h3.f32596e, 0);
        g3 g3Var9 = new g3("STRING", 8, h3.f32597f, 2);
        f32555c = g3Var9;
        h3 h3Var3 = h3.f32600i;
        g3 g3Var10 = new g3("GROUP", 9, h3Var3, 3);
        f32556d = g3Var10;
        g3 g3Var11 = new g3("MESSAGE", 10, h3Var3, 2);
        f32557e = g3Var11;
        f32558f = new g3[]{g3Var, g3Var2, g3Var3, g3Var4, g3Var5, g3Var6, g3Var7, g3Var8, g3Var9, g3Var10, g3Var11, new g3("BYTES", 11, h3.f32598g, 2), new g3("UINT32", 12, h3Var2, 0), new g3("ENUM", 13, h3.f32599h, 0), new g3("SFIXED32", 14, h3Var2, 5), new g3("SFIXED64", 15, h3Var, 1), new g3("SINT32", 16, h3Var2, 0), new g3("SINT64", 17, h3Var, 0)};
    }

    public g3(String str, int i5, h3 h3Var, int i11) {
        this.f32559a = h3Var;
        this.f32560b = i11;
    }

    public static g3[] values() {
        return (g3[]) f32558f.clone();
    }
}
