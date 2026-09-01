package defpackage;

import android.content.Context;
import android.content.Intent;
import android.os.Parcelable;
import com.apollographql.apollo.exception.ApolloGraphQLException;
import com.google.android.recaptcha.internal.zzad;
import com.google.android.recaptcha.internal.zzae;
import com.google.android.recaptcha.internal.zzag;
import com.google.android.recaptcha.internal.zzah;
import com.google.android.recaptcha.internal.zzak;
import com.google.android.recaptcha.internal.zzao;
import com.google.android.recaptcha.internal.zzb;
import com.google.android.recaptcha.internal.zzf;
import com.google.android.recaptcha.internal.zzy;
import com.google.android.recaptcha.internal.zzz;
import j$.util.Optional;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class sv0 implements c8, ara {
    public static sv0 d;
    public final /* synthetic */ int a;
    public boolean b;
    public Object c;

    public sv0() {
        this.a = 10;
        hz2 hz2Var = new hz2(3);
        ybg ybgVar = new ybg();
        opg opgVar = new opg(mpg.b, 0, new wbg());
        opgVar.d = ybgVar;
        this.c = new iuf(hz2Var, opgVar);
        this.b = false;
    }

    public static lxf k(Intent intent) {
        Parcelable.Creator<frf> creator = frf.CREATOR;
        byte[] byteArrayExtra = intent.getByteArrayExtra("com.google.firebase.auth.internal.VERIFY_ASSERTION_REQUEST");
        frf frfVar = (frf) (byteArrayExtra == null ? null : mo7.H(byteArrayExtra, creator));
        frfVar.i = true;
        return lxf.g(frfVar);
    }

    public static void m(Context context) {
        sv0 sv0Var = d;
        sv0Var.b = false;
        if (((dwf) sv0Var.c) != null) {
            iq1.C(context).T((dwf) d.c);
        }
        d.c = null;
    }

    public void a() {
        this.b = false;
    }

    @Override // defpackage.ara
    public void b(zqa zqaVar, int i) {
        StringBuilder sb = (StringBuilder) this.c;
        if (this.b) {
            this.b = false;
        } else {
            sb.append(", ");
        }
        sb.append(i);
    }

    public void c(byte b) {
        ((ad) this.c).x(String.valueOf(b));
    }

    public void d(char c) {
        ad adVar = (ad) this.c;
        adVar.j(adVar.b, 1);
        char[] cArr = (char[]) adVar.c;
        int i = adVar.b;
        adVar.b = i + 1;
        cArr[i] = c;
    }

    public void e(int i) {
        ((ad) this.c).x(String.valueOf(i));
    }

    public void f(long j) {
        ((ad) this.c).x(String.valueOf(j));
    }

    @Override // defpackage.c8
    public Object fromJson(fd6 fd6Var, yl2 yl2Var) {
        if (this.b) {
            if (fd6Var instanceof sh7) {
                fd6Var = (sh7) fd6Var;
            } else {
                cd6 cd6VarPeek = fd6Var.peek();
                if (cd6VarPeek != cd6.BEGIN_OBJECT) {
                    z72.e("Failed to buffer json reader, expected `BEGIN_OBJECT` but found `", cd6VarPeek, "` json token");
                    return null;
                }
                ArrayList arrayListH = fd6Var.h();
                Object objY = d46.Y(fd6Var);
                objY.getClass();
                fd6Var = new sh7((Map) objY, arrayListH);
            }
        }
        fd6Var.i();
        try {
            Object objFromJson = ((c8) this.c).fromJson(fd6Var, yl2Var);
            fd6Var.e();
            return objFromJson;
        } catch (ApolloGraphQLException e) {
            while (fd6Var.hasNext()) {
                fd6Var.X();
                fd6Var.v();
            }
            fd6Var.e();
            throw e;
        }
    }

    public void g(short s) {
        ((ad) this.c).x(String.valueOf(s));
    }

    public void h(String str) {
        byte b;
        str.getClass();
        ad adVar = (ad) this.c;
        adVar.j(adVar.b, str.length() + 2);
        char[] cArr = (char[]) adVar.c;
        int i = adVar.b;
        int i2 = i + 1;
        cArr[i] = '\"';
        int length = str.length();
        str.getChars(0, length, cArr, i2);
        int i3 = length + i2;
        int i4 = i2;
        while (i4 < i3) {
            char c = cArr[i4];
            byte[] bArr = iuc.b;
            if (c < bArr.length && bArr[c] != 0) {
                int length2 = str.length();
                for (int i5 = i4 - i2; i5 < length2; i5++) {
                    adVar.j(i4, 2);
                    char cCharAt = str.charAt(i5);
                    byte[] bArr2 = iuc.b;
                    if (cCharAt >= bArr2.length || (b = bArr2[cCharAt]) == 0) {
                        int i6 = i4 + 1;
                        ((char[]) adVar.c)[i4] = cCharAt;
                        i4 = i6;
                    } else {
                        if (b == 1) {
                            String str2 = iuc.a[cCharAt];
                            str2.getClass();
                            adVar.j(i4, str2.length());
                            str2.getChars(0, str2.length(), (char[]) adVar.c, i4);
                            int length3 = str2.length() + i4;
                            adVar.b = length3;
                            i4 = length3;
                        } else {
                            char[] cArr2 = (char[]) adVar.c;
                            cArr2[i4] = '\\';
                            cArr2[i4 + 1] = (char) b;
                            i4 += 2;
                            adVar.b = i4;
                        }
                    }
                }
                adVar.j(i4, 1);
                ((char[]) adVar.c)[i4] = '\"';
                adVar.b = i4 + 1;
                return;
            }
            i4++;
        }
        cArr[i3] = '\"';
        adVar.b = i3 + 1;
    }

    public void l() throws zzf {
        hz2 hz2Var = ((iuf) this.c).a;
        boolean z = this.b;
        String strA = cmg.a("BkCyvAwRMTm0TkOZyDYQMHRR/BfGWZQu16Q1Ljk3pdYDZK5S");
        if (z) {
            return;
        }
        try {
            HashMap map = cuf.a;
            xp xpVar = new xp(4);
            xpVar.H(lrg.zza, gvf.f(phg.s));
            xpVar.H(lrg.zzb, b9g.a(0L));
            xpVar.H(lrg.zzc, b9g.a(1L));
            xpVar.H(lrg.zzd, b9g.a(2L));
            xpVar.H(lrg.zze, b9g.a(3L));
            xpVar.H(lrg.zzf, b9g.a(4L));
            xpVar.H(lrg.zzg, b9g.a(7L));
            xpVar.H(lrg.zzh, b9g.a(-1L));
            xpVar.H(lrg.zzi, b9g.a(-2L));
            xpVar.H(lrg.zzj, gvf.f(hgg.b));
            xpVar.H(lrg.zzk, gvf.f(hgg.d));
            xpVar.H(lrg.zzl, gvf.f(hgg.j));
            xpVar.H(lrg.zzm, gvf.f(hgg.k));
            xpVar.H(lrg.zzn, gvf.f(hgg.n));
            xpVar.H(lrg.zzo, gvf.f(phg.n));
            xpVar.H(lrg.zzp, gvf.f(hgg.f));
            xpVar.H(lrg.zzq, gvf.f(hgg.g));
            xpVar.H(lrg.zzr, gvf.f(hgg.h));
            xpVar.H(lrg.zzs, gvf.f(hgg.i));
            xpVar.H(lrg.zzt, gvf.f(phg.h));
            xpVar.H(lrg.zzu, gvf.f(phg.j));
            xpVar.H(lrg.zzw, gvf.f(hgg.o));
            xpVar.H(lrg.zzx, gvf.f(hgg.p));
            xpVar.H(lrg.zzy, gvf.f(hgg.s));
            xpVar.H(lrg.zzz, gvf.f(hgg.t));
            xpVar.H(lrg.zzA, gvf.f(hgg.u));
            xpVar.H(lrg.zzB, gvf.f(hgg.v));
            xpVar.H(lrg.zzC, gvf.f(phg.b));
            xpVar.H(lrg.zzD, gvf.f(phg.d));
            xpVar.H(lrg.zzE, gvf.f(phg.e));
            xpVar.H(lrg.zzF, gvf.f(phg.f));
            xpVar.H(lrg.zzG, gvf.f(phg.k));
            xpVar.H(lrg.zzH, gvf.f(phg.l));
            xpVar.H(lrg.zzI, gvf.f(phg.p));
            xpVar.H(lrg.zzJ, gvf.f(phg.q));
            xpVar.H(lrg.zzK, gvf.f(phg.u));
            xpVar.H(lrg.zzL, gvf.f(phg.v));
            xpVar.H(lrg.zzM, gvf.f(nkg.b));
            xpVar.H(lrg.zzN, gvf.f(nkg.d));
            xpVar.H(lrg.zzU, gvf.f(nkg.e));
            xpVar.H(lrg.zzO, gvf.f(nkg.j));
            xpVar.H(lrg.zzP, gvf.f(nkg.k));
            xpVar.H(lrg.zzQ, gvf.f(nkg.n));
            xpVar.H(lrg.zzR, gvf.f(nkg.q));
            xpVar.H(lrg.zzS, gvf.f(hgg.q));
            xpVar.H(lrg.zzT, gvf.f(nkg.l));
            xpVar.H(lrg.zzV, gvf.f(hgg.l));
            xpVar.H(lrg.zzW, gvf.f(nkg.g));
            xpVar.H(lrg.zzX, gvf.f(nkg.h));
            xpVar.H(lrg.zzv, gvf.f(phg.i));
            xpVar.H(lrg.zzY, gvf.f(nkg.p));
            xpVar.H(lrg.zzZ, gvf.f(phg.m));
            xpVar.H(lrg.zzaa, gvf.f(nkg.o));
            xpVar.H(lrg.zzab, gvf.f(phg.c));
            xpVar.H(lrg.zzac, gvf.f(nkg.c));
            xpVar.H(lrg.zzad, gvf.f(hgg.r));
            xpVar.H(lrg.zzae, gvf.f(nkg.m));
            xpVar.H(lrg.zzaf, gvf.f(hgg.e));
            xpVar.H(lrg.zzag, gvf.f(nkg.f));
            xpVar.H(lrg.zzah, gvf.f(phg.t));
            xpVar.H(lrg.zzai, gvf.f(hgg.c));
            xpVar.H(lrg.zzaj, gvf.f(nkg.i));
            xpVar.H(lrg.zzak, gvf.f(phg.o));
            xpVar.H(lrg.zzal, gvf.f(hgg.m));
            xpVar.H(lrg.zzam, gvf.f(phg.r));
            xpVar.H(lrg.zzan, gvf.f(phg.g));
            khg khgVarI = xpVar.I();
            for (long j = -1; j >= -89; j--) {
                lrg lrgVar = (lrg) map.get(Long.valueOf(j));
                if (lrgVar == null) {
                    StringBuilder sb = new StringBuilder(String.valueOf(j).length() + 36);
                    sb.append(strA);
                    sb.append(j);
                    throw new zzak(sb.toString());
                }
                hz2Var.e((gvf) khgVarI.get(lrgVar));
            }
            for (int i = 89; i < 681; i++) {
                hz2Var.e(gvf.a(null));
            }
            this.b = true;
        } catch (zzah e) {
            throw new zzf(v1g.zza, e);
        }
    }

    public void n(edg edgVar) {
        if (this.b) {
            rxf.i("BillingLogger", "Skipping logging since initialization failed.");
            return;
        }
        try {
            ((iq1) this.c).N(new gj0(edgVar, z0a.DEFAULT, null), new ywb(9));
        } catch (Throwable unused) {
            rxf.i("BillingLogger", "logging failed.");
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r19v0 */
    /* JADX WARN: Type inference failed for: r19v1 */
    /* JADX WARN: Type inference failed for: r19v4 */
    public Object o(Optional optional) throws zzf, zzb {
        ?? r19;
        Object obj;
        long j;
        kxf kxfVar;
        Object objOf;
        long j2;
        iuf iufVar = (iuf) this.c;
        nec necVar = iufVar.b;
        hz2 hz2Var = iufVar.a;
        opg opgVar = iufVar.c;
        try {
            try {
                boolean z = false;
                if (this.b) {
                    r19 = 0;
                    obj = null;
                    j = 2;
                } else {
                    String strA = cmg.a("BkCyvAwRMTm0TkOZyDYQMHRR/BfGWZQu16Q1Ljk3pdYDZK5S");
                    obj = null;
                    try {
                        HashMap map = cuf.a;
                        j = 2;
                        xp xpVar = new xp(16, (byte) 0);
                        xpVar.H(lrg.zza, gvf.f(phg.s));
                        xpVar.H(lrg.zzb, b9g.a(0L));
                        xpVar.H(lrg.zzc, b9g.a(1L));
                        xpVar.H(lrg.zzd, b9g.a(2L));
                        xpVar.H(lrg.zze, b9g.a(3L));
                        xpVar.H(lrg.zzf, b9g.a(4L));
                        xpVar.H(lrg.zzg, b9g.a(7L));
                        xpVar.H(lrg.zzh, b9g.a(-1L));
                        xpVar.H(lrg.zzi, b9g.a(-2L));
                        xpVar.H(lrg.zzj, gvf.f(hgg.b));
                        xpVar.H(lrg.zzk, gvf.f(hgg.d));
                        xpVar.H(lrg.zzl, gvf.f(hgg.j));
                        xpVar.H(lrg.zzm, gvf.f(hgg.k));
                        xpVar.H(lrg.zzn, gvf.f(hgg.n));
                        xpVar.H(lrg.zzo, gvf.f(phg.n));
                        xpVar.H(lrg.zzp, gvf.f(hgg.f));
                        xpVar.H(lrg.zzq, gvf.f(hgg.g));
                        xpVar.H(lrg.zzr, gvf.f(hgg.h));
                        xpVar.H(lrg.zzs, gvf.f(hgg.i));
                        xpVar.H(lrg.zzt, gvf.f(phg.h));
                        xpVar.H(lrg.zzu, gvf.f(phg.j));
                        xpVar.H(lrg.zzw, gvf.f(hgg.o));
                        xpVar.H(lrg.zzx, gvf.f(hgg.p));
                        xpVar.H(lrg.zzy, gvf.f(hgg.s));
                        xpVar.H(lrg.zzz, gvf.f(hgg.t));
                        xpVar.H(lrg.zzA, gvf.f(hgg.u));
                        xpVar.H(lrg.zzB, gvf.f(hgg.v));
                        xpVar.H(lrg.zzC, gvf.f(phg.b));
                        xpVar.H(lrg.zzD, gvf.f(phg.d));
                        xpVar.H(lrg.zzE, gvf.f(phg.e));
                        xpVar.H(lrg.zzF, gvf.f(phg.f));
                        xpVar.H(lrg.zzG, gvf.f(phg.k));
                        xpVar.H(lrg.zzH, gvf.f(phg.l));
                        xpVar.H(lrg.zzI, gvf.f(phg.p));
                        xpVar.H(lrg.zzJ, gvf.f(phg.q));
                        xpVar.H(lrg.zzK, gvf.f(phg.u));
                        xpVar.H(lrg.zzL, gvf.f(phg.v));
                        xpVar.H(lrg.zzM, gvf.f(nkg.b));
                        xpVar.H(lrg.zzN, gvf.f(nkg.d));
                        xpVar.H(lrg.zzU, gvf.f(nkg.e));
                        xpVar.H(lrg.zzO, gvf.f(nkg.j));
                        xpVar.H(lrg.zzP, gvf.f(nkg.k));
                        xpVar.H(lrg.zzQ, gvf.f(nkg.n));
                        xpVar.H(lrg.zzR, gvf.f(nkg.q));
                        xpVar.H(lrg.zzS, gvf.f(hgg.q));
                        xpVar.H(lrg.zzT, gvf.f(nkg.l));
                        xpVar.H(lrg.zzV, gvf.f(hgg.l));
                        xpVar.H(lrg.zzW, gvf.f(nkg.g));
                        xpVar.H(lrg.zzX, gvf.f(nkg.h));
                        xpVar.H(lrg.zzv, gvf.f(phg.i));
                        xpVar.H(lrg.zzY, gvf.f(nkg.p));
                        xpVar.H(lrg.zzZ, gvf.f(phg.m));
                        xpVar.H(lrg.zzaa, gvf.f(nkg.o));
                        xpVar.H(lrg.zzab, gvf.f(phg.c));
                        xpVar.H(lrg.zzac, gvf.f(nkg.c));
                        xpVar.H(lrg.zzad, gvf.f(hgg.r));
                        xpVar.H(lrg.zzae, gvf.f(nkg.m));
                        xpVar.H(lrg.zzaf, gvf.f(hgg.e));
                        xpVar.H(lrg.zzag, gvf.f(nkg.f));
                        xpVar.H(lrg.zzah, gvf.f(phg.t));
                        xpVar.H(lrg.zzai, gvf.f(hgg.c));
                        xpVar.H(lrg.zzaj, gvf.f(nkg.i));
                        xpVar.H(lrg.zzak, gvf.f(phg.o));
                        xpVar.H(lrg.zzal, gvf.f(hgg.m));
                        xpVar.H(lrg.zzam, gvf.f(phg.r));
                        xpVar.H(lrg.zzan, gvf.f(phg.g));
                        khg khgVarI = xpVar.I();
                        long j3 = -1;
                        while (j3 >= -89) {
                            boolean z2 = z;
                            lrg lrgVar = (lrg) map.get(Long.valueOf(j3));
                            if (lrgVar == null) {
                                StringBuilder sb = new StringBuilder(String.valueOf(j3).length() + 36);
                                sb.append(strA);
                                sb.append(j3);
                                throw new zzak(sb.toString());
                            }
                            hz2Var.e((gvf) khgVarI.get(lrgVar));
                            j3--;
                            z = z2;
                        }
                        r19 = z;
                        for (int i = 89; i < 681; i++) {
                            hz2Var.e(gvf.a(null));
                        }
                        this.b = true;
                    } catch (zzah e) {
                        throw new zzf(v1g.zza, e);
                    }
                }
                try {
                    opgVar.a(0L);
                    opgVar.c = new wbg();
                    String strA2 = cmg.a("Ake3rgkWMjm/WV6IwjgYPC5W5wzEVsBo");
                    String strA3 = cmg.a("Ake3rgkWMjm/WV6IwjgYPC5A+hHdWNcn1PY=");
                    try {
                        int iF = opgVar.f();
                        int i2 = ((iF & 65535) << 16) >> 16;
                        int i3 = (((iF >> 16) & 65535) << 16) >> 16;
                        if (i2 != -14426) {
                            String strA4 = cmg.a("e1Hk+x0=");
                            Object[] objArr = new Object[1];
                            objArr[r19] = Short.valueOf((short) i2);
                            throw new zzb(strA2.concat(String.format(strA4, objArr)));
                        }
                        if (i3 != 5) {
                            String strA5 = cmg.a("e1Hk+x0=");
                            Object[] objArr2 = new Object[1];
                            objArr2[r19] = Short.valueOf((short) i3);
                            throw new zzb(strA3.concat(String.format(strA5, objArr2)));
                        }
                        String strA6 = cmg.a("HkeprgsbOny5AEiU1TIfNmpVqAjMRcch17g1");
                        try {
                            int iF2 = opgVar.f();
                            if (iF2 != 78977249) {
                                String strA7 = cmg.a("e1Hk9x0=");
                                Object[] objArr3 = new Object[1];
                                objArr3[r19] = Integer.valueOf(iF2);
                                throw new zzb(strA6.concat(String.format(strA7, objArr3)));
                            }
                            try {
                                int[] iArr = {opgVar.f()};
                                int[] iArr2 = wkf.a;
                                ybg ybgVar = (ybg) opgVar.d;
                                int i4 = iArr[r19];
                                ybgVar.getClass();
                                opgVar.c = new xp(new t46(i4, iArr2));
                                try {
                                    opgVar.a(96L);
                                    dhg dhgVar = l8g.a;
                                    Optional.empty();
                                    Object objA = true != optional.isPresent() ? gvf.a(obj) : optional.get();
                                    hz2Var.e(objA instanceof gvf ? (gvf) objA : gvf.g(objA));
                                    hz2Var.e(gvf.a(obj));
                                    necVar.i(0L, 0L, hz2Var.b);
                                    while (!((ArrayDeque) necVar.b).isEmpty()) {
                                        long jC = opgVar.c();
                                        try {
                                            try {
                                                try {
                                                    try {
                                                        objOf = hz2Var.g(opgVar.e()).p().apply(iufVar);
                                                    } catch (Throwable unused) {
                                                        kxfVar = kxf.zzv;
                                                        objOf = Optional.of(kxfVar);
                                                    }
                                                } catch (zzao unused2) {
                                                    kxfVar = kxf.zzc;
                                                }
                                            } catch (zzag unused3) {
                                                kxfVar = kxf.zzb;
                                            }
                                        } catch (zzz unused4) {
                                            kxfVar = kxf.zzu;
                                        }
                                        Optional optional2 = (Optional) objOf;
                                        if (optional2.isPresent()) {
                                            if (!l8g.a.contains(optional2.get())) {
                                                throw new zzf(v1g.zzg, (kxf) optional2.get(), jC);
                                            }
                                            Object obj2 = optional2.get();
                                            long jC2 = opgVar.c();
                                            do {
                                                try {
                                                    j2 = necVar.k().c;
                                                    Optional optionalA = iufVar.a();
                                                    if (optionalA.isPresent() && optionalA.get() == kxf.zzw) {
                                                        throw new zzf(v1g.zzg, (kxf) obj2, jC2);
                                                    }
                                                    if (optionalA.isPresent()) {
                                                        throw new zzf(v1g.zzg, (kxf) optionalA.get(), jC2);
                                                    }
                                                } catch (zzae unused5) {
                                                    throw new zzf(v1g.zzg, (kxf) obj2, jC2);
                                                }
                                            } while (j2 != j);
                                        }
                                    }
                                    try {
                                        gvf gvfVarF = hz2Var.f();
                                        hz2Var.f();
                                        return gvfVarF.h();
                                    } catch (zzag e2) {
                                        throw new zzf(v1g.zze, e2);
                                    } catch (zzao e3) {
                                        throw new zzf(v1g.zzf, e3);
                                    }
                                } catch (zzy e4) {
                                    e = e4;
                                    throw new AssertionError(cmg.a("CEiv6BFfPnitUE+D"), e);
                                } catch (zzz e5) {
                                    e = e5;
                                    throw new AssertionError(cmg.a("CEiv6BFfPnitUE+D"), e);
                                }
                            } catch (zzz e6) {
                                throw new zzf(v1g.zzd, e6);
                            }
                        } catch (zzz e7) {
                            throw new zzb(cmg.a("BkCyvAwRMTm/WV6IwjgYPC5Y7R/NUsZm"), e7);
                        }
                    } catch (zzz e8) {
                        throw new zzb(cmg.a("BkCyvAwRMTm/WV6IwjgYPC5Y7R/NUsZm"), e8);
                    }
                } catch (zzy e9) {
                    e = e9;
                    throw new AssertionError(cmg.a("CEiv6BFfPnitUE+D"), e);
                } catch (zzz e10) {
                    e = e10;
                    throw new AssertionError(cmg.a("CEiv6BFfPnitUE+D"), e);
                }
            } catch (zzah e11) {
                throw new zzf(v1g.zzb, e11);
            }
        } catch (zzad e12) {
            throw new zzf(v1g.zzc, e12);
        }
    }

    public Object p(long j, Optional optional) throws zzf, zzb {
        kxf kxfVar;
        Object objOf;
        long j2;
        iuf iufVar = (iuf) this.c;
        nec necVar = iufVar.b;
        hz2 hz2Var = iufVar.a;
        opg opgVar = iufVar.c;
        try {
            if (!this.b) {
                l();
            }
            try {
                opgVar.a(0L);
                opgVar.c = new wbg();
                try {
                    int iF = opgVar.f();
                    int i = ((iF & 65535) << 16) >> 16;
                    int i2 = (((iF >> 16) & 65535) << 16) >> 16;
                    if (i != -14426) {
                        throw new zzb(cmg.a("Ake3rgkWMjm/WV6IwjgYPC5W5wzEVsBo").concat(String.format(cmg.a("e1Hk+x0="), Short.valueOf((short) i))));
                    }
                    if (i2 != 5) {
                        throw new zzb(cmg.a("Ake3rgkWMjm/WV6IwjgYPC5A+hHdWNcn1PY=").concat(String.format(cmg.a("e1Hk+x0="), Short.valueOf((short) i2))));
                    }
                    int[] iArr = {1562478999, 1463850529, 1260006094, 340390947, 1789747714, -1196532793, 55708026, 1386122429, 371888680};
                    int i3 = iArr[0];
                    int iF2 = lv8.f(((~i3) & iArr[1]) | iArr[2], (i3 & iArr[3]) | iArr[4], iArr[5], iArr[6]) ^ (iArr[7] % 371888680);
                    try {
                        int iF3 = opgVar.f();
                        if (iF3 != iF2) {
                            throw new zzb(cmg.a("HkeprgsbOny5AEiU1TIfNmpVqAjMRcch17g1").concat(String.format(cmg.a("e1Hk9x0="), Integer.valueOf(iF3))));
                        }
                        try {
                            int[] iArr2 = {opgVar.f()};
                            int[] iArr3 = wkf.a;
                            ybg ybgVar = (ybg) opgVar.d;
                            int i4 = iArr2[0];
                            ybgVar.getClass();
                            opgVar.c = new xp(new t46(i4, iArr3));
                            try {
                                opgVar.a(j);
                                dhg dhgVar = l8g.a;
                                Optional.empty();
                                Object objA = true != optional.isPresent() ? gvf.a(null) : optional.get();
                                hz2Var.e(objA instanceof gvf ? (gvf) objA : gvf.g(objA));
                                hz2Var.e(gvf.a(null));
                                necVar.i(0L, 0L, hz2Var.b);
                                while (!((ArrayDeque) necVar.b).isEmpty()) {
                                    long jC = opgVar.c();
                                    try {
                                        try {
                                            try {
                                                try {
                                                    objOf = hz2Var.g(opgVar.e()).p().apply(iufVar);
                                                } catch (Throwable unused) {
                                                    kxfVar = kxf.zzv;
                                                    objOf = Optional.of(kxfVar);
                                                }
                                            } catch (zzao unused2) {
                                                kxfVar = kxf.zzc;
                                            }
                                        } catch (zzag unused3) {
                                            kxfVar = kxf.zzb;
                                        }
                                    } catch (zzz unused4) {
                                        kxfVar = kxf.zzu;
                                    }
                                    Optional optional2 = (Optional) objOf;
                                    if (optional2.isPresent()) {
                                        if (!l8g.a.contains(optional2.get())) {
                                            throw new zzf(v1g.zzg, (kxf) optional2.get(), jC);
                                        }
                                        Object obj = optional2.get();
                                        long[] jArr = {506959639, 1442955280, 62548278, 1413971974, 148798230, 2046775638, 850598623, 978128825, 553574882};
                                        long j3 = jArr[0];
                                        long j4 = jArr[1];
                                        long j5 = jArr[2];
                                        long j6 = jArr[3];
                                        long j7 = jArr[4];
                                        long j8 = jArr[5];
                                        long j9 = jArr[6];
                                        long j10 = jArr[7];
                                        long j11 = (((((~j3) & j4) | j5) + ((j3 & j6) | j7)) - j8) + j9;
                                        long j12 = j10 % 553574882;
                                        long jC2 = opgVar.c();
                                        do {
                                            try {
                                                j2 = necVar.k().c;
                                                Optional optionalA = iufVar.a();
                                                if (optionalA.isPresent() && optionalA.get() == kxf.zzw) {
                                                    throw new zzf(v1g.zzg, (kxf) obj, jC2);
                                                }
                                                if (optionalA.isPresent()) {
                                                    throw new zzf(v1g.zzg, (kxf) optionalA.get(), jC2);
                                                }
                                            } catch (zzae unused5) {
                                                throw new zzf(v1g.zzg, (kxf) obj, jC2);
                                            }
                                        } while (j2 != (j11 ^ j12));
                                    }
                                }
                                try {
                                    gvf gvfVarF = hz2Var.f();
                                    hz2Var.f();
                                    return gvfVarF.h();
                                } catch (zzag e) {
                                    throw new zzf(v1g.zze, e);
                                } catch (zzao e2) {
                                    throw new zzf(v1g.zzf, e2);
                                }
                            } catch (zzy e3) {
                                e = e3;
                                throw new AssertionError(cmg.a("CEiv6BFfPnitUE+D"), e);
                            } catch (zzz e4) {
                                e = e4;
                                throw new AssertionError(cmg.a("CEiv6BFfPnitUE+D"), e);
                            }
                        } catch (zzz e5) {
                            throw new zzf(v1g.zzd, e5);
                        }
                    } catch (zzz e6) {
                        throw new zzb(cmg.a("BkCyvAwRMTm/WV6IwjgYPC5Y7R/NUsZm"), e6);
                    }
                } catch (zzz e7) {
                    throw new zzb(cmg.a("BkCyvAwRMTm/WV6IwjgYPC5Y7R/NUsZm"), e7);
                }
            } catch (zzy e8) {
                e = e8;
                throw new AssertionError(cmg.a("CEiv6BFfPnitUE+D"), e);
            } catch (zzz e9) {
                e = e9;
                throw new AssertionError(cmg.a("CEiv6BFfPnitUE+D"), e);
            }
        } catch (zzad e10) {
            throw new zzf(v1g.zzc, e10);
        } catch (zzah e11) {
            throw new zzf(v1g.zzb, e11);
        }
    }

    @Override // defpackage.c8
    public void toJson(ae6 ae6Var, yl2 yl2Var, Object obj) {
        c8 c8Var = (c8) this.c;
        yl2Var.getClass();
        if (!this.b || (ae6Var instanceof wh7)) {
            ae6Var.i();
            c8Var.toJson(ae6Var, yl2Var, obj);
            ae6Var.e();
            return;
        }
        wh7 wh7Var = new wh7();
        wh7Var.i();
        c8Var.toJson(wh7Var, yl2Var, obj);
        wh7Var.e();
        Object objM = wh7Var.m();
        objM.getClass();
        f76.R(ae6Var, objM);
    }

    public String toString() {
        switch (this.a) {
            case 3:
                return this.b ? "FALL_THROUGH" : String.valueOf(this.c);
            default:
                return super.toString();
        }
    }

    public void i() {
    }

    public void j() {
    }

    public /* synthetic */ sv0(int i) {
        this.a = i;
    }

    public /* synthetic */ sv0(int i, Object obj) {
        this.a = i;
        this.c = obj;
        this.b = true;
    }

    public /* synthetic */ sv0(Object obj, boolean z, int i) {
        this.a = i;
        this.c = obj;
        this.b = z;
    }

    public sv0(c8 c8Var, boolean z) {
        this.a = 4;
        c8Var.getClass();
        this.c = c8Var;
        this.b = z;
    }
}
