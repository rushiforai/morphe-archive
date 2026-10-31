package kotlinx.serialization.internal;

import b70.g;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.InternalSerializationApi;
import kotlinx.serialization.descriptors.SerialDescriptor;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\t\b'\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\u0007¢\u0006\u0004\b\u0003\u0010\u0004J\u0014\u0010\u0005\u001a\u00020\u0002*\u00020\u00062\u0006\u0010\u0007\u001a\u00020\bH\u0004J\u0010\u0010\t\u001a\u00020\u00022\u0006\u0010\n\u001a\u00020\u0002H\u0004J\u0018\u0010\u000b\u001a\u00020\u00022\u0006\u0010\f\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\bH\u0014J\u0018\u0010\r\u001a\u00020\u00022\u0006\u0010\u000e\u001a\u00020\u00022\u0006\u0010\u000f\u001a\u00020\u0002H\u0014J\b\u0010\u0010\u001a\u00020\u0002H\u0004¨\u0006\u0011"}, d2 = {"Lkotlinx/serialization/internal/NamedValueDecoder;", "Lkotlinx/serialization/internal/TaggedDecoder;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "getTag", "Lkotlinx/serialization/descriptors/SerialDescriptor;", TTEDPEventConstants.EDP_EVENT_PROPERTY_INDEX, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "nested", "nestedName", "elementName", "descriptor", "composeName", "parentName", "childName", "renderTagStack", "kotlinx-serialization-core"}, k = 1, mv = {2, 1, 0}, xi = 48)
@InternalSerializationApi
/* loaded from: classes5.dex */
public abstract class NamedValueDecoder extends TaggedDecoder<String> {
    @NotNull
    public String composeName(@NotNull String parentName, @NotNull String childName) {
        Intrinsics.g(parentName, "parentName");
        Intrinsics.g(childName, "childName");
        return parentName.length() == 0 ? childName : a2.c.g('.', parentName, childName);
    }

    @NotNull
    public String elementName(@NotNull SerialDescriptor descriptor, int index) {
        Intrinsics.g(descriptor, "descriptor");
        return descriptor.getElementName(index);
    }

    @NotNull
    public final String nested(@NotNull String nestedName) {
        Intrinsics.g(nestedName, "nestedName");
        String currentTagOrNull = getCurrentTagOrNull();
        if (currentTagOrNull == null) {
            currentTagOrNull = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        return composeName(currentTagOrNull, nestedName);
    }

    @NotNull
    public final String renderTagStack() {
        return getTagStack$kotlinx_serialization_core().isEmpty() ? "$" : g.f1(getTagStack$kotlinx_serialization_core(), ".", "$.", null, 0, null, 60);
    }

    @Override // kotlinx.serialization.internal.TaggedDecoder
    @NotNull
    public final String getTag(@NotNull SerialDescriptor serialDescriptor, int i5) {
        Intrinsics.g(serialDescriptor, "<this>");
        return nested(elementName(serialDescriptor, i5));
    }
}
