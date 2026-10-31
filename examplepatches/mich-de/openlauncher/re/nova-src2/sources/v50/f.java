package v50;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class f {

    /* renamed from: a, reason: collision with root package name */
    public static final o2.f f92118a;

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ f[] f92119b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ i70.a f92120c;

    static {
        f[] fVarArr = {new f("MONDAY", 0), new f("TUESDAY", 1), new f("WEDNESDAY", 2), new f("THURSDAY", 3), new f("FRIDAY", 4), new f("SATURDAY", 5), new f("SUNDAY", 6)};
        f92119b = fVarArr;
        f92120c = EnumEntriesKt.a(fVarArr);
        f92118a = new o2.f(14);
    }

    public static f valueOf(String str) {
        return (f) Enum.valueOf(f.class, str);
    }

    public static f[] values() {
        return (f[]) f92119b.clone();
    }
}
