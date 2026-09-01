package defpackage;

import android.content.Context;
import android.util.Log;
import com.android.billingclient.api.m;
import com.android.billingclient.api.n;
import com.google.android.recaptcha.internal.zzx;
import com.google.android.recaptcha.internal.zzy;
import com.google.android.recaptcha.internal.zzz;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeoutException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class opg {
    public static opg e;
    public int a;
    public Object b;
    public Object c;
    public Object d;

    public opg(int i, nz0 nz0Var, ib2 ib2Var, bo4 bo4Var) {
        this.b = bo4Var;
        this.a = i;
        this.c = nz0Var;
        this.d = ib2Var;
    }

    public static synchronized opg d(Context context) {
        opg opgVar;
        opgVar = e;
        if (opgVar == null) {
            ScheduledExecutorService scheduledExecutorServiceUnconfigurableScheduledExecutorService = Executors.unconfigurableScheduledExecutorService(Executors.newScheduledThreadPool(1, new lv2("MessengerIpcClient", 1)));
            opgVar = new opg();
            opgVar.d = new nhg(opgVar);
            opgVar.a = 1;
            opgVar.c = scheduledExecutorServiceUnconfigurableScheduledExecutorService;
            opgVar.b = context.getApplicationContext();
            e = opgVar;
        }
        return opgVar;
    }

    public static final void j(long j) throws zzy {
        long[] jArr = {1239547247, 271084552, 603409185, 805905448, 612732982, 1384275531, 148774773, 1155505365, 905894996};
        long j2 = jArr[0];
        long j3 = jArr[1];
        long j4 = jArr[2];
        long j5 = jArr[3];
        long j6 = jArr[4];
        long j7 = jArr[5];
        if (j % (((((((~j2) & j3) | j4) + ((j2 & j5) | j6)) - j7) + jArr[6]) ^ (jArr[7] % 905894996)) != 0) {
            throw new zzy();
        }
    }

    public void a(long j) {
        long[] jArr = {1540846267, 571107382, 1484708369, 709108262, 1568035521, 3652851584L, 192048860, 2037335344, 1874960596};
        long j2 = jArr[0];
        long j3 = jArr[1];
        long j4 = jArr[2];
        long j5 = jArr[3];
        long j6 = jArr[4];
        long j7 = jArr[5];
        long j8 = jArr[6];
        long j9 = jArr[7];
        j(j);
        long j10 = j / (((((((~j2) & j3) | j4) + ((j2 & j5) | j6)) - j7) + j8) ^ (j9 % 1874960596));
        if (j10 < 0 || j10 > ((mpg) this.b).a.length) {
            throw new zzz();
        }
        this.a = (int) j10;
    }

    public void b(Throwable th) {
        boolean z = th instanceof TimeoutException;
        m mVar = (m) this.d;
        if (z) {
            mVar.W(28, n.F, cbg.BILLING_OVERRIDE_SERVICE_CALL_TIMEOUT);
            rxf.j("BillingClientTesting", "Asynchronous call to Billing Override Service timed out.", th);
        } else {
            mVar.W(28, n.F, cbg.BILLING_OVERRIDE_SERVICE_CALL_EXCEPTION);
            rxf.j("BillingClientTesting", "An error occurred while retrieving billing override.", th);
        }
        ((Runnable) this.c).run();
    }

    public long c() {
        long[] jArr = {1714636915, 1758565436, 174653550, 1653642768, 38095596, 2318926016L, 596516649, 1804289383, 846930886};
        long j = jArr[0];
        long j2 = jArr[1];
        long j3 = jArr[2];
        long j4 = jArr[3];
        long j5 = jArr[4];
        long j6 = jArr[5];
        return ((long) this.a) * (((((((~j) & j2) | j3) + ((j & j4) | j5)) - j6) + jArr[6]) ^ (jArr[7] % 846930886));
    }

    public long e() throws zzz {
        try {
            bag bagVar = (bag) this.c;
            mpg mpgVar = (mpg) this.b;
            this.a = this.a + 1;
            return bagVar.c(mpgVar, r2);
        } catch (IndexOutOfBoundsException e2) {
            throw new zzz(e2);
        }
    }

    public int f() {
        try {
            bag bagVar = (bag) this.c;
            mpg mpgVar = (mpg) this.b;
            int i = this.a;
            this.a = i + 1;
            int iC = bagVar.c(mpgVar, i) & 255;
            bag bagVar2 = (bag) this.c;
            mpg mpgVar2 = (mpg) this.b;
            int i2 = this.a;
            this.a = i2 + 1;
            int iC2 = iC | ((bagVar2.c(mpgVar2, i2) & 255) << 8);
            bag bagVar3 = (bag) this.c;
            mpg mpgVar3 = (mpg) this.b;
            int i3 = this.a;
            this.a = i3 + 1;
            int iC3 = iC2 | ((bagVar3.c(mpgVar3, i3) & 255) << 16);
            bag bagVar4 = (bag) this.c;
            mpg mpgVar4 = (mpg) this.b;
            int i4 = this.a;
            this.a = i4 + 1;
            return (bagVar4.c(mpgVar4, i4) << 24) | iC3;
        } catch (IndexOutOfBoundsException e2) {
            throw new zzz(e2);
        }
    }

    public mpg g(long j) throws zzz, zzy {
        int[] iArr = {2004270296, 933109376, 745751825, 330111618, 543277087, 1377683891, 125737768, 1632381616, 422449966};
        int i = iArr[0];
        int i2 = iArr[1];
        int i3 = iArr[2];
        int i4 = iArr[3];
        int i5 = iArr[4];
        int i6 = iArr[5];
        int i7 = iArr[6];
        int i8 = iArr[7];
        int iF = lv8.f((i2 & (~i)) | i3, (i & i4) | i5, i6, i7);
        j(c() + j);
        int i9 = this.a;
        long j2 = i9;
        mpg mpgVar = (mpg) this.b;
        long j3 = (j >> ((i8 % 422449966) ^ iF)) + j2;
        if (j3 > mpgVar.a.length || j3 < j2) {
            throw new zzz();
        }
        try {
            int i10 = (int) j3;
            mpg mpgVarB = ((bag) this.c).b(mpgVar, i9, i10);
            this.a = i10;
            return mpgVarB;
        } catch (IndexOutOfBoundsException e2) {
            throw new AssertionError(cmg.a("CEiv6BFfPnitUE+D"), e2);
        }
    }

    public long h() throws zzz, zzx {
        int i = 0;
        long j = 0;
        while (i < 64) {
            try {
                bag bagVar = (bag) this.c;
                mpg mpgVar = (mpg) this.b;
                int i2 = this.a;
                this.a = i2 + 1;
                byte bC = bagVar.c(mpgVar, i2);
                j |= ((long) (bC & 127)) << i;
                if (i == 63) {
                    if (bC > 1) {
                        throw new zzx();
                    }
                    i = 63;
                }
                if ((bC & 128) == 0) {
                    return (-(j & 1)) ^ (j >>> 1);
                }
                i += 7;
            } catch (IndexOutOfBoundsException e2) {
                throw new zzz(e2);
            }
        }
        throw new zzx();
    }

    public synchronized jrg i(ojg ojgVar) {
        try {
            if (Log.isLoggable("MessengerIpcClient", 3)) {
                Log.d("MessengerIpcClient", "Queueing ".concat(ojgVar.toString()));
            }
            if (!((nhg) this.d).d(ojgVar)) {
                nhg nhgVar = new nhg(this);
                this.d = nhgVar;
                nhgVar.d(ojgVar);
            }
        } catch (Throwable th) {
            throw th;
        }
        return ojgVar.b.a;
    }

    public opg(mpg mpgVar, int i, bag bagVar) {
        this.b = mpgVar;
        this.a = i;
        this.c = bagVar;
    }
}
