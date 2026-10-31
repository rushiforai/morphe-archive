package l10;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import androidx.activity.result.contract.ActivityResultContracts$RequestPermission;
import androidx.credentials.exceptions.GetCredentialException;
import b00.z0;
import com.android.launcher3.BubbleTextView;
import com.android.launcher3.shortcuts.DeepShortcutView;
import com.instabridge.ai.proactive.AiInsightData;
import com.stripe.android.link.ui.inline.UserInput;
import com.stripe.android.paymentsheet.addresselement.AddressElementActivity;
import com.stripe.android.paymentsheet.addresselement.k0;
import com.stripe.android.view.PaymentAuthWebViewActivity;
import com.teslacoilsw.launcher.ai.NovaAiInsightHistoryActivity;
import com.teslacoilsw.launcher.ai.NovaAiSettingsActivity;
import com.teslacoilsw.launcher.launcher3.appprediction.PredictionRowView;
import com.teslacoilsw.launcher.preferences.fragments.NovaSettingsFragment;
import com.teslacoilsw.launcher.preferences.widget.MatchWrapLinearLayout;
import com.teslacoilsw.launcher.quicksearchbar.NovaSearchBarView;
import com.teslacoilsw.launcher.search.calendar.CalendarPermissionActivity;
import com.teslacoilsw.launcher.widget.DumbGridLayout;
import e1.c0;
import e1.e0;
import e10.n1;
import h6.g1;
import io.branch.search.ui.BranchEntity;
import j3.b0;
import java.time.DayOfWeek;
import java.util.Iterator;
import java.util.List;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Pair;
import kotlin.Unit;
import kotlin.collections.MapsKt;
import kotlin.coroutines.Continuation;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Reflection;
import kotlin.math.MathKt;
import kotlin.text.MatcherMatchResult$groups$1;
import l1.d1;
import org.json.JSONObject;
import p0.d0;
import p1.s2;
import p6.i0;
import ps.f0;
import t0.j0;
import t0.y0;
import t70.m0;
import tx.b2;
import tx.q4;
import v2.g0;
import w70.i2;

/* loaded from: classes4.dex */
public final /* synthetic */ class z implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f74496a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f74497b;

    public /* synthetic */ z(int i5, Object obj, Object obj2) {
        this.f74496a = i5;
        this.f74497b = obj;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        String string;
        String strConcat;
        StringBuilder sb2;
        int i5;
        Object value;
        rs.j jVar;
        UserInput userInputG;
        int i11;
        Iterator it;
        int i12 = this.f74496a;
        Continuation continuation = null;
        Object obj2 = this.f74497b;
        switch (i12) {
            case 0:
                a0 a0Var = (a0) obj2;
                a0Var.f74389g = (k30.x) obj;
                a0Var.f74399s.run();
                return Unit.f71706a;
            case 1:
                l5.b bVar = (l5.b) obj2;
                GetCredentialException e3 = (GetCredentialException) obj;
                Intrinsics.g(e3, "e");
                bVar.e().execute(new l5.a(bVar, e3, 2));
                return Unit.f71706a;
            case 2:
                ww.a host = (ww.a) obj;
                Intrinsics.g(host, "host");
                j.c cVar = ((ju.a) ((r40.a) obj2).get()).f69930e;
                return cVar != null ? new dq.p(cVar) : new dq.p(host);
            case 3:
                m0.o oVar = (m0.o) obj2;
                return oVar.j(((Integer) obj).intValue(), oVar.n);
            case 4:
                y1.e eVar = (y1.e) obj2;
                return Boolean.valueOf(eVar != null ? eVar.c(obj) : true);
            case 5:
                return Boolean.valueOf(((DayOfWeek) obj) == ((DayOfWeek) obj2));
            case 6:
                Context context = ((n20.e) obj2).f77738f;
                JSONObject jSONObject = (JSONObject) obj;
                try {
                    if (jSONObject.has("photo") && jSONObject.has("@microsoft.graph.downloadUrl")) {
                        string = jSONObject.getString("@microsoft.graph.downloadUrl");
                    } else if (jSONObject.has("folder")) {
                        string = "android.resource://" + context.getPackageName() + "/2131231556";
                    } else {
                        String string2 = jSONObject.getJSONObject("file").getString("mimeType");
                        String packageName = context.getPackageName();
                        v80.b.Companion.getClass();
                        string = "android.resource://" + packageName + "/" + v80.a.a(string2);
                    }
                    return string;
                } catch (Throwable th2) {
                    mc0.b bVar2 = mc0.d.f76206a;
                    bVar2.r("OneDriveApiIntegration");
                    bVar2.p(th2, "OneDrive integration image resolved failed", new Object[0]);
                    return null;
                }
            case 7:
                return (FrameLayout) obj2;
            case 8:
                z0 z0Var = (z0) obj2;
                boolean zBooleanValue = ((Boolean) obj).booleanValue();
                switch (z0Var.f16512a) {
                    case 14:
                        PredictionRowView predictionRowView = (PredictionRowView) z0Var.f16513b;
                        lz.e eVar2 = PredictionRowView.B;
                        if (!zBooleanValue) {
                            predictionRowView.getClass();
                            break;
                        } else {
                            predictionRowView.k();
                            break;
                        }
                    default:
                        q9.s sVar = ((q9.g) z0Var.f16513b).f83830d;
                        if (sVar.f83884d != zBooleanValue) {
                            sVar.f83884d = zBooleanValue;
                            sVar.b();
                            break;
                        }
                        break;
                }
                return Unit.f71706a;
            case 9:
                float fFloatValue = ((Float) obj).floatValue();
                p0.y yVar = ((d0) obj2).f81151b;
                yVar.f81243s.p(yVar.j(yVar.k() + MathKt.b(yVar.o() != 0 ? fFloatValue / yVar.o() : 0.0f)));
                return Unit.f71706a;
            case 10:
                BubbleTextView bubbleTextView = (BubbleTextView) obj;
                bubbleTextView.r((mx.f) obj2);
                bubbleTextView.t(bubbleTextView.getCompoundDrawablesRelative()[0]);
                return Unit.f71706a;
            case 11:
                AddressElementActivity addressElementActivity = (AddressElementActivity) obj2;
                i0 NavHost = (i0) obj;
                Intrinsics.g(NavHost, "$this$NavHost");
                int i13 = 0;
                f0.i(NavHost, "InputAddress", null, new x1.e(new pu.f(addressElementActivity, i13), true, 538748256), 254);
                f0.i(NavHost, "Autocomplete?country={country}", ul.b.P(p6.f.K("country", new pu.e(i13))), new x1.e(new pu.f(addressElementActivity, 1), true, 501268297), 252);
                return Unit.f71706a;
            case 12:
                pu.z zVar = (pu.z) obj2;
                String it2 = (String) obj;
                Intrinsics.g(it2, "it");
                m0.t(g1.f(zVar), null, null, new pu.q(zVar, it2, continuation, 1), 3);
                return Unit.f71706a;
            case 13:
                k0 k0Var = (k0) obj2;
                m0.t(g1.f(k0Var), null, null, new ay.d(k0Var, ((Boolean) obj).booleanValue(), (Continuation) null, 8), 3);
                return Unit.f71706a;
            case 14:
                r3.h hVar = (r3.h) obj;
                StringBuilder sbQ = a2.c.q(((r3.h) obj2) == hVar ? " > " : "   ");
                if (hVar instanceof r3.a) {
                    sb2 = new StringBuilder("CommitTextCommand(text.length=");
                    r3.a aVar = (r3.a) hVar;
                    sb2.append(aVar.f85388a.f75880b.length());
                    sb2.append(", newCursorPosition=");
                    i5 = aVar.f85389b;
                } else {
                    if (!(hVar instanceof r3.x)) {
                        if (hVar instanceof r3.w) {
                            strConcat = ((r3.w) hVar).toString();
                        } else if (hVar instanceof r3.f) {
                            strConcat = ((r3.f) hVar).toString();
                        } else if (hVar instanceof r3.g) {
                            strConcat = ((r3.g) hVar).toString();
                        } else if (hVar instanceof r3.y) {
                            strConcat = ((r3.y) hVar).toString();
                        } else if (hVar instanceof r3.k) {
                            strConcat = "FinishComposingTextCommand()";
                        } else if (hVar instanceof r3.e) {
                            strConcat = "DeleteAllCommand()";
                        } else {
                            String simpleName = Reflection.f71864a.getOrCreateKotlinClass(hVar.getClass()).getSimpleName();
                            if (simpleName == null) {
                                simpleName = "{anonymous EditCommand}";
                            }
                            strConcat = "Unknown EditCommand: ".concat(simpleName);
                        }
                        sbQ.append(strConcat);
                        return sbQ.toString();
                    }
                    sb2 = new StringBuilder("SetComposingTextCommand(text.length=");
                    r3.x xVar = (r3.x) hVar;
                    sb2.append(xVar.f85467a.f75880b.length());
                    sb2.append(", newCursorPosition=");
                    i5 = xVar.f85468b;
                }
                strConcat = a2.c.m(sb2, i5, ')');
                sbQ.append(strConcat);
                return sbQ.toString();
            case 15:
                return ((MatcherMatchResult$groups$1) obj2).d(((Integer) obj).intValue());
            case 16:
                com.stripe.android.link.ui.inline.a aVar2 = (com.stripe.android.link.ui.inline.a) obj2;
                vs.g signUpState = (vs.g) obj;
                Intrinsics.g(signUpState, "signUpState");
                aVar2.f43047s.j(null);
                i2 i2Var = aVar2.f43038h;
                do {
                    value = i2Var.getValue();
                    jVar = (rs.j) value;
                    int iOrdinal = signUpState.ordinal();
                    if (iOrdinal == 0 || iOrdinal == 1) {
                        userInputG = jVar.f86186a;
                    } else {
                        if (iOrdinal != 2) {
                            throw new NoWhenBranchMatchedException();
                        }
                        userInputG = aVar2.g((String) aVar2.f43044p.f91586b.invoke(), (String) aVar2.f43045q.f91586b.invoke(), (String) aVar2.f43046r.f91586b.invoke(), jVar.f86197l);
                    }
                } while (!i2Var.i(value, rs.j.a(jVar, userInputG, false, false, signUpState, 3070)));
                return Unit.f71706a;
            case 17:
                ((BranchEntity.AutoSuggestion) obj2).e((View) obj);
                return Unit.f71706a;
            case 18:
                ((j3.k) ((b0) obj)).f(e0.f51289c, new e1.d0(j0.f88051a, ((e1.k) obj2).a(), c0.f51266b, true));
                return Unit.f71706a;
            case 19:
                Boolean bool = (Boolean) obj;
                bool.booleanValue();
                ((s2) ((y0) obj2).f88293q).setValue(bool);
                return Unit.f71706a;
            case 20:
                n00.u uVar = (n00.u) obj2;
                z2.y yVar2 = (z2.y) obj;
                z2.y yVarI = yVar2.I();
                uVar.invoke(Integer.valueOf(MathKt.b(Float.intBitsToFloat((int) (4294967295L & (yVarI != null ? yVarI.m(yVar2, 0L) : 0L))))));
                return Unit.f71706a;
            case 21:
                v2.t tVar = (v2.t) obj;
                long j11 = g0.j(tVar, false);
                t00.h hVar2 = ((t00.w) obj2).f88420b;
                tVar.a();
                hVar2.c(j11);
                Unit unit = Unit.f71706a;
                if (!h2.b.b(g0.j(tVar, false), 0L)) {
                    tVar.a();
                }
                return Unit.f71706a;
            case 22:
                CalendarPermissionActivity calendarPermissionActivity = (CalendarPermissionActivity) obj2;
                boolean zBooleanValue2 = ((Boolean) obj).booleanValue();
                int i14 = CalendarPermissionActivity.f46235p;
                if (zBooleanValue2) {
                    calendarPermissionActivity.setResult(-1);
                } else {
                    calendarPermissionActivity.setResult(0);
                }
                calendarPermissionActivity.finish();
                return Unit.f71706a;
            case 23:
                NovaAiInsightHistoryActivity novaAiInsightHistoryActivity = (NovaAiInsightHistoryActivity) obj2;
                AiInsightData aiInsightData = (AiInsightData) obj;
                int i15 = NovaAiInsightHistoryActivity.o;
                zy.c cVar2 = zy.c.f98823a;
                zy.c.i("ai_insight_history_item_tapped", MapsKt.j0(new Pair("has_preloaded_response", Boolean.valueOf(aiInsightData.getPreloadedResponse() != null)), new Pair("has_actions", Boolean.valueOf(!aiInsightData.getActions().isEmpty()))));
                b2.a(novaAiInsightHistoryActivity, aiInsightData, "insight_history");
                return Unit.f71706a;
            case 24:
                d1 d1Var = NovaAiSettingsActivity.f45697u;
                return new a1.j((q4) obj2, 16);
            case 25:
                n1 n1Var = (n1) obj2;
                v9.j0 j0Var = (v9.j0) obj;
                v9.k kVar = j0Var.f92412i;
                View view = j0Var.f92405b;
                DumbGridLayout dumbGridLayout = j0Var.f92406c;
                MatchWrapLinearLayout matchWrapLinearLayout = j0Var.f92404a;
                MatchWrapLinearLayout matchWrapLinearLayout2 = j0Var.f92407d;
                List listQ = ul.b.Q((DeepShortcutView) kVar.f92416b, (DeepShortcutView) j0Var.f92413j.f92416b, (DeepShortcutView) j0Var.f92414k.f92416b);
                int i16 = n1Var.f51690b;
                int i17 = n1Var.f51692d;
                boolean z11 = n1Var.f51700l;
                int i18 = n1Var.f51691c;
                int i19 = n1Var.f51699k;
                float f11 = n1Var.f51694f;
                int i21 = n1Var.f51689a;
                if (i16 == 0) {
                    matchWrapLinearLayout.setBackground(null);
                } else {
                    GradientDrawable gradientDrawable = new GradientDrawable();
                    gradientDrawable.setColor(i16);
                    gradientDrawable.setCornerRadius(f11);
                    matchWrapLinearLayout.setBackground(gradientDrawable);
                    matchWrapLinearLayout.setClipToOutline(true);
                }
                ColorStateList colorStateListValueOf = ColorStateList.valueOf(n1Var.f51697i);
                int childCount = dumbGridLayout.getChildCount();
                int i22 = 0;
                while (i22 < childCount) {
                    List list = listQ;
                    View childAt = dumbGridLayout.getChildAt(i22);
                    Intrinsics.e(childAt, "null cannot be cast to non-null type android.widget.ImageView");
                    ((ImageView) childAt).setImageTintList(colorStateListValueOf);
                    i22++;
                    listQ = list;
                }
                List list2 = listQ;
                int iJ = r4.a.j(i19, i16);
                j0Var.f92411h.setTextColor(n1Var.f51696h);
                int iJ2 = r4.a.j(((double) Color.luminance(iJ)) > 0.5d ? 369098752 : 385875967, iJ);
                j0Var.f92408e.getBackground().mutate().setTint(iJ2);
                j0Var.f92409f.getBackground().mutate().setTint(iJ2);
                j0Var.f92410g.getBackground().mutate().setTint(iJ2);
                view.setVisibility(z11 ? 0 : 8);
                view.setBackgroundColor(iJ2);
                int iJ3 = r4.a.j(i18, i16);
                int iJ4 = r4.a.j(((double) Color.luminance(iJ3)) > 0.5d ? 369098752 : 385875967, iJ3);
                Iterator it3 = list2.iterator();
                int i23 = 0;
                while (it3.hasNext()) {
                    Object next = it3.next();
                    int i24 = i23 + 1;
                    if (i23 < 0) {
                        ul.b.e0();
                        throw null;
                    }
                    DeepShortcutView deepShortcutView = (DeepShortcutView) next;
                    ViewGroup.LayoutParams layoutParams = deepShortcutView.getLayoutParams();
                    Intrinsics.e(layoutParams, "null cannot be cast to non-null type android.view.ViewGroup.MarginLayoutParams");
                    ((ViewGroup.MarginLayoutParams) layoutParams).topMargin = i21;
                    View viewFindViewById = deepShortcutView.findViewById(2131427883);
                    if (viewFindViewById != null) {
                        viewFindViewById.setBackgroundColor(n1Var.f51693e);
                    }
                    if (viewFindViewById != null) {
                        viewFindViewById.setVisibility((i23 >= 2 || i21 != 0) ? 8 : 0);
                    }
                    deepShortcutView.f21243b.G.setTint(iJ4);
                    deepShortcutView.f21243b.invalidate();
                    deepShortcutView.f21244c.getBackground().mutate().setTint(iJ4);
                    if (i18 == 0) {
                        deepShortcutView.setBackground(null);
                        i11 = iJ4;
                        it = it3;
                    } else if (i21 > 0) {
                        GradientDrawable gradientDrawable2 = new GradientDrawable();
                        gradientDrawable2.setColor(i18);
                        float f12 = n1Var.f51694f;
                        i11 = iJ4;
                        float f13 = n1Var.f51695g;
                        if (i23 != 0) {
                            it = it3;
                            if (i23 != 2) {
                                gradientDrawable2.setCornerRadius(f13);
                            } else {
                                gradientDrawable2.setCornerRadii(new float[]{f13, f13, f13, f13, f12, f12, f12, f12});
                            }
                        } else {
                            it = it3;
                            gradientDrawable2.setCornerRadii(new float[]{f12, f12, f12, f12, f13, f13, f13, f13});
                        }
                        deepShortcutView.setBackground(gradientDrawable2);
                    } else {
                        i11 = iJ4;
                        it = it3;
                        deepShortcutView.setBackgroundColor(i18);
                    }
                    iJ4 = i11;
                    i23 = i24;
                    it3 = it;
                }
                if (i17 == 0) {
                    dumbGridLayout.setBackground(null);
                } else if (i21 > 0) {
                    GradientDrawable gradientDrawable3 = new GradientDrawable();
                    gradientDrawable3.setColor(i17);
                    gradientDrawable3.setCornerRadius(f11);
                    dumbGridLayout.setBackground(gradientDrawable3);
                } else {
                    dumbGridLayout.setBackgroundColor(i17);
                }
                if (i19 == 0) {
                    matchWrapLinearLayout2.setBackground(null);
                } else if (i21 > 0) {
                    GradientDrawable gradientDrawable4 = new GradientDrawable();
                    gradientDrawable4.setColor(i19);
                    gradientDrawable4.setCornerRadius(f11);
                    matchWrapLinearLayout2.setBackground(gradientDrawable4);
                } else {
                    matchWrapLinearLayout2.setBackgroundColor(i19);
                }
                ViewGroup.LayoutParams layoutParams2 = matchWrapLinearLayout2.getLayoutParams();
                Intrinsics.e(layoutParams2, "null cannot be cast to non-null type android.view.ViewGroup.MarginLayoutParams");
                ((ViewGroup.MarginLayoutParams) layoutParams2).topMargin = z11 ? 0 : bh.g.M(matchWrapLinearLayout2.getContext(), 8);
                return Unit.f71706a;
            case 26:
                NovaSearchBarView.f((NovaSearchBarView) obj, (w) obj2, null, false, 14);
                return Unit.f71706a;
            case 27:
                return ((NovaSettingsFragment) obj2).registerForActivityResult(new ActivityResultContracts$RequestPermission(), new w20.k((Function1) obj));
            case 28:
                Boolean bool2 = (Boolean) obj;
                bool2.booleanValue();
                ((Function1[]) obj2)[0].invoke(bool2);
                return Unit.f71706a;
            default:
                PaymentAuthWebViewActivity paymentAuthWebViewActivity = (PaymentAuthWebViewActivity) obj2;
                g.s addCallback = (g.s) obj;
                int i25 = PaymentAuthWebViewActivity.f45487s;
                Intrinsics.g(addCallback, "$this$addCallback");
                if (paymentAuthWebViewActivity.b0().f82832e.canGoBack()) {
                    paymentAuthWebViewActivity.b0().f82832e.goBack();
                } else {
                    paymentAuthWebViewActivity.Z();
                }
                return Unit.f71706a;
        }
    }

    public /* synthetic */ z(Object obj, int i5) {
        this.f74496a = i5;
        this.f74497b = obj;
    }
}
