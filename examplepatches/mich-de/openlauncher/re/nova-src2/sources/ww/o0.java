package ww;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class o0 {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ o0[] f94818a;

    static {
        o0[] o0VarArr = {new o0("Line1", 0), new o0("Line2", 1), new o0("City", 2), new o0("PostalCode", 3), new o0("State", 4), new o0("Phone", 5)};
        f94818a = o0VarArr;
        EnumEntriesKt.a(o0VarArr);
    }

    public static o0 valueOf(String str) {
        return (o0) Enum.valueOf(o0.class, str);
    }

    public static o0[] values() {
        return (o0[]) f94818a.clone();
    }
}
