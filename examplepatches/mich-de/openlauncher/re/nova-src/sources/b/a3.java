package b;

import ads_mobile_sdk.ii3;
import ads_mobile_sdk.ji3;
import android.os.SystemClock;
import android.util.TypedValue;
import com.google.android.gms.internal.measurement.jg;
import com.google.android.gms.internal.measurement.yg;
import com.instabridge.ai.auth.AndroidKeystoreSecretCipher;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.security.Provider;
import java.security.SecureRandom;
import java.text.SimpleDateFormat;
import java.util.Locale;
import java.util.Random;
import java.util.WeakHashMap;
import javax.crypto.Cipher;

/* loaded from: classes2.dex */
public final class a3 extends ThreadLocal {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f15780a;

    public /* synthetic */ a3(int i5) {
        this.f15780a = i5;
    }

    @Override // java.lang.ThreadLocal
    public final Object initialValue() throws NoSuchAlgorithmException {
        SecureRandom secureRandom;
        Provider provider = null;
        switch (this.f15780a) {
            case 0:
                WeakHashMap weakHashMap = ji3.f5253a;
                ii3 ii3Var = new ii3(SystemClock.currentThreadTimeMillis());
                Thread threadCurrentThread = Thread.currentThread();
                WeakHashMap weakHashMap2 = ji3.f5253a;
                synchronized (weakHashMap2) {
                }
                return ii3Var;
            case 1:
                return new c3.h2();
            case 2:
                SimpleDateFormat simpleDateFormat = new SimpleDateFormat("EEE, dd MMM yyyy HH:mm:ss 'GMT'", Locale.US);
                simpleDateFormat.setLenient(false);
                simpleDateFormat.setTimeZone(y80.c.f96857e);
                return simpleDateFormat;
            case 3:
                com.google.android.gms.internal.measurement.g0 g0Var = new com.google.android.gms.internal.measurement.g0();
                g0Var.f32550a = 0;
                return g0Var;
            case 4:
                com.google.android.gms.internal.measurement.lb.e(Thread.currentThread());
                yg ygVar = new yg();
                ygVar.f33265a = false;
                ygVar.f33266b = null;
                Thread threadCurrentThread2 = Thread.currentThread();
                WeakHashMap weakHashMap3 = jg.f32694c;
                synchronized (weakHashMap3) {
                    weakHashMap3.put(threadCurrentThread2, ygVar);
                }
                return ygVar;
            case 5:
                return new Random();
            case 6:
                return new TypedValue();
            case 7:
                try {
                    return (Cipher) sl.j.f87509b.f87514a.a(AndroidKeystoreSecretCipher.TRANSFORMATION);
                } catch (GeneralSecurityException e3) {
                    throw new IllegalStateException(e3);
                }
            case 8:
                try {
                    Cipher cipher = (Cipher) sl.j.f87509b.f87514a.a("AES/GCM-SIV/NoPadding");
                    if (gl.e.a(cipher)) {
                        return cipher;
                    }
                    return null;
                } catch (GeneralSecurityException e11) {
                    throw new IllegalStateException(e11);
                }
            case 9:
                return new io.sentry.util.f();
            case 10:
                Provider providerN = kl.a.n();
                if (providerN != null) {
                    try {
                        secureRandom = SecureRandom.getInstance("SHA1PRNG", providerN);
                    } catch (GeneralSecurityException unused) {
                    }
                } else {
                    try {
                        provider = (Provider) Class.forName("org.conscrypt.Conscrypt").getMethod("newProvider", null).invoke(null, null);
                    } catch (Throwable unused2) {
                    }
                    if (provider != null) {
                        try {
                            secureRandom = SecureRandom.getInstance("SHA1PRNG", provider);
                        } catch (GeneralSecurityException unused3) {
                        }
                    } else {
                        secureRandom = new SecureRandom();
                    }
                }
                secureRandom.nextLong();
                return secureRandom;
            case 11:
                try {
                    return (Cipher) sl.j.f87509b.f87514a.a("AES/ECB/NoPadding");
                } catch (GeneralSecurityException e12) {
                    throw new IllegalStateException(e12);
                }
            case 12:
                return Boolean.FALSE;
            case 13:
                try {
                    return (Cipher) sl.j.f87509b.f87514a.a("AES/CTR/NoPadding");
                } catch (GeneralSecurityException e13) {
                    throw new IllegalStateException(e13);
                }
            default:
                try {
                    return (Cipher) sl.j.f87509b.f87514a.a("AES/CTR/NOPADDING");
                } catch (GeneralSecurityException e14) {
                    throw new IllegalStateException(e14);
                }
        }
    }
}
