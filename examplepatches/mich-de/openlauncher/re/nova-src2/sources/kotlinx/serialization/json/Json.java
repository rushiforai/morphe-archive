package kotlinx.serialization.json;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Deprecated;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.DeserializationStrategy;
import kotlinx.serialization.SerializationStrategy;
import kotlinx.serialization.StringFormat;
import kotlinx.serialization.json.internal.DescriptorSchemaCache;
import kotlinx.serialization.json.internal.JsonStreamsKt;
import kotlinx.serialization.json.internal.JsonToStringWriter;
import kotlinx.serialization.json.internal.StreamingJsonDecoder;
import kotlinx.serialization.json.internal.StringJsonLexer;
import kotlinx.serialization.json.internal.StringJsonLexerKt;
import kotlinx.serialization.json.internal.TreeJsonDecoderKt;
import kotlinx.serialization.json.internal.TreeJsonEncoderKt;
import kotlinx.serialization.json.internal.WriteMode;
import kotlinx.serialization.modules.SerializersModule;
import kotlinx.serialization.modules.SerializersModuleBuildersKt;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000J\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b6\u0018\u0000 '2\u00020\u0001:\u0001'B\u0019\b\u0004\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J'\u0010\u0012\u001a\u00020\u0013\"\u0004\b\u0000\u0010\u00142\f\u0010\u0015\u001a\b\u0012\u0004\u0012\u0002H\u00140\u00162\u0006\u0010\u0017\u001a\u0002H\u0014¢\u0006\u0002\u0010\u0018J)\u0010\u0019\u001a\u0002H\u0014\"\u0004\b\u0000\u0010\u00142\f\u0010\u001a\u001a\b\u0012\u0004\u0012\u0002H\u00140\u001b2\b\b\u0001\u0010\u001c\u001a\u00020\u0013¢\u0006\u0002\u0010\u001dJ'\u0010\u001e\u001a\u00020\u001f\"\u0004\b\u0000\u0010\u00142\f\u0010\u0015\u001a\b\u0012\u0004\u0012\u0002H\u00140\u00162\u0006\u0010\u0017\u001a\u0002H\u0014¢\u0006\u0002\u0010 J'\u0010!\u001a\u0002H\u0014\"\u0004\b\u0000\u0010\u00142\f\u0010\u001a\u001a\b\u0012\u0004\u0012\u0002H\u00140\u001b2\u0006\u0010\"\u001a\u00020\u001f¢\u0006\u0002\u0010#J\u0010\u0010$\u001a\u00020\u001f2\b\b\u0001\u0010\u001c\u001a\u00020\u0013J\u001e\u0010\u0012\u001a\u00020\u0013\"\u0006\b\u0000\u0010\u0014\u0018\u00012\u0006\u0010\u0017\u001a\u0002H\u0014H\u0086\b¢\u0006\u0002\u0010%J \u0010\u0019\u001a\u0002H\u0014\"\u0006\b\u0000\u0010\u0014\u0018\u00012\b\b\u0001\u0010\u001c\u001a\u00020\u0013H\u0086\b¢\u0006\u0002\u0010&R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0014\u0010\u0004\u001a\u00020\u0005X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u001c\u0010\f\u001a\u00020\r8\u0000X\u0081\u0004¢\u0006\u000e\n\u0000\u0012\u0004\b\u000e\u0010\u000f\u001a\u0004\b\u0010\u0010\u0011\u0082\u0001\u0002()¨\u0006*"}, d2 = {"Lkotlinx/serialization/json/Json;", "Lkotlinx/serialization/StringFormat;", "configuration", "Lkotlinx/serialization/json/JsonConfiguration;", "serializersModule", "Lkotlinx/serialization/modules/SerializersModule;", "<init>", "(Lkotlinx/serialization/json/JsonConfiguration;Lkotlinx/serialization/modules/SerializersModule;)V", "getConfiguration", "()Lkotlinx/serialization/json/JsonConfiguration;", "getSerializersModule", "()Lkotlinx/serialization/modules/SerializersModule;", "_schemaCache", "Lkotlinx/serialization/json/internal/DescriptorSchemaCache;", "get_schemaCache$kotlinx_serialization_json$annotations", "()V", "get_schemaCache$kotlinx_serialization_json", "()Lkotlinx/serialization/json/internal/DescriptorSchemaCache;", "encodeToString", b.f42142b, "T", "serializer", "Lkotlinx/serialization/SerializationStrategy;", "value", "(Lkotlinx/serialization/SerializationStrategy;Ljava/lang/Object;)Ljava/lang/String;", "decodeFromString", "deserializer", "Lkotlinx/serialization/DeserializationStrategy;", "string", "(Lkotlinx/serialization/DeserializationStrategy;Ljava/lang/String;)Ljava/lang/Object;", "encodeToJsonElement", "Lkotlinx/serialization/json/JsonElement;", "(Lkotlinx/serialization/SerializationStrategy;Ljava/lang/Object;)Lkotlinx/serialization/json/JsonElement;", "decodeFromJsonElement", "element", "(Lkotlinx/serialization/DeserializationStrategy;Lkotlinx/serialization/json/JsonElement;)Ljava/lang/Object;", "parseToJsonElement", "(Ljava/lang/Object;)Ljava/lang/String;", "(Ljava/lang/String;)Ljava/lang/Object;", "Default", "Lkotlinx/serialization/json/Json$Default;", "Lkotlinx/serialization/json/JsonImpl;", "kotlinx-serialization-json"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public abstract class Json implements StringFormat {

    /* renamed from: Default, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);

    @NotNull
    private final DescriptorSchemaCache _schemaCache;

    @NotNull
    private final JsonConfiguration configuration;

    @NotNull
    private final SerializersModule serializersModule;

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0087\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lkotlinx/serialization/json/Json$Default;", "Lkotlinx/serialization/json/Json;", "<init>", "()V", "kotlinx-serialization-json"}, k = 1, mv = {2, 1, 0}, xi = 48)
    /* renamed from: kotlinx.serialization.json.Json$Default, reason: from kotlin metadata */
    public static final class Companion extends Json {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
            super(new JsonConfiguration(false, false, false, false, false, false, null, false, false, null, false, false, null, false, false, false, null, 131071, null), SerializersModuleBuildersKt.EmptySerializersModule(), null);
        }
    }

    public /* synthetic */ Json(JsonConfiguration jsonConfiguration, SerializersModule serializersModule, DefaultConstructorMarker defaultConstructorMarker) {
        this(jsonConfiguration, serializersModule);
    }

    @Deprecated
    public static /* synthetic */ void get_schemaCache$kotlinx_serialization_json$annotations() {
    }

    public final <T> T decodeFromJsonElement(@NotNull DeserializationStrategy<? extends T> deserializer, @NotNull JsonElement element) {
        Intrinsics.g(deserializer, "deserializer");
        Intrinsics.g(element, "element");
        return (T) TreeJsonDecoderKt.readJson(this, element, deserializer);
    }

    @Override // kotlinx.serialization.StringFormat
    public final <T> T decodeFromString(@NotNull DeserializationStrategy<? extends T> deserializer, @NotNull String string) {
        Intrinsics.g(deserializer, "deserializer");
        Intrinsics.g(string, "string");
        StringJsonLexer StringJsonLexer = StringJsonLexerKt.StringJsonLexer(this, string);
        T t6 = (T) new StreamingJsonDecoder(this, WriteMode.OBJ, StringJsonLexer, deserializer.getDescriptor(), null).decodeSerializableValue(deserializer);
        StringJsonLexer.expectEof();
        return t6;
    }

    @NotNull
    public final <T> JsonElement encodeToJsonElement(@NotNull SerializationStrategy<? super T> serializer, T value) {
        Intrinsics.g(serializer, "serializer");
        return TreeJsonEncoderKt.writeJson(this, value, serializer);
    }

    @Override // kotlinx.serialization.StringFormat
    @NotNull
    public final <T> String encodeToString(@NotNull SerializationStrategy<? super T> serializer, T value) {
        Intrinsics.g(serializer, "serializer");
        JsonToStringWriter jsonToStringWriter = new JsonToStringWriter();
        try {
            JsonStreamsKt.encodeByWriter(this, jsonToStringWriter, serializer, value);
            return jsonToStringWriter.toString();
        } finally {
            jsonToStringWriter.release();
        }
    }

    @NotNull
    public final JsonConfiguration getConfiguration() {
        return this.configuration;
    }

    @Override // kotlinx.serialization.SerialFormat
    @NotNull
    public SerializersModule getSerializersModule() {
        return this.serializersModule;
    }

    @NotNull
    /* renamed from: get_schemaCache$kotlinx_serialization_json, reason: from getter */
    public final DescriptorSchemaCache get_schemaCache() {
        return this._schemaCache;
    }

    @NotNull
    public final JsonElement parseToJsonElement(@NotNull String string) {
        Intrinsics.g(string, "string");
        return (JsonElement) decodeFromString(JsonElementSerializer.INSTANCE, string);
    }

    private Json(JsonConfiguration jsonConfiguration, SerializersModule serializersModule) {
        this.configuration = jsonConfiguration;
        this.serializersModule = serializersModule;
        this._schemaCache = new DescriptorSchemaCache();
    }

    public final /* synthetic */ <T> T decodeFromString(String string) {
        Intrinsics.g(string, "string");
        getSerializersModule();
        Intrinsics.k();
        throw null;
    }

    public final /* synthetic */ <T> String encodeToString(T value) {
        getSerializersModule();
        Intrinsics.k();
        throw null;
    }
}
