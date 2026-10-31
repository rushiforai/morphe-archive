package kotlinx.serialization.protobuf.internal;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlinx.serialization.DeserializationStrategy;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.CompositeDecoder;
import kotlinx.serialization.encoding.Decoder;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000v\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\t\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\u0005\n\u0000\n\u0002\u0010\n\n\u0002\b\u0003\n\u0002\u0010\u0007\n\u0000\n\u0002\u0010\u0006\n\u0000\n\u0002\u0010\f\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\u0001\n\u0002\b\u000e\n\u0002\u0010\u0002\n\u0002\b\u000f\b \u0018\u00002\u00020\u00012\u00020\u00022\u00020\u0003B\u0007¢\u0006\u0004\b\u0004\u0010\u0005J\u0018\u0010\u0006\u001a\u00060\u0007j\u0002`\b*\u00020\t2\u0006\u0010\n\u001a\u00020\u000bH$J\u0014\u0010\f\u001a\u00020\r2\n\u0010\u000e\u001a\u00060\u0007j\u0002`\bH$J\u0014\u0010\u000f\u001a\u00020\u00102\n\u0010\u000e\u001a\u00060\u0007j\u0002`\bH$J\u0014\u0010\u0011\u001a\u00020\u00122\n\u0010\u000e\u001a\u00060\u0007j\u0002`\bH$J\u0014\u0010\u0013\u001a\u00020\u000b2\n\u0010\u000e\u001a\u00060\u0007j\u0002`\bH$J\u0014\u0010\u0014\u001a\u00020\u00072\n\u0010\u000e\u001a\u00060\u0007j\u0002`\bH$J\u0014\u0010\u0015\u001a\u00020\u00162\n\u0010\u000e\u001a\u00060\u0007j\u0002`\bH$J\u0014\u0010\u0017\u001a\u00020\u00182\n\u0010\u000e\u001a\u00060\u0007j\u0002`\bH$J\u0014\u0010\u0019\u001a\u00020\u001a2\n\u0010\u000e\u001a\u00060\u0007j\u0002`\bH$J\u0014\u0010\u001b\u001a\u00020\u001c2\n\u0010\u000e\u001a\u00060\u0007j\u0002`\bH$J\u001c\u0010\u001d\u001a\u00020\u000b2\n\u0010\u000e\u001a\u00060\u0007j\u0002`\b2\u0006\u0010\u001e\u001a\u00020\tH$J1\u0010\u001f\u001a\u0002H \"\n\b\u0000\u0010 *\u0004\u0018\u00010!2\f\u0010\"\u001a\b\u0012\u0004\u0012\u0002H 0#2\b\u0010$\u001a\u0004\u0018\u0001H H$¢\u0006\u0002\u0010%J\u001c\u0010&\u001a\u00020\u00022\n\u0010\u000e\u001a\u00060\u0007j\u0002`\b2\u0006\u0010'\u001a\u00020\tH\u0014J\b\u0010(\u001a\u00020\rH\u0016J\b\u0010)\u001a\u0004\u0018\u00010*J\u0006\u0010+\u001a\u00020\rJ\u0006\u0010,\u001a\u00020\u0010J\u0006\u0010-\u001a\u00020\u0012J\u0006\u0010.\u001a\u00020\u000bJ\u0006\u0010/\u001a\u00020\u0007J\u0006\u00100\u001a\u00020\u0016J\u0006\u00101\u001a\u00020\u0018J\u0006\u00102\u001a\u00020\u001aJ\u0006\u00103\u001a\u00020\u001cJ\u000e\u00104\u001a\u00020\u000b2\u0006\u00105\u001a\u00020\tJ\u0010\u00106\u001a\u00020\u00032\u0006\u00107\u001a\u00020\tH\u0016J\u0010\u00108\u001a\u0002092\u0006\u00107\u001a\u00020\tH\u0016J\u0016\u0010:\u001a\u00020\r2\u0006\u00107\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000bJ\u0016\u0010;\u001a\u00020\u00102\u0006\u00107\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000bJ\u0016\u0010<\u001a\u00020\u00122\u0006\u00107\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000bJ\u0016\u0010=\u001a\u00020\u000b2\u0006\u00107\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000bJ\u0016\u0010>\u001a\u00020\u00072\u0006\u00107\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000bJ\u0016\u0010?\u001a\u00020\u00162\u0006\u00107\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000bJ\u0016\u0010@\u001a\u00020\u00182\u0006\u00107\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000bJ\u0016\u0010A\u001a\u00020\u001a2\u0006\u00107\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000bJ\u0016\u0010B\u001a\u00020\u001c2\u0006\u00107\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000bJ?\u0010C\u001a\u0002H \"\n\b\u0000\u0010 *\u0004\u0018\u00010!2\u0006\u00107\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000b2\f\u0010\"\u001a\b\u0012\u0004\u0012\u0002H 0#2\b\u0010$\u001a\u0004\u0018\u0001H ¢\u0006\u0002\u0010DJA\u0010E\u001a\u0004\u0018\u0001H \"\b\b\u0000\u0010 *\u00020!2\u0006\u00107\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000b2\u000e\u0010\"\u001a\n\u0012\u0006\u0012\u0004\u0018\u0001H 0#2\b\u0010$\u001a\u0004\u0018\u0001H ¢\u0006\u0002\u0010DJ\u0010\u0010F\u001a\u00020\u00022\u0006\u00107\u001a\u00020\tH\u0016J\u0018\u0010G\u001a\u00020\u00022\u0006\u00107\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000bH\u0016¨\u0006H"}, d2 = {"Lkotlinx/serialization/protobuf/internal/ProtobufTaggedDecoder;", "Lkotlinx/serialization/protobuf/internal/ProtobufTaggedBase;", "Lkotlinx/serialization/encoding/Decoder;", "Lkotlinx/serialization/encoding/CompositeDecoder;", "<init>", "()V", "getTag", b.f42142b, "Lkotlinx/serialization/protobuf/internal/ProtoDesc;", "Lkotlinx/serialization/descriptors/SerialDescriptor;", TTEDPEventConstants.EDP_EVENT_PROPERTY_INDEX, b.f42142b, "decodeTaggedBoolean", b.f42142b, "tag", "decodeTaggedByte", b.f42142b, "decodeTaggedShort", b.f42142b, "decodeTaggedInt", "decodeTaggedLong", "decodeTaggedFloat", b.f42142b, "decodeTaggedDouble", b.f42142b, "decodeTaggedChar", b.f42142b, "decodeTaggedString", b.f42142b, "decodeTaggedEnum", "enumDescription", "decodeSerializableValue", "T", b.f42142b, "deserializer", "Lkotlinx/serialization/DeserializationStrategy;", "previousValue", "(Lkotlinx/serialization/DeserializationStrategy;Ljava/lang/Object;)Ljava/lang/Object;", "decodeTaggedInline", "inlineDescriptor", "decodeNotNullMark", "decodeNull", b.f42142b, "decodeBoolean", "decodeByte", "decodeShort", "decodeInt", "decodeLong", "decodeFloat", "decodeDouble", "decodeChar", "decodeString", "decodeEnum", "enumDescriptor", "beginStructure", "descriptor", "endStructure", b.f42142b, "decodeBooleanElement", "decodeByteElement", "decodeShortElement", "decodeIntElement", "decodeLongElement", "decodeFloatElement", "decodeDoubleElement", "decodeCharElement", "decodeStringElement", "decodeSerializableElement", "(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/DeserializationStrategy;Ljava/lang/Object;)Ljava/lang/Object;", "decodeNullableSerializableElement", "decodeInline", "decodeInlineElement", "kotlinx-serialization-protobuf"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes.dex */
public abstract class ProtobufTaggedDecoder extends ProtobufTaggedBase implements Decoder, CompositeDecoder {
    @NotNull
    public CompositeDecoder beginStructure(@NotNull SerialDescriptor descriptor) {
        Intrinsics.g(descriptor, "descriptor");
        return this;
    }

    @Override // kotlinx.serialization.encoding.Decoder
    public final boolean decodeBoolean() {
        return decodeTaggedBoolean(popTagOrDefault());
    }

    @Override // kotlinx.serialization.encoding.CompositeDecoder
    public final boolean decodeBooleanElement(@NotNull SerialDescriptor descriptor, int index) {
        Intrinsics.g(descriptor, "descriptor");
        return decodeTaggedBoolean(getTag(descriptor, index));
    }

    @Override // kotlinx.serialization.encoding.Decoder
    public final byte decodeByte() {
        return decodeTaggedByte(popTagOrDefault());
    }

    @Override // kotlinx.serialization.encoding.CompositeDecoder
    public final byte decodeByteElement(@NotNull SerialDescriptor descriptor, int index) {
        Intrinsics.g(descriptor, "descriptor");
        return decodeTaggedByte(getTag(descriptor, index));
    }

    @Override // kotlinx.serialization.encoding.Decoder
    public final char decodeChar() {
        return decodeTaggedChar(popTagOrDefault());
    }

    @Override // kotlinx.serialization.encoding.CompositeDecoder
    public final char decodeCharElement(@NotNull SerialDescriptor descriptor, int index) {
        Intrinsics.g(descriptor, "descriptor");
        return decodeTaggedChar(getTag(descriptor, index));
    }

    @Override // kotlinx.serialization.encoding.Decoder
    public final double decodeDouble() {
        return decodeTaggedDouble(popTagOrDefault());
    }

    @Override // kotlinx.serialization.encoding.CompositeDecoder
    public final double decodeDoubleElement(@NotNull SerialDescriptor descriptor, int index) {
        Intrinsics.g(descriptor, "descriptor");
        return decodeTaggedDouble(getTag(descriptor, index));
    }

    @Override // kotlinx.serialization.encoding.Decoder
    public final int decodeEnum(@NotNull SerialDescriptor enumDescriptor) {
        Intrinsics.g(enumDescriptor, "enumDescriptor");
        return decodeTaggedEnum(popTagOrDefault(), enumDescriptor);
    }

    @Override // kotlinx.serialization.encoding.Decoder
    public final float decodeFloat() {
        return decodeTaggedFloat(popTagOrDefault());
    }

    @Override // kotlinx.serialization.encoding.CompositeDecoder
    public final float decodeFloatElement(@NotNull SerialDescriptor descriptor, int index) {
        Intrinsics.g(descriptor, "descriptor");
        return decodeTaggedFloat(getTag(descriptor, index));
    }

    @Override // kotlinx.serialization.encoding.Decoder
    @NotNull
    public Decoder decodeInline(@NotNull SerialDescriptor descriptor) {
        Intrinsics.g(descriptor, "descriptor");
        return decodeTaggedInline(popTag(), descriptor);
    }

    @Override // kotlinx.serialization.encoding.CompositeDecoder
    @NotNull
    public Decoder decodeInlineElement(@NotNull SerialDescriptor descriptor, int index) {
        Intrinsics.g(descriptor, "descriptor");
        return decodeTaggedInline(getTag(descriptor, index), descriptor.getElementDescriptor(index));
    }

    @Override // kotlinx.serialization.encoding.Decoder
    public final int decodeInt() {
        return decodeTaggedInt(popTagOrDefault());
    }

    @Override // kotlinx.serialization.encoding.CompositeDecoder
    public final int decodeIntElement(@NotNull SerialDescriptor descriptor, int index) {
        Intrinsics.g(descriptor, "descriptor");
        return decodeTaggedInt(getTag(descriptor, index));
    }

    @Override // kotlinx.serialization.encoding.Decoder
    public final long decodeLong() {
        return decodeTaggedLong(popTagOrDefault());
    }

    @Override // kotlinx.serialization.encoding.CompositeDecoder
    public final long decodeLongElement(@NotNull SerialDescriptor descriptor, int index) {
        Intrinsics.g(descriptor, "descriptor");
        return decodeTaggedLong(getTag(descriptor, index));
    }

    public boolean decodeNotNullMark() {
        return true;
    }

    @Override // kotlinx.serialization.encoding.Decoder
    @Nullable
    public final Void decodeNull() {
        return null;
    }

    @Override // kotlinx.serialization.encoding.CompositeDecoder
    @Nullable
    public final <T> T decodeNullableSerializableElement(@NotNull SerialDescriptor descriptor, int index, @NotNull DeserializationStrategy<? extends T> deserializer, @Nullable T previousValue) {
        Intrinsics.g(descriptor, "descriptor");
        Intrinsics.g(deserializer, "deserializer");
        pushTag(getTag(descriptor, index));
        return decodeNotNullMark() ? (T) decodeSerializableValue(deserializer, previousValue) : (T) decodeNull();
    }

    @Override // kotlinx.serialization.encoding.CompositeDecoder
    public final <T> T decodeSerializableElement(@NotNull SerialDescriptor descriptor, int index, @NotNull DeserializationStrategy<? extends T> deserializer, @Nullable T previousValue) {
        Intrinsics.g(descriptor, "descriptor");
        Intrinsics.g(deserializer, "deserializer");
        pushTag(getTag(descriptor, index));
        return (T) decodeSerializableValue(deserializer, previousValue);
    }

    public abstract <T> T decodeSerializableValue(@NotNull DeserializationStrategy<? extends T> deserializer, @Nullable T previousValue);

    @Override // kotlinx.serialization.encoding.Decoder
    public final short decodeShort() {
        return decodeTaggedShort(popTagOrDefault());
    }

    @Override // kotlinx.serialization.encoding.CompositeDecoder
    public final short decodeShortElement(@NotNull SerialDescriptor descriptor, int index) {
        Intrinsics.g(descriptor, "descriptor");
        return decodeTaggedShort(getTag(descriptor, index));
    }

    @Override // kotlinx.serialization.encoding.Decoder
    @NotNull
    public final String decodeString() {
        return decodeTaggedString(popTagOrDefault());
    }

    @Override // kotlinx.serialization.encoding.CompositeDecoder
    @NotNull
    public final String decodeStringElement(@NotNull SerialDescriptor descriptor, int index) {
        Intrinsics.g(descriptor, "descriptor");
        return decodeTaggedString(getTag(descriptor, index));
    }

    public abstract boolean decodeTaggedBoolean(long tag);

    public abstract byte decodeTaggedByte(long tag);

    public abstract char decodeTaggedChar(long tag);

    public abstract double decodeTaggedDouble(long tag);

    public abstract int decodeTaggedEnum(long tag, @NotNull SerialDescriptor enumDescription);

    public abstract float decodeTaggedFloat(long tag);

    @NotNull
    public Decoder decodeTaggedInline(long tag, @NotNull SerialDescriptor inlineDescriptor) {
        Intrinsics.g(inlineDescriptor, "inlineDescriptor");
        pushTag(tag);
        return this;
    }

    public abstract int decodeTaggedInt(long tag);

    public abstract long decodeTaggedLong(long tag);

    public abstract short decodeTaggedShort(long tag);

    @NotNull
    public abstract String decodeTaggedString(long tag);

    public void endStructure(@NotNull SerialDescriptor descriptor) {
        Intrinsics.g(descriptor, "descriptor");
    }

    public abstract long getTag(@NotNull SerialDescriptor serialDescriptor, int i5);
}
