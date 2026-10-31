package ou;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class s0 {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ s0[] f80973a;

    static {
        s0[] s0VarArr = {new s0("Automatic", 0), new s0("AutomaticAsync", 1), new s0("Manual", 2)};
        f80973a = s0VarArr;
        EnumEntriesKt.a(s0VarArr);
    }

    public static s0 valueOf(String str) {
        return (s0) Enum.valueOf(s0.class, str);
    }

    public static s0[] values() {
        return (s0[]) f80973a.clone();
    }
}
