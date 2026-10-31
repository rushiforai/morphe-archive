package ads_mobile_sdk;

import b.n0;
import b.n2;
import b.q1;

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
/* loaded from: classes2.dex */
public class ft3 {

    /* renamed from: c, reason: collision with root package name */
    public static final ft3 f3518c;

    /* renamed from: d, reason: collision with root package name */
    public static final n0 f3519d;

    /* renamed from: e, reason: collision with root package name */
    public static final b.z0 f3520e;

    /* renamed from: f, reason: collision with root package name */
    public static final q1 f3521f;

    /* renamed from: g, reason: collision with root package name */
    public static final /* synthetic */ ft3[] f3522g;

    /* renamed from: a, reason: collision with root package name */
    public final gt3 f3523a;

    /* renamed from: b, reason: collision with root package name */
    public final int f3524b;

    /* JADX INFO: Fake field, exist only in values array */
    ft3 EF0;

    /* JADX INFO: Fake field, exist only in values array */
    ft3 EF1;

    /* JADX INFO: Fake field, exist only in values array */
    ft3 EF2;

    static {
        ft3 ft3Var = new ft3("DOUBLE", 0, gt3.f4071e, 1);
        ft3 ft3Var2 = new ft3("FLOAT", 1, gt3.f4070d, 5);
        gt3 gt3Var = gt3.f4069c;
        ft3 ft3Var3 = new ft3("INT64", 2, gt3Var, 0);
        ft3 ft3Var4 = new ft3("UINT64", 3, gt3Var, 0);
        gt3 gt3Var2 = gt3.f4068b;
        ft3 ft3Var5 = new ft3("INT32", 4, gt3Var2, 0);
        ft3 ft3Var6 = new ft3("FIXED64", 5, gt3Var, 1);
        ft3 ft3Var7 = new ft3("FIXED32", 6, gt3Var2, 5);
        ft3 ft3Var8 = new ft3("BOOL", 7, gt3.f4072f, 0);
        f3518c = ft3Var8;
        n0 n0Var = new n0("STRING", 8, gt3.f4073g, 2);
        f3519d = n0Var;
        gt3 gt3Var3 = gt3.f4076j;
        b.z0 z0Var = new b.z0("GROUP", 9, gt3Var3, 3);
        f3520e = z0Var;
        q1 q1Var = new q1("MESSAGE", 10, gt3Var3, 2);
        f3521f = q1Var;
        f3522g = new ft3[]{ft3Var, ft3Var2, ft3Var3, ft3Var4, ft3Var5, ft3Var6, ft3Var7, ft3Var8, n0Var, z0Var, q1Var, new n2("BYTES", 11, gt3.f4074h, 2), new ft3("UINT32", 12, gt3Var2, 0), new ft3("ENUM", 13, gt3.f4075i, 0), new ft3("SFIXED32", 14, gt3Var2, 5), new ft3("SFIXED64", 15, gt3Var, 1), new ft3("SINT32", 16, gt3Var2, 0), new ft3("SINT64", 17, gt3Var, 0)};
    }

    public ft3(String str, int i5, gt3 gt3Var, int i11) {
        this.f3523a = gt3Var;
        this.f3524b = i11;
    }

    public static ft3[] values() {
        return (ft3[]) f3522g.clone();
    }
}
