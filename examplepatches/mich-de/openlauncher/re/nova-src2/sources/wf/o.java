package wf;

import ai.r4;
import android.content.Context;
import android.content.IntentFilter;
import android.os.Handler;
import android.os.Looper;
import cl.c0;
import cl.m0;
import cl.w0;
import com.android.launcher3.CellLayout;
import com.android.launcher3.Workspace;
import com.google.android.gms.internal.measurement.be;
import com.google.android.gms.internal.measurement.bh;
import com.google.android.gms.internal.measurement.gc;
import com.google.android.gms.internal.measurement.jg;
import com.google.android.gms.internal.measurement.n0;
import com.google.common.util.concurrent.ListenableFuture;
import com.teslacoilsw.launcher.popup.SimplePopupView;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.Future;
import o9.e4;
import o9.l0;

/* loaded from: classes3.dex */
public final class o implements c0, x9.h {

    /* renamed from: e, reason: collision with root package name */
    public static o f94359e;

    /* renamed from: a, reason: collision with root package name */
    public int f94360a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f94361b;

    /* renamed from: c, reason: collision with root package name */
    public final Object f94362c;

    /* renamed from: d, reason: collision with root package name */
    public final Object f94363d;

    public /* synthetic */ o(be beVar, n0 n0Var, int i5, ArrayList arrayList) {
        this.f94361b = beVar;
        this.f94362c = n0Var;
        this.f94360a = i5;
        this.f94363d = arrayList;
    }

    public static void a(o oVar, int i5) {
        synchronized (oVar.f94363d) {
            try {
                if (oVar.f94360a == i5) {
                    return;
                }
                oVar.f94360a = i5;
                Iterator it = ((CopyOnWriteArrayList) oVar.f94362c).iterator();
                while (it.hasNext()) {
                    WeakReference weakReference = (WeakReference) it.next();
                    vf.n nVar = (vf.n) weakReference.get();
                    if (nVar != null) {
                        nVar.a(i5);
                    } else {
                        ((CopyOnWriteArrayList) oVar.f94362c).remove(weakReference);
                    }
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public static synchronized o c(Context context) {
        try {
            if (f94359e == null) {
                f94359e = new o(context);
            }
        } catch (Throwable th2) {
            throw th2;
        }
        return f94359e;
    }

    @Override // x9.h
    public void b(l0 l0Var) {
        l0Var.f79954f.setElevation(0.0f);
    }

    @Override // cl.c0
    public ListenableFuture call() {
        be beVar = (be) this.f94361b;
        n0 n0Var = (n0) this.f94362c;
        int i5 = this.f94360a;
        ArrayList arrayList = (ArrayList) this.f94363d;
        ListenableFuture listenableFutureB = w0.b(n0Var);
        for (int i11 = 0; i11 < i5; i11++) {
            if (((Boolean) w0.a((Future) arrayList.get(i11))).booleanValue()) {
                if (((List) beVar.f32407b).get(i11) != null) {
                    throw new ClassCastException();
                }
                gc gcVar = new gc(1);
                int i12 = bh.f32414a;
                listenableFutureB = w0.f(listenableFutureB, new be(4, jg.a(), gcVar), m0.f20038a);
            }
        }
        return listenableFutureB;
    }

    public int d() {
        int i5;
        synchronized (this.f94363d) {
            i5 = this.f94360a;
        }
        return i5;
    }

    @Override // x9.h
    public void f(l0 l0Var, boolean z11) {
        CellLayout cellLayout = (CellLayout) this.f94362c;
        if (!z11) {
            cellLayout.setVisibility(0);
            cellLayout.post(new g.p(this, 29));
            return;
        }
        Workspace workspace = ((e4) this.f94363d).f79825a;
        workspace.f20995e1 = false;
        workspace.f20997f1 = true;
        SimplePopupView simplePopupView = (SimplePopupView) this.f94361b;
        if (simplePopupView != null) {
            simplePopupView.U();
        }
    }

    @Override // x9.h
    public boolean g(double d5) {
        return d5 > ((double) this.f94360a);
    }

    public o(Context context) {
        this.f94361b = new Handler(Looper.getMainLooper());
        this.f94362c = new CopyOnWriteArrayList();
        this.f94363d = new Object();
        this.f94360a = 0;
        IntentFilter intentFilter = new IntentFilter();
        intentFilter.addAction("android.net.conn.CONNECTIVITY_CHANGE");
        v.C(context, new r4(this, 5), intentFilter);
    }

    public o(e4 e4Var, SimplePopupView simplePopupView, CellLayout cellLayout) {
        this.f94363d = e4Var;
        this.f94361b = simplePopupView;
        this.f94362c = cellLayout;
        this.f94360a = e4Var.f79825a.getResources().getDimensionPixelSize(2131165366);
    }
}
