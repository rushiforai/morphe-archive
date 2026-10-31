package rv;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class f {

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ f[] f86436b;

    /* renamed from: a, reason: collision with root package name */
    public final String f86437a;

    static {
        f[] fVarArr = {new f("MARKET_OR_REGION_RESTRICTION", 0, "RE01"), new f("PLATFORM_VERSION", 1, "RE02"), new f("PERMISSION", 2, "RE03"), new f("UNAVAILABLE", 3, "RE04")};
        f86436b = fVarArr;
        EnumEntriesKt.a(fVarArr);
    }

    public f(String str, int i5, String str2) {
        this.f86437a = str2;
    }

    public static f valueOf(String str) {
        return (f) Enum.valueOf(f.class, str);
    }

    public static f[] values() {
        return (f[]) f86436b.clone();
    }

    @Override // java.lang.Enum
    public final String toString() {
        return this.f86437a;
    }
}
