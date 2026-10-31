package cw;

import kotlin.LazyKt;
import kotlin.LazyThreadSafetyMode;
import kotlin.enums.EnumEntriesKt;
import kotlinx.serialization.Serializable;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
@Serializable
/* loaded from: classes4.dex */
public final class i0 {

    @NotNull
    public static final h0 Companion;

    /* renamed from: a, reason: collision with root package name */
    public static final Object f48164a;

    /* renamed from: b, reason: collision with root package name */
    public static final i0 f48165b;

    /* renamed from: c, reason: collision with root package name */
    public static final i0 f48166c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ i0[] f48167d;

    static {
        i0 i0Var = new i0("None", 0);
        f48165b = i0Var;
        i0 i0Var2 = new i0("Characters", 1);
        i0 i0Var3 = new i0("Words", 2);
        f48166c = i0Var3;
        i0[] i0VarArr = {i0Var, i0Var2, i0Var3, new i0("Sentences", 3)};
        f48167d = i0VarArr;
        EnumEntriesKt.a(i0VarArr);
        Companion = new h0();
        f48164a = LazyKt.b(LazyThreadSafetyMode.f71680b, new com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.x(23));
    }

    public static i0 valueOf(String str) {
        return (i0) Enum.valueOf(i0.class, str);
    }

    public static i0[] values() {
        return (i0[]) f48167d.clone();
    }
}
