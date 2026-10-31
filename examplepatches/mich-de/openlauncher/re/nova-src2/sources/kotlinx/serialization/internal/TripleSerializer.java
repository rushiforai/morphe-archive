package kotlinx.serialization.internal;

import b.c0;
import h10.y0;
import kotlin.Metadata;
import kotlin.PublishedApi;
import kotlin.Triple;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.SerializationException;
import kotlinx.serialization.descriptors.ClassSerialDescriptorBuilder;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.descriptors.SerialDescriptorsKt;
import kotlinx.serialization.encoding.CompositeDecoder;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.encoding.Decoder;
import kotlinx.serialization.encoding.Encoder;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0001\u0018\u0000*\u0004\b\u0000\u0010\u0001*\u0004\b\u0001\u0010\u0002*\u0004\b\u0002\u0010\u00032\u001a\u0012\u0016\u0012\u0014\u0012\u0004\u0012\u0002H\u0001\u0012\u0004\u0012\u0002H\u0002\u0012\u0004\u0012\u0002H\u00030\u00050\u0004B1\u0012\f\u0010\u0006\u001a\b\u0012\u0004\u0012\u00028\u00000\u0004\u0012\f\u0010\u0007\u001a\b\u0012\u0004\u0012\u00028\u00010\u0004\u0012\f\u0010\b\u001a\b\u0012\u0004\u0012\u00028\u00020\u0004¢\u0006\u0004\b\t\u0010\nJ*\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0011\u001a\u00020\u00122\u0018\u0010\u0013\u001a\u0014\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u0001\u0012\u0004\u0012\u00028\u00020\u0005H\u0016J\"\u0010\u0014\u001a\u0014\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u0001\u0012\u0004\u0012\u00028\u00020\u00052\u0006\u0010\u0015\u001a\u00020\u0016H\u0016J\"\u0010\u0017\u001a\u0014\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u0001\u0012\u0004\u0012\u00028\u00020\u00052\u0006\u0010\u0018\u001a\u00020\u0019H\u0002J\"\u0010\u001a\u001a\u0014\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u0001\u0012\u0004\u0012\u00028\u00020\u00052\u0006\u0010\u0018\u001a\u00020\u0019H\u0002R\u0014\u0010\u0006\u001a\b\u0012\u0004\u0012\u00028\u00000\u0004X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u0007\u001a\b\u0012\u0004\u0012\u00028\u00010\u0004X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\b\u001a\b\u0012\u0004\u0012\u00028\u00020\u0004X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u000b\u001a\u00020\fX\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000e¨\u0006\u001b"}, d2 = {"Lkotlinx/serialization/internal/TripleSerializer;", "A", "B", "C", "Lkotlinx/serialization/KSerializer;", "Lkotlin/Triple;", "aSerializer", "bSerializer", "cSerializer", "<init>", "(Lkotlinx/serialization/KSerializer;Lkotlinx/serialization/KSerializer;Lkotlinx/serialization/KSerializer;)V", "descriptor", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "getDescriptor", "()Lkotlinx/serialization/descriptors/SerialDescriptor;", "serialize", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "encoder", "Lkotlinx/serialization/encoding/Encoder;", "value", "deserialize", "decoder", "Lkotlinx/serialization/encoding/Decoder;", "decodeSequentially", "composite", "Lkotlinx/serialization/encoding/CompositeDecoder;", "decodeStructure", "kotlinx-serialization-core"}, k = 1, mv = {2, 1, 0}, xi = 48)
@PublishedApi
/* loaded from: classes5.dex */
public final class TripleSerializer<A, B, C> implements KSerializer<Triple<? extends A, ? extends B, ? extends C>> {

    @NotNull
    private final KSerializer<A> aSerializer;

    @NotNull
    private final KSerializer<B> bSerializer;

    @NotNull
    private final KSerializer<C> cSerializer;

    @NotNull
    private final SerialDescriptor descriptor;

    public TripleSerializer(@NotNull KSerializer<A> aSerializer, @NotNull KSerializer<B> bSerializer, @NotNull KSerializer<C> cSerializer) {
        Intrinsics.g(aSerializer, "aSerializer");
        Intrinsics.g(bSerializer, "bSerializer");
        Intrinsics.g(cSerializer, "cSerializer");
        this.aSerializer = aSerializer;
        this.bSerializer = bSerializer;
        this.cSerializer = cSerializer;
        this.descriptor = SerialDescriptorsKt.buildClassSerialDescriptor("kotlin.Triple", new SerialDescriptor[0], new y0(this, 17));
    }

    private final Triple<A, B, C> decodeSequentially(CompositeDecoder composite) {
        Object objDecodeSerializableElement$default = CompositeDecoder.decodeSerializableElement$default(composite, getDescriptor(), 0, this.aSerializer, null, 8, null);
        Object objDecodeSerializableElement$default2 = CompositeDecoder.decodeSerializableElement$default(composite, getDescriptor(), 1, this.bSerializer, null, 8, null);
        Object objDecodeSerializableElement$default3 = CompositeDecoder.decodeSerializableElement$default(composite, getDescriptor(), 2, this.cSerializer, null, 8, null);
        composite.endStructure(getDescriptor());
        return new Triple<>(objDecodeSerializableElement$default, objDecodeSerializableElement$default2, objDecodeSerializableElement$default3);
    }

    private final Triple<A, B, C> decodeStructure(CompositeDecoder composite) {
        CompositeDecoder compositeDecoder;
        Object objDecodeSerializableElement$default = TuplesKt.NULL;
        Object objDecodeSerializableElement$default2 = TuplesKt.NULL;
        Object objDecodeSerializableElement$default3 = TuplesKt.NULL;
        while (true) {
            int iDecodeElementIndex = composite.decodeElementIndex(getDescriptor());
            if (iDecodeElementIndex == -1) {
                composite.endStructure(getDescriptor());
                if (objDecodeSerializableElement$default == TuplesKt.NULL) {
                    throw new SerializationException("Element 'first' is missing");
                }
                if (objDecodeSerializableElement$default2 == TuplesKt.NULL) {
                    throw new SerializationException("Element 'second' is missing");
                }
                if (objDecodeSerializableElement$default3 != TuplesKt.NULL) {
                    return new Triple<>(objDecodeSerializableElement$default, objDecodeSerializableElement$default2, objDecodeSerializableElement$default3);
                }
                throw new SerializationException("Element 'third' is missing");
            }
            if (iDecodeElementIndex == 0) {
                compositeDecoder = composite;
                objDecodeSerializableElement$default = CompositeDecoder.decodeSerializableElement$default(compositeDecoder, getDescriptor(), 0, this.aSerializer, null, 8, null);
            } else if (iDecodeElementIndex == 1) {
                compositeDecoder = composite;
                objDecodeSerializableElement$default2 = CompositeDecoder.decodeSerializableElement$default(compositeDecoder, getDescriptor(), 1, this.bSerializer, null, 8, null);
            } else {
                if (iDecodeElementIndex != 2) {
                    throw new SerializationException(c0.h(iDecodeElementIndex, "Unexpected index "));
                }
                objDecodeSerializableElement$default3 = CompositeDecoder.decodeSerializableElement$default(composite, getDescriptor(), 2, this.cSerializer, null, 8, null);
            }
            composite = compositeDecoder;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final Unit descriptor$lambda$0(TripleSerializer tripleSerializer, ClassSerialDescriptorBuilder buildClassSerialDescriptor) {
        Intrinsics.g(buildClassSerialDescriptor, "$this$buildClassSerialDescriptor");
        ClassSerialDescriptorBuilder.element$default(buildClassSerialDescriptor, "first", tripleSerializer.aSerializer.getDescriptor(), null, false, 12, null);
        ClassSerialDescriptorBuilder.element$default(buildClassSerialDescriptor, "second", tripleSerializer.bSerializer.getDescriptor(), null, false, 12, null);
        ClassSerialDescriptorBuilder.element$default(buildClassSerialDescriptor, "third", tripleSerializer.cSerializer.getDescriptor(), null, false, 12, null);
        return Unit.f71706a;
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    @NotNull
    public SerialDescriptor getDescriptor() {
        return this.descriptor;
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    @NotNull
    public Triple<A, B, C> deserialize(@NotNull Decoder decoder) {
        Intrinsics.g(decoder, "decoder");
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(getDescriptor());
        return compositeDecoderBeginStructure.decodeSequentially() ? decodeSequentially(compositeDecoderBeginStructure) : decodeStructure(compositeDecoderBeginStructure);
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public void serialize(@NotNull Encoder encoder, @NotNull Triple<? extends A, ? extends B, ? extends C> value) {
        Intrinsics.g(encoder, "encoder");
        Intrinsics.g(value, "value");
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(getDescriptor());
        compositeEncoderBeginStructure.encodeSerializableElement(getDescriptor(), 0, this.aSerializer, value.f71690a);
        compositeEncoderBeginStructure.encodeSerializableElement(getDescriptor(), 1, this.bSerializer, value.f71691b);
        compositeEncoderBeginStructure.encodeSerializableElement(getDescriptor(), 2, this.cSerializer, value.f71692c);
        compositeEncoderBeginStructure.endStructure(getDescriptor());
    }
}
