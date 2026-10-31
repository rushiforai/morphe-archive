package a5;

import android.os.Build;
import android.view.View;
import android.view.WindowInsets;
import androidx.core.graphics.Insets;
import java.util.Objects;
import java.util.WeakHashMap;

/* loaded from: classes.dex */
public final class h2 {

    /* renamed from: b, reason: collision with root package name */
    public static final h2 f295b;

    /* renamed from: a, reason: collision with root package name */
    public final f2 f296a;

    static {
        if (Build.VERSION.SDK_INT >= 30) {
            f295b = e2.f277q;
        } else {
            f295b = f2.f285b;
        }
    }

    public h2(WindowInsets windowInsets) {
        int i5 = Build.VERSION.SDK_INT;
        if (i5 >= 30) {
            this.f296a = new e2(this, windowInsets);
            return;
        }
        if (i5 >= 29) {
            this.f296a = new d2(this, windowInsets);
        } else if (i5 >= 28) {
            this.f296a = new c2(this, windowInsets);
        } else {
            this.f296a = new a2(this, windowInsets);
        }
    }

    public static Insets e(Insets insets, int i5, int i11, int i12, int i13) {
        int iMax = Math.max(0, insets.left - i5);
        int iMax2 = Math.max(0, insets.top - i11);
        int iMax3 = Math.max(0, insets.right - i12);
        int iMax4 = Math.max(0, insets.bottom - i13);
        return (iMax == i5 && iMax2 == i11 && iMax3 == i12 && iMax4 == i13) ? insets : Insets.of(iMax, iMax2, iMax3, iMax4);
    }

    public static h2 g(View view, WindowInsets windowInsets) {
        windowInsets.getClass();
        h2 h2Var = new h2(windowInsets);
        if (view != null && view.isAttachedToWindow()) {
            WeakHashMap weakHashMap = a1.f250a;
            h2 h2VarA = t0.a(view);
            f2 f2Var = h2Var.f296a;
            f2Var.t(h2VarA);
            f2Var.d(view.getRootView());
        }
        return h2Var;
    }

    public final int a() {
        return this.f296a.l().bottom;
    }

    public final int b() {
        return this.f296a.l().left;
    }

    public final int c() {
        return this.f296a.l().right;
    }

    public final int d() {
        return this.f296a.l().top;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof h2) {
            return Objects.equals(this.f296a, ((h2) obj).f296a);
        }
        return false;
    }

    public final WindowInsets f() {
        f2 f2Var = this.f296a;
        if (f2Var instanceof z1) {
            return ((z1) f2Var).f395c;
        }
        return null;
    }

    public final int hashCode() {
        f2 f2Var = this.f296a;
        if (f2Var == null) {
            return 0;
        }
        return f2Var.hashCode();
    }

    public h2(h2 h2Var) {
        if (h2Var != null) {
            f2 f2Var = h2Var.f296a;
            int i5 = Build.VERSION.SDK_INT;
            if (i5 >= 30 && (f2Var instanceof e2)) {
                this.f296a = new e2(this, (e2) f2Var);
            } else if (i5 >= 29 && (f2Var instanceof d2)) {
                this.f296a = new d2(this, (d2) f2Var);
            } else if (i5 >= 28 && (f2Var instanceof c2)) {
                this.f296a = new c2(this, (c2) f2Var);
            } else if (f2Var instanceof a2) {
                this.f296a = new a2(this, (a2) f2Var);
            } else if (f2Var instanceof z1) {
                this.f296a = new z1(this, (z1) f2Var);
            } else {
                this.f296a = new f2(this);
            }
            f2Var.e(this);
            return;
        }
        this.f296a = new f2(this);
    }
}
