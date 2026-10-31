package b3;

import androidx.compose.ui.node.LayoutNode;
import com.google.firebase.crashlytics.internal.persistence.CrashlyticsReportPersistence;
import com.teslacoilsw.launcher.search.AppSearchResultsView;
import java.io.File;
import java.util.Comparator;
import java.util.Map;
import kotlin.Pair;
import kotlin.jvm.internal.Intrinsics;
import nova.branch.engage.sesame_lite.internal.DataImporters;

/* loaded from: classes.dex */
public final /* synthetic */ class h0 implements Comparator {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f17229a;

    public /* synthetic */ h0(int i5) {
        this.f17229a = i5;
    }

    @Override // java.util.Comparator
    public final int compare(Object obj, Object obj2) {
        switch (this.f17229a) {
            case 0:
                return LayoutNode.ZComparator$lambda$42((LayoutNode) obj, (LayoutNode) obj2);
            case 1:
                return CrashlyticsReportPersistence.lambda$static$0((File) obj, (File) obj2);
            case 2:
                ga.e eVar = (ga.e) obj;
                ga.e eVar2 = (ga.e) obj2;
                int i5 = eVar.f57291c;
                int i11 = eVar2.f57291c;
                if (i5 != i11) {
                    return Integer.compare(i5, i11);
                }
                if (i5 == -101) {
                    return Integer.compare(eVar.f57292d, eVar2.f57292d);
                }
                if (i5 != -100) {
                    return 0;
                }
                int i12 = eVar.f57292d;
                int i13 = eVar2.f57292d;
                if (i12 != i13) {
                    return Integer.compare(i12, i13);
                }
                n30.a aVar = eVar.f57294f;
                n30.a aVar2 = eVar2.f57294f;
                if (aVar != aVar2) {
                    return Intrinsics.h(aVar.f77777a, aVar2.f77777a);
                }
                return Intrinsics.h(eVar.f57293e.f77777a, eVar2.f57293e.f77777a);
            case 3:
                return Integer.compare(((ga.e) obj).f57291c, ((ga.e) obj2).f57291c);
            case 4:
                ga.a aVar3 = (ga.a) obj;
                ga.a aVar4 = (ga.a) obj2;
                int iHashCode = aVar3.o.hashCode() - aVar4.o.hashCode();
                return iHashCode != 0 ? iHashCode : aVar3.i().compareTo(aVar4.i());
            case 5:
                return ((Long) ((Map.Entry) obj2).getValue()).compareTo((Long) ((Map.Entry) obj).getValue());
            case 6:
                return Intrinsics.h(((n0.f1) obj2).a(), ((n0.f1) obj).a());
            case 7:
                Pair pair = (Pair) obj;
                Pair pair2 = (Pair) obj2;
                return (((Number) pair.f71684b).intValue() - ((Number) pair.f71683a).intValue()) - (((Number) pair2.f71684b).intValue() - ((Number) pair2.f71683a).intValue());
            case 8:
                return DataImporters.pullContacts$lambda$35((DataImporters.PhoneNumber) obj, (DataImporters.PhoneNumber) obj2);
            case 9:
                return DataImporters.pullContacts$lambda$36((DataImporters.EmailAddr) obj, (DataImporters.EmailAddr) obj2);
            case 10:
                return Intrinsics.h(((p1.t0) obj).f81578b, ((p1.t0) obj2).f81578b);
            case 11:
                ga.a aVar5 = (ga.a) obj;
                ga.a aVar6 = (ga.a) obj2;
                h0 h0Var = AppSearchResultsView.f46177o0;
                long j11 = aVar5.A;
                long j12 = AppSearchResultsView.f46176n0;
                if (j11 <= j12) {
                    if (aVar6.A > j12) {
                        return 1;
                    }
                    return Intrinsics.i(aVar6.B, aVar5.B);
                }
                long j13 = aVar6.A;
                if (j13 > j12) {
                    return Intrinsics.i(j13, j11);
                }
                return -1;
            default:
                return ((u9.a) obj).f87442b.compareToIgnoreCase(((u9.a) obj2).f87442b);
        }
    }
}
