package kotlinx.serialization.json.internal;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Iterator;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.sequences.Sequence;
import kotlinx.serialization.DeserializationStrategy;
import kotlinx.serialization.ExperimentalSerializationApi;
import kotlinx.serialization.SerializationStrategy;
import kotlinx.serialization.json.DecodeSequenceMode;
import kotlinx.serialization.json.Json;
import kotlinx.serialization.json.JsonEncoder;
import org.jetbrains.annotations.NotNull;
import q70.d;

@Metadata(d1 = {"\u0000@\n\u0000\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u001a9\u0010\u0004\u001a\u00020\u0005\"\u0004\b\u0000\u0010\u00062\u0006\u0010\u0007\u001a\u00020\b2\u0006\u0010\t\u001a\u00020\n2\f\u0010\u000b\u001a\b\u0012\u0004\u0012\u0002H\u00060\f2\u0006\u0010\r\u001a\u0002H\u0006H\u0007¢\u0006\u0002\u0010\u000e\u001a1\u0010\u000f\u001a\u0002H\u0006\"\u0004\b\u0000\u0010\u00062\u0006\u0010\u0007\u001a\u00020\b2\f\u0010\u0010\u001a\b\u0012\u0004\u0012\u0002H\u00060\u00112\u0006\u0010\u0012\u001a\u00020\u0013H\u0007¢\u0006\u0002\u0010\u0014\u001a<\u0010\u0015\u001a\b\u0012\u0004\u0012\u0002H\u00060\u0016\"\u0004\b\u0000\u0010\u00062\u0006\u0010\u0007\u001a\u00020\b2\u0006\u0010\u0012\u001a\u00020\u00132\f\u0010\u0010\u001a\b\u0012\u0004\u0012\u0002H\u00060\u00112\b\b\u0002\u0010\u0017\u001a\u00020\u0018H\u0007\u001a1\u0010\u0015\u001a\b\u0012\u0004\u0012\u0002H\u00060\u0016\"\u0006\b\u0000\u0010\u0006\u0018\u00012\u0006\u0010\u0007\u001a\u00020\b2\u0006\u0010\u0012\u001a\u00020\u00132\b\b\u0002\u0010\u0017\u001a\u00020\u0018H\u0087\b\"\u000e\u0010\u0000\u001a\u00020\u0001X\u0082T¢\u0006\u0002\n\u0000\"\u000e\u0010\u0002\u001a\u00020\u0001X\u0082T¢\u0006\u0002\n\u0000\"\u000e\u0010\u0003\u001a\u00020\u0001X\u0082T¢\u0006\u0002\n\u0000¨\u0006\u0019"}, d2 = {"SINGLE_CHAR_MAX_CODEPOINT", b.f42142b, "HIGH_SURROGATE_HEADER", "LOW_SURROGATE_HEADER", "encodeByWriter", b.f42142b, "T", "json", "Lkotlinx/serialization/json/Json;", "writer", "Lkotlinx/serialization/json/internal/InternalJsonWriter;", "serializer", "Lkotlinx/serialization/SerializationStrategy;", "value", "(Lkotlinx/serialization/json/Json;Lkotlinx/serialization/json/internal/InternalJsonWriter;Lkotlinx/serialization/SerializationStrategy;Ljava/lang/Object;)V", "decodeByReader", "deserializer", "Lkotlinx/serialization/DeserializationStrategy;", "reader", "Lkotlinx/serialization/json/internal/InternalJsonReader;", "(Lkotlinx/serialization/json/Json;Lkotlinx/serialization/DeserializationStrategy;Lkotlinx/serialization/json/internal/InternalJsonReader;)Ljava/lang/Object;", "decodeToSequenceByReader", "Lkotlin/sequences/Sequence;", "format", "Lkotlinx/serialization/json/DecodeSequenceMode;", "kotlinx-serialization-json"}, k = 2, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public final class JsonStreamsKt {
    private static final int HIGH_SURROGATE_HEADER = 55232;
    private static final int LOW_SURROGATE_HEADER = 56320;
    private static final int SINGLE_CHAR_MAX_CODEPOINT = 65535;

    @JsonFriendModuleApi
    public static final <T> T decodeByReader(@NotNull Json json, @NotNull DeserializationStrategy<? extends T> deserializer, @NotNull InternalJsonReader reader) {
        Intrinsics.g(json, "json");
        Intrinsics.g(deserializer, "deserializer");
        Intrinsics.g(reader, "reader");
        ReaderJsonLexer readerJsonLexerReaderJsonLexer$default = ReaderJsonLexerKt.ReaderJsonLexer$default(json, reader, null, 4, null);
        try {
            T t6 = (T) new StreamingJsonDecoder(json, WriteMode.OBJ, readerJsonLexerReaderJsonLexer$default, deserializer.getDescriptor(), null).decodeSerializableValue(deserializer);
            readerJsonLexerReaderJsonLexer$default.expectEof();
            return t6;
        } finally {
            readerJsonLexerReaderJsonLexer$default.release();
        }
    }

    @JsonFriendModuleApi
    @ExperimentalSerializationApi
    @NotNull
    public static final <T> Sequence<T> decodeToSequenceByReader(@NotNull Json json, @NotNull InternalJsonReader reader, @NotNull DeserializationStrategy<? extends T> deserializer, @NotNull DecodeSequenceMode format) {
        Intrinsics.g(json, "json");
        Intrinsics.g(reader, "reader");
        Intrinsics.g(deserializer, "deserializer");
        Intrinsics.g(format, "format");
        final Iterator itJsonIterator = JsonIteratorKt.JsonIterator(format, json, ReaderJsonLexerKt.ReaderJsonLexer(json, reader, new char[ReaderJsonLexerKt.BATCH_SIZE]), deserializer);
        return d.n0(new Sequence<T>() { // from class: kotlinx.serialization.json.internal.JsonStreamsKt$decodeToSequenceByReader$$inlined$Sequence$1
            @Override // kotlin.sequences.Sequence
            /* renamed from: iterator */
            public Iterator<T> getF71970a() {
                return itJsonIterator;
            }
        });
    }

    public static /* synthetic */ Sequence decodeToSequenceByReader$default(Json json, InternalJsonReader internalJsonReader, DeserializationStrategy deserializationStrategy, DecodeSequenceMode decodeSequenceMode, int i5, Object obj) {
        if ((i5 & 8) != 0) {
            decodeSequenceMode = DecodeSequenceMode.AUTO_DETECT;
        }
        return decodeToSequenceByReader(json, internalJsonReader, deserializationStrategy, decodeSequenceMode);
    }

    @JsonFriendModuleApi
    public static final <T> void encodeByWriter(@NotNull Json json, @NotNull InternalJsonWriter writer, @NotNull SerializationStrategy<? super T> serializer, T t6) {
        Intrinsics.g(json, "json");
        Intrinsics.g(writer, "writer");
        Intrinsics.g(serializer, "serializer");
        new StreamingJsonEncoder(writer, json, WriteMode.OBJ, new JsonEncoder[WriteMode.getEntries().size()]).encodeSerializableValue(serializer, t6);
    }

    public static /* synthetic */ Sequence decodeToSequenceByReader$default(Json json, InternalJsonReader reader, DecodeSequenceMode format, int i5, Object obj) {
        if ((i5 & 4) != 0) {
            format = DecodeSequenceMode.AUTO_DETECT;
        }
        Intrinsics.g(json, "json");
        Intrinsics.g(reader, "reader");
        Intrinsics.g(format, "format");
        json.getSerializersModule();
        Intrinsics.k();
        throw null;
    }

    @JsonFriendModuleApi
    @ExperimentalSerializationApi
    public static final /* synthetic */ <T> Sequence<T> decodeToSequenceByReader(Json json, InternalJsonReader reader, DecodeSequenceMode format) {
        Intrinsics.g(json, "json");
        Intrinsics.g(reader, "reader");
        Intrinsics.g(format, "format");
        json.getSerializersModule();
        Intrinsics.k();
        throw null;
    }
}
