package ads_mobile_sdk;

import kotlin.enums.EnumEntriesKt;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes2.dex */
public final class u93 {

    /* renamed from: b, reason: collision with root package name */
    public static final u93 f10252b;

    /* renamed from: c, reason: collision with root package name */
    public static final u93 f10253c;

    /* renamed from: d, reason: collision with root package name */
    public static final u93 f10254d;

    /* renamed from: e, reason: collision with root package name */
    public static final u93 f10255e;

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ u93[] f10256f;

    /* renamed from: a, reason: collision with root package name */
    public final long f10257a;

    static {
        Duration.Companion companion = Duration.f72038b;
        DurationUnit durationUnit = DurationUnit.f72045d;
        u93 u93Var = new u93(0, DurationKt.g(30, durationUnit), "FAST");
        f10252b = u93Var;
        u93 u93Var2 = new u93(1, DurationKt.g(100, durationUnit), "MEDIUM");
        f10253c = u93Var2;
        u93 u93Var3 = new u93(2, DurationKt.g(300, durationUnit), "SLOW");
        f10254d = u93Var3;
        u93 u93Var4 = new u93(3, DurationKt.g(1000, durationUnit), "SUPER_SLOW");
        f10255e = u93Var4;
        u93[] u93VarArr = {u93Var, u93Var2, u93Var3, u93Var4};
        f10256f = u93VarArr;
        EnumEntriesKt.a(u93VarArr);
    }

    public u93(int i5, long j11, String str) {
        this.f10257a = j11;
    }

    public static u93[] values() {
        return (u93[]) f10256f.clone();
    }
}
