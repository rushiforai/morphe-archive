package jv;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;

/* loaded from: classes4.dex */
public final /* synthetic */ class d1 implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f70003a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Function1 f70004b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ ou.j f70005c;

    public /* synthetic */ d1(Function1 function1, ou.j jVar, int i5) {
        this.f70003a = i5;
        this.f70004b = function1;
        this.f70005c = jVar;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f70003a) {
            case 0:
                this.f70004b.invoke(this.f70005c);
                break;
            default:
                this.f70004b.invoke(this.f70005c);
                break;
        }
        return Unit.f71706a;
    }
}
