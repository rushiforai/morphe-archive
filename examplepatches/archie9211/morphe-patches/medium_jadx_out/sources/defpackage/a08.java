package defpackage;

import android.app.Activity;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.view.ViewTreeObserver;
import java.lang.ref.WeakReference;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.Set;
import java.util.concurrent.atomic.AtomicBoolean;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class a08 implements ViewTreeObserver.OnGlobalFocusChangeListener {
    public static final HashMap e = new HashMap();
    public final WeakReference c;
    public final LinkedHashSet a = new LinkedHashSet();
    public final Handler b = new Handler(Looper.getMainLooper());
    public final AtomicBoolean d = new AtomicBoolean(false);

    public a08(Activity activity) {
        this.c = new WeakReference(activity);
    }

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:15:0x0031 -> B:20:0x0034). Please report as a decompilation issue!!! */
    public final void a(View view) {
        Set set = ec2.a;
        if (set.contains(this)) {
            return;
        }
        try {
            fi2 fi2Var = new fi2(view, 18, this);
            if (!set.contains(this)) {
                try {
                    if (Thread.currentThread() == Looper.getMainLooper().getThread()) {
                        fi2Var.run();
                    } else {
                        this.b.post(fi2Var);
                    }
                } catch (Throwable th) {
                    ec2.a(this, th);
                }
            }
        } catch (Throwable th2) {
            ec2.a(this, th2);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:78:0x00c1 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:88:0x00db A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:89:0x00da A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:90:0x0103 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:91:0x00f8 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:92:0x0126 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:94:0x005b A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void b(android.view.View r13) {
        /*
            Method dump skipped, instruction units count: 311
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.a08.b(android.view.View):void");
    }

    @Override // android.view.ViewTreeObserver.OnGlobalFocusChangeListener
    public final void onGlobalFocusChanged(View view, View view2) {
        if (ec2.a.contains(this)) {
            return;
        }
        if (view != null) {
            try {
                a(view);
            } catch (Throwable th) {
                ec2.a(this, th);
                return;
            }
        }
        if (view2 != null) {
            a(view2);
        }
    }
}
