package og;

import ads_mobile_sdk.bu3;
import ads_mobile_sdk.cu3;
import ads_mobile_sdk.du3;
import ads_mobile_sdk.xt3;
import ads_mobile_sdk.zt3;
import android.content.Context;
import android.os.Handler;
import android.os.HandlerThread;
import android.util.Log;
import android.util.SparseIntArray;
import b.k9;
import b.kc;
import b.n6;
import fi.t;
import h6.c1;
import io.branch.requery.android.database.sqlite.k;
import java.security.GeneralSecurityException;
import java.security.InvalidAlgorithmParameterException;
import java.security.NoSuchAlgorithmException;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import javax.crypto.spec.SecretKeySpec;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes3.dex */
public final class g implements nl.c {

    /* renamed from: e, reason: collision with root package name */
    public static g f80403e;

    /* renamed from: f, reason: collision with root package name */
    public static HandlerThread f80404f;

    /* renamed from: g, reason: collision with root package name */
    public static Handler f80405g;

    /* renamed from: a, reason: collision with root package name */
    public int f80406a;

    /* renamed from: b, reason: collision with root package name */
    public Object f80407b;

    /* renamed from: c, reason: collision with root package name */
    public Object f80408c;

    /* renamed from: d, reason: collision with root package name */
    public Object f80409d;

    public g(zt3 zt3Var, int i5, n6 n6Var) {
        this.f80407b = zt3Var;
        this.f80406a = i5;
        this.f80408c = n6Var;
    }

    public static synchronized g e(Context context) {
        try {
            if (f80403e == null) {
                ScheduledExecutorService scheduledExecutorServiceUnconfigurableScheduledExecutorService = Executors.unconfigurableScheduledExecutorService(Executors.newScheduledThreadPool(1, new yg.a("MessengerIpcClient")));
                g gVar = new g();
                gVar.f80409d = new e(gVar);
                gVar.f80406a = 1;
                gVar.f80408c = scheduledExecutorServiceUnconfigurableScheduledExecutorService;
                gVar.f80407b = context.getApplicationContext();
                f80403e = gVar;
            }
        } catch (Throwable th2) {
            throw th2;
        }
        return f80403e;
    }

    public void a(long j11) throws cu3, du3 {
        long[] jArr = {2139842053, 728564241, 750932242, 1403848321, 1892818418, 4558981222L, 1919655804, 1856374729, 899334107};
        long j12 = jArr[0];
        long j13 = jArr[1];
        long j14 = jArr[2];
        long j15 = jArr[3];
        long j16 = jArr[4];
        long j17 = ((((((~j12) & j13) | j14) + ((j12 & j15) | j16)) - jArr[5]) + jArr[6]) ^ (jArr[7] % jArr[8]);
        c(j11);
        long j18 = j11 / j17;
        if (j18 < 0 || j18 > ((zt3) this.f80407b).f12665a.length) {
            throw new du3();
        }
        this.f80406a = (int) j18;
    }

    public long b() throws du3 {
        try {
            n6 n6Var = (n6) this.f80408c;
            zt3 zt3Var = (zt3) this.f80407b;
            this.f80406a = this.f80406a + 1;
            return n6Var.a(zt3Var, r2);
        } catch (IndexOutOfBoundsException e3) {
            throw new du3(e3);
        }
    }

    public int c() throws du3 {
        int iC = k9.c(1695460764, 396394489, 1519637107, 6072641) ^ 578290844;
        try {
            n6 n6Var = (n6) this.f80408c;
            zt3 zt3Var = (zt3) this.f80407b;
            int i5 = this.f80406a;
            this.f80406a = i5 + 1;
            int iA = n6Var.a(zt3Var, i5) & iC;
            n6 n6Var2 = (n6) this.f80408c;
            zt3 zt3Var2 = (zt3) this.f80407b;
            int i11 = this.f80406a;
            this.f80406a = i11 + 1;
            int iA2 = iA | ((n6Var2.a(zt3Var2, i11) & iC) << 8);
            n6 n6Var3 = (n6) this.f80408c;
            zt3 zt3Var3 = (zt3) this.f80407b;
            int i12 = this.f80406a;
            this.f80406a = i12 + 1;
            int iA3 = ((iC & n6Var3.a(zt3Var3, i12)) << 16) | iA2;
            n6 n6Var4 = (n6) this.f80408c;
            zt3 zt3Var4 = (zt3) this.f80407b;
            int i13 = this.f80406a;
            this.f80406a = i13 + 1;
            return iA3 | (n6Var4.a(zt3Var4, i13) << 24);
        } catch (IndexOutOfBoundsException e3) {
            throw new du3(e3);
        }
    }

    public long d() throws bu3, du3 {
        int iC = k9.c(2113091120, 659347295, -1784934195, 38700438) ^ 301105688;
        int i5 = 0;
        long j11 = 0;
        while (i5 < iC) {
            try {
                n6 n6Var = (n6) this.f80408c;
                zt3 zt3Var = (zt3) this.f80407b;
                int i11 = this.f80406a;
                this.f80406a = i11 + 1;
                byte bA = n6Var.a(zt3Var, i11);
                j11 |= (bA & AbstractJsonLexerKt.TC_INVALID) << i5;
                if (i5 == 63) {
                    if (bA > 1) {
                        throw new bu3();
                    }
                    i5 = 63;
                }
                if ((bA & 128) == 0) {
                    return (j11 >>> 1) ^ (-(j11 & 1));
                }
                i5 += 7;
            } catch (IndexOutOfBoundsException e3) {
                throw new du3(e3);
            }
        }
        throw new bu3();
    }

    public synchronized t f(f fVar) {
        try {
            if (Log.isLoggable("MessengerIpcClient", 3)) {
                fVar.toString();
            }
            if (!((e) this.f80409d).d(fVar)) {
                e eVar = new e(this);
                this.f80409d = eVar;
                eVar.d(fVar);
            }
        } catch (Throwable th2) {
            throw th2;
        }
        return fVar.f80399b.f55135a;
    }

    public g(zt3 zt3Var, int i5, n6 n6Var, kc kcVar) {
        this(zt3Var, i5, n6Var);
        this.f80409d = kcVar;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    /* JADX WARN: Removed duplicated region for block: B:8:0x002a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public g(String str, SecretKeySpec secretKeySpec) throws GeneralSecurityException {
        int i5 = 1;
        k kVar = new k(this, i5);
        this.f80407b = kVar;
        if (c1.c(2)) {
            this.f80408c = str;
            this.f80409d = secretKeySpec;
            if (secretKeySpec.getEncoded().length >= 16) {
                str.getClass();
                switch (str.hashCode()) {
                    case -1823053428:
                        if (!str.equals("HMACSHA1")) {
                            i5 = -1;
                            break;
                        } else {
                            i5 = 0;
                            break;
                        }
                    case 392315023:
                        if (!str.equals("HMACSHA224")) {
                        }
                        break;
                    case 392315118:
                        if (str.equals("HMACSHA256")) {
                            i5 = 2;
                            break;
                        }
                        break;
                    case 392316170:
                        if (str.equals("HMACSHA384")) {
                            i5 = 3;
                            break;
                        }
                        break;
                    case 392317873:
                        if (str.equals("HMACSHA512")) {
                            i5 = 4;
                            break;
                        }
                        break;
                }
                switch (i5) {
                    case 0:
                        this.f80406a = 20;
                        break;
                    case 1:
                        this.f80406a = 28;
                        break;
                    case 2:
                        this.f80406a = 32;
                        break;
                    case 3:
                        this.f80406a = 48;
                        break;
                    case 4:
                        this.f80406a = 64;
                        break;
                    default:
                        throw new NoSuchAlgorithmException("unknown Hmac algorithm: ".concat(str));
                }
                kVar.get();
                return;
            }
            throw new InvalidAlgorithmParameterException("key size too small, need at least 16 bytes");
        }
        throw new GeneralSecurityException("Can not use HMAC in FIPS-mode, as BoringCrypto module is not available.");
    }

    public static final void c(long j11) throws cu3 {
        long[] jArr = {141540322, 456640674, 1141397064, 993500330, 1614820873, 3337980909L, 410218731, 1716462158, 477127367};
        long j12 = jArr[0];
        long j13 = jArr[1];
        long j14 = jArr[2];
        long j15 = jArr[3];
        long j16 = jArr[4];
        long j17 = jArr[5];
        if (j11 % (((((((~j12) & j13) | j14) + ((j12 & j15) | j16)) - j17) + jArr[6]) ^ (jArr[7] % jArr[8])) != 0) {
            throw new cu3();
        }
    }

    public zt3 b(long j11) throws cu3, du3 {
        int[] iArr = {1667674495, 1502201381, 1197125461, 478240810, 622476187, -1652496091, 840440151, 1203013321, 774318984};
        int i5 = iArr[0];
        int i11 = iArr[1];
        int i12 = iArr[2];
        int i13 = iArr[3];
        int iC = k9.c((i11 & (~i5)) | i12, (i5 & i13) | iArr[4], iArr[5], iArr[6]) ^ (iArr[7] % iArr[8]);
        c(a() + j11);
        int i14 = this.f80406a;
        long j12 = i14;
        zt3 zt3Var = (zt3) this.f80407b;
        long j13 = (j11 >> iC) + j12;
        if (j13 > zt3Var.f12665a.length || j13 < j12) {
            throw new du3();
        }
        try {
            int i15 = (int) j13;
            zt3 zt3VarA = ((n6) this.f80408c).a(zt3Var, i14, i15);
            this.f80406a = i15;
            return zt3VarA;
        } catch (IndexOutOfBoundsException e3) {
            throw new AssertionError(xt3.a("CEiv6BFfPnitUE+D"), e3);
        }
    }

    public long a() {
        long[] jArr = {491705403, 818579170, 1201981453, 810223590, 1243973916, 3701563257L, 554701476, 1889947178, 1780695788};
        long j11 = jArr[0];
        long j12 = jArr[1];
        long j13 = jArr[2];
        long j14 = jArr[3];
        long j15 = jArr[4];
        return this.f80406a * (((((((~j11) & j12) | j13) + ((j11 & j14) | j15)) - jArr[5]) + jArr[6]) ^ (jArr[7] % jArr[8]));
    }

    public static void b(SparseIntArray sparseIntArray, long j11) {
        if (sparseIntArray != null) {
            int i5 = (int) ((500000 + j11) / 1000000);
            if (j11 >= 0) {
                sparseIntArray.put(i5, sparseIntArray.get(i5) + 1);
            }
        }
    }
}
