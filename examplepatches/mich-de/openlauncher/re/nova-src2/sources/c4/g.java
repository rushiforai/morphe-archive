package c4;

import java.util.ArrayList;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;
import z2.h1;
import z2.i1;

/* loaded from: classes2.dex */
public final class g extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f19596j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ ArrayList f19597k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ g(ArrayList arrayList, int i5) {
        super(1);
        this.f19596j = i5;
        this.f19597k = arrayList;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f19596j) {
            case 0:
                h1 h1Var = (h1) obj;
                ArrayList arrayList = this.f19597k;
                int size = arrayList.size();
                for (int i5 = 0; i5 < size; i5++) {
                    h1.m(h1Var, (i1) arrayList.get(i5), 0, 0);
                }
                break;
            case 1:
                h1 h1Var2 = (h1) obj;
                ArrayList arrayList2 = this.f19597k;
                int iK = ul.b.K(arrayList2);
                if (iK >= 0) {
                    int i11 = 0;
                    while (true) {
                        h1.m(h1Var2, (i1) arrayList2.get(i11), 0, 0);
                        if (i11 != iK) {
                            i11++;
                        }
                    }
                }
                break;
            default:
                h1 h1Var3 = (h1) obj;
                ArrayList arrayList3 = this.f19597k;
                int size2 = arrayList3.size();
                for (int i12 = 0; i12 < size2; i12++) {
                    h1.n(h1Var3, (i1) arrayList3.get(i12), 0, 0);
                }
                break;
        }
        return Unit.f71706a;
    }
}
