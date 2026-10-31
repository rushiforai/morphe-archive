package tx;

import android.content.Context;
import android.content.Intent;
import com.instabridge.ai.proactive.AiInsightData;
import com.instabridge.ai.prompts.AiPrompt;
import com.teslacoilsw.launcher.ai.NovaAiChatActivity;
import com.teslacoilsw.launcher.ai.NovaAiInsightHistoryActivity;
import com.teslacoilsw.launcher.ai.NovaAiSettingsActivity;
import com.tiktok.util.TTConst;
import kotlin.Pair;
import kotlin.Unit;
import kotlin.collections.MapsKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;

/* loaded from: classes4.dex */
public final class n {

    /* renamed from: a, reason: collision with root package name */
    public final Context f89886a;

    /* renamed from: b, reason: collision with root package name */
    public final l f89887b;

    /* renamed from: d, reason: collision with root package name */
    public final l f89889d;

    /* renamed from: e, reason: collision with root package name */
    public final m f89890e;

    /* renamed from: f, reason: collision with root package name */
    public final m f89891f;

    /* renamed from: i, reason: collision with root package name */
    public final m f89894i;

    /* renamed from: c, reason: collision with root package name */
    public final hv.z1 f89888c = new hv.z1(this, 22);

    /* renamed from: g, reason: collision with root package name */
    public final sx.d f89892g = new sx.d(5);

    /* renamed from: h, reason: collision with root package name */
    public final s10.i f89893h = new s10.i(21);

    /* JADX WARN: Type inference failed for: r2v1, types: [tx.l] */
    /* JADX WARN: Type inference failed for: r2v3, types: [tx.l] */
    /* JADX WARN: Type inference failed for: r2v4, types: [tx.m] */
    /* JADX WARN: Type inference failed for: r2v5, types: [tx.m] */
    /* JADX WARN: Type inference failed for: r2v8, types: [tx.m] */
    public n(Context context) {
        this.f89886a = context;
        final int i5 = 0;
        this.f89887b = new Function1(this) { // from class: tx.l

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ n f89849b;

            {
                this.f89849b = this;
            }

            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                int i11 = i5;
                n nVar = this.f89849b;
                switch (i11) {
                    case 0:
                        zy.c cVar = zy.c.f98823a;
                        zy.c.i("ai_insight_feedback", MapsKt.j0(new Pair("surface", "left_swipe"), new Pair(TTConst.TRACK_TYPE, "positive"), new Pair("trigger", "card_tap")));
                        p6.f.O("nova_ai_insight_tapped", MapsKt.j0(new Pair("surface", "left_swipe"), new Pair("position", -1), new Pair("time_on_card_ms_bucket", "lt_1s")));
                        b2.a(nVar.f89886a, (AiInsightData) obj, "insight_left_swipe");
                        break;
                    default:
                        AiPrompt aiPrompt = (AiPrompt) obj;
                        aiPrompt.getId();
                        zy.c cVar2 = zy.c.f98823a;
                        zy.c.i("ai_fallback_suggestion_tapped", MapsKt.j0(new Pair("surface", "left_swipe"), new Pair("prompt_id", aiPrompt.getId())));
                        Context context2 = nVar.f89886a;
                        int i12 = NovaAiChatActivity.C;
                        context2.startActivity(r.g(context2, aiPrompt.getFullPrompt(), "left_swipe_suggestion", 4));
                        break;
                }
                return Unit.f71706a;
            }
        };
        final int i11 = 1;
        this.f89889d = new Function1(this) { // from class: tx.l

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ n f89849b;

            {
                this.f89849b = this;
            }

            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                int i112 = i11;
                n nVar = this.f89849b;
                switch (i112) {
                    case 0:
                        zy.c cVar = zy.c.f98823a;
                        zy.c.i("ai_insight_feedback", MapsKt.j0(new Pair("surface", "left_swipe"), new Pair(TTConst.TRACK_TYPE, "positive"), new Pair("trigger", "card_tap")));
                        p6.f.O("nova_ai_insight_tapped", MapsKt.j0(new Pair("surface", "left_swipe"), new Pair("position", -1), new Pair("time_on_card_ms_bucket", "lt_1s")));
                        b2.a(nVar.f89886a, (AiInsightData) obj, "insight_left_swipe");
                        break;
                    default:
                        AiPrompt aiPrompt = (AiPrompt) obj;
                        aiPrompt.getId();
                        zy.c cVar2 = zy.c.f98823a;
                        zy.c.i("ai_fallback_suggestion_tapped", MapsKt.j0(new Pair("surface", "left_swipe"), new Pair("prompt_id", aiPrompt.getId())));
                        Context context2 = nVar.f89886a;
                        int i12 = NovaAiChatActivity.C;
                        context2.startActivity(r.g(context2, aiPrompt.getFullPrompt(), "left_swipe_suggestion", 4));
                        break;
                }
                return Unit.f71706a;
            }
        };
        final int i12 = 0;
        this.f89890e = new Function0(this) { // from class: tx.m

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ n f89872b;

            {
                this.f89872b = this;
            }

            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                int i13 = i12;
                n nVar = this.f89872b;
                switch (i13) {
                    case 0:
                        zy.c cVar = zy.c.f98823a;
                        h6.c1.A("surface", "left_swipe", "ai_past_insights_tapped");
                        Context context2 = nVar.f89886a;
                        int i14 = NovaAiInsightHistoryActivity.o;
                        Intent intent = new Intent(context2, (Class<?>) NovaAiInsightHistoryActivity.class);
                        intent.addFlags(268435456);
                        context2.startActivity(intent);
                        break;
                    case 1:
                        zy.c cVar2 = zy.c.f98823a;
                        h6.c1.A("surface", "left_swipe", "ai_open_chat_tapped");
                        Context context3 = nVar.f89886a;
                        int i15 = NovaAiChatActivity.C;
                        context3.startActivity(r.g(context3, null, "left_swipe_open_chat", 6));
                        break;
                    default:
                        zy.c cVar3 = zy.c.f98823a;
                        h6.c1.A("surface", "left_swipe", "ai_settings_opened");
                        Context context4 = nVar.f89886a;
                        context4.startActivity(new Intent(context4, (Class<?>) NovaAiSettingsActivity.class));
                        break;
                }
                return Unit.f71706a;
            }
        };
        final int i13 = 1;
        this.f89891f = new Function0(this) { // from class: tx.m

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ n f89872b;

            {
                this.f89872b = this;
            }

            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                int i132 = i13;
                n nVar = this.f89872b;
                switch (i132) {
                    case 0:
                        zy.c cVar = zy.c.f98823a;
                        h6.c1.A("surface", "left_swipe", "ai_past_insights_tapped");
                        Context context2 = nVar.f89886a;
                        int i14 = NovaAiInsightHistoryActivity.o;
                        Intent intent = new Intent(context2, (Class<?>) NovaAiInsightHistoryActivity.class);
                        intent.addFlags(268435456);
                        context2.startActivity(intent);
                        break;
                    case 1:
                        zy.c cVar2 = zy.c.f98823a;
                        h6.c1.A("surface", "left_swipe", "ai_open_chat_tapped");
                        Context context3 = nVar.f89886a;
                        int i15 = NovaAiChatActivity.C;
                        context3.startActivity(r.g(context3, null, "left_swipe_open_chat", 6));
                        break;
                    default:
                        zy.c cVar3 = zy.c.f98823a;
                        h6.c1.A("surface", "left_swipe", "ai_settings_opened");
                        Context context4 = nVar.f89886a;
                        context4.startActivity(new Intent(context4, (Class<?>) NovaAiSettingsActivity.class));
                        break;
                }
                return Unit.f71706a;
            }
        };
        final int i14 = 2;
        this.f89894i = new Function0(this) { // from class: tx.m

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ n f89872b;

            {
                this.f89872b = this;
            }

            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                int i132 = i14;
                n nVar = this.f89872b;
                switch (i132) {
                    case 0:
                        zy.c cVar = zy.c.f98823a;
                        h6.c1.A("surface", "left_swipe", "ai_past_insights_tapped");
                        Context context2 = nVar.f89886a;
                        int i142 = NovaAiInsightHistoryActivity.o;
                        Intent intent = new Intent(context2, (Class<?>) NovaAiInsightHistoryActivity.class);
                        intent.addFlags(268435456);
                        context2.startActivity(intent);
                        break;
                    case 1:
                        zy.c cVar2 = zy.c.f98823a;
                        h6.c1.A("surface", "left_swipe", "ai_open_chat_tapped");
                        Context context3 = nVar.f89886a;
                        int i15 = NovaAiChatActivity.C;
                        context3.startActivity(r.g(context3, null, "left_swipe_open_chat", 6));
                        break;
                    default:
                        zy.c cVar3 = zy.c.f98823a;
                        h6.c1.A("surface", "left_swipe", "ai_settings_opened");
                        Context context4 = nVar.f89886a;
                        context4.startActivity(new Intent(context4, (Class<?>) NovaAiSettingsActivity.class));
                        break;
                }
                return Unit.f71706a;
            }
        };
    }
}
