package ba0;

/* loaded from: classes5.dex */
public abstract class r {

    /* renamed from: a, reason: collision with root package name */
    public r f17781a = null;

    /* renamed from: b, reason: collision with root package name */
    public r f17782b = null;

    /* renamed from: c, reason: collision with root package name */
    public r f17783c = null;

    /* renamed from: d, reason: collision with root package name */
    public r f17784d = null;

    /* renamed from: e, reason: collision with root package name */
    public r f17785e = null;

    public abstract void a(y yVar);

    public final void b(r rVar) {
        rVar.f();
        rVar.d(this);
        r rVar2 = this.f17783c;
        if (rVar2 == null) {
            this.f17782b = rVar;
            this.f17783c = rVar;
        } else {
            rVar2.f17785e = rVar;
            rVar.f17784d = rVar2;
            this.f17783c = rVar;
        }
    }

    public r c() {
        return this.f17781a;
    }

    public void d(r rVar) {
        this.f17781a = rVar;
    }

    public String e() {
        return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    }

    public final void f() {
        r rVar = this.f17784d;
        if (rVar != null) {
            rVar.f17785e = this.f17785e;
        } else {
            r rVar2 = this.f17781a;
            if (rVar2 != null) {
                rVar2.f17782b = this.f17785e;
            }
        }
        r rVar3 = this.f17785e;
        if (rVar3 != null) {
            rVar3.f17784d = rVar;
        } else {
            r rVar4 = this.f17781a;
            if (rVar4 != null) {
                rVar4.f17783c = rVar;
            }
        }
        this.f17781a = null;
        this.f17785e = null;
        this.f17784d = null;
    }

    public final String toString() {
        return getClass().getSimpleName() + "{" + e() + "}";
    }
}
