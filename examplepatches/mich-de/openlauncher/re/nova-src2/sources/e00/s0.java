package e00;

import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.Uri;
import b.c9;
import com.instabridge.ai.auth.AiAuthMode;
import com.instabridge.ai.chat.ui.AiChatActivity;
import com.instabridge.ai.proactive.AiInsightData;
import com.instabridge.ai.proactive.NotificationConfig;
import com.instabridge.ai.proactive.ProactiveGenerationConfig;
import com.stripe.android.financialconnections.launcher.FinancialConnectionsSheetActivityArgs;
import com.stripe.android.financialconnections.lite.FinancialConnectionsSheetLiteActivity;
import com.teslacoilsw.launcher.ai.NovaAiChatActivity;
import com.teslacoilsw.launcher.notificationlistener.NotificationListener;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final /* synthetic */ class s0 implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f50956a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Context f50957b;

    public /* synthetic */ s0(Context context, int i5) {
        this.f50956a = i5;
        this.f50957b = context;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        AiAuthMode external;
        boolean zA;
        int i5 = this.f50956a;
        Context context = this.f50957b;
        switch (i5) {
            case 0:
                if (((Boolean) obj).booleanValue()) {
                    t.c(context);
                }
                return Unit.f71706a;
            case 1:
                ((Boolean) obj).booleanValue();
                Intent intent = new Intent("android.settings.USAGE_ACCESS_SETTINGS", Uri.parse("package:com.teslacoilsw.launcher"));
                intent.setFlags(335544320);
                context.startActivity(intent);
                return Unit.f71706a;
            case 2:
                ((Boolean) obj).booleanValue();
                NotificationListener.d(context);
                return Unit.f71706a;
            case 3:
                Intent intent2 = new Intent("android.intent.action.VIEW");
                intent2.setData(Uri.parse(((t80.j) obj).f88923a));
                context.startActivity(intent2);
                return Unit.f71706a;
            case 4:
                FinancialConnectionsSheetActivityArgs args = (FinancialConnectionsSheetActivityArgs) obj;
                Intrinsics.g(args, "args");
                int i11 = FinancialConnectionsSheetLiteActivity.f42693r;
                Intrinsics.g(context, "context");
                Intent intent3 = new Intent(context, (Class<?>) FinancialConnectionsSheetLiteActivity.class);
                intent3.addFlags(SQLiteDatabase.OPEN_FULLMUTEX);
                intent3.putExtra("FinancialConnectionsSheetActivityArgs", args);
                return intent3;
            case 5:
                fo.b bVar = (fo.b) obj;
                bVar.getClass();
                bVar.f55449a = "nova";
                bVar.f55450b = "https://ai-api.instabridge.com/";
                bVar.f55451c = "https://ai.instabridge.com/";
                tx.k2 k2Var = tx.k2.f89839a;
                if (tx.k2.f()) {
                    external = AiAuthMode.Login.INSTANCE;
                } else {
                    Context context2 = mx.g0.f77088a;
                    SharedPreferences sharedPreferences = mx.g0.e().getSharedPreferences("nova_ai_sdk_login", 0);
                    if (sharedPreferences.getBoolean("login_active", false)) {
                        c9.q(sharedPreferences, "login_active", false);
                    }
                    external = new AiAuthMode.External(tx.p3.f89946a);
                }
                bVar.f55452d = external;
                bVar.f55453e = "NOVA_AI";
                bVar.f55454f = new NotificationConfig("nova_ai_insights", 2131231699, new s0(context, 6), context.getString(2132018845));
                try {
                    zA = ((wm.g) ul.g.c().b(wm.g.class)).a().a("ai_model_selector_enabled");
                } catch (Exception unused) {
                    zA = false;
                }
                bVar.f55455g = zA;
                bVar.f55457i = false;
                bVar.f55456h = "Nova AI";
                bVar.f55458j = "Nova Plus";
                bVar.f55459k = "PLUS";
                ProactiveGenerationConfig proactiveGenerationConfigP = p6.a1.p();
                Intrinsics.g(proactiveGenerationConfigP, "<set-?>");
                bVar.f55460l = proactiveGenerationConfigP;
                return Unit.f71706a;
            default:
                AiInsightData aiInsightData = (AiInsightData) obj;
                Intent intent4 = new Intent(context, (Class<?>) NovaAiChatActivity.class);
                intent4.addFlags(268435456);
                String chatPrompt = aiInsightData.getChatPrompt();
                if (chatPrompt == null) {
                    chatPrompt = aiInsightData.getText();
                }
                intent4.putExtra(AiChatActivity.EXTRA_QUERY, chatPrompt);
                return PendingIntent.getActivity(context, 0, intent4, 201326592);
        }
    }
}
