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
public final class d2 {

    @NotNull
    public static final c2 Companion;

    /* renamed from: a, reason: collision with root package name */
    public static final Object f48123a;

    /* renamed from: b, reason: collision with root package name */
    public static final d2 f48124b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ d2[] f48125c;

    static {
        d2 d2Var = new d2("Country", 0);
        f48124b = d2Var;
        d2[] d2VarArr = {d2Var};
        f48125c = d2VarArr;
        EnumEntriesKt.a(d2VarArr);
        Companion = new c2();
        f48123a = LazyKt.b(LazyThreadSafetyMode.f71680b, new com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.x(26));
    }

    public static d2 valueOf(String str) {
        return (d2) Enum.valueOf(d2.class, str);
    }

    public static d2[] values() {
        return (d2[]) f48125c.clone();
    }
}
