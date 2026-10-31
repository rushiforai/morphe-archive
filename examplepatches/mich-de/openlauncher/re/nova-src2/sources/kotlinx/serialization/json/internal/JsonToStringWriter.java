package kotlinx.serialization.json.internal;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Arrays;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0019\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\t\n\u0002\b\u0002\n\u0002\u0010\f\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\r\b\u0000\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003J\u0010\u0010\b\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000bH\u0016J\u0010\u0010\f\u001a\u00020\t2\u0006\u0010\r\u001a\u00020\u000eH\u0016J\u0010\u0010\u000f\u001a\u00020\t2\u0006\u0010\u0010\u001a\u00020\u0011H\u0016J\u0010\u0010\u0012\u001a\u00020\t2\u0006\u0010\u0010\u001a\u00020\u0011H\u0016J \u0010\u0013\u001a\u00020\t2\u0006\u0010\u0014\u001a\u00020\u00072\u0006\u0010\u0015\u001a\u00020\u00072\u0006\u0010\u0016\u001a\u00020\u0011H\u0002J\b\u0010\u0017\u001a\u00020\tH\u0016J\b\u0010\u0018\u001a\u00020\u0011H\u0016J\u0010\u0010\u0019\u001a\u00020\t2\u0006\u0010\u001a\u001a\u00020\u0007H\u0002J\u0018\u0010\u001b\u001a\u00020\u00072\u0006\u0010\u001c\u001a\u00020\u00072\u0006\u0010\u001d\u001a\u00020\u0007H\u0002R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u000e¢\u0006\u0002\n\u0000¨\u0006\u001e"}, d2 = {"Lkotlinx/serialization/json/internal/JsonToStringWriter;", "Lkotlinx/serialization/json/internal/InternalJsonWriter;", "<init>", "()V", "array", b.f42142b, "size", b.f42142b, "writeLong", b.f42142b, "value", b.f42142b, "writeChar", "char", b.f42142b, "write", "text", b.f42142b, "writeQuoted", "appendStringSlowPath", "firstEscapedChar", "currentSize", "string", "release", "toString", "ensureAdditionalCapacity", "expected", "ensureTotalCapacity", "oldSize", "additional", "kotlinx-serialization-json"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public final class JsonToStringWriter implements InternalJsonWriter {

    @NotNull
    private char[] array = CharArrayPool.INSTANCE.take();
    private int size;

    private final void appendStringSlowPath(int firstEscapedChar, int currentSize, String string) {
        byte b11;
        int length = string.length();
        while (firstEscapedChar < length) {
            int iEnsureTotalCapacity = ensureTotalCapacity(currentSize, 2);
            char cCharAt = string.charAt(firstEscapedChar);
            if (cCharAt >= StringOpsKt.getESCAPE_MARKERS().length || (b11 = StringOpsKt.getESCAPE_MARKERS()[cCharAt]) == 0) {
                int i5 = iEnsureTotalCapacity + 1;
                this.array[iEnsureTotalCapacity] = cCharAt;
                currentSize = i5;
                firstEscapedChar++;
            } else {
                if (b11 == 1) {
                    String str = StringOpsKt.getESCAPE_STRINGS()[cCharAt];
                    Intrinsics.d(str);
                    int iEnsureTotalCapacity2 = ensureTotalCapacity(iEnsureTotalCapacity, str.length());
                    str.getChars(0, str.length(), this.array, iEnsureTotalCapacity2);
                    int length2 = str.length() + iEnsureTotalCapacity2;
                    this.size = length2;
                    currentSize = length2;
                } else {
                    char[] cArr = this.array;
                    cArr[iEnsureTotalCapacity] = AbstractJsonLexerKt.STRING_ESC;
                    cArr[iEnsureTotalCapacity + 1] = (char) b11;
                    currentSize = iEnsureTotalCapacity + 2;
                    this.size = currentSize;
                }
                firstEscapedChar++;
            }
        }
        int iEnsureTotalCapacity3 = ensureTotalCapacity(currentSize, 1);
        this.array[iEnsureTotalCapacity3] = AbstractJsonLexerKt.STRING;
        this.size = iEnsureTotalCapacity3 + 1;
    }

    private final void ensureAdditionalCapacity(int expected) {
        ensureTotalCapacity(this.size, expected);
    }

    private final int ensureTotalCapacity(int oldSize, int additional) {
        int i5 = additional + oldSize;
        char[] cArr = this.array;
        if (cArr.length <= i5) {
            int i11 = oldSize * 2;
            if (i5 < i11) {
                i5 = i11;
            }
            char[] cArrCopyOf = Arrays.copyOf(cArr, i5);
            Intrinsics.f(cArrCopyOf, "copyOf(...)");
            this.array = cArrCopyOf;
        }
        return oldSize;
    }

    @Override // kotlinx.serialization.json.internal.InternalJsonWriter
    public void release() {
        CharArrayPool.INSTANCE.release(this.array);
    }

    @NotNull
    public String toString() {
        return new String(this.array, 0, this.size);
    }

    @Override // kotlinx.serialization.json.internal.InternalJsonWriter
    public void write(@NotNull String text) {
        Intrinsics.g(text, "text");
        int length = text.length();
        if (length == 0) {
            return;
        }
        ensureAdditionalCapacity(length);
        text.getChars(0, text.length(), this.array, this.size);
        this.size += length;
    }

    @Override // kotlinx.serialization.json.internal.InternalJsonWriter
    public void writeChar(char c11) {
        ensureAdditionalCapacity(1);
        char[] cArr = this.array;
        int i5 = this.size;
        this.size = i5 + 1;
        cArr[i5] = c11;
    }

    @Override // kotlinx.serialization.json.internal.InternalJsonWriter
    public void writeLong(long value) {
        write(String.valueOf(value));
    }

    @Override // kotlinx.serialization.json.internal.InternalJsonWriter
    public void writeQuoted(@NotNull String text) {
        Intrinsics.g(text, "text");
        ensureAdditionalCapacity(text.length() + 2);
        char[] cArr = this.array;
        int i5 = this.size;
        int i11 = i5 + 1;
        cArr[i5] = AbstractJsonLexerKt.STRING;
        int length = text.length();
        text.getChars(0, length, cArr, i11);
        int i12 = length + i11;
        for (int i13 = i11; i13 < i12; i13++) {
            char c11 = cArr[i13];
            if (c11 < StringOpsKt.getESCAPE_MARKERS().length && StringOpsKt.getESCAPE_MARKERS()[c11] != 0) {
                appendStringSlowPath(i13 - i11, i13, text);
                return;
            }
        }
        cArr[i12] = AbstractJsonLexerKt.STRING;
        this.size = i12 + 1;
    }
}
