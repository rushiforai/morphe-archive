package z5;

import android.os.Looper;
import android.util.AndroidRuntimeException;
import android.view.Choreographer;
import android.view.View;
import com.android.launcher3.dragndrop.DragLayer;
import com.teslacoilsw.launcher.NovaLauncher;
import java.util.ArrayList;
import ps.j;
import tx.f1;

/* loaded from: classes2.dex */
public final class c {

    /* renamed from: p, reason: collision with root package name */
    public static final b f98218p = new b(1);

    /* renamed from: q, reason: collision with root package name */
    public static final b f98219q = new b(2);

    /* renamed from: r, reason: collision with root package name */
    public static final b f98220r = new b(3);

    /* renamed from: s, reason: collision with root package name */
    public static final b f98221s = new b(4);

    /* renamed from: t, reason: collision with root package name */
    public static final b f98222t = new b(5);

    /* renamed from: u, reason: collision with root package name */
    public static final b f98223u = new b(6);

    /* renamed from: v, reason: collision with root package name */
    public static final b f98224v = new b(7);

    /* renamed from: w, reason: collision with root package name */
    public static final b f98225w = new b(0);

    /* renamed from: a, reason: collision with root package name */
    public float f98226a;

    /* renamed from: b, reason: collision with root package name */
    public float f98227b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f98228c;

    /* renamed from: d, reason: collision with root package name */
    public final Object f98229d;

    /* renamed from: e, reason: collision with root package name */
    public final j f98230e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f98231f;

    /* renamed from: g, reason: collision with root package name */
    public float f98232g;

    /* renamed from: h, reason: collision with root package name */
    public float f98233h;

    /* renamed from: i, reason: collision with root package name */
    public long f98234i;

    /* renamed from: j, reason: collision with root package name */
    public final float f98235j;

    /* renamed from: k, reason: collision with root package name */
    public final ArrayList f98236k;

    /* renamed from: l, reason: collision with root package name */
    public final ArrayList f98237l;

    /* renamed from: m, reason: collision with root package name */
    public d f98238m;
    public float n;
    public boolean o;

    public c(Object obj, j jVar) {
        this(obj, jVar, 0);
        this.f98238m = null;
        this.n = Float.MAX_VALUE;
        this.o = false;
    }

    public final void a() {
        if (Looper.myLooper() != Looper.getMainLooper()) {
            throw new AndroidRuntimeException("Animations may only be canceled on the main thread");
        }
        if (this.f98231f) {
            b();
        }
        float f11 = this.n;
        if (f11 != Float.MAX_VALUE) {
            d dVar = this.f98238m;
            if (dVar == null) {
                this.f98238m = new d(f11);
            } else {
                dVar.f98247i = f11;
            }
            this.n = Float.MAX_VALUE;
        }
    }

    public final void b() {
        ArrayList arrayList;
        int i5 = 0;
        this.f98231f = false;
        ThreadLocal threadLocal = a.f98211f;
        if (threadLocal.get() == null) {
            threadLocal.set(new a());
        }
        a aVar = (a) threadLocal.get();
        aVar.f98212a.remove(this);
        ArrayList arrayList2 = aVar.f98213b;
        int iIndexOf = arrayList2.indexOf(this);
        if (iIndexOf >= 0) {
            arrayList2.set(iIndexOf, null);
            aVar.f98216e = true;
        }
        this.f98234i = 0L;
        this.f98228c = false;
        while (true) {
            arrayList = this.f98236k;
            if (i5 >= arrayList.size()) {
                break;
            }
            if (arrayList.get(i5) != null) {
                f1 f1Var = (f1) arrayList.get(i5);
                NovaLauncher novaLauncher = f1Var.f89727a;
                View view = f1Var.f89728b;
                DragLayer dragLayer = novaLauncher.P;
                if (dragLayer != null && view.getParent() == dragLayer) {
                    dragLayer.removeView(view);
                }
            }
            i5++;
        }
        for (int size = arrayList.size() - 1; size >= 0; size--) {
            if (arrayList.get(size) == null) {
                arrayList.remove(size);
            }
        }
    }

    public final void c(float f11) {
        this.f98230e.n(this.f98229d, f11);
        int i5 = 0;
        while (true) {
            ArrayList arrayList = this.f98237l;
            if (i5 >= arrayList.size()) {
                for (int size = arrayList.size() - 1; size >= 0; size--) {
                    if (arrayList.get(size) == null) {
                        arrayList.remove(size);
                    }
                }
                return;
            }
            if (arrayList.get(i5) != null) {
                arrayList.get(i5).getClass();
                throw new ClassCastException();
            }
            i5++;
        }
    }

    public final void d() {
        if (this.f98238m.f98240b <= 0.0d) {
            throw new UnsupportedOperationException("Spring animations can only come to an end when there is damping");
        }
        if (Looper.myLooper() != Looper.getMainLooper()) {
            throw new AndroidRuntimeException("Animations may only be started on the main thread");
        }
        if (this.f98231f) {
            this.o = true;
        }
    }

    public final void e() {
        d dVar = this.f98238m;
        if (dVar == null) {
            throw new UnsupportedOperationException("Incomplete SpringAnimation: Either final position or a spring force needs to be set.");
        }
        double d5 = (float) dVar.f98247i;
        if (d5 > this.f98232g) {
            throw new UnsupportedOperationException("Final position of the spring cannot be greater than the max value.");
        }
        if (d5 < this.f98233h) {
            throw new UnsupportedOperationException("Final position of the spring cannot be less than the min value.");
        }
        double dAbs = Math.abs(this.f98235j * 0.75f);
        dVar.f98242d = dAbs;
        dVar.f98243e = dAbs * 62.5d;
        if (Looper.myLooper() != Looper.getMainLooper()) {
            throw new AndroidRuntimeException("Animations may only be started on the main thread");
        }
        boolean z11 = this.f98231f;
        if (z11 || z11) {
            return;
        }
        this.f98231f = true;
        if (!this.f98228c) {
            this.f98227b = this.f98230e.h(this.f98229d);
        }
        float f11 = this.f98227b;
        if (f11 > this.f98232g || f11 < this.f98233h) {
            throw new IllegalArgumentException("Starting value need to be in between min value and max value");
        }
        ThreadLocal threadLocal = a.f98211f;
        if (threadLocal.get() == null) {
            threadLocal.set(new a());
        }
        a aVar = (a) threadLocal.get();
        ArrayList arrayList = aVar.f98213b;
        if (arrayList.size() == 0) {
            if (aVar.f98215d == null) {
                aVar.f98215d = new vk.j(aVar.f98214c);
            }
            vk.j jVar = aVar.f98215d;
            ((Choreographer) jVar.f92818c).postFrameCallback((ib.d) jVar.f92819d);
        }
        if (arrayList.contains(this)) {
            return;
        }
        arrayList.add(this);
    }

    public c(Object obj, j jVar, float f11) {
        this(obj, jVar, 0);
        this.f98238m = null;
        this.n = Float.MAX_VALUE;
        this.o = false;
        this.f98238m = new d(f11);
    }

    public c(Object obj, j jVar, int i5) {
        this.f98226a = 0.0f;
        this.f98227b = Float.MAX_VALUE;
        this.f98228c = false;
        this.f98231f = false;
        this.f98232g = Float.MAX_VALUE;
        this.f98233h = -3.4028235E38f;
        this.f98234i = 0L;
        this.f98236k = new ArrayList();
        this.f98237l = new ArrayList();
        this.f98229d = obj;
        this.f98230e = jVar;
        if (jVar != f98222t && jVar != f98223u && jVar != f98224v) {
            if (jVar == f98225w) {
                this.f98235j = 0.00390625f;
                return;
            } else if (jVar != f98220r && jVar != f98221s) {
                this.f98235j = 1.0f;
                return;
            } else {
                this.f98235j = 0.00390625f;
                return;
            }
        }
        this.f98235j = 0.1f;
    }
}
