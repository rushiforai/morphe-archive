package defpackage;

import android.os.Build;
import android.view.View;
import android.view.WindowInsets;
import j$.util.Objects;
import java.util.WeakHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class z4f {
    public static final z4f b;
    public final w4f a;

    static {
        int i = Build.VERSION.SDK_INT;
        if (i >= 34) {
            b = u4f.x;
        } else if (i >= 30) {
            b = s4f.w;
        } else {
            b = w4f.b;
        }
    }

    public z4f(z4f z4fVar) {
        if (z4fVar == null) {
            this.a = new w4f(this);
            return;
        }
        w4f w4fVar = z4fVar.a;
        int i = Build.VERSION.SDK_INT;
        if (i >= 35 && (w4fVar instanceof v4f)) {
            this.a = new v4f(this, (v4f) w4fVar);
        } else if (i >= 34 && (w4fVar instanceof u4f)) {
            this.a = new u4f(this, (u4f) w4fVar);
        } else if (i >= 31 && (w4fVar instanceof t4f)) {
            this.a = new t4f(this, (t4f) w4fVar);
        } else if (i >= 30 && (w4fVar instanceof s4f)) {
            this.a = new s4f(this, (s4f) w4fVar);
        } else if (i >= 29 && (w4fVar instanceof r4f)) {
            this.a = new r4f(this, (r4f) w4fVar);
        } else if (i >= 28 && (w4fVar instanceof q4f)) {
            this.a = new q4f(this, (q4f) w4fVar);
        } else if (w4fVar instanceof p4f) {
            this.a = new p4f(this, (p4f) w4fVar);
        } else if (w4fVar instanceof o4f) {
            this.a = new o4f(this, (o4f) w4fVar);
        } else {
            this.a = new w4f(this);
        }
        w4fVar.e(this);
    }

    public static b36 e(b36 b36Var, int i, int i2, int i3, int i4) {
        int iMax = Math.max(0, b36Var.a - i);
        int iMax2 = Math.max(0, b36Var.b - i2);
        int iMax3 = Math.max(0, b36Var.c - i3);
        int iMax4 = Math.max(0, b36Var.d - i4);
        return (iMax == i && iMax2 == i2 && iMax3 == i3 && iMax4 == i4) ? b36Var : b36.c(iMax, iMax2, iMax3, iMax4);
    }

    public static z4f h(WindowInsets windowInsets, View view) {
        windowInsets.getClass();
        z4f z4fVar = new z4f(windowInsets);
        if (view != null && view.isAttachedToWindow()) {
            WeakHashMap weakHashMap = ute.a;
            z4f z4fVarA = nte.a(view);
            w4f w4fVar = z4fVar.a;
            w4fVar.y(z4fVarA);
            View rootView = view.getRootView();
            w4fVar.d(rootView);
            w4fVar.p(rootView);
            w4fVar.q();
            w4fVar.A(view.getWindowSystemUiVisibility());
        }
        return z4fVar;
    }

    public final int a() {
        return this.a.n().d;
    }

    public final int b() {
        return this.a.n().a;
    }

    public final int c() {
        return this.a.n().c;
    }

    public final int d() {
        return this.a.n().b;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof z4f) {
            return Objects.equals(this.a, ((z4f) obj).a);
        }
        return false;
    }

    public final z4f f(int i, int i2, int i3, int i4) {
        int i5 = Build.VERSION.SDK_INT;
        n4f m4fVar = i5 >= 36 ? new m4f(this) : i5 >= 35 ? new l4f(this) : i5 >= 34 ? new k4f(this) : i5 >= 31 ? new j4f(this) : i5 >= 30 ? new i4f(this) : i5 >= 29 ? new h4f(this) : new g4f(this);
        m4fVar.h(b36.c(i, i2, i3, i4));
        return m4fVar.b();
    }

    public final WindowInsets g() {
        w4f w4fVar = this.a;
        if (w4fVar instanceof o4f) {
            return ((o4f) w4fVar).c;
        }
        return null;
    }

    public final int hashCode() {
        w4f w4fVar = this.a;
        if (w4fVar == null) {
            return 0;
        }
        return w4fVar.hashCode();
    }

    public z4f(WindowInsets windowInsets) {
        int i = Build.VERSION.SDK_INT;
        if (i >= 35) {
            this.a = new v4f(this, windowInsets);
            return;
        }
        if (i >= 34) {
            this.a = new u4f(this, windowInsets);
            return;
        }
        if (i >= 31) {
            this.a = new t4f(this, windowInsets);
            return;
        }
        if (i >= 30) {
            this.a = new s4f(this, windowInsets);
            return;
        }
        if (i >= 29) {
            this.a = new r4f(this, windowInsets);
        } else if (i >= 28) {
            this.a = new q4f(this, windowInsets);
        } else {
            this.a = new p4f(this, windowInsets);
        }
    }
}
