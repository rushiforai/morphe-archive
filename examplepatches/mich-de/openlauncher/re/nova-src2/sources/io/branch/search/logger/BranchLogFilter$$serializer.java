package io.branch.search.logger;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import io.branch.search.internal.P6;
import java.util.Set;
import kotlin.Deprecated;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.UnknownFieldException;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.CompositeDecoder;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.encoding.Decoder;
import kotlinx.serialization.encoding.Encoder;
import kotlinx.serialization.internal.EnumSerializer;
import kotlinx.serialization.internal.GeneratedSerializer;
import kotlinx.serialization.internal.LinkedHashSetSerializer;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import kotlinx.serialization.internal.StringSerializer;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u00006\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0011\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\bÇ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0003J\u0018\u0010\b\u001a\f\u0012\b\u0012\u0006\u0012\u0002\b\u00030\n0\tHÖ\u0001¢\u0006\u0002\u0010\u000bJ\u0011\u0010\f\u001a\u00020\u00022\u0006\u0010\r\u001a\u00020\u000eHÖ\u0001J\u0019\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0011\u001a\u00020\u00122\u0006\u0010\u0013\u001a\u00020\u0002HÖ\u0001R\u0014\u0010\u0004\u001a\u00020\u00058VXÖ\u0005¢\u0006\u0006\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0014"}, d2 = {"io/branch/search/logger/BranchLogFilter.$serializer", "Lkotlinx/serialization/internal/GeneratedSerializer;", "Lio/branch/search/logger/BranchLogFilter;", "()V", "descriptor", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "getDescriptor", "()Lkotlinx/serialization/descriptors/SerialDescriptor;", "childSerializers", b.f42142b, "Lkotlinx/serialization/KSerializer;", "()[Lkotlinx/serialization/KSerializer;", "deserialize", "decoder", "Lkotlinx/serialization/encoding/Decoder;", "serialize", b.f42142b, "encoder", "Lkotlinx/serialization/encoding/Encoder;", "value", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1}, xi = 48)
@Deprecated
/* loaded from: classes4.dex */
public final class BranchLogFilter$$serializer implements GeneratedSerializer<BranchLogFilter> {

    @NotNull
    public static final BranchLogFilter$$serializer INSTANCE;
    public static final /* synthetic */ SerialDescriptor descriptor;

    static {
        BranchLogFilter$$serializer branchLogFilter$$serializer = new BranchLogFilter$$serializer();
        INSTANCE = branchLogFilter$$serializer;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("io.branch.search.logger.BranchLogFilter", branchLogFilter$$serializer, 2);
        pluginGeneratedSerialDescriptor.addElement("unspecifiedTags", false);
        pluginGeneratedSerialDescriptor.addElement("_tags", false);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    private BranchLogFilter$$serializer() {
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    @NotNull
    public KSerializer<?>[] childSerializers() {
        return new KSerializer[]{new EnumSerializer("io.branch.search.internal.logger.FilterAction", P6.values()), new LinkedHashSetSerializer(StringSerializer.INSTANCE)};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    @NotNull
    public BranchLogFilter deserialize(@NotNull Decoder decoder) {
        int i5;
        Object objDecodeSerializableElement;
        Object objDecodeSerializableElement2;
        Intrinsics.g(decoder, "decoder");
        SerialDescriptor descriptor2 = getDescriptor();
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(descriptor2);
        Object objDecodeSerializableElement3 = null;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            objDecodeSerializableElement = compositeDecoderBeginStructure.decodeSerializableElement(descriptor2, 0, new EnumSerializer("io.branch.search.internal.logger.FilterAction", P6.values()), null);
            objDecodeSerializableElement2 = compositeDecoderBeginStructure.decodeSerializableElement(descriptor2, 1, new LinkedHashSetSerializer(StringSerializer.INSTANCE), null);
            i5 = 3;
        } else {
            boolean z11 = true;
            int i11 = 0;
            Object objDecodeSerializableElement4 = null;
            while (z11) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(descriptor2);
                if (iDecodeElementIndex == -1) {
                    z11 = false;
                } else if (iDecodeElementIndex == 0) {
                    objDecodeSerializableElement3 = compositeDecoderBeginStructure.decodeSerializableElement(descriptor2, 0, new EnumSerializer("io.branch.search.internal.logger.FilterAction", P6.values()), objDecodeSerializableElement3);
                    i11 |= 1;
                } else {
                    if (iDecodeElementIndex != 1) {
                        throw new UnknownFieldException(iDecodeElementIndex);
                    }
                    objDecodeSerializableElement4 = compositeDecoderBeginStructure.decodeSerializableElement(descriptor2, 1, new LinkedHashSetSerializer(StringSerializer.INSTANCE), objDecodeSerializableElement4);
                    i11 |= 2;
                }
            }
            i5 = i11;
            objDecodeSerializableElement = objDecodeSerializableElement3;
            objDecodeSerializableElement2 = objDecodeSerializableElement4;
        }
        compositeDecoderBeginStructure.endStructure(descriptor2);
        return new BranchLogFilter(i5, (P6) objDecodeSerializableElement, (Set) objDecodeSerializableElement2);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    @NotNull
    public SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public void serialize(@NotNull Encoder encoder, @NotNull BranchLogFilter value) {
        Intrinsics.g(encoder, "encoder");
        Intrinsics.g(value, "value");
        SerialDescriptor serialDesc = getDescriptor();
        CompositeEncoder output = encoder.beginStructure(serialDesc);
        Intrinsics.g(output, "output");
        Intrinsics.g(serialDesc, "serialDesc");
        output.encodeSerializableElement(serialDesc, 0, new EnumSerializer("io.branch.search.internal.logger.FilterAction", P6.values()), value.f66387a);
        output.encodeSerializableElement(serialDesc, 1, new LinkedHashSetSerializer(StringSerializer.INSTANCE), value.f66388b);
        output.endStructure(serialDesc);
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    @NotNull
    public KSerializer<?>[] typeParametersSerializers() {
        return GeneratedSerializer.DefaultImpls.typeParametersSerializers(this);
    }
}
