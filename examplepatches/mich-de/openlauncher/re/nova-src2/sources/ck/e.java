package ck;

import a5.a1;
import aa.x;
import ai.h;
import ai.k0;
import android.os.Bundle;
import android.os.Parcel;
import android.view.View;
import b.c0;
import com.google.android.material.bottomsheet.BottomSheetBehavior;
import com.google.android.material.sidesheet.SideSheetBehavior;
import com.google.zxing.WriterException;
import h60.p;
import java.lang.ref.WeakReference;
import java.lang.reflect.Array;
import java.nio.ByteBuffer;
import java.nio.charset.Charset;
import java.nio.charset.CharsetEncoder;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.WeakHashMap;
import jf.g;
import jf.i;
import l60.j;
import tm.o;

/* loaded from: classes3.dex */
public final class e implements g {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f19976a;

    /* renamed from: b, reason: collision with root package name */
    public int f19977b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f19978c;

    /* renamed from: d, reason: collision with root package name */
    public final Object f19979d;

    /* renamed from: e, reason: collision with root package name */
    public Object f19980e;

    public e() {
        this.f19976a = 2;
        this.f19979d = new i(1);
        this.f19980e = new ArrayDeque();
        for (int i5 = 0; i5 < 2; i5++) {
            ((ArrayDeque) this.f19980e).addFirst(new jf.d(this, 0));
        }
        this.f19977b = 0;
    }

    public static void e(e eVar, o oVar, ba0.e eVar2) {
        p pVar = (p) oVar.f89495d;
        int iO0 = oVar.o0();
        oVar.I0(eVar2);
        if (((ArrayList) eVar.f19980e) != null) {
            StringBuilder sb2 = pVar.f59493a;
            int length = sb2.length();
            boolean z11 = length > 0 && '\n' != sb2.charAt(length - 1);
            if (z11) {
                pVar.a('\n');
            }
            pVar.a((char) 160);
            l60.g gVar = new l60.g((j) eVar.f19979d, (ArrayList) eVar.f19980e, eVar.f19978c, eVar.f19977b % 2 == 1);
            eVar.f19977b = eVar.f19978c ? 0 : eVar.f19977b + 1;
            if (z11) {
                iO0++;
            }
            StringBuilder sb3 = pVar.f59493a;
            int length2 = sb3.length();
            int length3 = sb3.length();
            if (length2 > iO0 && iO0 >= 0 && length2 <= length3) {
                p.c(pVar, gVar, iO0, length2);
            }
            eVar.f19980e = null;
        }
    }

    public static void f(sn.d[][][] dVarArr, int i5, sn.d dVar) {
        sn.d[] dVarArr2 = dVarArr[i5 + dVar.f87554d][dVar.f87553c];
        rn.a aVar = dVar.f87551a;
        int iOrdinal = aVar.ordinal();
        char c11 = 2;
        if (iOrdinal != 1) {
            if (iOrdinal == 2) {
                c11 = 1;
            } else if (iOrdinal == 4) {
                c11 = 3;
            } else {
                if (iOrdinal != 6) {
                    throw new IllegalStateException("Illegal mode " + aVar);
                }
                c11 = 0;
            }
        }
        sn.d dVar2 = dVarArr2[c11];
        if (dVar2 == null || dVar2.f87556f > dVar.f87556f) {
            dVarArr2[c11] = dVar;
        }
    }

    public static boolean h(rn.a aVar, char c11) {
        int iOrdinal = aVar.ordinal();
        if (iOrdinal != 1) {
            if (iOrdinal == 2) {
                if ((c11 < '`' ? sn.b.f87545a[c11] : -1) == -1) {
                    return false;
                }
            } else if (iOrdinal != 4) {
                if (iOrdinal != 6) {
                    return false;
                }
                return sn.b.b(String.valueOf(c11));
            }
        } else if (c11 < '0' || c11 > '9') {
            return false;
        }
        return true;
    }

    public static rn.b k(int i5) {
        int iF = c0.F(i5);
        return iF != 0 ? iF != 1 ? rn.b.a(40) : rn.b.a(26) : rn.b.a(9);
    }

    @Override // jf.g
    public void a(long j11) {
    }

    @Override // ie.d
    public Object b() {
        ArrayDeque arrayDeque = (ArrayDeque) this.f19980e;
        i iVar = (i) this.f19979d;
        wf.a.i(!this.f19978c);
        if (this.f19977b != 2 || arrayDeque.isEmpty()) {
            return null;
        }
        jf.d dVar = (jf.d) arrayDeque.removeFirst();
        if (iVar.d(4)) {
            dVar.b(4);
        } else {
            long j11 = iVar.f61582f;
            ByteBuffer byteBuffer = iVar.f61580d;
            byteBuffer.getClass();
            byte[] bArrArray = byteBuffer.array();
            Parcel parcelObtain = Parcel.obtain();
            parcelObtain.unmarshall(bArrArray, 0, bArrArray.length);
            parcelObtain.setDataPosition(0);
            Bundle bundle = parcelObtain.readBundle(Bundle.class.getClassLoader());
            parcelObtain.recycle();
            ArrayList parcelableArrayList = bundle.getParcelableArrayList("c");
            parcelableArrayList.getClass();
            dVar.t(iVar.f61582f, new k0(j11, wf.a.s(jf.b.f69505s, parcelableArrayList), 7), 0L);
        }
        iVar.q();
        this.f19977b = 0;
        return dVar;
    }

    @Override // ie.d
    public void c(i iVar) {
        wf.a.i(!this.f19978c);
        wf.a.i(this.f19977b == 1);
        wf.a.e(((i) this.f19979d) == iVar);
        this.f19977b = 2;
    }

    @Override // ie.d
    public Object d() {
        wf.a.i(!this.f19978c);
        if (this.f19977b != 0) {
            return null;
        }
        this.f19977b = 1;
        return (i) this.f19979d;
    }

    @Override // ie.d
    public void flush() {
        wf.a.i(!this.f19978c);
        ((i) this.f19979d).q();
        this.f19977b = 0;
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0031  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void g(rn.b bVar, sn.d[][][] dVarArr, int i5, sn.d dVar) {
        int i11;
        String str = (String) this.f19979d;
        on.d dVar2 = (on.d) this.f19980e;
        CharsetEncoder[] charsetEncoderArr = dVar2.f80544a;
        CharsetEncoder[] charsetEncoderArr2 = dVar2.f80544a;
        int length = charsetEncoderArr.length;
        int i12 = dVar2.f80545b;
        if (i12 >= 0) {
            char cCharAt = str.charAt(i5);
            if (charsetEncoderArr2[i12].canEncode(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b + cCharAt)) {
                length = i12 + 1;
            } else {
                i12 = 0;
            }
        }
        int i13 = length;
        for (int i14 = i12; i14 < i13; i14++) {
            char cCharAt2 = str.charAt(i5);
            if (charsetEncoderArr2[i14].canEncode(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b + cCharAt2)) {
                f(dVarArr, i5, new sn.d(this, rn.a.BYTE, i5, i14, 1, dVar, bVar));
            }
        }
        char cCharAt3 = str.charAt(i5);
        rn.a aVar = rn.a.KANJI;
        if (h(aVar, cCharAt3)) {
            f(dVarArr, i5, new sn.d(this, aVar, i5, 0, 1, dVar, bVar));
        }
        int length2 = str.length();
        char cCharAt4 = str.charAt(i5);
        rn.a aVar2 = rn.a.ALPHANUMERIC;
        int i15 = 2;
        if (h(aVar2, cCharAt4)) {
            int i16 = i5 + 1;
            f(dVarArr, i5, new sn.d(this, aVar2, i5, 0, (i16 >= length2 || !h(aVar2, str.charAt(i16))) ? 1 : 2, dVar, bVar));
        }
        char cCharAt5 = str.charAt(i5);
        rn.a aVar3 = rn.a.NUMERIC;
        if (h(aVar3, cCharAt5)) {
            int i17 = i5 + 1;
            if (i17 >= length2 || !h(aVar3, str.charAt(i17))) {
                i11 = 1;
            } else {
                int i18 = i5 + 2;
                if (i18 < length2 && h(aVar3, str.charAt(i18))) {
                    i15 = 3;
                }
                i11 = i15;
            }
            f(dVarArr, i5, new sn.d(this, aVar3, i5, 0, i11, dVar, bVar));
        }
    }

    public void i(int i5) {
        int i11 = this.f19976a;
        Object obj = this.f19979d;
        switch (i11) {
            case 0:
                SideSheetBehavior sideSheetBehavior = (SideSheetBehavior) this.f19980e;
                WeakReference weakReference = sideSheetBehavior.f34344p;
                if (weakReference != null && weakReference.get() != null) {
                    this.f19977b = i5;
                    if (!this.f19978c) {
                        WeakHashMap weakHashMap = a1.f250a;
                        ((View) sideSheetBehavior.f34344p.get()).postOnAnimation((x) obj);
                        this.f19978c = true;
                        break;
                    }
                }
                break;
            default:
                BottomSheetBehavior bottomSheetBehavior = (BottomSheetBehavior) this.f19980e;
                WeakReference weakReference2 = bottomSheetBehavior.U;
                if (weakReference2 != null && weakReference2.get() != null) {
                    this.f19977b = i5;
                    if (!this.f19978c) {
                        WeakHashMap weakHashMap2 = a1.f250a;
                        ((View) bottomSheetBehavior.U.get()).postOnAnimation((h) obj);
                        this.f19978c = true;
                        break;
                    }
                }
                break;
        }
    }

    public mh.c j(rn.b bVar) throws WriterException {
        int i5;
        String str = (String) this.f19979d;
        int length = str.length();
        on.d dVar = (on.d) this.f19980e;
        CharsetEncoder[] charsetEncoderArr = dVar.f80544a;
        CharsetEncoder[] charsetEncoderArr2 = dVar.f80544a;
        sn.d[][][] dVarArr = (sn.d[][][]) Array.newInstance((Class<?>) sn.d.class, length + 1, charsetEncoderArr.length, 4);
        g(bVar, dVarArr, 0, null);
        for (int i11 = 1; i11 <= length; i11++) {
            for (int i12 = 0; i12 < charsetEncoderArr2.length; i12++) {
                for (int i13 = 0; i13 < 4; i13++) {
                    sn.d dVar2 = dVarArr[i11][i12][i13];
                    if (dVar2 != null && i11 < length) {
                        g(bVar, dVarArr, i11, dVar2);
                    }
                }
            }
        }
        int i14 = -1;
        int i15 = Integer.MAX_VALUE;
        int i16 = -1;
        for (int i17 = 0; i17 < charsetEncoderArr2.length; i17++) {
            for (int i18 = 0; i18 < 4; i18++) {
                sn.d dVar3 = dVarArr[length][i17][i18];
                if (dVar3 != null && (i5 = dVar3.f87556f) < i15) {
                    i14 = i17;
                    i16 = i18;
                    i15 = i5;
                }
            }
        }
        if (i14 >= 0) {
            return new mh.c(this, bVar, dVarArr[length][i14][i16]);
        }
        throw new WriterException(c0.l("Internal error: failed to encode \"", str, "\""));
    }

    @Override // ie.d
    public void release() {
        this.f19978c = true;
    }

    public e(String str, Charset charset, boolean z11, int i5) {
        this.f19976a = 4;
        this.f19979d = str;
        this.f19978c = z11;
        this.f19980e = new on.d(str, charset);
        this.f19977b = i5;
    }

    public e(j jVar) {
        this.f19976a = 3;
        this.f19979d = jVar;
    }

    public e(SideSheetBehavior sideSheetBehavior) {
        this.f19976a = 0;
        this.f19980e = sideSheetBehavior;
        this.f19979d = new x(this, 16);
    }

    public e(BottomSheetBehavior bottomSheetBehavior) {
        this.f19976a = 1;
        this.f19980e = bottomSheetBehavior;
        this.f19979d = new h(this, 18);
    }
}
