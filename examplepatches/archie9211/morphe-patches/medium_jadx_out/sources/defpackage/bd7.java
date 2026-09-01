package defpackage;

import android.view.View;
import androidx.recyclerview.widget.StaggeredGridLayoutManager;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class bd7 {
    public final /* synthetic */ int a;
    public int b;
    public int c;
    public int d;
    public int e;
    public final Object f;
    public final Object g;

    public bd7(int i) {
        this.a = 0;
        this.b = i;
        if (i <= 0) {
            ay0.e("maxSize <= 0");
            throw null;
        }
        this.f = new ct2(2, false);
        this.g = new uob(18);
    }

    public void a() {
        View view = (View) y30.m(1, (ArrayList) this.f);
        anc ancVar = (anc) view.getLayoutParams();
        this.c = ((StaggeredGridLayoutManager) this.g).r.d(view);
        ancVar.getClass();
    }

    public void b() {
        ((ArrayList) this.f).clear();
        this.b = Integer.MIN_VALUE;
        this.c = Integer.MIN_VALUE;
        this.d = 0;
    }

    public Object c(Object obj) {
        return null;
    }

    public void d(Object obj, Object obj2, Object obj3) {
        obj.getClass();
    }

    public int e() {
        return ((StaggeredGridLayoutManager) this.g).w ? g(r1.size() - 1, -1, false, false, true) : g(0, ((ArrayList) this.f).size(), false, false, true);
    }

    public int f() {
        return ((StaggeredGridLayoutManager) this.g).w ? g(0, ((ArrayList) this.f).size(), false, false, true) : g(r1.size() - 1, -1, false, false, true);
    }

    public int g(int i, int i2, boolean z, boolean z2, boolean z3) {
        StaggeredGridLayoutManager staggeredGridLayoutManager = (StaggeredGridLayoutManager) this.g;
        int iM = staggeredGridLayoutManager.r.m();
        int i3 = staggeredGridLayoutManager.r.i();
        int i4 = i2 > i ? 1 : -1;
        while (i != i2) {
            View view = (View) ((ArrayList) this.f).get(i);
            int iG = staggeredGridLayoutManager.r.g(view);
            int iD = staggeredGridLayoutManager.r.d(view);
            boolean z4 = false;
            boolean z5 = !z3 ? iG >= i3 : iG > i3;
            if (!z3 ? iD > iM : iD >= iM) {
                z4 = true;
            }
            if (z5 && z4) {
                if (z && z2) {
                    if (iG >= iM && iD <= i3) {
                        return sxa.H(view);
                    }
                } else {
                    if (z2) {
                        return sxa.H(view);
                    }
                    if (iG < iM || iD > i3) {
                        return sxa.H(view);
                    }
                }
            }
            i += i4;
        }
        return -1;
    }

    public Object h(Object obj) {
        Object objPut;
        synchronized (((uob) this.g)) {
            Object obj2 = ((ct2) this.f).a.get(obj);
            if (obj2 != null) {
                this.d++;
                return obj2;
            }
            this.e++;
            Object objC = c(obj);
            if (objC == null) {
                return null;
            }
            synchronized (((uob) this.g)) {
                objPut = ((ct2) this.f).a.put(obj, objC);
                if (objPut != null) {
                    ((ct2) this.f).a.put(obj, objPut);
                } else {
                    this.c++;
                }
            }
            if (objPut != null) {
                d(obj, objC, objPut);
                return objPut;
            }
            n(this.b);
            return objC;
        }
    }

    public int i(int i) {
        int i2 = this.c;
        if (i2 != Integer.MIN_VALUE) {
            return i2;
        }
        if (((ArrayList) this.f).size() == 0) {
            return i;
        }
        a();
        return this.c;
    }

    public View j(int i, int i2) {
        StaggeredGridLayoutManager staggeredGridLayoutManager = (StaggeredGridLayoutManager) this.g;
        ArrayList arrayList = (ArrayList) this.f;
        View view = null;
        if (i2 != -1) {
            int size = arrayList.size() - 1;
            while (size >= 0) {
                View view2 = (View) arrayList.get(size);
                if ((staggeredGridLayoutManager.w && sxa.H(view2) >= i) || ((!staggeredGridLayoutManager.w && sxa.H(view2) <= i) || !view2.hasFocusable())) {
                    break;
                }
                size--;
                view = view2;
            }
            return view;
        }
        int size2 = arrayList.size();
        int i3 = 0;
        while (i3 < size2) {
            View view3 = (View) arrayList.get(i3);
            if ((staggeredGridLayoutManager.w && sxa.H(view3) <= i) || ((!staggeredGridLayoutManager.w && sxa.H(view3) >= i) || !view3.hasFocusable())) {
                break;
            }
            i3++;
            view = view3;
        }
        return view;
    }

    public int k(int i) {
        ArrayList arrayList = (ArrayList) this.f;
        int i2 = this.b;
        if (i2 != Integer.MIN_VALUE) {
            return i2;
        }
        if (arrayList.size() == 0) {
            return i;
        }
        View view = (View) arrayList.get(0);
        anc ancVar = (anc) view.getLayoutParams();
        this.b = ((StaggeredGridLayoutManager) this.g).r.g(view);
        ancVar.getClass();
        return this.b;
    }

    public Object l(Object obj, Object obj2) {
        Object objPut;
        obj.getClass();
        obj2.getClass();
        synchronized (((uob) this.g)) {
            this.c++;
            objPut = ((ct2) this.f).a.put(obj, obj2);
            if (objPut != null) {
                this.c--;
            }
        }
        if (objPut != null) {
            d(obj, objPut, obj2);
        }
        n(this.b);
        return objPut;
    }

    public Object m(Object obj) {
        Object objRemove;
        synchronized (((uob) this.g)) {
            objRemove = ((ct2) this.f).a.remove(obj);
            if (objRemove != null) {
                this.c--;
            }
        }
        if (objRemove != null) {
            d(obj, objRemove, null);
        }
        return objRemove;
    }

    /* JADX WARN: Code restructure failed: missing block: B:26:0x006a, code lost:
    
        return;
     */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x0072, code lost:
    
        throw new java.lang.IllegalStateException("LruCache.sizeOf() is reporting inconsistent results!");
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void n(int r5) {
        /*
            r4 = this;
        L0:
            java.lang.Object r0 = r4.g
            uob r0 = (defpackage.uob) r0
            monitor-enter(r0)
            int r1 = r4.c     // Catch: java.lang.Throwable -> L1a
            if (r1 < 0) goto L6b
            java.lang.Object r1 = r4.f     // Catch: java.lang.Throwable -> L1a
            ct2 r1 = (defpackage.ct2) r1     // Catch: java.lang.Throwable -> L1a
            java.util.LinkedHashMap r1 = r1.a     // Catch: java.lang.Throwable -> L1a
            boolean r1 = r1.isEmpty()     // Catch: java.lang.Throwable -> L1a
            if (r1 == 0) goto L1c
            int r1 = r4.c     // Catch: java.lang.Throwable -> L1a
            if (r1 != 0) goto L6b
            goto L1c
        L1a:
            r4 = move-exception
            goto L73
        L1c:
            int r1 = r4.c     // Catch: java.lang.Throwable -> L1a
            if (r1 <= r5) goto L69
            java.lang.Object r1 = r4.f     // Catch: java.lang.Throwable -> L1a
            ct2 r1 = (defpackage.ct2) r1     // Catch: java.lang.Throwable -> L1a
            java.util.LinkedHashMap r1 = r1.a     // Catch: java.lang.Throwable -> L1a
            boolean r1 = r1.isEmpty()     // Catch: java.lang.Throwable -> L1a
            if (r1 == 0) goto L2d
            goto L69
        L2d:
            java.lang.Object r1 = r4.f     // Catch: java.lang.Throwable -> L1a
            ct2 r1 = (defpackage.ct2) r1     // Catch: java.lang.Throwable -> L1a
            java.util.LinkedHashMap r1 = r1.a     // Catch: java.lang.Throwable -> L1a
            java.util.Set r1 = r1.entrySet()     // Catch: java.lang.Throwable -> L1a
            r1.getClass()     // Catch: java.lang.Throwable -> L1a
            java.lang.Iterable r1 = (java.lang.Iterable) r1     // Catch: java.lang.Throwable -> L1a
            java.lang.Object r1 = defpackage.bu1.y0(r1)     // Catch: java.lang.Throwable -> L1a
            java.util.Map$Entry r1 = (java.util.Map.Entry) r1     // Catch: java.lang.Throwable -> L1a
            if (r1 != 0) goto L46
            monitor-exit(r0)
            return
        L46:
            java.lang.Object r2 = r1.getKey()     // Catch: java.lang.Throwable -> L1a
            java.lang.Object r1 = r1.getValue()     // Catch: java.lang.Throwable -> L1a
            java.lang.Object r3 = r4.f     // Catch: java.lang.Throwable -> L1a
            ct2 r3 = (defpackage.ct2) r3     // Catch: java.lang.Throwable -> L1a
            r2.getClass()     // Catch: java.lang.Throwable -> L1a
            java.util.LinkedHashMap r3 = r3.a     // Catch: java.lang.Throwable -> L1a
            r3.remove(r2)     // Catch: java.lang.Throwable -> L1a
            int r3 = r4.c     // Catch: java.lang.Throwable -> L1a
            r1.getClass()     // Catch: java.lang.Throwable -> L1a
            int r3 = r3 + (-1)
            r4.c = r3     // Catch: java.lang.Throwable -> L1a
            monitor-exit(r0)
            r0 = 0
            r4.d(r2, r1, r0)
            goto L0
        L69:
            monitor-exit(r0)
            return
        L6b:
            java.lang.String r4 = "LruCache.sizeOf() is reporting inconsistent results!"
            java.lang.IllegalStateException r5 = new java.lang.IllegalStateException     // Catch: java.lang.Throwable -> L1a
            r5.<init>(r4)     // Catch: java.lang.Throwable -> L1a
            throw r5     // Catch: java.lang.Throwable -> L1a
        L73:
            monitor-exit(r0)
            throw r4
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.bd7.n(int):void");
    }

    public String toString() {
        String str;
        switch (this.a) {
            case 0:
                synchronized (((uob) this.g)) {
                    try {
                        int i = this.d;
                        int i2 = this.e + i;
                        str = "LruCache[maxSize=" + this.b + ",hits=" + this.d + ",misses=" + this.e + ",hitRate=" + (i2 != 0 ? (i * 100) / i2 : 0) + "%]";
                    } catch (Throwable th) {
                        throw th;
                    }
                }
                return str;
            default:
                return super.toString();
        }
    }

    public bd7(StaggeredGridLayoutManager staggeredGridLayoutManager, int i) {
        this.a = 1;
        this.g = staggeredGridLayoutManager;
        this.f = new ArrayList();
        this.b = Integer.MIN_VALUE;
        this.c = Integer.MIN_VALUE;
        this.d = 0;
        this.e = i;
    }
}
