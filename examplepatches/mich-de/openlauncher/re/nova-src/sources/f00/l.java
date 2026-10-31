package f00;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final class l implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f53298a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ q00.l f53299b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Function2 f53300c;

    public /* synthetic */ l(q00.l lVar, Function2 function2, int i5) {
        this.f53298a = i5;
        this.f53299b = lVar;
        this.f53300c = function2;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f53298a) {
            case 0:
                Enum r32 = (Enum) obj;
                q00.l lVar = this.f53299b;
                Enum r12 = (Enum) lVar.f83363b.getValue();
                lVar.setValue(r32);
                Function2 function2 = this.f53300c;
                if (function2 != null) {
                    function2.invoke(r12, r32);
                }
                break;
            case 1:
                Enum r33 = (Enum) obj;
                q00.l lVar2 = this.f53299b;
                Enum r13 = (Enum) lVar2.f83363b.getValue();
                lVar2.setValue(r33);
                Function2 function22 = this.f53300c;
                if (function22 != null) {
                    function22.invoke(r13, r33);
                }
                break;
            case 2:
                Enum r34 = (Enum) obj;
                q00.l lVar3 = this.f53299b;
                Enum r14 = (Enum) lVar3.f83363b.getValue();
                lVar3.setValue(r34);
                Function2 function23 = this.f53300c;
                if (function23 != null) {
                    function23.invoke(r14, r34);
                }
                break;
            case 3:
                Enum r35 = (Enum) obj;
                q00.l lVar4 = this.f53299b;
                Enum r15 = (Enum) lVar4.f83363b.getValue();
                lVar4.setValue(r35);
                Function2 function24 = this.f53300c;
                if (function24 != null) {
                    function24.invoke(r15, r35);
                }
                break;
            case 4:
                Enum r36 = (Enum) obj;
                q00.l lVar5 = this.f53299b;
                Enum r16 = (Enum) lVar5.f83363b.getValue();
                lVar5.setValue(r36);
                Function2 function25 = this.f53300c;
                if (function25 != null) {
                    function25.invoke(r16, r36);
                }
                break;
            default:
                Enum r37 = (Enum) obj;
                q00.l lVar6 = this.f53299b;
                Enum r17 = (Enum) lVar6.f83363b.getValue();
                lVar6.setValue(r37);
                Function2 function26 = this.f53300c;
                if (function26 != null) {
                    function26.invoke(r17, r37);
                }
                break;
        }
        return Unit.f71706a;
    }
}
