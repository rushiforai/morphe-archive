package com.facebook.ads.redexgen.X;

import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* JADX WARN: Enum visitor error
jadx.core.utils.exceptions.JadxRuntimeException: Init of enum field 'A05' uses external variables
	at jadx.core.dex.visitors.EnumVisitor.createEnumFieldByConstructor(EnumVisitor.java:451)
	at jadx.core.dex.visitors.EnumVisitor.processEnumFieldByField(EnumVisitor.java:372)
	at jadx.core.dex.visitors.EnumVisitor.processEnumFieldByWrappedInsn(EnumVisitor.java:337)
	at jadx.core.dex.visitors.EnumVisitor.extractEnumFieldsFromFilledArray(EnumVisitor.java:322)
	at jadx.core.dex.visitors.EnumVisitor.extractEnumFieldsFromInsn(EnumVisitor.java:262)
	at jadx.core.dex.visitors.EnumVisitor.extractEnumFieldsFromInvoke(EnumVisitor.java:293)
	at jadx.core.dex.visitors.EnumVisitor.extractEnumFieldsFromInsn(EnumVisitor.java:266)
	at jadx.core.dex.visitors.EnumVisitor.convertToEnum(EnumVisitor.java:151)
	at jadx.core.dex.visitors.EnumVisitor.visit(EnumVisitor.java:100)
 */
/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* renamed from: com.facebook.ads.redexgen.X.fc, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class EnumC1759fc {
    public static byte[] A01;
    public static final /* synthetic */ EnumC1759fc[] A02;
    public static final EnumC1759fc A03;
    public static final EnumC1759fc A04;
    public static final EnumC1759fc A05;
    public final String A00;

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 32);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A01 = new byte[]{24, 23, 18, 27, 1, 14, 12, 27, 29, 31, 29, 22, 27, 3, 1, 28, 11, 10, 12, 3, 1, 22, 16, 18, 16, 27, 22, 119, 101, 98, 118, 105, 101, 119, AbstractJsonLexerKt.TC_INVALID, 112, 114, 101, 99, 97, 99, 104, 101};
    }

    static {
        A02();
        String strA01 = A01(27, 16, 0);
        A05 = new EnumC1759fc(strA01, 0, strA01);
        String strA012 = A01(13, 14, 115);
        A04 = new EnumC1759fc(strA012, 1, strA012);
        String strA013 = A01(0, 13, Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE);
        A03 = new EnumC1759fc(strA013, 2, strA013);
        A02 = A03();
    }

    public EnumC1759fc(String str, int i5, String str2) {
        this.A00 = str2;
    }

    public static EnumC1759fc A00(String str) {
        for (EnumC1759fc enumC1759fc : values()) {
            if (enumC1759fc.A00.equalsIgnoreCase(str)) {
                return enumC1759fc;
            }
        }
        return A03;
    }

    public static /* synthetic */ EnumC1759fc[] A03() {
        return new EnumC1759fc[]{A05, A04, A03};
    }

    public static EnumC1759fc valueOf(String str) {
        return (EnumC1759fc) Enum.valueOf(EnumC1759fc.class, str);
    }

    public static EnumC1759fc[] values() {
        return (EnumC1759fc[]) A02.clone();
    }
}
