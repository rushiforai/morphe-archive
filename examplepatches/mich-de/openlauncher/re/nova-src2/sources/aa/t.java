package aa;

import ads_mobile_sdk.qw2;
import android.content.ComponentName;
import android.graphics.Rect;
import android.util.Pair;
import com.android.launcher3.CellLayout;
import com.android.launcher3.folder.Folder;
import com.android.launcher3.model.WidgetItem;
import com.android.launcher3.widget.picker.WidgetsListHeader;
import com.google.firebase.crashlytics.internal.persistence.CrashlyticsReportPersistence;
import java.io.File;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.function.Function;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final /* synthetic */ class t implements Function {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f654a;

    public /* synthetic */ t(int i5) {
        this.f654a = i5;
    }

    @Override // java.util.function.Function
    public final Object apply(Object obj) {
        switch (this.f654a) {
            case 0:
                ga.d dVar = (ga.d) obj;
                return Pair.create(dVar.f57281a.o, Boolean.valueOf(dVar.f57286f));
            case 1:
                return ((ga.d) obj).f57281a.i();
            case 2:
                return ((ga.d) obj).f57281a.i();
            case 3:
                return ((ComponentName) obj).flattenToString();
            case 4:
                qw2 it = (qw2) obj;
                Intrinsics.g(it, "it");
                return new AtomicInteger(0);
            case 5:
                qw2 it2 = (qw2) obj;
                Intrinsics.g(it2, "it");
                return new AtomicInteger(0);
            case 6:
                return CrashlyticsReportPersistence.lambda$decorateWithProfilingManagerInfoIfFatal$2((File) obj);
            case 7:
                return ((db.c) obj).f49120a;
            case 8:
                return ya.g0.b((ga.h) obj);
            case 9:
                return (ga.h) obj;
            case 10:
                int i5 = WidgetsListHeader.f21348k;
                return ((WidgetItem) obj).f21173f;
            case 11:
                return ((x60.c) obj).f95120a;
            case 12:
                return fc0.o.y0((x60.c) obj);
            case 13:
                return ((x60.a) obj).f95110a;
            case 14:
                return fc0.o.y0((x60.a) obj);
            case 15:
                return Integer.toString(((Integer) obj).intValue());
            case 16:
                ga.e eVar = (ga.e) obj;
                return eVar.i() == null ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : eVar.i().getPackageName();
            case 17:
                return ((ga.j) obj).M0();
            case 18:
                return ((x60.f) obj).toString();
            case 19:
                return Integer.valueOf(((WidgetItem) obj).f21174g);
            case 20:
                return ((mz.h) obj).f77341a;
            case 21:
                return ((db.d) ((db.c) obj)).f49122c.stream();
            case 22:
                return new p9.g((CellLayout) obj);
            case 23:
                return Long.valueOf(((ya0.c) obj).f97225c);
            case 24:
                return ((o9.l0) obj).n;
            case 25:
                Rect rect = Folder.f21093j0;
                return ((CharSequence) obj).toString();
            case 26:
                return new p9.b((CellLayout) obj);
            case 27:
                return ((ga.j) obj).o;
            case 28:
                return ((ga.j) obj).i();
            default:
                return ((ComponentName) obj).getPackageName();
        }
    }
}
