package kotlin.reflect.jvm;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.JvmName;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.KClass;
import kotlin.reflect.jvm.internal.KClassImpl;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u000e\n\u0000\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0002\b\u0003\"\u0019\u0010\u0000\u001a\u00020\u0001*\u0006\u0012\u0002\b\u00030\u00028F¢\u0006\u0006\u001a\u0004\b\u0003\u0010\u0004¨\u0006\u0005"}, d2 = {"jvmName", b.f42142b, "Lkotlin/reflect/KClass;", "getJvmName", "(Lkotlin/reflect/KClass;)Ljava/lang/String;", "kotlin-reflection"}, k = 2, mv = {1, 9, 0}, xi = 48)
@JvmName
/* loaded from: classes2.dex */
public final class KClassesJvm {
    @NotNull
    public static final String getJvmName(@NotNull KClass<?> kClass) {
        Intrinsics.g(kClass, "<this>");
        return ((KClassImpl) kClass).getF71858a().getName();
    }
}
