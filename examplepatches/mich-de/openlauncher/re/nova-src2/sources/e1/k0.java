package e1;

import java.util.ArrayList;
import java.util.List;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import org.json.JSONException;
import org.json.JSONObject;
import z2.i1;

/* loaded from: classes2.dex */
public final /* synthetic */ class k0 implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f51319a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ ArrayList f51320b;

    public /* synthetic */ k0(ArrayList arrayList, int i5) {
        this.f51319a = i5;
        this.f51320b = arrayList;
    }

    /* JADX WARN: Removed duplicated region for block: B:36:0x00fd  */
    @Override // kotlin.jvm.functions.Function1
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj) throws JSONException {
        switch (this.f51319a) {
            case 0:
                z2.h1 h1Var = (z2.h1) obj;
                ArrayList arrayList = this.f51320b;
                int size = arrayList.size();
                for (int i5 = 0; i5 < size; i5++) {
                    h1Var.i((i1) arrayList.get(i5), 0, 0, 0.0f);
                }
                break;
            case 1:
                u10.e0 e0Var = ((e20.k) obj).f52041c;
                if (e0Var instanceof u10.p0) {
                    boolean z11 = !this.f51320b.contains(((u10.p0) e0Var).f90407d);
                }
                break;
            case 2:
                JSONObject jSONObject = ((JSONObject) obj).getJSONObject("node");
                break;
            case 3:
                String it = (String) obj;
                Intrinsics.g(it, "it");
                this.f51320b.add(it);
                break;
            case 4:
                String it2 = (String) obj;
                Intrinsics.g(it2, "it");
                this.f51320b.add(it2);
                break;
            case 5:
                z2.h1 h1Var2 = (z2.h1) obj;
                ArrayList arrayList2 = this.f51320b;
                int size2 = arrayList2.size();
                int i11 = 0;
                while (i11 < size2) {
                    p0.f fVar = (p0.f) arrayList2.get(i11);
                    List list = fVar.f81155b;
                    boolean z12 = fVar.f81160g;
                    if (fVar.f81164k == Integer.MIN_VALUE) {
                        j0.b.a("position() should be called first");
                    }
                    int size3 = list.size();
                    int i12 = 0;
                    while (i12 < size3) {
                        i1 i1Var = (i1) list.get(i12);
                        int[] iArr = fVar.f81162i;
                        int i13 = i12 * 2;
                        int i14 = i11;
                        long jD = y3.k.d((iArr[i13 + 1] & 4294967295L) | (iArr[i13] << 32), fVar.f81156c);
                        if (z12) {
                            z2.h1.x(h1Var2, i1Var, jD);
                        } else {
                            z2.h1.o(h1Var2, i1Var, jD);
                        }
                        i12++;
                        i11 = i14;
                    }
                    i11++;
                }
                break;
            default:
                z2.h1 h1Var3 = (z2.h1) obj;
                ArrayList arrayList3 = this.f51320b;
                int size4 = arrayList3.size();
                for (int i15 = 0; i15 < size4; i15++) {
                    z2.h1.m(h1Var3, (i1) arrayList3.get(i15), 0, 0);
                }
                break;
        }
        return Unit.f71706a;
    }
}
