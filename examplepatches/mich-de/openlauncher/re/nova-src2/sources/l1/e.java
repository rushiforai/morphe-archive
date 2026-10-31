package l1;

import java.util.ArrayList;
import java.util.List;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class e extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ ArrayList f73213j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ z2.t0 f73214k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ int f73215l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ ArrayList f73216m;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e(ArrayList arrayList, z2.t0 t0Var, int i5, ArrayList arrayList2) {
        super(1);
        float f11 = l.f73568a;
        this.f73213j = arrayList;
        this.f73214k = t0Var;
        this.f73215l = i5;
        this.f73216m = arrayList2;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        z2.t0 t0Var;
        z2.h1 h1Var = (z2.h1) obj;
        float f11 = l.f73570c;
        ArrayList arrayList = this.f73213j;
        int size = arrayList.size();
        for (int i5 = 0; i5 < size; i5++) {
            List list = (List) arrayList.get(i5);
            int size2 = list.size();
            int[] iArr = new int[size2];
            int i11 = 0;
            while (true) {
                t0Var = this.f73214k;
                if (i11 >= size2) {
                    break;
                }
                iArr[i11] = ((z2.i1) list.get(i11)).f98081a + (i11 < ul.b.K(list) ? t0Var.mo96roundToPx0680j_4(f11) : 0);
                i11++;
            }
            k0.g gVar = k0.k.f70656b;
            int[] iArr2 = new int[size2];
            for (int i12 = 0; i12 < size2; i12++) {
                iArr2[i12] = 0;
            }
            gVar.k(t0Var, this.f73215l, iArr, t0Var.getLayoutDirection(), iArr2);
            int size3 = list.size();
            for (int i13 = 0; i13 < size3; i13++) {
                h1Var.i((z2.i1) list.get(i13), iArr2[i13], ((Number) this.f73216m.get(i5)).intValue(), 0.0f);
            }
        }
        return Unit.f71706a;
    }
}
