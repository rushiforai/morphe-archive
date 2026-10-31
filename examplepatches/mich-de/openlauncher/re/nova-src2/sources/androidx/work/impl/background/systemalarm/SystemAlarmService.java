package androidx.work.impl.background.systemalarm;

import android.content.Intent;
import android.os.PowerManager;
import h6.d0;
import java.util.LinkedHashMap;
import java.util.Map;
import kotlin.Unit;
import o7.r;
import r7.i;
import y7.p;
import y7.q;

/* loaded from: classes2.dex */
public class SystemAlarmService extends d0 {

    /* renamed from: d, reason: collision with root package name */
    public static final String f15338d = r.e("SystemAlarmService");

    /* renamed from: b, reason: collision with root package name */
    public i f15339b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f15340c;

    public final void a() {
        this.f15340c = true;
        r.c().getClass();
        String str = p.f96760a;
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        synchronized (q.f96761a) {
            linkedHashMap.putAll(q.f96762b);
            Unit unit = Unit.f71706a;
        }
        for (Map.Entry entry : linkedHashMap.entrySet()) {
            PowerManager.WakeLock wakeLock = (PowerManager.WakeLock) entry.getKey();
            String str2 = (String) entry.getValue();
            if (wakeLock != null && wakeLock.isHeld()) {
                r.c().f(p.f96760a, "WakeLock held for " + str2);
            }
        }
        stopSelf();
    }

    @Override // h6.d0, android.app.Service
    public final void onCreate() {
        super.onCreate();
        i iVar = new i(this);
        this.f15339b = iVar;
        if (iVar.f85601i != null) {
            r.c().a(i.f85592k, "A completion listener for SystemAlarmDispatcher already exists.");
        } else {
            iVar.f85601i = this;
        }
        this.f15340c = false;
    }

    @Override // h6.d0, android.app.Service
    public final void onDestroy() {
        super.onDestroy();
        this.f15340c = true;
        i iVar = this.f15339b;
        iVar.getClass();
        r.c().getClass();
        iVar.f85596d.f(iVar);
        iVar.f85601i = null;
    }

    @Override // android.app.Service
    public final int onStartCommand(Intent intent, int i5, int i11) {
        super.onStartCommand(intent, i5, i11);
        if (this.f15340c) {
            r.c().d(f15338d, "Re-initializing SystemAlarmDispatcher after a request to shut-down.");
            i iVar = this.f15339b;
            iVar.getClass();
            r.c().getClass();
            iVar.f85596d.f(iVar);
            iVar.f85601i = null;
            i iVar2 = new i(this);
            this.f15339b = iVar2;
            if (iVar2.f85601i != null) {
                r.c().a(i.f85592k, "A completion listener for SystemAlarmDispatcher already exists.");
            } else {
                iVar2.f85601i = this;
            }
            this.f15340c = false;
        }
        if (intent == null) {
            return 3;
        }
        this.f15339b.a(i11, intent);
        return 3;
    }
}
