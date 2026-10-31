package ads_mobile_sdk;

import b.o2;
import java.util.LinkedHashMap;
import kotlin.Unit;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.internal.Intrinsics;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;

/* loaded from: classes2.dex */
public final class ck implements b.db {

    /* renamed from: a, reason: collision with root package name */
    public final o2 f1911a;

    /* renamed from: b, reason: collision with root package name */
    public final jr0 f1912b;

    /* renamed from: c, reason: collision with root package name */
    public final Object f1913c;

    /* renamed from: d, reason: collision with root package name */
    public int f1914d;

    /* renamed from: e, reason: collision with root package name */
    public int f1915e;

    /* renamed from: f, reason: collision with root package name */
    public final LinkedHashMap f1916f;

    /* renamed from: g, reason: collision with root package name */
    public Long f1917g;

    /* renamed from: h, reason: collision with root package name */
    public final Object f1918h;

    /* renamed from: i, reason: collision with root package name */
    public int f1919i;

    /* renamed from: j, reason: collision with root package name */
    public final LinkedHashMap f1920j;

    /* renamed from: k, reason: collision with root package name */
    public final LinkedHashMap f1921k;

    /* renamed from: l, reason: collision with root package name */
    public final Object f1922l;

    /* renamed from: m, reason: collision with root package name */
    public boolean f1923m;
    public long n;

    public ck(jr0 flags, o2 clock) {
        Intrinsics.g(clock, "clock");
        Intrinsics.g(flags, "flags");
        this.f1911a = clock;
        this.f1912b = flags;
        this.f1913c = new Object();
        this.f1914d = -1;
        this.f1915e = -1;
        this.f1916f = new LinkedHashMap();
        this.f1918h = new Object();
        this.f1920j = new LinkedHashMap();
        this.f1921k = new LinkedHashMap();
        this.f1922l = new Object();
        Duration.f72038b.getClass();
        this.n = 0L;
    }

    @Override // b.db
    public final Object b(long j11, SuspendLambda suspendLambda) {
        synchronized (this.f1922l) {
            if (!this.f1923m) {
                return Unit.f71706a;
            }
            if (Duration.c(j11, this.n) < 0) {
                return Unit.f71706a;
            }
            boolean z11 = false;
            this.f1923m = false;
            jr0 jr0Var = this.f1912b;
            jr0Var.getClass();
            if (((Boolean) jr0Var.a("gads:reset_session_counters_on_app_foreground:enabled", Boolean.TRUE, jn.a$10)).booleanValue()) {
                long jL = Duration.l(j11, this.n);
                jr0 jr0Var2 = this.f1912b;
                jr0Var2.getClass();
                if (Duration.c(jL, ((Duration) jr0Var2.a("gads:app_activity_tracker:app_session_timeout_ms", new Duration(DurationKt.g(5, DurationUnit.f72047f)), u.a$1)).f72041a) > 0) {
                    z11 = true;
                }
            }
            this.n = j11;
            Unit unit = Unit.f71706a;
            if (!z11) {
                return unit;
            }
            synchronized (this.f1913c) {
                this.f1917g = null;
                this.f1915e = -1;
            }
            return unit;
        }
    }

    @Override // b.db
    public final Object d(long j11, SuspendLambda suspendLambda) {
        synchronized (this.f1922l) {
            if (this.f1923m) {
                return Unit.f71706a;
            }
            if (Duration.c(j11, this.n) < 0) {
                return Unit.f71706a;
            }
            this.f1923m = true;
            this.n = j11;
            return Unit.f71706a;
        }
    }
}
