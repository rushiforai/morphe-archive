package dq;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class e {

    /* renamed from: b, reason: collision with root package name */
    public static final e f49308b;

    /* renamed from: c, reason: collision with root package name */
    public static final e f49309c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ e[] f49310d;

    /* renamed from: a, reason: collision with root package name */
    public final String f49311a;

    static {
        e eVar = new e("Min", 0, "MIN");
        f49308b = eVar;
        e eVar2 = new e("Full", 1, "FULL");
        f49309c = eVar2;
        e[] eVarArr = {eVar, eVar2};
        f49310d = eVarArr;
        EnumEntriesKt.a(eVarArr);
    }

    public e(String str, int i5, String str2) {
        this.f49311a = str2;
    }

    public static e valueOf(String str) {
        return (e) Enum.valueOf(e.class, str);
    }

    public static e[] values() {
        return (e[]) f49310d.clone();
    }
}
