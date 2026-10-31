package mf;

import android.graphics.Bitmap;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.zip.Inflater;
import jf.e;
import jf.f;
import kf.i;
import wf.v;

/* loaded from: classes3.dex */
public final class b extends e {

    /* renamed from: m, reason: collision with root package name */
    public final com.google.android.gms.internal.consent_sdk.a f76275m = new com.google.android.gms.internal.consent_sdk.a(13, (byte) 0);
    public final com.google.android.gms.internal.consent_sdk.a n = new com.google.android.gms.internal.consent_sdk.a(13, (byte) 0);
    public final a o = new a();

    /* renamed from: p, reason: collision with root package name */
    public Inflater f76276p;

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:21:0x0082  */
    @Override // jf.e
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final f f(byte[] bArr, int i5, boolean z11) {
        char c11;
        int[] iArr;
        jf.b bVar;
        int i11;
        int i12;
        int iN;
        int i13;
        int i14;
        int iP;
        com.google.android.gms.internal.consent_sdk.a aVar = this.f76275m;
        aVar.V(i5, bArr);
        char c12 = 255;
        if (aVar.g() > 0 && (((byte[]) aVar.f31986d)[aVar.f31984b] & 255) == 120) {
            if (this.f76276p == null) {
                this.f76276p = new Inflater();
            }
            Inflater inflater = this.f76276p;
            com.google.android.gms.internal.consent_sdk.a aVar2 = this.n;
            if (v.v(aVar, aVar2, inflater)) {
                aVar.V(aVar2.f31985c, (byte[]) aVar2.f31986d);
            }
        }
        a aVar3 = this.o;
        int i15 = 0;
        aVar3.f76269d = 0;
        int[] iArr2 = aVar3.f76267b;
        com.google.android.gms.internal.consent_sdk.a aVar4 = aVar3.f76266a;
        aVar3.f76270e = 0;
        aVar3.f76271f = 0;
        aVar3.f76272g = 0;
        aVar3.f76273h = 0;
        aVar3.f76274i = 0;
        aVar4.U(0);
        aVar3.f76268c = false;
        ArrayList arrayList = new ArrayList();
        while (aVar.g() >= 3) {
            int i16 = aVar.f31985c;
            int iN2 = aVar.N();
            int iS = aVar.S();
            int i17 = aVar.f31984b + iS;
            if (i17 > i16) {
                aVar.Y(i16);
                c11 = c12;
                i11 = i15;
                iArr = iArr2;
                bVar = null;
            } else {
                char c13 = 128;
                if (iN2 != 128) {
                    switch (iN2) {
                        case 20:
                            if (iS % 5 == 2) {
                                aVar.Z(2);
                                Arrays.fill(iArr2, i15);
                                int i18 = iS / 5;
                                int i19 = i15;
                                while (i19 < i18) {
                                    int iN3 = aVar.N();
                                    char c14 = c13;
                                    double dN = aVar.N();
                                    double dN2 = aVar.N() - 128;
                                    int[] iArr3 = iArr2;
                                    double dN3 = aVar.N() - 128;
                                    iArr3[iN3] = (v.h((int) ((1.402d * dN2) + dN), 0, 255) << 16) | (aVar.N() << 24) | (v.h((int) ((dN - (0.34414d * dN3)) - (dN2 * 0.71414d)), 0, 255) << 8) | v.h((int) ((dN3 * 1.772d) + dN), 0, 255);
                                    i19++;
                                    c13 = c14;
                                    c12 = 255;
                                    iArr2 = iArr3;
                                }
                                c11 = c12;
                                iArr = iArr2;
                                aVar3.f76268c = true;
                                break;
                            } else {
                                c11 = c12;
                                iArr = iArr2;
                                break;
                            }
                        case 21:
                            if (iS >= 4) {
                                aVar.Z(3);
                                int i21 = iS - 4;
                                if (((128 & aVar.N()) != 0 ? 1 : i15) == 0) {
                                    i13 = aVar4.f31984b;
                                    i14 = aVar4.f31985c;
                                    if (i13 < i14 && i21 > 0) {
                                        int iMin = Math.min(i21, i14 - i13);
                                        aVar.z(i13, iMin, (byte[]) aVar4.f31986d);
                                        aVar4.Y(i13 + iMin);
                                    }
                                } else if (i21 >= 7 && (iP = aVar.P()) >= 4) {
                                    aVar3.f76273h = aVar.S();
                                    aVar3.f76274i = aVar.S();
                                    aVar4.U(iP - 4);
                                    i21 = iS - 11;
                                    i13 = aVar4.f31984b;
                                    i14 = aVar4.f31985c;
                                    if (i13 < i14) {
                                        int iMin2 = Math.min(i21, i14 - i13);
                                        aVar.z(i13, iMin2, (byte[]) aVar4.f31986d);
                                        aVar4.Y(i13 + iMin2);
                                    }
                                }
                            }
                            c11 = c12;
                            iArr = iArr2;
                            break;
                        case 22:
                            if (iS >= 19) {
                                aVar3.f76269d = aVar.S();
                                aVar3.f76270e = aVar.S();
                                aVar.Z(11);
                                aVar3.f76271f = aVar.S();
                                aVar3.f76272g = aVar.S();
                            }
                            c11 = c12;
                            iArr = iArr2;
                            break;
                    }
                    i11 = 0;
                    bVar = null;
                } else {
                    c11 = c12;
                    iArr = iArr2;
                    if (aVar3.f76269d == 0 || aVar3.f76270e == 0 || aVar3.f76273h == 0 || aVar3.f76274i == 0 || (i12 = aVar4.f31985c) == 0 || aVar4.f31984b != i12 || !aVar3.f76268c) {
                        bVar = null;
                    } else {
                        aVar4.Y(0);
                        int i22 = aVar3.f76273h * aVar3.f76274i;
                        int[] iArr4 = new int[i22];
                        int i23 = 0;
                        while (i23 < i22) {
                            int iN4 = aVar4.N();
                            if (iN4 != 0) {
                                iN = i23 + 1;
                                iArr4[i23] = iArr[iN4];
                            } else {
                                int iN5 = aVar4.N();
                                if (iN5 != 0) {
                                    iN = ((iN5 & 64) == 0 ? iN5 & 63 : ((iN5 & 63) << 8) | aVar4.N()) + i23;
                                    Arrays.fill(iArr4, i23, iN, (iN5 & 128) == 0 ? 0 : iArr[aVar4.N()]);
                                }
                            }
                            i23 = iN;
                        }
                        Bitmap bitmapCreateBitmap = Bitmap.createBitmap(iArr4, aVar3.f76273h, aVar3.f76274i, Bitmap.Config.ARGB_8888);
                        float f11 = aVar3.f76271f;
                        float f12 = aVar3.f76269d;
                        float f13 = f11 / f12;
                        float f14 = aVar3.f76272g;
                        float f15 = aVar3.f76270e;
                        bVar = new jf.b(null, null, null, bitmapCreateBitmap, f14 / f15, 0, 0, f13, 0, Integer.MIN_VALUE, -3.4028235E38f, aVar3.f76273h / f12, aVar3.f76274i / f15, false, -16777216, Integer.MIN_VALUE, 0.0f);
                    }
                    i11 = 0;
                    aVar3.f76269d = 0;
                    aVar3.f76270e = 0;
                    aVar3.f76271f = 0;
                    aVar3.f76272g = 0;
                    aVar3.f76273h = 0;
                    aVar3.f76274i = 0;
                    aVar4.U(0);
                    aVar3.f76268c = false;
                }
                aVar.Y(i17);
            }
            if (bVar != null) {
                arrayList.add(bVar);
            }
            i15 = i11;
            c12 = c11;
            iArr2 = iArr;
        }
        return new i(2, Collections.unmodifiableList(arrayList));
    }
}
