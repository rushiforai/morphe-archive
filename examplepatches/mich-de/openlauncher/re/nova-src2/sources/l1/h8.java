package l1;

import java.util.ArrayList;
import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class h8 extends Lambda implements Function2 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f73400j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ Function3 f73401k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ ArrayList f73402l;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ h8(Function3 function3, ArrayList arrayList, int i5) {
        super(2);
        this.f73400j = i5;
        this.f73401k = function3;
        this.f73402l = arrayList;
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x0020  */
    /* JADX WARN: Removed duplicated region for block: B:19:0x004a  */
    @Override // kotlin.jvm.functions.Function2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f73400j) {
            case 0:
                p1.o oVar = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar = (p1.t) oVar;
                    if (tVar.E()) {
                        tVar.V();
                    } else {
                        this.f73401k.invoke(this.f73402l, oVar, 0);
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
                        this.f73401k.invoke(this.f73402l, oVar2, 0);
                    }
                }
                break;
        }
        return Unit.f71706a;
    }
}
