package kotlinx.serialization.json.internal;

import b.c0;
import b.u4;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Arrays;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000B\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0012\n\u0000\n\u0002\u0010\u0019\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\t\n\u0002\b\u0002\n\u0002\u0010\f\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0012\b\u0000\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u0010\u0010\f\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\u000fH\u0016J\u0010\u0010\u0010\u001a\u00020\r2\u0006\u0010\u0011\u001a\u00020\u0012H\u0016J\u0010\u0010\u0013\u001a\u00020\r2\u0006\u0010\u0014\u001a\u00020\u0015H\u0016J\u0010\u0010\u0016\u001a\u00020\r2\u0006\u0010\u0014\u001a\u00020\u0015H\u0016J\u0018\u0010\u0017\u001a\u00020\r2\u0006\u0010\u0018\u001a\u00020\u000b2\u0006\u0010\u0019\u001a\u00020\u0015H\u0002J\u0018\u0010\u001a\u001a\u00020\u000b2\u0006\u0010\u001b\u001a\u00020\u000b2\u0006\u0010\u001c\u001a\u00020\u000bH\u0002J\b\u0010\u001d\u001a\u00020\rH\u0016J\b\u0010\u001e\u001a\u00020\rH\u0002J\u0011\u0010\u001f\u001a\u00020\r2\u0006\u0010 \u001a\u00020\u000bH\u0082\bJ\u0011\u0010\u0013\u001a\u00020\r2\u0006\u0010!\u001a\u00020\u000bH\u0082\bJ\t\u0010\"\u001a\u00020\u000bH\u0082\bJ\u0018\u0010#\u001a\u00020\r2\u0006\u0010\u0019\u001a\u00020\t2\u0006\u0010$\u001a\u00020\u000bH\u0002J\u0010\u0010%\u001a\u00020\r2\u0006\u0010&\u001a\u00020\u000bH\u0002R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\b\u001a\u00020\tX\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u000bX\u0082\u000e¢\u0006\u0002\n\u0000¨\u0006'"}, d2 = {"Lkotlinx/serialization/json/internal/JsonToJavaStreamWriter;", "Lkotlinx/serialization/json/internal/InternalJsonWriter;", "stream", "Ljava/io/OutputStream;", "<init>", "(Ljava/io/OutputStream;)V", "buffer", b.f42142b, "charArray", b.f42142b, "indexInBuffer", b.f42142b, "writeLong", b.f42142b, "value", b.f42142b, "writeChar", "char", b.f42142b, "write", "text", b.f42142b, "writeQuoted", "appendStringSlowPath", "currentSize", "string", "ensureTotalCapacity", "oldSize", "additional", "release", "flush", "ensure", "bytesCount", "byte", "rest", "writeUtf8", "count", "writeUtf8CodePoint", "codePoint", "kotlinx-serialization-json"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes5.dex */
public final class JsonToJavaStreamWriter implements InternalJsonWriter {

    @NotNull
    private final byte[] buffer;

    @NotNull
    private char[] charArray;
    private int indexInBuffer;

    @NotNull
    private final OutputStream stream;

    public JsonToJavaStreamWriter(@NotNull OutputStream stream) {
        Intrinsics.g(stream, "stream");
        this.stream = stream;
        this.buffer = ByteArrayPool.INSTANCE.take();
        this.charArray = CharArrayPool.INSTANCE.take();
    }

    private final void appendStringSlowPath(int currentSize, String string) throws IOException {
        byte b11;
        int length = string.length();
        for (int i5 = currentSize - 1; i5 < length; i5++) {
            int iEnsureTotalCapacity = ensureTotalCapacity(currentSize, 2);
            char cCharAt = string.charAt(i5);
            if (cCharAt >= StringOpsKt.getESCAPE_MARKERS().length || (b11 = StringOpsKt.getESCAPE_MARKERS()[cCharAt]) == 0) {
                int i11 = iEnsureTotalCapacity + 1;
                this.charArray[iEnsureTotalCapacity] = cCharAt;
                currentSize = i11;
            } else {
                if (b11 == 1) {
                    String str = StringOpsKt.getESCAPE_STRINGS()[cCharAt];
                    Intrinsics.d(str);
                    int iEnsureTotalCapacity2 = ensureTotalCapacity(iEnsureTotalCapacity, str.length());
                    str.getChars(0, str.length(), this.charArray, iEnsureTotalCapacity2);
                    currentSize = str.length() + iEnsureTotalCapacity2;
                } else {
                    char[] cArr = this.charArray;
                    cArr[iEnsureTotalCapacity] = AbstractJsonLexerKt.STRING_ESC;
                    cArr[iEnsureTotalCapacity + 1] = (char) b11;
                    currentSize = iEnsureTotalCapacity + 2;
                }
            }
        }
        ensureTotalCapacity(currentSize, 1);
        char[] cArr2 = this.charArray;
        cArr2[currentSize] = AbstractJsonLexerKt.STRING;
        writeUtf8(cArr2, currentSize + 1);
        flush();
    }

    private final void ensure(int bytesCount) throws IOException {
        if (this.buffer.length - this.indexInBuffer < bytesCount) {
            flush();
        }
    }

    private final int ensureTotalCapacity(int oldSize, int additional) {
        int i5 = additional + oldSize;
        char[] cArr = this.charArray;
        if (cArr.length <= i5) {
            int i11 = oldSize * 2;
            if (i5 < i11) {
                i5 = i11;
            }
            char[] cArrCopyOf = Arrays.copyOf(cArr, i5);
            Intrinsics.f(cArrCopyOf, "copyOf(...)");
            this.charArray = cArrCopyOf;
        }
        return oldSize;
    }

    private final void flush() throws IOException {
        this.stream.write(this.buffer, 0, this.indexInBuffer);
        this.indexInBuffer = 0;
    }

    private final int rest() {
        return this.buffer.length - this.indexInBuffer;
    }

    private final void writeUtf8(char[] string, int count) throws IOException {
        if (count < 0) {
            throw new IllegalArgumentException("count < 0");
        }
        if (count > string.length) {
            StringBuilder sbJ = u4.j(count, "count > string.length: ", " > ");
            sbJ.append(string.length);
            throw new IllegalArgumentException(sbJ.toString().toString());
        }
        int i5 = 0;
        while (i5 < count) {
            char c11 = string[i5];
            if (c11 < 128) {
                if (this.buffer.length - this.indexInBuffer < 1) {
                    flush();
                }
                byte[] bArr = this.buffer;
                int i11 = this.indexInBuffer;
                int i12 = i11 + 1;
                this.indexInBuffer = i12;
                bArr[i11] = (byte) c11;
                i5++;
                int iMin = Math.min(count, (bArr.length - i12) + i5);
                while (i5 < iMin) {
                    char c12 = string[i5];
                    if (c12 < 128) {
                        byte[] bArr2 = this.buffer;
                        int i13 = this.indexInBuffer;
                        this.indexInBuffer = i13 + 1;
                        bArr2[i13] = (byte) c12;
                        i5++;
                    }
                }
            } else {
                if (c11 < 2048) {
                    if (this.buffer.length - this.indexInBuffer < 2) {
                        flush();
                    }
                    byte[] bArr3 = this.buffer;
                    int i14 = this.indexInBuffer;
                    int i15 = i14 + 1;
                    this.indexInBuffer = i15;
                    bArr3[i14] = (byte) ((c11 >> 6) | 192);
                    this.indexInBuffer = i14 + 2;
                    bArr3[i15] = (byte) ((c11 & '?') | 128);
                } else if (c11 < 55296 || c11 > 57343) {
                    if (this.buffer.length - this.indexInBuffer < 3) {
                        flush();
                    }
                    int i16 = (c11 >> '\f') | Sdk.SDKError.Reason.AD_LOAD_FAIL_EMPTY_BID_PAYLOAD_VALUE;
                    byte[] bArr4 = this.buffer;
                    int i17 = this.indexInBuffer;
                    int i18 = i17 + 1;
                    this.indexInBuffer = i18;
                    bArr4[i17] = (byte) i16;
                    int i19 = i17 + 2;
                    this.indexInBuffer = i19;
                    bArr4[i18] = (byte) (((c11 >> 6) & 63) | 128);
                    this.indexInBuffer = i17 + 3;
                    bArr4[i19] = (byte) ((c11 & '?') | 128);
                } else {
                    int i21 = i5 + 1;
                    char c13 = i21 < count ? string[i21] : (char) 0;
                    if (c11 > 56319 || 56320 > c13 || c13 >= 57344) {
                        if (this.buffer.length - this.indexInBuffer < 1) {
                            flush();
                        }
                        byte[] bArr5 = this.buffer;
                        int i22 = this.indexInBuffer;
                        this.indexInBuffer = i22 + 1;
                        bArr5[i22] = (byte) 63;
                        i5 = i21;
                    } else {
                        int i23 = (((c11 & 1023) << 10) | (c13 & 1023)) + SQLiteDatabase.OPEN_FULLMUTEX;
                        if (this.buffer.length - this.indexInBuffer < 4) {
                            flush();
                        }
                        byte[] bArr6 = this.buffer;
                        int i24 = this.indexInBuffer;
                        int i25 = i24 + 1;
                        this.indexInBuffer = i25;
                        bArr6[i24] = (byte) ((i23 >> 18) | 240);
                        int i26 = i24 + 2;
                        this.indexInBuffer = i26;
                        bArr6[i25] = (byte) (((i23 >> 12) & 63) | 128);
                        int i27 = i24 + 3;
                        this.indexInBuffer = i27;
                        bArr6[i26] = (byte) (((i23 >> 6) & 63) | 128);
                        this.indexInBuffer = i24 + 4;
                        bArr6[i27] = (byte) ((i23 & 63) | 128);
                        i5 += 2;
                    }
                }
                i5++;
            }
        }
    }

    private final void writeUtf8CodePoint(int codePoint) throws IOException {
        if (codePoint < 128) {
            if (this.buffer.length - this.indexInBuffer < 1) {
                flush();
            }
            byte[] bArr = this.buffer;
            int i5 = this.indexInBuffer;
            this.indexInBuffer = i5 + 1;
            bArr[i5] = (byte) codePoint;
            return;
        }
        if (codePoint < 2048) {
            if (this.buffer.length - this.indexInBuffer < 2) {
                flush();
            }
            byte[] bArr2 = this.buffer;
            int i11 = this.indexInBuffer;
            int i12 = i11 + 1;
            this.indexInBuffer = i12;
            bArr2[i11] = (byte) ((codePoint >> 6) | 192);
            this.indexInBuffer = i11 + 2;
            bArr2[i12] = (byte) ((codePoint & 63) | 128);
            return;
        }
        if (55296 <= codePoint && codePoint < 57344) {
            if (this.buffer.length - this.indexInBuffer < 1) {
                flush();
            }
            byte[] bArr3 = this.buffer;
            int i13 = this.indexInBuffer;
            this.indexInBuffer = i13 + 1;
            bArr3[i13] = (byte) 63;
            return;
        }
        if (codePoint < 65536) {
            if (this.buffer.length - this.indexInBuffer < 3) {
                flush();
            }
            int i14 = (codePoint >> 12) | Sdk.SDKError.Reason.AD_LOAD_FAIL_EMPTY_BID_PAYLOAD_VALUE;
            byte[] bArr4 = this.buffer;
            int i15 = this.indexInBuffer;
            int i16 = i15 + 1;
            this.indexInBuffer = i16;
            bArr4[i15] = (byte) i14;
            int i17 = i15 + 2;
            this.indexInBuffer = i17;
            bArr4[i16] = (byte) (((codePoint >> 6) & 63) | 128);
            this.indexInBuffer = i15 + 3;
            bArr4[i17] = (byte) ((codePoint & 63) | 128);
            return;
        }
        if (codePoint > 1114111) {
            throw new JsonEncodingException(c0.h(codePoint, "Unexpected code point: "));
        }
        if (this.buffer.length - this.indexInBuffer < 4) {
            flush();
        }
        byte[] bArr5 = this.buffer;
        int i18 = this.indexInBuffer;
        int i19 = i18 + 1;
        this.indexInBuffer = i19;
        bArr5[i18] = (byte) ((codePoint >> 18) | 240);
        int i21 = i18 + 2;
        this.indexInBuffer = i21;
        bArr5[i19] = (byte) (((codePoint >> 12) & 63) | 128);
        int i22 = i18 + 3;
        this.indexInBuffer = i22;
        bArr5[i21] = (byte) (((codePoint >> 6) & 63) | 128);
        this.indexInBuffer = i18 + 4;
        bArr5[i22] = (byte) ((codePoint & 63) | 128);
    }

    @Override // kotlinx.serialization.json.internal.InternalJsonWriter
    public void release() throws IOException {
        flush();
        CharArrayPool.INSTANCE.release(this.charArray);
        ByteArrayPool.INSTANCE.release(this.buffer);
    }

    @Override // kotlinx.serialization.json.internal.InternalJsonWriter
    public void write(@NotNull String text) throws IOException {
        Intrinsics.g(text, "text");
        int length = text.length();
        ensureTotalCapacity(0, length);
        text.getChars(0, length, this.charArray, 0);
        writeUtf8(this.charArray, length);
    }

    @Override // kotlinx.serialization.json.internal.InternalJsonWriter
    public void writeChar(char c11) throws IOException {
        writeUtf8CodePoint(c11);
    }

    @Override // kotlinx.serialization.json.internal.InternalJsonWriter
    public void writeLong(long value) throws IOException {
        write(String.valueOf(value));
    }

    @Override // kotlinx.serialization.json.internal.InternalJsonWriter
    public void writeQuoted(@NotNull String text) throws IOException {
        Intrinsics.g(text, "text");
        ensureTotalCapacity(0, text.length() + 2);
        char[] cArr = this.charArray;
        cArr[0] = AbstractJsonLexerKt.STRING;
        int length = text.length();
        text.getChars(0, length, cArr, 1);
        int i5 = length + 1;
        for (int i11 = 1; i11 < i5; i11++) {
            char c11 = cArr[i11];
            if (c11 < StringOpsKt.getESCAPE_MARKERS().length && StringOpsKt.getESCAPE_MARKERS()[c11] != 0) {
                appendStringSlowPath(i11, text);
                return;
            }
        }
        cArr[i5] = AbstractJsonLexerKt.STRING;
        writeUtf8(cArr, length + 2);
        flush();
    }

    private final void write(int i5) {
        byte[] bArr = this.buffer;
        int i11 = this.indexInBuffer;
        this.indexInBuffer = i11 + 1;
        bArr[i11] = (byte) i5;
    }
}
