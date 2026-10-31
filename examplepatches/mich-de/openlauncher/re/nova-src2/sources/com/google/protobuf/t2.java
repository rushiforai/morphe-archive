package com.google.protobuf;

/* JADX WARN: Enum visitor error
jadx.core.utils.exceptions.JadxRuntimeException: Init of enum field 'EF2' uses external variables
	at jadx.core.dex.visitors.EnumVisitor.createEnumFieldByConstructor(EnumVisitor.java:451)
	at jadx.core.dex.visitors.EnumVisitor.processEnumFieldByRegister(EnumVisitor.java:395)
	at jadx.core.dex.visitors.EnumVisitor.extractEnumFieldsFromFilledArray(EnumVisitor.java:324)
	at jadx.core.dex.visitors.EnumVisitor.extractEnumFieldsFromInsn(EnumVisitor.java:262)
	at jadx.core.dex.visitors.EnumVisitor.convertToEnum(EnumVisitor.java:151)
	at jadx.core.dex.visitors.EnumVisitor.visit(EnumVisitor.java:100)
 */
/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* loaded from: classes3.dex */
public class t2 {

    /* renamed from: c, reason: collision with root package name */
    public static final p2 f34973c;

    /* renamed from: d, reason: collision with root package name */
    public static final q2 f34974d;

    /* renamed from: e, reason: collision with root package name */
    public static final r2 f34975e;

    /* renamed from: f, reason: collision with root package name */
    public static final t2 f34976f;

    /* renamed from: g, reason: collision with root package name */
    public static final /* synthetic */ t2[] f34977g;

    /* renamed from: a, reason: collision with root package name */
    public final u2 f34978a;

    /* renamed from: b, reason: collision with root package name */
    public final int f34979b;

    /* JADX INFO: Fake field, exist only in values array */
    t2 EF0;

    /* JADX INFO: Fake field, exist only in values array */
    t2 EF1;

    /* JADX INFO: Fake field, exist only in values array */
    t2 EF2;

    static {
        t2 t2Var = new t2("DOUBLE", 0, u2.DOUBLE, 1);
        t2 t2Var2 = new t2("FLOAT", 1, u2.FLOAT, 5);
        u2 u2Var = u2.LONG;
        t2 t2Var3 = new t2("INT64", 2, u2Var, 0);
        t2 t2Var4 = new t2("UINT64", 3, u2Var, 0);
        u2 u2Var2 = u2.INT;
        t2 t2Var5 = new t2("INT32", 4, u2Var2, 0);
        t2 t2Var6 = new t2("FIXED64", 5, u2Var, 1);
        t2 t2Var7 = new t2("FIXED32", 6, u2Var2, 5);
        t2 t2Var8 = new t2("BOOL", 7, u2.BOOLEAN, 0);
        p2 p2Var = new p2("STRING", 8, u2.STRING, 2);
        f34973c = p2Var;
        u2 u2Var3 = u2.MESSAGE;
        q2 q2Var = new q2("GROUP", 9, u2Var3, 3);
        f34974d = q2Var;
        r2 r2Var = new r2("MESSAGE", 10, u2Var3, 2);
        f34975e = r2Var;
        s2 s2Var = new s2("BYTES", 11, u2.BYTE_STRING, 2);
        t2 t2Var9 = new t2("UINT32", 12, u2Var2, 0);
        t2 t2Var10 = new t2("ENUM", 13, u2.ENUM, 0);
        f34976f = t2Var10;
        f34977g = new t2[]{t2Var, t2Var2, t2Var3, t2Var4, t2Var5, t2Var6, t2Var7, t2Var8, p2Var, q2Var, r2Var, s2Var, t2Var9, t2Var10, new t2("SFIXED32", 14, u2Var2, 5), new t2("SFIXED64", 15, u2Var, 1), new t2("SINT32", 16, u2Var2, 0), new t2("SINT64", 17, u2Var, 0)};
    }

    public t2(String str, int i5, u2 u2Var, int i11) {
        this.f34978a = u2Var;
        this.f34979b = i11;
    }

    public static t2 valueOf(String str) {
        return (t2) Enum.valueOf(t2.class, str);
    }

    public static t2[] values() {
        return (t2[]) f34977g.clone();
    }

    public final u2 a() {
        return this.f34978a;
    }

    public final int b() {
        return this.f34979b;
    }

    public boolean c() {
        return !(this instanceof p2);
    }
}
