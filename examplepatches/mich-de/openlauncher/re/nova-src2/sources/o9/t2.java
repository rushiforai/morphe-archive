package o9;

import android.content.ComponentName;
import java.util.Optional;

/* loaded from: classes2.dex */
public class t2 extends ga.e {

    /* renamed from: r, reason: collision with root package name */
    public ComponentName f80139r;

    @Override // ga.e
    public final String b() {
        return super.b() + " componentName=" + this.f80139r;
    }

    @Override // ga.e
    public final ComponentName i() {
        return (ComponentName) Optional.ofNullable(super.i()).orElse(this.f80139r);
    }

    @Override // ga.e
    public final ga.e p() {
        t2 t2Var = new t2();
        t2Var.a(this);
        t2Var.f80139r = this.f80139r;
        return t2Var;
    }
}
