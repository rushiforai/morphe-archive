package com.bytedance.sdk.component.ul;

import android.os.Bundle;
import b.c0;
import com.bytedance.sdk.component.ul.sya.dj;
import com.bytedance.sdk.component.zb.ycx.ea;
import com.bytedance.sdk.component.zb.ycx.fby;
import com.bytedance.sdk.component.zb.ycx.ycx.ycx.lud;
import com.bytedance.sdk.openadsdk.pmi.dj;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.concurrent.TimeUnit;

/* loaded from: classes2.dex */
public class ycx {
    private static lud ycx;

    /* renamed from: zb, reason: collision with root package name */
    private static sya f24070zb;
    private ea sya;

    public interface sya {
        void ycx(String str, String str2, String str3, int i5, String str4, boolean z11, int i11, int i12);

        boolean ycx();

        boolean zb();
    }

    /* renamed from: com.bytedance.sdk.component.ul.ycx$ycx, reason: collision with other inner class name */
    public static final class C0042ycx {

        /* renamed from: dj, reason: collision with root package name */
        zb f24071dj;

        /* renamed from: lt, reason: collision with root package name */
        private Set<String> f24072lt;

        /* renamed from: ul, reason: collision with root package name */
        private Bundle f24073ul;
        final List<fby> lud = new ArrayList();
        int ycx = 10000;

        /* renamed from: zb, reason: collision with root package name */
        int f24074zb = 10000;
        int sya = 10000;

        public C0042ycx sya(long j11, TimeUnit timeUnit) {
            this.sya = ycx("timeout", j11, timeUnit);
            return this;
        }

        public C0042ycx ycx(boolean z11) {
            return this;
        }

        public C0042ycx zb(long j11, TimeUnit timeUnit) {
            this.f24074zb = ycx("timeout", j11, timeUnit);
            return this;
        }

        public C0042ycx ycx(long j11, TimeUnit timeUnit) {
            this.ycx = ycx("timeout", j11, timeUnit);
            return this;
        }

        public C0042ycx ycx(fby fbyVar) {
            this.lud.add(fbyVar);
            return this;
        }

        public C0042ycx ycx(zb zbVar) {
            this.f24071dj = zbVar;
            return this;
        }

        private static int ycx(String str, long j11, TimeUnit timeUnit) {
            if (j11 < 0) {
                throw new IllegalArgumentException(c0.E(str, " < 0"));
            }
            if (timeUnit != null) {
                long millis = timeUnit.toMillis(j11);
                if (millis > 2147483647L) {
                    throw new IllegalArgumentException(c0.E(str, " too large."));
                }
                if (millis != 0 || j11 <= 0) {
                    return (int) millis;
                }
                throw new IllegalArgumentException(c0.E(str, " too small."));
            }
            throw new NullPointerException("unit == null");
        }

        public ycx ycx() {
            return new ycx(this);
        }
    }

    public interface zb {
        void sya(dj djVar);

        void ycx(dj djVar);

        void zb(dj djVar);
    }

    public static boolean lt() {
        sya syaVar = f24070zb;
        if (syaVar == null) {
            return false;
        }
        return syaVar.ycx();
    }

    public static boolean lud() {
        lud ludVar = ycx;
        if (ludVar == null) {
            return false;
        }
        return ludVar.ycx();
    }

    public static boolean ul() {
        sya syaVar = f24070zb;
        if (syaVar == null) {
            return false;
        }
        return syaVar.zb();
    }

    public static void ycx() {
        com.bytedance.sdk.component.ul.sya.dj.ycx(dj.ycx.DEBUG);
    }

    public com.bytedance.sdk.component.ul.zb.ycx dj() {
        return new com.bytedance.sdk.component.ul.zb.ycx(this.sya);
    }

    public ea fby() {
        return this.sya;
    }

    public com.bytedance.sdk.component.ul.zb.zb sya() {
        return new com.bytedance.sdk.component.ul.zb.zb(this.sya);
    }

    public com.bytedance.sdk.component.ul.zb.dj zb() {
        return new com.bytedance.sdk.component.ul.zb.dj(this.sya);
    }

    private ycx(C0042ycx c0042ycx) {
        ea.ycx ycxVar = new ea.ycx();
        long j11 = c0042ycx.ycx;
        TimeUnit timeUnit = TimeUnit.MILLISECONDS;
        ea.ycx ycxVarZb = ycxVar.ycx(j11, timeUnit).sya(c0042ycx.sya, timeUnit).zb(c0042ycx.f24074zb, timeUnit);
        List<fby> list = c0042ycx.lud;
        if (list != null && list.size() > 0) {
            Iterator<fby> it = c0042ycx.lud.iterator();
            while (it.hasNext()) {
                ycxVarZb.ycx(it.next());
            }
        }
        if (c0042ycx.f24073ul != null) {
            Bundle unused = c0042ycx.f24073ul;
        }
        Set unused2 = c0042ycx.f24072lt;
        ycxVarZb.ycx(c0042ycx.f24071dj);
        this.sya = ycxVarZb.ycx();
    }

    public static void ycx(lud ludVar) {
        ycx = ludVar;
    }

    public static void ycx(String str, String str2, String str3, int i5, String str4, boolean z11, int i11, int i12) {
        sya syaVar = f24070zb;
        if (syaVar == null) {
            return;
        }
        syaVar.ycx(str, str2, str3, i5, str4, z11, i11, i12);
    }

    public static void ycx(sya syaVar) {
        f24070zb = syaVar;
    }
}
