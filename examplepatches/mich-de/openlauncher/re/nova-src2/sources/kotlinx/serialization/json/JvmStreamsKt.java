package kotlinx.serialization.json;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.sequences.Sequence;
import kotlinx.serialization.DeserializationStrategy;
import kotlinx.serialization.ExperimentalSerializationApi;
import kotlinx.serialization.SerializationStrategy;
import kotlinx.serialization.json.internal.JavaStreamSerialReader;
import kotlinx.serialization.json.internal.JsonStreamsKt;
import kotlinx.serialization.json.internal.JsonToJavaStreamWriter;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u00006\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u001a5\u0010\u0000\u001a\u00020\u0001\"\u0004\b\u0000\u0010\u0002*\u00020\u00032\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u0002H\u00020\u00052\u0006\u0010\u0006\u001a\u0002H\u00022\u0006\u0010\u0007\u001a\u00020\bH\u0007¢\u0006\u0002\u0010\t\u001a*\u0010\u0000\u001a\u00020\u0001\"\u0006\b\u0000\u0010\u0002\u0018\u0001*\u00020\u00032\u0006\u0010\u0006\u001a\u0002H\u00022\u0006\u0010\u0007\u001a\u00020\bH\u0087\b¢\u0006\u0002\u0010\n\u001a-\u0010\u000b\u001a\u0002H\u0002\"\u0004\b\u0000\u0010\u0002*\u00020\u00032\f\u0010\f\u001a\b\u0012\u0004\u0012\u0002H\u00020\r2\u0006\u0010\u0007\u001a\u00020\u000eH\u0007¢\u0006\u0002\u0010\u000f\u001a\"\u0010\u000b\u001a\u0002H\u0002\"\u0006\b\u0000\u0010\u0002\u0018\u0001*\u00020\u00032\u0006\u0010\u0007\u001a\u00020\u000eH\u0087\b¢\u0006\u0002\u0010\u0010\u001a8\u0010\u0011\u001a\b\u0012\u0004\u0012\u0002H\u00020\u0012\"\u0004\b\u0000\u0010\u0002*\u00020\u00032\u0006\u0010\u0007\u001a\u00020\u000e2\f\u0010\f\u001a\b\u0012\u0004\u0012\u0002H\u00020\r2\b\b\u0002\u0010\u0013\u001a\u00020\u0014H\u0007\u001a-\u0010\u0011\u001a\b\u0012\u0004\u0012\u0002H\u00020\u0012\"\u0006\b\u0000\u0010\u0002\u0018\u0001*\u00020\u00032\u0006\u0010\u0007\u001a\u00020\u000e2\b\b\u0002\u0010\u0013\u001a\u00020\u0014H\u0087\b¨\u0006\u0015"}, d2 = {"encodeToStream", b.f42142b, "T", "Lkotlinx/serialization/json/Json;", "serializer", "Lkotlinx/serialization/SerializationStrategy;", "value", "stream", "Ljava/io/OutputStream;", "(Lkotlinx/serialization/json/Json;Lkotlinx/serialization/SerializationStrategy;Ljava/lang/Object;Ljava/io/OutputStream;)V", "(Lkotlinx/serialization/json/Json;Ljava/lang/Object;Ljava/io/OutputStream;)V", "decodeFromStream", "deserializer", "Lkotlinx/serialization/DeserializationStrategy;", "Ljava/io/InputStream;", "(Lkotlinx/serialization/json/Json;Lkotlinx/serialization/DeserializationStrategy;Ljava/io/InputStream;)Ljava/lang/Object;", "(Lkotlinx/serialization/json/Json;Ljava/io/InputStream;)Ljava/lang/Object;", "decodeToSequence", "Lkotlin/sequences/Sequence;", "format", "Lkotlinx/serialization/json/DecodeSequenceMode;", "kotlinx-serialization-json"}, k = 2, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes5.dex */
public final class JvmStreamsKt {
    @ExperimentalSerializationApi
    public static final <T> T decodeFromStream(@NotNull Json json, @NotNull DeserializationStrategy<? extends T> deserializer, @NotNull InputStream stream) {
        Intrinsics.g(json, "<this>");
        Intrinsics.g(deserializer, "deserializer");
        Intrinsics.g(stream, "stream");
        JavaStreamSerialReader javaStreamSerialReader = new JavaStreamSerialReader(stream);
        try {
            return (T) JsonStreamsKt.decodeByReader(json, deserializer, javaStreamSerialReader);
        } finally {
            javaStreamSerialReader.release();
        }
    }

    @ExperimentalSerializationApi
    @NotNull
    public static final <T> Sequence<T> decodeToSequence(@NotNull Json json, @NotNull InputStream stream, @NotNull DeserializationStrategy<? extends T> deserializer, @NotNull DecodeSequenceMode format) {
        Intrinsics.g(json, "<this>");
        Intrinsics.g(stream, "stream");
        Intrinsics.g(deserializer, "deserializer");
        Intrinsics.g(format, "format");
        return JsonStreamsKt.decodeToSequenceByReader(json, new JavaStreamSerialReader(stream), deserializer, format);
    }

    public static /* synthetic */ Sequence decodeToSequence$default(Json json, InputStream inputStream, DeserializationStrategy deserializationStrategy, DecodeSequenceMode decodeSequenceMode, int i5, Object obj) {
        if ((i5 & 4) != 0) {
            decodeSequenceMode = DecodeSequenceMode.AUTO_DETECT;
        }
        return decodeToSequence(json, inputStream, deserializationStrategy, decodeSequenceMode);
    }

    @ExperimentalSerializationApi
    public static final <T> void encodeToStream(@NotNull Json json, @NotNull SerializationStrategy<? super T> serializer, T t6, @NotNull OutputStream stream) throws IOException {
        Intrinsics.g(json, "<this>");
        Intrinsics.g(serializer, "serializer");
        Intrinsics.g(stream, "stream");
        JsonToJavaStreamWriter jsonToJavaStreamWriter = new JsonToJavaStreamWriter(stream);
        try {
            JsonStreamsKt.encodeByWriter(json, jsonToJavaStreamWriter, serializer, t6);
        } finally {
            jsonToJavaStreamWriter.release();
        }
    }

    @ExperimentalSerializationApi
    public static final /* synthetic */ <T> Sequence<T> decodeToSequence(Json json, InputStream stream, DecodeSequenceMode format) {
        Intrinsics.g(json, "<this>");
        Intrinsics.g(stream, "stream");
        Intrinsics.g(format, "format");
        json.getSerializersModule();
        Intrinsics.k();
        throw null;
    }

    public static /* synthetic */ Sequence decodeToSequence$default(Json json, InputStream stream, DecodeSequenceMode format, int i5, Object obj) {
        if ((i5 & 2) != 0) {
            format = DecodeSequenceMode.AUTO_DETECT;
        }
        Intrinsics.g(json, "<this>");
        Intrinsics.g(stream, "stream");
        Intrinsics.g(format, "format");
        json.getSerializersModule();
        Intrinsics.k();
        throw null;
    }

    @ExperimentalSerializationApi
    public static final /* synthetic */ <T> T decodeFromStream(Json json, InputStream stream) {
        Intrinsics.g(json, "<this>");
        Intrinsics.g(stream, "stream");
        json.getSerializersModule();
        Intrinsics.k();
        throw null;
    }

    @ExperimentalSerializationApi
    public static final /* synthetic */ <T> void encodeToStream(Json json, T t6, OutputStream stream) {
        Intrinsics.g(json, "<this>");
        Intrinsics.g(stream, "stream");
        json.getSerializersModule();
        Intrinsics.k();
        throw null;
    }
}
