package kotlin.contracts;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.SinceKotlin;
import kotlin.enums.EnumEntriesKt;
import kotlin.internal.ContractsDsl;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
@SinceKotlin
@ContractsDsl
@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\b\u0087\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001¨\u0006\u0002"}, d2 = {"Lkotlin/contracts/InvocationKind;", b.f42142b, "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
@ExperimentalContracts
/* loaded from: classes4.dex */
public final class InvocationKind {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ InvocationKind[] f71796a;

    static {
        InvocationKind[] invocationKindArr = {new InvocationKind("AT_MOST_ONCE", 0), new InvocationKind("AT_LEAST_ONCE", 1), new InvocationKind("EXACTLY_ONCE", 2), new InvocationKind("UNKNOWN", 3)};
        f71796a = invocationKindArr;
        EnumEntriesKt.a(invocationKindArr);
    }

    public static InvocationKind valueOf(String str) {
        return (InvocationKind) Enum.valueOf(InvocationKind.class, str);
    }

    public static InvocationKind[] values() {
        return (InvocationKind[]) f71796a.clone();
    }
}
