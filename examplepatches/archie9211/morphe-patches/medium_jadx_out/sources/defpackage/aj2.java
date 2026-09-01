package defpackage;

import android.os.Process;
import android.os.Trace;
import android.util.Log;
import j$.util.concurrent.ThreadLocalRandom;
import java.util.concurrent.atomic.AtomicInteger;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class aj2 extends dm2 {
    public final AtomicInteger l;
    public final l70 m;

    public aj2() {
        l70 l70Var = new l70();
        l70Var.a = new Object();
        l70Var.c = Long.MIN_VALUE;
        this.l = new AtomicInteger();
        this.m = l70Var;
    }

    @Override // defpackage.dm2
    public final long G() {
        long jNextLong = ThreadLocalRandom.current().nextLong(-9223372036854775807L, 9223372036854775805L);
        return jNextLong >= -1 ? jNextLong + 2 : jNextLong;
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x0039 A[PHI: r5
      0x0039: PHI (r5v1 int) = (r5v0 int), (r5v6 int), (r5v7 int) binds: [B:10:0x002d, B:13:0x0032, B:15:0x0035] A[DONT_GENERATE, DONT_INLINE]] */
    @Override // defpackage.dm2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void N(defpackage.si2 r18) {
        /*
            r17 = this;
            r0 = r18
            java.lang.String r1 = "CronetLoggerImpl#logCronetEngineBuilderInitializedInfo"
            defpackage.grb.f(r1)
            long r2 = r0.a     // Catch: java.lang.Throwable -> L7c
            ri2 r1 = r0.b     // Catch: java.lang.Throwable -> L7c
            int[] r4 = defpackage.zi2.b     // Catch: java.lang.Throwable -> L7c
            int r1 = r1.ordinal()     // Catch: java.lang.Throwable -> L7c
            r1 = r4[r1]     // Catch: java.lang.Throwable -> L7c
            r4 = 0
            r5 = 1
            r6 = 2
            if (r1 == r5) goto L1f
            if (r1 == r6) goto L1c
            r1 = r4
            goto L21
        L1c:
            r1 = r4
            r4 = r6
            goto L21
        L1f:
            r1 = r4
            r4 = r5
        L21:
            int r7 = r0.c     // Catch: java.lang.Throwable -> L7c
            ti2 r8 = r0.d     // Catch: java.lang.Throwable -> L7c
            int[] r9 = defpackage.zi2.d     // Catch: java.lang.Throwable -> L7c
            int r8 = r8.ordinal()     // Catch: java.lang.Throwable -> L7c
            r8 = r9[r8]     // Catch: java.lang.Throwable -> L7c
            if (r8 == r5) goto L39
            if (r8 == r6) goto L3a
            r5 = 3
            if (r8 == r5) goto L39
            r5 = 4
            if (r8 == r5) goto L39
            r6 = r1
            goto L3a
        L39:
            r6 = r5
        L3a:
            java.lang.Boolean r1 = r0.e     // Catch: java.lang.Throwable -> L7c
            aw8 r1 = defpackage.aw8.fromBoolean(r1)     // Catch: java.lang.Throwable -> L7c
            int r1 = r1.getValue()     // Catch: java.lang.Throwable -> L7c
            xi2 r5 = r0.f     // Catch: java.lang.Throwable -> L7c
            int r8 = r5.a     // Catch: java.lang.Throwable -> L7c
            int r9 = r5.b     // Catch: java.lang.Throwable -> L7c
            int r10 = r5.c     // Catch: java.lang.Throwable -> L7c
            int r11 = r5.d     // Catch: java.lang.Throwable -> L7c
            xi2 r5 = r0.g     // Catch: java.lang.Throwable -> L7c
            r12 = -1
            if (r5 != 0) goto L55
            r13 = r12
            goto L57
        L55:
            int r13 = r5.a     // Catch: java.lang.Throwable -> L7c
        L57:
            if (r5 != 0) goto L5b
            r14 = r12
            goto L5d
        L5b:
            int r14 = r5.b     // Catch: java.lang.Throwable -> L7c
        L5d:
            if (r5 != 0) goto L61
            r15 = r12
            goto L63
        L61:
            int r15 = r5.c     // Catch: java.lang.Throwable -> L7c
        L63:
            if (r5 != 0) goto L66
            goto L68
        L66:
            int r12 = r5.d     // Catch: java.lang.Throwable -> L7c
        L68:
            int r0 = r0.h     // Catch: java.lang.Throwable -> L7c
            r5 = r15
            r15 = r12
            r12 = r13
            r13 = r14
            r14 = r5
            r16 = r0
            r5 = r7
            r7 = r1
            defpackage.dj2.a(r2, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16)     // Catch: java.lang.Throwable -> L7c
            android.os.Trace.endSection()
            return
        L7a:
            r1 = r0
            goto L7e
        L7c:
            r0 = move-exception
            goto L7a
        L7e:
            android.os.Trace.endSection()     // Catch: java.lang.Throwable -> L82
            goto L86
        L82:
            r0 = move-exception
            r1.addSuppressed(r0)
        L86:
            throw r1
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.aj2.N(si2):void");
    }

    @Override // defpackage.dm2
    public final void O(long j, qi2 qi2Var, xi2 xi2Var, ti2 ti2Var) {
        int i;
        if (ti2Var == null) {
            return;
        }
        try {
            grb.f("CronetLoggerImpl#writeCronetEngineCreation");
            try {
                y54 y54Var = new y54(qi2Var.e);
                int i2 = xi2Var.a;
                int i3 = xi2Var.b;
                int i4 = xi2Var.c;
                int i5 = xi2Var.d;
                int i6 = zi2.d[ti2Var.ordinal()];
                int i7 = i6 != 1 ? i6 != 2 ? i6 != 3 ? i6 != 4 ? 0 : 4 : 3 : 2 : 1;
                boolean z = qi2Var.c;
                int i8 = qi2Var.d;
                if (i8 == 0) {
                    i = 1;
                } else if (i8 == 1) {
                    i = 2;
                } else if (i8 == 2) {
                    i = 3;
                } else {
                    if (i8 != 3) {
                        throw new IllegalArgumentException("Expected httpCacheMode to range from 0 to 3");
                    }
                    i = 4;
                }
                dj2.c(j, i2, i3, i4, i5, i7, z, i, qi2Var.a, qi2Var.b, y54Var.a(), aw8.fromBoolean((Boolean) y54Var.c("QUIC", "store_server_configs_in_properties", null, Boolean.class)).getValue(), ((Integer) y54Var.c("QUIC", "max_server_configs_stored_in_properties", -1, Integer.class)).intValue(), ((Integer) y54Var.c("QUIC", "idle_connection_timeout_seconds", -1, Integer.class)).intValue(), aw8.fromBoolean((Boolean) y54Var.c("QUIC", "goaway_sessions_on_ip_change", null, Boolean.class)).getValue(), aw8.fromBoolean((Boolean) y54Var.c("QUIC", "close_sessions_on_ip_change", null, Boolean.class)).getValue(), aw8.fromBoolean((Boolean) y54Var.c("QUIC", "migrate_sessions_on_network_change_v2", null, Boolean.class)).getValue(), aw8.fromBoolean((Boolean) y54Var.c("QUIC", "migrate_sessions_early_v2", null, Boolean.class)).getValue(), aw8.fromBoolean((Boolean) y54Var.c("QUIC", "disable_bidirectional_streams", null, Boolean.class)).getValue(), ((Integer) y54Var.c("QUIC", "max_time_before_crypto_handshake_seconds", -1, Integer.class)).intValue(), ((Integer) y54Var.c("QUIC", "max_idle_time_before_crypto_handshake_seconds", -1, Integer.class)).intValue(), aw8.fromBoolean((Boolean) y54Var.c("QUIC", "enable_socket_recv_optimization", null, Boolean.class)).getValue(), aw8.fromBoolean((Boolean) y54Var.c("AsyncDNS", "enable", null, Boolean.class)).getValue(), aw8.fromBoolean((Boolean) y54Var.c("StaleDNS", "enable", null, Boolean.class)).getValue(), ((Integer) y54Var.c("StaleDNS", "delay_ms", -1, Integer.class)).intValue(), ((Integer) y54Var.c("StaleDNS", "max_expired_time_ms", -1, Integer.class)).intValue(), ((Integer) y54Var.c("StaleDNS", "max_stale_uses", -1, Integer.class)).intValue(), aw8.fromBoolean((Boolean) y54Var.c("StaleDNS", "allow_other_network", null, Boolean.class)).getValue(), aw8.fromBoolean((Boolean) y54Var.c("StaleDNS", "persist_to_disk", null, Boolean.class)).getValue(), ((Integer) y54Var.c("StaleDNS", "persist_delay_ms", -1, Integer.class)).intValue(), aw8.fromBoolean((Boolean) y54Var.c("StaleDNS", "use_stale_on_name_not_resolved", null, Boolean.class)).getValue(), y54Var.b().getValue(), qi2Var.f, Process.myUid());
                Trace.endSection();
            } finally {
            }
        } catch (Exception e) {
            if (Log.isLoggable("aj2", 3)) {
                Log.d("aj2", "Failed to log CronetEngine:" + j + " creation: " + e.getMessage());
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:157:0x0256  */
    /* JADX WARN: Removed duplicated region for block: B:174:? A[RETURN, SYNTHETIC] */
    @Override // defpackage.dm2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void P(long r33, defpackage.wi2 r35) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 640
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.aj2.P(long, wi2):void");
    }
}
