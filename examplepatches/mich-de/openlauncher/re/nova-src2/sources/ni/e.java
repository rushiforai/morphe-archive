package ni;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class e {

    /* renamed from: a, reason: collision with root package name */
    public static final e f78261a;

    /* renamed from: b, reason: collision with root package name */
    public static final e f78262b;

    /* renamed from: c, reason: collision with root package name */
    public static final e f78263c;

    /* renamed from: d, reason: collision with root package name */
    public static final e f78264d;

    /* renamed from: e, reason: collision with root package name */
    public static final e f78265e;

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ e[] f78266f;

    static {
        e eVar = new e("INTERNAL_ERROR", 0);
        f78261a = eVar;
        e eVar2 = new e("FAILED_TO_LOAD", 1);
        f78262b = eVar2;
        e eVar3 = new e("NOT_IN_TEST_MODE", 2);
        f78263c = eVar3;
        e eVar4 = new e("ALREADY_OPEN", 3);
        f78264d = eVar4;
        e eVar5 = new e("DISABLED", 4);
        f78265e = eVar5;
        e[] eVarArr = {eVar, eVar2, eVar3, eVar4, eVar5};
        f78266f = eVarArr;
        EnumEntriesKt.a(eVarArr);
    }

    public static e[] values() {
        return (e[]) f78266f.clone();
    }
}
