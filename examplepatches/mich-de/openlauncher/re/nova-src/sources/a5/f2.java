package a5;

import android.os.Build;
import android.view.View;
import androidx.core.graphics.Insets;
import java.util.Objects;

/* loaded from: classes.dex */
public class f2 {

    /* renamed from: b, reason: collision with root package name */
    public static final h2 f285b;

    /* renamed from: a, reason: collision with root package name */
    public final h2 f286a;

    static {
        int i5 = Build.VERSION.SDK_INT;
        f285b = (i5 >= 30 ? new x1() : i5 >= 29 ? new w1() : new u1()).b().f296a.a().f296a.b().f296a.c();
    }

    public f2(h2 h2Var) {
        this.f286a = h2Var;
    }

    public h2 a() {
        return this.f286a;
    }

    public h2 b() {
        return this.f286a;
    }

    public h2 c() {
        return this.f286a;
    }

    public void d(View view) {
    }

    public void e(h2 h2Var) {
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof f2)) {
            return false;
        }
        f2 f2Var = (f2) obj;
        return p() == f2Var.p() && o() == f2Var.o() && Objects.equals(l(), f2Var.l()) && Objects.equals(j(), f2Var.j()) && Objects.equals(f(), f2Var.f());
    }

    public n f() {
        return null;
    }

    public Insets g(int i5) {
        return Insets.NONE;
    }

    public Insets h(int i5) {
        if ((i5 & 8) == 0) {
            return Insets.NONE;
        }
        throw new IllegalArgumentException("Unable to query the maximum insets for IME");
    }

    public int hashCode() {
        return Objects.hash(Boolean.valueOf(p()), Boolean.valueOf(o()), l(), j(), f());
    }

    public Insets i() {
        return l();
    }

    public Insets j() {
        return Insets.NONE;
    }

    public Insets k() {
        return l();
    }

    public Insets l() {
        return Insets.NONE;
    }

    public Insets m() {
        return l();
    }

    public h2 n(int i5, int i11, int i12, int i13) {
        return f285b;
    }

    public boolean o() {
        return false;
    }

    public boolean p() {
        return false;
    }

    public boolean q(int i5) {
        return true;
    }

    public void r(Insets[] insetsArr) {
    }

    public void s(Insets insets) {
    }

    public void t(h2 h2Var) {
    }

    public void u(Insets insets) {
    }
}
