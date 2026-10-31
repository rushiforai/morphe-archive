package kotlinx.serialization.encoding;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Reflection;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlinx.serialization.DeserializationStrategy;
import kotlinx.serialization.ExperimentalSerializationApi;
import kotlinx.serialization.SerializationException;
import kotlinx.serialization.descriptors.SerialDescriptor;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0001\n\u0002\b\u0002\n\u0002\u0010\u0005\n\u0000\n\u0002\u0010\n\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u0007\n\u0000\n\u0002\u0010\u0006\n\u0000\n\u0002\u0010\f\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\u0002\n\u0002\b\u000f\b'\u0018\u00002\u00020\u00012\u00020\u0002B\u0007¢\u0006\u0004\b\u0003\u0010\u0004J\b\u0010\u0005\u001a\u00020\u0006H\u0016J\b\u0010\u0007\u001a\u00020\bH\u0016J\n\u0010\t\u001a\u0004\u0018\u00010\nH\u0016J\b\u0010\u000b\u001a\u00020\bH\u0016J\b\u0010\f\u001a\u00020\rH\u0016J\b\u0010\u000e\u001a\u00020\u000fH\u0016J\b\u0010\u0010\u001a\u00020\u0011H\u0016J\b\u0010\u0012\u001a\u00020\u0013H\u0016J\b\u0010\u0014\u001a\u00020\u0015H\u0016J\b\u0010\u0016\u001a\u00020\u0017H\u0016J\b\u0010\u0018\u001a\u00020\u0019H\u0016J\b\u0010\u001a\u001a\u00020\u001bH\u0016J\u0010\u0010\u001c\u001a\u00020\u00112\u0006\u0010\u001d\u001a\u00020\u001eH\u0016J\u0010\u0010\u001f\u001a\u00020\u00012\u0006\u0010 \u001a\u00020\u001eH\u0016J3\u0010!\u001a\u0002H\"\"\n\b\u0000\u0010\"*\u0004\u0018\u00010\u00062\f\u0010#\u001a\b\u0012\u0004\u0012\u0002H\"0$2\n\b\u0002\u0010%\u001a\u0004\u0018\u0001H\"H\u0016¢\u0006\u0002\u0010&J\u0010\u0010'\u001a\u00020\u00022\u0006\u0010 \u001a\u00020\u001eH\u0016J\u0010\u0010(\u001a\u00020)2\u0006\u0010 \u001a\u00020\u001eH\u0016J\u0016\u0010*\u001a\u00020\b2\u0006\u0010 \u001a\u00020\u001e2\u0006\u0010+\u001a\u00020\u0011J\u0016\u0010,\u001a\u00020\r2\u0006\u0010 \u001a\u00020\u001e2\u0006\u0010+\u001a\u00020\u0011J\u0016\u0010-\u001a\u00020\u000f2\u0006\u0010 \u001a\u00020\u001e2\u0006\u0010+\u001a\u00020\u0011J\u0016\u0010.\u001a\u00020\u00112\u0006\u0010 \u001a\u00020\u001e2\u0006\u0010+\u001a\u00020\u0011J\u0016\u0010/\u001a\u00020\u00132\u0006\u0010 \u001a\u00020\u001e2\u0006\u0010+\u001a\u00020\u0011J\u0016\u00100\u001a\u00020\u00152\u0006\u0010 \u001a\u00020\u001e2\u0006\u0010+\u001a\u00020\u0011J\u0016\u00101\u001a\u00020\u00172\u0006\u0010 \u001a\u00020\u001e2\u0006\u0010+\u001a\u00020\u0011J\u0016\u00102\u001a\u00020\u00192\u0006\u0010 \u001a\u00020\u001e2\u0006\u0010+\u001a\u00020\u0011J\u0016\u00103\u001a\u00020\u001b2\u0006\u0010 \u001a\u00020\u001e2\u0006\u0010+\u001a\u00020\u0011J\u0018\u00104\u001a\u00020\u00012\u0006\u0010 \u001a\u00020\u001e2\u0006\u0010+\u001a\u00020\u0011H\u0016J;\u00105\u001a\u0002H\"\"\u0004\b\u0000\u0010\"2\u0006\u0010 \u001a\u00020\u001e2\u0006\u0010+\u001a\u00020\u00112\f\u0010#\u001a\b\u0012\u0004\u0012\u0002H\"0$2\b\u0010%\u001a\u0004\u0018\u0001H\"H\u0016¢\u0006\u0002\u00106JA\u00107\u001a\u0004\u0018\u0001H\"\"\b\b\u0000\u0010\"*\u00020\u00062\u0006\u0010 \u001a\u00020\u001e2\u0006\u0010+\u001a\u00020\u00112\u000e\u0010#\u001a\n\u0012\u0006\u0012\u0004\u0018\u0001H\"0$2\b\u0010%\u001a\u0004\u0018\u0001H\"¢\u0006\u0002\u00106¨\u00068"}, d2 = {"Lkotlinx/serialization/encoding/AbstractDecoder;", "Lkotlinx/serialization/encoding/Decoder;", "Lkotlinx/serialization/encoding/CompositeDecoder;", "<init>", "()V", "decodeValue", b.f42142b, "decodeNotNullMark", b.f42142b, "decodeNull", b.f42142b, "decodeBoolean", "decodeByte", b.f42142b, "decodeShort", b.f42142b, "decodeInt", b.f42142b, "decodeLong", b.f42142b, "decodeFloat", b.f42142b, "decodeDouble", b.f42142b, "decodeChar", b.f42142b, "decodeString", b.f42142b, "decodeEnum", "enumDescriptor", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "decodeInline", "descriptor", "decodeSerializableValue", "T", "deserializer", "Lkotlinx/serialization/DeserializationStrategy;", "previousValue", "(Lkotlinx/serialization/DeserializationStrategy;Ljava/lang/Object;)Ljava/lang/Object;", "beginStructure", "endStructure", b.f42142b, "decodeBooleanElement", TTEDPEventConstants.EDP_EVENT_PROPERTY_INDEX, "decodeByteElement", "decodeShortElement", "decodeIntElement", "decodeLongElement", "decodeFloatElement", "decodeDoubleElement", "decodeCharElement", "decodeStringElement", "decodeInlineElement", "decodeSerializableElement", "(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/DeserializationStrategy;Ljava/lang/Object;)Ljava/lang/Object;", "decodeNullableSerializableElement", "kotlinx-serialization-core"}, k = 1, mv = {2, 1, 0}, xi = 48)
@ExperimentalSerializationApi
@SourceDebugExtension
/* loaded from: classes.dex */
public abstract class AbstractDecoder implements Decoder, CompositeDecoder {
    public static /* synthetic */ Object decodeSerializableValue$default(AbstractDecoder abstractDecoder, DeserializationStrategy deserializationStrategy, Object obj, int i5, Object obj2) {
        if (obj2 != null) {
            throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: decodeSerializableValue");
        }
        if ((i5 & 2) != 0) {
            obj = null;
        }
        return abstractDecoder.decodeSerializableValue(deserializationStrategy, obj);
    }

    @Override // kotlinx.serialization.encoding.Decoder
    @NotNull
    public CompositeDecoder beginStructure(@NotNull SerialDescriptor descriptor) {
        Intrinsics.g(descriptor, "descriptor");
        return this;
    }

    @Override // kotlinx.serialization.encoding.Decoder
    public boolean decodeBoolean() {
        Object objDecodeValue = decodeValue();
        Intrinsics.e(objDecodeValue, "null cannot be cast to non-null type kotlin.Boolean");
        return ((Boolean) objDecodeValue).booleanValue();
    }

    @Override // kotlinx.serialization.encoding.CompositeDecoder
    public final boolean decodeBooleanElement(@NotNull SerialDescriptor descriptor, int index) {
        Intrinsics.g(descriptor, "descriptor");
        return decodeBoolean();
    }

    @Override // kotlinx.serialization.encoding.Decoder
    public byte decodeByte() {
        Object objDecodeValue = decodeValue();
        Intrinsics.e(objDecodeValue, "null cannot be cast to non-null type kotlin.Byte");
        return ((Byte) objDecodeValue).byteValue();
    }

    @Override // kotlinx.serialization.encoding.CompositeDecoder
    public final byte decodeByteElement(@NotNull SerialDescriptor descriptor, int index) {
        Intrinsics.g(descriptor, "descriptor");
        return decodeByte();
    }

    @Override // kotlinx.serialization.encoding.Decoder
    public char decodeChar() {
        Object objDecodeValue = decodeValue();
        Intrinsics.e(objDecodeValue, "null cannot be cast to non-null type kotlin.Char");
        return ((Character) objDecodeValue).charValue();
    }

    @Override // kotlinx.serialization.encoding.CompositeDecoder
    public final char decodeCharElement(@NotNull SerialDescriptor descriptor, int index) {
        Intrinsics.g(descriptor, "descriptor");
        return decodeChar();
    }

    @Override // kotlinx.serialization.encoding.Decoder
    public double decodeDouble() {
        Object objDecodeValue = decodeValue();
        Intrinsics.e(objDecodeValue, "null cannot be cast to non-null type kotlin.Double");
        return ((Double) objDecodeValue).doubleValue();
    }

    @Override // kotlinx.serialization.encoding.CompositeDecoder
    public final double decodeDoubleElement(@NotNull SerialDescriptor descriptor, int index) {
        Intrinsics.g(descriptor, "descriptor");
        return decodeDouble();
    }

    @Override // kotlinx.serialization.encoding.Decoder
    public int decodeEnum(@NotNull SerialDescriptor enumDescriptor) {
        Intrinsics.g(enumDescriptor, "enumDescriptor");
        Object objDecodeValue = decodeValue();
        Intrinsics.e(objDecodeValue, "null cannot be cast to non-null type kotlin.Int");
        return ((Integer) objDecodeValue).intValue();
    }

    @Override // kotlinx.serialization.encoding.Decoder
    public float decodeFloat() {
        Object objDecodeValue = decodeValue();
        Intrinsics.e(objDecodeValue, "null cannot be cast to non-null type kotlin.Float");
        return ((Float) objDecodeValue).floatValue();
    }

    @Override // kotlinx.serialization.encoding.CompositeDecoder
    public final float decodeFloatElement(@NotNull SerialDescriptor descriptor, int index) {
        Intrinsics.g(descriptor, "descriptor");
        return decodeFloat();
    }

    @Override // kotlinx.serialization.encoding.Decoder
    @NotNull
    public Decoder decodeInline(@NotNull SerialDescriptor descriptor) {
        Intrinsics.g(descriptor, "descriptor");
        return this;
    }

    @Override // kotlinx.serialization.encoding.CompositeDecoder
    @NotNull
    public Decoder decodeInlineElement(@NotNull SerialDescriptor descriptor, int index) {
        Intrinsics.g(descriptor, "descriptor");
        return decodeInline(descriptor.getElementDescriptor(index));
    }

    @Override // kotlinx.serialization.encoding.Decoder
    public int decodeInt() {
        Object objDecodeValue = decodeValue();
        Intrinsics.e(objDecodeValue, "null cannot be cast to non-null type kotlin.Int");
        return ((Integer) objDecodeValue).intValue();
    }

    @Override // kotlinx.serialization.encoding.CompositeDecoder
    public final int decodeIntElement(@NotNull SerialDescriptor descriptor, int index) {
        Intrinsics.g(descriptor, "descriptor");
        return decodeInt();
    }

    @Override // kotlinx.serialization.encoding.Decoder
    public long decodeLong() {
        Object objDecodeValue = decodeValue();
        Intrinsics.e(objDecodeValue, "null cannot be cast to non-null type kotlin.Long");
        return ((Long) objDecodeValue).longValue();
    }

    @Override // kotlinx.serialization.encoding.CompositeDecoder
    public final long decodeLongElement(@NotNull SerialDescriptor descriptor, int index) {
        Intrinsics.g(descriptor, "descriptor");
        return decodeLong();
    }

    @Override // kotlinx.serialization.encoding.Decoder
    public boolean decodeNotNullMark() {
        return true;
    }

    @Override // kotlinx.serialization.encoding.Decoder
    @Nullable
    public Void decodeNull() {
        return null;
    }

    @Override // kotlinx.serialization.encoding.CompositeDecoder
    @Nullable
    public final <T> T decodeNullableSerializableElement(@NotNull SerialDescriptor descriptor, int index, @NotNull DeserializationStrategy<? extends T> deserializer, @Nullable T previousValue) {
        Intrinsics.g(descriptor, "descriptor");
        Intrinsics.g(deserializer, "deserializer");
        return (deserializer.getDescriptor().getIsNullable() || decodeNotNullMark()) ? (T) decodeSerializableValue(deserializer, previousValue) : (T) decodeNull();
    }

    @Override // kotlinx.serialization.encoding.CompositeDecoder
    public <T> T decodeSerializableElement(@NotNull SerialDescriptor descriptor, int index, @NotNull DeserializationStrategy<? extends T> deserializer, @Nullable T previousValue) {
        Intrinsics.g(descriptor, "descriptor");
        Intrinsics.g(deserializer, "deserializer");
        return (T) decodeSerializableValue(deserializer, previousValue);
    }

    public <T> T decodeSerializableValue(@NotNull DeserializationStrategy<? extends T> deserializer, @Nullable T previousValue) {
        Intrinsics.g(deserializer, "deserializer");
        return (T) decodeSerializableValue(deserializer);
    }

    @Override // kotlinx.serialization.encoding.Decoder
    public short decodeShort() {
        Object objDecodeValue = decodeValue();
        Intrinsics.e(objDecodeValue, "null cannot be cast to non-null type kotlin.Short");
        return ((Short) objDecodeValue).shortValue();
    }

    @Override // kotlinx.serialization.encoding.CompositeDecoder
    public final short decodeShortElement(@NotNull SerialDescriptor descriptor, int index) {
        Intrinsics.g(descriptor, "descriptor");
        return decodeShort();
    }

    @Override // kotlinx.serialization.encoding.Decoder
    @NotNull
    public String decodeString() {
        Object objDecodeValue = decodeValue();
        Intrinsics.e(objDecodeValue, "null cannot be cast to non-null type kotlin.String");
        return (String) objDecodeValue;
    }

    @Override // kotlinx.serialization.encoding.CompositeDecoder
    @NotNull
    public final String decodeStringElement(@NotNull SerialDescriptor descriptor, int index) {
        Intrinsics.g(descriptor, "descriptor");
        return decodeString();
    }

    @NotNull
    public Object decodeValue() {
        throw new SerializationException(Reflection.f71864a.getOrCreateKotlinClass(getClass()) + " can't retrieve untyped values");
    }

    @Override // kotlinx.serialization.encoding.CompositeDecoder
    public void endStructure(@NotNull SerialDescriptor descriptor) {
        Intrinsics.g(descriptor, "descriptor");
    }
}
