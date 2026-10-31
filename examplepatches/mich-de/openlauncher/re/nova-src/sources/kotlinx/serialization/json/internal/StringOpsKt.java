package kotlinx.serialization.json.internal;

import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000:\n\u0000\n\u0002\u0010\f\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u0011\n\u0002\u0010\u000e\n\u0002\b\u0006\n\u0002\u0010\u0012\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0002\u001a\u0010\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u0003H\u0002\u001a\u0018\u0010\u0010\u001a\u00020\u0011*\u00060\u0012j\u0002`\u00132\u0006\u0010\u0014\u001a\u00020\u0006H\u0000\u001a\u0013\u0010\u0015\u001a\u0004\u0018\u00010\u0016*\u00020\u0006H\u0000¢\u0006\u0002\u0010\u0017\"&\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u00058\u0006X\u0087\u0004¢\u0006\u0010\n\u0002\u0010\u000b\u0012\u0004\b\u0007\u0010\b\u001a\u0004\b\t\u0010\n\"\u0014\u0010\f\u001a\u00020\rX\u0080\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000f¨\u0006\u0018"}, d2 = {"toHexChar", b.f42142b, "i", b.f42142b, "ESCAPE_STRINGS", b.f42142b, b.f42142b, "getESCAPE_STRINGS$annotations", "()V", "getESCAPE_STRINGS", "()[Ljava/lang/String;", "[Ljava/lang/String;", "ESCAPE_MARKERS", b.f42142b, "getESCAPE_MARKERS", "()[B", "printQuoted", b.f42142b, "Ljava/lang/StringBuilder;", "Lkotlin/text/StringBuilder;", "value", "toBooleanStrictOrNull", b.f42142b, "(Ljava/lang/String;)Ljava/lang/Boolean;", "kotlinx-serialization-json"}, k = 2, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public final class StringOpsKt {

    @NotNull
    private static final byte[] ESCAPE_MARKERS;

    @NotNull
    private static final String[] ESCAPE_STRINGS;

    static {
        String[] strArr = new String[93];
        for (int i5 = 0; i5 < 32; i5++) {
            strArr[i5] = "\\u" + toHexChar(i5 >> 12) + toHexChar(i5 >> 8) + toHexChar(i5 >> 4) + toHexChar(i5);
        }
        strArr[34] = "\\\"";
        strArr[92] = "\\\\";
        strArr[9] = "\\t";
        strArr[8] = "\\b";
        strArr[10] = "\\n";
        strArr[13] = "\\r";
        strArr[12] = "\\f";
        ESCAPE_STRINGS = strArr;
        byte[] bArr = new byte[93];
        for (int i11 = 0; i11 < 32; i11++) {
            bArr[i11] = 1;
        }
        bArr[34] = 34;
        bArr[92] = 92;
        bArr[9] = 116;
        bArr[8] = 98;
        bArr[10] = 110;
        bArr[13] = 114;
        bArr[12] = 102;
        ESCAPE_MARKERS = bArr;
    }

    @NotNull
    public static final byte[] getESCAPE_MARKERS() {
        return ESCAPE_MARKERS;
    }

    @NotNull
    public static final String[] getESCAPE_STRINGS() {
        return ESCAPE_STRINGS;
    }

    @JsonFriendModuleApi
    public static /* synthetic */ void getESCAPE_STRINGS$annotations() {
    }

    public static final void printQuoted(@NotNull StringBuilder sb2, @NotNull String value) {
        Intrinsics.g(sb2, "<this>");
        Intrinsics.g(value, "value");
        sb2.append(AbstractJsonLexerKt.STRING);
        int length = value.length();
        int i5 = 0;
        for (int i11 = 0; i11 < length; i11++) {
            char cCharAt = value.charAt(i11);
            String[] strArr = ESCAPE_STRINGS;
            if (cCharAt < strArr.length && strArr[cCharAt] != null) {
                sb2.append((CharSequence) value, i5, i11);
                sb2.append(strArr[cCharAt]);
                i5 = i11 + 1;
            }
        }
        if (i5 != 0) {
            sb2.append((CharSequence) value, i5, value.length());
        } else {
            sb2.append(value);
        }
        sb2.append(AbstractJsonLexerKt.STRING);
    }

    @Nullable
    public static final Boolean toBooleanStrictOrNull(@NotNull String str) {
        Intrinsics.g(str, "<this>");
        if (str.equalsIgnoreCase(InneractiveMediationDefs.SHOW_HOUSE_AD_YES)) {
            return Boolean.TRUE;
        }
        if (str.equalsIgnoreCase("false")) {
            return Boolean.FALSE;
        }
        return null;
    }

    private static final char toHexChar(int i5) {
        int i11 = i5 & 15;
        return (char) (i11 < 10 ? i11 + 48 : i11 + 87);
    }
}
