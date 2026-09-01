package defpackage;

import android.content.Context;
import android.os.Bundle;
import android.os.RemoteException;
import android.util.Log;
import com.android.billingclient.api.BillingResult;
import com.google.android.gms.common.api.Status;
import defpackage.edg;
import j$.util.Objects;
import java.io.IOException;
import java.math.BigInteger;
import java.nio.charset.Charset;
import java.security.GeneralSecurityException;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import javax.crypto.Mac;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zjf implements xq8, enf, kr8, d0g, reg, o92 {
    public static zjf d;
    public final /* synthetic */ int a;
    public Object b;
    public Object c;

    public zjf(Context context, zbg zbgVar) {
        this.a = 7;
        sv0 sv0Var = new sv0(9);
        try {
            psd.b(context);
            sv0Var.c = psd.a().c(j21.e).a("PLAY_BILLING_LIBRARY", new wy3("proto"), new qrd() { // from class: com.android.billingclient.api.zzdn
                @Override // defpackage.qrd
                public final Object apply(Object obj) {
                    return ((edg) obj).b();
                }
            });
        } catch (Throwable unused) {
            sv0Var.b = true;
        }
        this.c = sv0Var;
        this.b = zbgVar;
    }

    public static zjf c(Context context, String str) {
        pkf pkfVarH;
        zjf zjfVar = d;
        if (zjfVar == null || !((String) zjfVar.b).equals(str)) {
            try {
                l0g.a();
                pkfVarH = h(context, str);
            } catch (IOException | GeneralSecurityException e) {
                Log.e("FirebearStorageCryptoHelper", "Exception encountered during crypto setup:\n" + e.getMessage());
                if (e instanceof GeneralSecurityException) {
                    context.getSharedPreferences("com.google.firebase.auth.api.crypto.".concat(str), 0).edit().remove("StorageCryptoKeyset").apply();
                    try {
                        pkfVarH = h(context, str);
                    } catch (IOException | GeneralSecurityException e2) {
                        Log.e("FirebearStorageCryptoHelper", "Exception encountered during second attempt to crypto setup:\n" + e2.getMessage());
                        pkfVarH = null;
                    }
                } else {
                    pkfVarH = null;
                }
                return d;
            }
            d = new zjf(str, 6, pkfVarH);
        }
        return d;
    }

    public static pkf h(Context context, String str) {
        iv2 iv2Var = new iv2();
        String strConcat = "com.google.firebase.auth.api.crypto.".concat(str);
        if (context == null) {
            ay0.e("need an Android context");
            return null;
        }
        iv2Var.a = context;
        iv2Var.e = "StorageCryptoKeyset";
        iv2Var.b = strConcat;
        iv2Var.g = n0g.b;
        String strConcat2 = "android-keystore://firebear_main_key_id_for_storage_crypto.".concat(str);
        if (strConcat2.startsWith("android-keystore://")) {
            iv2Var.c = strConcat2;
            return iv2Var.g();
        }
        ay0.e("key URI must start with android-keystore://");
        return null;
    }

    public static void m(zjf zjfVar, d2f d2fVar) {
        tag tagVar = (tag) d2fVar.b;
        tag tagVar2 = (tag) zjfVar.b;
        long[] jArr = (long[]) tagVar2.a;
        long[] jArr2 = (long[]) tagVar.a;
        long[] jArr3 = (long[]) d2fVar.c;
        vv2.j0(jArr, jArr2, jArr3);
        long[] jArr4 = (long[]) tagVar2.b;
        long[] jArr5 = (long[]) tagVar.b;
        long[] jArr6 = (long[]) tagVar.c;
        vv2.j0(jArr4, jArr5, jArr6);
        vv2.j0((long[]) tagVar2.c, jArr6, jArr3);
        vv2.j0((long[]) zjfVar.c, jArr2, jArr5);
    }

    @Override // defpackage.xq8
    public void N(jrg jrgVar) {
        switch (this.a) {
            case 0:
                ((pif) this.c).b.remove((wfd) this.b);
                return;
            default:
                bmg bmgVar = (bmg) this.c;
                wfd wfdVar = (wfd) this.b;
                synchronized (bmgVar.f) {
                    bmgVar.e.remove(wfdVar);
                    break;
                }
                return;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object a(defpackage.osf r5, defpackage.p92 r6) throws com.google.android.recaptcha.internal.zzfx {
        /*
            r4 = this;
            boolean r0 = r6 instanceof defpackage.idg
            if (r0 == 0) goto L13
            r0 = r6
            idg r0 = (defpackage.idg) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            idg r0 = new idg
            r0.<init>(r4, r6)
        L18:
            java.lang.Object r6 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L27
            defpackage.br7.v(r6)     // Catch: java.lang.Exception -> L53 com.google.android.recaptcha.internal.zzfx -> L55
            goto L48
        L27:
            java.lang.String r4 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r4)
            r4 = 0
            return r4
        L2e:
            defpackage.br7.v(r6)
            java.lang.Object r6 = r4.c     // Catch: java.lang.Exception -> L53 com.google.android.recaptcha.internal.zzfx -> L55
            tag r6 = (defpackage.tag) r6     // Catch: java.lang.Exception -> L53 com.google.android.recaptcha.internal.zzfx -> L55
            java.lang.Object r4 = r4.b     // Catch: java.lang.Exception -> L53 com.google.android.recaptcha.internal.zzfx -> L55
            prf r4 = (defpackage.prf) r4     // Catch: java.lang.Exception -> L53 com.google.android.recaptcha.internal.zzfx -> L55
            java.lang.String r4 = r4.d     // Catch: java.lang.Exception -> L53 com.google.android.recaptcha.internal.zzfx -> L55
            byte[] r5 = r5.d()     // Catch: java.lang.Exception -> L53 com.google.android.recaptcha.internal.zzfx -> L55
            r0.d = r3     // Catch: java.lang.Exception -> L53 com.google.android.recaptcha.internal.zzfx -> L55
            java.lang.Object r6 = r6.a(r4, r5, r0)     // Catch: java.lang.Exception -> L53 com.google.android.recaptcha.internal.zzfx -> L55
            if (r6 != r1) goto L48
            return r1
        L48:
            aeg r6 = (defpackage.aeg) r6     // Catch: java.lang.Exception -> L53 com.google.android.recaptcha.internal.zzfx -> L55
            qsf r4 = defpackage.qsf.x()     // Catch: java.lang.Exception -> L53 com.google.android.recaptcha.internal.zzfx -> L55
            emf r4 = r6.b(r4)     // Catch: java.lang.Exception -> L53 com.google.android.recaptcha.internal.zzfx -> L55
            return r4
        L53:
            r4 = move-exception
            goto L57
        L55:
            r4 = move-exception
            goto L67
        L57:
            com.google.android.recaptcha.internal.zzfx r5 = new com.google.android.recaptcha.internal.zzfx
            d87 r6 = defpackage.d87.U0
            d87 r0 = defpackage.d87.o
            java.lang.String r4 = r4.getMessage()
            r1 = 8
            r5.<init>(r6, r0, r4, r1)
            throw r5
        L67:
            throw r4
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.zjf.a(osf, p92):java.lang.Object");
    }

    @Override // defpackage.reg
    public byte[] a0(byte[] bArr, zjf zjfVar) throws GeneralSecurityException {
        byte[] bArrB = ((cfg) this.c).b(((qvg) zjfVar.b).b(), bArr);
        byte[] bArrH = il7.H(bArr, ((qvg) zjfVar.c).b());
        byte[] bArrH2 = il7.H(weg.m, weg.b);
        d1g d1gVar = (d1g) this.b;
        int macLength = Mac.getInstance(d1gVar.b).getMacLength();
        byte[] bArr2 = weg.o;
        Charset charset = ejg.a;
        return d1gVar.e(macLength, d1gVar.f(il7.H(bArr2, bArrH2, "eae_prk".getBytes(charset), bArrB), null), il7.H(weg.b(2, macLength), bArr2, bArrH2, "shared_secret".getBytes(charset), bArrH));
    }

    @Override // defpackage.enf
    public void b(Status status) {
        try {
            ((enf) this.b).b(status);
        } catch (RemoteException e) {
            ((xp) this.c).i("RemoteException when sending failure result.", e, new Object[0]);
        }
    }

    @Override // defpackage.enf
    public void d(o2b o2bVar) {
        try {
            ((enf) this.b).d(o2bVar);
        } catch (RemoteException e) {
            ((xp) this.c).i("RemoteException when sending failure result with credential", e, new Object[0]);
        }
    }

    public void e(uag uagVar) {
        try {
            y(uagVar, (zbg) this.b);
        } catch (Throwable th) {
            rxf.j("BillingLogger", "Unable to log.", th);
        }
    }

    @Override // defpackage.enf
    public void f(bqf bqfVar) {
        try {
            ((enf) this.b).f(bqfVar);
        } catch (RemoteException e) {
            ((xp) this.c).i("RemoteException when sending get recaptcha config response.", e, new Object[0]);
        }
    }

    @Override // defpackage.enf
    public void g(zpf zpfVar) {
        try {
            ((enf) this.b).g(zpfVar);
        } catch (RemoteException e) {
            ((xp) this.c).i("RemoteException when sending token result.", e, new Object[0]);
        }
    }

    @Override // defpackage.kr8
    public /* synthetic */ void i(Object obj) {
        ((wfd) this.b).b((ctg) obj);
        sv0.m((Context) this.c);
    }

    @Override // defpackage.enf
    public void j(zjf zjfVar) {
        try {
            ((enf) this.b).j(zjfVar);
        } catch (RemoteException e) {
            ((xp) this.c).i("RemoteException when sending failure result for mfa", e, new Object[0]);
        }
    }

    @Override // defpackage.enf
    public void k(zpf zpfVar, ppf ppfVar) {
        try {
            ((enf) this.b).k(zpfVar, ppfVar);
        } catch (RemoteException e) {
            ((xp) this.c).i("RemoteException when sending get token and account info user response", e, new Object[0]);
        }
    }

    @Override // defpackage.enf
    public void l(Status status, c99 c99Var) {
        try {
            ((enf) this.b).l(status, c99Var);
        } catch (RemoteException e) {
            ((xp) this.c).i("RemoteException when sending failure result.", e, new Object[0]);
        }
    }

    @Override // defpackage.o92
    public Object m0(jrg jrgVar) {
        Bundle bundle;
        return (jrgVar.k() && (bundle = (Bundle) jrgVar.i()) != null && bundle.containsKey("google.messenger")) ? ((rmb) this.b).a((Bundle) this.c).l(bf3.e, cd7.l) : jrgVar;
    }

    public void n(uag uagVar, int i) {
        try {
            sbg sbgVar = (sbg) ((zbg) this.b).l();
            sbgVar.b();
            zbg.D((zbg) sbgVar.b, i);
            this.b = (zbg) sbgVar.a();
            e(uagVar);
        } catch (Throwable th) {
            rxf.j("BillingLogger", "Unable to log.", th);
        }
    }

    public byte[] o(int i, byte[] bArr) {
        int i2;
        Collection collectionQ;
        byte[] byteArray = BigInteger.valueOf(i).toByteArray();
        int i3 = 12;
        int i4 = 0;
        byte[] bArrL0 = k80.l0((byte[]) this.c, 0, 12 - byteArray.length);
        int length = bArrL0.length;
        int length2 = byteArray.length;
        byte[] bArrCopyOf = Arrays.copyOf(bArrL0, length + length2);
        System.arraycopy(byteArray, 0, bArrCopyOf, length, length2);
        byte[] bArrE = ((pmf) this.b).E();
        int i5 = qpf.a;
        int[] iArr = {511133343, 1277647508, 107287496, 338123662};
        if (bArrE.length != 32) {
            lg8.r();
            return null;
        }
        if (bArrCopyOf.length != 12) {
            lg8.r();
            return null;
        }
        int i6 = 16;
        int[] iArr2 = new int[16];
        int i7 = 0;
        while (true) {
            i2 = 4;
            if (i7 >= 4) {
                break;
            }
            iArr2[i7] = qpf.a(iArr[i7], 2131181306);
            i7++;
        }
        for (int i8 = 4; i8 < 12; i8++) {
            iArr2[i8] = qpf.d((i8 - 4) * 4, bArrE);
        }
        int i9 = 1;
        iArr2[12] = 1;
        int i10 = 13;
        for (int i11 = 13; i11 < 16; i11++) {
            iArr2[i11] = qpf.d((i11 - 13) * 4, bArrCopyOf);
        }
        int[] iArr3 = new int[16];
        System.arraycopy(iArr2, 0, iArr3, 0, 16);
        int length3 = bArr.length;
        byte[] bArr2 = new byte[length3];
        int i12 = 1;
        int i13 = 0;
        int i14 = length3;
        while (i14 > 0) {
            System.arraycopy(iArr3, 0, iArr2, 0, i6);
            iArr2[i3] = i12;
            int i15 = 0;
            while (i15 < 10) {
                qpf.c(0, i2, 8, i3, iArr2);
                qpf.c(i9, 5, 9, i10, iArr2);
                qpf.c(2, 6, 10, 14, iArr2);
                qpf.c(3, 7, 11, 15, iArr2);
                qpf.c(0, 5, 10, 15, iArr2);
                qpf.c(1, 6, 11, 12, iArr2);
                qpf.c(2, 7, 8, 13, iArr2);
                qpf.c(3, 4, 9, 14, iArr2);
                i15++;
                i2 = 4;
                i10 = 13;
                i9 = 1;
                i3 = 12;
            }
            int i16 = i10;
            byte[] bArr3 = new byte[64];
            i6 = 16;
            for (int i17 = 0; i17 < 16; i17++) {
                int i18 = iArr2[i17];
                int i19 = i17 * 4;
                bArr3[i19] = (byte) (i18 & 255);
                bArr3[i19 + 1] = (byte) ((i18 >> 8) & 255);
                bArr3[i19 + 2] = (byte) ((i18 >> 16) & 255);
                bArr3[i19 + 3] = (byte) ((i18 >> 24) & 255);
            }
            int i20 = 0;
            for (int i21 = 64; i20 < Math.min(i21, i14); i21 = 64) {
                int i22 = i13 + i20;
                bArr2[i22] = (byte) qpf.a(bArr3[i20], bArr[i22]);
                i20++;
            }
            i12++;
            i14 -= 64;
            i13 += 64;
            i10 = i16;
            i9 = 1;
            i3 = 12;
            i2 = 4;
        }
        int i23 = length3 + 12;
        byte[] bArr4 = new byte[i23];
        System.arraycopy(bArrCopyOf, 0, bArr4, 0, 12);
        System.arraycopy(bArr2, 0, bArr4, 12, length3);
        int i24 = length3 < 0 ? 0 : length3;
        if (i24 < 0) {
            ywb.g(ev6.w("Requested element count ", i24, " is less than zero."));
            return null;
        }
        if (i24 == 0) {
            collectionQ = ey3.a;
        } else if (i24 >= i23) {
            collectionQ = k80.M0(bArr4);
        } else if (i24 == 1) {
            collectionQ = d46.Q(Byte.valueOf(bArr4[length3 + 11]));
        } else {
            ArrayList arrayList = new ArrayList(i24);
            for (int i25 = i23 - i24; i25 < i23; i25++) {
                arrayList.add(Byte.valueOf(bArr4[i25]));
            }
            collectionQ = arrayList;
        }
        byte[] bArr5 = new byte[collectionQ.size()];
        Iterator it2 = collectionQ.iterator();
        while (it2.hasNext()) {
            bArr5[i4] = ((Number) it2.next()).byteValue();
            i4++;
        }
        return bArr5;
    }

    public void p(uag uagVar, int i, long j) {
        try {
            sbg sbgVar = (sbg) ((zbg) this.b).l();
            sbgVar.b();
            zbg.D((zbg) sbgVar.b, i);
            zbg zbgVar = (zbg) sbgVar.a();
            this.b = zbgVar;
            if (j != 0) {
                sbg sbgVar2 = (sbg) zbgVar.l();
                sbgVar2.g(j);
                zbgVar = (zbg) sbgVar2.a();
            }
            y(uagVar, zbgVar);
        } catch (Throwable th) {
            rxf.j("BillingLogger", "Unable to log.", th);
        }
    }

    public void q(uag uagVar, long j, boolean z) {
        try {
            sag sagVar = (sag) uagVar.l();
            ncg ncgVar = (ncg) uagVar.v().l();
            ncgVar.b();
            zcg.r((zcg) ncgVar.b, z);
            sagVar.b();
            uag.q((uag) sagVar.b, (zcg) ncgVar.a());
            uag uagVar2 = (uag) sagVar.a();
            zbg zbgVar = (zbg) this.b;
            if (j != 0) {
                sbg sbgVar = (sbg) zbgVar.l();
                sbgVar.g(j);
                zbgVar = (zbg) sbgVar.a();
            }
            y(uagVar2, zbgVar);
        } catch (Throwable th) {
            rxf.j("BillingLogger", "Unable to log.", th);
        }
    }

    public void r(uag uagVar, int i, long j, boolean z) {
        try {
            sbg sbgVar = (sbg) ((zbg) this.b).l();
            sbgVar.b();
            zbg.D((zbg) sbgVar.b, i);
            this.b = (zbg) sbgVar.a();
            sag sagVar = (sag) uagVar.l();
            ncg ncgVar = (ncg) uagVar.v().l();
            ncgVar.b();
            zcg.r((zcg) ncgVar.b, z);
            sagVar.b();
            uag.q((uag) sagVar.b, (zcg) ncgVar.a());
            uag uagVar2 = (uag) sagVar.a();
            zbg zbgVar = (zbg) this.b;
            if (j != 0) {
                sbg sbgVar2 = (sbg) zbgVar.l();
                sbgVar2.g(j);
                zbgVar = (zbg) sbgVar2.a();
            }
            y(uagVar2, zbgVar);
        } catch (Throwable th) {
            rxf.j("BillingLogger", "Unable to log.", th);
        }
    }

    public void s(xag xagVar, long j, boolean z) {
        try {
            wag wagVar = (wag) xagVar.l();
            ncg ncgVar = (ncg) xagVar.s().l();
            ncgVar.b();
            zcg.r((zcg) ncgVar.b, z);
            wagVar.b();
            xag.v((xag) wagVar.b, (zcg) ncgVar.a());
            xag xagVar2 = (xag) wagVar.a();
            zbg zbgVar = (zbg) this.b;
            if (j != 0) {
                sbg sbgVar = (sbg) zbgVar.l();
                sbgVar.g(j);
                zbgVar = (zbg) sbgVar.a();
            }
            z(xagVar2, zbgVar);
        } catch (Throwable th) {
            rxf.j("BillingLogger", "Unable to log.", th);
        }
    }

    public void t(hbg hbgVar) {
        try {
            bdg bdgVarS = edg.s();
            bdgVarS.d((zbg) this.b);
            bdgVarS.b();
            edg.v((edg) bdgVarS.b, hbgVar);
            ((sv0) this.c).n((edg) bdgVarS.a());
        } catch (Throwable th) {
            rxf.j("BillingLogger", "Unable to log.", th);
        }
    }

    public void u(BillingResult billingResult, long j) {
        try {
            mbg mbgVarQ = qbg.q();
            mbgVarQ.b();
            qbg.v((qbg) mbgVarQ.b, 4);
            lbg lbgVar = lbg.IN_APP_BILLING_RESULT_UPDATE_ACTION;
            mbgVarQ.b();
            qbg.r((qbg) mbgVarQ.b, lbgVar);
            if (billingResult != null) {
                zag zagVarR = fbg.r();
                zagVarR.e(billingResult.getResponseCode());
                String debugMessage = billingResult.getDebugMessage();
                zagVarR.b();
                fbg.t((fbg) zagVarR.b, debugMessage);
                mbgVarQ.b();
                qbg.s((qbg) mbgVarQ.b, (fbg) zagVarR.a());
            }
            bdg bdgVarS = edg.s();
            zbg zbgVar = (zbg) this.b;
            if (j != 0) {
                sbg sbgVar = (sbg) zbgVar.l();
                sbgVar.g(j);
                zbgVar = (zbg) sbgVar.a();
            }
            bdgVarS.d(zbgVar);
            bdgVarS.b();
            edg.w((edg) bdgVarS.b, (qbg) mbgVarQ.a());
            ((sv0) this.c).n((edg) bdgVarS.a());
        } catch (Throwable th) {
            rxf.j("BillingLogger", "Unable to log.", th);
        }
    }

    public void v(odg odgVar) {
        try {
            bdg bdgVarS = edg.s();
            bdgVarS.d((zbg) this.b);
            mbg mbgVarQ = qbg.q();
            mbgVarQ.b();
            qbg.t((qbg) mbgVarQ.b);
            mbgVarQ.b();
            qbg.v((qbg) mbgVarQ.b, 2);
            mbgVarQ.b();
            qbg.u((qbg) mbgVarQ.b, odgVar);
            bdgVarS.b();
            edg.w((edg) bdgVarS.b, (qbg) mbgVarQ.a());
            ((sv0) this.c).n((edg) bdgVarS.a());
        } catch (Throwable th) {
            rxf.j("BillingLogger", "Unable to log.", th);
        }
    }

    public void w(sdg sdgVar) {
        try {
            sv0 sv0Var = (sv0) this.c;
            bdg bdgVarS = edg.s();
            bdgVarS.d((zbg) this.b);
            bdgVarS.b();
            edg.q((edg) bdgVarS.b, sdgVar);
            sv0Var.n((edg) bdgVarS.a());
        } catch (Throwable th) {
            rxf.j("BillingLogger", "Unable to log.", th);
        }
    }

    public void x(udg udgVar) {
        if (udgVar == null) {
            return;
        }
        try {
            bdg bdgVarS = edg.s();
            bdgVarS.d((zbg) this.b);
            bdgVarS.b();
            edg.r((edg) bdgVarS.b, udgVar);
            ((sv0) this.c).n((edg) bdgVarS.a());
        } catch (Throwable th) {
            rxf.j("BillingLogger", "Unable to log.", th);
        }
    }

    public void y(uag uagVar, zbg zbgVar) {
        if (uagVar == null) {
            return;
        }
        try {
            bdg bdgVarS = edg.s();
            bdgVarS.d(zbgVar);
            bdgVarS.b();
            edg.t((edg) bdgVarS.b, uagVar);
            ((sv0) this.c).n((edg) bdgVarS.a());
        } catch (Throwable th) {
            rxf.j("BillingLogger", "Unable to log.", th);
        }
    }

    public void z(xag xagVar, zbg zbgVar) {
        if (xagVar == null) {
            return;
        }
        try {
            bdg bdgVarS = edg.s();
            bdgVarS.d(zbgVar);
            bdgVarS.b();
            edg.u((edg) bdgVarS.b, xagVar);
            ((sv0) this.c).n((edg) bdgVarS.a());
        } catch (Throwable th) {
            rxf.j("BillingLogger", "Unable to log.", th);
        }
    }

    @Override // defpackage.reg
    /* JADX INFO: renamed from: zza */
    public byte[] mo102zza() throws GeneralSecurityException {
        byte[] bArr;
        switch (((d1g) this.b).b) {
            case "HmacSha256":
                bArr = weg.f;
                break;
            case "HmacSha384":
                bArr = weg.g;
                break;
            case "HmacSha512":
                bArr = weg.h;
                break;
            default:
                ygf.l("Could not determine HPKE KDF ID");
                return null;
        }
        if (Arrays.equals(bArr, weg.f)) {
            return weg.b;
        }
        ygf.l("Could not determine HPKE KEM ID");
        return null;
    }

    public /* synthetic */ zjf(Object obj, Object obj2, Object obj3, int i) {
        this.a = i;
        this.b = obj2;
        this.c = obj3;
    }

    public /* synthetic */ zjf(bmg bmgVar, wfd wfdVar) {
        this.a = 11;
        this.c = bmgVar;
        this.b = wfdVar;
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public zjf(int i) {
        this(new tag(), 14, new long[10]);
        this.a = i;
        switch (i) {
            case 14:
                break;
        }
    }

    public /* synthetic */ zjf(Object obj, int i, Object obj2) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
    }

    public zjf(pif pifVar, wfd wfdVar) {
        this.a = 0;
        this.b = wfdVar;
        Objects.requireNonNull(pifVar);
        this.c = pifVar;
    }

    public zjf(pmf pmfVar) {
        this.a = 8;
        this.b = pmfVar;
        int i = qpf.a;
        byte[] bArr = new byte[12];
        new SecureRandom().nextBytes(bArr);
        this.c = bArr;
    }

    public zjf(d1g d1gVar) {
        Object y8gVar;
        this.a = 13;
        this.b = d1gVar;
        try {
            y8gVar = zg7.v0();
        } catch (GeneralSecurityException unused) {
            y8gVar = new y8g();
        }
        this.c = y8gVar;
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public zjf(d2f d2fVar) {
        this(14);
        this.a = 14;
        m(this, d2fVar);
    }

    public zjf(String str, List list, lxf lxfVar) {
        this.a = 1;
        this.b = str;
        this.c = list;
    }

    public zjf(enf enfVar, xp xpVar) {
        this.a = 2;
        vp7.p(enfVar);
        this.b = enfVar;
        vp7.p(xpVar);
        this.c = xpVar;
    }
}
