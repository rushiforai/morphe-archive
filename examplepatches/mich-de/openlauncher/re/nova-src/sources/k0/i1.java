package k0;

import c3.q2;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;

/* loaded from: classes.dex */
public final /* synthetic */ class i1 implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f70643a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ float f70644b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ float f70645c;

    public /* synthetic */ i1(int i5, float f11, float f12) {
        this.f70643a = i5;
        this.f70644b = f11;
        this.f70645c = f12;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        q2 q2Var = (q2) obj;
        switch (this.f70643a) {
            case 0:
                q2Var.d("offset");
                q2Var.b().b("x", new y3.f(this.f70644b));
                q2Var.b().b("y", new y3.f(this.f70645c));
                break;
            default:
                q2Var.d("padding");
                q2Var.b().b("horizontal", new y3.f(this.f70644b));
                q2Var.b().b("vertical", new y3.f(this.f70645c));
                break;
        }
        return Unit.f71706a;
    }
}
