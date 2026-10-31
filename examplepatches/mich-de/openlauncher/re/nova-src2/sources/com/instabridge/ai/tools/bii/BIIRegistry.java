package com.instabridge.ai.tools.bii;

import ab.e0;
import android.net.Uri;
import b70.k;
import com.google.android.libraries.places.api.model.PlaceTypes;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.collections.builders.ListBuilder;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u000e\n\u0002\b\u0002\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0010\u0010\n\u001a\u0004\u0018\u00010\u00062\u0006\u0010\u000b\u001a\u00020\fJ\u0010\u0010\r\u001a\u0004\u0018\u00010\u00062\u0006\u0010\u000b\u001a\u00020\fR\u0014\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R\u0017\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\u00060\u00058F¢\u0006\u0006\u001a\u0004\b\b\u0010\t¨\u0006\u000e"}, d2 = {"Lcom/instabridge/ai/tools/bii/BIIRegistry;", b.f42142b, "<init>", "()V", "entries", b.f42142b, "Lcom/instabridge/ai/tools/bii/BIIEntry;", "all", "getAll", "()Ljava/util/List;", "byBiiName", PendingUpgradeStore.KEY_NAME, b.f42142b, "byToolName", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class BIIRegistry {
    public static final int $stable;

    @NotNull
    public static final BIIRegistry INSTANCE = new BIIRegistry();

    @NotNull
    private static final List<BIIEntry> entries;

    /* JADX WARN: Multi-variable type inference failed */
    static {
        ListBuilder listBuilderW = ul.b.w();
        BIIParameterType bIIParameterType = BIIParameterType.STRING;
        int i5 = 48;
        DefaultConstructorMarker defaultConstructorMarker = null;
        listBuilderW.add(new BIIEntry("actions.intent.OPEN_APP_FEATURE", "open_app_feature", "Launch a specific feature inside an app. Use when the user names an app and a feature (e.g., 'open my shopping list in Keep', 'open messages in Telegram').", "common", ul.b.Q(new BIIParameter("feature.name", bIIParameterType, "Name of the feature to open", true, null, null, 48, null), new BIIParameter("app.name", bIIParameterType, "App display name", true, 0 == true ? 1 : 0, null, i5, defaultConstructorMarker)), false, null));
        boolean z11 = true;
        String str = null;
        listBuilderW.add(new BIIEntry("actions.intent.GET_THING", "get_thing", "Search within an app's default in-app search. Use only when scoping the search to one specific app; prefer search_web for general web searches.", "common", ul.b.Q(new BIIParameter("thing.name", bIIParameterType, "Search query", z11, 0 == true ? 1 : 0, str, i5, defaultConstructorMarker), new BIIParameter("app.name", bIIParameterType, "Target app name", z11, 0 == true ? 1 : 0, str, i5, defaultConstructorMarker)), false, null));
        int i11 = 56;
        DefaultConstructorMarker defaultConstructorMarker2 = null;
        boolean z12 = false;
        listBuilderW.add(new BIIEntry("actions.intent.CREATE_CALL", "create_call", "Place a phone call. Use when the user says 'call mom', 'phone John', 'dial +15551234567', 'video call Alice'. Opens the dialer with the number pre-filled. Provide either a contact name (requires contacts permission — returns a clear error if denied) OR a phone number directly (no permission needed).", "communication", ul.b.Q(new BIIParameter("call.recipient.name", bIIParameterType, "Contact display name (e.g., 'mom', 'John Smith'). Uses contacts to resolve the number.", z12, 0 == true ? 1 : 0, str, i11, defaultConstructorMarker2), new BIIParameter("call.recipient.telephone", bIIParameterType, "Phone number to dial (E.164 format preferred: '+12125551234'). Use when the user gives a number directly — avoids contacts permission.", z12, 0 == true ? 1 : 0, str, i11, defaultConstructorMarker2), new BIIParameter("call.callFormat", bIIParameterType, "Call type: 'audio' (default) or 'video'", z12, ul.b.Q("audio", "video"), str, 40, defaultConstructorMarker2)), false, new IntentTemplate("android.intent.action.DIAL", new com.instabridge.ai.tools.b(23), null, null, 12, null)));
        int i12 = 56;
        DefaultConstructorMarker defaultConstructorMarker3 = null;
        boolean z13 = false;
        List list = null;
        listBuilderW.add(new BIIEntry("actions.intent.CREATE_MESSAGE", "create_message", "Send a text message. Use when the user says 'text John', 'send an SMS to mom', 'message Alice I'm running late'. Opens the messaging app with the recipient and body pre-filled. Works with any SMS / messaging app that handles the standard sendto: intent.", "communication", ul.b.Q(new BIIParameter("message.recipient.name", bIIParameterType, "Recipient contact name. Uses contacts to resolve.", z13, list, str, i12, defaultConstructorMarker3), new BIIParameter("message.recipient.telephone", bIIParameterType, "Recipient phone number (E.164 preferred). Use when the user gives a number — avoids contacts permission.", z13, list, str, i12, defaultConstructorMarker3), new BIIParameter("message.text", bIIParameterType, "The message body to pre-fill in the draft.", z13, list, str, i12, defaultConstructorMarker3)), false, new IntentTemplate("android.intent.action.SENDTO", new com.instabridge.ai.tools.b(24), k.e0(new Pair("sms_body", new com.instabridge.ai.tools.b(25))), null, 8, null)));
        listBuilderW.add(new BIIEntry("actions.intent.GET_MESSAGE", "get_message", "Find and view messages, filtered by sender / date / topic. Use when the user says 'show messages from Alice', 'my texts from last week', 'conversation about the project'. Launches the messaging app to the filtered view so the user can read the messages themselves.", "communication", ul.b.Q(new BIIParameter("message.sender.name", bIIParameterType, "Filter by sender name (e.g., 'Alice', 'mom')", z13, list, str, i12, defaultConstructorMarker3), new BIIParameter("message.recipient.name", bIIParameterType, "Filter by recipient name", z13, list, str, i12, defaultConstructorMarker3), new BIIParameter("message.temporalCoverage", bIIParameterType, "Date range — ISO 8601 or natural ('last week', 'yesterday', '2026-04-01/2026-04-07')", z13, list, str, i12, defaultConstructorMarker3), new BIIParameter("message.description", bIIParameterType, "Topic or content keywords to search within conversations", z13, list, str, i12, defaultConstructorMarker3)), false, new IntentTemplate("android.intent.action.MAIN", null, null, e0.U("android.intent.category.APP_MESSAGING"), 6, null)));
        DefaultConstructorMarker defaultConstructorMarker4 = null;
        int i13 = 56;
        boolean z14 = false;
        listBuilderW.add(new BIIEntry("actions.intent.START_EXERCISE", "start_exercise", "Start tracking a workout in real time. Use when the user says 'start a run', 'begin cycling', 'start my workout', 'track my hike', or similar. Requires a fitness app installed that declared this capability — only registered when such an app is detected on the device.", "health_fitness", ul.b.Q(new BIIParameter("exercise.name", bIIParameterType, "Exercise type: 'run', 'walk', 'bike ride', 'hike', 'swim', 'yoga', etc.", true, list, str, 48, defaultConstructorMarker4), new BIIParameter("exercise.duration", bIIParameterType, "Optional target duration in ISO 8601 format (e.g., 'PT30M' for 30 minutes, 'PT1H' for 1 hour)", z14, list, str, i13, defaultConstructorMarker4), new BIIParameter("exercise.distance", bIIParameterType, "Optional target distance with unit (e.g., '5km', '3 miles')", z14, list, str, i13, defaultConstructorMarker4)), false, null));
        listBuilderW.add(new BIIEntry("actions.intent.PAUSE_EXERCISE", "pause_exercise", "Pause the active workout. Use when the user says 'pause my run', 'pause workout', 'hold on the tracking'. Only works if a workout is currently being tracked by a fitness app.", "health_fitness", ul.b.P(new BIIParameter("exercise.name", bIIParameterType, "Optional exercise type to disambiguate if multiple workouts active", z14, list, str, i13, defaultConstructorMarker4)), false, null));
        listBuilderW.add(new BIIEntry("actions.intent.RESUME_EXERCISE", "resume_exercise", "Resume a paused workout. Use when the user says 'resume', 'continue my run', 'unpause workout'.", "health_fitness", ul.b.P(new BIIParameter("exercise.name", bIIParameterType, "Optional exercise type", false, null, null, 56, null)), false, null));
        listBuilderW.add(new BIIEntry("actions.intent.STOP_EXERCISE", "stop_exercise", "End and save the active workout. Use when the user says 'end workout', 'stop my run', 'I'm done', 'finish tracking'.", "health_fitness", ul.b.P(new BIIParameter("exercise.name", bIIParameterType, "Optional exercise type", false, null, null, 56, null)), false, null));
        DefaultConstructorMarker defaultConstructorMarker5 = null;
        List list2 = null;
        String str2 = null;
        int i14 = 56;
        boolean z15 = false;
        listBuilderW.add(new BIIEntry("actions.intent.TRACK_EXERCISE", "track_exercise", "Log an already-completed workout after the fact. Use when the user says 'log a run I just did', 'record my 5km walk', 'track the workout I finished'. Different from start_exercise — this is for retroactive logging, not live tracking.", "health_fitness", ul.b.Q(new BIIParameter("exercise.name", bIIParameterType, "Exercise type (run, bike, walk, etc.)", true, list2, str2, 48, defaultConstructorMarker5), new BIIParameter("exercise.duration", bIIParameterType, "ISO 8601 duration (e.g., 'PT45M')", z15, list2, str2, i14, defaultConstructorMarker5), new BIIParameter("exercise.distance", bIIParameterType, "Distance with unit (e.g., '5km')", z15, list2, str2, i14, defaultConstructorMarker5)), false, null));
        int i15 = 56;
        DefaultConstructorMarker defaultConstructorMarker6 = null;
        String str3 = null;
        listBuilderW.add(new BIIEntry("actions.intent.GET_EXERCISE_OBSERVATION", "get_exercise_observation", "View aggregated workout stats (steps, distance, pace, etc.) for a period. Use when the user says 'how many steps today', 'miles ran this week', 'my workout stats', 'show my cycling distance'. Opens the fitness app to the relevant stats screen.", "health_fitness", ul.b.Q(new BIIParameter("exerciseObservation.name", bIIParameterType, "Metric name: 'steps', 'distance', 'pace', 'calories', 'active minutes'", z15, list2, str3, i15, defaultConstructorMarker6), new BIIParameter("exerciseObservation.temporalCoverage", bIIParameterType, "Date range, ISO 8601 or natural ('today', 'this week', 'last month')", z15, list2, str3, i15, defaultConstructorMarker6)), false, null));
        int i16 = 56;
        listBuilderW.add(new BIIEntry("actions.intent.GET_EXERCISE_PLAN", "get_exercise_plan", "Open a workout plan or training program. Use when the user says 'show my training plan', 'open my marathon plan', 'what's today's workout plan'.", "health_fitness", ul.b.P(new BIIParameter("exercisePlan.name", bIIParameterType, "Plan name (e.g., 'marathon training', 'beginner yoga')", z15, list2, str3, i16, null)), false, null));
        DefaultConstructorMarker defaultConstructorMarker7 = null;
        listBuilderW.add(new BIIEntry("actions.intent.GET_FOOD_OBSERVATION", "get_food_observation", "View logged food intake or nutrient stats for a period. Use when the user says 'how many calories today', 'my protein this week', 'show my food log'. Opens the nutrition tracking app.", "health_fitness", ul.b.Q(new BIIParameter("foodObservation.name", bIIParameterType, "Nutrient: 'calories', 'protein', 'carbs', 'fat', 'fiber', 'sugar'", z15, list2, str3, i16, defaultConstructorMarker7), new BIIParameter("foodObservation.temporalCoverage", bIIParameterType, "Date range ('today', 'this week', or ISO 8601)", z15, list2, str3, i16, defaultConstructorMarker7)), false, null));
        int i17 = 56;
        boolean z16 = false;
        listBuilderW.add(new BIIEntry("actions.intent.RECORD_FOOD_OBSERVATION", "record_food_observation", "Log food, drinks, or nutrient intake. Use when the user says 'log a banana', 'I just ate pizza for lunch', 'record my breakfast', 'track 500 calories'.", "health_fitness", ul.b.Q(new BIIParameter("foodObservation.about.name", bIIParameterType, "Food name (e.g., 'banana', 'pizza slice', 'green salad')", true, list2, str3, 48, defaultConstructorMarker7), new BIIParameter("foodObservation.forMeal", bIIParameterType, "Meal type: 'breakfast', 'lunch', 'dinner', 'snack'", z16, list2, str3, i17, defaultConstructorMarker7)), false, null));
        listBuilderW.add(new BIIEntry("actions.intent.GET_HEALTH_OBSERVATION", "get_health_observation", "View personal health stats (weight, heart rate, sleep, blood pressure, etc.). Use when the user says 'what's my weight', 'my heart rate today', 'how did I sleep last night', 'my blood pressure'.", "health_fitness", ul.b.Q(new BIIParameter("healthObservation.name", bIIParameterType, "Metric: 'weight', 'heart rate', 'sleep', 'blood pressure', 'blood oxygen', 'temperature'", z16, list2, str3, i17, defaultConstructorMarker7), new BIIParameter("healthObservation.temporalCoverage", bIIParameterType, "Date range ('today', 'this week', or ISO 8601)", z16, list2, str3, i17, defaultConstructorMarker7)), false, null));
        listBuilderW.add(new BIIEntry("actions.intent.RECORD_HEALTH_OBSERVATION", "record_health_observation", "Log a health measurement. Use when the user says 'I weigh 170 lbs', 'my mood today is good', 'log my blood pressure 120/80', 'record my temperature'.", "health_fitness", ul.b.Q(new BIIParameter("healthObservation.about.name", bIIParameterType, "Metric name (e.g., 'weight', 'mood', 'blood pressure')", true, list2, str3, 48, defaultConstructorMarker7), new BIIParameter("healthObservation.value", bIIParameterType, "The value to log (with unit if applicable: '170 lbs', '120/80')", false, list2, str3, 56, defaultConstructorMarker7)), false, null));
        listBuilderW.add(new BIIEntry("actions.intent.CREATE_ITEM_LIST", "create_item_list", "[Internal, wrapped by Nova's create_list tool] Create a new list in the user's preferred list app.", "productivity", ul.b.Q(new BIIParameter("itemList.name", bIIParameterType, "List name", true, null, null, 48, null), new BIIParameter("itemList.itemListElement", BIIParameterType.ARRAY, "Optional initial items (strings)", false, 0 == true ? 1 : 0, null, 56, null)), false, null));
        boolean z17 = false;
        listBuilderW.add(new BIIEntry("actions.intent.GET_ITEM_LIST", "get_item_list", "[Internal, wrapped by Nova's read_list tool] Launch the list app filtered by name.", "productivity", ul.b.P(new BIIParameter("itemList.name", bIIParameterType, "List name (e.g., 'shopping')", z17, null, null, 56, null)), false, null));
        DefaultConstructorMarker defaultConstructorMarker8 = null;
        List list3 = null;
        String str4 = null;
        listBuilderW.add(new BIIEntry("actions.intent.UPDATE_ITEM_LIST", "update_item_list", "[Internal, wrapped by Nova's add_to_list tool] Add an item to an existing list via intent dispatch.", "productivity", ul.b.Q(new BIIParameter("itemList.name", bIIParameterType, "Target list name", z17, list3, str4, 56, defaultConstructorMarker8), new BIIParameter("itemList.itemListElement.name", bIIParameterType, "Item to add", true, list3, str4, 48, defaultConstructorMarker8)), false, null));
        int i18 = 56;
        DefaultConstructorMarker defaultConstructorMarker9 = null;
        boolean z18 = false;
        String str5 = null;
        listBuilderW.add(new BIIEntry("actions.intent.GET_CHARGING_STATION", "get_charging_station", "Find EV charging stations near a location.", "transportation", ul.b.Q(new BIIParameter("evChargingStation.location.name", bIIParameterType, "Location (address or 'near me')", z18, list3, str5, i18, defaultConstructorMarker9), new BIIParameter("evChargingStation.connectorType", bIIParameterType, "Plug type (CCS, Tesla, etc.)", z18, list3, str5, i18, defaultConstructorMarker9)), false, new IntentTemplate("android.intent.action.VIEW", new com.instabridge.ai.tools.b(26), null, null, 12, null)));
        listBuilderW.add(new BIIEntry("actions.intent.GET_PARKING_FACILITY", "get_parking_facility", "Find parking near a location.", "transportation", ul.b.P(new BIIParameter("parkingFacility.location.name", bIIParameterType, "Location (address or 'near me')", false, null, str5, 56, null)), false, new IntentTemplate("android.intent.action.VIEW", new com.instabridge.ai.tools.b(27), null, null, 12, null)));
        entries = ul.b.m(listBuilderW);
        $stable = 8;
    }

    private BIIRegistry() {
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final Uri entries$lambda$9$lambda$1(Map p11) {
        Intrinsics.g(p11, "p");
        Object obj = p11.get("call.recipient.telephone");
        String str = obj instanceof String ? (String) obj : null;
        if (str != null) {
            return Uri.parse("tel:".concat(str));
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final Uri entries$lambda$9$lambda$3(Map p11) {
        Intrinsics.g(p11, "p");
        Object obj = p11.get("message.recipient.telephone");
        String str = obj instanceof String ? (String) obj : null;
        if (str != null) {
            return Uri.parse("smsto:".concat(str));
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final Object entries$lambda$9$lambda$4(Map p11) {
        Intrinsics.g(p11, "p");
        return p11.get("message.text");
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:10:0x002a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Uri entries$lambda$9$lambda$6(Map p11) {
        String str;
        Intrinsics.g(p11, "p");
        Object obj = p11.get("evChargingStation.location.name");
        String str2 = obj instanceof String ? (String) obj : null;
        if (str2 != null) {
            str = "+near+" + Uri.encode(str2);
            if (str == null) {
                str = b.f42142b;
            }
        }
        return Uri.parse("geo:0,0?q=" + Uri.encode("EV charging station") + str);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:10:0x002a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Uri entries$lambda$9$lambda$8(Map p11) {
        String str;
        Intrinsics.g(p11, "p");
        Object obj = p11.get("parkingFacility.location.name");
        String str2 = obj instanceof String ? (String) obj : null;
        if (str2 != null) {
            str = "+near+" + Uri.encode(str2);
            if (str == null) {
                str = b.f42142b;
            }
        }
        return Uri.parse("geo:0,0?q=" + Uri.encode(PlaceTypes.PARKING) + str);
    }

    @Nullable
    public final BIIEntry byBiiName(@NotNull String name) {
        Object next;
        Intrinsics.g(name, "name");
        Iterator<T> it = entries.iterator();
        while (true) {
            if (!it.hasNext()) {
                next = null;
                break;
            }
            next = it.next();
            if (Intrinsics.b(((BIIEntry) next).getBiiName(), name)) {
                break;
            }
        }
        return (BIIEntry) next;
    }

    @Nullable
    public final BIIEntry byToolName(@NotNull String name) {
        Object next;
        Intrinsics.g(name, "name");
        Iterator<T> it = entries.iterator();
        while (true) {
            if (!it.hasNext()) {
                next = null;
                break;
            }
            next = it.next();
            if (Intrinsics.b(((BIIEntry) next).getToolName(), name)) {
                break;
            }
        }
        return (BIIEntry) next;
    }

    @NotNull
    public final List<BIIEntry> getAll() {
        return entries;
    }
}
