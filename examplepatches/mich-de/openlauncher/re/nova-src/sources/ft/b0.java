package ft;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class b0 {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ b0[] f55909a;

    static {
        b0[] b0VarArr = {new b0("Created", 0), new b0("Authenticated", 1), new b0("Consented", 2), new b0("Rejected", 3), new b0("Expired", 4)};
        f55909a = b0VarArr;
        EnumEntriesKt.a(b0VarArr);
    }

    public static b0 valueOf(String str) {
        return (b0) Enum.valueOf(b0.class, str);
    }

    public static b0[] values() {
        return (b0[]) f55909a.clone();
    }
}
