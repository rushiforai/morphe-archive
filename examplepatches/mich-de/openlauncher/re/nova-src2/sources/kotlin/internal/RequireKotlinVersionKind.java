package kotlin.internal;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.SinceKotlin;
import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
@SinceKotlin
@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\b\u0081\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001¨\u0006\u0002"}, d2 = {"Lkotlin/internal/RequireKotlinVersionKind;", b.f42142b, "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class RequireKotlinVersionKind {

    /* renamed from: a, reason: collision with root package name */
    public static final RequireKotlinVersionKind f71824a;

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ RequireKotlinVersionKind[] f71825b;

    static {
        RequireKotlinVersionKind requireKotlinVersionKind = new RequireKotlinVersionKind("LANGUAGE_VERSION", 0);
        f71824a = requireKotlinVersionKind;
        RequireKotlinVersionKind[] requireKotlinVersionKindArr = {requireKotlinVersionKind, new RequireKotlinVersionKind("COMPILER_VERSION", 1), new RequireKotlinVersionKind("API_VERSION", 2)};
        f71825b = requireKotlinVersionKindArr;
        EnumEntriesKt.a(requireKotlinVersionKindArr);
    }

    public static RequireKotlinVersionKind valueOf(String str) {
        return (RequireKotlinVersionKind) Enum.valueOf(RequireKotlinVersionKind.class, str);
    }

    public static RequireKotlinVersionKind[] values() {
        return (RequireKotlinVersionKind[]) f71825b.clone();
    }
}
