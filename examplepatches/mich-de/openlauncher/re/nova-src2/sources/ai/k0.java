package ai;

import android.content.Context;
import android.os.SystemClock;
import android.util.Log;
import com.bytedance.sdk.component.zb.ycx.sya;
import com.bytedance.sdk.component.zb.ycx.syc;
import com.bytedance.sdk.component.zb.ycx.xkz;
import com.bytedance.sdk.component.zb.ycx.zb;
import com.google.android.gms.appset.AppSetIdInfo;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.api.ApiException;
import com.vungle.ads.internal.protos.Sdk;
import java.io.Closeable;
import java.io.IOException;
import java.io.InputStream;
import java.io.RandomAccessFile;
import java.util.List;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.atomic.AtomicLong;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes3.dex */
public final /* synthetic */ class k0 implements fi.f, jf.f, ke.k, ke.l, fi.g, sya {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f13065a;

    /* renamed from: b, reason: collision with root package name */
    public long f13066b;

    /* renamed from: c, reason: collision with root package name */
    public Object f13067c;

    @Override // jf.f
    public int a(long j11) {
        return this.f13066b > j11 ? 0 : -1;
    }

    @Override // ke.k
    public void b(int i5, int i11, byte[] bArr) {
        ((ke.k) this.f13067c).b(i5, i11, bArr);
    }

    @Override // ke.k
    public int c(int i5, int i11, byte[] bArr) {
        return ((ke.k) this.f13067c).c(i5, i11, bArr);
    }

    @Override // ke.k
    public boolean d(byte[] bArr, int i5, int i11, boolean z11) {
        return ((ke.k) this.f13067c).d(bArr, 0, i11, z11);
    }

    @Override // ke.k
    public void e() {
        ((ke.k) this.f13067c).e();
    }

    @Override // ke.k
    public boolean f(byte[] bArr, int i5, int i11, boolean z11) {
        return ((ke.k) this.f13067c).f(bArr, 0, i11, z11);
    }

    @Override // ke.k
    public long g() {
        return ((ke.k) this.f13067c).g() - this.f13066b;
    }

    @Override // ke.k
    public long getLength() {
        return ((ke.k) this.f13067c).getLength() - this.f13066b;
    }

    @Override // ke.k
    public long getPosition() {
        return ((ke.k) this.f13067c).getPosition() - this.f13066b;
    }

    @Override // jf.f
    public List h(long j11) {
        if (j11 >= this.f13066b) {
            return (xk.v0) this.f13067c;
        }
        xk.l0 l0Var = xk.v0.f96030b;
        return xk.r2.f96007e;
    }

    @Override // fi.f
    public void i(Exception exc) {
        ConnectionResult connectionResult;
        switch (this.f13065a) {
            case 0:
                ((AtomicLong) ((mg.l) this.f13067c).f76311d).set(this.f13066b);
                break;
            default:
                dg.b bVar = (dg.b) this.f13067c;
                long j11 = this.f13066b;
                bVar.getClass();
                Log.i("AdvertisingIdClient", "getting error as ".concat(String.valueOf(exc.getMessage())));
                if ((exc instanceof ApiException) && (connectionResult = ((ApiException) exc).f31794a.f31813i) != null && connectionResult.f31779g == 24) {
                    bVar.f49231b.set(j11);
                    break;
                }
                break;
        }
    }

    @Override // ke.l
    public void j(ke.s sVar) {
        ((ke.l) this.f13067c).j(new pe.c(this, sVar));
    }

    @Override // ke.k
    public void k(int i5) {
        ((ke.k) this.f13067c).k(i5);
    }

    @Override // ke.k
    public int l(int i5) {
        return ((ke.k) this.f13067c).l(i5);
    }

    @Override // ke.k
    public void m(int i5) {
        ((ke.k) this.f13067c).m(i5);
    }

    public long n(v2.t tVar, float f11) {
        long jG = h2.b.g(this.f13066b, h2.b.f(tVar.f91992c, tVar.f91996g));
        this.f13066b = jG;
        g0.d1 d1Var = (g0.d1) this.f13067c;
        if ((d1Var == null ? h2.b.c(jG) : Math.abs(q(jG))) < f11) {
            return 9205357640488583168L;
        }
        if (d1Var == null) {
            long j11 = this.f13066b;
            float fIntBitsToFloat = Float.intBitsToFloat((int) (j11 >> 32)) / h2.b.c(j11);
            return h2.b.f(this.f13066b, h2.b.h(f11, (4294967295L & Float.floatToRawIntBits(Float.intBitsToFloat((int) (j11 & 4294967295L)) / r9)) | (Float.floatToRawIntBits(fIntBitsToFloat) << 32)));
        }
        float fQ = q(this.f13066b) - (Math.signum(q(this.f13066b)) * f11);
        long j12 = this.f13066b;
        g0.d1 d1Var2 = g0.d1.f56494b;
        float fIntBitsToFloat2 = Float.intBitsToFloat((int) (d1Var == d1Var2 ? j12 & 4294967295L : j12 >> 32));
        if (d1Var == d1Var2) {
            return (Float.floatToRawIntBits(fQ) << 32) | (4294967295L & Float.floatToRawIntBits(fIntBitsToFloat2));
        }
        return (Float.floatToRawIntBits(fIntBitsToFloat2) << 32) | (4294967295L & Float.floatToRawIntBits(fQ));
    }

    @Override // ke.l
    public void o() {
        ((ke.l) this.f13067c).o();
    }

    @Override // fi.g
    public void onSuccess(Object obj) {
        AppSetIdInfo appSetIdInfo = (AppSetIdInfo) obj;
        int i5 = sp.r0.f87655b;
        sp.r0.f87655b = appSetIdInfo.f31693b;
        ((LinkedBlockingQueue) this.f13067c).offer(appSetIdInfo.getId());
        sp.r0.f87654a = sp.r0.p(this.f13066b);
    }

    @Override // jf.f
    public long p(int i5) {
        wf.a.e(i5 == 0);
        return this.f13066b;
    }

    public float q(long j11) {
        return Float.intBitsToFloat((int) (((g0.d1) this.f13067c) == g0.d1.f56494b ? j11 >> 32 : j11 & 4294967295L));
    }

    @Override // jf.f
    public int r() {
        return 1;
    }

    @Override // vf.h
    public int read(byte[] bArr, int i5, int i11) {
        return ((ke.k) this.f13067c).read(bArr, i5, i11);
    }

    @Override // ke.k
    public void readFully(byte[] bArr, int i5, int i11) {
        ((ke.k) this.f13067c).readFully(bArr, i5, i11);
    }

    @Override // ke.l
    public ke.v s(int i5, int i11) {
        return ((ke.l) this.f13067c).s(i5, i11);
    }

    public void t(Exception exc) throws Exception {
        long jElapsedRealtime = SystemClock.elapsedRealtime();
        if (((Exception) this.f13067c) == null) {
            this.f13067c = exc;
            this.f13066b = 100 + jElapsedRealtime;
        }
        if (jElapsedRealtime >= this.f13066b) {
            Exception exc2 = (Exception) this.f13067c;
            if (exc2 != exc) {
                exc2.addSuppressed(exc);
            }
            Exception exc3 = (Exception) this.f13067c;
            this.f13067c = null;
            throw exc3;
        }
    }

    @Override // com.bytedance.sdk.component.zb.ycx.sya
    public void ycx(zb zbVar, IOException iOException) {
        zb.c cVar = (zb.c) this.f13067c;
        zb.c.d(cVar, cVar.f98508b, Sdk.SDKError.Reason.NATIVE_VIDEO_PLAYBACK_ERROR_VALUE, iOException.getMessage());
        zb.a.a(cVar.f98508b);
    }

    public /* synthetic */ k0(long j11, Object obj, int i5) {
        this.f13065a = i5;
        this.f13066b = j11;
        this.f13067c = obj;
    }

    public /* synthetic */ k0(Object obj, long j11, int i5) {
        this.f13065a = i5;
        this.f13067c = obj;
        this.f13066b = j11;
    }

    public k0(xg.a aVar) {
        this.f13065a = 1;
        sg.w.h(aVar);
        this.f13067c = aVar;
    }

    public k0(Context context) {
        this.f13065a = 6;
        this.f13067c = context;
        this.f13066b = context.getResources().getInteger(17694720);
    }

    /* JADX WARN: Code restructure failed: missing block: B:35:0x00c1, code lost:
    
        r0 = (zb.c) r22.f13067c;
        r3 = r0.f98508b;
        r4 = r24.sya();
     */
    /* JADX WARN: Code restructure failed: missing block: B:36:0x00cd, code lost:
    
        monitor-enter(qb.a.class);
     */
    /* JADX WARN: Code restructure failed: missing block: B:37:0x00ce, code lost:
    
        r0 = r0.f98512f.iterator();
     */
    /* JADX WARN: Code restructure failed: missing block: B:39:0x00d8, code lost:
    
        if (r0.hasNext() == false) goto L108;
     */
    /* JADX WARN: Code restructure failed: missing block: B:40:0x00da, code lost:
    
        r8 = (qb.a) r0.next();
     */
    /* JADX WARN: Code restructure failed: missing block: B:41:0x00e0, code lost:
    
        if (r8 == null) goto L111;
     */
    /* JADX WARN: Code restructure failed: missing block: B:42:0x00e2, code lost:
    
        r8.zb(r3, r4);
     */
    /* JADX WARN: Code restructure failed: missing block: B:43:0x00e6, code lost:
    
        r0 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:45:0x00e8, code lost:
    
        monitor-exit(qb.a.class);
     */
    /* JADX WARN: Code restructure failed: missing block: B:46:0x00e9, code lost:
    
        zb.c.e((zb.c) r22.f13067c, r13);
     */
    /* JADX WARN: Code restructure failed: missing block: B:49:0x00f6, code lost:
    
        throw r0;
     */
    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.bytedance.sdk.component.zb.ycx.sya
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void ycx(zb zbVar, xkz xkzVar) throws IOException {
        Throwable th2;
        InputStream inputStreamSya;
        Closeable closeable;
        zb.c cVar;
        syc sycVarLt;
        zb.c cVar2;
        Closeable closeable2;
        long jYcx;
        int i5;
        byte[] bArr;
        int i11;
        int i12;
        long j11;
        long j12 = this.f13066b;
        int iSya = Sdk.SDKError.Reason.NATIVE_VIDEO_PLAYBACK_ERROR_VALUE;
        syc sycVar = null;
        try {
        } catch (Throwable th3) {
            th2 = th3;
            inputStreamSya = null;
            closeable = null;
        }
        if (xkzVar != null) {
            boolean zDj = xkzVar.dj();
            if (!zDj) {
                zb.c cVar3 = (zb.c) this.f13067c;
                zb.c.d(cVar3, cVar3.f98508b, xkzVar.sya(), xkzVar.lud());
                cVar = (zb.c) this.f13067c;
                zb.c.e(cVar, xkzVar);
                ((zb.c) this.f13067c).f98508b.dy();
                ((zb.c) this.f13067c).f98508b.lt();
                zb.a.a(((zb.c) this.f13067c).f98508b);
            }
            sycVarLt = xkzVar.lt();
            try {
                sycVarLt = xkzVar.lt();
                if (!zDj || sycVarLt == null) {
                    inputStreamSya = null;
                    jYcx = 0;
                } else {
                    jYcx = this.f13066b + sycVarLt.ycx();
                    inputStreamSya = sycVarLt.sya();
                }
                try {
                } catch (Throwable th4) {
                    th2 = th4;
                    closeable2 = null;
                }
            } catch (Throwable th5) {
                th2 = th5;
                inputStreamSya = null;
                closeable2 = null;
            }
            if (inputStreamSya == null) {
                zb.c cVar4 = (zb.c) this.f13067c;
                zb.c.d(cVar4, cVar4.f98508b, xkzVar.sya(), xkzVar.lud());
                cVar2 = (zb.c) this.f13067c;
                zb.c.e(cVar2, inputStreamSya);
                zb.c.e((zb.c) this.f13067c, sycVarLt);
                cVar = (zb.c) this.f13067c;
                zb.c.e(cVar, xkzVar);
                ((zb.c) this.f13067c).f98508b.dy();
                ((zb.c) this.f13067c).f98508b.lt();
                zb.a.a(((zb.c) this.f13067c).f98508b);
            }
            RandomAccessFile randomAccessFile = new RandomAccessFile(((zb.c) this.f13067c).f98510d, "rw");
            try {
                i5 = p6.p0.f82236h;
                bArr = new byte[i5];
                i11 = 0;
                i12 = 0;
                j11 = 0;
            } catch (Throwable th6) {
                th2 = th6;
                closeable2 = randomAccessFile;
            }
            while (true) {
                int i13 = inputStreamSya.read(bArr, i12, i5 - i12);
                if (i13 != -1) {
                    if (((zb.c) this.f13067c).f98509c) {
                        break;
                    }
                    int i14 = i12 + i13;
                    long j13 = j12;
                    j11 += i13;
                    if (j11 % i5 == 0 || j11 == jYcx - this.f13066b) {
                        int iIntValue = Long.valueOf(j13).intValue();
                        ((zb.c) this.f13067c).f98508b.wie();
                        try {
                            randomAccessFile.seek(iIntValue);
                            randomAccessFile.write(bArr, i11, i14);
                        } catch (Throwable th7) {
                            com.bytedance.sdk.openadsdk.oty.sya.ycx(th7, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5c3lmJHrU8UuI=", "becpkAyaYMuFWeJJhR2z", "Wv49kA24", 69);
                        }
                        j12 = j13 + i14;
                        i12 = 0;
                    } else {
                        i12 = i14;
                        j12 = j13;
                    }
                    i11 = 0;
                    th2 = th6;
                    closeable2 = randomAccessFile;
                    sycVar = sycVarLt;
                    closeable = closeable2;
                    try {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5O1kmNAq89Se0o2xOubMuPS9M=", "aessmQ+lX86ET9htnhSsJ1rqacc=", "VOAfkBCsZsmTTw==", 244);
                        zb.c cVar5 = (zb.c) this.f13067c;
                        try {
                            cVar5.f98511e.delete();
                            cVar5.f98510d.delete();
                        } catch (Throwable th8) {
                            com.bytedance.sdk.openadsdk.oty.sya.ycx(th8, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5O1kmNAq89Se0o2xOubMuPS9M=", "aessmQ+lX86ET9htnhSsJ1rq", "WOIolBGfaMSIT/FUgBQ=", Sdk.SDKError.Reason.AD_CLOSED_TEMPLATE_ERROR_VALUE);
                        }
                        zb.c cVar6 = (zb.c) this.f13067c;
                        com.bykv.vk.openvk.ycx.ycx.ycx.sya.a aVar = cVar6.f98508b;
                        if (xkzVar != null) {
                            iSya = xkzVar.sya();
                        }
                        zb.c.d(cVar6, aVar, iSya, th2.getMessage());
                        zb.c.e((zb.c) this.f13067c, closeable);
                        zb.c.e((zb.c) this.f13067c, inputStreamSya);
                        zb.c.e((zb.c) this.f13067c, sycVar);
                        cVar = (zb.c) this.f13067c;
                        zb.c.e(cVar, xkzVar);
                        ((zb.c) this.f13067c).f98508b.dy();
                        ((zb.c) this.f13067c).f98508b.lt();
                        zb.a.a(((zb.c) this.f13067c).f98508b);
                    } finally {
                        zb.c.e((zb.c) this.f13067c, closeable);
                        zb.c.e((zb.c) this.f13067c, inputStreamSya);
                        zb.c.e((zb.c) this.f13067c, sycVar);
                        zb.c.e((zb.c) this.f13067c, xkzVar);
                        ((zb.c) this.f13067c).f98508b.dy();
                        ((zb.c) this.f13067c).f98508b.lt();
                        zb.a.a(((zb.c) this.f13067c).f98508b);
                    }
                }
                if (((zb.c) this.f13067c).f98508b.ry() && jYcx == ((zb.c) this.f13067c).f98510d.length()) {
                    zb.c.a((zb.c) this.f13067c);
                }
                zb.c cVar7 = (zb.c) this.f13067c;
                cVar7.b(cVar7.f98508b, xkzVar.sya());
                sycVar = randomAccessFile;
            }
            cVar2 = (zb.c) this.f13067c;
            zb.c.e(cVar2, inputStreamSya);
            zb.c.e((zb.c) this.f13067c, sycVarLt);
            cVar = (zb.c) this.f13067c;
            zb.c.e(cVar, xkzVar);
            ((zb.c) this.f13067c).f98508b.dy();
            ((zb.c) this.f13067c).f98508b.lt();
            zb.a.a(((zb.c) this.f13067c).f98508b);
        }
        zb.c cVar8 = (zb.c) this.f13067c;
        zb.c.d(cVar8, cVar8.f98508b, Sdk.SDKError.Reason.NATIVE_VIDEO_PLAYBACK_ERROR_VALUE, "Network link failed.");
        sycVarLt = null;
        inputStreamSya = null;
        zb.c.e((zb.c) this.f13067c, sycVar);
        cVar2 = (zb.c) this.f13067c;
        zb.c.e(cVar2, inputStreamSya);
        zb.c.e((zb.c) this.f13067c, sycVarLt);
        cVar = (zb.c) this.f13067c;
        zb.c.e(cVar, xkzVar);
        ((zb.c) this.f13067c).f98508b.dy();
        ((zb.c) this.f13067c).f98508b.lt();
        zb.a.a(((zb.c) this.f13067c).f98508b);
    }

    public k0(m90.i source) {
        this.f13065a = 2;
        Intrinsics.g(source, "source");
        this.f13067c = source;
        this.f13066b = 262144L;
    }

    public k0(ke.k kVar, long j11) {
        this.f13065a = 9;
        this.f13067c = kVar;
        wf.a.e(kVar.getPosition() >= j11);
        this.f13066b = j11;
    }
}
