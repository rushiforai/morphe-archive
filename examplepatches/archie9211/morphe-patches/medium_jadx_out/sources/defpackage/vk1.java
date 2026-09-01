package defpackage;

import com.google.zxing.FormatException;
import com.google.zxing.ReaderException;
import com.medium.android.admin.stagebranch.uG.peNPu;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public enum vk1 {
    Cp437(new int[]{0, 2}, new String[0]),
    ISO8859_1(new int[]{1, 3}, "ISO-8859-1"),
    ISO8859_2(4, "ISO-8859-2"),
    ISO8859_3(5, "ISO-8859-3"),
    ISO8859_4(6, "ISO-8859-4"),
    ISO8859_5(7, "ISO-8859-5"),
    ISO8859_6(8, "ISO-8859-6"),
    ISO8859_7(9, "ISO-8859-7"),
    ISO8859_8(10, "ISO-8859-8"),
    ISO8859_9(11, "ISO-8859-9"),
    ISO8859_10(12, "ISO-8859-10"),
    ISO8859_11(13, "ISO-8859-11"),
    ISO8859_13(15, "ISO-8859-13"),
    ISO8859_14(16, "ISO-8859-14"),
    ISO8859_15(17, "ISO-8859-15"),
    ISO8859_16(18, "ISO-8859-16"),
    SJIS(20, "Shift_JIS"),
    Cp1250(21, peNPu.umOTGq),
    Cp1251(22, "windows-1251"),
    Cp1252(23, "windows-1252"),
    Cp1256(24, "windows-1256"),
    UnicodeBigUnmarked(25, "UTF-16BE", "UnicodeBig"),
    UTF8(26, "UTF-8"),
    ASCII(new int[]{27, 170}, "US-ASCII"),
    Big5(new int[]{28}, new String[0]),
    GB18030(29, "GB2312", "EUC_CN", "GBK"),
    EUC_KR(30, "EUC-KR");

    public static final HashMap c = new HashMap();
    public static final HashMap d = new HashMap();
    public final int[] a;
    public final String[] b;

    vk1(int i, String... strArr) {
        this.a = new int[]{i};
        this.b = strArr;
    }

    public static vk1 getCharacterSetECIByName(String str) {
        return (vk1) d.get(str);
    }

    public static vk1 getCharacterSetECIByValue(int i) throws FormatException {
        if (i >= 0 && i < 900) {
            return (vk1) c.get(Integer.valueOf(i));
        }
        FormatException formatException = FormatException.c;
        if (ReaderException.a) {
            throw new FormatException();
        }
        throw FormatException.c;
    }

    public int getValue() {
        return this.a[0];
    }

    static {
        for (vk1 vk1Var : values()) {
            for (int i : vk1Var.a) {
                c.put(Integer.valueOf(i), vk1Var);
            }
            d.put(vk1Var.name(), vk1Var);
            for (String str : vk1Var.b) {
                d.put(str, vk1Var);
            }
        }
    }

    vk1(int[] iArr, String... strArr) {
        this.a = iArr;
        this.b = strArr;
    }
}
