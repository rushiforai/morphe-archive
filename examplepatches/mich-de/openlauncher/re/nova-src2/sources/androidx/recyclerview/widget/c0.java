package androidx.recyclerview.widget;

import ads_mobile_sdk.kl2;
import java.util.Comparator;
import java.util.Map;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class c0 implements Comparator {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f14919a;

    public /* synthetic */ c0(int i5) {
        this.f14919a = i5;
    }

    /* JADX WARN: Code restructure failed: missing block: B:40:0x00c4, code lost:
    
        if (r0 == null) goto L46;
     */
    /* JADX WARN: Code restructure failed: missing block: B:44:0x00cd, code lost:
    
        if (r0 != false) goto L45;
     */
    /* JADX WARN: Code restructure failed: missing block: B:45:0x00cf, code lost:
    
        return -1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:59:?, code lost:
    
        return 1;
     */
    @Override // java.util.Comparator
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final int compare(Object obj, Object obj2) {
        switch (this.f14919a) {
            case 0:
                e0 e0Var = (e0) obj;
                e0 e0Var2 = (e0) obj2;
                RecyclerView recyclerView = e0Var.f14935d;
                if ((recyclerView == null) == (e0Var2.f14935d == null)) {
                    boolean z11 = e0Var.f14932a;
                    if (z11 == e0Var2.f14932a) {
                        int i5 = e0Var2.f14933b - e0Var.f14933b;
                        if (i5 != 0) {
                            return i5;
                        }
                        int i11 = e0Var.f14934c - e0Var2.f14934c;
                        if (i11 != 0) {
                            return i11;
                        }
                        return 0;
                    }
                }
                break;
            case 1:
                return ab.e0.t(String.valueOf(((Boolean) obj).booleanValue()), String.valueOf(((Boolean) obj2).booleanValue()));
            case 2:
                return ab.e0.t((String) ((Map.Entry) obj).getKey(), (String) ((Map.Entry) obj2).getKey());
            case 3:
                return ab.e0.t(Double.valueOf(((kl2) obj2).f5769a.f5297a.e()), Double.valueOf(((kl2) obj).f5769a.f5297a.e()));
            case 4:
                return ((c30.a) obj2).b() - ((c30.a) obj).b();
            case 5:
                return ((Comparable) obj).compareTo((Comparable) obj2);
            default:
                ga.e eVar = (ga.e) obj;
                ga.e eVar2 = (ga.e) obj2;
                int i12 = eVar.f57299k;
                if ((i12 == -1 || eVar2.f57299k == -1) && eVar2.f57299k != i12) {
                    return i12 == -1 ? -1 : 1;
                }
                int i13 = eVar2.f57299k;
                if (i12 != i13) {
                    return Integer.compare(i12, i13);
                }
                if (eVar.f57294f.equals(eVar2.f57294f)) {
                    return Intrinsics.h(eVar.f57293e.f77777a, eVar2.f57293e.f77777a);
                }
                return Intrinsics.h(eVar.f57294f.f77777a, eVar2.f57294f.f77777a);
        }
    }
}
