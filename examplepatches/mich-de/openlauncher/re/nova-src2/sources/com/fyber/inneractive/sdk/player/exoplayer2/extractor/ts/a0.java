package com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts;

import android.util.SparseArray;
import android.util.SparseIntArray;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.vungle.ads.internal.protos.Sdk;
import java.util.ArrayList;
import java.util.Arrays;

/* loaded from: classes3.dex */
public final class a0 implements v {

    /* renamed from: a, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.util.m f29742a = new com.fyber.inneractive.sdk.player.exoplayer2.util.m(new byte[5]);

    /* renamed from: b, reason: collision with root package name */
    public final SparseArray f29743b = new SparseArray();

    /* renamed from: c, reason: collision with root package name */
    public final SparseIntArray f29744c = new SparseIntArray();

    /* renamed from: d, reason: collision with root package name */
    public final int f29745d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ b0 f29746e;

    public a0(b0 b0Var, int i5) {
        this.f29746e = b0Var;
        this.f29745d = i5;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts.v
    public final void a(com.fyber.inneractive.sdk.player.exoplayer2.util.v vVar, com.fyber.inneractive.sdk.player.exoplayer2.extractor.j jVar, e0 e0Var) {
    }

    /* JADX WARN: Removed duplicated region for block: B:38:0x0115  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x011c  */
    /* JADX WARN: Removed duplicated region for block: B:77:0x01cc  */
    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts.v
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void a(com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar) {
        com.fyber.inneractive.sdk.player.exoplayer2.util.v vVar;
        char c11;
        f0 f0VarA;
        int i5;
        int i11;
        int i12;
        if (nVar.j() != 2) {
            return;
        }
        b0 b0Var = this.f29746e;
        int i13 = b0Var.f29761a;
        int i14 = 0;
        if (i13 == 1 || i13 == 2 || b0Var.f29769i == 1) {
            vVar = (com.fyber.inneractive.sdk.player.exoplayer2.util.v) b0Var.f29762b.get(0);
        } else {
            vVar = new com.fyber.inneractive.sdk.player.exoplayer2.util.v(((com.fyber.inneractive.sdk.player.exoplayer2.util.v) b0Var.f29762b.get(0)).f30485a);
            this.f29746e.f29762b.add(vVar);
        }
        nVar.e(nVar.f30462b + 2);
        int iO = nVar.o();
        int i15 = 5;
        nVar.e(nVar.f30462b + 5);
        com.fyber.inneractive.sdk.player.exoplayer2.util.m mVar = this.f29742a;
        nVar.a(mVar.f30457a, 0, 2);
        mVar.b(0);
        int i16 = 4;
        this.f29742a.c(4);
        int i17 = 12;
        nVar.e(nVar.f30462b + this.f29742a.a(12));
        b0 b0Var2 = this.f29746e;
        if (b0Var2.f29761a == 2 && b0Var2.f29771k == null) {
            d0 d0Var = new d0(21, null, null, new byte[0]);
            b0 b0Var3 = this.f29746e;
            b0Var3.f29771k = b0Var3.f29765e.a(21, d0Var);
            b0 b0Var4 = this.f29746e;
            b0Var4.f29771k.a(vVar, b0Var4.f29768h, new e0(iO, 21, UserMetadata.MAX_INTERNAL_KEY_SIZE));
        }
        this.f29743b.clear();
        this.f29744c.clear();
        int i18 = nVar.f30463c - nVar.f30462b;
        while (i18 > 0) {
            com.fyber.inneractive.sdk.player.exoplayer2.util.m mVar2 = this.f29742a;
            nVar.a(mVar2.f30457a, i14, i15);
            mVar2.b(i14);
            int iA = this.f29742a.a(8);
            int i19 = 3;
            this.f29742a.c(3);
            int iA2 = this.f29742a.a(13);
            this.f29742a.c(i16);
            int iA3 = this.f29742a.a(i17);
            int i21 = nVar.f30462b;
            int i22 = i21 + iA3;
            int i23 = -1;
            String strTrim = null;
            ArrayList arrayList = null;
            while (nVar.f30462b < i22) {
                int iJ = nVar.j();
                int iJ2 = nVar.f30462b + nVar.j();
                if (iJ == i15) {
                    long jK = nVar.k();
                    if (jK == b0.f29759l) {
                        i12 = Sdk.SDKError.Reason.EMPTY_TPAT_ERROR_VALUE;
                    } else if (jK == b0.f29760m) {
                        i12 = Sdk.SDKError.Reason.INVALID_CONFIG_RESPONSE_VALUE;
                    } else {
                        if (jK == b0.n) {
                            i12 = 36;
                        }
                        i5 = i18;
                        i11 = 4;
                    }
                    i23 = i12;
                    i5 = i18;
                    i11 = 4;
                } else {
                    if (iJ != 106) {
                        if (iJ != 122) {
                            if (iJ == 123) {
                                i12 = Sdk.SDKError.Reason.CONFIG_REFRESH_FAILED_VALUE;
                            } else {
                                if (iJ == 10) {
                                    strTrim = nVar.b(i19).trim();
                                } else if (iJ == 89) {
                                    ArrayList arrayList2 = new ArrayList();
                                    while (nVar.f30462b < iJ2) {
                                        String strTrim2 = nVar.b(i19).trim();
                                        nVar.j();
                                        byte[] bArr = new byte[4];
                                        nVar.a(bArr, 0, 4);
                                        arrayList2.add(new c0(strTrim2, bArr));
                                        i18 = i18;
                                        i19 = 3;
                                    }
                                    i5 = i18;
                                    i11 = 4;
                                    arrayList = arrayList2;
                                    i23 = 89;
                                }
                                i5 = i18;
                                i11 = 4;
                            }
                        }
                    }
                    i23 = i12;
                    i5 = i18;
                    i11 = 4;
                }
                int i24 = nVar.f30462b;
                nVar.e((iJ2 - i24) + i24);
                i16 = i11;
                i18 = i5;
                i15 = 5;
                i19 = 3;
            }
            int i25 = i18;
            int i26 = i16;
            nVar.e(i22);
            d0 d0Var2 = new d0(i23, strTrim, arrayList, Arrays.copyOfRange(nVar.f30461a, i21, i22));
            if (iA == 6) {
                iA = i23;
            }
            i18 = i25 - (iA3 + 5);
            b0 b0Var5 = this.f29746e;
            int i27 = b0Var5.f29761a == 2 ? iA : iA2;
            if (b0Var5.f29767g.get(i27)) {
                c11 = 21;
            } else {
                b0 b0Var6 = this.f29746e;
                if (b0Var6.f29761a == 2) {
                    c11 = 21;
                    if (iA == 21) {
                        f0VarA = b0Var6.f29771k;
                    }
                    if (this.f29746e.f29761a == 2 || iA2 < this.f29744c.get(i27, UserMetadata.MAX_INTERNAL_KEY_SIZE)) {
                        this.f29744c.put(i27, iA2);
                        this.f29743b.put(i27, f0VarA);
                    }
                } else {
                    c11 = 21;
                }
                f0VarA = b0Var6.f29765e.a(iA, d0Var2);
                if (this.f29746e.f29761a == 2) {
                    this.f29744c.put(i27, iA2);
                    this.f29743b.put(i27, f0VarA);
                }
            }
            i16 = i26;
            i14 = 0;
            i15 = 5;
            i17 = 12;
        }
        int size = this.f29744c.size();
        for (int i28 = 0; i28 < size; i28++) {
            int iKeyAt = this.f29744c.keyAt(i28);
            this.f29746e.f29767g.put(iKeyAt, true);
            f0 f0Var = (f0) this.f29743b.valueAt(i28);
            if (f0Var != null) {
                b0 b0Var7 = this.f29746e;
                if (f0Var != b0Var7.f29771k) {
                    f0Var.a(vVar, b0Var7.f29768h, new e0(iO, iKeyAt, UserMetadata.MAX_INTERNAL_KEY_SIZE));
                }
                this.f29746e.f29766f.put(this.f29744c.valueAt(i28), f0Var);
            }
        }
        b0 b0Var8 = this.f29746e;
        if (b0Var8.f29761a == 2) {
            if (b0Var8.f29770j) {
                return;
            }
            b0Var8.f29768h.b();
            b0 b0Var9 = this.f29746e;
            b0Var9.f29769i = 0;
            b0Var9.f29770j = true;
            return;
        }
        b0Var8.f29766f.remove(this.f29745d);
        b0 b0Var10 = this.f29746e;
        int i29 = b0Var10.f29761a == 1 ? 0 : b0Var10.f29769i - 1;
        b0Var10.f29769i = i29;
        if (i29 == 0) {
            b0Var10.f29768h.b();
            this.f29746e.f29770j = true;
        }
    }
}
