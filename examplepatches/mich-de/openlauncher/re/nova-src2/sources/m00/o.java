package m00;

import java.util.List;
import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import p1.e1;

/* loaded from: classes4.dex */
public final class o implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f75608a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ List f75609b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ e1 f75610c;

    public /* synthetic */ o(List list, e1 e1Var, int i5) {
        this.f75608a = i5;
        this.f75609b = list;
        this.f75610c = e1Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x0020  */
    /* JADX WARN: Removed duplicated region for block: B:19:0x0045  */
    @Override // kotlin.jvm.functions.Function2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f75608a) {
            case 0:
                p1.o oVar = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar = (p1.t) oVar;
                    if (tVar.E()) {
                        tVar.V();
                    } else {
                        io.sentry.config.a.r(this.f75609b, this.f75610c, oVar);
                    }
                }
                break;
            default:
                p1.o oVar2 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar2 = (p1.t) oVar2;
                    if (tVar2.E()) {
                        tVar2.V();
                    } else {
                        io.sentry.config.a.r(this.f75609b, this.f75610c, oVar2);
                    }
                }
                break;
        }
        return Unit.f71706a;
    }
}
