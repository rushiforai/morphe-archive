package xf;

import com.google.android.exoplayer2.ParserException;
import java.util.Collections;
import java.util.List;

/* loaded from: classes3.dex */
public final class d {

    /* renamed from: a, reason: collision with root package name */
    public final List f95779a;

    /* renamed from: b, reason: collision with root package name */
    public final int f95780b;

    /* renamed from: c, reason: collision with root package name */
    public final float f95781c;

    /* renamed from: d, reason: collision with root package name */
    public final String f95782d;

    public d(List list, int i5, float f11, String str) {
        this.f95779a = list;
        this.f95780b = i5;
        this.f95781c = f11;
        this.f95782d = str;
    }

    public static d a(com.google.android.gms.internal.consent_sdk.a aVar) throws ParserException {
        boolean z11;
        int i5;
        try {
            aVar.Z(21);
            int iN = aVar.N() & 3;
            int iN2 = aVar.N();
            int i11 = aVar.f31984b;
            int i12 = 0;
            int i13 = 0;
            int i14 = 0;
            while (true) {
                z11 = true;
                if (i13 >= iN2) {
                    break;
                }
                aVar.Z(1);
                int iS = aVar.S();
                for (int i15 = 0; i15 < iS; i15++) {
                    int iS2 = aVar.S();
                    i14 += iS2 + 4;
                    aVar.Z(iS2);
                }
                i13++;
            }
            aVar.Y(i11);
            byte[] bArr = new byte[i14];
            float f11 = 1.0f;
            String strC = null;
            int i16 = 0;
            int i17 = 0;
            while (i16 < iN2) {
                int iN3 = aVar.N() & 63;
                int iS3 = aVar.S();
                int i18 = i12;
                while (i18 < iS3) {
                    int iS4 = aVar.S();
                    boolean z12 = z11;
                    System.arraycopy(wf.a.f94307d, i12, bArr, i17, 4);
                    int i19 = i17 + 4;
                    System.arraycopy((byte[]) aVar.f31986d, aVar.f31984b, bArr, i19, iS4);
                    if (iN3 == 33 && i18 == 0) {
                        wf.k kVarZ = wf.a.z(i19, i19 + iS4, bArr);
                        float f12 = kVarZ.f94342g;
                        i5 = iN;
                        strC = wf.a.c(kVarZ.f94336a, kVarZ.f94337b, kVarZ.f94338c, kVarZ.f94339d, kVarZ.f94340e, kVarZ.f94341f);
                        f11 = f12;
                    } else {
                        i5 = iN;
                    }
                    i17 = i19 + iS4;
                    aVar.Z(iS4);
                    i18++;
                    z11 = z12;
                    iN = i5;
                    i12 = 0;
                }
                i16++;
                i12 = 0;
            }
            return new d(i14 == 0 ? Collections.EMPTY_LIST : Collections.singletonList(bArr), iN + 1, f11, strC);
        } catch (ArrayIndexOutOfBoundsException e3) {
            throw ParserException.a("Error parsing HEVC config", e3);
        }
    }
}
