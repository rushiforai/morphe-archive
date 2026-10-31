package b10;

import android.content.Context;
import android.os.Build;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.View;
import android.view.textclassifier.TextClassification;
import com.instabridge.ai.chat.ui.v2.AiChatViewV2;
import com.moloco.sdk.internal.C2930d;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.compose.C3024a;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.compose.g;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.compose.j;
import com.teslacoilsw.launcher.onboarding.WhatsNewActivity;
import com.teslacoilsw.launcher.preferences.AdaptiveIconSettingsActivity;
import com.teslacoilsw.launcher.preferences.fragments.NovaSettingsFragmentBase;
import com.teslacoilsw.launcher.preferences.fragments.SettingsDock;
import com.teslacoilsw.launcher.preferences.fragments.SettingsDockBackground;
import com.teslacoilsw.launcher.preferences.fragments.SettingsIntegrations;
import com.teslacoilsw.launcher.preferences.fragments.SettingsLookFeel;
import com.teslacoilsw.launcher.preferences.widget.MatchWrapLinearLayout;
import com.teslacoilsw.launcher.widget.DumbRadioGrid;
import cw.h3;
import cw.o4;
import e00.i6;
import e10.j4;
import e10.v2;
import e10.y2;
import e10.z2;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.Set;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import ninja.sesame.lib.bridge.v1.SesameFrontend;
import ninja.sesame.lib.bridge.v1_1.LookFeelKeys;

/* loaded from: classes4.dex */
public final /* synthetic */ class f1 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f16668a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f16669b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f16670c;

    public /* synthetic */ f1(int i5, Object obj, Object obj2) {
        this.f16668a = i5;
        this.f16669b = obj;
        this.f16670c = obj2;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r1v77, types: [java.util.List] */
    /* JADX WARN: Type inference failed for: r6v0, types: [boolean] */
    /* JADX WARN: Type inference failed for: r6v1, types: [int] */
    /* JADX WARN: Type inference failed for: r6v10 */
    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        m3.o0 o0Var;
        m3.o0 o0Var2;
        boolean integrationState;
        int i5 = this.f16668a;
        TextClassification textClassification = null;
        ?? r62 = 0;
        boolean integrationState2 = false;
        Object obj3 = this.f16670c;
        Object obj4 = this.f16669b;
        switch (i5) {
            case 0:
                ((Integer) obj2).getClass();
                com.google.android.gms.internal.consent_sdk.e0.k((b2.t) obj4, (x1.e) obj3, (p1.o) obj, p1.a0.l(49));
                return Unit.f71706a;
            case 1:
                ((Integer) obj2).getClass();
                int i11 = WhatsNewActivity.f45941r;
                ((WhatsNewActivity) obj4).b0((String) obj3, (p1.o) obj, p1.a0.l(7));
                return Unit.f71706a;
            case 2:
                ((Integer) obj2).getClass();
                b20.m.a((b2.t) obj4, (List) obj3, (p1.o) obj, p1.a0.l(1));
                return Unit.f71706a;
            case 3:
                ((Integer) obj2).getClass();
                wh.f.v((b20.e) obj4, (c20.b) obj3, (p1.o) obj, p1.a0.l(1));
                return Unit.f71706a;
            case 4:
                return AiChatViewV2.executeSuggestionToolCall$lambda$27((AiChatViewV2) obj4, (String) obj3, (Map) obj, (String) obj2);
            case 5:
                return C2930d.a((Integer) obj4, (Integer) obj3, (Context) obj, (w70.m) obj2);
            case 6:
                return C3024a.c.a((com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.companion.h) obj4, (Function0) obj3, (h2.b) obj, (h2.b) obj2);
            case 7:
                return g.b.a((Function0) obj4, (com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.dec.e) obj3, (h2.b) obj, (h2.b) obj2);
            case 8:
                return j.g.a((Function0) obj4, (com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.linear.k) obj3, (h2.b) obj, (h2.b) obj2);
            case 9:
                ((Integer) obj2).getClass();
                com.google.android.gms.internal.consent_sdk.e0.b((cw.n) obj3, (b2.t) obj4, (p1.o) obj, p1.a0.l(9));
                return Unit.f71706a;
            case 10:
                ((Integer) obj2).getClass();
                g90.k.i((h3) obj3, (b2.t) obj4, (p1.o) obj, p1.a0.l(1));
                return Unit.f71706a;
            case 11:
                ((Integer) obj2).getClass();
                mk.v.r((o4) obj3, (b2.t) obj4, (p1.o) obj, p1.a0.l(9));
                return Unit.f71706a;
            case 12:
                ((Integer) obj2).getClass();
                wh.f.d((g20.a) obj4, (Function0) obj3, (p1.o) obj, p1.a0.l(1));
                return Unit.f71706a;
            case 13:
                ((Integer) obj2).getClass();
                ex.i.m((dv.w) obj3, (b2.t) obj4, (p1.o) obj, p1.a0.l(1));
                return Unit.f71706a;
            case 14:
                ((Integer) obj2).getClass();
                t2.c.a((Function0) obj4, (ay.r) obj3, (p1.o) obj, p1.a0.l(7));
                return Unit.f71706a;
            case 15:
                Integer num = (Integer) obj;
                num.getClass();
                Integer num2 = (Integer) obj2;
                num2.getClass();
                ((q00.l) obj4).setValue(num);
                ((q00.l) obj3).setValue(num2);
                py.c.f83128b.getClass();
                py.c.a();
                return Unit.f71706a;
            case 16:
                ((Integer) obj2).getClass();
                cl.l0.i((i6) obj4, (Function0) obj3, (p1.o) obj, p1.a0.l(1));
                return Unit.f71706a;
            case 17:
                e1.a1 a1Var = (e1.a1) obj4;
                t70.j0 j0Var = (t70.j0) obj3;
                v0.a aVar = (v0.a) obj;
                Context context = (Context) obj2;
                boolean zBooleanValue = ((Boolean) ((p1.s2) a1Var.f51240l).getValue()).booleanValue();
                m3.g gVarN = a1Var.n();
                String str = gVarN != null ? gVarN.f75880b : null;
                m3.o0 o0Var3 = a1Var.f51248v;
                if (o0Var3 != null) {
                    long j11 = o0Var3.f75946a;
                    r3.s sVar = a1Var.f51230b;
                    o0Var = new m3.o0(z2.u(sVar.o((int) (j11 >> 32)), sVar.o((int) (j11 & 4294967295L))));
                } else {
                    o0Var = null;
                }
                e1.n nVar = a1Var.f51237i;
                q qVar = new q(a1Var, j0Var, context);
                p1.z2 z2Var = e1.p.f51361a;
                if (Build.VERSION.SDK_INT < 28 || str == null || o0Var == null || nVar == null || !(nVar instanceof e1.n)) {
                    qVar.invoke(aVar);
                    if (str != null && o0Var != null) {
                        u0.b.a(aVar, context, zBooleanValue, str, o0Var.f75946a);
                    }
                } else {
                    long j12 = o0Var.f75946a;
                    Object obj5 = nVar.f51347h;
                    c80.d dVar = nVar.f51344e;
                    if (dVar.f()) {
                        e1.n0 n0Var = (e1.n0) ((p1.s2) nVar.f51346g).getValue();
                        o0Var2 = o0Var;
                        TextClassification textClassification2 = (n0Var != null && m3.o0.b(j12, n0Var.f51349b) && Intrinsics.b(str, n0Var.f51348a)) ? n0Var.f51350c : null;
                        dVar.g(null);
                        textClassification = textClassification2;
                    } else {
                        o0Var2 = o0Var;
                    }
                    if (textClassification == null) {
                        qVar.invoke(aVar);
                    } else {
                        if (!textClassification.getActions().isEmpty()) {
                            aVar.f91826a.g(new w0.h(obj5, textClassification, 0));
                        } else if ((textClassification.getIcon() != null || !TextUtils.isEmpty(textClassification.getLabel())) && (textClassification.getIntent() != null || textClassification.getOnClickListener() != null)) {
                            aVar.f91826a.g(new w0.h(obj5, textClassification, -1));
                        }
                        qVar.invoke(aVar);
                        ?? actions = textClassification.getActions();
                        int size = ((Collection) actions).size();
                        while (r62 < size) {
                            if (r62 > 0) {
                                aVar.f91826a.g(new w0.h(obj5, textClassification, r62));
                            }
                            r62++;
                        }
                    }
                    u0.b.a(aVar, context, zBooleanValue, str, o0Var2.f75946a);
                }
                return Unit.f71706a;
            case 18:
                AdaptiveIconSettingsActivity adaptiveIconSettingsActivity = (AdaptiveIconSettingsActivity) obj4;
                d9.j jVar = (d9.j) obj3;
                DumbRadioGrid dumbRadioGrid = (DumbRadioGrid) obj;
                int iIntValue = ((Integer) obj2).intValue();
                int i12 = AdaptiveIconSettingsActivity.C;
                if (iIntValue != -1) {
                    View viewFindViewById = dumbRadioGrid.findViewById(iIntValue);
                    Intrinsics.d(viewFindViewById);
                    Object tag = viewFindViewById.getTag();
                    Intrinsics.e(tag, "null cannot be cast to non-null type com.teslacoilsw.launcher.icon.AdaptiveIconShape");
                    fz.d dVar2 = (fz.d) tag;
                    ((v9.a) adaptiveIconSettingsActivity.Z()).f92244z.setTag(dVar2);
                    adaptiveIconSettingsActivity.f45949y = dVar2;
                    ((v9.a) adaptiveIconSettingsActivity.Z()).f92244z.setCompoundDrawables(null, p7.u.K(dVar2, adaptiveIconSettingsActivity), null, null);
                    gz.f fVar = adaptiveIconSettingsActivity.f45946v;
                    if (fVar == null) {
                        Intrinsics.m("selectedIconTheme");
                        throw null;
                    }
                    if (fVar.isEmpty() || !((v9.a) adaptiveIconSettingsActivity.Z()).f92235q.isChecked()) {
                        adaptiveIconSettingsActivity.f0();
                    } else {
                        adaptiveIconSettingsActivity.g0();
                    }
                    jVar.dismiss();
                }
                return Unit.f71706a;
            case 19:
                ((Integer) obj2).getClass();
                j4.b((p6.t) obj4, (String) obj3, (p1.o) obj, p1.a0.l(1));
                return Unit.f71706a;
            case 20:
                ((Integer) obj2).getClass();
                es.g0.a((com.stripe.android.link.l) obj4, (lw.l) obj3, (p1.o) obj, p1.a0.l(65));
                return Unit.f71706a;
            case 21:
                ((Integer) obj2).getClass();
                ((f0.d) obj4).a((f0.c) obj3, (p1.o) obj, p1.a0.l(1));
                return Unit.f71706a;
            case 22:
                ((Integer) obj2).getClass();
                f1.h.a((Function2) obj4, (Function2) obj3, (p1.o) obj, p1.a0.l(7));
                return Unit.f71706a;
            case 23:
                float fFloatValue = ((Float) obj).floatValue();
                float fFloatValue2 = ((Float) obj2).floatValue();
                f1.y yVar = ((f1.u) obj4).f54012a;
                yVar.f54117g.p(fFloatValue);
                yVar.f54118h.p(fFloatValue2);
                ((Ref.FloatRef) obj3).f71860a = fFloatValue;
                return Unit.f71706a;
            case 24:
                Ref.FloatRef floatRef = (Ref.FloatRef) obj4;
                float fFloatValue3 = ((Float) obj).floatValue();
                ((Float) obj2).floatValue();
                float f11 = floatRef.f71860a;
                floatRef.f71860a = ((g0.n1) obj3).a(fFloatValue3 - f11) + f11;
                return Unit.f71706a;
            case 25:
                SettingsDock settingsDock = (SettingsDock) obj4;
                v9.x xVar = (v9.x) obj3;
                ((Boolean) obj).getClass();
                boolean zBooleanValue2 = ((Boolean) obj2).booleanValue();
                settingsDock.p().edit().putBoolean("dock_enable", zBooleanValue2).apply();
                if (zBooleanValue2) {
                    xVar.f92558c.E(Boolean.FALSE);
                }
                MatchWrapLinearLayout matchWrapLinearLayout = xVar.f92557b;
                int childCount = matchWrapLinearLayout.getChildCount();
                for (int i13 = 0; i13 < childCount; i13++) {
                    View childAt = matchWrapLinearLayout.getChildAt(i13);
                    if (!Intrinsics.b(childAt, xVar.f92561f) && !Intrinsics.b(childAt, xVar.f92562g)) {
                        childAt.setEnabled(zBooleanValue2);
                    }
                }
                NovaSettingsFragmentBase.w(settingsDock);
                return Unit.f71706a;
            case 26:
                v9.w wVar = (v9.w) obj4;
                v9.m0 m0Var = wVar.f92554g;
                m0Var.f92474h.Q(fz.q.valueOf((String) m0Var.f92475i.r()));
                v9.m0 m0Var2 = wVar.f92554g;
                m0Var2.f92476j.Q(fz.q.valueOf((String) m0Var2.f92477k.r()));
                m0Var2.f92469c.Q(fz.q.valueOf((String) m0Var2.f92470d.r()));
                m0Var2.f92472f.Q(fz.q.valueOf((String) m0Var2.f92473g.r()));
                wVar.f92551d.setChecked(true);
                ((SettingsDockBackground) obj3).z();
                return Unit.f71706a;
            case 27:
                v9.d0 d0Var = (v9.d0) obj4;
                SettingsIntegrations settingsIntegrations = (SettingsIntegrations) obj3;
                ((Boolean) obj).getClass();
                boolean zBooleanValue3 = ((Boolean) obj2).booleanValue();
                if (!d0Var.f92315l.isChecked() && !d0Var.n.isChecked()) {
                    oy.c.b(settingsIntegrations.requireContext(), false, null);
                }
                if (zBooleanValue3) {
                    try {
                        integrationState = SesameFrontend.getIntegrationState(settingsIntegrations.requireContext());
                    } catch (Exception unused) {
                        integrationState = false;
                    }
                    if (!integrationState) {
                        d0Var.f92316m.callOnClick();
                    }
                }
                Context context2 = mx.g0.f77088a;
                mx.g0.b();
                NovaSettingsFragmentBase.w(settingsIntegrations);
                try {
                    integrationState2 = SesameFrontend.getIntegrationState(settingsIntegrations.requireContext());
                } catch (Exception unused2) {
                }
                settingsIntegrations.B(integrationState2);
                return Unit.f71706a;
            case 28:
                SettingsIntegrations settingsIntegrations2 = (SettingsIntegrations) obj4;
                f1 f1Var = (f1) obj3;
                Boolean bool = (Boolean) obj;
                bool.getClass();
                Boolean bool2 = (Boolean) obj2;
                boolean zBooleanValue4 = bool2.booleanValue();
                y2.f51877a.getClass();
                v2 v2VarF1 = y2.f1();
                Set set = (Set) y2.f1().l();
                r10.p0 p0Var = r10.p0.f85204a;
                v2VarF1.i(set.contains(p0Var) ? kotlin.collections.c.f1(new r10.p0[]{p0Var, r10.p0.f85207d}) : ab.e0.U(r10.p0.f85207d));
                if (zBooleanValue4) {
                    Context applicationContext = settingsIntegrations2.requireContext().getApplicationContext();
                    String str2 = ((gz.j) y2.F0().l()).f58654c;
                    if (!y2.s1()) {
                        SesameFrontend.init(applicationContext, new nx.l(str2, applicationContext, r62));
                    } else if (((Boolean) y2.t1().l()).booleanValue() && oy.c.f81123a) {
                        Bundle bundle = new Bundle();
                        bundle.putString(LookFeelKeys.ICON_PACK_PKG, str2);
                        SesameFrontend.setLookFeelPreferences(bundle);
                    }
                }
                f1Var.invoke(bool, bool2);
                return Unit.f71706a;
            default:
                v9.f0 f0Var = (v9.f0) obj4;
                SettingsLookFeel settingsLookFeel = (SettingsLookFeel) obj3;
                String str3 = (String) obj2;
                if (Intrinsics.b(str3, "DISABLED")) {
                    x20.e.f94985b.getClass();
                    if (o7.a.D()) {
                        o7.a.I(settingsLookFeel.requireContext().getContentResolver(), true);
                    }
                } else {
                    x20.e.f94985b.getClass();
                    if (!o7.a.F()) {
                        q10.b bVar = q10.b.f83431e;
                        if (ul.b.M()) {
                            f0Var.f92335b.E("DISABLED");
                            y2.f51877a.getClass();
                            y2.V0().i(Boolean.FALSE);
                            t70.m0.t(settingsLookFeel, null, null, new androidx.room.p(settingsLookFeel, f0Var, str3, (Continuation) null, 16), 3);
                        }
                    }
                }
                return Unit.f71706a;
        }
    }

    public /* synthetic */ f1(Object obj, b2.t tVar, int i5, int i11) {
        this.f16668a = i11;
        this.f16670c = obj;
        this.f16669b = tVar;
    }

    public /* synthetic */ f1(Object obj, Object obj2, int i5, int i11) {
        this.f16668a = i11;
        this.f16669b = obj;
        this.f16670c = obj2;
    }
}
