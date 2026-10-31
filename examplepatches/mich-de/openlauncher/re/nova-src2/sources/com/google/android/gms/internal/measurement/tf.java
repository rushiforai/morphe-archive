package com.google.android.gms.internal.measurement;

import android.net.Uri;
import com.google.common.util.concurrent.ListenableFuture;
import java.io.IOException;

/* loaded from: classes3.dex */
public final /* synthetic */ class tf implements cl.c0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f33086a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ vf f33087b;

    public /* synthetic */ tf(vf vfVar, int i5) {
        this.f33086a = i5;
        this.f33087b = vfVar;
    }

    @Override // cl.c0
    public final ListenableFuture call() {
        ListenableFuture listenableFutureS;
        int i5 = this.f33086a;
        vf vfVar = this.f33087b;
        int i11 = 4;
        switch (i5) {
            case 0:
                cl.l1 l1Var = (cl.l1) vfVar.f33152e;
                try {
                    return cl.w0.b(vfVar.e((Uri) cl.w0.a((ListenableFuture) vfVar.f33149b)));
                } catch (IOException e3) {
                    vk.o oVar = (vk.o) vfVar.f33154g;
                    oVar.getClass();
                    if ((e3 instanceof zzsg) || (e3.getCause() instanceof zzsg)) {
                        return new cl.y0(e3);
                    }
                    xf xfVar = (xf) oVar.f92822a;
                    xfVar.getClass();
                    if (e3.getCause() instanceof zzaeh) {
                        cl.z0 z0VarB = cl.w0.b(xfVar.f33225a);
                        sf sfVar = new sf(vfVar, 2);
                        int i12 = bh.f32414a;
                        listenableFutureS = cl.c.s(cl.w0.f(z0VarB, new be(i11, jg.a(), sfVar), l1Var), IOException.class, new nd(e3, 5), cl.m0.f20038a);
                    } else {
                        listenableFutureS = new cl.y0(e3);
                    }
                    sf sfVar2 = new sf(vfVar, 1);
                    int i13 = bh.f32414a;
                    return cl.w0.f(listenableFutureS, new be(i11, jg.a(), sfVar2), l1Var);
                }
            default:
                sf sfVar3 = new sf(vfVar, 3);
                int i14 = bh.f32414a;
                return cl.w0.c(cl.w0.f((ListenableFuture) vfVar.f33149b, new be(i11, jg.a(), sfVar3), (cl.l1) vfVar.f33152e));
        }
    }
}
