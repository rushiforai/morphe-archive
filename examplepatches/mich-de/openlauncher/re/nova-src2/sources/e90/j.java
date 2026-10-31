package e90;

import java.io.IOException;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;

/* loaded from: classes.dex */
public final class j extends a90.a {

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ k f52324e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ c0 f52325f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public j(String str, k kVar, c0 c0Var) {
        super(str, true);
        this.f52324e = kVar;
        this.f52325f = c0Var;
    }

    @Override // a90.a
    public final long a() {
        long jA;
        int i5;
        y[] yVarArr;
        k kVar = this.f52324e;
        c0 c0Var = this.f52325f;
        Ref.ObjectRef objectRef = new Ref.ObjectRef();
        q qVar = kVar.f52327b;
        synchronized (qVar.f52366w) {
            synchronized (qVar) {
                try {
                    c0 c0Var2 = qVar.f52360q;
                    c0 c0Var3 = new c0();
                    c0Var3.b(c0Var2);
                    c0Var3.b(c0Var);
                    objectRef.f71863a = c0Var3;
                    jA = c0Var3.a() - c0Var2.a();
                    yVarArr = (jA == 0 || qVar.f52347b.isEmpty()) ? null : (y[]) qVar.f52347b.values().toArray(new y[0]);
                    c0 c0Var4 = (c0) objectRef.f71863a;
                    Intrinsics.g(c0Var4, "<set-?>");
                    qVar.f52360q = c0Var4;
                    qVar.f52355j.c(new h(qVar.f52348c + " onSettings", qVar, objectRef, 0), 0L);
                    Unit unit = Unit.f71706a;
                } catch (Throwable th2) {
                    throw th2;
                }
            }
            try {
                qVar.f52366w.a((c0) objectRef.f71863a);
            } catch (IOException e3) {
                qVar.a(2, 2, e3);
            }
            Unit unit2 = Unit.f71706a;
        }
        if (yVarArr == null) {
            return -1L;
        }
        for (y yVar : yVarArr) {
            synchronized (yVar) {
                yVar.f52403f += jA;
                if (jA > 0) {
                    yVar.notifyAll();
                }
                Unit unit3 = Unit.f71706a;
            }
        }
        return -1L;
    }
}
