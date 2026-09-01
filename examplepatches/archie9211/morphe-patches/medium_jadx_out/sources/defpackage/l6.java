package defpackage;

import android.view.MenuInflater;
import android.view.View;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class l6 {
    public final /* synthetic */ int a = 0;
    public boolean b;
    public Object c;

    public l6(String str, boolean z) {
        this.c = str;
        this.b = z;
    }

    public Integer a(l6 l6Var) {
        l6Var.getClass();
        dh7 dh7Var = nwe.a;
        if (this == l6Var) {
            return 0;
        }
        dh7 dh7Var2 = nwe.a;
        Integer num = (Integer) dh7Var2.get(this);
        Integer num2 = (Integer) dh7Var2.get(l6Var);
        if (num == null || num2 == null || num.equals(num2)) {
            return null;
        }
        return Integer.valueOf(num.intValue() - num2.intValue());
    }

    public abstract void b();

    public abstract View c();

    public String e() {
        return (String) this.c;
    }

    public abstract lx7 f();

    public abstract MenuInflater g();

    public abstract CharSequence h();

    public abstract CharSequence i();

    public abstract void j();

    public abstract boolean k();

    public abstract void m(View view);

    public abstract void n(int i);

    public abstract void o(CharSequence charSequence);

    public abstract void p(int i);

    public abstract void q(CharSequence charSequence);

    public abstract void r(boolean z);

    public String toString() {
        switch (this.a) {
            case 1:
                return e();
            default:
                return super.toString();
        }
    }

    public /* synthetic */ l6() {
    }

    public l6 l() {
        return this;
    }
}
