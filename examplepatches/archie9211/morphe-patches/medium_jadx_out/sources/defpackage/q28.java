package defpackage;

import androidx.compose.ui.ModifierNodeDetachedCancellationException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class q28 implements a43 {
    public k92 b;
    public int c;
    public q28 e;
    public q28 f;
    public mn8 g;
    public eh8 h;
    public boolean i;
    public boolean j;
    public boolean k;
    public boolean l;
    public cn m;
    public boolean n;
    public q28 a = this;
    public int d = -1;

    public void D0() {
        if (!this.n) {
            b26.b("reset() called on an unattached node");
        }
        C0();
    }

    public void E0() {
        if (!this.n) {
            b26.b("Must run markAsAttached() prior to runAttachLifecycle");
        }
        if (!this.k) {
            b26.b("Must run runAttachLifecycle() only once after markAsAttached()");
        }
        this.k = false;
        y0();
        this.l = true;
    }

    public void F0() {
        if (!this.n) {
            b26.b("node detached multiple times");
        }
        if (this.h == null) {
            b26.b("detach invoked on a node without a coordinator");
        }
        if (!this.l) {
            b26.b("Must run runDetachLifecycle() once after runAttachLifecycle() and before markAsDetached()");
        }
        this.l = false;
        cn cnVar = this.m;
        if (cnVar != null) {
            cnVar.invoke();
        }
        A0();
    }

    public void G0(q28 q28Var) {
        this.a = q28Var;
    }

    public void H0(eh8 eh8Var) {
        this.h = eh8Var;
    }

    public final sb2 u0() {
        k92 k92Var = this.b;
        if (k92Var != null) {
            return k92Var;
        }
        k92 k92VarC = o7f.c(((mn) flb.w0(this)).getCoroutineContext().j0(new wa6((va6) ((mn) flb.w0(this)).getCoroutineContext().o0(cd7.g))));
        this.b = k92VarC;
        return k92VarC;
    }

    public boolean v0() {
        return !(this instanceof sm0);
    }

    public void w0() {
        if (this.n) {
            b26.b("node attached multiple times");
        }
        if (this.h == null) {
            b26.b("attach invoked on a node without a coordinator");
        }
        this.n = true;
        this.k = true;
    }

    public void x0() {
        if (!this.n) {
            b26.b("Cannot detach a node that is not attached");
        }
        if (this.k) {
            b26.b("Must run runAttachLifecycle() before markAsDetached()");
        }
        if (this.l) {
            b26.b("Must run runDetachLifecycle() before markAsDetached()");
        }
        this.n = false;
        k92 k92Var = this.b;
        if (k92Var != null) {
            o7f.m(k92Var, new ModifierNodeDetachedCancellationException("The Modifier.Node was detached"));
            this.b = null;
        }
    }

    public void A0() {
    }

    public void B0() {
    }

    public void C0() {
    }

    public void y0() {
    }

    public void z0() {
    }
}
