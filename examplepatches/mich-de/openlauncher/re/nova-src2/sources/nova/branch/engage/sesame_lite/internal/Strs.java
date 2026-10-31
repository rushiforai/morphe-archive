package nova.branch.engage.sesame_lite.internal;

import android.content.Intent;
import b.c0;
import java.nio.ByteBuffer;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.Locale;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000`\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\t\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\u0012\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u0005\n\u0000\n\u0002\u0010\u0019\n\u0002\b\u000b\n\u0002\u0010\u0015\n\u0002\b\u0002\n\u0002\u0010\u0011\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0002\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0012\u0010\u0006\u001a\u0004\u0018\u00010\u00052\b\u0010\u0007\u001a\u0004\u0018\u00010\bJ\u0012\u0010\t\u001a\u0004\u0018\u00010\b2\b\u0010\n\u001a\u0004\u0018\u00010\u0005J\u000e\u0010\u000b\u001a\u00020\u00052\u0006\u0010\f\u001a\u00020\rJ\u000e\u0010\u000e\u001a\u00020\u00052\u0006\u0010\u000f\u001a\u00020\u0005J\u0010\u0010\u0012\u001a\u0004\u0018\u00010\u00052\u0006\u0010\u0013\u001a\u00020\rJ\u0010\u0010\u0014\u001a\u00020\u00052\b\u0010\u0015\u001a\u0004\u0018\u00010\u0016J\u000e\u0010\u0014\u001a\u00020\u00052\u0006\u0010\u0017\u001a\u00020\rJ\u000e\u0010\u0014\u001a\u00020\u00052\u0006\u0010\u0018\u001a\u00020\u0019J\u000e\u0010\u0014\u001a\u00020\u00052\u0006\u0010\u001a\u001a\u00020\u001bJ\u000e\u0010\u001e\u001a\u00020\u00052\u0006\u0010\u001f\u001a\u00020\u0019J\u000e\u0010\u001e\u001a\u00020\u00052\u0006\u0010 \u001a\u00020\u001bJ\u000e\u0010\u001e\u001a\u00020\u00052\u0006\u0010\u001f\u001a\u00020\u0016J\u000e\u0010!\u001a\u00020\u00052\u0006\u0010\f\u001a\u00020\rJ\u000e\u0010\"\u001a\u00020\u00052\u0006\u0010#\u001a\u00020\rJ \u0010$\u001a\u00020\u00192\u0006\u0010%\u001a\u00020\u00052\u0006\u0010&\u001a\u00020\u00052\b\b\u0002\u0010'\u001a\u00020\u0019J\u000e\u0010(\u001a\u00020)2\u0006\u0010*\u001a\u00020\u0005J#\u0010+\u001a\b\u0012\u0004\u0012\u00020\u00050,2\u0006\u0010-\u001a\u00020\u00052\b\b\u0002\u0010.\u001a\u00020/¢\u0006\u0002\u00100R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0010\u001a\u00020\u0011X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u001c\u001a\u00020\u001dX\u0082\u0004¢\u0006\u0002\n\u0000¨\u00061"}, d2 = {"Lnova/branch/engage/sesame_lite/internal/Strs;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "TAG", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toIntentUri", "intent", "Landroid/content/Intent;", "fromIntentUri", "uri", "nanosToMillis", "nanos", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "removeMimeCategory", "mimeType", "format", "Ljava/text/SimpleDateFormat;", "formatTimestamp", "timestamp", "toHexStr", "src", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "l", "i", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "b", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "DIGITS_LOWER", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "encodeHex", "data", "datum", "formatDuration", "formatMegabytes", "bytes", "indexOfIgnoreCase", "haystack", "needle", "startIndex", "getCodePoints", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "s", "parseCols", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "line", "trim", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "(Ljava/lang/String;Z)[Ljava/lang/String;", "sesame-lite_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes.dex */
public final class Strs {

    @NotNull
    private static final String TAG = "SSML-Strs";

    @NotNull
    public static final Strs INSTANCE = new Strs();

    @NotNull
    private static final SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS", Locale.US);

    @NotNull
    private static final char[] DIGITS_LOWER = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};

    private Strs() {
    }

    public static /* synthetic */ int indexOfIgnoreCase$default(Strs strs, String str, String str2, int i5, int i11, Object obj) {
        if ((i11 & 4) != 0) {
            i5 = 0;
        }
        return strs.indexOfIgnoreCase(str, str2, i5);
    }

    public static /* synthetic */ String[] parseCols$default(Strs strs, String str, boolean z11, int i5, Object obj) {
        if ((i5 & 2) != 0) {
            z11 = false;
        }
        return strs.parseCols(str, z11);
    }

    @NotNull
    public final String encodeHex(int data) {
        byte[] bArrArray = ByteBuffer.allocate(4).putInt(data).array();
        Intrinsics.f(bArrArray, "array(...)");
        return encodeHex(bArrArray);
    }

    @NotNull
    public final String formatDuration(long nanos) {
        return String.format(Locale.US, "%.3fms", Arrays.copyOf(new Object[]{Double.valueOf(nanos / 1000000.0d)}, 1));
    }

    @NotNull
    public final String formatMegabytes(long bytes) {
        return String.format(Locale.US, "%.2fMB", Arrays.copyOf(new Object[]{Double.valueOf(bytes / 1048576.0d)}, 1));
    }

    @Nullable
    public final String formatTimestamp(long timestamp) {
        try {
            return format.format(new Date(timestamp));
        } catch (Throwable unused) {
            return null;
        }
    }

    @Nullable
    public final Intent fromIntentUri(@Nullable String uri) {
        if (uri == null || uri.length() == 0) {
            return null;
        }
        return Intent.parseUri(uri, 4);
    }

    @NotNull
    public final int[] getCodePoints(@NotNull String s11) {
        Intrinsics.g(s11, "s");
        int iCharCount = 0;
        int iCodePointCount = s11.codePointCount(0, s11.length());
        int[] iArr = new int[iCodePointCount];
        while (iCharCount < iCodePointCount) {
            int iCodePointAt = s11.codePointAt(iCharCount);
            iArr[iCharCount] = iCodePointAt;
            iCharCount += Character.charCount(iCodePointAt);
        }
        return iArr;
    }

    public final int indexOfIgnoreCase(@NotNull String haystack, @NotNull String needle, int startIndex) {
        Intrinsics.g(haystack, "haystack");
        Intrinsics.g(needle, "needle");
        if (haystack.length() == 0 || needle.length() == 0) {
            return r70.k.S0(haystack, needle, startIndex, false, 4);
        }
        int length = haystack.length();
        while (startIndex < length && needle.length() + startIndex <= haystack.length()) {
            int i5 = 0;
            for (int i11 = startIndex; i11 < haystack.length() && i5 < needle.length() && Character.toLowerCase(haystack.charAt(i11)) == Character.toLowerCase(needle.charAt(i5)); i11++) {
                i5++;
            }
            if (i5 == needle.length()) {
                return startIndex;
            }
            startIndex++;
        }
        return -1;
    }

    @NotNull
    public final String nanosToMillis(long nanos) {
        return String.format(Locale.US, "%.3f", Arrays.copyOf(new Object[]{Double.valueOf(nanos / 1000000.0d)}, 1)).concat("ms");
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r1v0, types: [java.lang.CharSequence, java.lang.StringBuilder] */
    /* JADX WARN: Type inference failed for: r1v2, types: [java.lang.CharSequence] */
    @NotNull
    public final String[] parseCols(@NotNull String line, boolean trim) {
        Intrinsics.g(line, "line");
        ArrayList arrayList = new ArrayList();
        Object sb2 = new StringBuilder();
        int i5 = -1;
        boolean z11 = false;
        while (i5 < r70.k.O0(line)) {
            int i11 = i5 + 1;
            if (line.charAt(i11) == '\"') {
                if (i11 == 0) {
                    i5 = i11;
                    z11 = true;
                } else {
                    boolean z12 = z11 && line.charAt(i5) == '\\';
                    boolean z13 = z11 && i11 < r70.k.O0(line) && line.charAt(i5 + 2) == '\"';
                    if (z12 || z13) {
                        sb2.append(line.charAt(i11));
                        i5 = z13 ? i5 + 2 : i11;
                        Unit unit = Unit.f71706a;
                    } else {
                        z11 = !z11;
                    }
                }
            } else if (z11 || line.charAt(i11) != ',') {
                sb2.append(line.charAt(i11));
            } else {
                arrayList.add((trim ? r70.k.u1(sb2) : sb2).toString());
                sb2.setLength(0);
            }
            i5 = i11;
        }
        if (trim) {
            sb2 = r70.k.u1(sb2);
        }
        arrayList.add(sb2.toString());
        return (String[]) arrayList.toArray(new String[0]);
    }

    @NotNull
    public final String removeMimeCategory(@NotNull String mimeType) {
        Intrinsics.g(mimeType, "mimeType");
        return r70.k.l1('/', mimeType, mimeType);
    }

    @NotNull
    public final String toHexStr(@Nullable byte[] src) {
        return src == null ? AbstractJsonLexerKt.NULL : c0.k("0x", encodeHex(src));
    }

    @Nullable
    public final String toIntentUri(@Nullable Intent intent) {
        if (intent != null) {
            return intent.toUri(1);
        }
        return null;
    }

    @NotNull
    public final String encodeHex(byte datum) {
        byte[] bArrArray = ByteBuffer.allocate(1).put(datum).array();
        Intrinsics.f(bArrArray, "array(...)");
        return encodeHex(bArrArray);
    }

    @NotNull
    public final String encodeHex(@NotNull byte[] data) {
        Intrinsics.g(data, "data");
        char[] cArr = new char[data.length << 1];
        int i5 = 0;
        for (byte b11 : data) {
            int i11 = i5 + 1;
            char[] cArr2 = DIGITS_LOWER;
            cArr[i5] = cArr2[(b11 & 240) >>> 4];
            i5 += 2;
            cArr[i11] = cArr2[b11 & 15];
        }
        return new String(cArr);
    }

    @NotNull
    public final String toHexStr(long l9) {
        return toHexStr(ByteBuffer.allocate(8).putLong(l9).array());
    }

    @NotNull
    public final String toHexStr(int i5) {
        return toHexStr(ByteBuffer.allocate(4).putInt(i5).array());
    }

    @NotNull
    public final String toHexStr(byte b11) {
        return toHexStr(ByteBuffer.allocate(1).put(b11).array());
    }
}
