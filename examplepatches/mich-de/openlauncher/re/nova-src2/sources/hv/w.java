package hv;

import f1.g5;
import kotlin.Unit;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class w implements Function3 {

    /* renamed from: a, reason: collision with root package name */
    public static final w f60640a = new w();

    /* JADX WARN: Removed duplicated region for block: B:8:0x0029  */
    @Override // kotlin.jvm.functions.Function3
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj, Object obj2, Object obj3) {
        k0.y1 Button = (k0.y1) obj;
        p1.o oVar = (p1.o) obj2;
        int iIntValue = ((Number) obj3).intValue();
        Intrinsics.g(Button, "$this$Button");
        if ((iIntValue & 17) == 16) {
            p1.t tVar = (p1.t) oVar;
            if (tVar.E()) {
                tVar.V();
            } else {
                g5.b(x7.f.Y(oVar, 2132019759), null, 0L, 0L, null, null, 0L, null, 0L, 0, false, 0, 0, null, null, oVar, 0, 0, 131070);
            }
        }
        return Unit.f71706a;
    }
}
