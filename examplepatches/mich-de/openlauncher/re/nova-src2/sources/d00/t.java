package d00;

import android.app.Activity;
import android.appwidget.AppWidgetHostView;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.util.TypedValue;
import android.view.ViewGroup;
import com.stripe.android.attestation.AttestationActivity;
import com.stripe.android.attestation.AttestationArgs;
import com.teslacoilsw.launcher.NovaApplication;
import com.teslacoilsw.launcher.preferences.IconLayoutSettingsActivity;
import com.teslacoilsw.launcher.preferences.NovaSettingsSearchActivity;
import com.teslacoilsw.launcher.preferences.SettingsActivity;
import com.teslacoilsw.launcher.preferences.SettingsFolderIcon;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefIconView;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefNumberPickerDialog;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefSummaryListMultiView;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefSummaryListView;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefView;
import com.teslacoilsw.launcher.widget.NumberPicker;
import e0.b1;
import e0.b2;
import e0.e0;
import e0.o1;
import e0.w0;
import es.g0;
import es.z;
import f1.c2;
import f1.o0;
import f1.u1;
import f1.v1;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Set;
import k30.h0;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.math.MathKt;
import p1.s2;
import p1.t1;

/* loaded from: classes4.dex */
public final /* synthetic */ class t implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f48710a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f48711b;

    public /* synthetic */ t(Object obj, int i5) {
        this.f48710a = i5;
        this.f48711b = obj;
    }

    /* JADX WARN: Type inference failed for: r0v42, types: [java.lang.Object, kotlin.Lazy] */
    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() throws Resources.NotFoundException {
        b3.n nVar;
        int i5 = this.f48710a;
        Object obj = this.f48711b;
        switch (i5) {
            case 0:
                ((NovaApplication) obj).registerActivityLifecycleCallbacks(new w());
                return Unit.f71706a;
            case 1:
                y yVar = y.f48721a;
                ((s2) y.f48726f).setValue((s) obj);
                return Unit.f71706a;
            case 2:
                d1.m mVar = (d1.m) obj;
                mVar.f48817l = null;
                b3.o.f(mVar).invalidateSemantics$ui_release();
                b3.o.f(mVar).invalidateMeasurements$ui_release();
                b3.g.d(mVar);
                return Boolean.TRUE;
            case 3:
                AppWidgetHostView appWidgetHostView = (AppWidgetHostView) obj;
                Intrinsics.e(appWidgetHostView, "null cannot be cast to non-null type com.android.launcher3.widget.LauncherAppWidgetHostView");
                ab.o oVar = (ab.o) appWidgetHostView;
                if (oVar.f742s) {
                    oVar.getParent().requestDisallowInterceptTouchEvent(true);
                }
                return Unit.f71706a;
            case 4:
                Function0 function0A = ((ey.u) obj).a();
                if (function0A != null) {
                    function0A.invoke();
                }
                return Unit.f71706a;
            case 5:
                ((ey.m) obj).a();
                return Unit.f71706a;
            case 6:
                return (Activity) obj;
            case 7:
                e0.g gVar = (e0.g) obj;
                w0 w0Var = (w0) b3.g.c(gVar, androidx.compose.foundation.e.f13914a);
                if (!(w0Var instanceof b1)) {
                    j0.b.a("clickable only supports IndicationNodeFactory instances provided to LocalIndication, but Indication was provided instead. Either migrate the Indication implementation to implement IndicationNodeFactory, or use the other clickable overload that takes an Indication parameter, and explicitly pass LocalIndication.current there. You can also use ComposeFoundationFlags.isNonComposedClickableEnabled to temporarily opt-out; note that this flag will be removed in a future release and is only intended to be a temporary migration aid. The Indication instance provided here was: " + w0Var);
                }
                b1 b1Var = gVar.f49988i;
                b1 b1Var2 = (b1) w0Var;
                gVar.f49988i = b1Var2;
                if (b1Var != null && !Intrinsics.b(b1Var2, b1Var) && ((nVar = gVar.f49990k) != null || !gVar.f49994q)) {
                    if (nVar != null) {
                        gVar.undelegate(nVar);
                    }
                    gVar.f49990k = null;
                    gVar.I();
                }
                return Unit.f71706a;
            case 8:
                Function0 function0 = ((e0) obj).f49965u;
                if (function0 != null) {
                    function0.invoke();
                }
                return Boolean.TRUE;
            case 9:
                b2 b2Var = (b2) obj;
                e0.l lVar = (e0.l) b3.g.c(b2Var, o1.f50088a);
                b2Var.f49921k = lVar;
                b2Var.f49922l = lVar != null ? lVar.a() : null;
                return Unit.f71706a;
            case 10:
                ((b10.u) obj).invoke();
                return Unit.f71706a;
            case 11:
                ((h0) obj).f();
                return Unit.f71706a;
            case 12:
                return (sx.n) obj;
            case 13:
                int i11 = IconLayoutSettingsActivity.B;
                return ((IconLayoutSettingsActivity) obj).getResources().getDisplayMetrics();
            case 14:
                int i12 = NovaSettingsSearchActivity.f45964u;
                return (ViewGroup) ((NovaSettingsSearchActivity) obj).findViewById(2131428770);
            case 15:
                SettingsActivity settingsActivity = (SettingsActivity) obj;
                return Boolean.valueOf(settingsActivity.f45975x.a(settingsActivity));
            case 16:
                ?? r02 = ((SettingsFolderIcon) obj).f45984j;
                return Bitmap.createBitmap(((Number) r02.getValue()).intValue(), ((Number) r02.getValue()).intValue(), Bitmap.Config.ARGB_8888);
            case 17:
                z zVar = (z) obj;
                List list = zVar.f53014b;
                ArrayList arrayList = new ArrayList(b70.c.u0(list, 10));
                Iterator it = list.iterator();
                while (it.hasNext()) {
                    arrayList.add(((p6.e) it.next()).f82149a);
                }
                int iD0 = b70.k.d0(b70.c.u0(arrayList, 10));
                if (iD0 < 16) {
                    iD0 = 16;
                }
                LinkedHashMap linkedHashMap = new LinkedHashMap(iD0);
                Iterator it2 = arrayList.iterator();
                while (it2.hasNext()) {
                    Object next = it2.next();
                    linkedHashMap.put(next, "{" + ((String) next) + "}");
                }
                return g0.c(zVar.f53013a, linkedHashMap);
            case 18:
                return ((com.stripe.android.link.l) obj).h();
            case 19:
                Function0 function02 = ((ey.e) obj).f53152d;
                if (function02 != null) {
                    function02.invoke();
                }
                return Unit.f71706a;
            case 20:
                return Float.valueOf(((v1) obj).a().mo102toPx0680j_4(u1.f54015b));
            case 21:
                return Float.valueOf(((y3.c) obj).mo102toPx0680j_4(androidx.compose.material.a.f14084b));
            case 22:
                c2 c2Var = (c2) obj;
                if (!Intrinsics.b(null, c2Var.f53420a)) {
                    b70.d.E0(c2Var.f53421b, new o0(5));
                    t1 t1Var = c2Var.f53422c;
                    if (t1Var != null) {
                        t1Var.c();
                    }
                }
                return Unit.f71706a;
            case 23:
                int i13 = FancyPrefIconView.M;
                TypedValue typedValue = new TypedValue();
                ((FancyPrefIconView) obj).getResources().getValue(2131165424, typedValue, true);
                return Integer.valueOf(MathKt.b(typedValue.getFloat() * 255.0f));
            case 24:
                int i14 = FancyPrefNumberPickerDialog.V;
                return Integer.valueOf(((NumberPicker) obj).f46442l);
            case 25:
                Set set = ((FancyPrefSummaryListMultiView) obj).V;
                if (set != null) {
                    return set;
                }
                Intrinsics.m("dialogValue");
                throw null;
            case 26:
                String str = ((FancyPrefSummaryListView) obj).f46007b0;
                if (str != null) {
                    return str;
                }
                Intrinsics.m("dialogValue");
                throw null;
            case 27:
                int i15 = FancyPrefView.J;
                return ((FancyPrefView) obj).findViewById(2131428643);
            case 28:
                return ((AttestationActivity) obj).o;
            default:
                return ((AttestationArgs) obj).f42462a;
        }
    }
}
