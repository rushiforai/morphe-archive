package com.google.firebase.crashlytics;

import android.util.Log;
import com.google.firebase.components.ComponentRegistrar;
import defpackage.ak4;
import defpackage.f70;
import defpackage.hk4;
import defpackage.hy1;
import defpackage.iy1;
import defpackage.k1c;
import defpackage.ok4;
import defpackage.om0;
import defpackage.pc2;
import defpackage.ps0;
import defpackage.pwd;
import defpackage.rqa;
import defpackage.s73;
import defpackage.uj;
import defpackage.uk4;
import defpackage.wk4;
import defpackage.xj4;
import defpackage.yy6;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class CrashlyticsRegistrar implements ComponentRegistrar {
    public static final /* synthetic */ int d = 0;
    public final rqa a = new rqa(om0.class, ExecutorService.class);
    public final rqa b = new rqa(ps0.class, ExecutorService.class);
    public final rqa c = new rqa(yy6.class, ExecutorService.class);

    static {
        k1c k1cVar = k1c.CRASHLYTICS;
        wk4 wk4Var = wk4.a;
        k1cVar.getClass();
        Map map = wk4.b;
        if (map.containsKey(k1cVar)) {
            Log.d("FirebaseSessions", "Dependency " + k1cVar + " already added.");
            return;
        }
        map.put(k1cVar, new uk4(new CountDownLatch(1)));
        Log.d("FirebaseSessions", "Dependency to " + k1cVar + " added.");
    }

    @Override // com.google.firebase.components.ComponentRegistrar
    public final List getComponents() {
        hy1 hy1VarB = iy1.b(ak4.class);
        hy1VarB.a = "fire-cls";
        hy1VarB.a(s73.b(xj4.class));
        hy1VarB.a(s73.b(hk4.class));
        hy1VarB.a(new s73(this.a, 1, 0));
        hy1VarB.a(new s73(this.b, 1, 0));
        hy1VarB.a(new s73(this.c, 1, 0));
        hy1VarB.a(new s73(0, 2, pc2.class));
        hy1VarB.a(new s73(0, 2, uj.class));
        hy1VarB.a(new s73(0, 2, ok4.class));
        hy1VarB.f = new f70(7, this);
        hy1VarB.c(2);
        return Arrays.asList(hy1VarB.b(), pwd.E("fire-cls", "20.0.6"));
    }
}
