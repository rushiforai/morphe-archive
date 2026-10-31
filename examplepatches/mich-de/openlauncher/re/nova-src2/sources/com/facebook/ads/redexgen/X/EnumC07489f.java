package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import java.util.Map;
import javax.annotation.CheckForNull;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* JADX WARN: Enum visitor error
jadx.core.utils.exceptions.JadxRuntimeException: Init of enum field 'A03' uses external variables
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
/* renamed from: com.facebook.ads.redexgen.X.9f, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class EnumC07489f implements InterfaceC1338Wy<Map.Entry<?, ?>, Object> {
    public static byte[] A00;
    public static String[] A01 = {"HCHuPleNCUflGAWX273asrnQ5WX0iPTX", "fRqlvXJfrEXlGsaft5JY2qkM5n7bMX5f", "SWm8DlBTUQtde5yIAMZ", "Jvxqs0ZFrLKEbkG1sUMFaup86V0jKIN1", "yqghIcMlZXIVb3Ps2vAiwo", "t", "PrHmF26nbmCzTjrXJSzVWWIepmxWdbXE", "JLfDGTGfhwqLGSsCWphT01WNRLd3gzY9"};
    public static final /* synthetic */ EnumC07489f[] A02;
    public static final EnumC07489f A03;
    public static final EnumC07489f A04;

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 60);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A00 = new byte[]{89, 87, 75, 101, 114, AbstractJsonLexerKt.TC_INVALID, 102, 118};
    }

    static {
        A02();
        final String strA01 = A01(0, 3, 46);
        final int i5 = 0;
        A03 = new EnumC07489f(strA01, i5) { // from class: com.facebook.ads.redexgen.X.4b
            /* JADX INFO: Access modifiers changed from: private */
            @Override // com.facebook.ads.redexgen.X.InterfaceC1338Wy
            @CheckForNull
            /* renamed from: A00, reason: merged with bridge method [inline-methods] */
            public final Object A4c(Map.Entry<?, ?> entry) {
                return entry.getKey();
            }
        };
        final String strA012 = A01(3, 5, 15);
        final int i11 = 1;
        A04 = new EnumC07489f(strA012, i11) { // from class: com.facebook.ads.redexgen.X.4a
            /* JADX INFO: Access modifiers changed from: private */
            @Override // com.facebook.ads.redexgen.X.InterfaceC1338Wy
            @CheckForNull
            /* renamed from: A00, reason: merged with bridge method [inline-methods] */
            public final Object A4c(Map.Entry<?, ?> entry) {
                return entry.getValue();
            }
        };
        A02 = A03();
    }

    public EnumC07489f(String $enum$name, int $enum$ordinal) {
    }

    public static /* synthetic */ EnumC07489f[] A03() {
        return new EnumC07489f[]{A03, A04};
    }

    public static EnumC07489f valueOf(String name) {
        return (EnumC07489f) Enum.valueOf(EnumC07489f.class, name);
    }

    public static EnumC07489f[] values() {
        EnumC07489f[] enumC07489fArr = (EnumC07489f[]) A02.clone();
        String[] strArr = A01;
        if (strArr[3].charAt(21) == strArr[7].charAt(21)) {
            throw new RuntimeException();
        }
        A01[1] = "jQDhbXYW5JI90aTVr61rTuLW1mpJgxEr";
        return enumC07489fArr;
    }
}
