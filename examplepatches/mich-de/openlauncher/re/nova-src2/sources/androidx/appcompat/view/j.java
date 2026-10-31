package androidx.appcompat.view;

import a5.j1;
import r.l2;

/* loaded from: classes2.dex */
public final class j extends jk.b {

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f13654c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f13655d;

    /* renamed from: e, reason: collision with root package name */
    public int f13656e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ Object f13657f;

    public j(k kVar) {
        this.f13654c = 0;
        this.f13657f = kVar;
        this.f13655d = false;
        this.f13656e = 0;
    }

    @Override // jk.b, a5.j1
    public void a() {
        switch (this.f13654c) {
            case 1:
                this.f13655d = true;
                break;
        }
    }

    @Override // jk.b, a5.j1
    public final void b() {
        switch (this.f13654c) {
            case 0:
                if (!this.f13655d) {
                    this.f13655d = true;
                    j1 j1Var = ((k) this.f13657f).f13661d;
                    if (j1Var != null) {
                        j1Var.b();
                        break;
                    }
                }
                break;
            default:
                ((l2) this.f13657f).f84789a.setVisibility(0);
                break;
        }
    }

    @Override // a5.j1
    public final void c() {
        switch (this.f13654c) {
            case 0:
                int i5 = this.f13656e + 1;
                this.f13656e = i5;
                k kVar = (k) this.f13657f;
                if (i5 == kVar.f13658a.size()) {
                    j1 j1Var = kVar.f13661d;
                    if (j1Var != null) {
                        j1Var.c();
                    }
                    this.f13656e = 0;
                    this.f13655d = false;
                    kVar.f13662e = false;
                    break;
                }
                break;
            default:
                if (!this.f13655d) {
                    ((l2) this.f13657f).f84789a.setVisibility(this.f13656e);
                    break;
                }
                break;
        }
    }

    public j(l2 l2Var, int i5) {
        this.f13654c = 1;
        this.f13657f = l2Var;
        this.f13656e = i5;
        this.f13655d = false;
    }
}
