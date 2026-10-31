package z2;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class i extends Lambda implements Function2 {

    /* renamed from: j, reason: collision with root package name */
    public static final i f98076j = new i(2);

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        p1.o oVar = (p1.o) obj;
        int iIntValue = ((Number) obj2).intValue();
        p1.t tVar = (p1.t) oVar;
        if (!tVar.S(iIntValue & 1, (iIntValue & 3) != 2)) {
            tVar.V();
        }
        return Unit.f71706a;
    }
}
