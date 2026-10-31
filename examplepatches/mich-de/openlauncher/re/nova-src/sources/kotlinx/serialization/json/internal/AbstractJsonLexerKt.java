package kotlinx.serialization.json.internal;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\"\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0006\n\u0002\u0010\f\n\u0002\b\n\n\u0002\u0010\u0005\n\u0002\b\f\n\u0002\u0010\b\n\u0002\b\b\u001a\u0010\u0010#\u001a\u00020\u00012\u0006\u0010$\u001a\u00020\u0013H\u0000\u001a\u0010\u0010%\u001a\u00020\u00132\u0006\u0010&\u001a\u00020\bH\u0000\u001a\u0010\u0010'\u001a\u00020\b2\u0006\u0010&\u001a\u00020 H\u0000\"\u000e\u0010\u0000\u001a\u00020\u0001X\u0080T¢\u0006\u0002\n\u0000\"\u000e\u0010\u0002\u001a\u00020\u0001X\u0080T¢\u0006\u0002\n\u0000\"\u000e\u0010\u0003\u001a\u00020\u0001X\u0080T¢\u0006\u0002\n\u0000\"\u000e\u0010\u0004\u001a\u00020\u0001X\u0080T¢\u0006\u0002\n\u0000\"\u000e\u0010\u0005\u001a\u00020\u0001X\u0080T¢\u0006\u0002\n\u0000\"\u000e\u0010\u0006\u001a\u00020\u0001X\u0080T¢\u0006\u0002\n\u0000\"\u000e\u0010\u0007\u001a\u00020\bX\u0080T¢\u0006\u0002\n\u0000\"\u000e\u0010\t\u001a\u00020\bX\u0080T¢\u0006\u0002\n\u0000\"\u000e\u0010\n\u001a\u00020\bX\u0080T¢\u0006\u0002\n\u0000\"\u000e\u0010\u000b\u001a\u00020\bX\u0080T¢\u0006\u0002\n\u0000\"\u000e\u0010\f\u001a\u00020\bX\u0080T¢\u0006\u0002\n\u0000\"\u000e\u0010\r\u001a\u00020\bX\u0080T¢\u0006\u0002\n\u0000\"\u000e\u0010\u000e\u001a\u00020\bX\u0080T¢\u0006\u0002\n\u0000\"\u000e\u0010\u000f\u001a\u00020\bX\u0080T¢\u0006\u0002\n\u0000\"\u000e\u0010\u0010\u001a\u00020\bX\u0080T¢\u0006\u0002\n\u0000\"\u000e\u0010\u0011\u001a\u00020\bX\u0080T¢\u0006\u0002\n\u0000\"\u000e\u0010\u0012\u001a\u00020\u0013X\u0080T¢\u0006\u0002\n\u0000\"\u000e\u0010\u0014\u001a\u00020\u0013X\u0080T¢\u0006\u0002\n\u0000\"\u000e\u0010\u0015\u001a\u00020\u0013X\u0080T¢\u0006\u0002\n\u0000\"\u000e\u0010\u0016\u001a\u00020\u0013X\u0080T¢\u0006\u0002\n\u0000\"\u000e\u0010\u0017\u001a\u00020\u0013X\u0080T¢\u0006\u0002\n\u0000\"\u000e\u0010\u0018\u001a\u00020\u0013X\u0080T¢\u0006\u0002\n\u0000\"\u000e\u0010\u0019\u001a\u00020\u0013X\u0080T¢\u0006\u0002\n\u0000\"\u000e\u0010\u001a\u001a\u00020\u0013X\u0080T¢\u0006\u0002\n\u0000\"\u000e\u0010\u001b\u001a\u00020\u0013X\u0080T¢\u0006\u0002\n\u0000\"\u000e\u0010\u001c\u001a\u00020\u0013X\u0080T¢\u0006\u0002\n\u0000\"\u000e\u0010\u001d\u001a\u00020\u0013X\u0080T¢\u0006\u0002\n\u0000\"\u000e\u0010\u001e\u001a\u00020\u0013X\u0080T¢\u0006\u0002\n\u0000\"\u000e\u0010\u001f\u001a\u00020 X\u0082T¢\u0006\u0002\n\u0000\"\u000e\u0010!\u001a\u00020 X\u0082T¢\u0006\u0002\n\u0000\"\u000e\u0010\"\u001a\u00020 X\u0080T¢\u0006\u0002\n\u0000¨\u0006("}, d2 = {"lenientHint", b.f42142b, "coerceInputValuesHint", "specialFlowingValuesHint", "ignoreUnknownKeysHint", "allowStructuredMapKeysHint", "NULL", "COMMA", b.f42142b, "COLON", "BEGIN_OBJ", "END_OBJ", "BEGIN_LIST", "END_LIST", "STRING", "STRING_ESC", "INVALID", "UNICODE_ESC", "TC_OTHER", b.f42142b, "TC_STRING", "TC_STRING_ESC", "TC_WHITESPACE", "TC_COMMA", "TC_COLON", "TC_BEGIN_OBJ", "TC_END_OBJ", "TC_BEGIN_LIST", "TC_END_LIST", "TC_EOF", "TC_INVALID", "CTC_MAX", b.f42142b, "ESC2C_MAX", "asciiCaseMask", "tokenDescription", "token", "charToTokenClass", "c", "escapeToChar", "kotlinx-serialization-json"}, k = 2, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public final class AbstractJsonLexerKt {
    public static final char BEGIN_LIST = '[';
    public static final char BEGIN_OBJ = '{';
    public static final char COLON = ':';
    public static final char COMMA = ',';
    private static final int CTC_MAX = 126;
    public static final char END_LIST = ']';
    public static final char END_OBJ = '}';
    private static final int ESC2C_MAX = 117;
    public static final char INVALID = 0;

    @NotNull
    public static final String NULL = "null";
    public static final char STRING = '\"';
    public static final char STRING_ESC = '\\';
    public static final byte TC_BEGIN_LIST = 8;
    public static final byte TC_BEGIN_OBJ = 6;
    public static final byte TC_COLON = 5;
    public static final byte TC_COMMA = 4;
    public static final byte TC_END_LIST = 9;
    public static final byte TC_END_OBJ = 7;
    public static final byte TC_EOF = 10;
    public static final byte TC_INVALID = 127;
    public static final byte TC_OTHER = 0;
    public static final byte TC_STRING = 1;
    public static final byte TC_STRING_ESC = 2;
    public static final byte TC_WHITESPACE = 3;
    public static final char UNICODE_ESC = 'u';

    @NotNull
    public static final String allowStructuredMapKeysHint = "Use 'allowStructuredMapKeys = true' in 'Json {}' builder to convert such maps to [key1, value1, key2, value2,...] arrays.";
    public static final int asciiCaseMask = 32;

    @NotNull
    public static final String coerceInputValuesHint = "Use 'coerceInputValues = true' in 'Json {}' builder to coerce nulls if property has a default value.";

    @NotNull
    public static final String ignoreUnknownKeysHint = "Use 'ignoreUnknownKeys = true' in 'Json {}' builder or '@JsonIgnoreUnknownKeys' annotation to ignore unknown keys.";

    @NotNull
    public static final String lenientHint = "Use 'isLenient = true' in 'Json {}' builder to accept non-compliant JSON.";

    @NotNull
    public static final String specialFlowingValuesHint = "It is possible to deserialize them using 'JsonBuilder.allowSpecialFloatingPointValues = true'";

    public static final byte charToTokenClass(char c11) {
        if (c11 < '~') {
            return CharMappings.CHAR_TO_TOKEN[c11];
        }
        return (byte) 0;
    }

    public static final char escapeToChar(int i5) {
        if (i5 < 117) {
            return CharMappings.ESCAPE_2_CHAR[i5];
        }
        return (char) 0;
    }

    @NotNull
    public static final String tokenDescription(byte b11) {
        return b11 == 1 ? "quotation mark '\"'" : b11 == 2 ? "string escape sequence '\\'" : b11 == 4 ? "comma ','" : b11 == 5 ? "colon ':'" : b11 == 6 ? "start of the object '{'" : b11 == 7 ? "end of the object '}'" : b11 == 8 ? "start of the array '['" : b11 == 9 ? "end of the array ']'" : b11 == 10 ? "end of the input" : b11 == 127 ? "invalid token" : "valid token";
    }
}
