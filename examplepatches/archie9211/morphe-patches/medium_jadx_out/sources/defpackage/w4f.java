package defpackage;

import android.graphics.Rect;
import android.os.Build;
import android.view.View;
import j$.util.Objects;
import java.util.Collections;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class w4f {
    public static final z4f b;
    public final z4f a;

    static {
        int i = Build.VERSION.SDK_INT;
        b = (i >= 36 ? new m4f() : i >= 35 ? new l4f() : i >= 34 ? new k4f() : i >= 31 ? new j4f() : i >= 30 ? new i4f() : i >= 29 ? new h4f() : new g4f()).b().a.a().a.b().a.c();
    }

    public w4f(z4f z4fVar) {
        this.a = z4fVar;
    }

    public z4f a() {
        return this.a;
    }

    public z4f b() {
        return this.a;
    }

    public z4f c() {
        return this.a;
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof w4f)) {
            return false;
        }
        w4f w4fVar = (w4f) obj;
        return t() == w4fVar.t() && s() == w4fVar.s() && Objects.equals(n(), w4fVar.n()) && Objects.equals(l(), w4fVar.l()) && Objects.equals(h(), w4fVar.h());
    }

    public List<Rect> f(int i) {
        return Collections.EMPTY_LIST;
    }

    public List<Rect> g(int i) {
        return Collections.EMPTY_LIST;
    }

    public yg3 h() {
        return null;
    }

    public int hashCode() {
        return Objects.hash(Boolean.valueOf(t()), Boolean.valueOf(s()), n(), l(), h());
    }

    public b36 i(int i) {
        return b36.e;
    }

    public b36 j(int i) {
        if ((i & 8) == 0) {
            return b36.e;
        }
        ay0.e("Unable to query the maximum insets for IME");
        return null;
    }

    public b36 k() {
        return n();
    }

    public b36 l() {
        return b36.e;
    }

    public b36 m() {
        return n();
    }

    public b36 n() {
        return b36.e;
    }

    public b36 o() {
        return n();
    }

    public z4f r(int i, int i2, int i3, int i4) {
        return b;
    }

    public boolean s() {
        return false;
    }

    public boolean t() {
        return false;
    }

    public boolean u(int i) {
        return true;
    }

    public void q() {
    }

    public void A(int i) {
    }

    public void B(Rect[][] rectArr) {
    }

    public void C(Rect[][] rectArr) {
    }

    public void d(View view) {
    }

    public void e(z4f z4fVar) {
    }

    public void p(View view) {
    }

    public void v(rh3 rh3Var) {
    }

    public void w(b36[] b36VarArr) {
    }

    public void x(b36 b36Var) {
    }

    public void y(z4f z4fVar) {
    }

    public void z(b36 b36Var) {
    }
}
