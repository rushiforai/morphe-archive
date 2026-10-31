package se;

import ke.v;

/* loaded from: classes3.dex */
public final class h {

    /* renamed from: a, reason: collision with root package name */
    public final v f87257a;

    /* renamed from: d, reason: collision with root package name */
    public s f87260d;

    /* renamed from: e, reason: collision with root package name */
    public f f87261e;

    /* renamed from: f, reason: collision with root package name */
    public int f87262f;

    /* renamed from: g, reason: collision with root package name */
    public int f87263g;

    /* renamed from: h, reason: collision with root package name */
    public int f87264h;

    /* renamed from: i, reason: collision with root package name */
    public int f87265i;

    /* renamed from: l, reason: collision with root package name */
    public boolean f87268l;

    /* renamed from: b, reason: collision with root package name */
    public final r f87258b = new r();

    /* renamed from: c, reason: collision with root package name */
    public final com.google.android.gms.internal.consent_sdk.a f87259c = new com.google.android.gms.internal.consent_sdk.a(13, (byte) 0);

    /* renamed from: j, reason: collision with root package name */
    public final com.google.android.gms.internal.consent_sdk.a f87266j = new com.google.android.gms.internal.consent_sdk.a(1);

    /* renamed from: k, reason: collision with root package name */
    public final com.google.android.gms.internal.consent_sdk.a f87267k = new com.google.android.gms.internal.consent_sdk.a(13, (byte) 0);

    public h(v vVar, s sVar, f fVar) {
        this.f87257a = vVar;
        this.f87260d = sVar;
        this.f87261e = fVar;
        this.f87260d = sVar;
        this.f87261e = fVar;
        vVar.a(sVar.f87358a.f87332f);
        d();
    }

    public final q a() {
        if (!this.f87268l) {
            return null;
        }
        r rVar = this.f87258b;
        f fVar = rVar.f87343a;
        int i5 = wf.v.f94376a;
        int i11 = fVar.f87250a;
        q qVar = rVar.f87355m;
        if (qVar == null) {
            qVar = this.f87260d.f87358a.f87337k[i11];
        }
        if (qVar == null || !qVar.f87338a) {
            return null;
        }
        return qVar;
    }

    public final boolean b() {
        this.f87262f++;
        if (!this.f87268l) {
            return false;
        }
        int i5 = this.f87263g + 1;
        this.f87263g = i5;
        int[] iArr = this.f87258b.f87349g;
        int i11 = this.f87264h;
        if (i5 != iArr[i11]) {
            return true;
        }
        this.f87264h = i11 + 1;
        this.f87263g = 0;
        return false;
    }

    public final int c(int i5, int i11) {
        com.google.android.gms.internal.consent_sdk.a aVar;
        q qVarA = a();
        if (qVarA == null) {
            return 0;
        }
        int length = qVarA.f87341d;
        r rVar = this.f87258b;
        if (length != 0) {
            aVar = rVar.n;
        } else {
            byte[] bArr = qVarA.f87342e;
            int i12 = wf.v.f94376a;
            int length2 = bArr.length;
            com.google.android.gms.internal.consent_sdk.a aVar2 = this.f87267k;
            aVar2.V(length2, bArr);
            length = bArr.length;
            aVar = aVar2;
        }
        boolean z11 = rVar.f87353k && rVar.f87354l[this.f87262f];
        boolean z12 = z11 || i11 != 0;
        com.google.android.gms.internal.consent_sdk.a aVar3 = this.f87266j;
        ((byte[]) aVar3.f31986d)[0] = (byte) ((z12 ? 128 : 0) | length);
        aVar3.Y(0);
        v vVar = this.f87257a;
        vVar.d(1, aVar3);
        vVar.d(length, aVar);
        if (!z12) {
            return length + 1;
        }
        com.google.android.gms.internal.consent_sdk.a aVar4 = this.f87259c;
        if (!z11) {
            aVar4.U(8);
            byte[] bArr2 = (byte[]) aVar4.f31986d;
            bArr2[0] = 0;
            bArr2[1] = 1;
            bArr2[2] = (byte) 0;
            bArr2[3] = (byte) (i11 & 255);
            bArr2[4] = (byte) ((i5 >> 24) & 255);
            bArr2[5] = (byte) ((i5 >> 16) & 255);
            bArr2[6] = (byte) ((i5 >> 8) & 255);
            bArr2[7] = (byte) (i5 & 255);
            vVar.d(8, aVar4);
            return length + 9;
        }
        com.google.android.gms.internal.consent_sdk.a aVar5 = rVar.n;
        int iS = aVar5.S();
        aVar5.Z(-2);
        int i13 = (iS * 6) + 2;
        if (i11 != 0) {
            aVar4.U(i13);
            byte[] bArr3 = (byte[]) aVar4.f31986d;
            aVar5.z(0, i13, bArr3);
            int i14 = (((bArr3[2] & 255) << 8) | (bArr3[3] & 255)) + i11;
            bArr3[2] = (byte) ((i14 >> 8) & 255);
            bArr3[3] = (byte) (i14 & 255);
        } else {
            aVar4 = aVar5;
        }
        vVar.d(i13, aVar4);
        return length + 1 + i13;
    }

    public final void d() {
        r rVar = this.f87258b;
        rVar.f87346d = 0;
        rVar.f87356p = 0L;
        rVar.f87357q = false;
        rVar.f87353k = false;
        rVar.o = false;
        rVar.f87355m = null;
        this.f87262f = 0;
        this.f87264h = 0;
        this.f87263g = 0;
        this.f87265i = 0;
        this.f87268l = false;
    }
}
