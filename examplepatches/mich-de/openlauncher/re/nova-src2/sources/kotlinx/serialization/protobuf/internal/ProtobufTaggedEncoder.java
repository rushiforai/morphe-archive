package kotlinx.serialization.protobuf.internal;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import kotlin.Metadata;
import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlinx.serialization.SerializationException;
import kotlinx.serialization.SerializationStrategy;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.descriptors.SerialKind;
import kotlinx.serialization.descriptors.StructureKind;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.encoding.Encoder;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000z\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0003\n\u0002\u0010\u0005\n\u0000\n\u0002\u0010\n\n\u0002\b\u0002\n\u0002\u0010\u0007\n\u0000\n\u0002\u0010\u0006\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\f\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u001d\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\b \u0018\u00002\u00020\u00012\u00020\u00022\u00020\u0003:\u0001HB\u0007¢\u0006\u0004\b\u0004\u0010\u0005J\u0018\u0010\b\u001a\u00060\tj\u0002`\n*\u00020\u000b2\u0006\u0010\f\u001a\u00020\rH$J\u001c\u0010\u000e\u001a\u00020\u000f2\n\u0010\u0010\u001a\u00060\tj\u0002`\n2\u0006\u0010\u0011\u001a\u00020\rH$J\u001c\u0010\u0012\u001a\u00020\u000f2\n\u0010\u0010\u001a\u00060\tj\u0002`\n2\u0006\u0010\u0011\u001a\u00020\u0013H$J\u001c\u0010\u0014\u001a\u00020\u000f2\n\u0010\u0010\u001a\u00060\tj\u0002`\n2\u0006\u0010\u0011\u001a\u00020\u0015H$J\u001c\u0010\u0016\u001a\u00020\u000f2\n\u0010\u0010\u001a\u00060\tj\u0002`\n2\u0006\u0010\u0011\u001a\u00020\tH$J\u001c\u0010\u0017\u001a\u00020\u000f2\n\u0010\u0010\u001a\u00060\tj\u0002`\n2\u0006\u0010\u0011\u001a\u00020\u0018H$J\u001c\u0010\u0019\u001a\u00020\u000f2\n\u0010\u0010\u001a\u00060\tj\u0002`\n2\u0006\u0010\u0011\u001a\u00020\u001aH$J\u001c\u0010\u001b\u001a\u00020\u000f2\n\u0010\u0010\u001a\u00060\tj\u0002`\n2\u0006\u0010\u0011\u001a\u00020\u001cH$J\u001c\u0010\u001d\u001a\u00020\u000f2\n\u0010\u0010\u001a\u00060\tj\u0002`\n2\u0006\u0010\u0011\u001a\u00020\u001eH$J\u001c\u0010\u001f\u001a\u00020\u000f2\n\u0010\u0010\u001a\u00060\tj\u0002`\n2\u0006\u0010\u0011\u001a\u00020 H$J$\u0010!\u001a\u00020\u000f2\n\u0010\u0010\u001a\u00060\tj\u0002`\n2\u0006\u0010\"\u001a\u00020\u000b2\u0006\u0010#\u001a\u00020\rH$J\u001c\u0010$\u001a\u00020\u00022\n\u0010\u0010\u001a\u00060\tj\u0002`\n2\u0006\u0010%\u001a\u00020\u000bH\u0014J\u0006\u0010&\u001a\u00020\u000fJ\u000e\u0010'\u001a\u00020\u000f2\u0006\u0010\u0011\u001a\u00020\u001cJ\u000e\u0010(\u001a\u00020\u000f2\u0006\u0010\u0011\u001a\u00020\u0013J\u000e\u0010)\u001a\u00020\u000f2\u0006\u0010\u0011\u001a\u00020\u0015J\u000e\u0010*\u001a\u00020\u000f2\u0006\u0010\u0011\u001a\u00020\rJ\u000e\u0010+\u001a\u00020\u000f2\u0006\u0010\u0011\u001a\u00020\tJ\u000e\u0010,\u001a\u00020\u000f2\u0006\u0010\u0011\u001a\u00020\u0018J\u000e\u0010-\u001a\u00020\u000f2\u0006\u0010\u0011\u001a\u00020\u001aJ\u000e\u0010.\u001a\u00020\u000f2\u0006\u0010\u0011\u001a\u00020\u001eJ\u000e\u0010/\u001a\u00020\u000f2\u0006\u0010\u0011\u001a\u00020 J\u0016\u00100\u001a\u00020\u000f2\u0006\u0010\"\u001a\u00020\u000b2\u0006\u0010\f\u001a\u00020\rJ\u000e\u00101\u001a\u00020\u000f2\u0006\u00102\u001a\u00020\u000bJ\u0010\u00103\u001a\u00020\u000f2\u0006\u00102\u001a\u00020\u000bH\u0014J\u001e\u00104\u001a\u00020\u000f2\u0006\u00102\u001a\u00020\u000b2\u0006\u0010\f\u001a\u00020\r2\u0006\u0010\u0011\u001a\u00020\u001cJ\u001e\u00105\u001a\u00020\u000f2\u0006\u00102\u001a\u00020\u000b2\u0006\u0010\f\u001a\u00020\r2\u0006\u0010\u0011\u001a\u00020\u0013J\u001e\u00106\u001a\u00020\u000f2\u0006\u00102\u001a\u00020\u000b2\u0006\u0010\f\u001a\u00020\r2\u0006\u0010\u0011\u001a\u00020\u0015J\u001e\u00107\u001a\u00020\u000f2\u0006\u00102\u001a\u00020\u000b2\u0006\u0010\f\u001a\u00020\r2\u0006\u0010\u0011\u001a\u00020\rJ\u001e\u00108\u001a\u00020\u000f2\u0006\u00102\u001a\u00020\u000b2\u0006\u0010\f\u001a\u00020\r2\u0006\u0010\u0011\u001a\u00020\tJ\u001e\u00109\u001a\u00020\u000f2\u0006\u00102\u001a\u00020\u000b2\u0006\u0010\f\u001a\u00020\r2\u0006\u0010\u0011\u001a\u00020\u0018J\u001e\u0010:\u001a\u00020\u000f2\u0006\u00102\u001a\u00020\u000b2\u0006\u0010\f\u001a\u00020\r2\u0006\u0010\u0011\u001a\u00020\u001aJ\u001e\u0010;\u001a\u00020\u000f2\u0006\u00102\u001a\u00020\u000b2\u0006\u0010\f\u001a\u00020\r2\u0006\u0010\u0011\u001a\u00020\u001eJ\u001e\u0010<\u001a\u00020\u000f2\u0006\u00102\u001a\u00020\u000b2\u0006\u0010\f\u001a\u00020\r2\u0006\u0010\u0011\u001a\u00020 J\f\u0010=\u001a\u00020\u001c*\u00020>H\u0002J=\u0010?\u001a\u00020\u000f\"\n\b\u0000\u0010@*\u0004\u0018\u00010A2\u0006\u00102\u001a\u00020\u000b2\u0006\u0010\f\u001a\u00020\r2\f\u0010B\u001a\b\u0012\u0004\u0012\u0002H@0C2\u0006\u0010\u0011\u001a\u0002H@¢\u0006\u0002\u0010DJ=\u0010E\u001a\u00020\u000f\"\b\b\u0000\u0010@*\u00020A2\u0006\u00102\u001a\u00020\u000b2\u0006\u0010\f\u001a\u00020\r2\f\u0010B\u001a\b\u0012\u0004\u0012\u0002H@0C2\b\u0010\u0011\u001a\u0004\u0018\u0001H@¢\u0006\u0002\u0010DJ\u0010\u0010F\u001a\u00020\u00022\u0006\u00102\u001a\u00020\u000bH\u0016J\u0018\u0010G\u001a\u00020\u00022\u0006\u00102\u001a\u00020\u000b2\u0006\u0010\f\u001a\u00020\rH\u0016R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u000e¢\u0006\u0002\n\u0000¨\u0006I"}, d2 = {"Lkotlinx/serialization/protobuf/internal/ProtobufTaggedEncoder;", "Lkotlinx/serialization/protobuf/internal/ProtobufTaggedBase;", "Lkotlinx/serialization/encoding/Encoder;", "Lkotlinx/serialization/encoding/CompositeEncoder;", "<init>", "()V", "nullableMode", "Lkotlinx/serialization/protobuf/internal/ProtobufTaggedEncoder$NullableMode;", "getTag", b.f42142b, "Lkotlinx/serialization/protobuf/internal/ProtoDesc;", "Lkotlinx/serialization/descriptors/SerialDescriptor;", TTEDPEventConstants.EDP_EVENT_PROPERTY_INDEX, b.f42142b, "encodeTaggedInt", b.f42142b, "tag", "value", "encodeTaggedByte", b.f42142b, "encodeTaggedShort", b.f42142b, "encodeTaggedLong", "encodeTaggedFloat", b.f42142b, "encodeTaggedDouble", b.f42142b, "encodeTaggedBoolean", b.f42142b, "encodeTaggedChar", b.f42142b, "encodeTaggedString", b.f42142b, "encodeTaggedEnum", "enumDescriptor", "ordinal", "encodeTaggedInline", "inlineDescriptor", "encodeNull", "encodeBoolean", "encodeByte", "encodeShort", "encodeInt", "encodeLong", "encodeFloat", "encodeDouble", "encodeChar", "encodeString", "encodeEnum", "endStructure", "descriptor", "endEncode", "encodeBooleanElement", "encodeByteElement", "encodeShortElement", "encodeIntElement", "encodeLongElement", "encodeFloatElement", "encodeDoubleElement", "encodeCharElement", "encodeStringElement", "isMapOrList", "Lkotlinx/serialization/descriptors/SerialKind;", "encodeSerializableElement", "T", b.f42142b, "serializer", "Lkotlinx/serialization/SerializationStrategy;", "(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/SerializationStrategy;Ljava/lang/Object;)V", "encodeNullableSerializableElement", "encodeInline", "encodeInlineElement", "NullableMode", "kotlinx-serialization-protobuf"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes.dex */
public abstract class ProtobufTaggedEncoder extends ProtobufTaggedBase implements Encoder, CompositeEncoder {

    @NotNull
    private NullableMode nullableMode = NullableMode.NOT_NULL;

    /* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
    /* JADX WARN: Unknown enum class pattern. Please report as an issue! */
    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\b\b\b\u0082\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003j\u0002\b\u0004j\u0002\b\u0005j\u0002\b\u0006j\u0002\b\u0007j\u0002\b\b¨\u0006\t"}, d2 = {"Lkotlinx/serialization/protobuf/internal/ProtobufTaggedEncoder$NullableMode;", b.f42142b, "<init>", "(Ljava/lang/String;I)V", "ACCEPTABLE", "OPTIONAL", "COLLECTION", "LIST_ELEMENT", "NOT_NULL", "kotlinx-serialization-protobuf"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class NullableMode {
        private static final /* synthetic */ EnumEntries $ENTRIES;
        private static final /* synthetic */ NullableMode[] $VALUES;
        public static final NullableMode ACCEPTABLE = new NullableMode("ACCEPTABLE", 0);
        public static final NullableMode OPTIONAL = new NullableMode("OPTIONAL", 1);
        public static final NullableMode COLLECTION = new NullableMode("COLLECTION", 2);
        public static final NullableMode LIST_ELEMENT = new NullableMode("LIST_ELEMENT", 3);
        public static final NullableMode NOT_NULL = new NullableMode("NOT_NULL", 4);

        private static final /* synthetic */ NullableMode[] $values() {
            return new NullableMode[]{ACCEPTABLE, OPTIONAL, COLLECTION, LIST_ELEMENT, NOT_NULL};
        }

        static {
            NullableMode[] nullableModeArr$values = $values();
            $VALUES = nullableModeArr$values;
            $ENTRIES = EnumEntriesKt.a(nullableModeArr$values);
        }

        private NullableMode(String str, int i5) {
        }

        @NotNull
        public static EnumEntries<NullableMode> getEntries() {
            return $ENTRIES;
        }

        public static NullableMode valueOf(String str) {
            return (NullableMode) Enum.valueOf(NullableMode.class, str);
        }

        public static NullableMode[] values() {
            return (NullableMode[]) $VALUES.clone();
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    /* loaded from: classes5.dex */
    public /* synthetic */ class WhenMappings {
        public static final /* synthetic */ int[] $EnumSwitchMapping$0;

        static {
            int[] iArr = new int[NullableMode.values().length];
            try {
                iArr[NullableMode.OPTIONAL.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                iArr[NullableMode.COLLECTION.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                iArr[NullableMode.LIST_ELEMENT.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            try {
                iArr[NullableMode.NOT_NULL.ordinal()] = 4;
            } catch (NoSuchFieldError unused4) {
            }
            $EnumSwitchMapping$0 = iArr;
        }
    }

    private final boolean isMapOrList(SerialKind serialKind) {
        return Intrinsics.b(serialKind, StructureKind.MAP.INSTANCE) || Intrinsics.b(serialKind, StructureKind.LIST.INSTANCE);
    }

    @Override // kotlinx.serialization.encoding.Encoder
    public final void encodeBoolean(boolean value) {
        encodeTaggedBoolean(popTagOrDefault(), value);
    }

    @Override // kotlinx.serialization.encoding.CompositeEncoder
    public final void encodeBooleanElement(@NotNull SerialDescriptor descriptor, int index, boolean value) {
        Intrinsics.g(descriptor, "descriptor");
        encodeTaggedBoolean(getTag(descriptor, index), value);
    }

    @Override // kotlinx.serialization.encoding.Encoder
    public final void encodeByte(byte value) {
        encodeTaggedByte(popTagOrDefault(), value);
    }

    @Override // kotlinx.serialization.encoding.CompositeEncoder
    public final void encodeByteElement(@NotNull SerialDescriptor descriptor, int index, byte value) {
        Intrinsics.g(descriptor, "descriptor");
        encodeTaggedByte(getTag(descriptor, index), value);
    }

    @Override // kotlinx.serialization.encoding.Encoder
    public final void encodeChar(char value) {
        encodeTaggedChar(popTagOrDefault(), value);
    }

    @Override // kotlinx.serialization.encoding.CompositeEncoder
    public final void encodeCharElement(@NotNull SerialDescriptor descriptor, int index, char value) {
        Intrinsics.g(descriptor, "descriptor");
        encodeTaggedChar(getTag(descriptor, index), value);
    }

    @Override // kotlinx.serialization.encoding.Encoder
    public final void encodeDouble(double value) {
        encodeTaggedDouble(popTagOrDefault(), value);
    }

    @Override // kotlinx.serialization.encoding.CompositeEncoder
    public final void encodeDoubleElement(@NotNull SerialDescriptor descriptor, int index, double value) {
        Intrinsics.g(descriptor, "descriptor");
        encodeTaggedDouble(getTag(descriptor, index), value);
    }

    @Override // kotlinx.serialization.encoding.Encoder
    public final void encodeEnum(@NotNull SerialDescriptor enumDescriptor, int index) {
        Intrinsics.g(enumDescriptor, "enumDescriptor");
        encodeTaggedEnum(popTagOrDefault(), enumDescriptor, index);
    }

    @Override // kotlinx.serialization.encoding.Encoder
    public final void encodeFloat(float value) {
        encodeTaggedFloat(popTagOrDefault(), value);
    }

    @Override // kotlinx.serialization.encoding.CompositeEncoder
    public final void encodeFloatElement(@NotNull SerialDescriptor descriptor, int index, float value) {
        Intrinsics.g(descriptor, "descriptor");
        encodeTaggedFloat(getTag(descriptor, index), value);
    }

    @NotNull
    public Encoder encodeInline(@NotNull SerialDescriptor descriptor) {
        Intrinsics.g(descriptor, "descriptor");
        return encodeTaggedInline(popTag(), descriptor);
    }

    @Override // kotlinx.serialization.encoding.CompositeEncoder
    @NotNull
    public Encoder encodeInlineElement(@NotNull SerialDescriptor descriptor, int index) {
        Intrinsics.g(descriptor, "descriptor");
        return encodeTaggedInline(getTag(descriptor, index), descriptor.getElementDescriptor(index));
    }

    @Override // kotlinx.serialization.encoding.Encoder
    public final void encodeInt(int value) {
        encodeTaggedInt(popTagOrDefault(), value);
    }

    @Override // kotlinx.serialization.encoding.CompositeEncoder
    public final void encodeIntElement(@NotNull SerialDescriptor descriptor, int index, int value) {
        Intrinsics.g(descriptor, "descriptor");
        encodeTaggedInt(getTag(descriptor, index), value);
    }

    @Override // kotlinx.serialization.encoding.Encoder
    public final void encodeLong(long value) {
        encodeTaggedLong(popTagOrDefault(), value);
    }

    @Override // kotlinx.serialization.encoding.CompositeEncoder
    public final void encodeLongElement(@NotNull SerialDescriptor descriptor, int index, long value) {
        Intrinsics.g(descriptor, "descriptor");
        encodeTaggedLong(getTag(descriptor, index), value);
    }

    @Override // kotlinx.serialization.encoding.Encoder
    public final void encodeNull() {
        NullableMode nullableMode = this.nullableMode;
        if (nullableMode != NullableMode.ACCEPTABLE) {
            int i5 = WhenMappings.$EnumSwitchMapping$0[nullableMode.ordinal()];
            throw new SerializationException(i5 != 1 ? i5 != 2 ? i5 != 3 ? i5 != 4 ? "'null' is not supported in ProtoBuf" : "'null' is not allowed for not-null properties" : "'null' is not supported as the value of a list element in ProtoBuf" : "'null' is not supported as the value of collection types in ProtoBuf" : "'null' is not supported for optional properties in ProtoBuf");
        }
    }

    @Override // kotlinx.serialization.encoding.CompositeEncoder
    public final <T> void encodeNullableSerializableElement(@NotNull SerialDescriptor descriptor, int index, @NotNull SerializationStrategy<? super T> serializer, @Nullable T value) {
        Intrinsics.g(descriptor, "descriptor");
        Intrinsics.g(serializer, "serializer");
        this.nullableMode = descriptor.isElementOptional(index) ? NullableMode.OPTIONAL : isMapOrList(descriptor.getElementDescriptor(index).getKind()) ? NullableMode.COLLECTION : Intrinsics.b(descriptor.getKind(), StructureKind.LIST.INSTANCE) ? NullableMode.LIST_ELEMENT : NullableMode.ACCEPTABLE;
        pushTag(getTag(descriptor, index));
        encodeNullableSerializableValue(serializer, value);
    }

    @Override // kotlinx.serialization.encoding.CompositeEncoder
    public final <T> void encodeSerializableElement(@NotNull SerialDescriptor descriptor, int index, @NotNull SerializationStrategy<? super T> serializer, T value) {
        NullableMode nullableMode;
        Intrinsics.g(descriptor, "descriptor");
        Intrinsics.g(serializer, "serializer");
        if (descriptor.isElementOptional(index)) {
            nullableMode = NullableMode.OPTIONAL;
        } else {
            SerialDescriptor elementDescriptor = descriptor.getElementDescriptor(index);
            nullableMode = !elementDescriptor.getIsNullable() ? NullableMode.NOT_NULL : isMapOrList(elementDescriptor.getKind()) ? NullableMode.COLLECTION : Intrinsics.b(descriptor.getKind(), StructureKind.LIST.INSTANCE) ? NullableMode.LIST_ELEMENT : NullableMode.ACCEPTABLE;
        }
        this.nullableMode = nullableMode;
        pushTag(getTag(descriptor, index));
        encodeSerializableValue(serializer, value);
    }

    @Override // kotlinx.serialization.encoding.Encoder
    public final void encodeShort(short value) {
        encodeTaggedShort(popTagOrDefault(), value);
    }

    @Override // kotlinx.serialization.encoding.CompositeEncoder
    public final void encodeShortElement(@NotNull SerialDescriptor descriptor, int index, short value) {
        Intrinsics.g(descriptor, "descriptor");
        encodeTaggedShort(getTag(descriptor, index), value);
    }

    @Override // kotlinx.serialization.encoding.Encoder
    public final void encodeString(@NotNull String value) {
        Intrinsics.g(value, "value");
        encodeTaggedString(popTagOrDefault(), value);
    }

    @Override // kotlinx.serialization.encoding.CompositeEncoder
    public final void encodeStringElement(@NotNull SerialDescriptor descriptor, int index, @NotNull String value) {
        Intrinsics.g(descriptor, "descriptor");
        Intrinsics.g(value, "value");
        encodeTaggedString(getTag(descriptor, index), value);
    }

    public abstract void encodeTaggedBoolean(long tag, boolean value);

    public abstract void encodeTaggedByte(long tag, byte value);

    public abstract void encodeTaggedChar(long tag, char value);

    public abstract void encodeTaggedDouble(long tag, double value);

    public abstract void encodeTaggedEnum(long tag, @NotNull SerialDescriptor enumDescriptor, int ordinal);

    public abstract void encodeTaggedFloat(long tag, float value);

    @NotNull
    public Encoder encodeTaggedInline(long tag, @NotNull SerialDescriptor inlineDescriptor) {
        Intrinsics.g(inlineDescriptor, "inlineDescriptor");
        pushTag(tag);
        return this;
    }

    public abstract void encodeTaggedInt(long tag, int value);

    public abstract void encodeTaggedLong(long tag, long value);

    public abstract void encodeTaggedShort(long tag, short value);

    public abstract void encodeTaggedString(long tag, @NotNull String value);

    public void endEncode(@NotNull SerialDescriptor descriptor) {
        Intrinsics.g(descriptor, "descriptor");
    }

    @Override // kotlinx.serialization.encoding.CompositeEncoder
    public final void endStructure(@NotNull SerialDescriptor descriptor) {
        Intrinsics.g(descriptor, "descriptor");
        if (this.stackSize >= 0) {
            popTag();
        }
        endEncode(descriptor);
    }

    public abstract long getTag(@NotNull SerialDescriptor serialDescriptor, int i5);
}
