package kotlinx.serialization.internal;

import b.u4;
import java.util.Map;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Reflection;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.reflect.KClass;
import kotlin.text._OneToManyTitlecaseMappingsKt;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.descriptors.PrimitiveKind;
import kotlinx.serialization.descriptors.SerialDescriptor;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import r70.f;

@Metadata(d1 = {"\u00000\n\u0000\n\u0002\u0010$\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0003\n\u0002\u0010\u0000\n\u0000\u001a\u0018\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\tH\u0000\u001a\u0010\u0010\n\u001a\u00020\u000b2\u0006\u0010\u0006\u001a\u00020\u0007H\u0000\u001a\f\u0010\f\u001a\u00020\u0007*\u00020\u0007H\u0002\u001a$\u0010\r\u001a\n\u0012\u0004\u0012\u0002H\u000e\u0018\u00010\u0003\"\b\b\u0000\u0010\u000e*\u00020\u000f*\b\u0012\u0004\u0012\u0002H\u000e0\u0002H\u0000\"\"\u0010\u0000\u001a\u0016\u0012\b\u0012\u0006\u0012\u0002\b\u00030\u0002\u0012\b\u0012\u0006\u0012\u0002\b\u00030\u00030\u0001X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u0010"}, d2 = {"BUILTIN_SERIALIZERS", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lkotlin/reflect/KClass;", "Lkotlinx/serialization/KSerializer;", "PrimitiveDescriptorSafe", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "serialName", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "kind", "Lkotlinx/serialization/descriptors/PrimitiveKind;", "checkNameIsNotAPrimitive", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "capitalize", "builtinSerializerOrNull", "T", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "kotlinx-serialization-core"}, k = 2, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes.dex */
public final class PrimitivesKt {

    @NotNull
    private static final Map<KClass<?>, KSerializer<?>> BUILTIN_SERIALIZERS = PlatformKt.initBuiltins();

    @NotNull
    public static final SerialDescriptor PrimitiveDescriptorSafe(@NotNull String serialName, @NotNull PrimitiveKind kind) {
        Intrinsics.g(serialName, "serialName");
        Intrinsics.g(kind, "kind");
        checkNameIsNotAPrimitive(serialName);
        return new PrimitiveSerialDescriptor(serialName, kind);
    }

    @Nullable
    public static final <T> KSerializer<T> builtinSerializerOrNull(@NotNull KClass<T> kClass) {
        Intrinsics.g(kClass, "<this>");
        return (KSerializer) BUILTIN_SERIALIZERS.get(kClass);
    }

    private static final String capitalize(String str) {
        if (str.length() <= 0) {
            return str;
        }
        StringBuilder sb2 = new StringBuilder();
        char cCharAt = str.charAt(0);
        sb2.append((Object) (Character.isLowerCase(cCharAt) ? _OneToManyTitlecaseMappingsKt.a(cCharAt) : String.valueOf(cCharAt)));
        String strSubstring = str.substring(1);
        Intrinsics.f(strSubstring, "substring(...)");
        sb2.append(strSubstring);
        return sb2.toString();
    }

    public static final void checkNameIsNotAPrimitive(@NotNull String serialName) {
        Intrinsics.g(serialName, "serialName");
        for (KSerializer<?> kSerializer : BUILTIN_SERIALIZERS.values()) {
            if (serialName.equals(kSerializer.getDescriptor().getSerialName())) {
                StringBuilder sbK = u4.k("\n                The name of serial descriptor should uniquely identify associated serializer.\n                For serial name ", serialName, " there already exists ");
                sbK.append(Reflection.f71864a.getOrCreateKotlinClass(kSerializer.getClass()).getSimpleName());
                sbK.append(".\n                Please refer to SerialDescriptor documentation for additional information.\n            ");
                throw new IllegalArgumentException(f.o0(sbK.toString()));
            }
        }
    }
}
