package ai;

import android.os.Bundle;
import android.os.SystemClock;
import com.google.android.gms.internal.measurement.zzdd;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.tiktok.util.TTConst;
import java.util.Objects;
import java.util.concurrent.ConcurrentHashMap;

/* loaded from: classes3.dex */
public final class f3 extends z {

    /* renamed from: c, reason: collision with root package name */
    public volatile b3 f12947c;

    /* renamed from: d, reason: collision with root package name */
    public volatile b3 f12948d;

    /* renamed from: e, reason: collision with root package name */
    public b3 f12949e;

    /* renamed from: f, reason: collision with root package name */
    public final ConcurrentHashMap f12950f;

    /* renamed from: g, reason: collision with root package name */
    public zzdd f12951g;

    /* renamed from: h, reason: collision with root package name */
    public volatile boolean f12952h;

    /* renamed from: i, reason: collision with root package name */
    public volatile b3 f12953i;

    /* renamed from: j, reason: collision with root package name */
    public b3 f12954j;

    /* renamed from: k, reason: collision with root package name */
    public boolean f12955k;

    /* renamed from: l, reason: collision with root package name */
    public final Object f12956l;

    public f3(m1 m1Var) {
        super(m1Var);
        this.f12956l = new Object();
        this.f12950f = new ConcurrentHashMap();
    }

    @Override // ai.z
    public final boolean G() {
        return false;
    }

    public final b3 H(boolean z11) {
        E();
        D();
        if (!z11) {
            return this.f12949e;
        }
        b3 b3Var = this.f12949e;
        return b3Var != null ? b3Var : this.f12954j;
    }

    public final String I(String str) {
        if (str == null) {
            return "Activity";
        }
        String[] strArrSplit = str.split("\\.");
        int length = strArrSplit.length;
        String str2 = length > 0 ? strArrSplit[length - 1] : com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        m1 m1Var = (m1) this.f13368a;
        int length2 = str2.length();
        m1Var.f13136d.getClass();
        if (length2 <= 500) {
            return str2;
        }
        m1Var.f13136d.getClass();
        return str2.substring(0, 500);
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x0033  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x00b5  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void J(b3 b3Var, b3 b3Var2, long j11, boolean z11, Bundle bundle) {
        boolean z12;
        long jElapsedRealtime;
        Bundle bundle2;
        boolean z13 = b3Var.f12871e;
        m1 m1Var = (m1) this.f13368a;
        D();
        boolean z14 = false;
        if (b3Var2 != null) {
            z12 = (b3Var2.f12869c == b3Var.f12869c && Objects.equals(b3Var2.f12868b, b3Var.f12868b) && Objects.equals(b3Var2.f12867a, b3Var.f12867a)) ? false : true;
        }
        if (z11 && this.f12949e != null) {
            z14 = true;
        }
        if (z12) {
            Bundle bundle3 = bundle != null ? new Bundle(bundle) : new Bundle();
            p4.z0(b3Var, bundle3, true);
            if (b3Var2 != null) {
                String str = b3Var2.f12867a;
                if (str != null) {
                    bundle3.putString("_pn", str);
                }
                String str2 = b3Var2.f12868b;
                if (str2 != null) {
                    bundle3.putString("_pc", str2);
                }
                bundle3.putLong("_pi", b3Var2.f12869c);
            }
            if (z14) {
                x3 x3Var = m1Var.f13140h;
                m1.k(x3Var);
                w3 w3Var = x3Var.f13471f;
                long j12 = j11 - w3Var.f13397b;
                w3Var.f13397b = j11;
                if (j12 > 0) {
                    p4 p4Var = m1Var.f13141i;
                    m1.j(p4Var);
                    p4Var.p0(bundle3, j12);
                }
            }
            e eVar = m1Var.f13136d;
            xg.a aVar = m1Var.f13143k;
            if (!eVar.S()) {
                bundle3.putLong("_mst", 1L);
            }
            String str3 = true != z13 ? TTConst.TRACK_TYPE_AUTO : "app";
            aVar.getClass();
            long jCurrentTimeMillis = System.currentTimeMillis();
            if (z13) {
                long j13 = b3Var.f12872f;
                long j14 = j13 != 0 ? j13 : jCurrentTimeMillis;
                if (m1Var.f13136d.O(null, x.f13414e1)) {
                    aVar.getClass();
                    jElapsedRealtime = SystemClock.elapsedRealtime();
                } else {
                    jElapsedRealtime = 0;
                }
                if (z13) {
                    bundle2 = bundle3;
                    long j15 = b3Var.f12873g;
                    if (j15 != 0) {
                        jElapsedRealtime = j15;
                    }
                } else {
                    bundle2 = bundle3;
                }
                t2 t2Var = m1Var.f13145m;
                m1.k(t2Var);
                t2Var.L(j14, jElapsedRealtime, bundle2, str3, "_vs");
            }
        }
        if (z14) {
            M(this.f12949e, true, j11);
        }
        this.f12949e = b3Var;
        if (z13) {
            this.f12954j = b3Var;
        }
        p3 p3VarO = m1Var.o();
        p3VarO.D();
        p3VarO.E();
        p3VarO.R(new ab.z(p3VarO, b3Var));
    }

    public final void K(zzdd zzddVar, Bundle bundle) {
        Bundle bundle2;
        if (!((m1) this.f13368a).f13136d.S() || bundle == null || (bundle2 = bundle.getBundle("com.google.app_measurement.screen_service")) == null) {
            return;
        }
        this.f12950f.put(Integer.valueOf(zzddVar.f33308f), new b3(bundle2.getString(PendingUpgradeStore.KEY_NAME), bundle2.getString("referrer_name"), bundle2.getLong("id")));
    }

    public final void L(String str, b3 b3Var, boolean z11) {
        b3 b3Var2;
        b3 b3Var3 = this.f12947c == null ? this.f12948d : this.f12947c;
        if (b3Var.f12868b == null) {
            b3Var2 = new b3(b3Var.f12867a, str != null ? I(str) : null, b3Var.f12869c, b3Var.f12871e, b3Var.f12872f, b3Var.f12873g);
        } else {
            b3Var2 = b3Var;
        }
        this.f12948d = this.f12947c;
        this.f12947c = b3Var2;
        m1 m1Var = (m1) this.f13368a;
        m1Var.f13143k.getClass();
        long jElapsedRealtime = SystemClock.elapsedRealtime();
        k1 k1Var = m1Var.f13139g;
        m1.l(k1Var);
        k1Var.M(new c3(this, b3Var2, b3Var3, jElapsedRealtime, z11));
    }

    public final void M(b3 b3Var, boolean z11, long j11) {
        m1 m1Var = (m1) this.f13368a;
        u uVar = m1Var.n;
        m1.i(uVar);
        m1Var.f13143k.getClass();
        uVar.G(SystemClock.elapsedRealtime());
        boolean z12 = b3Var != null && b3Var.f12870d;
        x3 x3Var = m1Var.f13140h;
        m1.k(x3Var);
        if (!x3Var.f13471f.i(j11, z12, z11) || b3Var == null) {
            return;
        }
        b3Var.f12870d = false;
    }

    public final b3 N(zzdd zzddVar) {
        sg.w.h(zzddVar);
        Integer numValueOf = Integer.valueOf(zzddVar.f33308f);
        ConcurrentHashMap concurrentHashMap = this.f12950f;
        b3 b3Var = (b3) concurrentHashMap.get(numValueOf);
        if (b3Var == null) {
            String strI = I(zzddVar.f33309g);
            p4 p4Var = ((m1) this.f13368a).f13141i;
            m1.j(p4Var);
            b3 b3Var2 = new b3(null, strI, p4Var.B0());
            concurrentHashMap.put(numValueOf, b3Var2);
            b3Var = b3Var2;
        }
        return this.f12953i != null ? this.f12953i : b3Var;
    }
}
