package kotlinx.serialization.internal;

import java.util.Locale;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import r70.k;

@Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0012\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0010\f\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0003\bÀ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u000e\u0010\u0006\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\u0005J\u0010\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\fH\u0002J\u0018\u0010\r\u001a\u00020\u00052\u0006\u0010\u000e\u001a\u00020\u00072\b\b\u0002\u0010\u000f\u001a\u00020\u0010J\u000e\u0010\u0011\u001a\u00020\u00052\u0006\u0010\u0012\u001a\u00020\nR\u000e\u0010\u0004\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000¨\u0006\u0013"}, d2 = {"Lkotlinx/serialization/internal/InternalHexConverter;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "hexCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "parseHexBinary", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "s", "hexToInt", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "ch", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "printHexBinary", "data", "lowerCase", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toHexString", "n", "kotlinx-serialization-core"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes5.dex */
public final class InternalHexConverter {

    @NotNull
    public static final InternalHexConverter INSTANCE = new InternalHexConverter();

    @NotNull
    private static final String hexCode = "0123456789ABCDEF";

    private InternalHexConverter() {
    }

    private final int hexToInt(char ch) {
        if ('0' <= ch && ch < ':') {
            return ch - '0';
        }
        if ('A' <= ch && ch < 'G') {
            return ch - '7';
        }
        if ('a' > ch || ch >= 'g') {
            return -1;
        }
        return ch - 'W';
    }

    public static /* synthetic */ String printHexBinary$default(InternalHexConverter internalHexConverter, byte[] bArr, boolean z11, int i5, Object obj) {
        if ((i5 & 2) != 0) {
            z11 = false;
        }
        return internalHexConverter.printHexBinary(bArr, z11);
    }

    @NotNull
    public final byte[] parseHexBinary(@NotNull String s11) {
        Intrinsics.g(s11, "s");
        int length = s11.length();
        if (length % 2 != 0) {
            throw new IllegalArgumentException("HexBinary string must be even length");
        }
        byte[] bArr = new byte[length / 2];
        for (int i5 = 0; i5 < length; i5 += 2) {
            int iHexToInt = hexToInt(s11.charAt(i5));
            int i11 = i5 + 1;
            int iHexToInt2 = hexToInt(s11.charAt(i11));
            if (iHexToInt == -1 || iHexToInt2 == -1) {
                throw new IllegalArgumentException(("Invalid hex chars: " + s11.charAt(i5) + s11.charAt(i11)).toString());
            }
            bArr[i5 / 2] = (byte) ((iHexToInt << 4) + iHexToInt2);
        }
        return bArr;
    }

    @NotNull
    public final String printHexBinary(@NotNull byte[] data, boolean lowerCase) {
        Intrinsics.g(data, "data");
        StringBuilder sb2 = new StringBuilder(data.length * 2);
        for (byte b11 : data) {
            sb2.append(hexCode.charAt((b11 >> 4) & 15));
            sb2.append(hexCode.charAt(b11 & 15));
        }
        if (!lowerCase) {
            String string = sb2.toString();
            Intrinsics.f(string, "toString(...)");
            return string;
        }
        String string2 = sb2.toString();
        Intrinsics.f(string2, "toString(...)");
        String lowerCase2 = string2.toLowerCase(Locale.ROOT);
        Intrinsics.f(lowerCase2, "toLowerCase(...)");
        return lowerCase2;
    }

    @NotNull
    public final String toHexString(int n) {
        byte[] bArr = new byte[4];
        for (int i5 = 0; i5 < 4; i5++) {
            bArr[i5] = (byte) (n >> (24 - (i5 * 8)));
        }
        String strZ1 = k.z1(printHexBinary(bArr, true), '0');
        if (strZ1.length() <= 0) {
            strZ1 = null;
        }
        return strZ1 == null ? "0" : strZ1;
    }
}
