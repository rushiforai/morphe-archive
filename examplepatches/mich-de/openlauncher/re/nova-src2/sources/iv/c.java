package iv;

import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ShortcutInfo;
import android.net.Uri;
import android.os.UserHandle;
import bn.s0;
import com.android.launcher3.shortcuts.ShortcutKey;
import com.stripe.android.link.LinkAccountUpdate;
import com.stripe.android.link.LinkActivityResult;
import com.stripe.android.model.PaymentMethod;
import com.stripe.android.model.PaymentMethodCreateParams;
import com.stripe.android.paymentsheet.PaymentOptionsActivityResult;
import com.stripe.android.paymentsheet.k;
import com.stripe.android.paymentsheet.model.PaymentSelection;
import com.teslacoilsw.launcher.ChooseActionIntentActivity;
import fs.g0;
import h6.g1;
import h6.u0;
import h6.w;
import java.util.LinkedHashMap;
import java.util.List;
import jr.b0;
import jr.y;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.SuspendFunction;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.FunctionReferenceImpl;
import kotlin.jvm.internal.Intrinsics;
import kw.o1;
import kw.y2;
import kw.z1;
import kw.z2;
import l1.g4;
import mt.l;
import mt.n0;
import mt.t;
import mt.u;
import mt.v;
import mx.e0;
import nova.branch.engage.sesame_lite.internal.State;
import ou.r;
import p10.h2;
import ps.q0;
import pu.q;
import pu.z;
import r80.o;
import r80.p;
import ru.n;
import t70.k0;
import t70.m0;
import t70.t1;
import t70.y0;
import w70.i2;

/* loaded from: classes4.dex */
public final /* synthetic */ class c extends FunctionReferenceImpl implements Function1, SuspendFunction {

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f68118d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ c(int i5, Object obj, Class cls, String str, String str2, int i11, int i12) {
        super(i5, i11, cls, obj, str, str2);
        this.f68118d = i12;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        v lVar;
        Object value;
        int i5 = 6;
        int i11 = 2;
        Object[] objArr = 0;
        Object[] objArr2 = 0;
        Object[] objArr3 = 0;
        Object[] objArr4 = 0;
        Object[] objArr5 = 0;
        switch (this.f68118d) {
            case 0:
                ft.b p02 = (ft.b) obj;
                Intrinsics.g(p02, "p0");
                ru.a aVar = (ru.a) ((ru.d) this.receiver);
                aVar.getClass();
                ru.a.i(aVar, new n(p02));
                return Unit.f71706a;
            case 1:
                fr.a p03 = (fr.a) obj;
                Intrinsics.g(p03, "p0");
                ru.a aVar2 = (ru.a) ((ru.d) this.receiver);
                aVar2.getClass();
                m0.t(k0.a(aVar2.f86343g), null, null, new w(aVar2, p03, objArr == true ? 1 : 0, 24), 3);
                return Unit.f71706a;
            case 2:
                ((kv.c) this.receiver).t((PaymentSelection) obj);
                return Unit.f71706a;
            case 3:
                String p04 = (String) obj;
                Intrinsics.g(p04, "p0");
                ((ru.a) ((ru.d) this.receiver)).r(p04);
                return Unit.f71706a;
            case 4:
                String p05 = (String) obj;
                Intrinsics.g(p05, "p0");
                ((ru.a) ((ru.d) this.receiver)).o(p05);
                return Unit.f71706a;
            case 5:
                String p06 = (String) obj;
                Intrinsics.g(p06, "p0");
                ((ru.f) this.receiver).b(p06);
                return Unit.f71706a;
            case 6:
                Boolean bool = (Boolean) obj;
                bool.getClass();
                kw.v vVar = (kw.v) this.receiver;
                if (!vVar.f72697b) {
                    vVar.f72697b = true;
                }
                i2 i2Var = vVar.f72698c;
                i2Var.getClass();
                i2Var.k(null, bool);
                return Unit.f71706a;
            case 7:
                String p07 = (String) obj;
                Intrinsics.g(p07, "p0");
                o1 o1Var = (o1) this.receiver;
                o1Var.getClass();
                i2 i2Var2 = o1Var.f72523e;
                String strF = ((z1) o1Var.f72529k.f91586b.invoke()).f(p07);
                i2Var2.getClass();
                i2Var2.k(null, strF);
                return Unit.f71706a;
            case 8:
                z2 p08 = (z2) obj;
                Intrinsics.g(p08, "p0");
                ((y2) this.receiver).n(p08);
                return Unit.f71706a;
            case 9:
                mt.i p09 = (mt.i) obj;
                Intrinsics.g(p09, "p0");
                n0 n0Var = (n0) this.receiver;
                if (p09 instanceof mt.g) {
                    u0 u0Var = n0Var.f76792c;
                    u0Var.getClass();
                    s0 s0Var = u0Var.f59455b;
                    s0Var.getClass();
                    ((LinkedHashMap) s0Var.f18279b).remove("AwaitingConfirmationResult");
                    ((LinkedHashMap) s0Var.f18281d).remove("AwaitingConfirmationResult");
                    ((LinkedHashMap) s0Var.f18282e).remove("AwaitingConfirmationResult");
                    if (u0Var.f59454a.remove("AwaitingConfirmationResult") != null) {
                        throw new ClassCastException();
                    }
                    m0.t(n0Var.f76791b, null, null, new g4(n0Var, p09, objArr2 == true ? 1 : 0, i5), 3);
                } else {
                    n0Var.getClass();
                    if (p09 instanceof mt.h) {
                        mt.h hVar = (mt.h) p09;
                        lVar = new u(hVar.f76760a, hVar.f76761b, hVar.f76762c);
                    } else if (p09 instanceof mt.f) {
                        mt.f fVar = (mt.f) p09;
                        lVar = new t(fVar.f76744a, fVar.f76745b, fVar.f76746c);
                    } else {
                        if (!(p09 instanceof mt.e)) {
                            throw new NoWhenBranchMatchedException();
                        }
                        lVar = new l(((mt.e) p09).f76743a);
                    }
                    n0Var.e(lVar);
                }
                return Unit.f71706a;
            case 10:
                ShortcutInfo shortcutInfo = (ShortcutInfo) obj;
                ChooseActionIntentActivity chooseActionIntentActivity = (ChooseActionIntentActivity) this.receiver;
                int i12 = ChooseActionIntentActivity.f45591t;
                chooseActionIntentActivity.getClass();
                CharSequence charSequenceD = cl.k0.D(shortcutInfo);
                Intent intentE = ShortcutKey.e(shortcutInfo);
                UserHandle userHandle = shortcutInfo.getUserHandle();
                Intent intent = new Intent();
                if (intentE != null) {
                    intent.putExtra("android.intent.extra.shortcut.NAME", charSequenceD);
                    intent.putExtra("android.intent.extra.shortcut.INTENT", intentE);
                }
                if (userHandle != null) {
                    intent.putExtra("profile", userHandle);
                }
                chooseActionIntentActivity.setResult(-1, intent);
                chooseActionIntentActivity.finish();
                return Unit.f71706a;
            case 11:
                ChooseActionIntentActivity chooseActionIntentActivity2 = (ChooseActionIntentActivity) this.receiver;
                int i13 = ChooseActionIntentActivity.f45591t;
                chooseActionIntentActivity2.getClass();
                ((ja.f) obj).g(chooseActionIntentActivity2, 58173);
                return Unit.f71706a;
            case 12:
                y p010 = (y) obj;
                Intrinsics.g(p010, "p0");
                ((com.stripe.android.customersheet.d) this.receiver).h(p010);
                return Unit.f71706a;
            case 13:
                String str = (String) obj;
                com.stripe.android.customersheet.d dVar = (com.stripe.android.customersheet.d) this.receiver;
                if (str != null) {
                    ((b0) dVar.f42621j.getValue()).getClass();
                } else {
                    dVar.getClass();
                }
                return zg.a.H(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
            case 14:
                ((r) this.receiver).f80966a.j((rs.j) obj);
                return Unit.f71706a;
            case 15:
                LinkActivityResult p011 = (LinkActivityResult) obj;
                Intrinsics.g(p011, "p0");
                k kVar = (k) this.receiver;
                g0 linkAccountHolder = kVar.D;
                LinkAccountUpdate f42880b = p011.getF42880b();
                if (f42880b != null) {
                    Intrinsics.g(linkAccountHolder, "linkAccountHolder");
                    if (f42880b instanceof LinkAccountUpdate.Value) {
                        linkAccountHolder.a((LinkAccountUpdate.Value) f42880b);
                    } else if (!f42880b.equals(LinkAccountUpdate.None.f42863a)) {
                        throw new NoWhenBranchMatchedException();
                    }
                }
                if (!(p011 instanceof LinkActivityResult.Canceled)) {
                    if (p011 instanceof LinkActivityResult.Failed) {
                        kVar.o(p50.i.w(((LinkActivityResult.Failed) p011).f42879a));
                    } else if (p011 instanceof LinkActivityResult.Completed) {
                        LinkActivityResult.Completed completed = (LinkActivityResult.Completed) p011;
                        kVar.G.c(new PaymentOptionsActivityResult.Succeeded(new PaymentSelection.Link(null, completed.f42876b, completed.f42877c, 1), (LinkAccountUpdate.Value) linkAccountHolder.f55777b.f93973a.getValue(), (List) kVar.f72289z.f80805c.f91586b.invoke()));
                    } else {
                        if (!(p011 instanceof LinkActivityResult.PaymentMethodObtained)) {
                            throw new NoWhenBranchMatchedException();
                        }
                        kVar.o(p50.i.w(new IllegalStateException("PaymentMethodObtained is not expected from authentication only Link flows")));
                    }
                }
                return Unit.f71706a;
            case 16:
                ((kv.c) this.receiver).t((PaymentSelection) obj);
                return Unit.f71706a;
            case 17:
                return ((p10.y) this.receiver).c((Continuation) obj);
            case 18:
                h2 h2Var = ((p10.y) this.receiver).f81968a;
                h2Var.getClass();
                a80.e eVar = y0.f88884a;
                return m0.y(a80.d.f488c, new e0((Object) h2Var, (Continuation) (objArr3 == true ? 1 : 0), 14), (Continuation) obj);
            case 19:
                return Boolean.valueOf(((Number) obj).intValue() >= ((Number) ((p10.y) this.receiver).f81973f.invoke()).intValue());
            case 20:
                return ((p10.y) this.receiver).b((Continuation) obj);
            case 21:
                return ((p10.y) this.receiver).c((Continuation) obj);
            case 22:
                String str2 = (String) obj;
                ((p20.d) this.receiver).getClass();
                if (str2 != null && r70.j.I0(str2, "image_", false)) {
                    while (true) {
                        if (i5 < str2.length()) {
                            int i14 = i5 + 1;
                            if (Character.isDigit(str2.charAt(i5))) {
                                i5 = i14;
                            }
                        } else {
                            z = true;
                        }
                    }
                }
                return Boolean.valueOf(z);
            case 23:
                ew.e p012 = (ew.e) obj;
                Intrinsics.g(p012, "p0");
                z zVar = (z) this.receiver;
                zVar.getClass();
                m0.t(g1.f(zVar), null, null, new q(zVar, p012, objArr4 == true ? 1 : 0, i11), 3);
                return Unit.f71706a;
            case 24:
                ew.e p013 = (ew.e) obj;
                Intrinsics.g(p013, "p0");
                z zVar2 = (z) this.receiver;
                zVar2.getClass();
                m0.t(g1.f(zVar2), null, null, new q(zVar2, p013, objArr5 == true ? 1 : 0, i11), 3);
                return Unit.f71706a;
            case 25:
                return Long.valueOf(((b20.e) this.receiver).c((UserHandle) obj));
            case 26:
                ((t1) this.receiver).k((Throwable) obj);
                return Unit.f71706a;
            case 27:
                Context p014 = (Context) obj;
                Intrinsics.g(p014, "p0");
                ((t80.a) this.receiver).getClass();
                try {
                    return Uri.parse("android.resource://com.google.android.calendar/" + p014.getPackageManager().getApplicationInfo("com.google.android.calendar", 0).icon).toString();
                } catch (PackageManager.NameNotFoundException e3) {
                    p log = State.INSTANCE.getLog();
                    int iOrdinal = log.getLevel().ordinal();
                    o oVar = o.f85697a;
                    if (iOrdinal < 1) {
                        return null;
                    }
                    log.getWriter().error("SSML-CalendarApiIntegration", e3, "Failed fetching calendar icon");
                    return null;
                }
            case 28:
                uu.b bVar = (uu.b) obj;
                us.e eVar2 = (us.e) this.receiver;
                ou.d dVar2 = eVar2.f91540f;
                com.stripe.android.model.z2 z2Var = PaymentMethod.Type.f43637g;
                dVar2.getClass();
                PaymentMethodCreateParams paymentMethodCreateParamsB = bVar != null ? hv.h.b(bVar, "card", dVar2.f80824d) : null;
                dVar2.d(bVar, "card");
                i2 i2Var3 = eVar2.f91544j;
                do {
                    value = i2Var3.getValue();
                } while (!i2Var3.i(value, us.b.a((us.b) value, paymentMethodCreateParamsB != null ? q0.f82953b : q0.f82954c, false, paymentMethodCreateParamsB, null, 91)));
                return Unit.f71706a;
            default:
                String p015 = (String) obj;
                Intrinsics.g(p015, "p0");
                vs.o oVar2 = (vs.o) this.receiver;
                oVar2.getClass();
                oVar2.f92989b.a(gs.d.f57766d, null);
                oVar2.f92998k.t(p015);
                return Unit.f71706a;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c(Object obj) {
        super(1, 0, b20.e.class, obj, "getUserSerial", "getUserSerial(Landroid/os/UserHandle;)J");
        this.f68118d = 25;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c(t1 t1Var) {
        super(1, 0, t1.class, t1Var, "invoke", "invoke(Ljava/lang/Throwable;)V");
        this.f68118d = 26;
    }
}
