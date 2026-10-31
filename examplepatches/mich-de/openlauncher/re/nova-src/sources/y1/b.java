package y1;

import p1.g1;
import p1.z1;
import s10.r;
import x7.u;
import z1.o;

/* loaded from: classes.dex */
public final class b implements z1 {

    /* renamed from: a, reason: collision with root package name */
    public i f96555a;

    /* renamed from: b, reason: collision with root package name */
    public e f96556b;

    /* renamed from: c, reason: collision with root package name */
    public String f96557c;

    /* renamed from: d, reason: collision with root package name */
    public Object f96558d;

    /* renamed from: e, reason: collision with root package name */
    public Object[] f96559e;

    /* renamed from: f, reason: collision with root package name */
    public u f96560f;

    /* renamed from: g, reason: collision with root package name */
    public final r f96561g = new r(this, 6);

    public b(i iVar, e eVar, String str, Object obj, Object[] objArr) {
        this.f96555a = iVar;
        this.f96556b = eVar;
        this.f96557c = str;
        this.f96558d = obj;
        this.f96559e = objArr;
    }

    @Override // p1.z1
    public final void a() {
        b();
    }

    public final void b() {
        String strA;
        e eVar = this.f96556b;
        if (this.f96560f != null) {
            throw new IllegalArgumentException(("entry(" + this.f96560f + ") is not null").toString());
        }
        if (eVar != null) {
            r rVar = this.f96561g;
            Object objInvoke = rVar.invoke();
            if (objInvoke == null || eVar.c(objInvoke)) {
                this.f96560f = eVar.a(this.f96557c, rVar);
                return;
            }
            if (objInvoke instanceof o) {
                o oVar = (o) objInvoke;
                if (oVar.l() == g1.f81422b || oVar.l() == g1.f81425e || oVar.l() == g1.f81423c) {
                    strA = "MutableState containing " + oVar.getValue() + " cannot be saved using the current SaveableStateRegistry. The default implementation only supports types which can be stored inside the Bundle. Please consider implementing a custom Saver for this class and pass it as a stateSaver parameter to rememberSaveable().";
                } else {
                    strA = "If you use a custom SnapshotMutationPolicy for your MutableState you have to write a custom Saver";
                }
            } else {
                strA = j.a(objInvoke);
            }
            throw new IllegalArgumentException(strA);
        }
    }

    @Override // p1.z1
    public final void g() {
        u uVar = this.f96560f;
        if (uVar != null) {
            uVar.y();
        }
    }

    @Override // p1.z1
    public final void i() {
        u uVar = this.f96560f;
        if (uVar != null) {
            uVar.y();
        }
    }
}
