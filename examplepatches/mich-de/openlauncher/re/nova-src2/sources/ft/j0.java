package ft;

import f1.z1;
import kotlin.LazyKt;
import kotlin.LazyThreadSafetyMode;
import kotlin.enums.EnumEntriesKt;
import kotlinx.serialization.Serializable;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
@Serializable
/* loaded from: classes4.dex */
public final class j0 {

    @NotNull
    public static final i0 Companion;

    /* renamed from: b, reason: collision with root package name */
    public static final Object f55949b;

    /* renamed from: c, reason: collision with root package name */
    public static final j0 f55950c;

    /* renamed from: d, reason: collision with root package name */
    public static final j0 f55951d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ j0[] f55952e;

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ i70.a f55953f;

    /* renamed from: a, reason: collision with root package name */
    public final String f55954a;

    static {
        j0 j0Var = new j0("Unknown", 0, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        f55950c = j0Var;
        j0 j0Var2 = new j0("Required", 1, "required");
        f55951d = j0Var2;
        j0[] j0VarArr = {j0Var, j0Var2, new j0("NotRequired", 2, "notrequired")};
        f55952e = j0VarArr;
        f55953f = EnumEntriesKt.a(j0VarArr);
        Companion = new i0();
        f55949b = LazyKt.b(LazyThreadSafetyMode.f71680b, new z1(10));
    }

    public j0(String str, int i5, String str2) {
        this.f55954a = str2;
    }

    public static j0 valueOf(String str) {
        return (j0) Enum.valueOf(j0.class, str);
    }

    public static j0[] values() {
        return (j0[]) f55952e.clone();
    }
}
