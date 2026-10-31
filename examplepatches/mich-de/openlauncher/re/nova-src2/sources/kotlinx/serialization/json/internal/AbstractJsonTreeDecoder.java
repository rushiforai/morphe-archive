package kotlinx.serialization.json.internal;

import b.c0;
import b.u4;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import fq.c;
import java.util.NoSuchElementException;
import kotlin.KotlinNothingValueException;
import kotlin.Metadata;
import kotlin.jvm.JvmField;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Reflection;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlinx.serialization.DeserializationStrategy;
import kotlinx.serialization.PolymorphicSerializerKt;
import kotlinx.serialization.SerializationException;
import kotlinx.serialization.descriptors.PolymorphicKind;
import kotlinx.serialization.descriptors.PrimitiveKind;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.descriptors.SerialKind;
import kotlinx.serialization.descriptors.StructureKind;
import kotlinx.serialization.encoding.CompositeDecoder;
import kotlinx.serialization.encoding.Decoder;
import kotlinx.serialization.internal.AbstractPolymorphicSerializer;
import kotlinx.serialization.internal.NamedValueDecoder;
import kotlinx.serialization.json.Json;
import kotlinx.serialization.json.JsonArray;
import kotlinx.serialization.json.JsonConfiguration;
import kotlinx.serialization.json.JsonDecoder;
import kotlinx.serialization.json.JsonElement;
import kotlinx.serialization.json.JsonElementKt;
import kotlinx.serialization.json.JsonLiteral;
import kotlinx.serialization.json.JsonNull;
import kotlinx.serialization.json.JsonObject;
import kotlinx.serialization.json.JsonPrimitive;
import kotlinx.serialization.modules.SerializersModule;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import r70.j;

@Metadata(d1 = {"\u0000º\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\t\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0001\n\u0002\b\u0004\n\u0002\u0010\b\n\u0002\b\u0005\n\u0002\u0010\u0005\n\u0000\n\u0002\u0010\n\n\u0002\b\u0002\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u0007\n\u0000\n\u0002\u0010\u0006\n\u0000\n\u0002\u0010\f\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b2\u0018\u00002\u00020\u00012\u00020\u0002B%\b\u0004\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\b¢\u0006\u0004\b\t\u0010\nJ\b\u0010\u0017\u001a\u00020\u0006H\u0004J\u000e\u0010\u0018\u001a\u00020\b2\u0006\u0010\u0019\u001a\u00020\bJ\b\u0010\u001a\u001a\u00020\u0006H\u0016J!\u0010\u001b\u001a\u0002H\u001c\"\u0004\b\u0000\u0010\u001c2\f\u0010\u001d\u001a\b\u0012\u0004\u0012\u0002H\u001c0\u001eH\u0016¢\u0006\u0002\u0010\u001fJ\u0018\u0010 \u001a\u00020\b2\u0006\u0010!\u001a\u00020\b2\u0006\u0010\"\u001a\u00020\bH\u0014J\u0010\u0010#\u001a\u00020$2\u0006\u0010%\u001a\u00020&H\u0016J*\u0010'\u001a\u0002H\u001c\"\n\b\u0000\u0010\u001c\u0018\u0001*\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u00062\u0006\u0010%\u001a\u00020&H\u0086\b¢\u0006\u0002\u0010(J2\u0010'\u001a\u0002H\u001c\"\n\b\u0000\u0010\u001c\u0018\u0001*\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u00062\u0006\u0010)\u001a\u00020\b2\u0006\u0010*\u001a\u00020\bH\u0086\b¢\u0006\u0002\u0010+J\u0010\u0010,\u001a\u00020-2\u0006\u0010%\u001a\u00020&H\u0016J\b\u0010.\u001a\u00020/H\u0016J\u0019\u00100\u001a\u0002012\u0006\u0010*\u001a\u00020\b2\u0006\u0010%\u001a\u00020&H\u0084\bJC\u00100\u001a\u0002H\u001c\"\b\b\u0000\u0010\u001c*\u0002022\u0006\u0010*\u001a\u00020\b2\u0006\u00103\u001a\u00020\b2\u0019\u00104\u001a\u0015\u0012\u0004\u0012\u000201\u0012\u0006\u0012\u0004\u0018\u0001H\u001c05¢\u0006\u0002\b6H\u0082\b¢\u0006\u0002\u00107J \u00108\u001a\u0002092\u0006\u0010:\u001a\u0002012\u0006\u0010;\u001a\u00020\b2\u0006\u0010*\u001a\u00020\bH\u0002J\u0010\u0010<\u001a\u00020\u00062\u0006\u0010*\u001a\u00020\bH$J\u0018\u0010=\u001a\u00020>2\u0006\u0010*\u001a\u00020\b2\u0006\u0010?\u001a\u00020&H\u0014J\u0012\u0010@\u001a\u0004\u0018\u0001092\u0006\u0010*\u001a\u00020\bH\u0014J\u0010\u0010A\u001a\u00020/2\u0006\u0010*\u001a\u00020\bH\u0014J\u0010\u0010B\u001a\u00020/2\u0006\u0010*\u001a\u00020\bH\u0014J\u0010\u0010C\u001a\u00020D2\u0006\u0010*\u001a\u00020\bH\u0014J\u0010\u0010E\u001a\u00020F2\u0006\u0010*\u001a\u00020\bH\u0014J\u0010\u0010G\u001a\u00020>2\u0006\u0010*\u001a\u00020\bH\u0014J\u0010\u0010H\u001a\u00020I2\u0006\u0010*\u001a\u00020\bH\u0014J\u0010\u0010J\u001a\u00020K2\u0006\u0010*\u001a\u00020\bH\u0014J\u0010\u0010L\u001a\u00020M2\u0006\u0010*\u001a\u00020\bH\u0014J\u0010\u0010N\u001a\u00020O2\u0006\u0010*\u001a\u00020\bH\u0014J\u0010\u0010P\u001a\u00020\b2\u0006\u0010*\u001a\u00020\bH\u0014J\u0018\u0010Q\u001a\u00020R2\u0006\u0010*\u001a\u00020\b2\u0006\u0010S\u001a\u00020&H\u0014J\u0010\u0010T\u001a\u00020R2\u0006\u0010%\u001a\u00020&H\u0016R\u0014\u0010\u0003\u001a\u00020\u0004X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0014\u0010\u0005\u001a\u00020\u0006X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0016\u0010\u0007\u001a\u0004\u0018\u00010\bX\u0084\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010R\u0014\u0010\u0011\u001a\u00020\u00128VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\u0013\u0010\u0014R\u0010\u0010\u0015\u001a\u00020\u00168\u0004X\u0085\u0004¢\u0006\u0002\n\u0000\u0082\u0001\u0003UVW¨\u0006X"}, d2 = {"Lkotlinx/serialization/json/internal/AbstractJsonTreeDecoder;", "Lkotlinx/serialization/internal/NamedValueDecoder;", "Lkotlinx/serialization/json/JsonDecoder;", "json", "Lkotlinx/serialization/json/Json;", "value", "Lkotlinx/serialization/json/JsonElement;", "polymorphicDiscriminator", b.f42142b, "<init>", "(Lkotlinx/serialization/json/Json;Lkotlinx/serialization/json/JsonElement;Ljava/lang/String;)V", "getJson", "()Lkotlinx/serialization/json/Json;", "getValue", "()Lkotlinx/serialization/json/JsonElement;", "getPolymorphicDiscriminator", "()Ljava/lang/String;", "serializersModule", "Lkotlinx/serialization/modules/SerializersModule;", "getSerializersModule", "()Lkotlinx/serialization/modules/SerializersModule;", "configuration", "Lkotlinx/serialization/json/JsonConfiguration;", "currentObject", "renderTagStack", "currentTag", "decodeJsonElement", "decodeSerializableValue", "T", "deserializer", "Lkotlinx/serialization/DeserializationStrategy;", "(Lkotlinx/serialization/DeserializationStrategy;)Ljava/lang/Object;", "composeName", "parentName", "childName", "beginStructure", "Lkotlinx/serialization/encoding/CompositeDecoder;", "descriptor", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "cast", "(Lkotlinx/serialization/json/JsonElement;Lkotlinx/serialization/descriptors/SerialDescriptor;)Lkotlinx/serialization/json/JsonElement;", "serialName", "tag", "(Lkotlinx/serialization/json/JsonElement;Ljava/lang/String;Ljava/lang/String;)Lkotlinx/serialization/json/JsonElement;", "endStructure", b.f42142b, "decodeNotNullMark", b.f42142b, "getPrimitiveValue", "Lkotlinx/serialization/json/JsonPrimitive;", b.f42142b, "primitiveName", "convert", "Lkotlin/Function1;", "Lkotlin/ExtensionFunctionType;", "(Ljava/lang/String;Ljava/lang/String;Lkotlin/jvm/functions/Function1;)Ljava/lang/Object;", "unparsedPrimitive", b.f42142b, "literal", TreeJsonEncoderKt.PRIMITIVE_TAG, "currentElement", "decodeTaggedEnum", b.f42142b, "enumDescriptor", "decodeTaggedNull", "decodeTaggedNotNullMark", "decodeTaggedBoolean", "decodeTaggedByte", b.f42142b, "decodeTaggedShort", b.f42142b, "decodeTaggedInt", "decodeTaggedLong", b.f42142b, "decodeTaggedFloat", b.f42142b, "decodeTaggedDouble", b.f42142b, "decodeTaggedChar", b.f42142b, "decodeTaggedString", "decodeTaggedInline", "Lkotlinx/serialization/encoding/Decoder;", "inlineDescriptor", "decodeInline", "Lkotlinx/serialization/json/internal/JsonPrimitiveDecoder;", "Lkotlinx/serialization/json/internal/JsonTreeDecoder;", "Lkotlinx/serialization/json/internal/JsonTreeListDecoder;", "kotlinx-serialization-json"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes5.dex */
abstract class AbstractJsonTreeDecoder extends NamedValueDecoder implements JsonDecoder {

    @JvmField
    @NotNull
    protected final JsonConfiguration configuration;

    @NotNull
    private final Json json;

    @Nullable
    private final String polymorphicDiscriminator;

    @NotNull
    private final JsonElement value;

    public /* synthetic */ AbstractJsonTreeDecoder(Json json, JsonElement jsonElement, String str, DefaultConstructorMarker defaultConstructorMarker) {
        this(json, jsonElement, str);
    }

    private final Void unparsedPrimitive(JsonPrimitive literal, String primitive, String tag) {
        throw JsonExceptionsKt.JsonDecodingException(-1, "Failed to parse literal '" + literal + "' as " + (j.I0(primitive, "i", false) ? "an " : "a ").concat(primitive) + " value at element: " + renderTagStack(tag), currentObject().toString());
    }

    @Override // kotlinx.serialization.internal.TaggedDecoder, kotlinx.serialization.encoding.Decoder
    @NotNull
    public CompositeDecoder beginStructure(@NotNull SerialDescriptor descriptor) {
        Intrinsics.g(descriptor, "descriptor");
        JsonElement jsonElementCurrentObject = currentObject();
        SerialKind kind = descriptor.getKind();
        if (Intrinsics.b(kind, StructureKind.LIST.INSTANCE) || (kind instanceof PolymorphicKind)) {
            Json json = getJson();
            String serialName = descriptor.getSerialName();
            if (jsonElementCurrentObject instanceof JsonArray) {
                return new JsonTreeListDecoder(json, (JsonArray) jsonElementCurrentObject);
            }
            StringBuilder sb2 = new StringBuilder("Expected ");
            c.s(Reflection.f71864a, JsonArray.class, sb2, ", but had ", jsonElementCurrentObject);
            c0.C(sb2, " as the serialized body of ", serialName, " at element: ");
            sb2.append(renderTagStack());
            throw JsonExceptionsKt.JsonDecodingException(-1, sb2.toString(), jsonElementCurrentObject.toString());
        }
        if (!Intrinsics.b(kind, StructureKind.MAP.INSTANCE)) {
            Json json2 = getJson();
            String serialName2 = descriptor.getSerialName();
            if (jsonElementCurrentObject instanceof JsonObject) {
                return new JsonTreeDecoder(json2, (JsonObject) jsonElementCurrentObject, this.polymorphicDiscriminator, null, 8, null);
            }
            StringBuilder sb3 = new StringBuilder("Expected ");
            c.s(Reflection.f71864a, JsonObject.class, sb3, ", but had ", jsonElementCurrentObject);
            c0.C(sb3, " as the serialized body of ", serialName2, " at element: ");
            sb3.append(renderTagStack());
            throw JsonExceptionsKt.JsonDecodingException(-1, sb3.toString(), jsonElementCurrentObject.toString());
        }
        Json json3 = getJson();
        SerialDescriptor serialDescriptorCarrierDescriptor = WriteModeKt.carrierDescriptor(descriptor.getElementDescriptor(0), json3.getSerializersModule());
        SerialKind kind2 = serialDescriptorCarrierDescriptor.getKind();
        if ((kind2 instanceof PrimitiveKind) || Intrinsics.b(kind2, SerialKind.ENUM.INSTANCE)) {
            Json json4 = getJson();
            String serialName3 = descriptor.getSerialName();
            if (jsonElementCurrentObject instanceof JsonObject) {
                return new JsonTreeMapDecoder(json4, (JsonObject) jsonElementCurrentObject);
            }
            StringBuilder sb4 = new StringBuilder("Expected ");
            c.s(Reflection.f71864a, JsonObject.class, sb4, ", but had ", jsonElementCurrentObject);
            c0.C(sb4, " as the serialized body of ", serialName3, " at element: ");
            sb4.append(renderTagStack());
            throw JsonExceptionsKt.JsonDecodingException(-1, sb4.toString(), jsonElementCurrentObject.toString());
        }
        if (!json3.getConfiguration().getAllowStructuredMapKeys()) {
            throw JsonExceptionsKt.InvalidKeyKindException(serialDescriptorCarrierDescriptor);
        }
        Json json5 = getJson();
        String serialName4 = descriptor.getSerialName();
        if (jsonElementCurrentObject instanceof JsonArray) {
            return new JsonTreeListDecoder(json5, (JsonArray) jsonElementCurrentObject);
        }
        StringBuilder sb5 = new StringBuilder("Expected ");
        c.s(Reflection.f71864a, JsonArray.class, sb5, ", but had ", jsonElementCurrentObject);
        c0.C(sb5, " as the serialized body of ", serialName4, " at element: ");
        sb5.append(renderTagStack());
        throw JsonExceptionsKt.JsonDecodingException(-1, sb5.toString(), jsonElementCurrentObject.toString());
    }

    public final <T extends JsonElement> T cast(JsonElement value, SerialDescriptor descriptor) {
        Intrinsics.g(value, "value");
        Intrinsics.g(descriptor, "descriptor");
        descriptor.getSerialName();
        Intrinsics.k();
        throw null;
    }

    @Override // kotlinx.serialization.internal.NamedValueDecoder
    @NotNull
    public String composeName(@NotNull String parentName, @NotNull String childName) {
        Intrinsics.g(parentName, "parentName");
        Intrinsics.g(childName, "childName");
        return childName;
    }

    @NotNull
    public abstract JsonElement currentElement(@NotNull String tag);

    @NotNull
    public final JsonElement currentObject() {
        JsonElement jsonElementCurrentElement;
        String currentTagOrNull = getCurrentTagOrNull();
        return (currentTagOrNull == null || (jsonElementCurrentElement = currentElement(currentTagOrNull)) == null) ? getValue() : jsonElementCurrentElement;
    }

    @Override // kotlinx.serialization.internal.TaggedDecoder, kotlinx.serialization.encoding.Decoder
    @NotNull
    public Decoder decodeInline(@NotNull SerialDescriptor descriptor) {
        Intrinsics.g(descriptor, "descriptor");
        return getCurrentTagOrNull() != null ? super.decodeInline(descriptor) : new JsonPrimitiveDecoder(getJson(), getValue(), this.polymorphicDiscriminator).decodeInline(descriptor);
    }

    @Override // kotlinx.serialization.json.JsonDecoder
    @NotNull
    public JsonElement decodeJsonElement() {
        return currentObject();
    }

    @Override // kotlinx.serialization.internal.TaggedDecoder, kotlinx.serialization.encoding.Decoder
    public boolean decodeNotNullMark() {
        return !(currentObject() instanceof JsonNull);
    }

    @Override // kotlinx.serialization.encoding.Decoder
    public <T> T decodeSerializableValue(@NotNull DeserializationStrategy<? extends T> deserializer) {
        JsonPrimitive jsonPrimitive;
        Intrinsics.g(deserializer, "deserializer");
        if (!(deserializer instanceof AbstractPolymorphicSerializer) || getJson().getConfiguration().getUseArrayPolymorphism()) {
            return deserializer.deserialize(this);
        }
        AbstractPolymorphicSerializer abstractPolymorphicSerializer = (AbstractPolymorphicSerializer) deserializer;
        String strClassDiscriminator = PolymorphicKt.classDiscriminator(abstractPolymorphicSerializer.getDescriptor(), getJson());
        JsonElement jsonElementDecodeJsonElement = decodeJsonElement();
        String serialName = abstractPolymorphicSerializer.getDescriptor().getSerialName();
        if (!(jsonElementDecodeJsonElement instanceof JsonObject)) {
            StringBuilder sb2 = new StringBuilder("Expected ");
            c.s(Reflection.f71864a, JsonObject.class, sb2, ", but had ", jsonElementDecodeJsonElement);
            sb2.append(" as the serialized body of ");
            sb2.append(serialName);
            sb2.append(" at element: ");
            sb2.append(renderTagStack());
            throw JsonExceptionsKt.JsonDecodingException(-1, sb2.toString(), jsonElementDecodeJsonElement.toString());
        }
        JsonObject jsonObject = (JsonObject) jsonElementDecodeJsonElement;
        JsonElement jsonElement = (JsonElement) jsonObject.get((Object) strClassDiscriminator);
        try {
            DeserializationStrategy deserializationStrategyFindPolymorphicSerializer = PolymorphicSerializerKt.findPolymorphicSerializer((AbstractPolymorphicSerializer) deserializer, this, (jsonElement == null || (jsonPrimitive = JsonElementKt.getJsonPrimitive(jsonElement)) == null) ? null : JsonElementKt.getContentOrNull(jsonPrimitive));
            Intrinsics.e(deserializationStrategyFindPolymorphicSerializer, "null cannot be cast to non-null type kotlinx.serialization.DeserializationStrategy<T of kotlinx.serialization.json.internal.PolymorphicKt.decodeSerializableValuePolymorphic>");
            return (T) TreeJsonDecoderKt.readPolymorphicJson(getJson(), strClassDiscriminator, jsonObject, deserializationStrategyFindPolymorphicSerializer);
        } catch (SerializationException e3) {
            String message = e3.getMessage();
            Intrinsics.d(message);
            throw JsonExceptionsKt.JsonDecodingException(-1, message, jsonObject.toString());
        }
    }

    @Override // kotlinx.serialization.internal.TaggedDecoder
    @Nullable
    public Void decodeTaggedNull(@NotNull String tag) {
        Intrinsics.g(tag, "tag");
        return null;
    }

    @Override // kotlinx.serialization.internal.TaggedDecoder, kotlinx.serialization.encoding.CompositeDecoder
    public void endStructure(@NotNull SerialDescriptor descriptor) {
        Intrinsics.g(descriptor, "descriptor");
    }

    @Override // kotlinx.serialization.json.JsonDecoder
    @NotNull
    public Json getJson() {
        return this.json;
    }

    @Nullable
    public final String getPolymorphicDiscriminator() {
        return this.polymorphicDiscriminator;
    }

    @NotNull
    public final JsonPrimitive getPrimitiveValue(@NotNull String tag, @NotNull SerialDescriptor descriptor) {
        Intrinsics.g(tag, "tag");
        Intrinsics.g(descriptor, "descriptor");
        JsonElement jsonElementCurrentElement = currentElement(tag);
        String serialName = descriptor.getSerialName();
        if (jsonElementCurrentElement instanceof JsonPrimitive) {
            return (JsonPrimitive) jsonElementCurrentElement;
        }
        StringBuilder sb2 = new StringBuilder("Expected ");
        c.s(Reflection.f71864a, JsonPrimitive.class, sb2, ", but had ", jsonElementCurrentElement);
        c0.C(sb2, " as the serialized body of ", serialName, " at element: ");
        sb2.append(renderTagStack(tag));
        throw JsonExceptionsKt.JsonDecodingException(-1, sb2.toString(), jsonElementCurrentElement.toString());
    }

    @Override // kotlinx.serialization.internal.TaggedDecoder, kotlinx.serialization.encoding.Decoder, kotlinx.serialization.encoding.CompositeDecoder
    @NotNull
    public SerializersModule getSerializersModule() {
        return getJson().getSerializersModule();
    }

    @NotNull
    public JsonElement getValue() {
        return this.value;
    }

    @NotNull
    public final String renderTagStack(@NotNull String currentTag) {
        Intrinsics.g(currentTag, "currentTag");
        return renderTagStack() + '.' + currentTag;
    }

    public /* synthetic */ AbstractJsonTreeDecoder(Json json, JsonElement jsonElement, String str, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(json, jsonElement, (i5 & 4) != 0 ? null : str, null);
    }

    @Override // kotlinx.serialization.internal.TaggedDecoder
    public boolean decodeTaggedBoolean(@NotNull String tag) {
        Intrinsics.g(tag, "tag");
        JsonElement jsonElementCurrentElement = currentElement(tag);
        if (!(jsonElementCurrentElement instanceof JsonPrimitive)) {
            StringBuilder sb2 = new StringBuilder("Expected ");
            c.s(Reflection.f71864a, JsonPrimitive.class, sb2, ", but had ", jsonElementCurrentElement);
            sb2.append(" as the serialized body of boolean at element: ");
            sb2.append(renderTagStack(tag));
            throw JsonExceptionsKt.JsonDecodingException(-1, sb2.toString(), jsonElementCurrentElement.toString());
        }
        JsonPrimitive jsonPrimitive = (JsonPrimitive) jsonElementCurrentElement;
        try {
            Boolean booleanOrNull = JsonElementKt.getBooleanOrNull(jsonPrimitive);
            if (booleanOrNull != null) {
                return booleanOrNull.booleanValue();
            }
            unparsedPrimitive(jsonPrimitive, "boolean", tag);
            throw new KotlinNothingValueException();
        } catch (IllegalArgumentException unused) {
            unparsedPrimitive(jsonPrimitive, "boolean", tag);
            throw new KotlinNothingValueException();
        }
    }

    @Override // kotlinx.serialization.internal.TaggedDecoder
    public byte decodeTaggedByte(@NotNull String tag) {
        Intrinsics.g(tag, "tag");
        JsonElement jsonElementCurrentElement = currentElement(tag);
        if (!(jsonElementCurrentElement instanceof JsonPrimitive)) {
            StringBuilder sb2 = new StringBuilder("Expected ");
            c.s(Reflection.f71864a, JsonPrimitive.class, sb2, ", but had ", jsonElementCurrentElement);
            sb2.append(" as the serialized body of byte at element: ");
            sb2.append(renderTagStack(tag));
            throw JsonExceptionsKt.JsonDecodingException(-1, sb2.toString(), jsonElementCurrentElement.toString());
        }
        JsonPrimitive jsonPrimitive = (JsonPrimitive) jsonElementCurrentElement;
        try {
            long longImpl = JsonElementKt.parseLongImpl(jsonPrimitive);
            Byte bValueOf = (-128 > longImpl || longImpl > 127) ? null : Byte.valueOf((byte) longImpl);
            if (bValueOf != null) {
                return bValueOf.byteValue();
            }
            unparsedPrimitive(jsonPrimitive, "byte", tag);
            throw new KotlinNothingValueException();
        } catch (IllegalArgumentException unused) {
            unparsedPrimitive(jsonPrimitive, "byte", tag);
            throw new KotlinNothingValueException();
        }
    }

    @Override // kotlinx.serialization.internal.TaggedDecoder
    public char decodeTaggedChar(@NotNull String tag) {
        Intrinsics.g(tag, "tag");
        JsonElement jsonElementCurrentElement = currentElement(tag);
        if (!(jsonElementCurrentElement instanceof JsonPrimitive)) {
            StringBuilder sb2 = new StringBuilder("Expected ");
            c.s(Reflection.f71864a, JsonPrimitive.class, sb2, ", but had ", jsonElementCurrentElement);
            sb2.append(" as the serialized body of char at element: ");
            sb2.append(renderTagStack(tag));
            throw JsonExceptionsKt.JsonDecodingException(-1, sb2.toString(), jsonElementCurrentElement.toString());
        }
        JsonPrimitive jsonPrimitive = (JsonPrimitive) jsonElementCurrentElement;
        try {
            String content = jsonPrimitive.getContent();
            Intrinsics.g(content, "<this>");
            int length = content.length();
            if (length == 0) {
                throw new NoSuchElementException("Char sequence is empty.");
            }
            if (length == 1) {
                return content.charAt(0);
            }
            throw new IllegalArgumentException("Char sequence has more than one element.");
        } catch (IllegalArgumentException unused) {
            unparsedPrimitive(jsonPrimitive, "char", tag);
            throw new KotlinNothingValueException();
        }
    }

    @Override // kotlinx.serialization.internal.TaggedDecoder
    public double decodeTaggedDouble(@NotNull String tag) {
        Intrinsics.g(tag, "tag");
        JsonElement jsonElementCurrentElement = currentElement(tag);
        if (!(jsonElementCurrentElement instanceof JsonPrimitive)) {
            StringBuilder sb2 = new StringBuilder("Expected ");
            c.s(Reflection.f71864a, JsonPrimitive.class, sb2, ", but had ", jsonElementCurrentElement);
            sb2.append(" as the serialized body of double at element: ");
            sb2.append(renderTagStack(tag));
            throw JsonExceptionsKt.JsonDecodingException(-1, sb2.toString(), jsonElementCurrentElement.toString());
        }
        JsonPrimitive jsonPrimitive = (JsonPrimitive) jsonElementCurrentElement;
        try {
            double d5 = JsonElementKt.getDouble(jsonPrimitive);
            if (getJson().getConfiguration().getAllowSpecialFloatingPointValues() || Math.abs(d5) <= Double.MAX_VALUE) {
                return d5;
            }
            throw JsonExceptionsKt.InvalidFloatingPointDecoded(Double.valueOf(d5), tag, currentObject().toString());
        } catch (IllegalArgumentException unused) {
            unparsedPrimitive(jsonPrimitive, "double", tag);
            throw new KotlinNothingValueException();
        }
    }

    @Override // kotlinx.serialization.internal.TaggedDecoder
    public int decodeTaggedEnum(@NotNull String tag, @NotNull SerialDescriptor enumDescriptor) {
        Intrinsics.g(tag, "tag");
        Intrinsics.g(enumDescriptor, "enumDescriptor");
        Json json = getJson();
        JsonElement jsonElementCurrentElement = currentElement(tag);
        String serialName = enumDescriptor.getSerialName();
        if (jsonElementCurrentElement instanceof JsonPrimitive) {
            return JsonNamesMapKt.getJsonNameIndexOrThrow$default(enumDescriptor, json, ((JsonPrimitive) jsonElementCurrentElement).getContent(), null, 4, null);
        }
        StringBuilder sb2 = new StringBuilder("Expected ");
        c.s(Reflection.f71864a, JsonPrimitive.class, sb2, ", but had ", jsonElementCurrentElement);
        c0.C(sb2, " as the serialized body of ", serialName, " at element: ");
        sb2.append(renderTagStack(tag));
        throw JsonExceptionsKt.JsonDecodingException(-1, sb2.toString(), jsonElementCurrentElement.toString());
    }

    @Override // kotlinx.serialization.internal.TaggedDecoder
    public float decodeTaggedFloat(@NotNull String tag) {
        Intrinsics.g(tag, "tag");
        JsonElement jsonElementCurrentElement = currentElement(tag);
        if (!(jsonElementCurrentElement instanceof JsonPrimitive)) {
            StringBuilder sb2 = new StringBuilder("Expected ");
            c.s(Reflection.f71864a, JsonPrimitive.class, sb2, ", but had ", jsonElementCurrentElement);
            sb2.append(" as the serialized body of float at element: ");
            sb2.append(renderTagStack(tag));
            throw JsonExceptionsKt.JsonDecodingException(-1, sb2.toString(), jsonElementCurrentElement.toString());
        }
        JsonPrimitive jsonPrimitive = (JsonPrimitive) jsonElementCurrentElement;
        try {
            float f11 = JsonElementKt.getFloat(jsonPrimitive);
            if (getJson().getConfiguration().getAllowSpecialFloatingPointValues() || Math.abs(f11) <= Float.MAX_VALUE) {
                return f11;
            }
            throw JsonExceptionsKt.InvalidFloatingPointDecoded(Float.valueOf(f11), tag, currentObject().toString());
        } catch (IllegalArgumentException unused) {
            unparsedPrimitive(jsonPrimitive, "float", tag);
            throw new KotlinNothingValueException();
        }
    }

    @Override // kotlinx.serialization.internal.TaggedDecoder
    @NotNull
    public Decoder decodeTaggedInline(@NotNull String tag, @NotNull SerialDescriptor inlineDescriptor) {
        Intrinsics.g(tag, "tag");
        Intrinsics.g(inlineDescriptor, "inlineDescriptor");
        if (!StreamingJsonEncoderKt.isUnsignedNumber(inlineDescriptor)) {
            return super.decodeTaggedInline((AbstractJsonTreeDecoder) tag, inlineDescriptor);
        }
        Json json = getJson();
        JsonElement jsonElementCurrentElement = currentElement(tag);
        String serialName = inlineDescriptor.getSerialName();
        if (jsonElementCurrentElement instanceof JsonPrimitive) {
            return new JsonDecoderForUnsignedTypes(StringJsonLexerKt.StringJsonLexer(json, ((JsonPrimitive) jsonElementCurrentElement).getContent()), getJson());
        }
        StringBuilder sb2 = new StringBuilder("Expected ");
        c.s(Reflection.f71864a, JsonPrimitive.class, sb2, ", but had ", jsonElementCurrentElement);
        c0.C(sb2, " as the serialized body of ", serialName, " at element: ");
        sb2.append(renderTagStack(tag));
        throw JsonExceptionsKt.JsonDecodingException(-1, sb2.toString(), jsonElementCurrentElement.toString());
    }

    @Override // kotlinx.serialization.internal.TaggedDecoder
    public int decodeTaggedInt(@NotNull String tag) {
        Intrinsics.g(tag, "tag");
        JsonElement jsonElementCurrentElement = currentElement(tag);
        if (!(jsonElementCurrentElement instanceof JsonPrimitive)) {
            StringBuilder sb2 = new StringBuilder("Expected ");
            c.s(Reflection.f71864a, JsonPrimitive.class, sb2, ", but had ", jsonElementCurrentElement);
            sb2.append(" as the serialized body of int at element: ");
            sb2.append(renderTagStack(tag));
            throw JsonExceptionsKt.JsonDecodingException(-1, sb2.toString(), jsonElementCurrentElement.toString());
        }
        JsonPrimitive jsonPrimitive = (JsonPrimitive) jsonElementCurrentElement;
        try {
            long longImpl = JsonElementKt.parseLongImpl(jsonPrimitive);
            Integer numValueOf = (-2147483648L > longImpl || longImpl > 2147483647L) ? null : Integer.valueOf((int) longImpl);
            if (numValueOf != null) {
                return numValueOf.intValue();
            }
            unparsedPrimitive(jsonPrimitive, "int", tag);
            throw new KotlinNothingValueException();
        } catch (IllegalArgumentException unused) {
            unparsedPrimitive(jsonPrimitive, "int", tag);
            throw new KotlinNothingValueException();
        }
    }

    @Override // kotlinx.serialization.internal.TaggedDecoder
    public long decodeTaggedLong(@NotNull String tag) {
        Intrinsics.g(tag, "tag");
        JsonElement jsonElementCurrentElement = currentElement(tag);
        if (jsonElementCurrentElement instanceof JsonPrimitive) {
            JsonPrimitive jsonPrimitive = (JsonPrimitive) jsonElementCurrentElement;
            try {
                return JsonElementKt.parseLongImpl(jsonPrimitive);
            } catch (IllegalArgumentException unused) {
                unparsedPrimitive(jsonPrimitive, "long", tag);
                throw new KotlinNothingValueException();
            }
        }
        StringBuilder sb2 = new StringBuilder("Expected ");
        c.s(Reflection.f71864a, JsonPrimitive.class, sb2, ", but had ", jsonElementCurrentElement);
        sb2.append(" as the serialized body of long at element: ");
        sb2.append(renderTagStack(tag));
        throw JsonExceptionsKt.JsonDecodingException(-1, sb2.toString(), jsonElementCurrentElement.toString());
    }

    @Override // kotlinx.serialization.internal.TaggedDecoder
    public boolean decodeTaggedNotNullMark(@NotNull String tag) {
        Intrinsics.g(tag, "tag");
        return currentElement(tag) != JsonNull.INSTANCE;
    }

    @Override // kotlinx.serialization.internal.TaggedDecoder
    public short decodeTaggedShort(@NotNull String tag) {
        Intrinsics.g(tag, "tag");
        JsonElement jsonElementCurrentElement = currentElement(tag);
        if (!(jsonElementCurrentElement instanceof JsonPrimitive)) {
            StringBuilder sb2 = new StringBuilder("Expected ");
            c.s(Reflection.f71864a, JsonPrimitive.class, sb2, ", but had ", jsonElementCurrentElement);
            sb2.append(" as the serialized body of short at element: ");
            sb2.append(renderTagStack(tag));
            throw JsonExceptionsKt.JsonDecodingException(-1, sb2.toString(), jsonElementCurrentElement.toString());
        }
        JsonPrimitive jsonPrimitive = (JsonPrimitive) jsonElementCurrentElement;
        try {
            long longImpl = JsonElementKt.parseLongImpl(jsonPrimitive);
            Short shValueOf = (-32768 > longImpl || longImpl > 32767) ? null : Short.valueOf((short) longImpl);
            if (shValueOf != null) {
                return shValueOf.shortValue();
            }
            unparsedPrimitive(jsonPrimitive, "short", tag);
            throw new KotlinNothingValueException();
        } catch (IllegalArgumentException unused) {
            unparsedPrimitive(jsonPrimitive, "short", tag);
            throw new KotlinNothingValueException();
        }
    }

    @Override // kotlinx.serialization.internal.TaggedDecoder
    @NotNull
    public String decodeTaggedString(@NotNull String tag) {
        Intrinsics.g(tag, "tag");
        JsonElement jsonElementCurrentElement = currentElement(tag);
        if (!(jsonElementCurrentElement instanceof JsonPrimitive)) {
            StringBuilder sb2 = new StringBuilder("Expected ");
            c.s(Reflection.f71864a, JsonPrimitive.class, sb2, ", but had ", jsonElementCurrentElement);
            sb2.append(" as the serialized body of string at element: ");
            sb2.append(renderTagStack(tag));
            throw JsonExceptionsKt.JsonDecodingException(-1, sb2.toString(), jsonElementCurrentElement.toString());
        }
        JsonPrimitive jsonPrimitive = (JsonPrimitive) jsonElementCurrentElement;
        if (!(jsonPrimitive instanceof JsonLiteral)) {
            StringBuilder sbK = u4.k("Expected string value for a non-null key '", tag, "', got null literal instead at element: ");
            sbK.append(renderTagStack(tag));
            throw JsonExceptionsKt.JsonDecodingException(-1, sbK.toString(), currentObject().toString());
        }
        JsonLiteral jsonLiteral = (JsonLiteral) jsonPrimitive;
        if (jsonLiteral.getIsString() || getJson().getConfiguration().getIsLenient()) {
            return jsonLiteral.getContent();
        }
        throw JsonExceptionsKt.JsonDecodingException(-1, c0.q(u4.k("String literal for key '", tag, "' should be quoted at element: "), renderTagStack(tag), ".\nUse 'isLenient = true' in 'Json {}' builder to accept non-compliant JSON."), currentObject().toString());
    }

    private AbstractJsonTreeDecoder(Json json, JsonElement jsonElement, String str) {
        this.json = json;
        this.value = jsonElement;
        this.polymorphicDiscriminator = str;
        this.configuration = getJson().getConfiguration();
    }

    public final <T extends JsonElement> T cast(JsonElement value, String serialName, String tag) {
        Intrinsics.g(value, "value");
        Intrinsics.g(serialName, "serialName");
        Intrinsics.g(tag, "tag");
        Intrinsics.k();
        throw null;
    }

    private final <T> T getPrimitiveValue(String tag, String primitiveName, Function1<? super JsonPrimitive, ? extends T> convert) {
        JsonElement jsonElementCurrentElement = currentElement(tag);
        if (jsonElementCurrentElement instanceof JsonPrimitive) {
            JsonPrimitive jsonPrimitive = (JsonPrimitive) jsonElementCurrentElement;
            try {
                T t6 = (T) convert.invoke(jsonPrimitive);
                if (t6 != null) {
                    return t6;
                }
                unparsedPrimitive(jsonPrimitive, primitiveName, tag);
                throw new KotlinNothingValueException();
            } catch (IllegalArgumentException unused) {
                unparsedPrimitive(jsonPrimitive, primitiveName, tag);
                throw new KotlinNothingValueException();
            }
        }
        StringBuilder sb2 = new StringBuilder("Expected ");
        c.s(Reflection.f71864a, JsonPrimitive.class, sb2, ", but had ", jsonElementCurrentElement);
        c0.C(sb2, " as the serialized body of ", primitiveName, " at element: ");
        sb2.append(renderTagStack(tag));
        throw JsonExceptionsKt.JsonDecodingException(-1, sb2.toString(), jsonElementCurrentElement.toString());
    }
}
