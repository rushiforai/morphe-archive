package kotlinx.serialization.json.internal;

import b.c0;
import com.amplitude.core.events.Plan;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.KotlinNothingValueException;
import kotlin.Metadata;
import kotlin.jvm.JvmField;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000J\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0019\n\u0002\b\u0007\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0004\n\u0002\u0010\u0005\n\u0000\n\u0002\u0010\f\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\r\b\u0010\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\b\u0010\u0012\u001a\u00020\u0013H\u0016J\u0010\u0010\u0014\u001a\u00020\u00152\u0006\u0010\u0016\u001a\u00020\rH\u0002J\u0010\u0010\u0017\u001a\u00020\r2\u0006\u0010\u0018\u001a\u00020\rH\u0016J\b\u0010\u0019\u001a\u00020\u001aH\u0016J\u0010\u0010\u0019\u001a\u00020\u00152\u0006\u0010\u001b\u001a\u00020\u001cH\u0016J\b\u0010\u001d\u001a\u00020\rH\u0016J\b\u0010\u001e\u001a\u00020\u0015H\u0016J\b\u0010\u001f\u001a\u00020 H\u0016J\u0018\u0010!\u001a\u00020\r2\u0006\u0010\"\u001a\u00020\u001c2\u0006\u0010#\u001a\u00020\rH\u0016J\u0018\u0010$\u001a\u00020 2\u0006\u0010#\u001a\u00020\r2\u0006\u0010%\u001a\u00020\rH\u0016J\u0018\u0010&\u001a\u00020\u00152\u0006\u0010'\u001a\u00020\r2\u0006\u0010(\u001a\u00020\rH\u0014J\u001a\u0010)\u001a\u0004\u0018\u00010 2\u0006\u0010*\u001a\u00020 2\u0006\u0010+\u001a\u00020\u0013H\u0016J\u0006\u0010,\u001a\u00020\u0015R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0012\u0010\f\u001a\u00020\r8\u0004@\u0004X\u0085\u000e¢\u0006\u0002\n\u0000R\u0014\u0010\u000e\u001a\u00020\u000fX\u0094\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011¨\u0006-"}, d2 = {"Lkotlinx/serialization/json/internal/ReaderJsonLexer;", "Lkotlinx/serialization/json/internal/AbstractJsonLexer;", "reader", "Lkotlinx/serialization/json/internal/InternalJsonReader;", "buffer", b.f42142b, "<init>", "(Lkotlinx/serialization/json/internal/InternalJsonReader;[C)V", "getReader", "()Lkotlinx/serialization/json/internal/InternalJsonReader;", "getBuffer", "()[C", "threshold", b.f42142b, Plan.AMP_PLAN_SOURCE, "Lkotlinx/serialization/json/internal/ArrayAsSequence;", "getSource", "()Lkotlinx/serialization/json/internal/ArrayAsSequence;", "canConsumeValue", b.f42142b, "preload", b.f42142b, "unprocessedCount", "prefetchOrEof", "position", "consumeNextToken", b.f42142b, "expected", b.f42142b, "skipWhitespaces", "ensureHaveChars", "consumeKeyString", b.f42142b, "indexOf", "char", "startPos", "substring", "endPos", "appendRange", "fromIndex", "toIndex", "peekLeadingMatchingValue", "keyToMatch", "isLenient", "release", "kotlinx-serialization-json"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes5.dex */
public class ReaderJsonLexer extends AbstractJsonLexer {

    @NotNull
    private final char[] buffer;

    @NotNull
    private final InternalJsonReader reader;

    @NotNull
    private final ArrayAsSequence source;

    @JvmField
    protected int threshold;

    public /* synthetic */ ReaderJsonLexer(InternalJsonReader internalJsonReader, char[] cArr, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(internalJsonReader, (i5 & 2) != 0 ? CharArrayPoolBatchSize.INSTANCE.take() : cArr);
    }

    private final void preload(int unprocessedCount) {
        char[] buffer = getSource().getBuffer();
        if (unprocessedCount != 0) {
            int i5 = this.currentPosition;
            u90.b.r(buffer, buffer, 0, i5, i5 + unprocessedCount);
        }
        int length = getSource().length();
        while (true) {
            if (unprocessedCount == length) {
                break;
            }
            int i11 = this.reader.read(buffer, unprocessedCount, length - unprocessedCount);
            if (i11 == -1) {
                getSource().trim(unprocessedCount);
                this.threshold = -1;
                break;
            }
            unprocessedCount += i11;
        }
        this.currentPosition = 0;
    }

    @Override // kotlinx.serialization.json.internal.AbstractJsonLexer
    public void appendRange(int fromIndex, int toIndex) {
        getEscapedString().append(getSource().getBuffer(), fromIndex, toIndex - fromIndex);
    }

    @Override // kotlinx.serialization.json.internal.AbstractJsonLexer
    public boolean canConsumeValue() {
        ensureHaveChars();
        int i5 = this.currentPosition;
        while (true) {
            int iPrefetchOrEof = prefetchOrEof(i5);
            if (iPrefetchOrEof == -1) {
                this.currentPosition = iPrefetchOrEof;
                return false;
            }
            char cCharAt = getSource().charAt(iPrefetchOrEof);
            if (cCharAt != ' ' && cCharAt != '\n' && cCharAt != '\r' && cCharAt != '\t') {
                this.currentPosition = iPrefetchOrEof;
                return isValidValueStart(cCharAt);
            }
            i5 = iPrefetchOrEof + 1;
        }
    }

    @Override // kotlinx.serialization.json.internal.AbstractJsonLexer
    @NotNull
    public String consumeKeyString() {
        consumeNextToken(AbstractJsonLexerKt.STRING);
        int i5 = this.currentPosition;
        int iIndexOf = indexOf(AbstractJsonLexerKt.STRING, i5);
        if (iIndexOf != -1) {
            for (int i11 = i5; i11 < iIndexOf; i11++) {
                if (getSource().charAt(i11) == '\\') {
                    return consumeString(getSource(), this.currentPosition, i11);
                }
            }
            this.currentPosition = iIndexOf + 1;
            return substring(i5, iIndexOf);
        }
        int iPrefetchOrEof = prefetchOrEof(i5);
        if (iPrefetchOrEof != -1) {
            return consumeString(getSource(), this.currentPosition, iPrefetchOrEof);
        }
        String str = AbstractJsonLexerKt.tokenDescription((byte) 1);
        int i12 = this.currentPosition;
        int i13 = i12 - 1;
        AbstractJsonLexer.fail$default(this, c0.n("Expected ", str, ", but had '", (i12 == getSource().length() || i13 < 0) ? "EOF" : String.valueOf(getSource().charAt(i13)), "' instead"), i13, null, 4, null);
        throw new KotlinNothingValueException();
    }

    @Override // kotlinx.serialization.json.internal.AbstractJsonLexer
    public byte consumeNextToken() {
        ensureHaveChars();
        ArrayAsSequence source = getSource();
        int i5 = this.currentPosition;
        while (true) {
            int iPrefetchOrEof = prefetchOrEof(i5);
            if (iPrefetchOrEof == -1) {
                this.currentPosition = iPrefetchOrEof;
                return (byte) 10;
            }
            int i11 = iPrefetchOrEof + 1;
            byte bCharToTokenClass = AbstractJsonLexerKt.charToTokenClass(source.charAt(iPrefetchOrEof));
            if (bCharToTokenClass != 3) {
                this.currentPosition = i11;
                return bCharToTokenClass;
            }
            i5 = i11;
        }
    }

    @Override // kotlinx.serialization.json.internal.AbstractJsonLexer
    public void ensureHaveChars() {
        int length = getSource().length() - this.currentPosition;
        if (length > this.threshold) {
            return;
        }
        preload(length);
    }

    @NotNull
    public final char[] getBuffer() {
        return this.buffer;
    }

    @NotNull
    public final InternalJsonReader getReader() {
        return this.reader;
    }

    @Override // kotlinx.serialization.json.internal.AbstractJsonLexer
    public int indexOf(char c11, int startPos) {
        ArrayAsSequence source = getSource();
        int length = source.length();
        while (startPos < length) {
            if (source.charAt(startPos) == c11) {
                return startPos;
            }
            startPos++;
        }
        return -1;
    }

    @Override // kotlinx.serialization.json.internal.AbstractJsonLexer
    @Nullable
    public String peekLeadingMatchingValue(@NotNull String keyToMatch, boolean isLenient) {
        Intrinsics.g(keyToMatch, "keyToMatch");
        return null;
    }

    @Override // kotlinx.serialization.json.internal.AbstractJsonLexer
    public int prefetchOrEof(int position) {
        if (position < getSource().length()) {
            return position;
        }
        this.currentPosition = position;
        ensureHaveChars();
        return (this.currentPosition != 0 || getSource().length() == 0) ? -1 : 0;
    }

    public final void release() {
        CharArrayPoolBatchSize.INSTANCE.release(this.buffer);
    }

    @Override // kotlinx.serialization.json.internal.AbstractJsonLexer
    public int skipWhitespaces() {
        int iPrefetchOrEof;
        char cCharAt;
        int i5 = this.currentPosition;
        while (true) {
            iPrefetchOrEof = prefetchOrEof(i5);
            if (iPrefetchOrEof == -1 || !((cCharAt = getSource().charAt(iPrefetchOrEof)) == ' ' || cCharAt == '\n' || cCharAt == '\r' || cCharAt == '\t')) {
                break;
            }
            i5 = iPrefetchOrEof + 1;
        }
        this.currentPosition = iPrefetchOrEof;
        return iPrefetchOrEof;
    }

    @Override // kotlinx.serialization.json.internal.AbstractJsonLexer
    @NotNull
    public String substring(int startPos, int endPos) {
        return getSource().substring(startPos, endPos);
    }

    @Override // kotlinx.serialization.json.internal.AbstractJsonLexer
    @NotNull
    public ArrayAsSequence getSource() {
        return this.source;
    }

    public ReaderJsonLexer(@NotNull InternalJsonReader reader, @NotNull char[] buffer) {
        Intrinsics.g(reader, "reader");
        Intrinsics.g(buffer, "buffer");
        this.reader = reader;
        this.buffer = buffer;
        this.threshold = 128;
        this.source = new ArrayAsSequence(buffer);
        preload(0);
    }

    @Override // kotlinx.serialization.json.internal.AbstractJsonLexer
    public void consumeNextToken(char expected) {
        ensureHaveChars();
        ArrayAsSequence source = getSource();
        int i5 = this.currentPosition;
        while (true) {
            int iPrefetchOrEof = prefetchOrEof(i5);
            if (iPrefetchOrEof != -1) {
                int i11 = iPrefetchOrEof + 1;
                char cCharAt = source.charAt(iPrefetchOrEof);
                if (cCharAt != ' ' && cCharAt != '\n' && cCharAt != '\r' && cCharAt != '\t') {
                    this.currentPosition = i11;
                    if (cCharAt == expected) {
                        return;
                    } else {
                        unexpectedToken(expected);
                    }
                }
                i5 = i11;
            } else {
                this.currentPosition = iPrefetchOrEof;
                unexpectedToken(expected);
                return;
            }
        }
    }
}
