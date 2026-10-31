package f10;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class r {

    /* renamed from: a, reason: collision with root package name */
    public static final r f54207a;

    /* renamed from: b, reason: collision with root package name */
    public static final r f54208b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ r[] f54209c;

    static {
        r rVar = new r("NEVER", 0);
        r rVar2 = new r("VISIBLE", 1);
        f54207a = rVar2;
        r rVar3 = new r("ALWAYS", 2);
        f54208b = rVar3;
        r[] rVarArr = {rVar, rVar2, rVar3};
        f54209c = rVarArr;
        EnumEntriesKt.a(rVarArr);
    }

    public static r valueOf(String str) {
        return (r) Enum.valueOf(r.class, str);
    }

    public static r[] values() {
        return (r[]) f54209c.clone();
    }
}
