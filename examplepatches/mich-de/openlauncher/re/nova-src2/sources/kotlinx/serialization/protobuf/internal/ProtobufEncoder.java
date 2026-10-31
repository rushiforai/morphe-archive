package kotlinx.serialization.protobuf.internal;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.util.Map;
import kotlin.Metadata;
import kotlin.jvm.JvmField;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.SerializationException;
import kotlinx.serialization.SerializationStrategy;
import kotlinx.serialization.builtins.BuiltinSerializersKt;
import kotlinx.serialization.descriptors.PolymorphicKind;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.descriptors.SerialKind;
import kotlinx.serialization.descriptors.StructureKind;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.internal.MapLikeSerializer;
import kotlinx.serialization.modules.SerializersModule;
import kotlinx.serialization.protobuf.ProtoBuf;
import kotlinx.serialization.protobuf.ProtoIntegerType;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0086\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\t\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0005\n\u0000\n\u0002\u0010\n\n\u0002\b\u0002\n\u0002\u0010\f\n\u0002\b\u0002\n\u0002\u0010\u0007\n\u0000\n\u0002\u0010\u0006\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0012\n\u0002\b\u0002\b\u0010\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007¢\u0006\u0004\b\b\u0010\tJ\u0018\u0010\u0010\u001a\u00020\u00112\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u0012\u001a\u00020\u0013H\u0016J\u0018\u0010\u0014\u001a\u00020\u00152\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u0016\u001a\u00020\u0013H\u0016J\u0010\u0010\u0017\u001a\u00020\u00152\u0006\u0010\u0006\u001a\u00020\u0007H\u0016J\u001c\u0010\u0018\u001a\u00020\u00192\n\u0010\u001a\u001a\u00060\u001bj\u0002`\u001c2\u0006\u0010\u001d\u001a\u00020\u0013H\u0014J\u001c\u0010\u001e\u001a\u00020\u00192\n\u0010\u001a\u001a\u00060\u001bj\u0002`\u001c2\u0006\u0010\u001d\u001a\u00020\u001fH\u0014J\u001c\u0010 \u001a\u00020\u00192\n\u0010\u001a\u001a\u00060\u001bj\u0002`\u001c2\u0006\u0010\u001d\u001a\u00020!H\u0014J\u001c\u0010\"\u001a\u00020\u00192\n\u0010\u001a\u001a\u00060\u001bj\u0002`\u001c2\u0006\u0010\u001d\u001a\u00020\u0011H\u0014J\u001c\u0010#\u001a\u00020\u00192\n\u0010\u001a\u001a\u00060\u001bj\u0002`\u001c2\u0006\u0010\u001d\u001a\u00020$H\u0014J\u001c\u0010%\u001a\u00020\u00192\n\u0010\u001a\u001a\u00060\u001bj\u0002`\u001c2\u0006\u0010\u001d\u001a\u00020\u001bH\u0014J\u001c\u0010&\u001a\u00020\u00192\n\u0010\u001a\u001a\u00060\u001bj\u0002`\u001c2\u0006\u0010\u001d\u001a\u00020'H\u0014J\u001c\u0010(\u001a\u00020\u00192\n\u0010\u001a\u001a\u00060\u001bj\u0002`\u001c2\u0006\u0010\u001d\u001a\u00020)H\u0014J\u001c\u0010*\u001a\u00020\u00192\n\u0010\u001a\u001a\u00060\u001bj\u0002`\u001c2\u0006\u0010\u001d\u001a\u00020+H\u0014J$\u0010,\u001a\u00020\u00192\n\u0010\u001a\u001a\u00060\u001bj\u0002`\u001c2\u0006\u0010-\u001a\u00020\u00072\u0006\u0010.\u001a\u00020\u0013H\u0014J\u0018\u0010/\u001a\u00060\u001bj\u0002`\u001c*\u00020\u00072\u0006\u0010\u0012\u001a\u00020\u0013H\u0014J)\u00100\u001a\u00020\u0019\"\u0004\b\u0000\u001012\f\u00102\u001a\b\u0012\u0004\u0012\u0002H1032\u0006\u0010\u001d\u001a\u0002H1H\u0016¢\u0006\u0002\u00104J\u0010\u00105\u001a\u00020\u00192\u0006\u0010\u001d\u001a\u000206H\u0002J)\u00107\u001a\u00020\u0019\"\u0004\b\u0000\u001012\f\u00102\u001a\b\u0012\u0004\u0012\u0002H1032\u0006\u0010\u001d\u001a\u0002H1H\u0002¢\u0006\u0002\u00104R\u0010\u0010\u0002\u001a\u00020\u00038\u0004X\u0085\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R\u0010\u0010\u0006\u001a\u00020\u00078\u0004X\u0085\u0004¢\u0006\u0002\n\u0000R\u001a\u0010\n\u001a\u00020\u000b8VX\u0096\u0004¢\u0006\f\u0012\u0004\b\f\u0010\r\u001a\u0004\b\u000e\u0010\u000f¨\u00068"}, d2 = {"Lkotlinx/serialization/protobuf/internal/ProtobufEncoder;", "Lkotlinx/serialization/protobuf/internal/ProtobufTaggedEncoder;", "proto", "Lkotlinx/serialization/protobuf/ProtoBuf;", "writer", "Lkotlinx/serialization/protobuf/internal/ProtobufWriter;", "descriptor", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "<init>", "(Lkotlinx/serialization/protobuf/ProtoBuf;Lkotlinx/serialization/protobuf/internal/ProtobufWriter;Lkotlinx/serialization/descriptors/SerialDescriptor;)V", "serializersModule", "Lkotlinx/serialization/modules/SerializersModule;", "getSerializersModule$annotations", "()V", "getSerializersModule", "()Lkotlinx/serialization/modules/SerializersModule;", "shouldEncodeElementDefault", b.f42142b, TTEDPEventConstants.EDP_EVENT_PROPERTY_INDEX, b.f42142b, "beginCollection", "Lkotlinx/serialization/encoding/CompositeEncoder;", "collectionSize", "beginStructure", "encodeTaggedInt", b.f42142b, "tag", b.f42142b, "Lkotlinx/serialization/protobuf/internal/ProtoDesc;", "value", "encodeTaggedByte", b.f42142b, "encodeTaggedShort", b.f42142b, "encodeTaggedBoolean", "encodeTaggedChar", b.f42142b, "encodeTaggedLong", "encodeTaggedFloat", b.f42142b, "encodeTaggedDouble", b.f42142b, "encodeTaggedString", b.f42142b, "encodeTaggedEnum", "enumDescriptor", "ordinal", "getTag", "encodeSerializableValue", "T", "serializer", "Lkotlinx/serialization/SerializationStrategy;", "(Lkotlinx/serialization/SerializationStrategy;Ljava/lang/Object;)V", "serializeByteArray", b.f42142b, "serializeMap", "kotlinx-serialization-protobuf"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes.dex */
public class ProtobufEncoder extends ProtobufTaggedEncoder {

    @JvmField
    @NotNull
    protected final SerialDescriptor descriptor;

    @JvmField
    @NotNull
    protected final ProtoBuf proto;

    @NotNull
    private final ProtobufWriter writer;

    public ProtobufEncoder(@NotNull ProtoBuf proto, @NotNull ProtobufWriter writer, @NotNull SerialDescriptor descriptor) {
        Intrinsics.g(proto, "proto");
        Intrinsics.g(writer, "writer");
        Intrinsics.g(descriptor, "descriptor");
        this.proto = proto;
        this.writer = writer;
        this.descriptor = descriptor;
    }

    public static /* synthetic */ void getSerializersModule$annotations() {
    }

    private final void serializeByteArray(byte[] value) {
        long jPopTagOrDefault = popTagOrDefault();
        if (jPopTagOrDefault == ProtobufTaggedBaseKt.MISSING_TAG) {
            this.writer.writeBytes(value);
        } else {
            this.writer.writeBytes(value, (int) (jPopTagOrDefault & 2147483647L));
        }
    }

    private final <T> void serializeMap(SerializationStrategy<? super T> serializer, T value) {
        Intrinsics.e(serializer, "null cannot be cast to non-null type kotlinx.serialization.internal.MapLikeSerializer<kotlin.Any?, kotlin.Any?, T of kotlinx.serialization.protobuf.internal.ProtobufEncoder.serializeMap, *>");
        MapLikeSerializer mapLikeSerializer = (MapLikeSerializer) serializer;
        KSerializer kSerializerSetSerializer = BuiltinSerializersKt.SetSerializer(BuiltinSerializersKt.MapEntrySerializer(mapLikeSerializer.getKeySerializer(), mapLikeSerializer.getValueSerializer()));
        Intrinsics.e(value, "null cannot be cast to non-null type kotlin.collections.Map<*, *>");
        kSerializerSetSerializer.serialize(this, ((Map) value).entrySet());
    }

    @NotNull
    public CompositeEncoder beginCollection(@NotNull SerialDescriptor descriptor, int collectionSize) {
        Intrinsics.g(descriptor, "descriptor");
        SerialKind kind = descriptor.getKind();
        StructureKind.LIST list = StructureKind.LIST.INSTANCE;
        if (!Intrinsics.b(kind, list)) {
            if (Intrinsics.b(kind, StructureKind.MAP.INSTANCE)) {
                return new MapRepeatedEncoder(this.proto, getCurrentTag(), this.writer, descriptor);
            }
            throw new SerializationException("This serial kind is not supported as collection: " + descriptor);
        }
        long currentTagOrDefault = getCurrentTagOrDefault();
        if (HelpersKt.isPacked(currentTagOrDefault) && HelpersKt.isPackable(descriptor.getElementDescriptor(0))) {
            return new PackedArrayEncoder(this.proto, this.writer, getCurrentTagOrDefault(), descriptor, null, 16, null);
        }
        if (currentTagOrDefault == ProtobufTaggedBaseKt.MISSING_TAG) {
            this.writer.writeInt(collectionSize);
        }
        if (!Intrinsics.b(this.descriptor.getKind(), list) || currentTagOrDefault == ProtobufTaggedBaseKt.MISSING_TAG || Intrinsics.b(this.descriptor, descriptor)) {
            return new RepeatedEncoder(this.proto, this.writer, currentTagOrDefault, descriptor);
        }
        return new NestedRepeatedEncoder(this.proto, this.writer, currentTagOrDefault, descriptor, null, 16, null);
    }

    @NotNull
    public CompositeEncoder beginStructure(@NotNull SerialDescriptor descriptor) {
        Intrinsics.g(descriptor, "descriptor");
        SerialKind kind = descriptor.getKind();
        if (Intrinsics.b(kind, StructureKind.LIST.INSTANCE)) {
            if (!HelpersKt.isPackable(descriptor.getElementDescriptor(0)) || !HelpersKt.isPacked(getCurrentTagOrDefault())) {
                return new RepeatedEncoder(this.proto, this.writer, getCurrentTagOrDefault(), descriptor);
            }
            return new PackedArrayEncoder(this.proto, this.writer, getCurrentTagOrDefault(), descriptor, null, 16, null);
        }
        if (!Intrinsics.b(kind, StructureKind.CLASS.INSTANCE) && !Intrinsics.b(kind, StructureKind.OBJECT.INSTANCE) && !(kind instanceof PolymorphicKind)) {
            if (Intrinsics.b(kind, StructureKind.MAP.INSTANCE)) {
                return new MapRepeatedEncoder(this.proto, getCurrentTagOrDefault(), this.writer, descriptor);
            }
            throw new SerializationException("This serial kind is not supported as structure: " + descriptor);
        }
        long currentTagOrDefault = getCurrentTagOrDefault();
        if (currentTagOrDefault == ProtobufTaggedBaseKt.MISSING_TAG && descriptor.equals(this.descriptor)) {
            return this;
        }
        if (HelpersKt.isOneOf(currentTagOrDefault)) {
            return new OneOfPolymorphicEncoder(this.proto, this.writer, descriptor);
        }
        return new ObjectEncoder(this.proto, getCurrentTagOrDefault(), this.writer, null, descriptor, 8, null);
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // kotlinx.serialization.encoding.Encoder
    public <T> void encodeSerializableValue(@NotNull SerializationStrategy<? super T> serializer, T value) {
        Intrinsics.g(serializer, "serializer");
        if (serializer instanceof MapLikeSerializer) {
            serializeMap(serializer, value);
        } else if (!Intrinsics.b(serializer.getDescriptor(), BuiltinSerializersKt.ByteArraySerializer().getDescriptor())) {
            serializer.serialize(this, value);
        } else {
            Intrinsics.e(value, "null cannot be cast to non-null type kotlin.ByteArray");
            serializeByteArray((byte[]) value);
        }
    }

    @Override // kotlinx.serialization.protobuf.internal.ProtobufTaggedEncoder
    public void encodeTaggedBoolean(long tag, boolean value) {
        encodeTaggedInt(tag, value ? 1 : 0);
    }

    @Override // kotlinx.serialization.protobuf.internal.ProtobufTaggedEncoder
    public void encodeTaggedByte(long tag, byte value) {
        encodeTaggedInt(tag, value);
    }

    @Override // kotlinx.serialization.protobuf.internal.ProtobufTaggedEncoder
    public void encodeTaggedChar(long tag, char value) {
        encodeTaggedInt(tag, value);
    }

    @Override // kotlinx.serialization.protobuf.internal.ProtobufTaggedEncoder
    public void encodeTaggedDouble(long tag, double value) {
        if (tag == ProtobufTaggedBaseKt.MISSING_TAG) {
            this.writer.writeDouble(value);
        } else {
            this.writer.writeDouble(value, (int) (tag & 2147483647L));
        }
    }

    @Override // kotlinx.serialization.protobuf.internal.ProtobufTaggedEncoder
    public void encodeTaggedEnum(long tag, @NotNull SerialDescriptor enumDescriptor, int ordinal) {
        Intrinsics.g(enumDescriptor, "enumDescriptor");
        int iExtractProtoId = HelpersKt.extractProtoId(enumDescriptor, ordinal, true);
        if (tag == ProtobufTaggedBaseKt.MISSING_TAG) {
            this.writer.writeInt(iExtractProtoId);
        } else {
            this.writer.writeInt(iExtractProtoId, (int) (tag & 2147483647L), ProtoIntegerType.DEFAULT);
        }
    }

    @Override // kotlinx.serialization.protobuf.internal.ProtobufTaggedEncoder
    public void encodeTaggedFloat(long tag, float value) {
        if (tag == ProtobufTaggedBaseKt.MISSING_TAG) {
            this.writer.writeFloat(value);
        } else {
            this.writer.writeFloat(value, (int) (tag & 2147483647L));
        }
    }

    @Override // kotlinx.serialization.protobuf.internal.ProtobufTaggedEncoder
    public void encodeTaggedInt(long tag, int value) {
        if (tag == ProtobufTaggedBaseKt.MISSING_TAG) {
            this.writer.writeInt(value);
        } else {
            this.writer.writeInt(value, (int) (2147483647L & tag), HelpersKt.getIntegerType(tag));
        }
    }

    @Override // kotlinx.serialization.protobuf.internal.ProtobufTaggedEncoder
    public void encodeTaggedLong(long tag, long value) {
        if (tag == ProtobufTaggedBaseKt.MISSING_TAG) {
            this.writer.writeLong(value);
        } else {
            this.writer.writeLong(value, (int) (2147483647L & tag), HelpersKt.getIntegerType(tag));
        }
    }

    @Override // kotlinx.serialization.protobuf.internal.ProtobufTaggedEncoder
    public void encodeTaggedShort(long tag, short value) {
        encodeTaggedInt(tag, value);
    }

    @Override // kotlinx.serialization.protobuf.internal.ProtobufTaggedEncoder
    public void encodeTaggedString(long tag, @NotNull String value) {
        Intrinsics.g(value, "value");
        if (tag == ProtobufTaggedBaseKt.MISSING_TAG) {
            this.writer.writeString(value);
        } else {
            this.writer.writeString(value, (int) (tag & 2147483647L));
        }
    }

    @Override // kotlinx.serialization.encoding.Encoder, kotlinx.serialization.encoding.CompositeEncoder
    @NotNull
    public SerializersModule getSerializersModule() {
        return this.proto.getSerializersModule();
    }

    @Override // kotlinx.serialization.protobuf.internal.ProtobufTaggedEncoder
    public long getTag(@NotNull SerialDescriptor serialDescriptor, int i5) {
        Intrinsics.g(serialDescriptor, "<this>");
        return HelpersKt.extractParameters(serialDescriptor, i5);
    }

    @Override // kotlinx.serialization.encoding.CompositeEncoder
    public boolean shouldEncodeElementDefault(@NotNull SerialDescriptor descriptor, int index) {
        Intrinsics.g(descriptor, "descriptor");
        return this.proto.getEncodeDefaults();
    }
}
