package kotlinx.serialization.json.internal;

import a2.c;
import a80.m;
import com.amplitude.android.migration.DatabaseConstants;
import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.KotlinNothingValueException;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.descriptors.SerialDescriptor;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000<\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\r\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0004\n\u0002\b\u0002\n\u0002\u0010\u0001\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0005\u001a\u0018\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H\u0000\u001a \u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007H\u0000\u001a\u0018\u0010\b\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000b2\u0006\u0010\f\u001a\u00020\u0005H\u0000\u001a\u0014\u0010\r\u001a\u00020\u000e*\u00020\u000f2\u0006\u0010\u0010\u001a\u00020\u000bH\u0000\u001a\u0016\u0010\u0011\u001a\u00020\u000e*\u00020\u000f2\b\b\u0002\u0010\u0012\u001a\u00020\u0005H\u0000\u001a\u0010\u0010\u0013\u001a\u00020\t2\u0006\u0010\u0014\u001a\u00020\u0015H\u0000\u001a \u0010\b\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000b2\u0006\u0010\u0016\u001a\u00020\u00052\u0006\u0010\f\u001a\u00020\u0005H\u0000\u001a \u0010\u0017\u001a\u00020\u00012\u0006\u0010\n\u001a\u00020\u000b2\u0006\u0010\u0016\u001a\u00020\u00052\u0006\u0010\f\u001a\u00020\u0005H\u0000\u001a \u0010\u0018\u001a\u00020\u00052\u0006\u0010\n\u001a\u00020\u000b2\u0006\u0010\u0016\u001a\u00020\u00052\u0006\u0010\f\u001a\u00020\u0005H\u0002\u001a\u0016\u0010\u0019\u001a\u00020\u0007*\u00020\u00072\b\b\u0002\u0010\u0002\u001a\u00020\u0003H\u0000¨\u0006\u001a"}, d2 = {"JsonDecodingException", "Lkotlinx/serialization/json/internal/JsonDecodingException;", "offset", b.f42142b, PglCryptUtils.KEY_MESSAGE, b.f42142b, "input", b.f42142b, "InvalidFloatingPointEncoded", "Lkotlinx/serialization/json/internal/JsonEncodingException;", "value", b.f42142b, "output", "throwInvalidFloatingPointDecoded", b.f42142b, "Lkotlinx/serialization/json/internal/AbstractJsonLexer;", "result", "invalidTrailingComma", "entity", "InvalidKeyKindException", "keyDescriptor", "Lkotlinx/serialization/descriptors/SerialDescriptor;", DatabaseConstants.KEY_FIELD, "InvalidFloatingPointDecoded", "unexpectedFpErrorMessage", "minify", "kotlinx-serialization-json"}, k = 2, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public final class JsonExceptionsKt {
    @NotNull
    public static final JsonDecodingException InvalidFloatingPointDecoded(@NotNull Number value, @NotNull String key, @NotNull String output) {
        Intrinsics.g(value, "value");
        Intrinsics.g(key, "key");
        Intrinsics.g(output, "output");
        return JsonDecodingException(-1, unexpectedFpErrorMessage(value, key, output));
    }

    @NotNull
    public static final JsonEncodingException InvalidFloatingPointEncoded(@NotNull Number value, @NotNull String output) {
        Intrinsics.g(value, "value");
        Intrinsics.g(output, "output");
        return new JsonEncodingException("Unexpected special floating-point value " + value + ". By default, non-finite floating point values are prohibited because they do not conform JSON specification. It is possible to deserialize them using 'JsonBuilder.allowSpecialFloatingPointValues = true'\nCurrent output: " + ((Object) minify$default(output, 0, 1, null)));
    }

    @NotNull
    public static final JsonEncodingException InvalidKeyKindException(@NotNull SerialDescriptor keyDescriptor) {
        Intrinsics.g(keyDescriptor, "keyDescriptor");
        return new JsonEncodingException("Value of type '" + keyDescriptor.getSerialName() + "' can't be used in JSON as a key in the map. It should have either primitive or enum kind, but its kind is '" + keyDescriptor.getKind() + "'.\nUse 'allowStructuredMapKeys = true' in 'Json {}' builder to convert such maps to [key1, value1, key2, value2,...] arrays.");
    }

    @NotNull
    public static final JsonDecodingException JsonDecodingException(int i5, @NotNull String message) {
        Intrinsics.g(message, "message");
        if (i5 >= 0) {
            message = m.f(i5, "Unexpected JSON token at offset ", ": ", message);
        }
        return new JsonDecodingException(message);
    }

    @NotNull
    public static final Void invalidTrailingComma(@NotNull AbstractJsonLexer abstractJsonLexer, @NotNull String entity) {
        Intrinsics.g(abstractJsonLexer, "<this>");
        Intrinsics.g(entity, "entity");
        abstractJsonLexer.fail("Trailing comma before the end of JSON ".concat(entity), abstractJsonLexer.currentPosition - 1, "Trailing commas are non-complaint JSON and not allowed by default. Use 'allowTrailingComma = true' in 'Json {}' builder to support them.");
        throw new KotlinNothingValueException();
    }

    public static /* synthetic */ Void invalidTrailingComma$default(AbstractJsonLexer abstractJsonLexer, String str, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = "object";
        }
        return invalidTrailingComma(abstractJsonLexer, str);
    }

    @NotNull
    public static final CharSequence minify(@NotNull CharSequence charSequence, int i5) {
        Intrinsics.g(charSequence, "<this>");
        if (charSequence.length() >= 200) {
            if (i5 != -1) {
                int i11 = i5 - 30;
                int i12 = i5 + 30;
                String str = i11 <= 0 ? b.f42142b : ".....";
                String str2 = i12 >= charSequence.length() ? b.f42142b : ".....";
                StringBuilder sbQ = c.q(str);
                if (i11 < 0) {
                    i11 = 0;
                }
                int length = charSequence.length();
                if (i12 > length) {
                    i12 = length;
                }
                sbQ.append(charSequence.subSequence(i11, i12).toString());
                sbQ.append(str2);
                return sbQ.toString();
            }
            int length2 = charSequence.length() - 60;
            if (length2 > 0) {
                return "....." + charSequence.subSequence(length2, charSequence.length()).toString();
            }
        }
        return charSequence;
    }

    public static /* synthetic */ CharSequence minify$default(CharSequence charSequence, int i5, int i11, Object obj) {
        if ((i11 & 1) != 0) {
            i5 = -1;
        }
        return minify(charSequence, i5);
    }

    @NotNull
    public static final Void throwInvalidFloatingPointDecoded(@NotNull AbstractJsonLexer abstractJsonLexer, @NotNull Number result) {
        Intrinsics.g(abstractJsonLexer, "<this>");
        Intrinsics.g(result, "result");
        AbstractJsonLexer.fail$default(abstractJsonLexer, "Unexpected special floating-point value " + result + ". By default, non-finite floating point values are prohibited because they do not conform JSON specification", 0, AbstractJsonLexerKt.specialFlowingValuesHint, 2, null);
        throw new KotlinNothingValueException();
    }

    private static final String unexpectedFpErrorMessage(Number number, String str, String str2) {
        return "Unexpected special floating-point value " + number + " with key " + str + ". By default, non-finite floating point values are prohibited because they do not conform JSON specification. It is possible to deserialize them using 'JsonBuilder.allowSpecialFloatingPointValues = true'\nCurrent output: " + ((Object) minify$default(str2, 0, 1, null));
    }

    @NotNull
    public static final JsonEncodingException InvalidFloatingPointEncoded(@NotNull Number value, @NotNull String key, @NotNull String output) {
        Intrinsics.g(value, "value");
        Intrinsics.g(key, "key");
        Intrinsics.g(output, "output");
        return new JsonEncodingException(unexpectedFpErrorMessage(value, key, output));
    }

    @NotNull
    public static final JsonDecodingException JsonDecodingException(int i5, @NotNull String message, @NotNull CharSequence input) {
        Intrinsics.g(message, "message");
        Intrinsics.g(input, "input");
        return JsonDecodingException(i5, message + "\nJSON input: " + ((Object) minify(input, i5)));
    }
}
