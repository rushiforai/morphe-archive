package e00;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;

/* loaded from: classes4.dex */
public final /* synthetic */ class d implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f50267a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ w3 f50268b;

    public /* synthetic */ d(w3 w3Var, int i5) {
        this.f50267a = i5;
        this.f50268b = w3Var;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f50267a) {
            case 0:
                if (((Boolean) obj).booleanValue()) {
                    k30.c.Companion.getClass();
                    this.f50268b.a(k30.c.f70909h);
                }
                break;
            case 1:
                ((Boolean) obj).booleanValue();
                k30.c.Companion.getClass();
                this.f50268b.a(k30.c.f70909h);
                break;
            default:
                ((p1.s2) this.f50268b.f51119f).setValue((String) obj);
                break;
        }
        return Unit.f71706a;
    }
}
