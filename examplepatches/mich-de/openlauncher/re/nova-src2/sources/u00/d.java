package u00;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;

/* loaded from: classes4.dex */
public final /* synthetic */ class d implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f90215a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Function1 f90216b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ fz.d f90217c;

    public /* synthetic */ d(Function1 function1, fz.d dVar, int i5) {
        this.f90215a = i5;
        this.f90216b = function1;
        this.f90217c = dVar;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f90215a) {
            case 0:
                this.f90216b.invoke(this.f90217c);
                break;
            case 1:
                this.f90216b.invoke(this.f90217c);
                break;
            default:
                this.f90216b.invoke(this.f90217c);
                break;
        }
        return Unit.f71706a;
    }
}
