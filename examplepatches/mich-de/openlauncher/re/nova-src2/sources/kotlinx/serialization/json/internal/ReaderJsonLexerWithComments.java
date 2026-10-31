package kotlinx.serialization.json.internal;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.KotlinNothingValueException;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import r70.k;

@Metadata(d1 = {"\u0000<\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0019\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\f\n\u0000\n\u0002\u0010\u000b\n\u0002\u0010\u0005\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0010\b\n\u0002\b\u0004\b\u0000\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\u0010\u0010\b\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000bH\u0016J\b\u0010\f\u001a\u00020\rH\u0016J\b\u0010\b\u001a\u00020\u000eH\u0016J\b\u0010\u000f\u001a\u00020\u000eH\u0016J\u001c\u0010\u0010\u001a\u000e\u0012\u0004\u0012\u00020\u0012\u0012\u0004\u0012\u00020\r0\u00112\u0006\u0010\u0013\u001a\u00020\u0012H\u0002J\u0010\u0010\u0014\u001a\u00020\u00122\u0006\u0010\u0013\u001a\u00020\u0012H\u0002J\b\u0010\u0015\u001a\u00020\u0012H\u0016¨\u0006\u0016"}, d2 = {"Lkotlinx/serialization/json/internal/ReaderJsonLexerWithComments;", "Lkotlinx/serialization/json/internal/ReaderJsonLexer;", "reader", "Lkotlinx/serialization/json/internal/InternalJsonReader;", "buffer", b.f42142b, "<init>", "(Lkotlinx/serialization/json/internal/InternalJsonReader;[C)V", "consumeNextToken", b.f42142b, "expected", b.f42142b, "canConsumeValue", b.f42142b, b.f42142b, "peekNextToken", "handleComment", "Lkotlin/Pair;", b.f42142b, "position", "prefetchWithinThreshold", "skipWhitespaces", "kotlinx-serialization-json"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes5.dex */
public final class ReaderJsonLexerWithComments extends ReaderJsonLexer {
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ReaderJsonLexerWithComments(@NotNull InternalJsonReader reader, @NotNull char[] buffer) {
        super(reader, buffer);
        Intrinsics.g(reader, "reader");
        Intrinsics.g(buffer, "buffer");
    }

    private final Pair<Integer, Boolean> handleComment(int position) {
        int iPrefetchOrEof = position + 2;
        char cCharAt = getSource().charAt(position + 1);
        if (cCharAt != '*') {
            if (cCharAt != '/') {
                return new Pair<>(Integer.valueOf(position), Boolean.FALSE);
            }
            while (position != -1) {
                int iR0 = k.R0('\n', iPrefetchOrEof, 4, getSource());
                if (iR0 != -1) {
                    return new Pair<>(Integer.valueOf(iR0 + 1), Boolean.TRUE);
                }
                iPrefetchOrEof = prefetchOrEof(getSource().length());
                position = iPrefetchOrEof;
            }
            return new Pair<>(-1, Boolean.TRUE);
        }
        boolean z11 = false;
        while (position != -1) {
            int iS0 = k.S0(getSource(), "*/", iPrefetchOrEof, false, 4);
            if (iS0 == -1) {
                if (getSource().charAt(getSource().length() - 1) == '*') {
                    iPrefetchOrEof = prefetchWithinThreshold(getSource().length() - 1);
                    if (z11) {
                        break;
                    }
                    position = iPrefetchOrEof;
                    z11 = true;
                } else {
                    iPrefetchOrEof = prefetchOrEof(getSource().length());
                    position = iPrefetchOrEof;
                }
            } else {
                return new Pair<>(Integer.valueOf(iS0 + 2), Boolean.TRUE);
            }
        }
        this.currentPosition = getSource().length();
        AbstractJsonLexer.fail$default(this, "Expected end of the block comment: \"*/\", but had EOF instead", 0, null, 6, null);
        throw new KotlinNothingValueException();
    }

    private final int prefetchWithinThreshold(int position) {
        if (getSource().length() - position > this.threshold) {
            return position;
        }
        this.currentPosition = position;
        ensureHaveChars();
        return (this.currentPosition != 0 || getSource().length() == 0) ? -1 : 0;
    }

    @Override // kotlinx.serialization.json.internal.ReaderJsonLexer, kotlinx.serialization.json.internal.AbstractJsonLexer
    public boolean canConsumeValue() {
        ensureHaveChars();
        int iSkipWhitespaces = skipWhitespaces();
        if (iSkipWhitespaces >= getSource().length() || iSkipWhitespaces == -1) {
            return false;
        }
        return isValidValueStart(getSource().charAt(iSkipWhitespaces));
    }

    @Override // kotlinx.serialization.json.internal.ReaderJsonLexer, kotlinx.serialization.json.internal.AbstractJsonLexer
    public void consumeNextToken(char expected) {
        ensureHaveChars();
        ArrayAsSequence source = getSource();
        int iSkipWhitespaces = skipWhitespaces();
        if (iSkipWhitespaces >= source.length() || iSkipWhitespaces == -1) {
            this.currentPosition = -1;
            unexpectedToken(expected);
        }
        char cCharAt = source.charAt(iSkipWhitespaces);
        this.currentPosition = iSkipWhitespaces + 1;
        if (cCharAt == expected) {
            return;
        }
        unexpectedToken(expected);
    }

    @Override // kotlinx.serialization.json.internal.AbstractJsonLexer
    public byte peekNextToken() {
        ensureHaveChars();
        ArrayAsSequence source = getSource();
        int iSkipWhitespaces = skipWhitespaces();
        if (iSkipWhitespaces >= source.length() || iSkipWhitespaces == -1) {
            return (byte) 10;
        }
        this.currentPosition = iSkipWhitespaces;
        return AbstractJsonLexerKt.charToTokenClass(source.charAt(iSkipWhitespaces));
    }

    @Override // kotlinx.serialization.json.internal.ReaderJsonLexer, kotlinx.serialization.json.internal.AbstractJsonLexer
    public int skipWhitespaces() {
        int iPrefetchOrEof;
        int i5 = this.currentPosition;
        while (true) {
            iPrefetchOrEof = prefetchOrEof(i5);
            if (iPrefetchOrEof == -1) {
                break;
            }
            char cCharAt = getSource().charAt(iPrefetchOrEof);
            if (cCharAt == ' ' || cCharAt == '\n' || cCharAt == '\r' || cCharAt == '\t') {
                i5 = iPrefetchOrEof + 1;
            } else {
                if (cCharAt != '/' || iPrefetchOrEof + 1 >= getSource().length()) {
                    break;
                }
                Pair<Integer, Boolean> pairHandleComment = handleComment(iPrefetchOrEof);
                int iIntValue = ((Number) pairHandleComment.f71683a).intValue();
                if (!((Boolean) pairHandleComment.f71684b).booleanValue()) {
                    iPrefetchOrEof = iIntValue;
                    break;
                }
                i5 = iIntValue;
            }
        }
        this.currentPosition = iPrefetchOrEof;
        return iPrefetchOrEof;
    }

    @Override // kotlinx.serialization.json.internal.ReaderJsonLexer, kotlinx.serialization.json.internal.AbstractJsonLexer
    public byte consumeNextToken() {
        ensureHaveChars();
        ArrayAsSequence source = getSource();
        int iSkipWhitespaces = skipWhitespaces();
        if (iSkipWhitespaces >= source.length() || iSkipWhitespaces == -1) {
            return (byte) 10;
        }
        this.currentPosition = iSkipWhitespaces + 1;
        return AbstractJsonLexerKt.charToTokenClass(source.charAt(iSkipWhitespaces));
    }
}
