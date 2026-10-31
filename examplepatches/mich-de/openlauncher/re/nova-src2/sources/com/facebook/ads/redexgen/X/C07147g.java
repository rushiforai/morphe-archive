package com.facebook.ads.redexgen.X;

import android.text.TextUtils;
import java.io.Serializable;
import java.util.Arrays;
import java.util.List;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.json.JSONObject;

/* renamed from: com.facebook.ads.redexgen.X.7g, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C07147g extends LA implements Serializable {
    public static byte[] A00 = null;
    public static String[] A01 = {"lNfLNH12lo092G91EOzeY1GmrD7sd3LT", "IfriMLumcJB6cDz8CdV53z8mw", "VqAXCxmiQObdbt99qEtF0Khtp", "Er74lg0w9IOdrBN2LYFe3VajafM65LKV", "PApxnlfYZYjRi2lMOUBi6X3WbwZz37rL", "HRTNeezFOCXWn2GXnxOdBfrunSk2O2aN", "VET24gqvkOE8n1LMNVzexbAvR8qySpIp", "2OknKa0ZFArae7oBhfBaswv35Z02O68Z"};
    public static final long serialVersionUID = 2751287062553772011L;

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 1);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A00 = new byte[]{123, 108, 126, 104, 123, 109, 108, 109, 86, AbstractJsonLexerKt.TC_INVALID, 96, 109, 108, 102};
    }

    static {
        A02();
    }

    public C07147g(List<C1735fE> list) {
        super(list);
    }

    public static C07147g A00(JSONObject jSONObject, C0958Hi c0958Hi) {
        C07147g c07147g = new C07147g(LA.A07(jSONObject, c0958Hi, new C1044Kt()));
        c07147g.A3B(jSONObject);
        c07147g.A23(A01(0, 14, 8));
        return c07147g;
    }

    private final boolean A03() {
        C1738fH c1738fHA0I = A32().A0I();
        return TextUtils.isEmpty(c1738fHA0I.A09()) && c1738fHA0I.A07() == null && !TextUtils.isEmpty(c1738fHA0I.A08());
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x006a  */
    @Override // com.facebook.ads.redexgen.X.AbstractC1734fD
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final int A1L() {
        if (A2G()) {
            String[] strArr = A01;
            if (strArr[2].length() != strArr[1].length()) {
                throw new RuntimeException();
            }
            A01[3] = "Avc54I4RohpfVXuEjhFSHVQISVBIYsCd";
            return 3;
        }
        if (A03()) {
            return 5;
        }
        if (A32().A0I().A07() != null) {
            C1735fE c1735fEA32 = A32();
            if (A01[7].charAt(13) != 'i') {
                String[] strArr2 = A01;
                strArr2[2] = "LUMoyJG2KoRy6RtYfUfQOcun1";
                strArr2[1] = "H1zEIWfauAFdFHrLQfBWpGGFr";
                if (!c1735fEA32.A0I().A07().A0h()) {
                    if (!A2Z()) {
                        return 1;
                    }
                }
            } else if (!c1735fEA32.A0I().A07().A0h()) {
            }
            return 4;
        }
        return 0;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1734fD
    public final int A1M() {
        return A32().A0I().A05();
    }
}
