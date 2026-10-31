package c3;

import android.os.Handler;
import android.view.Choreographer;
import java.util.ArrayList;
import kotlin.LazyKt;
import kotlin.Unit;
import kotlin.collections.ArrayDeque;
import kotlin.coroutines.CoroutineContext;

/* loaded from: classes.dex */
public final class g1 extends t70.c0 {

    /* renamed from: m, reason: collision with root package name */
    public static final a70.d f19287m = LazyKt.a(u0.f19431p);
    public static final bh.i n = new bh.i(1);

    /* renamed from: c, reason: collision with root package name */
    public final Choreographer f19288c;

    /* renamed from: d, reason: collision with root package name */
    public final Handler f19289d;

    /* renamed from: i, reason: collision with root package name */
    public boolean f19294i;

    /* renamed from: j, reason: collision with root package name */
    public boolean f19295j;

    /* renamed from: l, reason: collision with root package name */
    public final i1 f19297l;

    /* renamed from: e, reason: collision with root package name */
    public final Object f19290e = new Object();

    /* renamed from: f, reason: collision with root package name */
    public final ArrayDeque f19291f = new ArrayDeque();

    /* renamed from: g, reason: collision with root package name */
    public ArrayList f19292g = new ArrayList();

    /* renamed from: h, reason: collision with root package name */
    public ArrayList f19293h = new ArrayList();

    /* renamed from: k, reason: collision with root package name */
    public final f1 f19296k = new f1(this);

    public g1(Choreographer choreographer, Handler handler) {
        this.f19288c = choreographer;
        this.f19289d = handler;
        this.f19297l = new i1(choreographer, this);
    }

    public static final void g0(g1 g1Var) {
        Runnable runnable;
        boolean z11;
        do {
            synchronized (g1Var.f19290e) {
                ArrayDeque arrayDeque = g1Var.f19291f;
                runnable = (Runnable) (arrayDeque.isEmpty() ? null : arrayDeque.removeFirst());
            }
            while (runnable != null) {
                runnable.run();
                synchronized (g1Var.f19290e) {
                    ArrayDeque arrayDeque2 = g1Var.f19291f;
                    runnable = (Runnable) (arrayDeque2.isEmpty() ? null : arrayDeque2.removeFirst());
                }
            }
            synchronized (g1Var.f19290e) {
                if (g1Var.f19291f.isEmpty()) {
                    z11 = false;
                    g1Var.f19294i = false;
                } else {
                    z11 = true;
                }
            }
        } while (z11);
    }

    @Override // t70.c0
    public final void c0(CoroutineContext coroutineContext, Runnable runnable) {
        synchronized (this.f19290e) {
            try {
                this.f19291f.addLast(runnable);
                if (!this.f19294i) {
                    this.f19294i = true;
                    this.f19289d.post(this.f19296k);
                    if (!this.f19295j) {
                        this.f19295j = true;
                        this.f19288c.postFrameCallback(this.f19296k);
                    }
                }
                Unit unit = Unit.f71706a;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }
}
