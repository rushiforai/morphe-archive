package com.fyber.inneractive.sdk.player.exoplayer2.video;

import com.fyber.inneractive.sdk.player.exoplayer2.r;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes3.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final List f30519a;

    /* renamed from: b, reason: collision with root package name */
    public final int f30520b;

    /* renamed from: c, reason: collision with root package name */
    public final int f30521c;

    /* renamed from: d, reason: collision with root package name */
    public final int f30522d;

    /* renamed from: e, reason: collision with root package name */
    public final float f30523e;

    public a(ArrayList arrayList, int i5, int i11, int i12, float f11) {
        this.f30519a = arrayList;
        this.f30520b = i5;
        this.f30521c = i11;
        this.f30522d = i12;
        this.f30523e = f11;
    }

    public static a a(com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar) throws r {
        float f11;
        int i5;
        int i11;
        try {
            nVar.e(nVar.f30462b + 4);
            int iJ = (nVar.j() & 3) + 1;
            if (iJ == 3) {
                throw new IllegalStateException();
            }
            ArrayList arrayList = new ArrayList();
            int iJ2 = nVar.j() & 31;
            for (int i12 = 0; i12 < iJ2; i12++) {
                int iO = nVar.o();
                int i13 = nVar.f30462b;
                nVar.e(i13 + iO);
                byte[] bArr = nVar.f30461a;
                byte[] bArr2 = new byte[iO + 4];
                System.arraycopy(com.fyber.inneractive.sdk.player.exoplayer2.util.d.f30431a, 0, bArr2, 0, 4);
                System.arraycopy(bArr, i13, bArr2, 4, iO);
                arrayList.add(bArr2);
            }
            int iJ3 = nVar.j();
            for (int i14 = 0; i14 < iJ3; i14++) {
                int iO2 = nVar.o();
                int i15 = nVar.f30462b;
                nVar.e(i15 + iO2);
                byte[] bArr3 = nVar.f30461a;
                byte[] bArr4 = new byte[iO2 + 4];
                System.arraycopy(com.fyber.inneractive.sdk.player.exoplayer2.util.d.f30431a, 0, bArr4, 0, 4);
                System.arraycopy(bArr3, i15, bArr4, 4, iO2);
                arrayList.add(bArr4);
            }
            if (iJ2 > 0) {
                com.fyber.inneractive.sdk.player.exoplayer2.util.k kVarA = com.fyber.inneractive.sdk.player.exoplayer2.util.l.a((byte[]) arrayList.get(0), iJ, ((byte[]) arrayList.get(0)).length);
                int i16 = kVarA.f30444b;
                int i17 = kVarA.f30445c;
                f11 = kVarA.f30446d;
                i5 = i16;
                i11 = i17;
            } else {
                f11 = 1.0f;
                i5 = -1;
                i11 = -1;
            }
            return new a(arrayList, iJ, i5, i11, f11);
        } catch (ArrayIndexOutOfBoundsException e3) {
            throw new r("Error parsing AVC config", e3);
        }
    }
}
