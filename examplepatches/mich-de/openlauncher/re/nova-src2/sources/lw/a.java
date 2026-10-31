package lw;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import p1.o;
import p1.t;

/* loaded from: classes4.dex */
public final class a implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public static final a f75118a = new a();

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        o oVar = (o) obj;
        if ((((Number) obj2).intValue() & 3) == 2) {
            t tVar = (t) oVar;
            if (tVar.E()) {
                tVar.V();
            }
        }
        return Unit.f71706a;
    }
}
