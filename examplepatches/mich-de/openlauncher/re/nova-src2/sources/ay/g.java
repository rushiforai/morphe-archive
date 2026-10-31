package ay;

import ab.e0;
import android.content.pm.ResolveInfo;
import h10.a1;
import hv.z1;
import java.util.Comparator;
import kotlin.Pair;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class g implements Comparator {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f15749a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f15750b;

    public /* synthetic */ g(Object obj, int i5) {
        this.f15749a = i5;
        this.f15750b = obj;
    }

    @Override // java.util.Comparator
    public final int compare(Object obj, Object obj2) {
        switch (this.f15749a) {
            case 0:
                return ((Number) ((f) this.f15750b).invoke(obj, obj2)).intValue();
            case 1:
                return ((Number) ((f) this.f15750b).invoke(obj, obj2)).intValue();
            case 2:
                for (Function1 function1 : (Function1[]) this.f15750b) {
                    int iT = e0.t((Comparable) function1.invoke(obj), (Comparable) function1.invoke(obj2));
                    if (iT != 0) {
                        return iT;
                    }
                }
                return 0;
            case 3:
                y9.i iVar = (y9.i) this.f15750b;
                Pair pair = (Pair) obj;
                Pair pair2 = (Pair) obj2;
                Object obj3 = pair.f71683a;
                Object obj4 = pair.f71684b;
                Object obj5 = pair2.f71683a;
                Object obj6 = pair2.f71684b;
                int iB = iVar.b((String) obj3, (String) obj5);
                if (iB == 0) {
                    iB = ((ResolveInfo) obj4).activityInfo.packageName.compareTo(((ResolveInfo) obj6).activityInfo.packageName);
                }
                return iB == 0 ? ((ResolveInfo) obj4).activityInfo.name.compareTo(((ResolveInfo) obj6).activityInfo.name) : iB;
            case 4:
                fl.l lVar = (fl.l) this.f15750b;
                fc0.e eVar = (fc0.e) obj;
                fc0.e eVar2 = (fc0.e) obj2;
                return (!eVar.a() ? !(!eVar2.a() && ((hc0.a) lVar.f55374b).f59609b.a(eVar, eVar2)) : !(!eVar2.a() || ((hc0.a) lVar.f55376d).f59609b.b(eVar, eVar2))) ? -1 : 1;
            case 5:
                return ((Number) ((Function2) this.f15750b).invoke(obj, obj2)).intValue();
            case 6:
                return ((Number) ((f) this.f15750b).invoke(obj, obj2)).intValue();
            case 7:
                return ((Number) ((a1) this.f15750b).invoke(obj, obj2)).intValue();
            case 8:
                return ((Number) ((z1) this.f15750b).invoke(obj, obj2)).intValue();
            case 9:
                return ((Number) ((t00.s) this.f15750b).invoke(obj, obj2)).intValue();
            default:
                we.r rVar = (we.r) this.f15750b;
                return rVar.h(obj2) - rVar.h(obj);
        }
    }
}
