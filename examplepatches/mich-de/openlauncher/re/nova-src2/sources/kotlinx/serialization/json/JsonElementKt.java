package kotlinx.serialization.json;

import b.c0;
import com.amplitude.android.migration.DatabaseConstants;
import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.KotlinNothingValueException;
import kotlin.Metadata;
import kotlin.PublishedApi;
import kotlin.ULong;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Reflection;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.jvm.internal.StringCompanionObject;
import kotlinx.serialization.ExperimentalSerializationApi;
import kotlinx.serialization.builtins.BuiltinSerializersKt;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.internal.InlineClassDescriptorKt;
import kotlinx.serialization.json.internal.JsonDecodingException;
import kotlinx.serialization.json.internal.JsonEncodingException;
import kotlinx.serialization.json.internal.StringJsonLexer;
import kotlinx.serialization.json.internal.StringOpsKt;
import kotlinx.serialization.json.internal.SuppressAnimalSniffer;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import r70.i;

@Metadata(d1 = {"\u0000\u008a\u0001\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0004\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0002\u0010\u0001\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\b\n\u0002\b\u0006\n\u0002\u0010\t\n\u0002\b\u0006\n\u0002\u0010\u0006\n\u0002\b\u0006\n\u0002\u0010\u0007\n\u0002\b\u0013\n\u0002\u0018\u0002\n\u0002\b\u0007\u001a\u0015\u0010\u0000\u001a\u00020\u00012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0002\u0010\u0004\u001a\u0010\u0010\u0000\u001a\u00020\u00012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0005\u001a\u0017\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u0006H\u0007¢\u0006\u0004\b\u0007\u0010\b\u001a\u0017\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\tH\u0007¢\u0006\u0004\b\n\u0010\u000b\u001a\u0017\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\fH\u0007¢\u0006\u0004\b\r\u0010\u000e\u001a\u0017\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u000fH\u0007¢\u0006\u0004\b\u0010\u0010\u0011\u001a\u0010\u0010\u0000\u001a\u00020\u00012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0012\u001a\u0012\u0010\u0000\u001a\u00020\u00132\b\u0010\u0002\u001a\u0004\u0018\u00010\u0014H\u0007\u001a\u0012\u0010\u0015\u001a\u00020\u00012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0012H\u0007\u001a\u0014\u0010N\u001a\u00020\u0014*\u00020\u001b2\u0006\u0010O\u001a\u00020\u0012H\u0002\u001a$\u0010P\u001a\u0004\u0018\u0001HQ\"\u0004\b\u0000\u0010Q2\f\u0010R\u001a\b\u0012\u0004\u0012\u0002HQ0SH\u0082\b¢\u0006\u0002\u0010T\u001a\"\u0010U\u001a\u0002HQ\"\u0004\b\u0000\u0010Q2\f\u0010R\u001a\b\u0012\u0004\u0012\u0002HQ0SH\u0082\b¢\u0006\u0002\u0010T\u001a\u0018\u0010V\u001a\u00020\u00142\u0006\u0010W\u001a\u00020\u00122\u0006\u0010X\u001a\u00020\u0012H\u0001\u001a\f\u0010Y\u001a\u000201*\u00020\u0001H\u0000\"\u0014\u0010\u0016\u001a\u00020\u0017X\u0080\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0018\u0010\u0019\"\u0015\u0010\u001a\u001a\u00020\u0001*\u00020\u001b8F¢\u0006\u0006\u001a\u0004\b\u001c\u0010\u001d\"\u0015\u0010\u001e\u001a\u00020\u001f*\u00020\u001b8F¢\u0006\u0006\u001a\u0004\b \u0010!\"\u0015\u0010\"\u001a\u00020#*\u00020\u001b8F¢\u0006\u0006\u001a\u0004\b$\u0010%\"\u0015\u0010&\u001a\u00020\u0013*\u00020\u001b8F¢\u0006\u0006\u001a\u0004\b'\u0010(\"\u0015\u0010)\u001a\u00020**\u00020\u00018F¢\u0006\u0006\u001a\u0004\b+\u0010,\"\u0017\u0010-\u001a\u0004\u0018\u00010**\u00020\u00018F¢\u0006\u0006\u001a\u0004\b.\u0010/\"\u0015\u00100\u001a\u000201*\u00020\u00018F¢\u0006\u0006\u001a\u0004\b2\u00103\"\u0017\u00104\u001a\u0004\u0018\u000101*\u00020\u00018F¢\u0006\u0006\u001a\u0004\b5\u00106\"\u0015\u00107\u001a\u000208*\u00020\u00018F¢\u0006\u0006\u001a\u0004\b9\u0010:\"\u0017\u0010;\u001a\u0004\u0018\u000108*\u00020\u00018F¢\u0006\u0006\u001a\u0004\b<\u0010=\"\u0015\u0010>\u001a\u00020?*\u00020\u00018F¢\u0006\u0006\u001a\u0004\b@\u0010A\"\u0017\u0010B\u001a\u0004\u0018\u00010?*\u00020\u00018F¢\u0006\u0006\u001a\u0004\bC\u0010D\"\u0015\u0010E\u001a\u00020\u0003*\u00020\u00018F¢\u0006\u0006\u001a\u0004\bF\u0010G\"\u0017\u0010H\u001a\u0004\u0018\u00010\u0003*\u00020\u00018F¢\u0006\u0006\u001a\u0004\bI\u0010J\"\u0017\u0010K\u001a\u0004\u0018\u00010\u0012*\u00020\u00018F¢\u0006\u0006\u001a\u0004\bL\u0010M¨\u0006Z"}, d2 = {"JsonPrimitive", "Lkotlinx/serialization/json/JsonPrimitive;", "value", b.f42142b, "(Ljava/lang/Boolean;)Lkotlinx/serialization/json/JsonPrimitive;", b.f42142b, "Lkotlin/UByte;", "JsonPrimitive-7apg3OU", "(B)Lkotlinx/serialization/json/JsonPrimitive;", "Lkotlin/UShort;", "JsonPrimitive-xj2QHRw", "(S)Lkotlinx/serialization/json/JsonPrimitive;", "Lkotlin/UInt;", "JsonPrimitive-WZ4Q5Ns", "(I)Lkotlinx/serialization/json/JsonPrimitive;", "Lkotlin/ULong;", "JsonPrimitive-VKZWuLQ", "(J)Lkotlinx/serialization/json/JsonPrimitive;", b.f42142b, "Lkotlinx/serialization/json/JsonNull;", b.f42142b, "JsonUnquotedLiteral", "jsonUnquotedLiteralDescriptor", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "getJsonUnquotedLiteralDescriptor", "()Lkotlinx/serialization/descriptors/SerialDescriptor;", "jsonPrimitive", "Lkotlinx/serialization/json/JsonElement;", "getJsonPrimitive", "(Lkotlinx/serialization/json/JsonElement;)Lkotlinx/serialization/json/JsonPrimitive;", "jsonObject", "Lkotlinx/serialization/json/JsonObject;", "getJsonObject", "(Lkotlinx/serialization/json/JsonElement;)Lkotlinx/serialization/json/JsonObject;", "jsonArray", "Lkotlinx/serialization/json/JsonArray;", "getJsonArray", "(Lkotlinx/serialization/json/JsonElement;)Lkotlinx/serialization/json/JsonArray;", "jsonNull", "getJsonNull", "(Lkotlinx/serialization/json/JsonElement;)Lkotlinx/serialization/json/JsonNull;", "int", b.f42142b, "getInt", "(Lkotlinx/serialization/json/JsonPrimitive;)I", "intOrNull", "getIntOrNull", "(Lkotlinx/serialization/json/JsonPrimitive;)Ljava/lang/Integer;", "long", b.f42142b, "getLong", "(Lkotlinx/serialization/json/JsonPrimitive;)J", "longOrNull", "getLongOrNull", "(Lkotlinx/serialization/json/JsonPrimitive;)Ljava/lang/Long;", "double", b.f42142b, "getDouble", "(Lkotlinx/serialization/json/JsonPrimitive;)D", "doubleOrNull", "getDoubleOrNull", "(Lkotlinx/serialization/json/JsonPrimitive;)Ljava/lang/Double;", "float", b.f42142b, "getFloat", "(Lkotlinx/serialization/json/JsonPrimitive;)F", "floatOrNull", "getFloatOrNull", "(Lkotlinx/serialization/json/JsonPrimitive;)Ljava/lang/Float;", "boolean", "getBoolean", "(Lkotlinx/serialization/json/JsonPrimitive;)Z", "booleanOrNull", "getBooleanOrNull", "(Lkotlinx/serialization/json/JsonPrimitive;)Ljava/lang/Boolean;", "contentOrNull", "getContentOrNull", "(Lkotlinx/serialization/json/JsonPrimitive;)Ljava/lang/String;", "error", "element", "exceptionToNull", "T", InneractiveMediationDefs.GENDER_FEMALE, "Lkotlin/Function0;", "(Lkotlin/jvm/functions/Function0;)Ljava/lang/Object;", "exceptionToNumberFormatException", "unexpectedJson", DatabaseConstants.KEY_FIELD, "expected", "parseLongImpl", "kotlinx-serialization-json"}, k = 2, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes.dex */
public final class JsonElementKt {

    @NotNull
    private static final SerialDescriptor jsonUnquotedLiteralDescriptor = InlineClassDescriptorKt.InlinePrimitiveDescriptor("kotlinx.serialization.json.JsonUnquotedLiteral", BuiltinSerializersKt.serializer(StringCompanionObject.f71868a));

    @NotNull
    public static final JsonPrimitive JsonPrimitive(@Nullable Boolean bool) {
        if (bool == null) {
            return JsonNull.INSTANCE;
        }
        return new JsonLiteral(bool, false, null, 4, null);
    }

    @ExperimentalSerializationApi
    @NotNull
    /* renamed from: JsonPrimitive-7apg3OU, reason: not valid java name */
    public static final JsonPrimitive m406JsonPrimitive7apg3OU(byte b11) {
        long j11 = b11 & 255;
        ULong.Companion companion = ULong.f71699b;
        return m407JsonPrimitiveVKZWuLQ(j11);
    }

    @ExperimentalSerializationApi
    @SuppressAnimalSniffer
    @NotNull
    /* renamed from: JsonPrimitive-VKZWuLQ, reason: not valid java name */
    public static final JsonPrimitive m407JsonPrimitiveVKZWuLQ(long j11) {
        return JsonUnquotedLiteral(Long.toUnsignedString(j11));
    }

    @ExperimentalSerializationApi
    @NotNull
    /* renamed from: JsonPrimitive-WZ4Q5Ns, reason: not valid java name */
    public static final JsonPrimitive m408JsonPrimitiveWZ4Q5Ns(int i5) {
        long j11 = i5 & 4294967295L;
        ULong.Companion companion = ULong.f71699b;
        return m407JsonPrimitiveVKZWuLQ(j11);
    }

    @ExperimentalSerializationApi
    @NotNull
    /* renamed from: JsonPrimitive-xj2QHRw, reason: not valid java name */
    public static final JsonPrimitive m409JsonPrimitivexj2QHRw(short s11) {
        long j11 = s11 & 65535;
        ULong.Companion companion = ULong.f71699b;
        return m407JsonPrimitiveVKZWuLQ(j11);
    }

    @ExperimentalSerializationApi
    @NotNull
    public static final JsonPrimitive JsonUnquotedLiteral(@Nullable String str) {
        if (str == null) {
            return JsonNull.INSTANCE;
        }
        if (str.equals(JsonNull.INSTANCE.getContent())) {
            throw new JsonEncodingException("Creating a literal unquoted value of 'null' is forbidden. If you want to create JSON null literal, use JsonNull object, otherwise, use JsonPrimitive");
        }
        return new JsonLiteral(str, false, jsonUnquotedLiteralDescriptor);
    }

    private static final Void error(JsonElement jsonElement, String str) {
        throw new IllegalArgumentException("Element " + Reflection.f71864a.getOrCreateKotlinClass(jsonElement.getClass()) + " is not a " + str);
    }

    private static final <T> T exceptionToNull(Function0<? extends T> function0) {
        try {
            return (T) function0.invoke();
        } catch (JsonDecodingException unused) {
            return null;
        }
    }

    private static final <T> T exceptionToNumberFormatException(Function0<? extends T> function0) {
        try {
            return (T) function0.invoke();
        } catch (JsonDecodingException e3) {
            throw new NumberFormatException(e3.getMessage());
        }
    }

    public static final boolean getBoolean(@NotNull JsonPrimitive jsonPrimitive) {
        Intrinsics.g(jsonPrimitive, "<this>");
        Boolean booleanStrictOrNull = StringOpsKt.toBooleanStrictOrNull(jsonPrimitive.getContent());
        if (booleanStrictOrNull != null) {
            return booleanStrictOrNull.booleanValue();
        }
        throw new IllegalStateException(jsonPrimitive + " does not represent a Boolean");
    }

    @Nullable
    public static final Boolean getBooleanOrNull(@NotNull JsonPrimitive jsonPrimitive) {
        Intrinsics.g(jsonPrimitive, "<this>");
        return StringOpsKt.toBooleanStrictOrNull(jsonPrimitive.getContent());
    }

    @Nullable
    public static final String getContentOrNull(@NotNull JsonPrimitive jsonPrimitive) {
        Intrinsics.g(jsonPrimitive, "<this>");
        if (jsonPrimitive instanceof JsonNull) {
            return null;
        }
        return jsonPrimitive.getContent();
    }

    public static final double getDouble(@NotNull JsonPrimitive jsonPrimitive) {
        Intrinsics.g(jsonPrimitive, "<this>");
        return Double.parseDouble(jsonPrimitive.getContent());
    }

    @Nullable
    public static final Double getDoubleOrNull(@NotNull JsonPrimitive jsonPrimitive) {
        Intrinsics.g(jsonPrimitive, "<this>");
        return i.r0(jsonPrimitive.getContent());
    }

    public static final float getFloat(@NotNull JsonPrimitive jsonPrimitive) {
        Intrinsics.g(jsonPrimitive, "<this>");
        return Float.parseFloat(jsonPrimitive.getContent());
    }

    @Nullable
    public static final Float getFloatOrNull(@NotNull JsonPrimitive jsonPrimitive) {
        Intrinsics.g(jsonPrimitive, "<this>");
        return i.s0(jsonPrimitive.getContent());
    }

    public static final int getInt(@NotNull JsonPrimitive jsonPrimitive) {
        Intrinsics.g(jsonPrimitive, "<this>");
        try {
            long longImpl = parseLongImpl(jsonPrimitive);
            if (-2147483648L <= longImpl && longImpl <= 2147483647L) {
                return (int) longImpl;
            }
            throw new NumberFormatException(jsonPrimitive.getContent() + " is not an Int");
        } catch (JsonDecodingException e3) {
            throw new NumberFormatException(e3.getMessage());
        }
    }

    @Nullable
    public static final Integer getIntOrNull(@NotNull JsonPrimitive jsonPrimitive) {
        Long lValueOf;
        Intrinsics.g(jsonPrimitive, "<this>");
        try {
            lValueOf = Long.valueOf(parseLongImpl(jsonPrimitive));
        } catch (JsonDecodingException unused) {
            lValueOf = null;
        }
        if (lValueOf != null) {
            long jLongValue = lValueOf.longValue();
            if (-2147483648L <= jLongValue && jLongValue <= 2147483647L) {
                return Integer.valueOf((int) jLongValue);
            }
        }
        return null;
    }

    @NotNull
    public static final JsonArray getJsonArray(@NotNull JsonElement jsonElement) {
        Intrinsics.g(jsonElement, "<this>");
        JsonArray jsonArray = jsonElement instanceof JsonArray ? (JsonArray) jsonElement : null;
        if (jsonArray != null) {
            return jsonArray;
        }
        error(jsonElement, "JsonArray");
        throw new KotlinNothingValueException();
    }

    @NotNull
    public static final JsonNull getJsonNull(@NotNull JsonElement jsonElement) {
        Intrinsics.g(jsonElement, "<this>");
        JsonNull jsonNull = jsonElement instanceof JsonNull ? (JsonNull) jsonElement : null;
        if (jsonNull != null) {
            return jsonNull;
        }
        error(jsonElement, "JsonNull");
        throw new KotlinNothingValueException();
    }

    @NotNull
    public static final JsonObject getJsonObject(@NotNull JsonElement jsonElement) {
        Intrinsics.g(jsonElement, "<this>");
        JsonObject jsonObject = jsonElement instanceof JsonObject ? (JsonObject) jsonElement : null;
        if (jsonObject != null) {
            return jsonObject;
        }
        error(jsonElement, "JsonObject");
        throw new KotlinNothingValueException();
    }

    @NotNull
    public static final JsonPrimitive getJsonPrimitive(@NotNull JsonElement jsonElement) {
        Intrinsics.g(jsonElement, "<this>");
        JsonPrimitive jsonPrimitive = jsonElement instanceof JsonPrimitive ? (JsonPrimitive) jsonElement : null;
        if (jsonPrimitive != null) {
            return jsonPrimitive;
        }
        error(jsonElement, "JsonPrimitive");
        throw new KotlinNothingValueException();
    }

    @NotNull
    public static final SerialDescriptor getJsonUnquotedLiteralDescriptor() {
        return jsonUnquotedLiteralDescriptor;
    }

    public static final long getLong(@NotNull JsonPrimitive jsonPrimitive) {
        Intrinsics.g(jsonPrimitive, "<this>");
        try {
            return parseLongImpl(jsonPrimitive);
        } catch (JsonDecodingException e3) {
            throw new NumberFormatException(e3.getMessage());
        }
    }

    @Nullable
    public static final Long getLongOrNull(@NotNull JsonPrimitive jsonPrimitive) {
        Intrinsics.g(jsonPrimitive, "<this>");
        try {
            return Long.valueOf(parseLongImpl(jsonPrimitive));
        } catch (JsonDecodingException unused) {
            return null;
        }
    }

    public static final long parseLongImpl(@NotNull JsonPrimitive jsonPrimitive) {
        Intrinsics.g(jsonPrimitive, "<this>");
        return new StringJsonLexer(jsonPrimitive.getContent()).consumeNumericLiteralFully();
    }

    @PublishedApi
    @NotNull
    public static final Void unexpectedJson(@NotNull String key, @NotNull String expected) {
        Intrinsics.g(key, "key");
        Intrinsics.g(expected, "expected");
        throw new IllegalArgumentException(c0.m("Element ", key, " is not a ", expected));
    }

    @NotNull
    public static final JsonPrimitive JsonPrimitive(@Nullable Number number) {
        if (number == null) {
            return JsonNull.INSTANCE;
        }
        return new JsonLiteral(number, false, null, 4, null);
    }

    @NotNull
    public static final JsonPrimitive JsonPrimitive(@Nullable String str) {
        if (str == null) {
            return JsonNull.INSTANCE;
        }
        return new JsonLiteral(str, true, null, 4, null);
    }

    @ExperimentalSerializationApi
    @NotNull
    public static final JsonNull JsonPrimitive(@Nullable Void r02) {
        return JsonNull.INSTANCE;
    }
}
