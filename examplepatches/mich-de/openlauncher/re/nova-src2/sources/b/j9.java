package b;

import ads_mobile_sdk.au0;
import ads_mobile_sdk.cu0;
import ads_mobile_sdk.d01;
import ads_mobile_sdk.em1;
import ads_mobile_sdk.pm1;
import ads_mobile_sdk.qm1;
import android.app.UiModeManager;
import android.content.Context;
import android.content.pm.PackageManager;
import android.os.Build;
import com.amplitude.eventbridge.EventBridgeChannel;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.Locale;

/* loaded from: classes2.dex */
public final /* synthetic */ class j9 implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f15904a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ qm1 f15905b;

    public /* synthetic */ j9(qm1 qm1Var, int i5) {
        this.f15904a = i5;
        this.f15905b = qm1Var;
    }

    @Override // java.lang.Runnable
    public final void run() throws IOException {
        cu0 cu0Var;
        p9 p9Var;
        xk.v0 v0VarO;
        String string;
        d01 d01Var;
        switch (this.f15904a) {
            case 0:
                qm1 qm1Var = this.f15905b;
                synchronized (qm1Var.n) {
                    try {
                        p9 p9Var2 = qm1Var.f8742q;
                        au0 au0Var = (au0) p9Var2.f1094a.a(5, (cu0) null);
                        if (p9Var2.f1095b.j()) {
                            p9Var2.f1095b.k();
                            cu0Var = p9Var2.f1095b;
                        } else {
                            cu0Var = p9Var2.f1095b;
                        }
                        au0Var.f1095b = cu0Var;
                        p9Var = (p9) au0Var;
                    } finally {
                    }
                }
                synchronized (qm1Var.o) {
                    v0VarO = xk.v0.o(qm1Var.f8743r);
                    qm1Var.f8743r.clear();
                    qm1Var.f8744s = false;
                }
                xk.l0 l0VarListIterator = v0VarO.listIterator(0);
                int i5 = 0;
                while (l0VarListIterator.hasNext()) {
                    pm1 pm1Var = (pm1) l0VarListIterator.next();
                    if (i5 >= qm1Var.f8734g) {
                        qm1Var.a((ads_mobile_sdk.s7) p9Var.a());
                        p9Var.c();
                        i5 = 0;
                    }
                    k1 k1VarO = em1.o();
                    long j11 = pm1Var.f8316a;
                    k1VarO.b();
                    em1 em1Var = (em1) k1VarO.f1095b;
                    em1Var.bitField0_ |= 1;
                    em1Var.eventId_ = j11;
                    long j12 = pm1Var.f8317b;
                    k1VarO.b();
                    em1 em1Var2 = (em1) k1VarO.f1095b;
                    em1Var2.bitField0_ |= 2;
                    em1Var2.runtimeMs_ = j12;
                    long j13 = pm1Var.f8320e;
                    k1VarO.b();
                    em1 em1Var3 = (em1) k1VarO.f1095b;
                    em1Var3.bitField0_ |= 32;
                    em1Var3.eventCount_ = j13;
                    String str = pm1Var.f8319d;
                    if (str != null) {
                        k1VarO.b();
                        ((em1) k1VarO.f1095b).b(str);
                    }
                    Throwable th2 = pm1Var.f8318c;
                    int i11 = th2 != null ? 3 : 2;
                    k1VarO.b();
                    em1 em1Var4 = (em1) k1VarO.f1095b;
                    em1Var4.getClass();
                    em1Var4.status_ = c0.F(i11);
                    em1Var4.bitField0_ |= 4;
                    if (th2 != null) {
                        String name = th2.getClass().getName();
                        k1VarO.b();
                        ((em1) k1VarO.f1095b).c(name);
                        try {
                            StringWriter stringWriter = new StringWriter();
                            try {
                                PrintWriter printWriter = new PrintWriter(stringWriter);
                                try {
                                    th2.printStackTrace(printWriter);
                                    string = stringWriter.toString();
                                    printWriter.close();
                                    stringWriter.close();
                                } catch (Throwable th3) {
                                    try {
                                        printWriter.close();
                                    } catch (Throwable th4) {
                                        th3.addSuppressed(th4);
                                    }
                                    throw th3;
                                    break;
                                }
                            } catch (Throwable th5) {
                                try {
                                    stringWriter.close();
                                } catch (Throwable th6) {
                                    th5.addSuppressed(th6);
                                }
                                throw th5;
                                break;
                            }
                        } catch (IOException unused) {
                            string = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                        }
                        k1VarO.b();
                        ((em1) k1VarO.f1095b).d(string);
                    }
                    em1 em1Var5 = (em1) k1VarO.a();
                    p9Var.b();
                    ((ads_mobile_sdk.s7) p9Var.f1095b).a(em1Var5);
                    i5++;
                }
                if (i5 > 0) {
                    qm1Var.a((ads_mobile_sdk.s7) p9Var.a());
                    p9Var.c();
                    return;
                }
                return;
            default:
                qm1 qm1Var2 = this.f15905b;
                if (!qm1Var2.f8732e || qm1Var2.f8740m.getAndSet(true)) {
                    return;
                }
                Context context = qm1Var2.f8728a;
                String str2 = qm1Var2.f8737j;
                ads_mobile_sdk.i7 i7Var = qm1Var2.f8738k;
                double d5 = qm1Var2.f8736i;
                long j14 = qm1Var2.f8739l;
                Locale locale = Locale.getDefault();
                switch (i7Var.getNumber()) {
                    case 0:
                        d01Var = d01.UNKNOWN_HOST_TYPE;
                        break;
                    case 1:
                        d01Var = d01.GMA;
                        break;
                    case 2:
                        d01Var = d01.YOUTUBE;
                        break;
                    case 3:
                        d01Var = d01.GPAY;
                        break;
                    case 4:
                        d01Var = d01.IMA;
                        break;
                    case 5:
                        d01Var = d01.PAL;
                        break;
                    case 6:
                        d01Var = d01.MAPS;
                        break;
                    default:
                        d01Var = null;
                        break;
                }
                if (d01Var == null) {
                    d01Var = d01.UNKNOWN_HOST_TYPE;
                }
                p9 p9VarO = ads_mobile_sdk.s7.o();
                long j15 = Build.VERSION.SDK_INT;
                p9VarO.b();
                ads_mobile_sdk.s7 s7Var = (ads_mobile_sdk.s7) p9VarO.f1095b;
                s7Var.bitField0_ = 1 | s7Var.bitField0_;
                s7Var.apiLevel_ = j15;
                String str3 = Build.MODEL;
                p9VarO.b();
                ((ads_mobile_sdk.s7) p9VarO.f1095b).g(str3);
                String language = locale.getLanguage();
                p9VarO.b();
                ((ads_mobile_sdk.s7) p9VarO.f1095b).f(language);
                String country = locale.getCountry();
                p9VarO.b();
                ((ads_mobile_sdk.s7) p9VarO.f1095b).d(country);
                p9VarO.b();
                ((ads_mobile_sdk.s7) p9VarO.f1095b).e(str2);
                p9VarO.b();
                ads_mobile_sdk.s7 s7Var2 = (ads_mobile_sdk.s7) p9VarO.f1095b;
                s7Var2.getClass();
                s7Var2.hostType_ = d01Var.getNumber();
                s7Var2.bitField0_ |= 2048;
                p9VarO.b();
                ads_mobile_sdk.s7 s7Var3 = (ads_mobile_sdk.s7) p9VarO.f1095b;
                s7Var3.getClass();
                int i12 = 2;
                s7Var3.osType_ = c9.b(2);
                s7Var3.bitField0_ |= androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT;
                String packageName = context.getPackageName();
                p9VarO.b();
                ((ads_mobile_sdk.s7) p9VarO.f1095b).c(packageName);
                p9VarO.b();
                ads_mobile_sdk.s7 s7Var4 = (ads_mobile_sdk.s7) p9VarO.f1095b;
                s7Var4.bitField0_ |= 1024;
                s7Var4.requestedAdshieldVersion_ = j14;
                if (d5 > 0.0d) {
                    long jRound = Math.round(1.0d / d5);
                    p9VarO.b();
                    ads_mobile_sdk.s7 s7Var5 = (ads_mobile_sdk.s7) p9VarO.f1095b;
                    s7Var5.bitField0_ |= EventBridgeChannel.QUEUE_CAPACITY;
                    s7Var5.samplingDenominator_ = jRound;
                }
                PackageManager packageManager = context.getPackageManager();
                try {
                    long j16 = packageManager.getPackageInfo(context.getPackageName(), 0).versionCode;
                    p9VarO.b();
                    ads_mobile_sdk.s7 s7Var6 = (ads_mobile_sdk.s7) p9VarO.f1095b;
                    s7Var6.bitField0_ |= 64;
                    s7Var6.appVersionCode_ = j16;
                } catch (Exception unused2) {
                }
                try {
                    if (packageManager.hasSystemFeature("android.hardware.type.automotive")) {
                        i12 = 5;
                    } else if (packageManager.hasSystemFeature("android.hardware.type.watch")) {
                        i12 = 4;
                    } else if (packageManager.hasSystemFeature("android.hardware.type.pc")) {
                        i12 = 7;
                    } else {
                        UiModeManager uiModeManager = (UiModeManager) context.getSystemService("uimode");
                        if (uiModeManager != null && uiModeManager.getCurrentModeType() == 4) {
                            i12 = 6;
                        }
                    }
                    p9VarO.b();
                    ads_mobile_sdk.s7 s7Var7 = (ads_mobile_sdk.s7) p9VarO.f1095b;
                    s7Var7.getClass();
                    s7Var7.deviceType_ = c0.F(i12);
                    s7Var7.bitField0_ |= 16;
                } catch (RuntimeException unused3) {
                }
                ads_mobile_sdk.s7 s7Var8 = (ads_mobile_sdk.s7) p9VarO.a();
                synchronized (qm1Var2.n) {
                    qm1Var2.f8742q.a(s7Var8);
                }
                return;
        }
    }
}
