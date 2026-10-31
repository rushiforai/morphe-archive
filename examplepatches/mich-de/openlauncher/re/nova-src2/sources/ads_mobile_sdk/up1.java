package ads_mobile_sdk;

import android.content.Context;
import android.content.pm.PackageManager;
import android.content.pm.Signature;
import android.util.Base64;
import b.c0;
import b.g5;
import b.k9;
import b.t0;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;

/* loaded from: classes2.dex */
public final class up1 implements b.cb {

    /* renamed from: a, reason: collision with root package name */
    public final Context f10434a;

    /* renamed from: b, reason: collision with root package name */
    public final vi3 f10435b;

    /* renamed from: c, reason: collision with root package name */
    public final a f10436c;

    /* renamed from: d, reason: collision with root package name */
    public final String f10437d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f10438e;

    public up1(Context context, vi3 vi3Var, a aVar, j7 j7Var) {
        this.f10434a = context;
        this.f10435b = vi3Var;
        this.f10436c = aVar;
        this.f10437d = j7Var.F();
        this.f10438e = j7Var.z();
    }

    public final String a(long j11) {
        String strEncodeToString;
        boolean z11;
        t0 t0VarO = de.o();
        String str = this.f10437d;
        t0VarO.b();
        ((de) t0VarO.f1095b).b(str);
        t0VarO.b();
        ((de) t0VarO.f1095b).p();
        String packageName = this.f10434a.getPackageName();
        t0VarO.b();
        ((de) t0VarO.f1095b).c(packageName);
        long jCurrentTimeMillis = System.currentTimeMillis() / 1000;
        t0VarO.b();
        de deVar = (de) t0VarO.f1095b;
        deVar.bitField0_ |= 4;
        deVar.evtTime_ = jCurrentTimeMillis;
        long jCurrentTimeMillis2 = (System.currentTimeMillis() - j11) / 1000;
        t0VarO.b();
        de deVar2 = (de) t0VarO.f1095b;
        deVar2.bitField0_ |= 32;
        deVar2.uptSignal_ = jCurrentTimeMillis2;
        if (this.f10438e) {
            try {
                Signature[] signatureArr = this.f10434a.getPackageManager().getPackageInfo(this.f10434a.getPackageName(), 64).signatures;
                if (signatureArr == null || signatureArr.length <= 0) {
                    strEncodeToString = "E";
                } else {
                    byte[] bArrDigest = MessageDigest.getInstance("SHA-1").digest(signatureArr[0].toByteArray());
                    StringBuilder sb2 = new StringBuilder();
                    for (byte b11 : bArrDigest) {
                        String hexString = Integer.toHexString(b11 & 255);
                        if (hexString.length() == 1) {
                            sb2.append('0');
                        }
                        sb2.append(hexString);
                    }
                    strEncodeToString = Base64.encodeToString(sb2.toString().getBytes(StandardCharsets.UTF_8), 11);
                }
            } catch (Exception unused) {
                strEncodeToString = "E";
            }
            t0VarO.b();
            ((de) t0VarO.f1095b).d(strEncodeToString);
        }
        try {
            long j12 = this.f10434a.getPackageManager().getPackageInfo(this.f10434a.getPackageName(), 0).versionCode;
            t0VarO.b();
            de deVar3 = (de) t0VarO.f1095b;
            deVar3.bitField0_ |= 16;
            deVar3.vcdSignal_ = j12;
        } catch (PackageManager.NameNotFoundException unused2) {
            t0VarO.b();
            de deVar4 = (de) t0VarO.f1095b;
            deVar4.bitField0_ |= 16;
            deVar4.vcdSignal_ = -1L;
        }
        a aVar = this.f10436c;
        synchronized (aVar) {
            z11 = aVar.f787d;
        }
        if (!z11) {
            this.f10436c.a();
        }
        g5 g5VarA = this.f10436c.a(null, ((de) t0VarO.a()).a());
        g5VarA.b();
        le leVar = (le) g5VarA.f1095b;
        leVar.getClass();
        leVar.protoName_ = 4;
        leVar.bitField0_ |= 2;
        g5VarA.b();
        le leVar2 = (le) g5VarA.f1095b;
        leVar2.getClass();
        leVar2.encryptionMethod_ = c0.F(2);
        leVar2.bitField0_ |= 4;
        return k9.u(true).c(((le) g5VarA.a()).a());
    }
}
