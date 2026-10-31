package kotlin.reflect.full;

import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.SinceKotlin;
import kotlin.jvm.JvmName;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.KType;
import kotlin.reflect.jvm.internal.KTypeImpl;
import kotlin.reflect.jvm.internal.impl.types.typeUtil.TypeUtilsKt;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\u0018\u0002\n\u0002\b\u0005\u001a\u0014\u0010\u0000\u001a\u00020\u0001*\u00020\u00022\u0006\u0010\u0003\u001a\u00020\u0002H\u0007\u001a\u0014\u0010\u0004\u001a\u00020\u0001*\u00020\u00022\u0006\u0010\u0003\u001a\u00020\u0002H\u0007\u001a\u0014\u0010\u0005\u001a\u00020\u0002*\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u0001H\u0007¨\u0006\u0007"}, d2 = {"isSubtypeOf", b.f42142b, "Lkotlin/reflect/KType;", InneractiveMediationNameConsts.OTHER, "isSupertypeOf", "withNullability", "nullable", "kotlin-reflection"}, k = 2, mv = {1, 9, 0}, xi = 48)
@JvmName
/* loaded from: classes4.dex */
public final class KTypes {
    @SinceKotlin
    public static final boolean isSubtypeOf(@NotNull KType kType, @NotNull KType other) {
        Intrinsics.g(kType, "<this>");
        Intrinsics.g(other, "other");
        return TypeUtilsKt.isSubtypeOf(((KTypeImpl) kType).getType(), ((KTypeImpl) other).getType());
    }

    @SinceKotlin
    public static final boolean isSupertypeOf(@NotNull KType kType, @NotNull KType other) {
        Intrinsics.g(kType, "<this>");
        Intrinsics.g(other, "other");
        return isSubtypeOf(other, kType);
    }

    @SinceKotlin
    @NotNull
    public static final KType withNullability(@NotNull KType kType, boolean z11) {
        Intrinsics.g(kType, "<this>");
        return ((KTypeImpl) kType).makeNullableAsSpecified$kotlin_reflection(z11);
    }
}
