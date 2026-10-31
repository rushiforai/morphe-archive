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
public final class a3 {

    @NotNull
    public static final z2 Companion;

    /* renamed from: a, reason: collision with root package name */
    public static final Object f48065a;

    /* renamed from: b, reason: collision with root package name */
    public static final a3 f48066b;

    /* renamed from: c, reason: collision with root package name */
    public static final a3 f48067c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ a3[] f48068d;

    static {
        a3 a3Var = new a3("Text", 0);
        f48066b = a3Var;
        a3 a3Var2 = new a3("Ascii", 1);
        f48067c = a3Var2;
        a3[] a3VarArr = {a3Var, a3Var2, new a3("Number", 2), new a3("Phone", 3), new a3("Uri", 4), new a3("Email", 5), new a3("Password", 6), new a3("NumberPassword", 7)};
        f48068d = a3VarArr;
        EnumEntriesKt.a(a3VarArr);
        Companion = new z2();
        f48065a = LazyKt.b(LazyThreadSafetyMode.f71680b, new com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.x(28));
    }

    public static a3 valueOf(String str) {
        return (a3) Enum.valueOf(a3.class, str);
    }

    public static a3[] values() {
        return (a3[]) f48068d.clone();
    }
}
