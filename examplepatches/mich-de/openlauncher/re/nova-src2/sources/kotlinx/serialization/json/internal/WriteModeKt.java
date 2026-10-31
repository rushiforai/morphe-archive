package kotlinx.serialization.json.internal;

import kotlin.Metadata;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlinx.serialization.descriptors.ContextAwareKt;
import kotlinx.serialization.descriptors.PolymorphicKind;
import kotlinx.serialization.descriptors.PrimitiveKind;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.descriptors.SerialKind;
import kotlinx.serialization.descriptors.StructureKind;
import kotlinx.serialization.json.Json;
import kotlinx.serialization.modules.SerializersModule;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\"\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\u001a\u0014\u0010\u0000\u001a\u00020\u0001*\u00020\u00022\u0006\u0010\u0003\u001a\u00020\u0004H\u0000\u001aS\u0010\u0005\u001a\u0002H\u0006\"\u0004\b\u0000\u0010\u0006\"\b\b\u0001\u0010\u0007*\u0002H\u0006\"\b\b\u0002\u0010\b*\u0002H\u0006*\u00020\u00022\u0006\u0010\t\u001a\u00020\u00042\f\u0010\n\u001a\b\u0012\u0004\u0012\u0002H\u00070\u000b2\f\u0010\f\u001a\b\u0012\u0004\u0012\u0002H\b0\u000bH\u0080\bø\u0001\u0000¢\u0006\u0002\u0010\r\u001a\u0014\u0010\u000e\u001a\u00020\u0004*\u00020\u00042\u0006\u0010\u000f\u001a\u00020\u0010H\u0000\u0082\u0002\u0007\n\u0005\b\u009920\u0001¨\u0006\u0011"}, d2 = {"switchMode", "Lkotlinx/serialization/json/internal/WriteMode;", "Lkotlinx/serialization/json/Json;", "desc", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "selectMapMode", "T", "R1", "R2", "mapDescriptor", "ifMap", "Lkotlin/Function0;", "ifList", "(Lkotlinx/serialization/json/Json;Lkotlinx/serialization/descriptors/SerialDescriptor;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)Ljava/lang/Object;", "carrierDescriptor", "module", "Lkotlinx/serialization/modules/SerializersModule;", "kotlinx-serialization-json"}, k = 2, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes.dex */
public final class WriteModeKt {
    @NotNull
    public static final SerialDescriptor carrierDescriptor(@NotNull SerialDescriptor serialDescriptor, @NotNull SerializersModule module) {
        SerialDescriptor serialDescriptorCarrierDescriptor;
        Intrinsics.g(serialDescriptor, "<this>");
        Intrinsics.g(module, "module");
        if (!Intrinsics.b(serialDescriptor.getKind(), SerialKind.CONTEXTUAL.INSTANCE)) {
            return serialDescriptor.getIsInline() ? carrierDescriptor(serialDescriptor.getElementDescriptor(0), module) : serialDescriptor;
        }
        SerialDescriptor contextualDescriptor = ContextAwareKt.getContextualDescriptor(module, serialDescriptor);
        return (contextualDescriptor == null || (serialDescriptorCarrierDescriptor = carrierDescriptor(contextualDescriptor, module)) == null) ? serialDescriptor : serialDescriptorCarrierDescriptor;
    }

    public static final <T, R1 extends T, R2 extends T> T selectMapMode(@NotNull Json json, @NotNull SerialDescriptor mapDescriptor, @NotNull Function0<? extends R1> ifMap, @NotNull Function0<? extends R2> ifList) {
        Intrinsics.g(json, "<this>");
        Intrinsics.g(mapDescriptor, "mapDescriptor");
        Intrinsics.g(ifMap, "ifMap");
        Intrinsics.g(ifList, "ifList");
        SerialDescriptor serialDescriptorCarrierDescriptor = carrierDescriptor(mapDescriptor.getElementDescriptor(0), json.getSerializersModule());
        SerialKind kind = serialDescriptorCarrierDescriptor.getKind();
        if ((kind instanceof PrimitiveKind) || Intrinsics.b(kind, SerialKind.ENUM.INSTANCE)) {
            return (T) ifMap.invoke();
        }
        if (json.getConfiguration().getAllowStructuredMapKeys()) {
            return (T) ifList.invoke();
        }
        throw JsonExceptionsKt.InvalidKeyKindException(serialDescriptorCarrierDescriptor);
    }

    @NotNull
    public static final WriteMode switchMode(@NotNull Json json, @NotNull SerialDescriptor desc) {
        Intrinsics.g(json, "<this>");
        Intrinsics.g(desc, "desc");
        SerialKind kind = desc.getKind();
        if (kind instanceof PolymorphicKind) {
            return WriteMode.POLY_OBJ;
        }
        if (Intrinsics.b(kind, StructureKind.LIST.INSTANCE)) {
            return WriteMode.LIST;
        }
        if (!Intrinsics.b(kind, StructureKind.MAP.INSTANCE)) {
            return WriteMode.OBJ;
        }
        SerialDescriptor serialDescriptorCarrierDescriptor = carrierDescriptor(desc.getElementDescriptor(0), json.getSerializersModule());
        SerialKind kind2 = serialDescriptorCarrierDescriptor.getKind();
        if ((kind2 instanceof PrimitiveKind) || Intrinsics.b(kind2, SerialKind.ENUM.INSTANCE)) {
            return WriteMode.MAP;
        }
        if (json.getConfiguration().getAllowStructuredMapKeys()) {
            return WriteMode.LIST;
        }
        throw JsonExceptionsKt.InvalidKeyKindException(serialDescriptorCarrierDescriptor);
    }
}
