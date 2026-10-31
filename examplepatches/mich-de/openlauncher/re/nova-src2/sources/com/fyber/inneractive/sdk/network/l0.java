package com.fyber.inneractive.sdk.network;

import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Handler;
import android.os.Looper;
import com.fyber.inneractive.sdk.config.IAConfigManager;
import com.fyber.inneractive.sdk.util.IAlog;
import java.net.SocketTimeoutException;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.PriorityBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/* loaded from: classes.dex */
public final class l0 {

    /* renamed from: g, reason: collision with root package name */
    public static final h0 f28739g = new h0();

    /* renamed from: a, reason: collision with root package name */
    public final PriorityBlockingQueue f28740a = new PriorityBlockingQueue(100, new k0());

    /* renamed from: b, reason: collision with root package name */
    public volatile boolean f28741b = false;

    /* renamed from: c, reason: collision with root package name */
    public final Handler f28742c = new Handler(Looper.getMainLooper());

    /* renamed from: d, reason: collision with root package name */
    public final ThreadPoolExecutor f28743d = new ThreadPoolExecutor(6, 6, 1000, TimeUnit.SECONDS, new LinkedBlockingQueue(100), f28739g);

    /* renamed from: e, reason: collision with root package name */
    public final i0 f28744e = new i0(this);

    /* renamed from: f, reason: collision with root package name */
    public final j1 f28745f = new j1();

    public static HashMap a(l lVar) {
        if (lVar != null) {
            return com.fyber.inneractive.sdk.util.s.a(lVar.f28736d);
        }
        return null;
    }

    public static void b(l lVar, o0 o0Var, t0 t0Var) {
        try {
            if (t0Var.f28777a || o0Var == null) {
                return;
            }
            t0Var.a(o0Var.f28757a, null, false, a(lVar));
        } catch (Exception e3) {
            IAlog.a("failed notifying the listener request complete for url: %s msg: %s", t0Var.r(), e3.getMessage());
            if (t0Var.f28777a) {
                return;
            }
            t0Var.a(null, e3, false, a(lVar));
        }
    }

    public final boolean c(t0 t0Var) {
        if (!t0Var.u()) {
            return false;
        }
        t0Var.f28782f = i1.QUEUED_FOR_RETRY;
        p0 p0Var = t0Var.f28780d;
        if (p0Var != null) {
            p0Var.a("sdkRequestEndedButWillBeRetried");
        }
        long jG = t0Var.g();
        IAlog.e("retryNetworkRequest queue up in main thread - %s with delay of %d", t0Var.getClass().getName(), Long.valueOf(jG));
        this.f28742c.postDelayed(new j0(this, t0Var), jG);
        return true;
    }

    public final void a(t0 t0Var) {
        p0 p0Var;
        if (this.f28740a.offer(t0Var)) {
            i1 i1Var = i1.QUEUED;
            t0Var.f28782f = i1Var;
            if (i1Var != i1.QUEUED_FOR_RETRY || (p0Var = t0Var.f28780d) == null) {
                return;
            }
            p0Var.a("sdkRequestEndedButWillBeRetried");
            return;
        }
        IAlog.a("Request queue is full! current request is dropped! %s", t0Var.r());
    }

    public static void a(l lVar, o0 o0Var, t0 t0Var) {
        try {
            if (t0Var.f28777a || t0Var.h() == null || o0Var == null || lVar == null || lVar.f28733a != 200) {
                return;
            }
            t0Var.a(o0Var, t0Var.h(), lVar.f28737e);
        } catch (Exception e3) {
            IAlog.a("Failed cache network response data for url: %s msg: %s", t0Var.r(), e3.getMessage());
        }
    }

    public final void b(t0 t0Var) {
        j1 j1Var = this.f28745f;
        j1Var.getClass();
        String str = t0Var.f28783g;
        IAlog.a("%s : NetworkRequestWatchdog : finalize request: %s", IAlog.a(j1Var), str);
        n1 n1Var = (n1) j1Var.f28731a.get(str);
        if (n1Var != null) {
            com.fyber.inneractive.sdk.util.r.f31216b.removeCallbacks(n1Var.f28756d);
        }
        j1Var.f28731a.remove(str);
    }

    public final o0 a(t0 t0Var, l lVar) throws Exception {
        if (lVar != null) {
            try {
                if (!t0Var.f28777a) {
                    int i5 = lVar.f28733a;
                    if (i5 != 200 && (i5 < 300 || i5 >= 304)) {
                        if (i5 == 304) {
                            t0Var.a(null, new g(), false, a(lVar));
                            return null;
                        }
                        t0Var.a(null, new k1(lVar.f28734b, lVar.f28733a), false, a(lVar));
                        return null;
                    }
                    return t0Var.a(lVar, lVar.f28736d, i5);
                }
            } catch (t1 e3) {
                IAlog.a("failed parsing network request but will retry url: %s msg: %s", t0Var.r(), e3.getMessage());
                if (c(t0Var)) {
                    throw e3;
                }
                throw new s1(e3);
            } catch (Exception e11) {
                IAlog.a("failed parsing network request url: %s msg: %s", t0Var.r(), e11.getMessage());
                throw e11;
            }
        }
        return null;
    }

    /* JADX WARN: Removed duplicated region for block: B:26:0x0046  */
    /* JADX WARN: Removed duplicated region for block: B:28:0x004c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final l a(t0 t0Var, a aVar) throws Exception {
        String str;
        try {
            if (t0Var.f28777a) {
                return null;
            }
            if (aVar != null) {
                str = aVar.f28686a;
            } else {
                str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            }
            a();
            return t0Var.a(str);
        } catch (b e3) {
            e = e3;
            IAlog.a("failed sending network request for url: %s msg: %s", t0Var.r(), e.getMessage());
            if (c(t0Var)) {
                throw new t1(e);
            }
            throw new s1(e);
        } catch (t1 e11) {
            IAlog.a("failed sending network request but will retry url: %s msg: %s", t0Var.r(), e11.getMessage());
            if (c(t0Var)) {
                throw e11;
            }
            throw new s1(e11);
        } catch (SocketTimeoutException e12) {
            e = e12;
            IAlog.a("failed sending network request for url: %s msg: %s", t0Var.r(), e.getMessage());
            if (c(t0Var)) {
            }
        } catch (UnknownHostException e13) {
            e = e13;
            IAlog.a("failed sending network request for url: %s msg: %s", t0Var.r(), e.getMessage());
            if (c(t0Var)) {
            }
        } catch (Exception e14) {
            IAlog.a("failed sending network request for url: %s msg: %s", t0Var.r(), e14.getMessage());
            throw e14;
        }
    }

    public static void a() throws b {
        NetworkInfo activeNetworkInfo;
        Boolean boolC = ((com.fyber.inneractive.sdk.config.global.features.l) IAConfigManager.Q.N.a(com.fyber.inneractive.sdk.config.global.features.l.class)).c("should_use_is_network_connected");
        boolean z11 = false;
        if (boolC != null ? boolC.booleanValue() : false) {
            try {
                ConnectivityManager connectivityManager = (ConnectivityManager) com.fyber.inneractive.sdk.util.o.f31210a.getSystemService("connectivity");
                activeNetworkInfo = connectivityManager != null ? connectivityManager.getActiveNetworkInfo() : null;
            } catch (Throwable unused) {
                IAlog.b("Error retrieved when trying to get the network state - Perhaps you forgot to declare android.permission.ACCESS_NETWORK_STATE in your Android manifest file.", new Object[0]);
            }
            if (com.fyber.inneractive.sdk.util.o.a("android.permission.ACCESS_NETWORK_STATE") && activeNetworkInfo != null) {
                if (activeNetworkInfo.isConnectedOrConnecting()) {
                    z11 = true;
                }
            }
            if (!z11) {
                throw new b("No network connection");
            }
        }
    }
}
