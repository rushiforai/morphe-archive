package r7;

import android.content.Context;
import android.content.Intent;
import android.os.Handler;
import android.os.PowerManager;
import androidx.recyclerview.widget.l0;
import androidx.room.x;
import androidx.work.impl.background.systemalarm.SystemAlarmService;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.google.android.gms.internal.measurement.k2;
import com.google.android.gms.internal.measurement.v6;
import java.util.Objects;
import o7.r;
import p7.m;
import t70.c0;
import t70.s1;
import v7.j;
import x7.q;
import y7.p;
import y7.u;
import y7.v;
import y7.w;

/* loaded from: classes2.dex */
public final class g implements t7.f, u {

    /* renamed from: a, reason: collision with root package name */
    public final Context f85577a;

    /* renamed from: b, reason: collision with root package name */
    public final int f85578b;

    /* renamed from: c, reason: collision with root package name */
    public final x7.i f85579c;

    /* renamed from: d, reason: collision with root package name */
    public final i f85580d;

    /* renamed from: e, reason: collision with root package name */
    public final v6 f85581e;

    /* renamed from: f, reason: collision with root package name */
    public final Object f85582f;

    /* renamed from: g, reason: collision with root package name */
    public int f85583g;

    /* renamed from: h, reason: collision with root package name */
    public final x f85584h;

    /* renamed from: i, reason: collision with root package name */
    public final a8.b f85585i;

    /* renamed from: j, reason: collision with root package name */
    public PowerManager.WakeLock f85586j;

    /* renamed from: k, reason: collision with root package name */
    public boolean f85587k;

    /* renamed from: l, reason: collision with root package name */
    public final m f85588l;

    /* renamed from: m, reason: collision with root package name */
    public final c0 f85589m;
    public volatile s1 n;

    static {
        r.e("DelayMetCommandHandler");
    }

    public g(Context context, int i5, i iVar, m mVar) {
        this.f85577a = context;
        this.f85578b = i5;
        this.f85580d = iVar;
        this.f85579c = mVar.f82354a;
        this.f85588l = mVar;
        j jVar = iVar.f85597e.f82381j;
        a8.c cVar = (a8.c) iVar.f85594b;
        this.f85584h = cVar.f458a;
        this.f85585i = cVar.f461d;
        this.f85589m = cVar.f459b;
        this.f85581e = new v6(jVar);
        this.f85587k = false;
        this.f85583g = 0;
        this.f85582f = new Object();
    }

    public static void b(g gVar) {
        int i5 = gVar.f85578b;
        a8.b bVar = gVar.f85585i;
        Context context = gVar.f85577a;
        i iVar = gVar.f85580d;
        x7.i iVar2 = gVar.f85579c;
        if (gVar.f85583g >= 2) {
            r.c().getClass();
            return;
        }
        gVar.f85583g = 2;
        r.c().getClass();
        Intent intent = new Intent(context, (Class<?>) SystemAlarmService.class);
        intent.setAction("ACTION_STOP_WORK");
        c.d(intent, iVar2);
        bVar.execute(new l0(iVar, false, intent, i5, 4));
        if (!iVar.f85596d.e(iVar2.f95141a)) {
            r.c().getClass();
            return;
        }
        r.c().getClass();
        Intent intent2 = new Intent(context, (Class<?>) SystemAlarmService.class);
        intent2.setAction("ACTION_SCHEDULE_WORK");
        c.d(intent2, iVar2);
        bVar.execute(new l0(iVar, false, intent2, i5, 4));
    }

    public static void c(g gVar) {
        if (gVar.f85583g != 0) {
            r rVarC = r.c();
            Objects.toString(gVar.f85579c);
            rVarC.getClass();
            return;
        }
        gVar.f85583g = 1;
        r rVarC2 = r.c();
        Objects.toString(gVar.f85579c);
        rVarC2.getClass();
        if (!gVar.f85580d.f85596d.i(gVar.f85588l, null)) {
            gVar.d();
            return;
        }
        w wVar = gVar.f85580d.f85595c;
        x7.i iVar = gVar.f85579c;
        synchronized (wVar.f96781d) {
            r rVarC3 = r.c();
            Objects.toString(iVar);
            rVarC3.getClass();
            wVar.a(iVar);
            v vVar = new v(wVar, iVar);
            wVar.f96779b.put(iVar, vVar);
            wVar.f96780c.put(iVar, gVar);
            ((Handler) wVar.f96778a.f92857b).postDelayed(vVar, TTAdConstant.AD_MAX_EVENT_TIME);
        }
    }

    @Override // t7.f
    public final void a(q qVar, t7.d dVar) {
        boolean z11 = dVar instanceof t7.b;
        x xVar = this.f85584h;
        if (z11) {
            xVar.execute(new f(this, 1));
        } else {
            xVar.execute(new f(this, 0));
        }
    }

    public final void d() {
        synchronized (this.f85582f) {
            try {
                if (this.n != null) {
                    this.n.c(null);
                }
                this.f85580d.f85595c.a(this.f85579c);
                PowerManager.WakeLock wakeLock = this.f85586j;
                if (wakeLock != null && wakeLock.isHeld()) {
                    r rVarC = r.c();
                    Objects.toString(this.f85586j);
                    Objects.toString(this.f85579c);
                    rVarC.getClass();
                    this.f85586j.release();
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public final void e() {
        String str = this.f85579c.f95141a;
        Context context = this.f85577a;
        StringBuilder sbK = k2.k(str, " (");
        sbK.append(this.f85578b);
        sbK.append(")");
        this.f85586j = p.a(context, sbK.toString());
        r rVarC = r.c();
        Objects.toString(this.f85586j);
        rVarC.getClass();
        this.f85586j.acquire();
        q qVarL = this.f85580d.f85597e.f82374c.i().l(str);
        if (qVarL == null) {
            this.f85584h.execute(new f(this, 0));
            return;
        }
        boolean zC = qVarL.c();
        this.f85587k = zC;
        if (zC) {
            this.n = t7.h.a(this.f85581e, qVarL, this.f85589m, this);
        } else {
            r.c().getClass();
            this.f85584h.execute(new f(this, 1));
        }
    }

    public final void f(boolean z11) {
        r rVarC = r.c();
        x7.i iVar = this.f85579c;
        Objects.toString(iVar);
        rVarC.getClass();
        d();
        int i5 = this.f85578b;
        i iVar2 = this.f85580d;
        a8.b bVar = this.f85585i;
        Context context = this.f85577a;
        if (z11) {
            Intent intent = new Intent(context, (Class<?>) SystemAlarmService.class);
            intent.setAction("ACTION_SCHEDULE_WORK");
            c.d(intent, iVar);
            bVar.execute(new l0(iVar2, false, intent, i5, 4));
        }
        if (this.f85587k) {
            Intent intent2 = new Intent(context, (Class<?>) SystemAlarmService.class);
            intent2.setAction("ACTION_CONSTRAINTS_CHANGED");
            bVar.execute(new l0(iVar2, false, intent2, i5, 4));
        }
    }
}
