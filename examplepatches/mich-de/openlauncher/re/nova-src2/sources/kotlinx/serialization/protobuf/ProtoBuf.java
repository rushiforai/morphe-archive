package kotlinx.serialization.protobuf;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.BinaryFormat;
import kotlinx.serialization.DeserializationStrategy;
import kotlinx.serialization.ExperimentalSerializationApi;
import kotlinx.serialization.SerializationStrategy;
import kotlinx.serialization.modules.SerializersModule;
import kotlinx.serialization.modules.SerializersModuleBuildersKt;
import kotlinx.serialization.protobuf.internal.ByteArrayInput;
import kotlinx.serialization.protobuf.internal.ByteArrayOutput;
import kotlinx.serialization.protobuf.internal.ProtobufDecoder;
import kotlinx.serialization.protobuf.internal.ProtobufEncoder;
import kotlinx.serialization.protobuf.internal.ProtobufReader;
import kotlinx.serialization.protobuf.internal.ProtobufWriter;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u0012\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b7\u0018\u0000 \u00182\u00020\u0001:\u0001\u0018B\u0019\b\u0004\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J)\u0010\f\u001a\u00020\r\"\u0004\b\u0000\u0010\u000e2\f\u0010\u000f\u001a\b\u0012\u0004\u0012\u0002H\u000e0\u00102\u0006\u0010\u0011\u001a\u0002H\u000eH\u0016¢\u0006\u0002\u0010\u0012J)\u0010\u0013\u001a\u0002H\u000e\"\u0004\b\u0000\u0010\u000e2\f\u0010\u0014\u001a\b\u0012\u0004\u0012\u0002H\u000e0\u00152\u0006\u0010\u0016\u001a\u00020\rH\u0016¢\u0006\u0002\u0010\u0017R\u0014\u0010\u0002\u001a\u00020\u0003X\u0080\u0004¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0014\u0010\u0004\u001a\u00020\u0005X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b\u0082\u0001\u0002\u0019\u001a¨\u0006\u001b"}, d2 = {"Lkotlinx/serialization/protobuf/ProtoBuf;", "Lkotlinx/serialization/BinaryFormat;", "encodeDefaults", b.f42142b, "serializersModule", "Lkotlinx/serialization/modules/SerializersModule;", "<init>", "(ZLkotlinx/serialization/modules/SerializersModule;)V", "getEncodeDefaults$kotlinx_serialization_protobuf", "()Z", "getSerializersModule", "()Lkotlinx/serialization/modules/SerializersModule;", "encodeToByteArray", b.f42142b, "T", "serializer", "Lkotlinx/serialization/SerializationStrategy;", "value", "(Lkotlinx/serialization/SerializationStrategy;Ljava/lang/Object;)[B", "decodeFromByteArray", "deserializer", "Lkotlinx/serialization/DeserializationStrategy;", "bytes", "(Lkotlinx/serialization/DeserializationStrategy;[B)Ljava/lang/Object;", "Default", "Lkotlinx/serialization/protobuf/ProtoBuf$Default;", "Lkotlinx/serialization/protobuf/ProtoBufImpl;", "kotlinx-serialization-protobuf"}, k = 1, mv = {2, 1, 0}, xi = 48)
@ExperimentalSerializationApi
/* loaded from: classes.dex */
public abstract class ProtoBuf implements BinaryFormat {

    /* renamed from: Default, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);
    private final boolean encodeDefaults;

    @NotNull
    private final SerializersModule serializersModule;

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lkotlinx/serialization/protobuf/ProtoBuf$Default;", "Lkotlinx/serialization/protobuf/ProtoBuf;", "<init>", "()V", "kotlinx-serialization-protobuf"}, k = 1, mv = {2, 1, 0}, xi = 48)
    /* renamed from: kotlinx.serialization.protobuf.ProtoBuf$Default, reason: from kotlin metadata */
    public static final class Companion extends ProtoBuf {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
            super(false, SerializersModuleBuildersKt.EmptySerializersModule(), null);
        }
    }

    public /* synthetic */ ProtoBuf(boolean z11, SerializersModule serializersModule, DefaultConstructorMarker defaultConstructorMarker) {
        this(z11, serializersModule);
    }

    @Override // kotlinx.serialization.BinaryFormat
    public <T> T decodeFromByteArray(@NotNull DeserializationStrategy<? extends T> deserializer, @NotNull byte[] bytes) {
        Intrinsics.g(deserializer, "deserializer");
        Intrinsics.g(bytes, "bytes");
        return (T) new ProtobufDecoder(this, new ProtobufReader(new ByteArrayInput(bytes, 0, 2, null)), deserializer.getDescriptor()).decodeSerializableValue(deserializer);
    }

    @Override // kotlinx.serialization.BinaryFormat
    @NotNull
    public <T> byte[] encodeToByteArray(@NotNull SerializationStrategy<? super T> serializer, T value) {
        Intrinsics.g(serializer, "serializer");
        ByteArrayOutput byteArrayOutput = new ByteArrayOutput();
        new ProtobufEncoder(this, new ProtobufWriter(byteArrayOutput), serializer.getDescriptor()).encodeSerializableValue(serializer, value);
        return byteArrayOutput.toByteArray();
    }

    /* renamed from: getEncodeDefaults$kotlinx_serialization_protobuf, reason: from getter */
    public final boolean getEncodeDefaults() {
        return this.encodeDefaults;
    }

    @Override // kotlinx.serialization.SerialFormat
    @NotNull
    public SerializersModule getSerializersModule() {
        return this.serializersModule;
    }

    private ProtoBuf(boolean z11, SerializersModule serializersModule) {
        this.encodeDefaults = z11;
        this.serializersModule = serializersModule;
    }
}
