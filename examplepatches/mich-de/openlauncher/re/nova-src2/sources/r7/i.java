package r7;

import android.content.Context;
import android.content.Intent;
import android.os.Looper;
import android.os.PowerManager;
import android.text.TextUtils;
import androidx.recyclerview.widget.l0;
import androidx.work.impl.background.systemalarm.SystemAlarmService;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Objects;
import nx.l;
import o7.r;
import p7.s;
import y7.p;
import y7.w;

/* loaded from: classes2.dex */
public final class i implements p7.c {

    /* renamed from: k, reason: collision with root package name */
    public static final String f85592k = r.e("SystemAlarmDispatcher");

    /* renamed from: a, reason: collision with root package name */
    public final Context f85593a;

    /* renamed from: b, reason: collision with root package name */
    public final a8.a f85594b;

    /* renamed from: c, reason: collision with root package name */
    public final w f85595c;

    /* renamed from: d, reason: collision with root package name */
    public final p7.h f85596d;

    /* renamed from: e, reason: collision with root package name */
    public final s f85597e;

    /* renamed from: f, reason: collision with root package name */
    public final c f85598f;

    /* renamed from: g, reason: collision with root package name */
    public final ArrayList f85599g;

    /* renamed from: h, reason: collision with root package name */
    public Intent f85600h;

    /* renamed from: i, reason: collision with root package name */
    public SystemAlarmService f85601i;

    /* renamed from: j, reason: collision with root package name */
    public final l f85602j;

    public i(SystemAlarmService systemAlarmService) {
        Context applicationContext = systemAlarmService.getApplicationContext();
        this.f85593a = applicationContext;
        x7.c cVar = new x7.c(6);
        s sVarC = s.c(systemAlarmService);
        this.f85597e = sVarC;
        this.f85598f = new c(applicationContext, sVarC.f82373b.f79624c, cVar);
        this.f85595c = new w(sVarC.f82373b.f79627f);
        p7.h hVar = sVarC.f82377f;
        this.f85596d = hVar;
        a8.a aVar = sVarC.f82375d;
        this.f85594b = aVar;
        this.f85602j = new l(hVar, aVar);
        hVar.a(this);
        this.f85599g = new ArrayList();
        this.f85600h = null;
    }

    public static void b() {
        if (Looper.getMainLooper().getThread() != Thread.currentThread()) {
            throw new IllegalStateException("Needs to be invoked on the main thread.");
        }
    }

    public final void a(int i5, Intent intent) {
        r rVarC = r.c();
        String str = f85592k;
        Objects.toString(intent);
        rVarC.getClass();
        b();
        String action = intent.getAction();
        if (TextUtils.isEmpty(action)) {
            r.c().f(str, "Unknown command. Ignoring");
            return;
        }
        if ("ACTION_CONSTRAINTS_CHANGED".equals(action)) {
            b();
            synchronized (this.f85599g) {
                try {
                    Iterator it = this.f85599g.iterator();
                    while (it.hasNext()) {
                        if ("ACTION_CONSTRAINTS_CHANGED".equals(((Intent) it.next()).getAction())) {
                            return;
                        }
                    }
                } finally {
                }
            }
        }
        intent.putExtra("KEY_START_ID", i5);
        synchronized (this.f85599g) {
            try {
                boolean zIsEmpty = this.f85599g.isEmpty();
                this.f85599g.add(intent);
                if (zIsEmpty) {
                    d();
                }
            } finally {
            }
        }
    }

    @Override // p7.c
    public final void c(x7.i iVar, boolean z11) {
        a8.b bVar = ((a8.c) this.f85594b).f461d;
        String str = c.f85564f;
        Intent intent = new Intent(this.f85593a, (Class<?>) SystemAlarmService.class);
        intent.setAction("ACTION_EXECUTION_COMPLETED");
        intent.putExtra("KEY_NEEDS_RESCHEDULE", z11);
        c.d(intent, iVar);
        bVar.execute(new l0(this, false, intent, 0, 4));
    }

    public final void d() {
        b();
        PowerManager.WakeLock wakeLockA = p.a(this.f85593a, "ProcessCommand");
        try {
            wakeLockA.acquire();
            this.f85597e.f82375d.a(new h(this, 0));
        } finally {
            wakeLockA.release();
        }
    }
}
