package aa;

import com.android.launcher3.dragndrop.AddItemActivity;
import com.android.launcher3.model.WidgetItem;
import com.android.launcher3.widget.LauncherAppWidgetProviderInfo;
import com.teslacoilsw.launcher.preferences.AddAppDrawerActivity;
import java.math.BigDecimal;
import java.util.function.Supplier;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final /* synthetic */ class q implements Supplier {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f643a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f644b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f645c;

    public /* synthetic */ q(int i5, Object obj, Object obj2) {
        this.f643a = i5;
        this.f644b = obj;
        this.f645c = obj2;
    }

    @Override // java.util.function.Supplier
    public final Object get() {
        switch (this.f643a) {
            case 0:
                d0 d0Var = (d0) this.f644b;
                ga.f fVar = (ga.f) this.f645c;
                d0Var.getClass();
                if (!(fVar instanceof s10.d) || fVar.f57307u == null || !fVar.f57303q.a()) {
                    if ((fVar instanceof ga.a) || (fVar instanceof ga.j)) {
                        d0Var.t(fVar, false);
                    } else if (fVar instanceof ga.h) {
                        d0Var.u((ga.h) fVar, false);
                    }
                }
                return fVar;
            case 1:
                AddAppDrawerActivity addAppDrawerActivity = (AddAppDrawerActivity) this.f645c;
                d0 d0Var2 = (d0) this.f644b;
                ja.e eVar = addAppDrawerActivity.S;
                if (eVar != null) {
                    return new WidgetItem(eVar, d0Var2, addAppDrawerActivity.getPackageManager());
                }
                Intrinsics.m("shortcutInfo");
                throw null;
            case 2:
                return "arccot: ARGUMENT=" + ((BigDecimal) this.f644b) + " (nearZero=" + ((BigDecimal) this.f645c) + ")";
            default:
                AddItemActivity addItemActivity = (AddItemActivity) this.f644b;
                return new WidgetItem((LauncherAppWidgetProviderInfo) this.f645c, addItemActivity.F, addItemActivity.E.f80135d);
        }
    }

    public /* synthetic */ q(AddAppDrawerActivity addAppDrawerActivity, d0 d0Var) {
        this.f643a = 1;
        this.f645c = addAppDrawerActivity;
        this.f644b = d0Var;
    }
}
