package com.google.firebase.concurrent;

import android.os.Build;
import android.os.StrictMode;
import com.google.firebase.components.ComponentRegistrar;
import defpackage.aq7;
import defpackage.fm3;
import defpackage.hm2;
import defpackage.hy1;
import defpackage.hz1;
import defpackage.i43;
import defpackage.iy1;
import defpackage.om0;
import defpackage.ps0;
import defpackage.rqa;
import defpackage.rzd;
import defpackage.wq6;
import defpackage.yy6;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.concurrent.Executor;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class ExecutorsRegistrar implements ComponentRegistrar {
    public static final wq6 a = new wq6(new hz1(1));
    public static final wq6 b = new wq6(new hz1(2));
    public static final wq6 c = new wq6(new hz1(3));
    public static final wq6 d = new wq6(new hz1(4));

    public static i43 a() {
        StrictMode.ThreadPolicy.Builder builderDetectNetwork = new StrictMode.ThreadPolicy.Builder().detectNetwork();
        builderDetectNetwork.detectResourceMismatches();
        if (Build.VERSION.SDK_INT >= 26) {
            builderDetectNetwork.detectUnbufferedIo();
        }
        return new i43(Executors.newFixedThreadPool(4, new hm2("Firebase Background", 10, builderDetectNetwork.penaltyLog().build())), (ScheduledExecutorService) d.get());
    }

    @Override // com.google.firebase.components.ComponentRegistrar
    public final List getComponents() {
        rqa rqaVar = new rqa(om0.class, ScheduledExecutorService.class);
        rqa[] rqaVarArr = {new rqa(om0.class, ExecutorService.class), new rqa(om0.class, Executor.class)};
        HashSet hashSet = new HashSet();
        HashSet hashSet2 = new HashSet();
        HashSet hashSet3 = new HashSet();
        hashSet.add(rqaVar);
        for (int i = 0; i < 2; i++) {
            aq7.l("Null interface", rqaVarArr[i]);
        }
        Collections.addAll(hashSet, rqaVarArr);
        iy1 iy1Var = new iy1(null, new HashSet(hashSet), new HashSet(hashSet2), 0, 0, new fm3(9), hashSet3);
        rqa rqaVar2 = new rqa(ps0.class, ScheduledExecutorService.class);
        rqa[] rqaVarArr2 = {new rqa(ps0.class, ExecutorService.class), new rqa(ps0.class, Executor.class)};
        HashSet hashSet4 = new HashSet();
        HashSet hashSet5 = new HashSet();
        HashSet hashSet6 = new HashSet();
        hashSet4.add(rqaVar2);
        for (int i2 = 0; i2 < 2; i2++) {
            aq7.l("Null interface", rqaVarArr2[i2]);
        }
        Collections.addAll(hashSet4, rqaVarArr2);
        iy1 iy1Var2 = new iy1(null, new HashSet(hashSet4), new HashSet(hashSet5), 0, 0, new fm3(10), hashSet6);
        rqa rqaVar3 = new rqa(yy6.class, ScheduledExecutorService.class);
        rqa[] rqaVarArr3 = {new rqa(yy6.class, ExecutorService.class), new rqa(yy6.class, Executor.class)};
        HashSet hashSet7 = new HashSet();
        HashSet hashSet8 = new HashSet();
        HashSet hashSet9 = new HashSet();
        hashSet7.add(rqaVar3);
        for (int i3 = 0; i3 < 2; i3++) {
            aq7.l("Null interface", rqaVarArr3[i3]);
        }
        Collections.addAll(hashSet7, rqaVarArr3);
        iy1 iy1Var3 = new iy1(null, new HashSet(hashSet7), new HashSet(hashSet8), 0, 0, new fm3(11), hashSet9);
        hy1 hy1VarA = iy1.a(new rqa(rzd.class, Executor.class));
        hy1VarA.f = new fm3(12);
        return Arrays.asList(iy1Var, iy1Var2, iy1Var3, hy1VarA.b());
    }
}
