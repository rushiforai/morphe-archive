package t90;

import android.os.Process;
import android.os.SystemClock;
import android.os.Trace;
import android.util.Log;
import b.c0;
import gf.q0;
import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.concurrent.ThreadLocalRandom;
import java.util.concurrent.atomic.AtomicInteger;
import org.json.JSONException;
import org.json.JSONObject;
import ps.j;
import qm.e;
import s90.b0;
import s90.e0;
import s90.y;
import s90.z;

/* loaded from: classes5.dex */
public final class a extends e0 {

    /* renamed from: f, reason: collision with root package name */
    public final AtomicInteger f88929f;

    /* renamed from: g, reason: collision with root package name */
    public final q0 f88930g;

    public a() {
        q0 q0Var = new q0();
        q0Var.f57608c = new Object();
        q0Var.f57607b = Long.MIN_VALUE;
        this.f88929f = new AtomicInteger();
        this.f88930g = q0Var;
    }

    @Override // s90.e0
    public final long a() {
        long jNextLong = ThreadLocalRandom.current().nextLong(-9223372036854775807L, 9223372036854775805L);
        return jNextLong >= -1 ? jNextLong + 2 : jNextLong;
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x0032 A[PHI: r4
      0x0032: PHI (r4v7 int) = (r4v0 int), (r4v8 int), (r4v9 int) binds: [B:11:0x0028, B:13:0x002b, B:15:0x002e] A[DONT_GENERATE, DONT_INLINE]] */
    @Override // s90.e0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void d(z zVar) {
        int i5;
        int i11;
        p90.a.a("CronetLoggerImpl#logCronetEngineBuilderInitializedInfo");
        try {
            long j11 = zVar.f87072a;
            int iF = c0.F(zVar.f87073b);
            int i12 = 2;
            int i13 = 1;
            if (iF == 0) {
                i5 = 0;
                i11 = 1;
            } else if (iF != 1) {
                i11 = 0;
                i5 = 0;
            } else {
                i11 = 2;
                i5 = 0;
            }
            int i14 = zVar.f87074c;
            int iOrdinal = zVar.f87075d.ordinal();
            if (iOrdinal != 1) {
                if (iOrdinal != 2) {
                    i12 = 3;
                    if (iOrdinal != 3) {
                        i12 = 4;
                        i13 = iOrdinal != 4 ? i5 : i12;
                    }
                }
            }
            int iF2 = c0.F(e.a(zVar.f87076e));
            s90.c0 c0Var = zVar.f87077f;
            int i15 = c0Var.f86893a;
            int i16 = c0Var.f86894b;
            int i17 = c0Var.f86895c;
            int i18 = c0Var.f86896d;
            s90.c0 c0Var2 = zVar.f87078g;
            int i19 = -1;
            int i21 = c0Var2 == null ? -1 : c0Var2.f86893a;
            int i22 = c0Var2 == null ? -1 : c0Var2.f86894b;
            int i23 = c0Var2 == null ? -1 : c0Var2.f86895c;
            if (c0Var2 != null) {
                i19 = c0Var2.f86896d;
            }
            b.a(j11, i11, i14, i13, iF2, i15, i16, i17, i18, i21, i22, i23, i19, zVar.f87079h);
            Trace.endSection();
        } finally {
        }
    }

    @Override // s90.e0
    public final void e(long j11, y yVar, s90.c0 c0Var) {
        int i5;
        try {
            p90.a.a("CronetLoggerImpl#writeCronetEngineCreation");
            try {
                c cVar = new c(yVar.f87064f);
                int i11 = c0Var.f86893a;
                int i12 = c0Var.f86894b;
                int i13 = c0Var.f86895c;
                int i14 = c0Var.f86896d;
                boolean z11 = yVar.f87062d;
                boolean z12 = yVar.f87061c;
                int i15 = yVar.f87063e;
                int i16 = 1;
                if (i15 == 0) {
                    i5 = i16;
                } else if (i15 == 1) {
                    i5 = 2;
                } else if (i15 == 2) {
                    i5 = 3;
                } else {
                    if (i15 != 3) {
                        throw new IllegalArgumentException("Expected httpCacheMode to range from 0 to 3");
                    }
                    i16 = 4;
                    i5 = i16;
                }
                boolean z13 = yVar.f87059a;
                boolean z14 = yVar.f87060b;
                boolean z15 = yVar.f87065g;
                String strA = cVar.a();
                Object objCast = null;
                int iF = c0.F(e.a((Boolean) cVar.b("QUIC", "store_server_configs_in_properties", null, Boolean.class)));
                int iIntValue = ((Integer) cVar.b("QUIC", "max_server_configs_stored_in_properties", -1, Integer.class)).intValue();
                int iIntValue2 = ((Integer) cVar.b("QUIC", "idle_connection_timeout_seconds", -1, Integer.class)).intValue();
                int iF2 = c0.F(e.a((Boolean) cVar.b("QUIC", "goaway_sessions_on_ip_change", null, Boolean.class)));
                int iF3 = c0.F(e.a((Boolean) cVar.b("QUIC", "close_sessions_on_ip_change", null, Boolean.class)));
                int iF4 = c0.F(e.a((Boolean) cVar.b("QUIC", "migrate_sessions_on_network_change_v2", null, Boolean.class)));
                int iF5 = c0.F(e.a((Boolean) cVar.b("QUIC", "migrate_sessions_early_v2", null, Boolean.class)));
                int iF6 = c0.F(e.a((Boolean) cVar.b("QUIC", "disable_bidirectional_streams", null, Boolean.class)));
                int iIntValue3 = ((Integer) cVar.b("QUIC", "max_time_before_crypto_handshake_seconds", -1, Integer.class)).intValue();
                int iIntValue4 = ((Integer) cVar.b("QUIC", "max_idle_time_before_crypto_handshake_seconds", -1, Integer.class)).intValue();
                int iF7 = c0.F(e.a((Boolean) cVar.b("QUIC", "enable_socket_recv_optimization", null, Boolean.class)));
                int iF8 = c0.F(e.a((Boolean) cVar.b("AsyncDNS", "enable", null, Boolean.class)));
                int iF9 = c0.F(e.a((Boolean) cVar.b("StaleDNS", "enable", null, Boolean.class)));
                int iIntValue5 = ((Integer) cVar.b("StaleDNS", "delay_ms", -1, Integer.class)).intValue();
                int iIntValue6 = ((Integer) cVar.b("StaleDNS", "max_expired_time_ms", -1, Integer.class)).intValue();
                int iIntValue7 = ((Integer) cVar.b("StaleDNS", "max_stale_uses", -1, Integer.class)).intValue();
                int iF10 = c0.F(e.a((Boolean) cVar.b("StaleDNS", "allow_other_network", null, Boolean.class)));
                int iF11 = c0.F(e.a((Boolean) cVar.b("StaleDNS", "persist_to_disk", null, Boolean.class)));
                int iIntValue8 = ((Integer) cVar.b("StaleDNS", "persist_delay_ms", -1, Integer.class)).intValue();
                int iF12 = c0.F(e.a((Boolean) cVar.b("StaleDNS", "use_stale_on_name_not_resolved", null, Boolean.class)));
                JSONObject jSONObject = cVar.f88932a;
                if (jSONObject.length() != 0) {
                    try {
                        objCast = Boolean.class.cast(jSONObject.get("disable_ipv6_on_wifi"));
                    } catch (ClassCastException | JSONException e3) {
                        if (Log.isLoggable("c", 2)) {
                            e3.getMessage();
                        }
                    }
                }
                b.c(j11, i11, i12, i13, i14, 3, z11, z12, i5, z13, z14, z15, strA, iF, iIntValue, iIntValue2, iF2, iF3, iF4, iF5, iF6, iIntValue3, iIntValue4, iF7, iF8, iF9, iIntValue5, iIntValue6, iIntValue7, iF10, iF11, iIntValue8, iF12, c0.F(e.a((Boolean) objCast)), yVar.f87066h, Process.myUid());
                Trace.endSection();
            } finally {
            }
        } catch (Exception e11) {
            if (Log.isLoggable("a", 3)) {
                e11.getMessage();
            }
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:144:0x0218  */
    /* JADX WARN: Removed duplicated region for block: B:161:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Type inference failed for: r2v1, types: [java.util.concurrent.atomic.AtomicInteger] */
    /* JADX WARN: Type inference failed for: r2v2 */
    /* JADX WARN: Type inference failed for: r2v3, types: [int] */
    /* JADX WARN: Type inference failed for: r2v6 */
    /* JADX WARN: Type inference failed for: r2v7 */
    /* JADX WARN: Type inference failed for: r3v2, types: [java.util.concurrent.atomic.AtomicInteger] */
    @Override // s90.e0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void f(long j11, b0 b0Var) throws Throwable {
        int i5;
        int i11;
        int i12;
        int i13;
        int i14;
        int i15;
        String str;
        byte[] bytes;
        q0 q0Var = this.f88930g;
        synchronized (q0Var.f57608c) {
            try {
                long jElapsedRealtime = SystemClock.elapsedRealtime();
                if (q0Var.f57607b + 1000 <= jElapsedRealtime) {
                    q0Var.f57606a = 1;
                    q0Var.f57607b = jElapsedRealtime;
                } else {
                    int i16 = q0Var.f57606a;
                    if (i16 >= 1) {
                        this.f88929f.incrementAndGet();
                        return;
                    }
                    q0Var.f57606a = i16 + 1;
                }
                ?? r22 = this.f88929f;
                int andSet = r22.getAndSet(0);
                try {
                    try {
                        p90.a.a("CronetLoggerImpl#writeCronetTrafficReported");
                        try {
                            long j12 = b0Var.f86880a;
                            j.f(j12, "Request header size is negative");
                            double d5 = j12 / 1024.0d;
                            i5 = j.i(d5, 0, 1) ? 1 : j.i(d5, 1, 10) ? 2 : j.i(d5, 10, 25) ? 3 : j.i(d5, 25, 50) ? 4 : j.i(d5, 50, 100) ? 5 : 6;
                            long j13 = b0Var.f86881b;
                            j.f(j13, "Request body size is negative");
                            double d11 = j13 / 1024.0d;
                            i11 = d11 == 0.0d ? 1 : (d11 <= 0.0d || d11 >= 10.0d) ? j.i(d11, 10, 50) ? 3 : j.i(d11, 50, 200) ? 4 : j.i(d11, 200, 500) ? 5 : j.i(d11, 500, 1000) ? 6 : j.i(d11, 1000, 5000) ? 7 : 8 : 2;
                            long j14 = b0Var.f86882c;
                            j.f(j14, "Response header size is negative");
                            double d12 = j14 / 1024.0d;
                            if (j.i(d12, 0, 1)) {
                                i13 = 1;
                                i12 = 200;
                            } else if (j.i(d12, 1, 10)) {
                                i12 = 200;
                                i13 = 2;
                            } else if (j.i(d12, 10, 25)) {
                                i12 = 200;
                                i13 = 3;
                            } else if (j.i(d12, 25, 50)) {
                                i12 = 200;
                                i13 = 4;
                            } else if (j.i(d12, 50, 100)) {
                                i12 = 200;
                                i13 = 5;
                            } else {
                                i12 = 200;
                                i13 = 6;
                            }
                            long j15 = b0Var.f86883d;
                            j.f(j15, "Response body size is negative");
                            double d13 = j15 / 1024.0d;
                            i14 = d13 == 0.0d ? 1 : (d13 <= 0.0d || d13 >= 10.0d) ? j.i(d13, 10, 50) ? 3 : j.i(d13, 50, i12) ? 4 : j.i(d13, i12, 500) ? 5 : j.i(d13, 500, 1000) ? 6 : j.i(d13, 1000, 5000) ? 7 : 8 : 2;
                            i15 = b0Var.f86884e;
                            str = b0Var.f86887h;
                        } catch (Throwable th2) {
                            th = th2;
                        }
                        try {
                            MessageDigest messageDigest = d.f88933a;
                            long j16 = 0;
                            if (messageDigest != null && str != null && !str.isEmpty() && (bytes = str.getBytes(StandardCharsets.UTF_8)) != null && bytes.length != 0) {
                                j16 = ByteBuffer.wrap(messageDigest.digest(bytes)).getLong();
                            }
                            long j17 = j16;
                            int millis = (int) b0Var.f86885f.toMillis();
                            int millis2 = (int) b0Var.f86886g.toMillis();
                            int iF = c0.F(b0Var.f86888i);
                            int i17 = iF != 0 ? iF != 1 ? iF != 2 ? 0 : 3 : 2 : 1;
                            int i18 = b0Var.f86889j;
                            int i19 = b0Var.f86890k;
                            int i21 = b0Var.f86891l;
                            Boolean bool = Boolean.FALSE;
                            int iF2 = c0.F(e.a(bool));
                            int iF3 = c0.F(e.a(Boolean.valueOf(b0Var.f86892m)));
                            int i22 = b0Var.n;
                            int iF4 = c0.F(1);
                            b.b(j11, i5, i11, i13, i14, i15, j17, millis, millis2, andSet, i17, i18, i19, i21, iF2, iF3, i22, 0, iF4 != 1 ? iF4 != 2 ? 0 : 100 : 1, c0.F(e.a(bool)), b0Var.o, 3);
                            Trace.endSection();
                        } catch (Throwable th3) {
                            th = th3;
                            r22 = andSet;
                            Throwable th4 = th;
                            try {
                                Trace.endSection();
                                throw th4;
                            } catch (Throwable th5) {
                                th4.addSuppressed(th5);
                                throw th4;
                            }
                        }
                    } catch (Exception e3) {
                        e = e3;
                        r22 = andSet;
                        this.f88929f.addAndGet(r22);
                        if (Log.isLoggable("a", 3)) {
                            return;
                        }
                        e.getMessage();
                    }
                } catch (Exception e11) {
                    e = e11;
                    this.f88929f.addAndGet(r22);
                    if (Log.isLoggable("a", 3)) {
                    }
                }
            } finally {
            }
        }
    }
}
