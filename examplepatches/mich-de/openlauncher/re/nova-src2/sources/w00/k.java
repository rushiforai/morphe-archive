package w00;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function3;

/* loaded from: classes4.dex */
public final class k implements Function3 {

    /* renamed from: b, reason: collision with root package name */
    public static final k f93565b = new k(0);

    /* renamed from: c, reason: collision with root package name */
    public static final k f93566c = new k(1);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f93567a;

    public /* synthetic */ k(int i5) {
        this.f93567a = i5;
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x0034  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x006b  */
    @Override // kotlin.jvm.functions.Function3
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj, Object obj2, Object obj3) {
        switch (this.f93567a) {
            case 0:
                Function0 function0 = (Function0) obj;
                p1.o oVar = (p1.o) obj2;
                int iIntValue = ((Number) obj3).intValue();
                if ((iIntValue & 6) == 0) {
                    iIntValue |= ((p1.t) oVar).h(function0) ? 4 : 2;
                }
                if ((iIntValue & 19) == 18) {
                    p1.t tVar = (p1.t) oVar;
                    if (tVar.E()) {
                        tVar.V();
                    } else {
                        p7.u.t(function0, oVar, iIntValue & 14);
                    }
                }
                break;
            default:
                Function0 function02 = (Function0) obj;
                p1.o oVar2 = (p1.o) obj2;
                int iIntValue2 = ((Number) obj3).intValue();
                if ((iIntValue2 & 6) == 0) {
                    iIntValue2 |= ((p1.t) oVar2).h(function02) ? 4 : 2;
                }
                if ((iIntValue2 & 19) == 18) {
                    p1.t tVar2 = (p1.t) oVar2;
                    if (tVar2.E()) {
                        tVar2.V();
                    } else {
                        p6.f.d(function02, oVar2, iIntValue2 & 14);
                    }
                }
                break;
        }
        return Unit.f71706a;
    }
}
