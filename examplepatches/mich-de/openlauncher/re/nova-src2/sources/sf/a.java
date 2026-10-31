package sf;

import java.util.regex.Pattern;

/* loaded from: classes3.dex */
public final class a {

    /* renamed from: c, reason: collision with root package name */
    public static final Pattern f87366c = Pattern.compile("\\[voice=\"([^\"]*)\"\\]");

    /* renamed from: d, reason: collision with root package name */
    public static final Pattern f87367d = Pattern.compile("^((?:[0-9]*\\.)?[0-9]+)(px|em|%)$");

    /* renamed from: a, reason: collision with root package name */
    public final com.google.android.gms.internal.consent_sdk.a f87368a = new com.google.android.gms.internal.consent_sdk.a(13, (byte) 0);

    /* renamed from: b, reason: collision with root package name */
    public final StringBuilder f87369b = new StringBuilder();

    public static String a(com.google.android.gms.internal.consent_sdk.a aVar, StringBuilder sb2) {
        boolean z11 = false;
        sb2.setLength(0);
        int i5 = aVar.f31984b;
        int i11 = aVar.f31985c;
        while (i5 < i11 && !z11) {
            char c11 = (char) ((byte[]) aVar.f31986d)[i5];
            if ((c11 < 'A' || c11 > 'Z') && ((c11 < 'a' || c11 > 'z') && !((c11 >= '0' && c11 <= '9') || c11 == '#' || c11 == '-' || c11 == '.' || c11 == '_'))) {
                z11 = true;
            } else {
                i5++;
                sb2.append(c11);
            }
        }
        aVar.Z(i5 - aVar.f31984b);
        return sb2.toString();
    }

    public static String b(com.google.android.gms.internal.consent_sdk.a aVar, StringBuilder sb2) {
        c(aVar);
        if (aVar.g() == 0) {
            return null;
        }
        String strA = a(aVar, sb2);
        if (!com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b.equals(strA)) {
            return strA;
        }
        return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b + ((char) aVar.N());
    }

    public static void c(com.google.android.gms.internal.consent_sdk.a aVar) {
        while (true) {
            for (boolean z11 = true; aVar.g() > 0 && z11; z11 = false) {
                int i5 = aVar.f31984b;
                byte[] bArr = (byte[]) aVar.f31986d;
                byte b11 = bArr[i5];
                char c11 = (char) b11;
                if (c11 == '\t' || c11 == '\n' || c11 == '\f' || c11 == '\r' || c11 == ' ') {
                    aVar.Z(1);
                } else {
                    int i11 = aVar.f31985c;
                    int i12 = i5 + 2;
                    if (i12 <= i11) {
                        int i13 = i5 + 1;
                        if (b11 == 47 && bArr[i13] == 42) {
                            while (true) {
                                int i14 = i12 + 1;
                                if (i14 >= i11) {
                                    break;
                                }
                                if (((char) bArr[i12]) == '*' && ((char) bArr[i14]) == '/') {
                                    i12 += 2;
                                    i11 = i12;
                                } else {
                                    i12 = i14;
                                }
                            }
                            aVar.Z(i11 - aVar.f31984b);
                        }
                    }
                }
            }
            return;
        }
    }
}
