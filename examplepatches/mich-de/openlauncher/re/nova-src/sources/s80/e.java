package s80;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class e {

    /* renamed from: a, reason: collision with root package name */
    public static final e f86765a;

    /* renamed from: b, reason: collision with root package name */
    public static final e f86766b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ e[] f86767c;

    static {
        e eVar = new e("API", 0);
        f86765a = eVar;
        e eVar2 = new e("CUSTOM", 1);
        f86766b = eVar2;
        e[] eVarArr = {eVar, eVar2, new e("FAKE_CONDUIT", 2)};
        f86767c = eVarArr;
        EnumEntriesKt.a(eVarArr);
    }

    public static e valueOf(String str) {
        return (e) Enum.valueOf(e.class, str);
    }

    public static e[] values() {
        return (e[]) f86767c.clone();
    }
}
