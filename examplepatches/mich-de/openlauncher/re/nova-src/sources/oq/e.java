package oq;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class e {

    /* renamed from: a, reason: collision with root package name */
    public static final e f80603a;

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ e[] f80604b;

    static {
        e eVar = new e("EMAIL", 0);
        f80603a = eVar;
        e[] eVarArr = {eVar};
        f80604b = eVarArr;
        EnumEntriesKt.a(eVarArr);
    }

    public static e valueOf(String str) {
        return (e) Enum.valueOf(e.class, str);
    }

    public static e[] values() {
        return (e[]) f80604b.clone();
    }
}
