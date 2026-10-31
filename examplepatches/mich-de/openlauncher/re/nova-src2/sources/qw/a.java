package qw;

import kotlin.Unit;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a implements Function3 {

    /* renamed from: b, reason: collision with root package name */
    public static final a f84332b = new a(0);

    /* renamed from: c, reason: collision with root package name */
    public static final a f84333c = new a(1);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f84334a;

    public /* synthetic */ a(int i5) {
        this.f84334a = i5;
    }

    @Override // kotlin.jvm.functions.Function3
    public final Object invoke(Object obj, Object obj2, Object obj3) {
        switch (this.f84334a) {
            case 0:
                p1.o oVar = (p1.o) obj2;
                int iIntValue = ((Number) obj3).intValue();
                Intrinsics.g((k0.v) obj, "<this>");
                if ((iIntValue & 17) == 16) {
                    p1.t tVar = (p1.t) oVar;
                    if (tVar.E()) {
                        tVar.V();
                    }
                }
                break;
            default:
                p1.o oVar2 = (p1.o) obj2;
                int iIntValue2 = ((Number) obj3).intValue();
                Intrinsics.g((k0.v) obj, "<this>");
                if ((iIntValue2 & 17) == 16) {
                    p1.t tVar2 = (p1.t) oVar2;
                    if (tVar2.E()) {
                        tVar2.V();
                    }
                }
                break;
        }
        return Unit.f71706a;
    }
}
