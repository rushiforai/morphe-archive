package ft;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class q0 {

    /* renamed from: b, reason: collision with root package name */
    public static final b6.e f56004b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ q0[] f56005c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ i70.a f56006d;

    /* renamed from: a, reason: collision with root package name */
    public final String f56007a;

    static {
        q0[] q0VarArr = {new q0("Duplicate", 0, "duplicate"), new q0("RequestedByCustomer", 1, "requested_by_customer"), new q0("Abandoned", 2, "abandoned")};
        f56005c = q0VarArr;
        f56006d = EnumEntriesKt.a(q0VarArr);
        f56004b = new b6.e(5);
    }

    public q0(String str, int i5, String str2) {
        this.f56007a = str2;
    }

    public static q0 valueOf(String str) {
        return (q0) Enum.valueOf(q0.class, str);
    }

    public static q0[] values() {
        return (q0[]) f56005c.clone();
    }
}
