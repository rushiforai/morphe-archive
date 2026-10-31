package ib;

import com.google.android.exoplayer2.ParserException;
import java.util.ArrayList;
import wf.m;

/* loaded from: classes2.dex */
public final class e {

    /* renamed from: a, reason: collision with root package name */
    public int f61500a;

    /* renamed from: b, reason: collision with root package name */
    public int f61501b;

    /* renamed from: c, reason: collision with root package name */
    public int f61502c;

    /* renamed from: d, reason: collision with root package name */
    public float f61503d;

    /* renamed from: e, reason: collision with root package name */
    public Object f61504e;

    /* renamed from: f, reason: collision with root package name */
    public Object f61505f;

    public static e a(com.google.android.gms.internal.consent_sdk.a aVar) throws ParserException {
        int i5;
        float f11;
        String str;
        int i11;
        byte[] bArr = wf.a.f94304a;
        try {
            aVar.Z(4);
            int iN = (aVar.N() & 3) + 1;
            if (iN == 3) {
                throw new IllegalStateException();
            }
            ArrayList arrayList = new ArrayList();
            int iN2 = aVar.N() & 31;
            for (int i12 = 0; i12 < iN2; i12++) {
                int iS = aVar.S();
                int i13 = aVar.f31984b;
                aVar.Z(iS);
                byte[] bArr2 = (byte[]) aVar.f31986d;
                byte[] bArr3 = new byte[iS + 4];
                System.arraycopy(bArr, 0, bArr3, 0, 4);
                System.arraycopy(bArr2, i13, bArr3, 4, iS);
                arrayList.add(bArr3);
            }
            int iN3 = aVar.N();
            for (int i14 = 0; i14 < iN3; i14++) {
                int iS2 = aVar.S();
                int i15 = aVar.f31984b;
                aVar.Z(iS2);
                byte[] bArr4 = (byte[]) aVar.f31986d;
                byte[] bArr5 = new byte[iS2 + 4];
                System.arraycopy(bArr, 0, bArr5, 0, 4);
                System.arraycopy(bArr4, i15, bArr5, 4, iS2);
                arrayList.add(bArr5);
            }
            if (iN2 > 0) {
                m mVarA = wf.a.A(iN, ((byte[]) arrayList.get(0)).length, (byte[]) arrayList.get(0));
                i5 = mVarA.f94349e;
                i11 = mVarA.f94350f;
                f11 = mVarA.f94351g;
                str = String.format("avc1.%02X%02X%02X", Integer.valueOf(mVarA.f94345a), Integer.valueOf(mVarA.f94346b), Integer.valueOf(mVarA.f94347c));
            } else {
                i5 = -1;
                f11 = 1.0f;
                str = null;
                i11 = -1;
            }
            e eVar = new e();
            eVar.f61504e = arrayList;
            eVar.f61500a = iN;
            eVar.f61501b = i5;
            eVar.f61502c = i11;
            eVar.f61503d = f11;
            eVar.f61505f = str;
            return eVar;
        } catch (ArrayIndexOutOfBoundsException e3) {
            throw ParserException.a("Error parsing AVC config", e3);
        }
    }
}
