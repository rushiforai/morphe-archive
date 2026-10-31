package q00;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class e implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f83336a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ l f83337b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Function2 f83338c;

    public /* synthetic */ e(Function2 function2, l lVar) {
        this.f83336a = 0;
        this.f83338c = function2;
        this.f83337b = lVar;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        int i5 = this.f83336a;
        Boolean bool = (Boolean) obj;
        bool.getClass();
        switch (i5) {
            case 0:
                l lVar = this.f83337b;
                Boolean bool2 = (Boolean) lVar.f83363b.getValue();
                bool2.booleanValue();
                lVar.setValue(bool);
                Function2 function2 = this.f83338c;
                if (function2 != null) {
                    function2.invoke(bool2, bool);
                }
                break;
            case 1:
                l lVar2 = this.f83337b;
                Boolean bool3 = (Boolean) lVar2.f83363b.getValue();
                bool3.getClass();
                lVar2.setValue(bool);
                Function2 function22 = this.f83338c;
                if (function22 != null) {
                    function22.invoke(bool3, bool);
                }
                break;
            default:
                l lVar3 = this.f83337b;
                Boolean bool4 = (Boolean) lVar3.f83363b.getValue();
                bool4.getClass();
                lVar3.setValue(bool);
                Function2 function23 = this.f83338c;
                if (function23 != null) {
                    function23.invoke(bool4, bool);
                }
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ e(l lVar, Function2 function2, int i5) {
        this.f83336a = i5;
        this.f83337b = lVar;
        this.f83338c = function2;
    }
}
