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
public final class s4 {

    @NotNull
    public static final r4 Companion;

    /* renamed from: b, reason: collision with root package name */
    public static final Object f48300b;

    /* renamed from: c, reason: collision with root package name */
    public static final s4 f48301c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ s4[] f48302d;

    /* renamed from: a, reason: collision with root package name */
    public final int f48303a;

    static {
        s4 s4Var = new s4("IdealBank", 0, 2132019800);
        s4 s4Var2 = new s4("P24Bank", 1, 2132019856);
        s4 s4Var3 = new s4("EpsBank", 2, 2132019771);
        s4 s4Var4 = new s4("FpxBank", 3, 2132019790);
        s4 s4Var5 = new s4("AddressName", 4, 2132019652);
        f48301c = s4Var5;
        s4[] s4VarArr = {s4Var, s4Var2, s4Var3, s4Var4, s4Var5, new s4("AuBecsAccountName", 5, 2132019703)};
        f48302d = s4VarArr;
        EnumEntriesKt.a(s4VarArr);
        Companion = new r4();
        f48300b = LazyKt.b(LazyThreadSafetyMode.f71680b, new r3(1));
    }

    public s4(String str, int i5, int i11) {
        this.f48303a = i11;
    }

    public static s4 valueOf(String str) {
        return (s4) Enum.valueOf(s4.class, str);
    }

    public static s4[] values() {
        return (s4[]) f48302d.clone();
    }
}
