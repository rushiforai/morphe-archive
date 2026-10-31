package s90;

import ai.h2;
import android.os.Process;
import android.os.Trace;
import java.time.Duration;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import java.util.concurrent.Executor;
import java.util.concurrent.RejectedExecutionException;
import org.chromium.net.UrlRequest;
import org.chromium.net.impl.CronetExceptionImpl;
import org.chromium.net.impl.ImplVersion;

/* loaded from: classes5.dex */
public final class x0 {

    /* renamed from: a, reason: collision with root package name */
    public final i1 f87055a;

    /* renamed from: b, reason: collision with root package name */
    public final Executor f87056b;

    /* renamed from: c, reason: collision with root package name */
    public final Executor f87057c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ a1 f87058d;

    public x0(a1 a1Var, UrlRequest.Callback callback, Executor executor) {
        this.f87058d = a1Var;
        this.f87055a = new i1(callback);
        if (a1Var.f86860h) {
            this.f87056b = executor;
            this.f87057c = null;
        } else {
            this.f87056b = new h2(executor, 1);
            this.f87057c = executor;
        }
    }

    public final b0 a() throws NumberFormatException {
        Map asMap;
        String str;
        int i5;
        long length;
        long length2;
        long j11;
        int i11;
        a1 a1Var = this.f87058d;
        g1 g1Var = a1Var.o;
        if (g1Var != null) {
            asMap = g1Var.f86954g.getAsMap();
            g1 g1Var2 = a1Var.o;
            str = g1Var2.f86951d;
            i5 = g1Var2.f86949b;
        } else {
            asMap = Collections.EMPTY_MAP;
            str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            i5 = 0;
        }
        String str2 = str;
        TreeMap treeMap = a1Var.f86856d;
        if (treeMap == null) {
            length = 0;
        } else {
            length = 0;
            for (Map.Entry entry : treeMap.entrySet()) {
                if (((String) entry.getKey()) != null) {
                    length += r10.length();
                }
                if (((String) entry.getValue()) != null) {
                    length += r9.length();
                }
            }
        }
        if (asMap == null) {
            length2 = 0;
        } else {
            length2 = 0;
            for (Map.Entry entry2 : asMap.entrySet()) {
                if (((String) entry2.getKey()) != null) {
                    length2 += r12.length();
                }
                if (entry2.getValue() != null) {
                    Iterator it = ((List) entry2.getValue()).iterator();
                    while (it.hasNext()) {
                        if (((String) it.next()) != null) {
                            length2 += r12.length();
                        }
                    }
                }
            }
        }
        if (asMap.containsKey("Content-Length")) {
            try {
                j11 = Long.parseLong((String) ((List) asMap.get("Content-Length")).get(0));
            } catch (NumberFormatException unused) {
                j11 = 0;
            }
        } else {
            j11 = -1;
        }
        Duration durationOfSeconds = Duration.ofSeconds(0L);
        Duration durationOfSeconds2 = Duration.ofSeconds(0L);
        int i12 = a1Var.f86858f.get();
        if (i12 == 6) {
            i11 = 2;
        } else if (i12 == 7) {
            i11 = 1;
        } else {
            if (i12 != 8) {
                throw new IllegalStateException(b.c0.i(i12, "Internal Cronet error: attempted to report metrics but current state (", ") is not a done state!"));
            }
            i11 = 3;
        }
        int i13 = i11;
        int i14 = a1Var.f86874x;
        int i15 = a1Var.f86873w;
        y0 y0Var = a1Var.f86868r;
        return new b0(length, -1L, length2, j11, i5, durationOfSeconds, durationOfSeconds2, str2, i13, i14, i15, y0Var != null ? y0Var.f86989h : 0, a1Var.f86875y, Process.myUid(), ImplVersion.getCronetVersion());
    }

    public final void b(b1 b1Var, String str) {
        a1 a1Var = this.f87058d;
        try {
            c(str, new o0(a1Var, b1Var, 1));
        } catch (RejectedExecutionException e3) {
            a1Var.c(new CronetExceptionImpl("Exception posting task to executor", e3));
        }
    }

    public final void c(String str, Runnable runnable) {
        p90.a.a("Cronet JavaUrlRequest.AsyncUrlRequestCallback#executeOnUserExecutor ".concat(str));
        try {
            this.f87056b.execute(new u0(1, str, runnable));
            Trace.endSection();
        } catch (Throwable th2) {
            try {
                Trace.endSection();
            } catch (Throwable th3) {
                th2.addSuppressed(th3);
            }
            throw th2;
        }
    }
}
