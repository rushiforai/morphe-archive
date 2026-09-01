package com.google.firebase.messaging;

import android.app.Service;
import android.content.Intent;
import android.os.IBinder;
import android.util.Log;
import defpackage.b70;
import defpackage.g76;
import defpackage.jrg;
import defpackage.lt;
import defpackage.lv2;
import defpackage.n0c;
import defpackage.rmb;
import defpackage.rz2;
import defpackage.ss;
import defpackage.t3b;
import defpackage.wfd;
import defpackage.x6f;
import java.util.ArrayDeque;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class FirebaseMessagingService extends Service {
    public static final ArrayDeque g = new ArrayDeque(10);
    public final ExecutorService a;
    public x6f b;
    public final Object c;
    public int d;
    public int e;
    public rmb f;

    public FirebaseMessagingService() {
        lv2 lv2Var = new lv2("Firebase-Messaging-Intent-Handle", 1);
        ThreadPoolExecutor threadPoolExecutor = new ThreadPoolExecutor(1, 1, 60L, TimeUnit.SECONDS, new LinkedBlockingQueue(), lv2Var);
        threadPoolExecutor.allowCoreThreadTimeOut(true);
        this.a = Executors.unconfigurableExecutorService(threadPoolExecutor);
        this.c = new Object();
        this.e = 0;
    }

    public final void a(Intent intent) {
        if (intent != null) {
            g76.S(intent);
        }
        synchronized (this.c) {
            try {
                int i = this.e - 1;
                this.e = i;
                if (i == 0) {
                    stopSelfResult(this.d);
                }
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:27:0x0089  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x0095  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x00a0  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x00ab  */
    /* JADX WARN: Removed duplicated region for block: B:43:0x00b6  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x00c3  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x00ce  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x00d3  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x00f4  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void b(android.content.Intent r11) {
        /*
            Method dump skipped, instruction units count: 476
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.firebase.messaging.FirebaseMessagingService.b(android.content.Intent):void");
    }

    @Override // android.app.Service
    public final synchronized IBinder onBind(Intent intent) {
        x6f x6fVar;
        try {
            if (Log.isLoggable("EnhancedIntentService", 3)) {
                Log.d("EnhancedIntentService", "Service received bind request");
            }
            x6fVar = this.b;
            if (x6fVar == null) {
                x6fVar = new x6f(new rz2(8, this));
                this.b = x6fVar;
            }
        } catch (Throwable th) {
            throw th;
        }
        return x6fVar;
    }

    @Override // android.app.Service
    public final void onDestroy() {
        this.a.shutdown();
        super.onDestroy();
    }

    @Override // android.app.Service
    public final int onStartCommand(Intent intent, int i, int i2) {
        synchronized (this.c) {
            this.d = i2;
            this.e++;
        }
        Intent intent2 = (Intent) ((ArrayDeque) n0c.N().e).poll();
        if (intent2 == null) {
            a(intent);
            return 2;
        }
        wfd wfdVar = new wfd();
        this.a.execute(new ss(this, intent2, wfdVar, 8));
        jrg jrgVar = wfdVar.a;
        if (jrgVar.j()) {
            a(intent);
            return 2;
        }
        jrgVar.b(new b70(1), new lt(this, 7, intent));
        return 3;
    }

    public void d(t3b t3bVar) {
    }

    public void e(String str) {
    }
}
