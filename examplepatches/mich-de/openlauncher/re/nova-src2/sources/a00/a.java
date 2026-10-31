package a00;

import android.content.Context;
import android.util.Log;
import androidx.datastore.core.CorruptionException;
import bu.u;
import com.instabridge.ai.billing.RejectedTokenStore;
import com.instabridge.ai.context.AiContextManager;
import com.instabridge.ai.context.AppUsageProvider;
import com.instabridge.ai.context.collectors.CalendarEvent;
import com.instabridge.ai.context.collectors.ContactsCollector;
import com.instabridge.ai.context.collectors.UsagePatternCollector;
import com.instabridge.ai.context.summarizers.CalendarEventsSummarizer;
import com.instabridge.ai.tools.AiTool;
import com.instabridge.ai.tools.ContactResolver;
import com.instabridge.ai.tools.DynamicIntentTool;
import com.instabridge.ai.tools.SendMessageTool;
import com.instabridge.ai.tools.perapp.PerAppFeatureCatalog;
import com.stripe.android.lpmfoundations.paymentmethod.CustomerMetadata;
import com.stripe.android.lpmfoundations.paymentmethod.PaymentMethodMetadata;
import com.teslacoilsw.conditions.rules.ConditionModel;
import com.teslacoilsw.launcher.onboarding.FirstRunActivityCompose;
import e10.z2;
import en.i;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Pair;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.MatchResult;
import kotlinx.serialization.json.JsonBuilder;

/* loaded from: classes4.dex */
public final /* synthetic */ class a implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f58a;

    public /* synthetic */ a(int i5) {
        this.f58a = i5;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        CustomerMetadata customerMetadata;
        switch (this.f58a) {
            case 0:
                return z2.Y(((Context) obj).getResources().getDrawable(2131231142));
            case 1:
                PaymentMethodMetadata paymentMethodMetadata = (PaymentMethodMetadata) obj;
                if (paymentMethodMetadata == null || (customerMetadata = paymentMethodMetadata.f43105p) == null) {
                    return null;
                }
                return customerMetadata.f43075e;
            case 2:
                MatchResult it = (MatchResult) obj;
                Intrinsics.g(it, "it");
                return it.a();
            case 3:
                String it2 = (String) obj;
                Intrinsics.g(it2, "it");
                return Boolean.valueOf(it2.length() == 0);
            case 4:
                JsonBuilder Json = (JsonBuilder) obj;
                Intrinsics.g(Json, "$this$Json");
                Json.setIgnoreUnknownKeys(true);
                Json.setLenient(true);
                Json.setEncodeDefaults(true);
                return Unit.f71706a;
            case 5:
                ConditionModel conditionModel = (ConditionModel) obj;
                if (conditionModel instanceof ConditionModel.BluetoothConnectedModel) {
                    return "Bluetooth";
                }
                if (conditionModel instanceof ConditionModel.TimeOfDayDurationModel) {
                    return "Time Duration";
                }
                if (conditionModel instanceof ConditionModel.TimeOfDayHourRangeModel) {
                    return "Time Hour Range";
                }
                if (conditionModel instanceof ConditionModel.WeatherChangeModel) {
                    return "Weather";
                }
                if (conditionModel instanceof ConditionModel.WifiConnectedModel) {
                    return "Wifi";
                }
                throw new NoWhenBranchMatchedException();
            case 6:
                int i5 = FirstRunActivityCompose.f45937s;
                return Unit.f71706a;
            case 7:
                return Unit.f71706a;
            case 8:
                return Unit.f71706a;
            case 9:
                CorruptionException ex2 = (CorruptionException) obj;
                Intrinsics.g(ex2, "ex");
                Log.w("FirebaseSessions", "CorruptionException in session configs DataStore", ex2);
                return i.f52837b;
            case 10:
                u it3 = (u) obj;
                Intrinsics.g(it3, "it");
                return Boolean.valueOf(it3.f18592d);
            case 11:
                return Unit.f71706a;
            case 12:
                ((Function0) obj).invoke();
                return Unit.f71706a;
            case 13:
                ((Long) obj).longValue();
                return Unit.f71706a;
            case 14:
                return Unit.f71706a;
            case 15:
                return Unit.f71706a;
            case 16:
                return RejectedTokenStore.hash$lambda$6(((Byte) obj).byteValue());
            case 17:
                return AiContextManager.Companion.computeContextContentHash$lambda$5(((Byte) obj).byteValue());
            case 18:
                return ContactsCollector.batchLookupPhones$lambda$37(((Long) obj).longValue());
            case 19:
                return ContactsCollector.batchLookupNicknames$lambda$48(((Long) obj).longValue());
            case 20:
                return ContactsCollector.batchLookupEmails$lambda$43(((Long) obj).longValue());
            case 21:
                return UsagePatternCollector.buildHostProviderSnippet$lambda$3((AppUsageProvider.AppUsageEntry) obj);
            case 22:
                return UsagePatternCollector.buildHostProviderSnippet$lambda$4((AppUsageProvider.AppUsageEntry) obj);
            case 23:
                return CalendarEventsSummarizer.summarize$lambda$4$lambda$3((CalendarEvent) obj);
            case 24:
                return AiTool._get_displayName_$lambda$1((String) obj);
            case 25:
                return AiTool.OpenApp.toDefinition$lambda$5$lambda$4((PerAppFeatureCatalog.Feature) obj);
            case 26:
                return AiTool.OpenApp.toDefinition$lambda$5((Pair) obj);
            case 27:
                return ContactResolver.formatAmbiguousMessage$lambda$1((SendMessageTool.ResolvedContact) obj);
            case 28:
                return DynamicIntentTool.SCHEME_SEARCH_PATTERNS$lambda$8((String) obj);
            default:
                return DynamicIntentTool.SCHEME_SEARCH_PATTERNS$lambda$17((String) obj);
        }
    }
}
