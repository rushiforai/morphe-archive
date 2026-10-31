package n00;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.util.Log;
import b.c0;
import b10.i1;
import b10.v0;
import com.google.android.gms.internal.consent_sdk.k0;
import com.google.gson.Gson;
import com.instabridge.ai.tools.AiTool;
import com.instabridge.ai.tools.perapp.PerAppFeatureCatalog;
import com.instabridge.ai.tools.perapp.PerAppFeatureTool;
import com.stripe.android.PaymentConfiguration;
import com.stripe.android.view.CardNumberEditText;
import com.teslacoilsw.launcher.drawer.drawergroups.DrawerTabSetupActivity;
import com.teslacoilsw.launcher.drawer.drawergroups.GroupAppListActivity;
import com.teslacoilsw.launcher.onboarding.NovaPaywallActivity;
import com.teslacoilsw.launcher.rewards.RewardsActivity;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import kotlin.Pair;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import t70.m0;

/* loaded from: classes4.dex */
public final /* synthetic */ class d implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f77553a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Context f77554b;

    public /* synthetic */ d(Context context, int i5) {
        this.f77553a = i5;
        this.f77554b = context;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:113:0x02dd  */
    /* JADX WARN: Type inference failed for: r13v0, types: [kotlin.coroutines.Continuation] */
    /* JADX WARN: Type inference failed for: r13v6 */
    @Override // kotlin.jvm.functions.Function0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke() {
        Pair pair;
        switch (this.f77553a) {
            case 0:
                Context context = this.f77554b;
                Intent intent = new Intent();
                intent.setAction("android.settings.BLUETOOTH_SETTINGS");
                context.startActivity(intent, null);
                return Unit.f71706a;
            case 1:
                Context context2 = this.f77554b;
                Intent intent2 = new Intent();
                intent2.setAction("android.settings.BLUETOOTH_SETTINGS");
                context2.startActivity(intent2, null);
                return Unit.f71706a;
            case 2:
                Context context3 = this.f77554b;
                context3.startActivity(new Intent(context3, (Class<?>) GroupAppListActivity.class));
                return Unit.f71706a;
            case 3:
                Context context4 = this.f77554b;
                context4.startActivity(new Intent(context4, (Class<?>) DrawerTabSetupActivity.class));
                return Unit.f71706a;
            case 4:
                Context context5 = this.f77554b;
                zy.c cVar = zy.c.f98823a;
                zy.c.i("rewards_card_tap", null);
                yx.b bVar = yx.b.f97678a;
                yx.b.g("rewards_card_tap", null);
                int i5 = RewardsActivity.f46163p;
                context5.startActivity(new Intent(context5, (Class<?>) RewardsActivity.class));
                return Unit.f71706a;
            case 5:
                SharedPreferences sharedPreferences = this.f77554b.getSharedPreferences("country_location", 0);
                String string = sharedPreferences.getString("country_code", null);
                if (string == null) {
                    string = null;
                } else if (System.currentTimeMillis() - sharedPreferences.getLong("country_timestamp", 0L) >= 86400000) {
                }
                if (string != null) {
                    return string;
                }
                String country = Locale.getDefault().getCountry();
                if (r70.k.U0(country)) {
                    return null;
                }
                return country;
            case 6:
                try {
                    String path = this.f77554b.getCacheDir().getPath();
                    Intrinsics.f(path, "getPath(...)");
                    return qo.d.f(new File(path + File.separator + "stripe_image_cache"));
                } catch (IOException e3) {
                    Log.e("stripe_image_disk_cache", "error opening cache", e3);
                    return null;
                }
            case 7:
                return this.f77554b.getSharedPreferences("app_info", 0);
            case 8:
                Context context6 = this.f77554b;
                Gson gson = sx.c.f87750a;
                sx.n nVar = sx.c.f87751b;
                long jCurrentTimeMillis = System.currentTimeMillis();
                if (nVar != null && jCurrentTimeMillis - sx.c.f87752c < 21600000) {
                    return nVar;
                }
                SharedPreferences sharedPreferences2 = context6.getSharedPreferences("ad_mediation_config", 0);
                String string2 = sharedPreferences2.getString("mediation_config_json", null);
                if (string2 == null) {
                    pair = null;
                } else {
                    try {
                        pair = new Pair(sx.c.f87750a.fromJson(string2, sx.n.class), Long.valueOf(sharedPreferences2.getLong("mediation_config_timestamp", 0L)));
                    } catch (Exception e11) {
                        mc0.d.f76206a.f(e11, "AdUnitMappingFetcher: Error parsing cached config", new Object[0]);
                    }
                }
                int i11 = 9;
                if (pair == null) {
                    m0.t(sx.c.f87753d, null, null, new v0(context6, paymentConfiguration, i11), 3);
                    Object obj = sx.n.f87806d;
                    return new sx.n(7, null);
                }
                sx.n nVar2 = (sx.n) pair.f71683a;
                long jLongValue = ((Number) pair.f71684b).longValue();
                sx.c.f87751b = nVar2;
                sx.c.f87752c = jLongValue;
                m0.t(sx.c.f87753d, null, null, new v0(context6, paymentConfiguration, i11), 3);
                return nVar2;
            case 9:
                return Boolean.valueOf(!j10.m.i(this.f77554b));
            case 10:
                Context context7 = this.f77554b;
                zy.c cVar2 = zy.c.f98823a;
                zy.c.i("ai_plan_upgrade_tap", b70.h.f17594a);
                try {
                    int i12 = Result.f71687b;
                    int i13 = NovaPaywallActivity.o;
                    context7.startActivity(i1.b(context7, null, "ai_settings_plan_card", true));
                    Unit unit = Unit.f71706a;
                } catch (Throwable th2) {
                    int i14 = Result.f71687b;
                    ResultKt.a(th2);
                }
                return Unit.f71706a;
            case 11:
                Context context8 = this.f77554b;
                Intrinsics.g(context8, "context");
                PaymentConfiguration paymentConfiguration = PaymentConfiguration.f42439c;
                if (paymentConfiguration == null) {
                    SharedPreferences sharedPreferences3 = new dq.o(context8).f49358a;
                    String string3 = sharedPreferences3.getString("key_publishable_key", null);
                    paymentConfiguration = string3 != null ? new PaymentConfiguration(string3, sharedPreferences3.getString("key_account_id", null)) : 0;
                    if (paymentConfiguration == 0) {
                        throw new IllegalStateException("PaymentConfiguration was not initialized. Call PaymentConfiguration.init().");
                    }
                    PaymentConfiguration.f42439c = paymentConfiguration;
                    paymentConfiguration = paymentConfiguration;
                }
                return paymentConfiguration.f42440a;
            case 12:
                return AiTool.INSTANCE.biiToolsForDevice(this.f77554b);
            case 13:
                Context context9 = this.f77554b;
                PerAppFeatureCatalog perAppFeatureCatalog = PerAppFeatureCatalog.INSTANCE;
                List listDiscover$default = PerAppFeatureCatalog.discover$default(perAppFeatureCatalog, context9, false, 2, null);
                ArrayList arrayList = new ArrayList();
                for (Object obj2 : listDiscover$default) {
                    PerAppFeatureCatalog.Feature feature = (PerAppFeatureCatalog.Feature) obj2;
                    String strSlug = perAppFeatureCatalog.slug(feature.getFeatureLabel());
                    vx.t tVar = vx.t.f93370a;
                    boolean zE = vx.t.e(strSlug);
                    boolean zD = vx.t.d(strSlug);
                    if (zE) {
                        mc0.b bVar2 = mc0.d.f76206a;
                        bVar2.r("NOVA_AI");
                        bVar2.b(c0.n("Excluded per-app tool '", feature.getToolName(), "' — feature slug '", strSlug, "' conflicts with open_settings panel"), new Object[0]);
                    }
                    if (zD) {
                        mc0.b bVar3 = mc0.d.f76206a;
                        bVar3.r("NOVA_AI");
                        bVar3.b(c0.n("Excluded per-app tool '", feature.getToolName(), "' — feature slug '", strSlug, "' conflicts with music integration tools"), new Object[0]);
                    }
                    if (!zE && !zD) {
                        arrayList.add(obj2);
                    }
                }
                ArrayList arrayList2 = new ArrayList(b70.c.u0(arrayList, 10));
                Iterator it = arrayList.iterator();
                while (it.hasNext()) {
                    arrayList2.add(PerAppFeatureTool.INSTANCE.forFeature((PerAppFeatureCatalog.Feature) it.next()));
                }
                return arrayList2;
            case 14:
                return AiTool.INSTANCE.biiToolsForDevice(this.f77554b);
            case 15:
                Context context10 = this.f77554b;
                PerAppFeatureCatalog perAppFeatureCatalog2 = PerAppFeatureCatalog.INSTANCE;
                List listDiscover$default2 = PerAppFeatureCatalog.discover$default(perAppFeatureCatalog2, context10, false, 2, null);
                ArrayList arrayList3 = new ArrayList();
                for (Object obj3 : listDiscover$default2) {
                    String strSlug2 = perAppFeatureCatalog2.slug(((PerAppFeatureCatalog.Feature) obj3).getFeatureLabel());
                    vx.t tVar2 = vx.t.f93370a;
                    if (!vx.t.e(strSlug2) && !vx.t.d(strSlug2)) {
                        arrayList3.add(obj3);
                    }
                }
                ArrayList arrayList4 = new ArrayList(b70.c.u0(arrayList3, 10));
                Iterator it2 = arrayList3.iterator();
                while (it2.hasNext()) {
                    arrayList4.add(PerAppFeatureTool.INSTANCE.forFeature((PerAppFeatureCatalog.Feature) it2.next()));
                }
                return arrayList4;
            case 16:
                return AiTool.INSTANCE.biiToolsForDevice(this.f77554b);
            case 17:
                return AiTool.INSTANCE.perAppFeatureToolsForDevice(this.f77554b);
            case 18:
                Context context11 = this.f77554b;
                Intent intent3 = new Intent("ninja.sesame.app.action.OPEN_SETTINGS");
                intent3.setPackage("ninja.sesame.app.edge");
                intent3.addFlags(268468224);
                try {
                    context11.startActivity(intent3);
                } catch (Exception unused) {
                    k0.w(context11, 2132017222, 0).show();
                }
                return Unit.f71706a;
            case 19:
                return this.f77554b;
            case 20:
                try {
                    SharedPreferences sharedPreferences4 = this.f77554b.getSharedPreferences("webview_crash_handler", 0);
                    sharedPreferences4.edit().putInt("pending_count", sharedPreferences4.getInt("pending_count", 0) + 1).putLong("last_restart_ms", System.currentTimeMillis()).commit();
                } catch (Throwable unused2) {
                }
                return Unit.f71706a;
            default:
                Context context12 = this.f77554b;
                int i15 = CardNumberEditText.L;
                Intrinsics.g(context12, "context");
                PaymentConfiguration paymentConfiguration2 = PaymentConfiguration.f42439c;
                if (paymentConfiguration2 == null) {
                    SharedPreferences sharedPreferences5 = new dq.o(context12).f49358a;
                    String string4 = sharedPreferences5.getString("key_publishable_key", null);
                    PaymentConfiguration paymentConfiguration3 = string4 != null ? new PaymentConfiguration(string4, sharedPreferences5.getString("key_account_id", null)) : null;
                    if (paymentConfiguration3 == null) {
                        throw new IllegalStateException("PaymentConfiguration was not initialized. Call PaymentConfiguration.init().");
                    }
                    PaymentConfiguration.f42439c = paymentConfiguration3;
                    paymentConfiguration2 = paymentConfiguration3;
                }
                return paymentConfiguration2.f42440a;
        }
    }

    public /* synthetic */ d(qw.d dVar, Context context) {
        this.f77553a = 6;
        this.f77554b = context;
    }
}
