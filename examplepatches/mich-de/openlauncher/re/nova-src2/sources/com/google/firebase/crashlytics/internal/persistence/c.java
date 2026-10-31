package com.google.firebase.crashlytics.internal.persistence;

import com.android.launcher3.model.WidgetItem;
import com.android.launcher3.widget.LauncherAppWidgetProviderInfo;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.g;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.l;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.y;
import fe.k0;
import io.sentry.q0;
import java.io.File;
import java.time.DayOfWeek;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import n0.g0;
import tf.k;
import tf.n;
import tf.o;
import vf.d0;
import xk.e0;
import xk.l2;

/* loaded from: classes3.dex */
public final /* synthetic */ class c implements Comparator {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f34738a;

    public /* synthetic */ c(int i5) {
        this.f34738a = i5;
    }

    @Override // java.util.Comparator
    public final int compare(Object obj, Object obj2) {
        switch (this.f34738a) {
            case 0:
                return CrashlyticsReportPersistence.oldestEventFileFirst((File) obj, (File) obj2);
            case 1:
                return g.a((y) obj, (y) obj2);
            case 2:
                return g.a((l) obj, (l) obj2);
            case 3:
                if (obj == obj2) {
                    return 0;
                }
                if (obj == null) {
                    return 1;
                }
                if (obj2 == null) {
                    return -1;
                }
                return ((Comparable) obj).compareTo((Comparable) obj2);
            case 4:
                return String.valueOf(obj).compareTo(String.valueOf(obj2));
            case 5:
                DayOfWeek[] dayOfWeekArrValues = DayOfWeek.values();
                int iF0 = kotlin.collections.c.F0(DayOfWeek.SUNDAY, dayOfWeekArrValues);
                return Intrinsics.h(((((DayOfWeek) obj).ordinal() - iF0) + dayOfWeekArrValues.length) % dayOfWeekArrValues.length, ((((DayOfWeek) obj2).ordinal() - iF0) + dayOfWeekArrValues.length) % dayOfWeekArrValues.length);
            case 6:
                WidgetItem widgetItem = (WidgetItem) obj;
                WidgetItem widgetItem2 = (WidgetItem) obj2;
                LauncherAppWidgetProviderInfo launcherAppWidgetProviderInfo = widgetItem.f21171d;
                if (launcherAppWidgetProviderInfo != null && widgetItem2.f21171d == null) {
                    return -1;
                }
                if (launcherAppWidgetProviderInfo != null || widgetItem2.f21171d == null) {
                    int i5 = widgetItem.f21174g;
                    int i11 = widgetItem2.f21174g;
                    if (i5 == i11) {
                        int i12 = widgetItem.f21175h;
                        int i13 = widgetItem2.f21175h;
                        if (i12 == i13) {
                            return 0;
                        }
                        if (i12 <= i13) {
                            return -1;
                        }
                    } else if (i5 <= i11) {
                        return -1;
                    }
                }
                return 1;
            case 7:
                q0 q0Var = (q0) obj;
                q0 q0Var2 = (q0) obj2;
                int iCompareTo = q0Var.r().compareTo(q0Var2.r());
                return iCompareTo != 0 ? iCompareTo : q0Var.o().f67353b.f67386a.compareTo(q0Var2.o().f67353b.f67386a);
            case 8:
                return Long.compare(((File) obj).lastModified(), ((File) obj2).lastModified());
            case 9:
                x60.e eVarQ = ((dc0.b) ((jc0.c) obj).f69435a).q();
                x60.e eVarQ2 = ((dc0.b) ((jc0.c) obj2).f69435a).q();
                dc0.b bVar = (dc0.b) eVarQ;
                String str = bVar.f49218b;
                dc0.b bVar2 = (dc0.b) eVarQ2;
                String str2 = bVar2.f49218b;
                return (str == null || str2 == null) ? bVar.toString().compareTo(bVar2.toString()) : str.compareTo(str2);
            case 10:
                return Integer.compare(((kf.d) obj2).f71482b, ((kf.d) obj).f71482b);
            case 11:
                return Intrinsics.h(((g0) obj).getIndex(), ((g0) obj2).getIndex());
            case 12:
                return Integer.compare(((o9.g0) obj).f79840a, ((o9.g0) obj2).f79840a);
            case 13:
                return Integer.compare(((sf.d) obj).f87389a.f87392b, ((sf.d) obj2).f87389a.f87392b);
            case 14:
                return Long.compare(((sf.c) obj).f87386b, ((sf.c) obj2).f87386b);
            case 15:
                return ((k0) obj2).f54879h - ((k0) obj).f54879h;
            case 16:
                Integer num = (Integer) obj;
                Integer num2 = (Integer) obj2;
                if (num.intValue() == -1) {
                    return num2.intValue() == -1 ? 0 : -1;
                }
                if (num2.intValue() == -1) {
                    return 1;
                }
                return num.intValue() - num2.intValue();
            case 17:
                l2 l2Var = o.n;
                return 0;
            case 18:
                List list = (List) obj;
                List list2 = (List) obj2;
                int i14 = 21;
                int i15 = 22;
                return e0.g(n.c((n) Collections.max(list, new c(i14)), (n) Collections.max(list2, new c(i14)))).a(list.size(), list2.size()).b((n) Collections.max(list, new c(i15)), (n) Collections.max(list2, new c(i15)), new c(i15)).f();
            case 19:
                return ((tf.e) Collections.max((List) obj)).compareTo((tf.e) Collections.max((List) obj2));
            case 20:
                return ((k) ((List) obj).get(0)).compareTo((k) ((List) obj2).get(0));
            case 21:
                return n.c((n) obj, (n) obj2);
            case 22:
                n nVar = (n) obj;
                n nVar2 = (n) obj2;
                boolean z11 = nVar.f89100e;
                int i16 = nVar.f89104i;
                l2 l2VarB = (z11 && nVar.f89103h) ? o.n : o.n.b();
                return xk.g0.f95916a.b(Integer.valueOf(i16), Integer.valueOf(nVar2.f89104i), nVar.f89101f.f89173w ? o.n.b() : o.o).b(Integer.valueOf(nVar.f89105j), Integer.valueOf(nVar2.f89105j), l2VarB).b(Integer.valueOf(i16), Integer.valueOf(nVar2.f89104i), l2VarB).f();
            case 23:
                return ((d0) obj).f92652a - ((d0) obj2).f92652a;
            case 24:
                return Float.compare(((d0) obj).f92654c, ((d0) obj2).f92654c);
            default:
                byte[] bArr = (byte[]) obj;
                byte[] bArr2 = (byte[]) obj2;
                if (bArr.length != bArr2.length) {
                    return bArr.length - bArr2.length;
                }
                for (int i17 = 0; i17 < bArr.length; i17++) {
                    byte b11 = bArr[i17];
                    byte b12 = bArr2[i17];
                    if (b11 != b12) {
                        return b11 - b12;
                    }
                }
                return 0;
        }
    }
}
