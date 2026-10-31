package ads_mobile_sdk;

/* loaded from: classes2.dex */
public abstract class au0 extends b.y2 {

    /* renamed from: a, reason: collision with root package name */
    public final cu0 f1094a;

    /* renamed from: b, reason: collision with root package name */
    public cu0 f1095b;

    public au0(cu0 cu0Var) {
        this.f1094a = cu0Var;
        if (cu0Var.j()) {
            throw new IllegalArgumentException("Default instance must be immutable.");
        }
        this.f1095b = (cu0) cu0Var.a(4, (cu0) null);
    }

    public final cu0 a() {
        cu0 cu0Var;
        if (this.f1095b.j()) {
            this.f1095b.k();
            cu0Var = this.f1095b;
        } else {
            cu0Var = this.f1095b;
        }
        cu0Var.getClass();
        if (cu0.m1a(cu0Var)) {
            return cu0Var;
        }
        throw new zl3();
    }

    public final void b() {
        if (this.f1095b.j()) {
            return;
        }
        cu0 cu0Var = (cu0) this.f1094a.a(4, (cu0) null);
        cu0 cu0Var2 = this.f1095b;
        hn2 hn2Var = hn2.f4463c;
        hn2Var.getClass();
        hn2Var.a(cu0Var.getClass()).a(cu0Var, cu0Var2);
        this.f1095b = cu0Var;
    }

    public final Object clone() {
        cu0 cu0Var;
        au0 au0Var = (au0) this.f1094a.a(5, (cu0) null);
        if (this.f1095b.j()) {
            this.f1095b.k();
            cu0Var = this.f1095b;
        } else {
            cu0Var = this.f1095b;
        }
        au0Var.f1095b = cu0Var;
        return au0Var;
    }

    public final void a(cu0 cu0Var) {
        cu0 cu0Var2 = this.f1094a;
        if (cu0Var != null && !cu0Var2.getClass().isInstance(cu0Var)) {
            throw new IllegalArgumentException("mergeFrom(MessageLite) can only merge messages of the same type.");
        }
        if (cu0Var2.equals(cu0Var)) {
            return;
        }
        b();
        cu0 cu0Var3 = this.f1095b;
        hn2 hn2Var = hn2.f4463c;
        hn2Var.getClass();
        hn2Var.a(cu0Var3.getClass()).a(cu0Var3, cu0Var);
    }
}
