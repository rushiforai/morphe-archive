package com.google.android.gms.internal.measurement;

import android.os.Process;
import android.util.Log;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.concurrent.ExecutionException;

/* loaded from: classes3.dex */
public final /* synthetic */ class zd implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f33295a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f33296b;

    public /* synthetic */ zd(Object obj, int i5) {
        this.f33295a = i5;
        this.f33296b = obj;
    }

    @Override // java.lang.Runnable
    public final /* synthetic */ void run() {
        switch (this.f33295a) {
            case 0:
                throw new RuntimeException(((ExecutionException) this.f33296b).getCause());
            case 1:
                try {
                    cl.w0.a((ListenableFuture) this.f33296b);
                    return;
                } catch (ExecutionException e3) {
                    lb.g().post(new zd(e3, 0));
                    return;
                }
            case 2:
                try {
                    cl.w0.a((cl.q0) this.f33296b);
                    return;
                } catch (Exception e11) {
                    Log.w("PhFlagUpdateRegistry", "Failed to register flag update listener which may lead to stale flags.", e11);
                    return;
                }
            case 3:
                if (((Boolean) ((fe) this.f33296b).f32540c.get()).booleanValue()) {
                    Log.i("PhenotypeProcessReaper", "Killing process to refresh experiment configuration");
                    Process.killProcess(Process.myPid());
                    System.exit(0);
                    return;
                }
                return;
            default:
                try {
                    cl.w0.a((cl.r0) this.f33296b);
                    return;
                } catch (Exception unused) {
                    return;
                }
        }
    }
}
