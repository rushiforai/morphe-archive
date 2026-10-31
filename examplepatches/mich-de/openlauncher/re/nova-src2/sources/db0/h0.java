package db0;

import kotlin.LazyKt;
import kotlin.LazyThreadSafetyMode;
import kotlin.enums.EnumEntriesKt;
import kotlinx.serialization.Serializable;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
@Serializable
/* loaded from: classes.dex */
public final class h0 {

    @NotNull
    public static final g0 Companion;

    /* renamed from: a, reason: collision with root package name */
    public static final Object f49147a;

    /* renamed from: b, reason: collision with root package name */
    public static final h0 f49148b;

    /* renamed from: c, reason: collision with root package name */
    public static final h0 f49149c;

    /* renamed from: d, reason: collision with root package name */
    public static final h0 f49150d;

    /* renamed from: e, reason: collision with root package name */
    public static final h0 f49151e;

    /* renamed from: f, reason: collision with root package name */
    public static final h0 f49152f;

    /* renamed from: g, reason: collision with root package name */
    public static final h0 f49153g;

    /* renamed from: h, reason: collision with root package name */
    public static final /* synthetic */ h0[] f49154h;

    static {
        h0 h0Var = new h0("CREATED", 0);
        f49148b = h0Var;
        h0 h0Var2 = new h0("STARTED", 1);
        f49149c = h0Var2;
        h0 h0Var3 = new h0("RESUMED", 2);
        f49150d = h0Var3;
        h0 h0Var4 = new h0("PAUSED", 3);
        f49151e = h0Var4;
        h0 h0Var5 = new h0("STOPPED", 4);
        f49152f = h0Var5;
        h0 h0Var6 = new h0("DESTROYED", 5);
        f49153g = h0Var6;
        h0[] h0VarArr = {h0Var, h0Var2, h0Var3, h0Var4, h0Var5, h0Var6};
        f49154h = h0VarArr;
        EnumEntriesKt.a(h0VarArr);
        Companion = new g0();
        f49147a = LazyKt.b(LazyThreadSafetyMode.f71680b, new com.moloco.sdk.service_locator.b(23));
    }

    public static h0 valueOf(String str) {
        return (h0) Enum.valueOf(h0.class, str);
    }

    public static h0[] values() {
        return (h0[]) f49154h.clone();
    }
}
