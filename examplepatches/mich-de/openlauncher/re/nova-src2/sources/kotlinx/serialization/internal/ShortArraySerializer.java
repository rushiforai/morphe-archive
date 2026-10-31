package kotlinx.serialization.internal;

import com.tiktok.appevents.edp.TTEDPEventConstants;
import kotlin.Metadata;
import kotlin.PublishedApi;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.ShortCompanionObject;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.builtins.BuiltinSerializersKt;
import kotlinx.serialization.encoding.CompositeDecoder;
import kotlinx.serialization.encoding.CompositeEncoder;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000B\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0017\n\u0002\u0018\u0002\n\u0002\u0010\n\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\bÁ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u00012\u0014\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00050\u0003B\t\b\u0002¢\u0006\u0004\b\u0006\u0010\u0007J\f\u0010\b\u001a\u00020\t*\u00020\u0002H\u0014J\f\u0010\n\u001a\u00020\u0005*\u00020\u0002H\u0014J\b\u0010\u000b\u001a\u00020\u0002H\u0014J(\u0010\f\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\u0010\u001a\u00020\t2\u0006\u0010\u0011\u001a\u00020\u00052\u0006\u0010\u0012\u001a\u00020\u0013H\u0014J \u0010\u0014\u001a\u00020\r2\u0006\u0010\u0015\u001a\u00020\u00162\u0006\u0010\u0017\u001a\u00020\u00022\u0006\u0010\u0018\u001a\u00020\tH\u0014¨\u0006\u0019"}, d2 = {"Lkotlinx/serialization/internal/ShortArraySerializer;", "Lkotlinx/serialization/KSerializer;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lkotlinx/serialization/internal/PrimitiveArraySerializer;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lkotlinx/serialization/internal/ShortArrayBuilder;", "<init>", "()V", "collectionSize", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toBuilder", "empty", "readElement", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "decoder", "Lkotlinx/serialization/encoding/CompositeDecoder;", TTEDPEventConstants.EDP_EVENT_PROPERTY_INDEX, "builder", "checkIndex", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "writeContent", "encoder", "Lkotlinx/serialization/encoding/CompositeEncoder;", "content", "size", "kotlinx-serialization-core"}, k = 1, mv = {2, 1, 0}, xi = 48)
@PublishedApi
/* loaded from: classes.dex */
public final class ShortArraySerializer extends PrimitiveArraySerializer<Short, short[], ShortArrayBuilder> implements KSerializer<short[]> {

    @NotNull
    public static final ShortArraySerializer INSTANCE = new ShortArraySerializer();

    private ShortArraySerializer() {
        super(BuiltinSerializersKt.serializer(ShortCompanionObject.f71866a));
    }

    @Override // kotlinx.serialization.internal.AbstractCollectionSerializer
    public int collectionSize(@NotNull short[] sArr) {
        Intrinsics.g(sArr, "<this>");
        return sArr.length;
    }

    @Override // kotlinx.serialization.internal.PrimitiveArraySerializer
    @NotNull
    public short[] empty() {
        return new short[0];
    }

    @Override // kotlinx.serialization.internal.AbstractCollectionSerializer
    @NotNull
    public ShortArrayBuilder toBuilder(@NotNull short[] sArr) {
        Intrinsics.g(sArr, "<this>");
        return new ShortArrayBuilder(sArr);
    }

    @Override // kotlinx.serialization.internal.PrimitiveArraySerializer
    public void writeContent(@NotNull CompositeEncoder encoder, @NotNull short[] content, int size) {
        Intrinsics.g(encoder, "encoder");
        Intrinsics.g(content, "content");
        for (int i5 = 0; i5 < size; i5++) {
            encoder.encodeShortElement(getDescriptor(), i5, content[i5]);
        }
    }

    @Override // kotlinx.serialization.internal.PrimitiveArraySerializer
    public void readElement(@NotNull CompositeDecoder decoder, int index, @NotNull ShortArrayBuilder builder, boolean checkIndex) {
        Intrinsics.g(decoder, "decoder");
        Intrinsics.g(builder, "builder");
        builder.append$kotlinx_serialization_core(decoder.decodeShortElement(getDescriptor(), index));
    }
}
