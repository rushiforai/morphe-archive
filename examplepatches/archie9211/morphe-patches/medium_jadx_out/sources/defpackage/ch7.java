package defpackage;

import android.os.Build;
import android.view.View;
import java.nio.ByteBuffer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class ch7 {
    public int a;
    public int b;
    public int c;
    public Object d;

    public ch7() {
        if (dq1.m == null) {
            dq1.m = new dq1(25);
        }
    }

    public int a(int i) {
        if (i < this.c) {
            return ((ByteBuffer) this.d).getShort(this.b + i);
        }
        return 0;
    }

    public void b() {
        if (((dh7) this.d).h == this.c) {
            return;
        }
        z10.g();
    }

    public abstract Object c(View view);

    public abstract void d(View view, Object obj);

    public void f() {
        while (true) {
            int i = this.a;
            dh7 dh7Var = (dh7) this.d;
            if (i >= dh7Var.f || dh7Var.c[i] >= 0) {
                return;
            } else {
                this.a = i + 1;
            }
        }
    }

    public void h(View view, Object obj) {
        Object tag;
        if (Build.VERSION.SDK_INT >= this.b) {
            d(view, obj);
            return;
        }
        if (Build.VERSION.SDK_INT >= this.b) {
            tag = c(view);
        } else {
            tag = view.getTag(this.a);
            if (!((Class) this.d).isInstance(tag)) {
                tag = null;
            }
        }
        if (j(tag, obj)) {
            View.AccessibilityDelegate accessibilityDelegateE = ute.e(view);
            l4 l4Var = accessibilityDelegateE != null ? accessibilityDelegateE instanceof k4 ? ((k4) accessibilityDelegateE).a : new l4(accessibilityDelegateE) : null;
            if (l4Var == null) {
                l4Var = new l4();
            }
            ute.o(view, l4Var);
            view.setTag(this.a, obj);
            ute.i(view, this.c);
        }
    }

    public boolean hasNext() {
        return this.a < ((dh7) this.d).f;
    }

    public abstract boolean j(Object obj, Object obj2);

    public void remove() {
        dh7 dh7Var = (dh7) this.d;
        b();
        if (this.b == -1) {
            ygf.f("Call next() before removing element from the iterator.");
            return;
        }
        dh7Var.c();
        dh7Var.n(this.b);
        this.b = -1;
        this.c = dh7Var.h;
    }
}
