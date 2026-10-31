package db0;

import cw.r3;
import kotlin.LazyKt;
import kotlin.LazyThreadSafetyMode;
import kotlin.enums.EnumEntriesKt;
import kotlinx.serialization.Serializable;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
@Serializable
/* loaded from: classes5.dex */
public final class j0 {

    @NotNull
    public static final i0 Companion;

    /* renamed from: a, reason: collision with root package name */
    public static final Object f49162a;

    /* renamed from: b, reason: collision with root package name */
    public static final j0 f49163b;

    /* renamed from: c, reason: collision with root package name */
    public static final j0 f49164c;

    /* renamed from: d, reason: collision with root package name */
    public static final j0 f49165d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ j0[] f49166e;

    static {
        j0 j0Var = new j0("ADDED", 0);
        f49163b = j0Var;
        j0 j0Var2 = new j0("REMOVED", 1);
        f49164c = j0Var2;
        j0 j0Var3 = new j0("CHANGED", 2);
        f49165d = j0Var3;
        j0[] j0VarArr = {j0Var, j0Var2, j0Var3};
        f49166e = j0VarArr;
        EnumEntriesKt.a(j0VarArr);
        Companion = new i0();
        f49162a = LazyKt.b(LazyThreadSafetyMode.f71680b, new r3(8));
    }

    public static j0 valueOf(String str) {
        return (j0) Enum.valueOf(j0.class, str);
    }

    public static j0[] values() {
        return (j0[]) f49166e.clone();
    }
}
