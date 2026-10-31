package r7;

import android.content.Intent;
import android.os.PowerManager;
import androidx.room.x;
import androidx.work.impl.background.systemalarm.SystemAlarmService;
import java.util.Objects;
import o7.r;
import y7.p;

/* loaded from: classes2.dex */
public final class h implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f85590a;

    /* renamed from: b, reason: collision with root package name */
    public final i f85591b;

    public /* synthetic */ h(i iVar, int i5) {
        this.f85590a = i5;
        this.f85591b = iVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:34:0x007d A[Catch: all -> 0x0039, TryCatch #2 {all -> 0x0039, blocks: (B:6:0x0015, B:8:0x0019, B:10:0x0035, B:13:0x003b, B:14:0x0042, B:15:0x0043, B:16:0x004d, B:20:0x0057, B:22:0x005f, B:23:0x0061, B:27:0x006b, B:29:0x0076, B:37:0x0088, B:33:0x007c, B:34:0x007d, B:36:0x0085, B:41:0x008c, B:24:0x0062, B:25:0x0068, B:17:0x004e, B:18:0x0054), top: B:68:0x0015, inners: #3, #4 }] */
    @Override // java.lang.Runnable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void run() {
        a8.b bVar;
        h hVar;
        boolean zIsEmpty;
        boolean zIsEmpty2;
        switch (this.f85590a) {
            case 0:
                synchronized (this.f85591b.f85599g) {
                    i iVar = this.f85591b;
                    iVar.f85600h = (Intent) iVar.f85599g.get(0);
                }
                Intent intent = this.f85591b.f85600h;
                if (intent != null) {
                    String action = intent.getAction();
                    int intExtra = this.f85591b.f85600h.getIntExtra("KEY_START_ID", 0);
                    r rVarC = r.c();
                    String str = i.f85592k;
                    Objects.toString(this.f85591b.f85600h);
                    rVarC.getClass();
                    PowerManager.WakeLock wakeLockA = p.a(this.f85591b.f85593a, action + " (" + intExtra + ")");
                    int i5 = 1;
                    try {
                        r rVarC2 = r.c();
                        wakeLockA.toString();
                        rVarC2.getClass();
                        wakeLockA.acquire();
                        i iVar2 = this.f85591b;
                        iVar2.f85598f.a(iVar2.f85600h, intExtra, iVar2);
                        r rVarC3 = r.c();
                        wakeLockA.toString();
                        rVarC3.getClass();
                        wakeLockA.release();
                        i iVar3 = this.f85591b;
                        bVar = ((a8.c) iVar3.f85594b).f461d;
                        hVar = new h(iVar3, i5);
                    } catch (Throwable th2) {
                        try {
                            r.c().b(i.f85592k, "Unexpected error in onHandleIntent", th2);
                            r rVarC4 = r.c();
                            wakeLockA.toString();
                            rVarC4.getClass();
                            wakeLockA.release();
                            i iVar4 = this.f85591b;
                            bVar = ((a8.c) iVar4.f85594b).f461d;
                            hVar = new h(iVar4, i5);
                        } catch (Throwable th3) {
                            r rVarC5 = r.c();
                            String str2 = i.f85592k;
                            wakeLockA.toString();
                            rVarC5.getClass();
                            wakeLockA.release();
                            i iVar5 = this.f85591b;
                            ((a8.c) iVar5.f85594b).f461d.execute(new h(iVar5, i5));
                            throw th3;
                        }
                    }
                    bVar.execute(hVar);
                    return;
                }
                return;
            default:
                i iVar6 = this.f85591b;
                r.c().getClass();
                i.b();
                synchronized (iVar6.f85599g) {
                    try {
                        if (iVar6.f85600h != null) {
                            r rVarC6 = r.c();
                            Objects.toString(iVar6.f85600h);
                            rVarC6.getClass();
                            if (!((Intent) iVar6.f85599g.remove(0)).equals(iVar6.f85600h)) {
                                throw new IllegalStateException("Dequeue-d command is not the first.");
                            }
                            iVar6.f85600h = null;
                        }
                        x xVar = ((a8.c) iVar6.f85594b).f458a;
                        c cVar = iVar6.f85598f;
                        synchronized (cVar.f85567c) {
                            zIsEmpty = cVar.f85566b.isEmpty();
                        }
                        if (zIsEmpty && iVar6.f85599g.isEmpty()) {
                            synchronized (xVar.f15282e) {
                                zIsEmpty2 = xVar.f15279b.isEmpty();
                            }
                            if (zIsEmpty2) {
                                r.c().getClass();
                                SystemAlarmService systemAlarmService = iVar6.f85601i;
                                if (systemAlarmService != null) {
                                    systemAlarmService.a();
                                }
                            }
                        } else if (!iVar6.f85599g.isEmpty()) {
                            iVar6.d();
                        }
                    } catch (Throwable th4) {
                        throw th4;
                    }
                }
                return;
        }
    }
}
