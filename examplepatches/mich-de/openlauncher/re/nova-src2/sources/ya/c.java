package ya;

import android.content.Context;
import android.os.Handler;
import b00.z0;
import com.google.android.gms.tasks.Task;
import java.util.HashMap;
import w70.i2;

/* loaded from: classes.dex */
public final /* synthetic */ class c implements z, k, fi.e {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f97112a;

    public /* synthetic */ c(int i5) {
        this.f97112a = i5;
    }

    @Override // ya.k
    public int apply(int i5) {
        return i5;
    }

    @Override // ya.z
    public Object g(Context context) {
        switch (this.f97112a) {
            case 0:
                return new g(context);
            case 1:
                return new h(context);
            default:
                return new Handler(j.f97148c.f97215a.getLooper(), new v30.f(context));
        }
    }

    @Override // fi.e
    public void onComplete(Task task) {
        Task taskS;
        if (task.q()) {
            mc0.d.f76206a.b("RC defaults loaded", new Object[0]);
        } else {
            mc0.d.f76206a.p(task.l(), "RC defaults failed", new Object[0]);
        }
        wm.c cVar = zy.c.f98825c;
        if (cVar != null) {
            final xm.i iVar = cVar.f94604g;
            final long jG = iVar.f96135g.g();
            final HashMap map = new HashMap(iVar.f96136h);
            map.put("X-Firebase-RC-Fetch-Type", "BASE/1");
            taskS = iVar.f96133e.b().k(iVar.f96131c, new fi.c() { // from class: xm.f
                @Override // fi.c
                public final Object then(Task task2) {
                    return iVar.b(task2, jG, map);
                }
            }).s(cm.i.f20118a, new ll.i(28)).s(cVar.f94600c, new z0(cVar, 21));
        } else {
            taskS = null;
        }
        if (taskS != null) {
            taskS.b(new rl.g(19));
            return;
        }
        i2 i2Var = zy.c.f98830h;
        Boolean bool = Boolean.TRUE;
        i2Var.getClass();
        i2Var.k(null, bool);
    }
}
