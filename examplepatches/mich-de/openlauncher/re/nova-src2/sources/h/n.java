package h;

import e1.m0;
import g.s;
import kotlin.jvm.functions.Function2;
import t70.j0;

/* loaded from: classes2.dex */
public final class n extends s {
    public j0 Y;
    public Function2 Z;

    /* renamed from: a0, reason: collision with root package name */
    public m0 f58713a0;

    @Override // g.s
    public final void handleOnBackCancelled() {
        super.handleOnBackCancelled();
        m0 m0Var = this.f58713a0;
        if (m0Var != null) {
            m0Var.b();
        }
        m0 m0Var2 = this.f58713a0;
        if (m0Var2 == null) {
            return;
        }
        m0Var2.f51337b = false;
    }

    @Override // g.s
    public final void handleOnBackPressed() {
        m0 m0Var = this.f58713a0;
        if (m0Var != null && !m0Var.f51337b) {
            m0Var.b();
            this.f58713a0 = null;
        }
        if (this.f58713a0 == null) {
            this.f58713a0 = new m0(this.Y, false, this.Z, this);
        }
        m0 m0Var2 = this.f58713a0;
        if (m0Var2 != null) {
            ((v70.i) m0Var2.f51338c).r(null);
        }
        m0 m0Var3 = this.f58713a0;
        if (m0Var3 == null) {
            return;
        }
        m0Var3.f51337b = false;
    }

    @Override // g.s
    public final void handleOnBackProgressed(g.b bVar) {
        super.handleOnBackProgressed(bVar);
        m0 m0Var = this.f58713a0;
        if (m0Var != null) {
            ((v70.i) m0Var.f51338c).j(bVar);
        }
    }

    @Override // g.s
    public final void handleOnBackStarted(g.b bVar) {
        super.handleOnBackStarted(bVar);
        m0 m0Var = this.f58713a0;
        if (m0Var != null) {
            m0Var.b();
        }
        if (isEnabled()) {
            this.f58713a0 = new m0(this.Y, true, this.Z, this);
        }
    }
}
