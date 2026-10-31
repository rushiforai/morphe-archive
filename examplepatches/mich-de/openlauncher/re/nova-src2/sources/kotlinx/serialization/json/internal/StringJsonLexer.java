package kotlinx.serialization.json.internal;

import b.c0;
import com.amplitude.core.events.Plan;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Iterator;
import kotlin.KotlinNothingValueException;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import r70.k;
import r70.l;

@Metadata(d1 = {"\u0000@\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0005\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\f\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0010\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u0010\u0010\b\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\tH\u0016J\b\u0010\u000b\u001a\u00020\fH\u0016J\b\u0010\r\u001a\u00020\u000eH\u0016J\b\u0010\u000f\u001a\u00020\tH\u0016J\u0010\u0010\u000b\u001a\u00020\u00102\u0006\u0010\u0011\u001a\u00020\u0012H\u0016J\b\u0010\u0013\u001a\u00020\u0003H\u0016J3\u0010\u0014\u001a\u00020\u00102\u0006\u0010\u0015\u001a\u00020\u000e2!\u0010\u0016\u001a\u001d\u0012\u0013\u0012\u00110\u0003¢\u0006\f\b\u0018\u0012\b\b\u0019\u0012\u0004\b\b(\u001a\u0012\u0004\u0012\u00020\u00100\u0017H\u0016J\u001a\u0010\u001b\u001a\u0004\u0018\u00010\u00032\u0006\u0010\u001c\u001a\u00020\u00032\u0006\u0010\u0015\u001a\u00020\u000eH\u0016R\u0014\u0010\u0002\u001a\u00020\u0003X\u0094\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u001d"}, d2 = {"Lkotlinx/serialization/json/internal/StringJsonLexer;", "Lkotlinx/serialization/json/internal/AbstractJsonLexer;", Plan.AMP_PLAN_SOURCE, b.f42142b, "<init>", "(Ljava/lang/String;)V", "getSource", "()Ljava/lang/String;", "prefetchOrEof", b.f42142b, "position", "consumeNextToken", b.f42142b, "canConsumeValue", b.f42142b, "skipWhitespaces", b.f42142b, "expected", b.f42142b, "consumeKeyString", "consumeStringChunked", "isLenient", "consumeChunk", "Lkotlin/Function1;", "Lkotlin/ParameterName;", PendingUpgradeStore.KEY_NAME, "stringChunk", "peekLeadingMatchingValue", "keyToMatch", "kotlinx-serialization-json"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes.dex */
public class StringJsonLexer extends AbstractJsonLexer {

    @NotNull
    private final String source;

    public StringJsonLexer(@NotNull String source) {
        Intrinsics.g(source, "source");
        this.source = source;
    }

    @Override // kotlinx.serialization.json.internal.AbstractJsonLexer
    public boolean canConsumeValue() {
        int i5 = this.currentPosition;
        if (i5 == -1) {
            return false;
        }
        String source = getSource();
        while (i5 < source.length()) {
            char cCharAt = source.charAt(i5);
            if (cCharAt != ' ' && cCharAt != '\n' && cCharAt != '\r' && cCharAt != '\t') {
                this.currentPosition = i5;
                return isValidValueStart(cCharAt);
            }
            i5++;
        }
        this.currentPosition = i5;
        return false;
    }

    @Override // kotlinx.serialization.json.internal.AbstractJsonLexer
    @NotNull
    public String consumeKeyString() {
        consumeNextToken(AbstractJsonLexerKt.STRING);
        int i5 = this.currentPosition;
        int iR0 = k.R0(AbstractJsonLexerKt.STRING, i5, 4, getSource());
        if (iR0 == -1) {
            consumeStringLenient();
            String str = AbstractJsonLexerKt.tokenDescription((byte) 1);
            int i11 = this.currentPosition;
            AbstractJsonLexer.fail$default(this, c0.n("Expected ", str, ", but had '", (i11 == getSource().length() || i11 < 0) ? "EOF" : String.valueOf(getSource().charAt(i11)), "' instead"), i11, null, 4, null);
            throw new KotlinNothingValueException();
        }
        for (int i12 = i5; i12 < iR0; i12++) {
            if (getSource().charAt(i12) == '\\') {
                return consumeString(getSource(), this.currentPosition, i12);
            }
        }
        this.currentPosition = iR0 + 1;
        String strSubstring = getSource().substring(i5, iR0);
        Intrinsics.f(strSubstring, "substring(...)");
        return strSubstring;
    }

    @Override // kotlinx.serialization.json.internal.AbstractJsonLexer
    public byte consumeNextToken() {
        String source = getSource();
        int i5 = this.currentPosition;
        while (i5 != -1 && i5 < source.length()) {
            int i11 = i5 + 1;
            char cCharAt = source.charAt(i5);
            if (cCharAt != ' ' && cCharAt != '\n' && cCharAt != '\r' && cCharAt != '\t') {
                this.currentPosition = i11;
                return AbstractJsonLexerKt.charToTokenClass(cCharAt);
            }
            i5 = i11;
        }
        this.currentPosition = source.length();
        return (byte) 10;
    }

    @Override // kotlinx.serialization.json.internal.AbstractJsonLexer
    public void consumeStringChunked(boolean isLenient, @NotNull Function1<? super String, Unit> consumeChunk) {
        Intrinsics.g(consumeChunk, "consumeChunk");
        Iterator it = l.A1(ReaderJsonLexerKt.BATCH_SIZE, isLenient ? consumeStringLenient() : consumeString()).iterator();
        while (it.hasNext()) {
            consumeChunk.invoke(it.next());
        }
    }

    @Override // kotlinx.serialization.json.internal.AbstractJsonLexer
    @Nullable
    public String peekLeadingMatchingValue(@NotNull String keyToMatch, boolean isLenient) {
        Intrinsics.g(keyToMatch, "keyToMatch");
        int i5 = this.currentPosition;
        try {
            if (consumeNextToken() == 6 && Intrinsics.b(peekString(isLenient), keyToMatch)) {
                discardPeeked();
                if (consumeNextToken() == 5) {
                    return peekString(isLenient);
                }
            }
            return null;
        } finally {
            this.currentPosition = i5;
            discardPeeked();
        }
    }

    @Override // kotlinx.serialization.json.internal.AbstractJsonLexer
    public int prefetchOrEof(int position) {
        if (position < getSource().length()) {
            return position;
        }
        return -1;
    }

    @Override // kotlinx.serialization.json.internal.AbstractJsonLexer
    public int skipWhitespaces() {
        char cCharAt;
        int i5 = this.currentPosition;
        if (i5 == -1) {
            return i5;
        }
        String source = getSource();
        while (i5 < source.length() && ((cCharAt = source.charAt(i5)) == ' ' || cCharAt == '\n' || cCharAt == '\r' || cCharAt == '\t')) {
            i5++;
        }
        this.currentPosition = i5;
        return i5;
    }

    @Override // kotlinx.serialization.json.internal.AbstractJsonLexer
    @NotNull
    public String getSource() {
        return this.source;
    }

    @Override // kotlinx.serialization.json.internal.AbstractJsonLexer
    public void consumeNextToken(char expected) {
        if (this.currentPosition == -1) {
            unexpectedToken(expected);
        }
        String source = getSource();
        int i5 = this.currentPosition;
        while (i5 < source.length()) {
            int i11 = i5 + 1;
            char cCharAt = source.charAt(i5);
            if (cCharAt != ' ' && cCharAt != '\n' && cCharAt != '\r' && cCharAt != '\t') {
                this.currentPosition = i11;
                if (cCharAt == expected) {
                    return;
                } else {
                    unexpectedToken(expected);
                }
            }
            i5 = i11;
        }
        this.currentPosition = -1;
        unexpectedToken(expected);
    }
}
