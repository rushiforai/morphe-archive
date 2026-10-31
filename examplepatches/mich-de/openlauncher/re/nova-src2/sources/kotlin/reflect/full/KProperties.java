package kotlin.reflect.full;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.SinceKotlin;
import kotlin.jvm.JvmName;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.KProperty1;
import kotlin.reflect.KProperty2;
import kotlin.reflect.jvm.internal.KPropertyImpl;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u0014\n\u0000\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\u001a\u0016\u0010\u0000\u001a\u0004\u0018\u00010\u0001*\n\u0012\u0002\b\u0003\u0012\u0002\b\u00030\u0002H\u0007\u001a/\u0010\u0000\u001a\u0004\u0018\u00010\u0001\"\u0004\b\u0000\u0010\u0003*\u0010\u0012\u0004\u0012\u0002H\u0003\u0012\u0002\b\u0003\u0012\u0002\b\u00030\u00042\u0006\u0010\u0005\u001a\u0002H\u0003H\u0007¢\u0006\u0002\u0010\u0006¨\u0006\u0007"}, d2 = {"getExtensionDelegate", b.f42142b, "Lkotlin/reflect/KProperty1;", "D", "Lkotlin/reflect/KProperty2;", "receiver", "(Lkotlin/reflect/KProperty2;Ljava/lang/Object;)Ljava/lang/Object;", "kotlin-reflection"}, k = 2, mv = {1, 9, 0}, xi = 48)
@JvmName
/* loaded from: classes4.dex */
public final class KProperties {
    @SinceKotlin
    @Nullable
    public static final Object getExtensionDelegate(@NotNull KProperty1<?, ?> kProperty1) {
        Intrinsics.g(kProperty1, "<this>");
        return kProperty1.getDelegate(KPropertyImpl.INSTANCE.getEXTENSION_PROPERTY_DELEGATE());
    }

    @SinceKotlin
    @Nullable
    public static final <D> Object getExtensionDelegate(@NotNull KProperty2<D, ?, ?> kProperty2, D d5) {
        Intrinsics.g(kProperty2, "<this>");
        return kProperty2.getDelegate(d5, KPropertyImpl.INSTANCE.getEXTENSION_PROPERTY_DELEGATE());
    }
}
