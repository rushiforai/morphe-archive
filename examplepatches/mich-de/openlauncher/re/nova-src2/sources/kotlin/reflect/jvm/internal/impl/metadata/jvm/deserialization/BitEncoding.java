package kotlin.reflect.jvm.internal.impl.metadata.jvm.deserialization;

import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import com.vungle.ads.internal.protos.Sdk;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes5.dex */
public class BitEncoding {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    private static final boolean FORCE_8TO7_ENCODING;

    private static /* synthetic */ void $$$reportNull$$$0(int i5) {
        String str = (i5 == 1 || i5 == 3 || i5 == 6 || i5 == 8 || i5 == 10 || i5 == 12 || i5 == 14) ? "@NotNull method %s.%s must not return null" : "Argument for @NotNull parameter '%s' of %s.%s must not be null";
        Object[] objArr = new Object[(i5 == 1 || i5 == 3 || i5 == 6 || i5 == 8 || i5 == 10 || i5 == 12 || i5 == 14) ? 2 : 3];
        if (i5 == 1 || i5 == 3 || i5 == 6 || i5 == 8 || i5 == 10 || i5 == 12 || i5 == 14) {
            objArr[0] = "kotlin/reflect/jvm/internal/impl/metadata/jvm/deserialization/BitEncoding";
        } else {
            objArr[0] = "data";
        }
        if (i5 == 1) {
            objArr[1] = "encodeBytes";
        } else if (i5 == 3) {
            objArr[1] = "encode8to7";
        } else if (i5 == 6) {
            objArr[1] = "splitBytesToStringArray";
        } else if (i5 == 8) {
            objArr[1] = "decodeBytes";
        } else if (i5 == 10) {
            objArr[1] = "dropMarker";
        } else if (i5 == 12) {
            objArr[1] = "combineStringArrayIntoBytes";
        } else if (i5 != 14) {
            objArr[1] = "kotlin/reflect/jvm/internal/impl/metadata/jvm/deserialization/BitEncoding";
        } else {
            objArr[1] = "decode7to8";
        }
        switch (i5) {
            case 1:
            case 3:
            case 6:
            case 8:
            case 10:
            case 12:
            case 14:
                break;
            case 2:
                objArr[2] = "encode8to7";
                break;
            case 4:
                objArr[2] = "addModuloByte";
                break;
            case 5:
                objArr[2] = "splitBytesToStringArray";
                break;
            case 7:
                objArr[2] = "decodeBytes";
                break;
            case 9:
                objArr[2] = "dropMarker";
                break;
            case 11:
                objArr[2] = "combineStringArrayIntoBytes";
                break;
            case 13:
                objArr[2] = "decode7to8";
                break;
            default:
                objArr[2] = "encodeBytes";
                break;
        }
        String str2 = String.format(str, objArr);
        if (i5 != 1 && i5 != 3 && i5 != 6 && i5 != 8 && i5 != 10 && i5 != 12 && i5 != 14) {
            throw new IllegalArgumentException(str2);
        }
        throw new IllegalStateException(str2);
    }

    static {
        String property;
        try {
            property = System.getProperty("kotlin.jvm.serialization.use8to7");
        } catch (SecurityException unused) {
            property = null;
        }
        FORCE_8TO7_ENCODING = InneractiveMediationDefs.SHOW_HOUSE_AD_YES.equals(property);
    }

    private BitEncoding() {
    }

    private static void addModuloByte(@NotNull byte[] bArr, int i5) {
        if (bArr == null) {
            $$$reportNull$$$0(4);
        }
        int length = bArr.length;
        for (int i11 = 0; i11 < length; i11++) {
            bArr[i11] = (byte) ((bArr[i11] + i5) & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE);
        }
    }

    @NotNull
    private static byte[] combineStringArrayIntoBytes(@NotNull String[] strArr) {
        if (strArr == null) {
            $$$reportNull$$$0(11);
        }
        int length = 0;
        for (String str : strArr) {
            length += str.length();
        }
        byte[] bArr = new byte[length];
        int i5 = 0;
        for (String str2 : strArr) {
            int length2 = str2.length();
            int i11 = 0;
            while (i11 < length2) {
                bArr[i5] = (byte) str2.charAt(i11);
                i11++;
                i5++;
            }
        }
        return bArr;
    }

    @NotNull
    private static byte[] decode7to8(@NotNull byte[] bArr) {
        if (bArr == null) {
            $$$reportNull$$$0(13);
        }
        int length = (bArr.length * 7) / 8;
        byte[] bArr2 = new byte[length];
        int i5 = 0;
        int i11 = 0;
        for (int i12 = 0; i12 < length; i12++) {
            int i13 = i5 + 1;
            int i14 = i11 + 1;
            bArr2[i12] = (byte) (((bArr[i5] & 255) >>> i11) + ((bArr[i13] & ((1 << i14) - 1)) << (7 - i11)));
            if (i11 == 6) {
                i5 += 2;
                i11 = 0;
            } else {
                i5 = i13;
                i11 = i14;
            }
        }
        return bArr2;
    }

    @NotNull
    public static byte[] decodeBytes(@NotNull String[] strArr) {
        if (strArr == null) {
            $$$reportNull$$$0(7);
        }
        if (strArr.length > 0 && !strArr[0].isEmpty()) {
            char cCharAt = strArr[0].charAt(0);
            if (cCharAt == 0) {
                byte[] bArrStringsToBytes = UtfEncodingKt.stringsToBytes(dropMarker(strArr));
                if (bArrStringsToBytes == null) {
                    $$$reportNull$$$0(8);
                }
                return bArrStringsToBytes;
            }
            if (cCharAt == 65535) {
                strArr = dropMarker(strArr);
            }
        }
        byte[] bArrCombineStringArrayIntoBytes = combineStringArrayIntoBytes(strArr);
        addModuloByte(bArrCombineStringArrayIntoBytes, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE);
        return decode7to8(bArrCombineStringArrayIntoBytes);
    }

    @NotNull
    private static String[] dropMarker(@NotNull String[] strArr) {
        if (strArr == null) {
            $$$reportNull$$$0(9);
        }
        String[] strArr2 = (String[]) strArr.clone();
        strArr2[0] = strArr2[0].substring(1);
        return strArr2;
    }
}
