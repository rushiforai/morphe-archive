package kotlinx.serialization;

import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.internal.InternalHexConverter;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000.\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0012\n\u0002\b\u0005\u001a\"\u0010\u0000\u001a\u00020\u0001\"\u0006\b\u0000\u0010\u0002\u0018\u0001*\u00020\u00032\u0006\u0010\u0004\u001a\u0002H\u0002H\u0086\b¢\u0006\u0002\u0010\u0005\u001a\"\u0010\u0006\u001a\u0002H\u0002\"\u0006\b\u0000\u0010\u0002\u0018\u0001*\u00020\u00032\u0006\u0010\u0007\u001a\u00020\u0001H\u0086\b¢\u0006\u0002\u0010\b\u001a+\u0010\t\u001a\u00020\u0001\"\u0004\b\u0000\u0010\u0002*\u00020\n2\f\u0010\u000b\u001a\b\u0012\u0004\u0012\u0002H\u00020\f2\u0006\u0010\u0004\u001a\u0002H\u0002¢\u0006\u0002\u0010\r\u001a+\u0010\u000e\u001a\u0002H\u0002\"\u0004\b\u0000\u0010\u0002*\u00020\n2\f\u0010\u000f\u001a\b\u0012\u0004\u0012\u0002H\u00020\u00102\u0006\u0010\u0011\u001a\u00020\u0001¢\u0006\u0002\u0010\u0012\u001a\"\u0010\t\u001a\u00020\u0001\"\u0006\b\u0000\u0010\u0002\u0018\u0001*\u00020\n2\u0006\u0010\u0004\u001a\u0002H\u0002H\u0086\b¢\u0006\u0002\u0010\u0013\u001a\"\u0010\u000e\u001a\u0002H\u0002\"\u0006\b\u0000\u0010\u0002\u0018\u0001*\u00020\n2\u0006\u0010\u0011\u001a\u00020\u0001H\u0086\b¢\u0006\u0002\u0010\u0014\u001a\"\u0010\u0015\u001a\u00020\u0016\"\u0006\b\u0000\u0010\u0002\u0018\u0001*\u00020\n2\u0006\u0010\u0004\u001a\u0002H\u0002H\u0086\b¢\u0006\u0002\u0010\u0017\u001a\"\u0010\u0018\u001a\u0002H\u0002\"\u0006\b\u0000\u0010\u0002\u0018\u0001*\u00020\n2\u0006\u0010\u0019\u001a\u00020\u0016H\u0086\b¢\u0006\u0002\u0010\u001a¨\u0006\u001b"}, d2 = {"encodeToString", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "T", "Lkotlinx/serialization/StringFormat;", "value", "(Lkotlinx/serialization/StringFormat;Ljava/lang/Object;)Ljava/lang/String;", "decodeFromString", "string", "(Lkotlinx/serialization/StringFormat;Ljava/lang/String;)Ljava/lang/Object;", "encodeToHexString", "Lkotlinx/serialization/BinaryFormat;", "serializer", "Lkotlinx/serialization/SerializationStrategy;", "(Lkotlinx/serialization/BinaryFormat;Lkotlinx/serialization/SerializationStrategy;Ljava/lang/Object;)Ljava/lang/String;", "decodeFromHexString", "deserializer", "Lkotlinx/serialization/DeserializationStrategy;", "hex", "(Lkotlinx/serialization/BinaryFormat;Lkotlinx/serialization/DeserializationStrategy;Ljava/lang/String;)Ljava/lang/Object;", "(Lkotlinx/serialization/BinaryFormat;Ljava/lang/Object;)Ljava/lang/String;", "(Lkotlinx/serialization/BinaryFormat;Ljava/lang/String;)Ljava/lang/Object;", "encodeToByteArray", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "(Lkotlinx/serialization/BinaryFormat;Ljava/lang/Object;)[B", "decodeFromByteArray", "bytes", "(Lkotlinx/serialization/BinaryFormat;[B)Ljava/lang/Object;", "kotlinx-serialization-core"}, k = 2, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes5.dex */
public final class SerialFormatKt {
    public static final /* synthetic */ <T> T decodeFromByteArray(BinaryFormat binaryFormat, byte[] bytes) {
        Intrinsics.g(binaryFormat, "<this>");
        Intrinsics.g(bytes, "bytes");
        binaryFormat.getSerializersModule();
        Intrinsics.k();
        throw null;
    }

    public static final <T> T decodeFromHexString(@NotNull BinaryFormat binaryFormat, @NotNull DeserializationStrategy<? extends T> deserializer, @NotNull String hex) {
        Intrinsics.g(binaryFormat, "<this>");
        Intrinsics.g(deserializer, "deserializer");
        Intrinsics.g(hex, "hex");
        return (T) binaryFormat.decodeFromByteArray(deserializer, InternalHexConverter.INSTANCE.parseHexBinary(hex));
    }

    public static final /* synthetic */ <T> T decodeFromString(StringFormat stringFormat, String string) {
        Intrinsics.g(stringFormat, "<this>");
        Intrinsics.g(string, "string");
        stringFormat.getSerializersModule();
        Intrinsics.k();
        throw null;
    }

    public static final /* synthetic */ <T> byte[] encodeToByteArray(BinaryFormat binaryFormat, T t6) {
        Intrinsics.g(binaryFormat, "<this>");
        binaryFormat.getSerializersModule();
        Intrinsics.k();
        throw null;
    }

    @NotNull
    public static final <T> String encodeToHexString(@NotNull BinaryFormat binaryFormat, @NotNull SerializationStrategy<? super T> serializer, T t6) {
        Intrinsics.g(binaryFormat, "<this>");
        Intrinsics.g(serializer, "serializer");
        return InternalHexConverter.INSTANCE.printHexBinary(binaryFormat.encodeToByteArray(serializer, t6), true);
    }

    public static final /* synthetic */ <T> String encodeToString(StringFormat stringFormat, T t6) {
        Intrinsics.g(stringFormat, "<this>");
        stringFormat.getSerializersModule();
        Intrinsics.k();
        throw null;
    }

    public static final /* synthetic */ <T> T decodeFromHexString(BinaryFormat binaryFormat, String hex) {
        Intrinsics.g(binaryFormat, "<this>");
        Intrinsics.g(hex, "hex");
        binaryFormat.getSerializersModule();
        Intrinsics.k();
        throw null;
    }

    public static final /* synthetic */ <T> String encodeToHexString(BinaryFormat binaryFormat, T t6) {
        Intrinsics.g(binaryFormat, "<this>");
        binaryFormat.getSerializersModule();
        Intrinsics.k();
        throw null;
    }
}
