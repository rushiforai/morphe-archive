package t00;

import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import com.amplitude.core.events.Plan;
import com.stripe.android.ui.core.elements.CashAppPayMandateTextSpec;
import com.stripe.android.ui.core.elements.FormItemSpec;
import com.stripe.android.ui.core.elements.MandateTextSpec;
import com.stripe.android.uicore.elements.IdentifierSpec;
import com.teslacoilsw.launcher.NovaLauncher;
import java.util.List;
import java.util.ListIterator;
import java.util.Locale;
import java.util.Set;
import kotlin.Pair;
import kotlin.Unit;
import kotlin.collections.MapsKt;
import kotlin.coroutines.Continuation;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import mx.e0;
import p1.e1;
import p1.s2;
import t70.m0;
import t70.y0;
import tx.d1;
import tx.q2;

/* loaded from: classes4.dex */
public final /* synthetic */ class s implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f88402a;

    public /* synthetic */ s(int i5) {
        this.f88402a = i5;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r2v0, types: [kotlin.coroutines.Continuation] */
    /* JADX WARN: Type inference failed for: r2v4, types: [java.lang.String] */
    /* JADX WARN: Type inference failed for: r2v9 */
    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        String str;
        String string = 0;
        string = 0;
        Object obj3 = null;
        int i5 = 0;
        switch (this.f88402a) {
            case 0:
                ((Integer) obj).intValue();
                return obj2;
            case 1:
                Integer num = (Integer) obj;
                num.intValue();
                return num;
            case 2:
                a0 a0Var = (a0) obj2;
                Integer numValueOf = Integer.valueOf(a0Var.f88321f.f75397e.c());
                Integer numValueOf2 = Integer.valueOf(a0Var.f88321f.f75397e.d());
                String strF = a0Var.f();
                Boolean bool = (Boolean) ((s2) ((e1) a0Var.f12805c)).getValue();
                bool.booleanValue();
                return ul.b.Q(numValueOf, numValueOf2, strF, bool);
            case 3:
                c0 c0Var = (c0) obj2;
                Integer numValueOf3 = Integer.valueOf(c0Var.f88332e.h());
                Integer numValueOf4 = Integer.valueOf(c0Var.f88333f);
                String strF2 = c0Var.f();
                Boolean bool2 = (Boolean) ((s2) ((e1) c0Var.f12805c)).getValue();
                bool2.booleanValue();
                return ul.b.Q(numValueOf3, numValueOf4, strF2, bool2);
            case 4:
                io.p pVar = (io.p) obj;
                if (((Boolean) obj2).booleanValue()) {
                    y70.d dVar = d1.f89692c;
                    a80.e eVar = y0.f88884a;
                    m0.t(dVar, a80.d.f488c, null, new e0(pVar, (Continuation) string, 25), 2);
                }
                return Unit.f71706a;
            case 5:
                String str2 = (String) obj2;
                NovaLauncher novaLauncher = NovaLauncher.f45649u1;
                if (novaLauncher != null && tx.p.b()) {
                    try {
                        String string2 = novaLauncher.getPackageManager().getApplicationLabel(novaLauncher.getPackageManager().getApplicationInfo(str2, 0)).toString();
                        try {
                            CharSequence categoryTitle = ApplicationInfo.getCategoryTitle(novaLauncher, novaLauncher.getPackageManager().getApplicationInfo(str2, 0).category);
                            if (categoryTitle != null) {
                                string = categoryTitle.toString();
                            }
                        } catch (Exception unused) {
                        }
                        if (string != 0) {
                            str = " [" + string + "]";
                        } else {
                            str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                        }
                        fo.d.f().addTriggeredQuery("User just installed " + string2 + " (" + str2 + ")" + str + ". Help them get started — suggest setup tips, useful features, or where to place it on their homescreen.", 172800000L, "app_install");
                        zy.c cVar = zy.c.f98823a;
                        zy.c.i("ai_app_install_triggered", b70.k.e0(new Pair("package", str2)));
                    } catch (PackageManager.NameNotFoundException | Exception unused2) {
                    }
                }
                return Unit.f71706a;
            case 6:
                ((Boolean) obj).booleanValue();
                ((Boolean) obj2).booleanValue();
                u00.t.c();
                return Unit.f71706a;
            case 7:
                ((Boolean) obj).booleanValue();
                ((Boolean) obj2).booleanValue();
                u00.t.c();
                return Unit.f71706a;
            case 8:
                ((Integer) obj).intValue();
                return ((u00.u) obj2).f90318c;
            case 9:
                return Unit.f71706a;
            case 10:
                return Unit.f71706a;
            case 11:
                Set cardBillingIdentifiers = (Set) obj;
                Set externalHiddenIdentifiers = (Set) obj2;
                Intrinsics.g(cardBillingIdentifiers, "cardBillingIdentifiers");
                Intrinsics.g(externalHiddenIdentifiers, "externalHiddenIdentifiers");
                return b70.n.b0(externalHiddenIdentifiers, cardBillingIdentifiers);
            case 12:
                Set hiddenIds = (Set) obj;
                List textFieldControllerIds = (List) obj2;
                Intrinsics.g(hiddenIds, "hiddenIds");
                Intrinsics.g(textFieldControllerIds, "textFieldControllerIds");
                ListIterator listIterator = textFieldControllerIds.listIterator(textFieldControllerIds.size());
                while (true) {
                    if (listIterator.hasPrevious()) {
                        Object objPrevious = listIterator.previous();
                        if (!hiddenIds.contains((IdentifierSpec) objPrevious)) {
                            obj3 = objPrevious;
                        }
                    }
                }
                return (IdentifierSpec) obj3;
            case 13:
                FormItemSpec formItemSpec = (FormItemSpec) obj;
                FormItemSpec formItemSpec2 = (FormItemSpec) obj2;
                if ((formItemSpec instanceof MandateTextSpec) || (formItemSpec instanceof CashAppPayMandateTextSpec)) {
                    i5 = 1;
                } else if ((formItemSpec2 instanceof MandateTextSpec) || (formItemSpec2 instanceof CashAppPayMandateTextSpec)) {
                    i5 = -1;
                }
                return Integer.valueOf(i5);
            case 14:
                ((Integer) obj2).getClass();
                ux.o.e((p1.o) obj, p1.a0.l(1));
                return Unit.f71706a;
            case 15:
                ((Integer) obj2).getClass();
                ux.q.a((p1.o) obj, p1.a0.l(1));
                return Unit.f71706a;
            case 16:
                ((Integer) obj2).getClass();
                ux.t.e((p1.o) obj, p1.a0.l(1));
                return Unit.f71706a;
            case 17:
                ((Integer) obj2).getClass();
                ux.z.g((p1.o) obj, p1.a0.l(1));
                return Unit.f71706a;
            case 18:
                ((Integer) obj2).getClass();
                v00.f.b((p1.o) obj, p1.a0.l(1));
                return Unit.f71706a;
            case 19:
                ((Integer) obj2).getClass();
                v00.f.d((p1.o) obj, p1.a0.l(1));
                return Unit.f71706a;
            case 20:
                ((Integer) obj2).getClass();
                v00.f.a((p1.o) obj, p1.a0.l(1));
                return Unit.f71706a;
            case 21:
                zy.c cVar2 = zy.c.f98823a;
                Pair pair = new Pair(Plan.AMP_PLAN_SOURCE, "search_settings");
                String lowerCase = ((q2) obj2).name().toLowerCase(Locale.ROOT);
                Intrinsics.f(lowerCase, "toLowerCase(...)");
                zy.c.i("ai_search_mode_changed", MapsKt.j0(pair, new Pair("mode", lowerCase)));
                return Unit.f71706a;
            case 22:
                ((Integer) obj2).getClass();
                w00.t.b((p1.o) obj, p1.a0.l(1));
                return Unit.f71706a;
            case 23:
                ((Integer) obj2).getClass();
                p6.u.a((p1.o) obj, p1.a0.l(1));
                return Unit.f71706a;
            case 24:
                ((Integer) obj2).getClass();
                p3.i.k((p1.o) obj, p1.a0.l(1));
                return Unit.f71706a;
            case 25:
                ((Integer) obj2).getClass();
                ys.p.c((p1.o) obj, p1.a0.l(1));
                return Unit.f71706a;
            default:
                return c0.f.i(300, 0, c0.b0.f18710a, 2);
        }
    }

    public /* synthetic */ s(int i5, int i11) {
        this.f88402a = i11;
    }
}
