package kotlinx.serialization.json.internal;

import a2.c;
import b.c0;
import b70.d;
import b70.g;
import com.amplitude.android.migration.DatabaseConstants;
import com.amplitude.core.events.Plan;
import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.google.android.gms.internal.measurement.k2;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.ArrayList;
import kotlin.KotlinNothingValueException;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Unit;
import kotlin.jvm.JvmField;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import r70.k;

@Metadata(d1 = {"\u0000x\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\r\n\u0002\b\u0003\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0010\f\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0005\n\u0002\u0010\u0005\n\u0002\b\u0005\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u0001\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0014\n\u0002\u0018\u0002\n\u0002\b\u0014\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0010\t\n\u0002\b\u000b\b \u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003J\r\u0010\f\u001a\u00020\r*\u00020\u000eH\u0084\bJ\b\u0010\u000f\u001a\u00020\u0010H\u0016J\u0006\u0010\u0011\u001a\u00020\rJ\u0010\u0010\u0012\u001a\u00020\t2\u0006\u0010\u0013\u001a\u00020\tH&J\b\u0010\u0014\u001a\u00020\rH&J\b\u0010\u0015\u001a\u00020\u0016H&J\u0006\u0010\u0017\u001a\u00020\rJ\u0010\u0010\u0018\u001a\u00020\r2\u0006\u0010\u0019\u001a\u00020\u000eH\u0004J\u0006\u0010\u001a\u001a\u00020\u0010J\u000e\u0010\u0015\u001a\u00020\u00162\u0006\u0010$\u001a\u00020\u0016J\u0010\u0010\u0015\u001a\u00020\u00102\u0006\u0010$\u001a\u00020\u000eH&J\u0010\u0010%\u001a\u00020\u00102\u0006\u0010$\u001a\u00020\u000eH\u0004J]\u0010&\u001a\u00020'2\u0006\u0010(\u001a\u00020\u00162\b\b\u0002\u0010)\u001a\u00020\r28\b\u0002\u0010*\u001a2\u0012\u0013\u0012\u00110\u001c¢\u0006\f\b,\u0012\b\b-\u0012\u0004\b\b($\u0012\u0013\u0012\u00110\u001c¢\u0006\f\b,\u0012\b\b-\u0012\u0004\b\b(\u0004\u0012\u0004\u0012\u00020\u001c0+H\u0080\bø\u0001\u0000¢\u0006\u0002\b.J\b\u0010/\u001a\u00020\u0016H\u0016J\u0010\u00100\u001a\u00020\r2\b\b\u0002\u00101\u001a\u00020\rJ\b\u00102\u001a\u00020\tH&J\u001a\u00103\u001a\u0004\u0018\u00010\u001c2\u0006\u00104\u001a\u00020\u001c2\u0006\u00105\u001a\u00020\rH&J\u0010\u00106\u001a\u0004\u0018\u00010\u001c2\u0006\u00105\u001a\u00020\rJ\u0006\u00107\u001a\u00020\u0010J\u0018\u00108\u001a\u00020\t2\u0006\u00109\u001a\u00020\u000e2\u0006\u0010:\u001a\u00020\tH\u0016J\u0018\u0010;\u001a\u00020\u001c2\u0006\u0010:\u001a\u00020\t2\u0006\u0010<\u001a\u00020\tH\u0016J\b\u0010=\u001a\u00020\u001cH&J\u0018\u0010>\u001a\u00020\r2\u0006\u00105\u001a\u00020\r2\u0006\u00109\u001a\u00020\u000eH\u0002J3\u0010?\u001a\u00020\u00102\u0006\u00105\u001a\u00020\r2!\u0010@\u001a\u001d\u0012\u0013\u0012\u00110\u001c¢\u0006\f\b,\u0012\b\b-\u0012\u0004\b\b(B\u0012\u0004\u0012\u00020\u00100AH\u0016JC\u0010C\u001a\u00020\u00102\u0006\u0010D\u001a\u00020\t2\u0006\u0010E\u001a\u00020\t2\u0006\u0010F\u001a\u00020\r2!\u0010@\u001a\u001d\u0012\u0013\u0012\u00110\u001c¢\u0006\f\b,\u0012\b\b-\u0012\u0004\b\b(B\u0012\u0004\u0012\u00020\u00100AH\u0002J\u0006\u0010G\u001a\u00020\u001cJ \u0010G\u001a\u00020\u001c2\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010H\u001a\u00020\t2\u0006\u0010I\u001a\u00020\tH\u0005J\u0018\u0010J\u001a\u00020\t2\u0006\u0010K\u001a\u00020\t2\u0006\u0010I\u001a\u00020\tH\u0002J\u0018\u0010L\u001a\u00020\u001c2\u0006\u0010K\u001a\u00020\t2\u0006\u0010\b\u001a\u00020\tH\u0002J\b\u0010M\u001a\u00020\u001cH\u0002J\u0006\u0010N\u001a\u00020\u001cJ\b\u0010O\u001a\u00020\rH\u0002J\u0006\u0010P\u001a\u00020\u001cJ\u0018\u0010Q\u001a\u00020\u00102\u0006\u0010D\u001a\u00020\t2\u0006\u0010E\u001a\u00020\tH\u0014J\u0010\u0010R\u001a\u00020\t2\u0006\u0010H\u001a\u00020\tH\u0002J\u0018\u0010S\u001a\u00020\t2\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010:\u001a\u00020\tH\u0002J1\u0010T\u001a\u00020\u00102\u0006\u0010U\u001a\u00020\r2\b\b\u0002\u0010\u0013\u001a\u00020\t2\f\u0010*\u001a\b\u0012\u0004\u0012\u00020\u001c0VH\u0080\bø\u0001\u0000¢\u0006\u0002\bWJ\u0018\u0010X\u001a\u00020\t2\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\tH\u0002J\u000e\u0010Y\u001a\u00020\u00102\u0006\u0010Z\u001a\u00020\rJ\b\u0010[\u001a\u00020\u001cH\u0016J\u000e\u0010\\\u001a\u00020\u00102\u0006\u0010]\u001a\u00020\u001cJ\"\u0010&\u001a\u00020'2\u0006\u0010*\u001a\u00020\u001c2\b\b\u0002\u0010\u0013\u001a\u00020\t2\b\b\u0002\u0010^\u001a\u00020\u001cJ\u0006\u0010_\u001a\u00020`J\u0006\u0010a\u001a\u00020`J\u0006\u0010b\u001a\u00020\rJ\u0006\u0010c\u001a\u00020\rJ\u0010\u0010b\u001a\u00020\r2\u0006\u0010d\u001a\u00020\tH\u0003J\u0018\u0010e\u001a\u00020\u00102\u0006\u0010f\u001a\u00020\u001c2\u0006\u0010I\u001a\u00020\tH\u0002J\"\u0010g\u001a\u0002Hh\"\u0004\b\u0000\u0010h2\f\u0010i\u001a\b\u0012\u0004\u0012\u0002Hh0VH\u0082\b¢\u0006\u0002\u0010jR\u0012\u0010\u0004\u001a\u00020\u0005X¤\u0004¢\u0006\u0006\u001a\u0004\b\u0006\u0010\u0007R\u0012\u0010\b\u001a\u00020\t8\u0000@\u0000X\u0081\u000e¢\u0006\u0002\n\u0000R\u0010\u0010\n\u001a\u00020\u000b8\u0006X\u0087\u0004¢\u0006\u0002\n\u0000R\u0010\u0010\u001b\u001a\u0004\u0018\u00010\u001cX\u0082\u000e¢\u0006\u0002\n\u0000R\u001e\u0010\u001d\u001a\u00060\u001ej\u0002`\u001fX\u0084\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b \u0010!\"\u0004\b\"\u0010#\u0082\u0002\u0007\n\u0005\b\u009920\u0001¨\u0006k"}, d2 = {"Lkotlinx/serialization/json/internal/AbstractJsonLexer;", b.f42142b, "<init>", "()V", Plan.AMP_PLAN_SOURCE, b.f42142b, "getSource", "()Ljava/lang/CharSequence;", "currentPosition", b.f42142b, "path", "Lkotlinx/serialization/json/internal/JsonPath;", "isWs", b.f42142b, b.f42142b, "ensureHaveChars", b.f42142b, "isNotEof", "prefetchOrEof", "position", "canConsumeValue", "consumeNextToken", b.f42142b, "tryConsumeComma", "isValidValueStart", "c", "expectEof", "peekedString", b.f42142b, "escapedString", "Ljava/lang/StringBuilder;", "Lkotlin/text/StringBuilder;", "getEscapedString", "()Ljava/lang/StringBuilder;", "setEscapedString", "(Ljava/lang/StringBuilder;)V", "expected", "unexpectedToken", "fail", b.f42142b, "expectedToken", "wasConsumed", PglCryptUtils.KEY_MESSAGE, "Lkotlin/Function2;", "Lkotlin/ParameterName;", PendingUpgradeStore.KEY_NAME, "fail$kotlinx_serialization_json", "peekNextToken", "tryConsumeNull", "doConsume", "skipWhitespaces", "peekLeadingMatchingValue", "keyToMatch", "isLenient", "peekString", "discardPeeked", "indexOf", "char", "startPos", "substring", "endPos", "consumeKeyString", "insideString", "consumeStringChunked", "consumeChunk", "Lkotlin/Function1;", "stringChunk", "writeRange", "fromIndex", "toIndex", "currentChunkHasEscape", "consumeString", "startPosition", "current", "appendEscape", "lastPosition", "decodedString", "takePeeked", "consumeStringLenientNotNull", "wasUnquotedString", "consumeStringLenient", "appendRange", "appendEsc", "appendHex", "require", "condition", "Lkotlin/Function0;", "require$kotlinx_serialization_json", "fromHexChar", "skipElement", "allowLenientStrings", "toString", "failOnUnknownKey", DatabaseConstants.KEY_FIELD, "hint", "consumeNumericLiteral", b.f42142b, "consumeNumericLiteralFully", "consumeBoolean", "consumeBooleanLenient", "start", "consumeBooleanLiteral", "literalSuffix", "withPositionRollback", "T", "action", "(Lkotlin/jvm/functions/Function0;)Ljava/lang/Object;", "kotlinx-serialization-json"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes.dex */
public abstract class AbstractJsonLexer {

    @JvmField
    public int currentPosition;

    @Nullable
    private String peekedString;

    @JvmField
    @NotNull
    public final JsonPath path = new JsonPath();

    @NotNull
    private StringBuilder escapedString = new StringBuilder();

    private final int appendEsc(int startPosition) {
        int iPrefetchOrEof = prefetchOrEof(startPosition);
        if (iPrefetchOrEof == -1) {
            fail$default(this, "Expected escape sequence to continue, got EOF", 0, null, 6, null);
            throw new KotlinNothingValueException();
        }
        int i5 = iPrefetchOrEof + 1;
        char cCharAt = getSource().charAt(iPrefetchOrEof);
        if (cCharAt == 'u') {
            return appendHex(getSource(), i5);
        }
        char cEscapeToChar = AbstractJsonLexerKt.escapeToChar(cCharAt);
        if (cEscapeToChar != 0) {
            this.escapedString.append(cEscapeToChar);
            return i5;
        }
        fail$default(this, "Invalid escaped char '" + cCharAt + '\'', 0, null, 6, null);
        throw new KotlinNothingValueException();
    }

    private final int appendEscape(int lastPosition, int current) {
        appendRange(lastPosition, current);
        return appendEsc(current + 1);
    }

    private final int appendHex(CharSequence source, int startPos) {
        int i5 = startPos + 4;
        if (i5 < source.length()) {
            this.escapedString.append((char) ((fromHexChar(source, startPos) << 12) + (fromHexChar(source, startPos + 1) << 8) + (fromHexChar(source, startPos + 2) << 4) + fromHexChar(source, startPos + 3)));
            return i5;
        }
        this.currentPosition = startPos;
        ensureHaveChars();
        if (this.currentPosition + 4 < source.length()) {
            return appendHex(source, this.currentPosition);
        }
        fail$default(this, "Unexpected EOF during unicode escape", 0, null, 6, null);
        throw new KotlinNothingValueException();
    }

    private final void consumeBooleanLiteral(String literalSuffix, int current) {
        if (getSource().length() - current < literalSuffix.length()) {
            fail$default(this, "Unexpected end of boolean literal", 0, null, 6, null);
            throw new KotlinNothingValueException();
        }
        int length = literalSuffix.length();
        for (int i5 = 0; i5 < length; i5++) {
            if (literalSuffix.charAt(i5) != (getSource().charAt(current + i5) | ' ')) {
                fail$default(this, "Expected valid boolean literal prefix, but had '" + consumeStringLenient() + '\'', 0, null, 6, null);
                throw new KotlinNothingValueException();
            }
        }
        this.currentPosition = literalSuffix.length() + current;
    }

    private static final double consumeNumericLiteral$calculateExponent(long j11, boolean z11) {
        if (!z11) {
            return Math.pow(10.0d, -j11);
        }
        if (z11) {
            return Math.pow(10.0d, j11);
        }
        throw new NoWhenBranchMatchedException();
    }

    private final String decodedString(int lastPosition, int currentPosition) {
        appendRange(lastPosition, currentPosition);
        String string = this.escapedString.toString();
        Intrinsics.f(string, "toString(...)");
        this.escapedString.setLength(0);
        return string;
    }

    public static /* synthetic */ Void fail$default(AbstractJsonLexer abstractJsonLexer, String str, int i5, String str2, int i11, Object obj) {
        if (obj != null) {
            throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: fail");
        }
        if ((i11 & 2) != 0) {
            i5 = abstractJsonLexer.currentPosition;
        }
        if ((i11 & 4) != 0) {
            str2 = b.f42142b;
        }
        return abstractJsonLexer.fail(str, i5, str2);
    }

    public static /* synthetic */ Void fail$kotlinx_serialization_json$default(AbstractJsonLexer abstractJsonLexer, byte b11, boolean z11, Function2 message, int i5, Object obj) {
        if (obj != null) {
            throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: fail");
        }
        if ((i5 & 2) != 0) {
            z11 = true;
        }
        if ((i5 & 4) != 0) {
            message = new Function2<String, String, String>() { // from class: kotlinx.serialization.json.internal.AbstractJsonLexer.fail.1
                @Override // kotlin.jvm.functions.Function2
                public final String invoke(String expected, String source) {
                    Intrinsics.g(expected, "expected");
                    Intrinsics.g(source, "source");
                    return c0.s(new StringBuilder("Expected "), expected, ", but had '", source, "' instead");
                }
            };
        }
        Intrinsics.g(message, "message");
        String str = AbstractJsonLexerKt.tokenDescription(b11);
        int i11 = z11 ? abstractJsonLexer.currentPosition - 1 : abstractJsonLexer.currentPosition;
        fail$default(abstractJsonLexer, (String) message.invoke(str, (abstractJsonLexer.currentPosition == abstractJsonLexer.getSource().length() || i11 < 0) ? "EOF" : String.valueOf(abstractJsonLexer.getSource().charAt(i11))), i11, null, 4, null);
        throw new KotlinNothingValueException();
    }

    private final int fromHexChar(CharSequence source, int currentPosition) {
        char cCharAt = source.charAt(currentPosition);
        if ('0' <= cCharAt && cCharAt < ':') {
            return cCharAt - '0';
        }
        if ('a' <= cCharAt && cCharAt < 'g') {
            return cCharAt - 'W';
        }
        if ('A' <= cCharAt && cCharAt < 'G') {
            return cCharAt - '7';
        }
        fail$default(this, "Invalid toHexChar char '" + cCharAt + "' in unicode escape", 0, null, 6, null);
        throw new KotlinNothingValueException();
    }

    private final boolean insideString(boolean isLenient, char c11) {
        return isLenient ? AbstractJsonLexerKt.charToTokenClass(c11) == 0 : c11 != '\"';
    }

    public static /* synthetic */ void require$kotlinx_serialization_json$default(AbstractJsonLexer abstractJsonLexer, boolean z11, int i5, Function0 message, int i11, Object obj) {
        if (obj != null) {
            throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: require");
        }
        if ((i11 & 2) != 0) {
            i5 = abstractJsonLexer.currentPosition;
        }
        int i12 = i5;
        Intrinsics.g(message, "message");
        if (z11) {
            return;
        }
        fail$default(abstractJsonLexer, (String) message.invoke(), i12, null, 4, null);
        throw new KotlinNothingValueException();
    }

    private final String takePeeked() {
        String str = this.peekedString;
        Intrinsics.d(str);
        this.peekedString = null;
        return str;
    }

    public static /* synthetic */ boolean tryConsumeNull$default(AbstractJsonLexer abstractJsonLexer, boolean z11, int i5, Object obj) {
        if (obj != null) {
            throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: tryConsumeNull");
        }
        if ((i5 & 1) != 0) {
            z11 = true;
        }
        return abstractJsonLexer.tryConsumeNull(z11);
    }

    private final boolean wasUnquotedString() {
        return getSource().charAt(this.currentPosition - 1) != '\"';
    }

    private final <T> T withPositionRollback(Function0<? extends T> action) {
        int i5 = this.currentPosition;
        try {
            return (T) action.invoke();
        } finally {
            this.currentPosition = i5;
        }
    }

    private final void writeRange(int fromIndex, int toIndex, boolean currentChunkHasEscape, Function1<? super String, Unit> consumeChunk) {
        if (currentChunkHasEscape) {
            consumeChunk.invoke(decodedString(fromIndex, toIndex));
        } else {
            consumeChunk.invoke(substring(fromIndex, toIndex));
        }
    }

    public void appendRange(int fromIndex, int toIndex) {
        this.escapedString.append(getSource(), fromIndex, toIndex);
    }

    public abstract boolean canConsumeValue();

    public final boolean consumeBoolean() {
        return consumeBoolean(skipWhitespaces());
    }

    public final boolean consumeBooleanLenient() {
        boolean z11;
        int iSkipWhitespaces = skipWhitespaces();
        if (iSkipWhitespaces == getSource().length()) {
            fail$default(this, "EOF", 0, null, 6, null);
            throw new KotlinNothingValueException();
        }
        if (getSource().charAt(iSkipWhitespaces) == '\"') {
            iSkipWhitespaces++;
            z11 = true;
        } else {
            z11 = false;
        }
        boolean zConsumeBoolean = consumeBoolean(iSkipWhitespaces);
        if (!z11) {
            return zConsumeBoolean;
        }
        if (this.currentPosition == getSource().length()) {
            fail$default(this, "EOF", 0, null, 6, null);
            throw new KotlinNothingValueException();
        }
        if (getSource().charAt(this.currentPosition) == '\"') {
            this.currentPosition++;
            return zConsumeBoolean;
        }
        fail$default(this, "Expected closing quotation mark", 0, null, 6, null);
        throw new KotlinNothingValueException();
    }

    @NotNull
    public abstract String consumeKeyString();

    public abstract byte consumeNextToken();

    public final byte consumeNextToken(byte expected) {
        byte bConsumeNextToken = consumeNextToken();
        if (bConsumeNextToken == expected) {
            return bConsumeNextToken;
        }
        String str = AbstractJsonLexerKt.tokenDescription(expected);
        int i5 = this.currentPosition;
        int i11 = i5 - 1;
        fail$default(this, c0.n("Expected ", str, ", but had '", (i5 == getSource().length() || i11 < 0) ? "EOF" : String.valueOf(getSource().charAt(i11)), "' instead"), i11, null, 4, null);
        throw new KotlinNothingValueException();
    }

    public abstract void consumeNextToken(char expected);

    /* JADX WARN: Code restructure failed: missing block: B:100:0x01e8, code lost:
    
        fail$default(r18, "Expected numeric literal", 0, null, 6, null);
     */
    /* JADX WARN: Code restructure failed: missing block: B:101:0x01f8, code lost:
    
        throw new kotlin.KotlinNothingValueException();
     */
    /* JADX WARN: Code restructure failed: missing block: B:60:0x0117, code lost:
    
        fail$default(r18, "Unexpected symbol '" + r15 + "' in numeric literal", 0, null, 6, null);
     */
    /* JADX WARN: Code restructure failed: missing block: B:61:0x0138, code lost:
    
        throw new kotlin.KotlinNothingValueException();
     */
    /* JADX WARN: Code restructure failed: missing block: B:62:0x0139, code lost:
    
        if (r2 == r1) goto L64;
     */
    /* JADX WARN: Code restructure failed: missing block: B:63:0x013b, code lost:
    
        r4 = true;
     */
    /* JADX WARN: Code restructure failed: missing block: B:64:0x013d, code lost:
    
        r4 = false;
     */
    /* JADX WARN: Code restructure failed: missing block: B:65:0x013e, code lost:
    
        if (r1 == r2) goto L100;
     */
    /* JADX WARN: Code restructure failed: missing block: B:66:0x0140, code lost:
    
        if (r9 == false) goto L69;
     */
    /* JADX WARN: Code restructure failed: missing block: B:68:0x0144, code lost:
    
        if (r1 == (r2 - 1)) goto L100;
     */
    /* JADX WARN: Code restructure failed: missing block: B:69:0x0146, code lost:
    
        if (r0 == false) goto L74;
     */
    /* JADX WARN: Code restructure failed: missing block: B:70:0x0148, code lost:
    
        if (r4 == false) goto L77;
     */
    /* JADX WARN: Code restructure failed: missing block: B:72:0x0152, code lost:
    
        if (getSource().charAt(r2) != '\"') goto L75;
     */
    /* JADX WARN: Code restructure failed: missing block: B:73:0x0154, code lost:
    
        r2 = r2 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:75:0x0159, code lost:
    
        fail$default(r18, "Expected closing quotation mark", 0, null, 6, null);
     */
    /* JADX WARN: Code restructure failed: missing block: B:76:0x0169, code lost:
    
        throw new kotlin.KotlinNothingValueException();
     */
    /* JADX WARN: Code restructure failed: missing block: B:77:0x016a, code lost:
    
        fail$default(r18, "EOF", 0, null, 6, null);
     */
    /* JADX WARN: Code restructure failed: missing block: B:78:0x017a, code lost:
    
        throw new kotlin.KotlinNothingValueException();
     */
    /* JADX WARN: Code restructure failed: missing block: B:79:0x017b, code lost:
    
        r18.currentPosition = r2;
     */
    /* JADX WARN: Code restructure failed: missing block: B:80:0x017d, code lost:
    
        if (r8 == false) goto L92;
     */
    /* JADX WARN: Code restructure failed: missing block: B:81:0x017f, code lost:
    
        r1 = r10 * consumeNumericLiteral$calculateExponent(r12, r14);
     */
    /* JADX WARN: Code restructure failed: missing block: B:82:0x0189, code lost:
    
        if (r1 > 9.223372036854776E18d) goto L90;
     */
    /* JADX WARN: Code restructure failed: missing block: B:84:0x018f, code lost:
    
        if (r1 < (-9.223372036854776E18d)) goto L90;
     */
    /* JADX WARN: Code restructure failed: missing block: B:86:0x0197, code lost:
    
        if (java.lang.Math.floor(r1) != r1) goto L88;
     */
    /* JADX WARN: Code restructure failed: missing block: B:87:0x0199, code lost:
    
        r10 = (long) r1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:88:0x019b, code lost:
    
        fail$default(r18, "Can't convert " + r1 + " to Long", 0, null, 6, null);
     */
    /* JADX WARN: Code restructure failed: missing block: B:89:0x01ba, code lost:
    
        throw new kotlin.KotlinNothingValueException();
     */
    /* JADX WARN: Code restructure failed: missing block: B:90:0x01bb, code lost:
    
        fail$default(r18, "Numeric value overflow", 0, null, 6, null);
     */
    /* JADX WARN: Code restructure failed: missing block: B:91:0x01cb, code lost:
    
        throw new kotlin.KotlinNothingValueException();
     */
    /* JADX WARN: Code restructure failed: missing block: B:92:0x01cc, code lost:
    
        if (r9 == false) goto L94;
     */
    /* JADX WARN: Code restructure failed: missing block: B:93:0x01ce, code lost:
    
        return r10;
     */
    /* JADX WARN: Code restructure failed: missing block: B:95:0x01d3, code lost:
    
        if (r10 == Long.MIN_VALUE) goto L98;
     */
    /* JADX WARN: Code restructure failed: missing block: B:97:0x01d6, code lost:
    
        return -r10;
     */
    /* JADX WARN: Code restructure failed: missing block: B:98:0x01d7, code lost:
    
        fail$default(r18, "Numeric value overflow", 0, null, 6, null);
     */
    /* JADX WARN: Code restructure failed: missing block: B:99:0x01e7, code lost:
    
        throw new kotlin.KotlinNothingValueException();
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final long consumeNumericLiteral() {
        boolean z11;
        int iPrefetchOrEof = prefetchOrEof(skipWhitespaces());
        if (iPrefetchOrEof < getSource().length() && iPrefetchOrEof != -1) {
            if (getSource().charAt(iPrefetchOrEof) == '\"') {
                iPrefetchOrEof++;
                if (iPrefetchOrEof == getSource().length()) {
                    fail$default(this, "EOF", 0, null, 6, null);
                    throw new KotlinNothingValueException();
                }
                z11 = true;
            } else {
                z11 = false;
            }
            int i5 = iPrefetchOrEof;
            boolean z12 = false;
            boolean z13 = false;
            long j11 = 0;
            long j12 = 0;
            loop0: while (true) {
                boolean z14 = false;
                while (i5 != getSource().length()) {
                    char cCharAt = getSource().charAt(i5);
                    if ((cCharAt == 'e' || cCharAt == 'E') && !z12) {
                        if (i5 == iPrefetchOrEof) {
                            fail$default(this, "Unexpected symbol " + cCharAt + " in numeric literal", 0, null, 6, null);
                            throw new KotlinNothingValueException();
                        }
                        i5++;
                        z12 = true;
                    } else if (cCharAt == '-' && z12) {
                        if (i5 == iPrefetchOrEof) {
                            fail$default(this, "Unexpected symbol '-' in numeric literal", 0, null, 6, null);
                            throw new KotlinNothingValueException();
                        }
                        i5++;
                    } else if (cCharAt != '+' || !z12) {
                        if (cCharAt != '-') {
                            if (AbstractJsonLexerKt.charToTokenClass(cCharAt) != 0) {
                                break loop0;
                            }
                            i5++;
                            int i11 = cCharAt - '0';
                            if (i11 < 0 || i11 >= 10) {
                                break loop0;
                            }
                            if (z12) {
                                j12 = (j12 * 10) + i11;
                            } else {
                                j11 = (j11 * 10) - i11;
                                if (j11 > 0) {
                                    fail$default(this, "Numeric value overflow", 0, null, 6, null);
                                    throw new KotlinNothingValueException();
                                }
                            }
                        } else {
                            if (i5 != iPrefetchOrEof) {
                                fail$default(this, "Unexpected symbol '-' in numeric literal", 0, null, 6, null);
                                throw new KotlinNothingValueException();
                            }
                            i5++;
                            z13 = true;
                        }
                    } else {
                        if (i5 == iPrefetchOrEof) {
                            fail$default(this, "Unexpected symbol '+' in numeric literal", 0, null, 6, null);
                            throw new KotlinNothingValueException();
                        }
                        i5++;
                    }
                    z14 = true;
                }
                break loop0;
            }
        } else {
            fail$default(this, "EOF", 0, null, 6, null);
            throw new KotlinNothingValueException();
        }
    }

    public final long consumeNumericLiteralFully() {
        long jConsumeNumericLiteral = consumeNumericLiteral();
        if (consumeNextToken() == 10) {
            return jConsumeNumericLiteral;
        }
        AbstractJsonLexerKt.tokenDescription((byte) 10);
        int i5 = this.currentPosition;
        int i11 = i5 - 1;
        fail$default(this, c0.l("Expected input to contain a single valid number, but got '", (i5 == getSource().length() || i11 < 0) ? "EOF" : String.valueOf(getSource().charAt(i11)), "' after it"), i11, null, 4, null);
        throw new KotlinNothingValueException();
    }

    @NotNull
    public final String consumeString() {
        return this.peekedString != null ? takePeeked() : consumeKeyString();
    }

    public void consumeStringChunked(boolean isLenient, @NotNull Function1<? super String, Unit> consumeChunk) {
        int i5;
        int iPrefetchOrEof;
        Intrinsics.g(consumeChunk, "consumeChunk");
        byte bPeekNextToken = peekNextToken();
        if (!isLenient || bPeekNextToken == 0) {
            if (!isLenient) {
                consumeNextToken(AbstractJsonLexerKt.STRING);
            }
            int i11 = this.currentPosition;
            char cCharAt = getSource().charAt(i11);
            boolean z11 = false;
            int i12 = i11;
            while (insideString(isLenient, cCharAt)) {
                if (isLenient || cCharAt != '\\') {
                    int i13 = i12 + 1;
                    i5 = i11;
                    iPrefetchOrEof = i13;
                } else {
                    iPrefetchOrEof = prefetchOrEof(appendEscape(i11, i12));
                    z11 = true;
                    i5 = iPrefetchOrEof;
                }
                if (iPrefetchOrEof >= getSource().length()) {
                    writeRange(i5, iPrefetchOrEof, z11, consumeChunk);
                    int iPrefetchOrEof2 = prefetchOrEof(iPrefetchOrEof);
                    if (iPrefetchOrEof2 == -1) {
                        fail$default(this, "EOF", iPrefetchOrEof2, null, 4, null);
                        throw new KotlinNothingValueException();
                    }
                    z11 = false;
                    i11 = iPrefetchOrEof2;
                    i12 = i11;
                } else {
                    int i14 = i5;
                    i12 = iPrefetchOrEof;
                    i11 = i14;
                }
                cCharAt = getSource().charAt(i12);
            }
            writeRange(i11, i12, z11, consumeChunk);
            this.currentPosition = i12;
            if (isLenient) {
                return;
            }
            consumeNextToken(AbstractJsonLexerKt.STRING);
        }
    }

    @NotNull
    public final String consumeStringLenient() {
        if (this.peekedString != null) {
            return takePeeked();
        }
        int iSkipWhitespaces = skipWhitespaces();
        if (iSkipWhitespaces >= getSource().length() || iSkipWhitespaces == -1) {
            fail$default(this, "EOF", iSkipWhitespaces, null, 4, null);
            throw new KotlinNothingValueException();
        }
        byte bCharToTokenClass = AbstractJsonLexerKt.charToTokenClass(getSource().charAt(iSkipWhitespaces));
        if (bCharToTokenClass == 1) {
            return consumeString();
        }
        if (bCharToTokenClass != 0) {
            fail$default(this, "Expected beginning of the string, but got " + getSource().charAt(iSkipWhitespaces), 0, null, 6, null);
            throw new KotlinNothingValueException();
        }
        boolean z11 = false;
        while (AbstractJsonLexerKt.charToTokenClass(getSource().charAt(iSkipWhitespaces)) == 0) {
            iSkipWhitespaces++;
            if (iSkipWhitespaces >= getSource().length()) {
                appendRange(this.currentPosition, iSkipWhitespaces);
                int iPrefetchOrEof = prefetchOrEof(iSkipWhitespaces);
                if (iPrefetchOrEof == -1) {
                    this.currentPosition = iSkipWhitespaces;
                    return decodedString(0, 0);
                }
                iSkipWhitespaces = iPrefetchOrEof;
                z11 = true;
            }
        }
        String strSubstring = !z11 ? substring(this.currentPosition, iSkipWhitespaces) : decodedString(this.currentPosition, iSkipWhitespaces);
        this.currentPosition = iSkipWhitespaces;
        return strSubstring;
    }

    @NotNull
    public final String consumeStringLenientNotNull() {
        String strConsumeStringLenient = consumeStringLenient();
        if (!Intrinsics.b(strConsumeStringLenient, AbstractJsonLexerKt.NULL) || !wasUnquotedString()) {
            return strConsumeStringLenient;
        }
        fail$default(this, "Unexpected 'null' value instead of string literal", 0, null, 6, null);
        throw new KotlinNothingValueException();
    }

    public final void discardPeeked() {
        this.peekedString = null;
    }

    public void ensureHaveChars() {
    }

    public final void expectEof() {
        if (consumeNextToken() == 10) {
            return;
        }
        fail$default(this, "Expected EOF after parsing, but had " + getSource().charAt(this.currentPosition - 1) + " instead", 0, null, 6, null);
        throw new KotlinNothingValueException();
    }

    @NotNull
    public final Void fail(@NotNull String message, int position, @NotNull String hint) {
        Intrinsics.g(message, "message");
        Intrinsics.g(hint, "hint");
        String strConcat = hint.length() == 0 ? b.f42142b : "\n".concat(hint);
        StringBuilder sbK = k2.k(message, " at path: ");
        sbK.append(this.path.getPath());
        sbK.append(strConcat);
        throw JsonExceptionsKt.JsonDecodingException(position, sbK.toString(), getSource());
    }

    @NotNull
    public final Void fail$kotlinx_serialization_json(byte expectedToken, boolean wasConsumed, @NotNull Function2<? super String, ? super String, String> message) {
        Intrinsics.g(message, "message");
        String str = AbstractJsonLexerKt.tokenDescription(expectedToken);
        int i5 = wasConsumed ? this.currentPosition - 1 : this.currentPosition;
        fail$default(this, (String) message.invoke(str, (this.currentPosition == getSource().length() || i5 < 0) ? "EOF" : String.valueOf(getSource().charAt(i5))), i5, null, 4, null);
        throw new KotlinNothingValueException();
    }

    public final void failOnUnknownKey(@NotNull String key) {
        Intrinsics.g(key, "key");
        int iW0 = k.W0(6, substring(0, this.currentPosition), key);
        StringBuilder sbV = c0.v("Encountered an unknown key '", iW0, key, "' at offset ", " at path: ");
        sbV.append(this.path.getPath());
        sbV.append("\nUse 'ignoreUnknownKeys = true' in 'Json {}' builder or '@JsonIgnoreUnknownKeys' annotation to ignore unknown keys.\nJSON input: ");
        sbV.append((Object) JsonExceptionsKt.minify(getSource(), iW0));
        throw new JsonDecodingException(sbV.toString());
    }

    @NotNull
    public final StringBuilder getEscapedString() {
        return this.escapedString;
    }

    @NotNull
    public abstract CharSequence getSource();

    public int indexOf(char c11, int startPos) {
        return k.R0(c11, startPos, 4, getSource());
    }

    public final boolean isNotEof() {
        return peekNextToken() != 10;
    }

    public final boolean isValidValueStart(char c11) {
        return (c11 == ',' || c11 == ':' || c11 == ']' || c11 == '}') ? false : true;
    }

    public final boolean isWs(char c11) {
        return c11 == ' ' || c11 == '\n' || c11 == '\r' || c11 == '\t';
    }

    @Nullable
    public abstract String peekLeadingMatchingValue(@NotNull String keyToMatch, boolean isLenient);

    public byte peekNextToken() {
        CharSequence source = getSource();
        int i5 = this.currentPosition;
        while (true) {
            int iPrefetchOrEof = prefetchOrEof(i5);
            if (iPrefetchOrEof == -1) {
                this.currentPosition = iPrefetchOrEof;
                return (byte) 10;
            }
            char cCharAt = source.charAt(iPrefetchOrEof);
            if (cCharAt != '\t' && cCharAt != '\n' && cCharAt != '\r' && cCharAt != ' ') {
                this.currentPosition = iPrefetchOrEof;
                return AbstractJsonLexerKt.charToTokenClass(cCharAt);
            }
            i5 = iPrefetchOrEof + 1;
        }
    }

    @Nullable
    public final String peekString(boolean isLenient) {
        String strConsumeString;
        byte bPeekNextToken = peekNextToken();
        if (isLenient) {
            if (bPeekNextToken != 1 && bPeekNextToken != 0) {
                return null;
            }
            strConsumeString = consumeStringLenient();
        } else {
            if (bPeekNextToken != 1) {
                return null;
            }
            strConsumeString = consumeString();
        }
        this.peekedString = strConsumeString;
        return strConsumeString;
    }

    public abstract int prefetchOrEof(int position);

    public final void require$kotlinx_serialization_json(boolean condition, int position, @NotNull Function0<String> message) {
        Intrinsics.g(message, "message");
        if (condition) {
            return;
        }
        fail$default(this, (String) message.invoke(), position, null, 4, null);
        throw new KotlinNothingValueException();
    }

    public final void setEscapedString(@NotNull StringBuilder sb2) {
        Intrinsics.g(sb2, "<set-?>");
        this.escapedString = sb2;
    }

    public final void skipElement(boolean allowLenientStrings) {
        ArrayList arrayList = new ArrayList();
        byte bPeekNextToken = peekNextToken();
        if (bPeekNextToken != 8 && bPeekNextToken != 6) {
            consumeStringLenient();
            return;
        }
        while (true) {
            byte bPeekNextToken2 = peekNextToken();
            if (bPeekNextToken2 != 1) {
                if (bPeekNextToken2 == 8 || bPeekNextToken2 == 6) {
                    arrayList.add(Byte.valueOf(bPeekNextToken2));
                } else if (bPeekNextToken2 == 9) {
                    if (((Number) g.h1(arrayList)).byteValue() != 8) {
                        throw JsonExceptionsKt.JsonDecodingException(this.currentPosition, "found ] instead of } at path: " + this.path, getSource());
                    }
                    d.H0(arrayList);
                } else if (bPeekNextToken2 == 7) {
                    if (((Number) g.h1(arrayList)).byteValue() != 6) {
                        throw JsonExceptionsKt.JsonDecodingException(this.currentPosition, "found } instead of ] at path: " + this.path, getSource());
                    }
                    d.H0(arrayList);
                } else if (bPeekNextToken2 == 10) {
                    fail$default(this, "Unexpected end of input due to malformed JSON during ignoring unknown keys", 0, null, 6, null);
                    throw new KotlinNothingValueException();
                }
                consumeNextToken();
                if (arrayList.size() == 0) {
                    return;
                }
            } else if (allowLenientStrings) {
                consumeStringLenient();
            } else {
                consumeKeyString();
            }
        }
    }

    public abstract int skipWhitespaces();

    @NotNull
    public String substring(int startPos, int endPos) {
        return getSource().subSequence(startPos, endPos).toString();
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("JsonReader(source='");
        sb2.append((Object) getSource());
        sb2.append("', currentPosition=");
        return c.m(sb2, this.currentPosition, ')');
    }

    public final boolean tryConsumeComma() {
        int iSkipWhitespaces = skipWhitespaces();
        CharSequence source = getSource();
        if (iSkipWhitespaces >= source.length() || iSkipWhitespaces == -1 || source.charAt(iSkipWhitespaces) != ',') {
            return false;
        }
        this.currentPosition++;
        return true;
    }

    public final boolean tryConsumeNull(boolean doConsume) {
        int iPrefetchOrEof = prefetchOrEof(skipWhitespaces());
        int length = getSource().length() - iPrefetchOrEof;
        if (length < 4 || iPrefetchOrEof == -1) {
            return false;
        }
        for (int i5 = 0; i5 < 4; i5++) {
            if (AbstractJsonLexerKt.NULL.charAt(i5) != getSource().charAt(iPrefetchOrEof + i5)) {
                return false;
            }
        }
        if (length > 4 && AbstractJsonLexerKt.charToTokenClass(getSource().charAt(iPrefetchOrEof + 4)) == 0) {
            return false;
        }
        if (!doConsume) {
            return true;
        }
        this.currentPosition = iPrefetchOrEof + 4;
        return true;
    }

    public final void unexpectedToken(char expected) {
        int i5 = this.currentPosition;
        if (i5 > 0 && expected == '\"') {
            try {
                this.currentPosition = i5 - 1;
                String strConsumeStringLenient = consumeStringLenient();
                this.currentPosition = i5;
                if (Intrinsics.b(strConsumeStringLenient, AbstractJsonLexerKt.NULL)) {
                    fail("Expected string literal but 'null' literal was found", this.currentPosition - 1, AbstractJsonLexerKt.coerceInputValuesHint);
                    throw new KotlinNothingValueException();
                }
            } catch (Throwable th2) {
                this.currentPosition = i5;
                throw th2;
            }
        }
        String str = AbstractJsonLexerKt.tokenDescription(AbstractJsonLexerKt.charToTokenClass(expected));
        int i11 = this.currentPosition;
        int i12 = i11 - 1;
        fail$default(this, c0.n("Expected ", str, ", but had '", (i11 == getSource().length() || i12 < 0) ? "EOF" : String.valueOf(getSource().charAt(i12)), "' instead"), i12, null, 4, null);
        throw new KotlinNothingValueException();
    }

    private final boolean consumeBoolean(int start) {
        int iPrefetchOrEof = prefetchOrEof(start);
        if (iPrefetchOrEof >= getSource().length() || iPrefetchOrEof == -1) {
            fail$default(this, "EOF", 0, null, 6, null);
            throw new KotlinNothingValueException();
        }
        int i5 = iPrefetchOrEof + 1;
        int iCharAt = getSource().charAt(iPrefetchOrEof) | ' ';
        if (iCharAt == 102) {
            consumeBooleanLiteral("alse", i5);
            return false;
        }
        if (iCharAt == 116) {
            consumeBooleanLiteral("rue", i5);
            return true;
        }
        fail$default(this, "Expected valid boolean literal prefix, but had '" + consumeStringLenient() + '\'', 0, null, 6, null);
        throw new KotlinNothingValueException();
    }

    @NotNull
    public final String consumeString(@NotNull CharSequence source, int startPosition, int current) {
        String strDecodedString;
        Intrinsics.g(source, "source");
        char cCharAt = source.charAt(current);
        boolean z11 = false;
        while (cCharAt != '\"') {
            if (cCharAt == '\\') {
                int iPrefetchOrEof = prefetchOrEof(appendEscape(startPosition, current));
                if (iPrefetchOrEof == -1) {
                    fail$default(this, "Unexpected EOF", iPrefetchOrEof, null, 4, null);
                    throw new KotlinNothingValueException();
                }
                z11 = true;
                startPosition = iPrefetchOrEof;
                current = startPosition;
            } else {
                current++;
                if (current >= source.length()) {
                    appendRange(startPosition, current);
                    int iPrefetchOrEof2 = prefetchOrEof(current);
                    if (iPrefetchOrEof2 == -1) {
                        fail$default(this, "Unexpected EOF", iPrefetchOrEof2, null, 4, null);
                        throw new KotlinNothingValueException();
                    }
                    startPosition = iPrefetchOrEof2;
                    current = startPosition;
                    z11 = true;
                } else {
                    continue;
                }
            }
            cCharAt = source.charAt(current);
        }
        if (!z11) {
            strDecodedString = substring(startPosition, current);
        } else {
            strDecodedString = decodedString(startPosition, current);
        }
        this.currentPosition = current + 1;
        return strDecodedString;
    }
}
