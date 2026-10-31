package ft;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class p0 {

    /* renamed from: b, reason: collision with root package name */
    public static final p0 f55999b;

    /* renamed from: c, reason: collision with root package name */
    public static final p0 f56000c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ p0[] f56001d;

    /* renamed from: a, reason: collision with root package name */
    public final String f56002a;

    static {
        p0 p0Var = new p0("Automatic", 0, "automatic");
        f55999b = p0Var;
        p0 p0Var2 = new p0("MerchantSpecified", 1, "merchant_specified");
        f56000c = p0Var2;
        p0[] p0VarArr = {p0Var, p0Var2};
        f56001d = p0VarArr;
        EnumEntriesKt.a(p0VarArr);
    }

    public p0(String str, int i5, String str2) {
        this.f56002a = str2;
    }

    public static p0 valueOf(String str) {
        return (p0) Enum.valueOf(p0.class, str);
    }

    public static p0[] values() {
        return (p0[]) f56001d.clone();
    }
}
