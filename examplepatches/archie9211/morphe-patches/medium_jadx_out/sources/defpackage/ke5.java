package defpackage;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.Signature;
import android.util.Log;
import android.widget.Magnifier;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public class ke5 implements la9 {
    public static ke5 b;
    public final Object a;

    public ke5(Context context) {
        this.a = context.getApplicationContext();
    }

    public static ke5 c(Context context) {
        ke5 ke5Var;
        vp7.p(context);
        synchronized (ke5.class) {
            try {
                ke5Var = b;
                if (ke5Var == null) {
                    dgg.a(context);
                    ke5Var = new ke5(context);
                    b = ke5Var;
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        return ke5Var;
    }

    /* JADX WARN: Code restructure failed: missing block: B:70:0x00f4, code lost:
    
        r5 = r9;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final boolean f(android.content.pm.PackageInfo r12, boolean r13) {
        /*
            Method dump skipped, instruction units count: 293
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ke5.f(android.content.pm.PackageInfo, boolean):boolean");
    }

    public static eag g(PackageInfo packageInfo, eag... eagVarArr) {
        Signature[] signatureArr = packageInfo.signatures;
        if (signatureArr != null) {
            if (signatureArr.length != 1) {
                Log.w("GoogleSignatureVerifier", "Package has more than one signature.");
                return null;
            }
            vbg vbgVar = new vbg(packageInfo.signatures[0].toByteArray());
            for (int i = 0; i < eagVarArr.length; i++) {
                if (eagVarArr[i].equals(vbgVar)) {
                    return eagVarArr[i];
                }
            }
        }
        return null;
    }

    @Override // defpackage.la9
    public void a(float f, long j, long j2) {
        ((Magnifier) this.a).show(Float.intBitsToFloat((int) (j >> 32)), Float.intBitsToFloat((int) (j & 4294967295L)));
    }

    public void b() {
        ((Magnifier) this.a).dismiss();
    }

    public long d() {
        return (((long) ((Magnifier) this.a).getWidth()) << 32) | (((long) ((Magnifier) this.a).getHeight()) & 4294967295L);
    }

    public void e() {
        ((Magnifier) this.a).update();
    }

    public ke5(Magnifier magnifier) {
        this.a = magnifier;
    }
}
