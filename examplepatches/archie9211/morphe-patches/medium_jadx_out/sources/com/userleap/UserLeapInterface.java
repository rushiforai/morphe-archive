package com.userleap;

import android.app.Activity;
import android.content.Context;
import defpackage.ik4;
import defpackage.m15;
import defpackage.x45;
import defpackage.z73;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;
import sprig.view.e;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000z\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010$\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u000e\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\b\n\u0002\b\u0007\n\u0002\u0010 \n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0018\u0002\n\u0002\b!\ba\u0018\u00002\u00020\u0001J\u001f\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0003\u001a\u00020\u00022\u0006\u0010\u0005\u001a\u00020\u0004H&¢\u0006\u0004\b\u0007\u0010\bJ?\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0003\u001a\u00020\u00022\u0006\u0010\u0005\u001a\u00020\u00042\u0014\u0010\n\u001a\u0010\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u0001\u0018\u00010\t2\b\u0010\f\u001a\u0004\u0018\u00010\u000bH&¢\u0006\u0004\b\u0007\u0010\rJ\u0017\u0010\u0010\u001a\u00020\u00062\u0006\u0010\u000f\u001a\u00020\u000eH&¢\u0006\u0004\b\u0010\u0010\u0011J#\u0010\u0014\u001a\u00020\u00062\u0006\u0010\u000f\u001a\u00020\u000e2\n\b\u0002\u0010\u0013\u001a\u0004\u0018\u00010\u0012H&¢\u0006\u0004\b\u0014\u0010\u0015J\u001b\u0010\u0016\u001a\u00020\u00062\n\b\u0002\u0010\u0013\u001a\u0004\u0018\u00010\u0012H&¢\u0006\u0004\b\u0016\u0010\u0017J\u0017\u0010\u0019\u001a\u00020\u00062\u0006\u0010\u0018\u001a\u00020\u0004H&¢\u0006\u0004\b\u0019\u0010\u001aJ-\u0010\u0019\u001a\u00020\u00062\u0006\u0010\u0018\u001a\u00020\u00042\u0014\u0010\u001d\u001a\u0010\u0012\u0004\u0012\u00020\u001c\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u001bH&¢\u0006\u0004\b\u0019\u0010\u001eJ\u000f\u0010\u001f\u001a\u00020\u0006H&¢\u0006\u0004\b\u001f\u0010 J\u000f\u0010!\u001a\u00020\u0006H&¢\u0006\u0004\b!\u0010 J\u000f\u0010\"\u001a\u00020\u0006H&¢\u0006\u0004\b\"\u0010 J\u0017\u0010%\u001a\u00020\u00062\u0006\u0010$\u001a\u00020#H&¢\u0006\u0004\b%\u0010&J\u000f\u0010'\u001a\u00020\u0006H&¢\u0006\u0004\b'\u0010 J\u0017\u0010)\u001a\u00020\u00062\u0006\u0010(\u001a\u00020\u0004H&¢\u0006\u0004\b)\u0010\u001aJ\u0017\u0010+\u001a\u00020\u00062\u0006\u0010*\u001a\u00020\u0004H&¢\u0006\u0004\b+\u0010\u001aJ\u0017\u0010-\u001a\u00020\u00062\u0006\u0010,\u001a\u00020\u0004H&¢\u0006\u0004\b-\u0010\u001aJ\u001f\u00100\u001a\u00020\u00062\u0006\u0010.\u001a\u00020\u00042\u0006\u0010/\u001a\u00020\u0004H&¢\u0006\u0004\b0\u00101J\u001f\u00100\u001a\u00020\u00062\u0006\u0010.\u001a\u00020\u00042\u0006\u0010/\u001a\u000202H&¢\u0006\u0004\b0\u00103J\u001f\u00100\u001a\u00020\u00062\u0006\u0010.\u001a\u00020\u00042\u0006\u0010/\u001a\u000204H&¢\u0006\u0004\b0\u00105J#\u00107\u001a\u00020\u00062\u0012\u00106\u001a\u000e\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u00040\tH&¢\u0006\u0004\b7\u00108J7\u00107\u001a\u00020\u00062\u0012\u00106\u001a\u000e\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u00040\t2\b\u00109\u001a\u0004\u0018\u00010\u00042\b\u0010:\u001a\u0004\u0018\u00010\u0004H&¢\u0006\u0004\b7\u0010;J\u001d\u0010=\u001a\u00020\u00062\f\u00106\u001a\b\u0012\u0004\u0012\u00020\u00040<H&¢\u0006\u0004\b=\u0010>J\u0017\u0010?\u001a\u00020\u00062\u0006\u0010(\u001a\u00020\u0004H&¢\u0006\u0004\b?\u0010\u001aJ\u000f\u0010@\u001a\u00020\u0006H&¢\u0006\u0004\b@\u0010 J\u001f\u0010E\u001a\u00020\u00062\u0006\u0010B\u001a\u00020A2\u0006\u0010D\u001a\u00020CH&¢\u0006\u0004\bE\u0010FJ\u001f\u0010G\u001a\u00020\u00062\u0006\u0010B\u001a\u00020A2\u0006\u0010D\u001a\u00020CH&¢\u0006\u0004\bG\u0010FJ\u0017\u0010I\u001a\u00020\u00062\u0006\u0010H\u001a\u00020\u0004H&¢\u0006\u0004\bI\u0010\u001aJ7\u0010K\u001a\u00020\u00062\u0006\u0010J\u001a\u00020\u00012\b\u00109\u001a\u0004\u0018\u00010\u00042\u0014\u00106\u001a\u0010\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u0004\u0018\u00010\tH&¢\u0006\u0004\bK\u0010LJ\u0017\u0010O\u001a\u00020\u00062\u0006\u0010N\u001a\u00020MH&¢\u0006\u0004\bO\u0010PJ\u0019\u0010R\u001a\u00020\u00062\b\u0010Q\u001a\u0004\u0018\u000104H&¢\u0006\u0004\bR\u0010SJ\u0017\u0010\u0010\u001a\u00020\u00062\u0006\u0010T\u001a\u00020\u0004H'¢\u0006\u0004\b\u0010\u0010\u001aJ-\u0010\u0010\u001a\u00020\u00062\u0006\u0010T\u001a\u00020\u00042\u0014\u0010\u001d\u001a\u0010\u0012\u0004\u0012\u00020\u001c\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u001bH'¢\u0006\u0004\b\u0010\u0010\u001eJ7\u0010\u0010\u001a\u00020\u00062\u0006\u0010T\u001a\u00020\u00042\b\u00109\u001a\u0004\u0018\u00010\u00042\u0014\u0010\u001d\u001a\u0010\u0012\u0004\u0012\u00020\u001c\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u001bH'¢\u0006\u0004\b\u0010\u0010UJ+\u0010\u0010\u001a\u00020\u00062\u0006\u0010T\u001a\u00020\u00042\b\u00109\u001a\u0004\u0018\u00010\u00042\b\u0010:\u001a\u0004\u0018\u00010\u0004H'¢\u0006\u0004\b\u0010\u0010VJA\u0010\u0010\u001a\u00020\u00062\u0006\u0010T\u001a\u00020\u00042\b\u00109\u001a\u0004\u0018\u00010\u00042\b\u0010:\u001a\u0004\u0018\u00010\u00042\u0014\u0010\u001d\u001a\u0010\u0012\u0004\u0012\u00020\u001c\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u001bH'¢\u0006\u0004\b\u0010\u0010WJ+\u0010\u0010\u001a\u00020\u00062\u0006\u0010T\u001a\u00020\u00042\u0012\u0010X\u001a\u000e\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u00010\tH'¢\u0006\u0004\b\u0010\u0010YJA\u0010\u0010\u001a\u00020\u00062\u0006\u0010T\u001a\u00020\u00042\u0012\u0010X\u001a\u000e\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u00010\t2\u0014\u0010\u001d\u001a\u0010\u0012\u0004\u0012\u00020\u001c\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u001bH'¢\u0006\u0004\b\u0010\u0010ZJM\u0010\u0010\u001a\u00020\u00062\u0006\u0010T\u001a\u00020\u00042\b\u00109\u001a\u0004\u0018\u00010\u00042\u0014\u0010X\u001a\u0010\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u0001\u0018\u00010\t2\u0014\u0010\u001d\u001a\u0010\u0012\u0004\u0012\u00020\u001c\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u001bH'¢\u0006\u0004\b\u0010\u0010[JA\u0010\u0010\u001a\u00020\u00062\u0006\u0010T\u001a\u00020\u00042\b\u00109\u001a\u0004\u0018\u00010\u00042\b\u0010:\u001a\u0004\u0018\u00010\u00042\u0014\u0010X\u001a\u0010\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u0001\u0018\u00010\tH'¢\u0006\u0004\b\u0010\u0010\\JW\u0010\u0010\u001a\u00020\u00062\u0006\u0010T\u001a\u00020\u00042\b\u00109\u001a\u0004\u0018\u00010\u00042\b\u0010:\u001a\u0004\u0018\u00010\u00042\u0014\u0010X\u001a\u0010\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u0001\u0018\u00010\t2\u0014\u0010\u001d\u001a\u0010\u0012\u0004\u0012\u00020\u001c\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u001bH'¢\u0006\u0004\b\u0010\u0010]J\u001f\u0010\u0014\u001a\u00020\u00062\u0006\u0010T\u001a\u00020\u00042\u0006\u0010\u0013\u001a\u00020\u000bH'¢\u0006\u0004\b\u0014\u0010^J)\u0010\u0014\u001a\u00020\u00062\u0006\u0010T\u001a\u00020\u00042\b\u00109\u001a\u0004\u0018\u00010\u00042\u0006\u0010\u0013\u001a\u00020\u000bH'¢\u0006\u0004\b\u0014\u0010_J3\u0010\u0014\u001a\u00020\u00062\u0006\u0010T\u001a\u00020\u00042\b\u00109\u001a\u0004\u0018\u00010\u00042\b\u0010:\u001a\u0004\u0018\u00010\u00042\u0006\u0010\u0013\u001a\u00020\u000bH'¢\u0006\u0004\b\u0014\u0010`R\u0014\u0010c\u001a\u00020\u00048&X¦\u0004¢\u0006\u0006\u001a\u0004\ba\u0010bR\u001c\u0010h\u001a\u0002048&@&X¦\u000e¢\u0006\f\u001a\u0004\bd\u0010e\"\u0004\bf\u0010gR\u0016\u0010k\u001a\u0004\u0018\u0001048&X¦\u0004¢\u0006\u0006\u001a\u0004\bi\u0010jR\u0016\u0010m\u001a\u0004\u0018\u00010\u00048&X¦\u0004¢\u0006\u0006\u001a\u0004\bl\u0010b¨\u0006n"}, d2 = {"Lcom/userleap/UserLeapInterface;", "", "Landroid/content/Context;", "context", "", "environmentId", "Lc1e;", "configure", "(Landroid/content/Context;Ljava/lang/String;)V", "", "configuration", "Lm15;", "fragmentActivity", "(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;Lm15;)V", "Lcom/userleap/EventPayload;", "payload", "track", "(Lcom/userleap/EventPayload;)V", "Landroid/app/Activity;", "fromActivity", "trackAndPresent", "(Lcom/userleap/EventPayload;Landroid/app/Activity;)V", "presentSurvey", "(Landroid/app/Activity;)V", "surveyId", "presentSurveyWithId", "(Ljava/lang/String;)V", "Lkotlin/Function1;", "Lcom/userleap/SurveyState;", "callback", "(Ljava/lang/String;Lx45;)V", "dismissActiveSurvey", "()V", "pauseDisplayingSurveys", "unpauseDisplayingSurveys", "Lsprig/d/e;", "approvalBlock", "setSessionReplayApprovalBlock", "(Lsprig/d/e;)V", "stopRecording", "identifier", "setUserIdentifier", "locale", "setLocale", "emailAddress", "setEmailAddress", "key", "value", "setVisitorAttribute", "(Ljava/lang/String;Ljava/lang/String;)V", "", "(Ljava/lang/String;Z)V", "", "(Ljava/lang/String;I)V", "attributes", "setVisitorAttributes", "(Ljava/util/Map;)V", "userId", "partnerAnonymousId", "(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V", "", "removeVisitorAttributes", "(Ljava/util/List;)V", "setPartnerAnonymousId", "logout", "Lcom/userleap/EventName;", "eventName", "Lcom/userleap/EventListener;", "listener", "addEventListener", "(Lcom/userleap/EventName;Lcom/userleap/EventListener;)V", "removeEventListener", "previewKey", "setPreviewKey", "optimizelySdk", "integrateOptimizely", "(Ljava/lang/Object;Ljava/lang/String;Ljava/util/Map;)V", "Lcom/userleap/SprigUserInterfaceMode;", "style", "overrideUserInterfaceMode", "(Lcom/userleap/SprigUserInterfaceMode;)V", "height", "setKeyboardHeightForSurveyPlacement", "(Ljava/lang/Integer;)V", "event", "(Ljava/lang/String;Ljava/lang/String;Lx45;)V", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lx45;)V", "properties", "(Ljava/lang/String;Ljava/util/Map;)V", "(Ljava/lang/String;Ljava/util/Map;Lx45;)V", "(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lx45;)V", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lx45;)V", "(Ljava/lang/String;Lm15;)V", "(Ljava/lang/String;Ljava/lang/String;Lm15;)V", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lm15;)V", "getSdkVersion", "()Ljava/lang/String;", "sdkVersion", "getBottomSafeArea", "()I", "setBottomSafeArea", "(I)V", "bottomSafeArea", "getVisitorIdentifier", "()Ljava/lang/Integer;", "visitorIdentifier", "getVisitorIdentifierString", "visitorIdentifierString", "userleap_release"}, k = 1, mv = {1, 8, 0})
public interface UserLeapInterface {

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(k = 3, mv = {1, 8, 0}, xi = 48)
    public static final class DefaultImpls {
        public static /* synthetic */ void presentSurvey$default(UserLeapInterface userLeapInterface, Activity activity, int i, Object obj) {
            if (obj != null) {
                ik4.k("Super calls with default arguments not supported in this target, function: presentSurvey");
                return;
            }
            if ((i & 1) != 0) {
                activity = null;
            }
            userLeapInterface.presentSurvey(activity);
        }

        public static /* synthetic */ void trackAndPresent$default(UserLeapInterface userLeapInterface, EventPayload eventPayload, Activity activity, int i, Object obj) {
            if (obj != null) {
                ik4.k("Super calls with default arguments not supported in this target, function: trackAndPresent");
                return;
            }
            if ((i & 2) != 0) {
                activity = null;
            }
            userLeapInterface.trackAndPresent(eventPayload, activity);
        }
    }

    void addEventListener(EventName eventName, EventListener listener);

    void configure(Context context, String environmentId);

    void configure(Context context, String environmentId, Map<String, ? extends Object> configuration, m15 fragmentActivity);

    void dismissActiveSurvey();

    int getBottomSafeArea();

    String getSdkVersion();

    Integer getVisitorIdentifier();

    String getVisitorIdentifierString();

    void integrateOptimizely(Object optimizelySdk, String userId, Map<String, String> attributes);

    void logout();

    void overrideUserInterfaceMode(SprigUserInterfaceMode style);

    void pauseDisplayingSurveys();

    void presentSurvey(Activity fromActivity);

    void presentSurveyWithId(String surveyId);

    void presentSurveyWithId(String surveyId, x45 callback);

    void removeEventListener(EventName eventName, EventListener listener);

    void removeVisitorAttributes(List<String> attributes);

    void setBottomSafeArea(int i);

    void setEmailAddress(String emailAddress);

    void setKeyboardHeightForSurveyPlacement(Integer height);

    void setLocale(String locale);

    void setPartnerAnonymousId(String identifier);

    void setPreviewKey(String previewKey);

    void setSessionReplayApprovalBlock(e approvalBlock);

    void setUserIdentifier(String identifier);

    void setVisitorAttribute(String key, int value);

    void setVisitorAttribute(String key, String value);

    void setVisitorAttribute(String key, boolean value);

    void setVisitorAttributes(Map<String, String> attributes);

    void setVisitorAttributes(Map<String, String> attributes, String userId, String partnerAnonymousId);

    void stopRecording();

    void track(EventPayload payload);

    @z73
    void track(String event);

    @z73
    void track(String event, String userId, String partnerAnonymousId);

    @z73
    void track(String event, String userId, String partnerAnonymousId, Map<String, ? extends Object> properties);

    @z73
    void track(String event, String userId, String partnerAnonymousId, Map<String, ? extends Object> properties, x45 callback);

    @z73
    void track(String event, String userId, String partnerAnonymousId, x45 callback);

    @z73
    void track(String event, String userId, Map<String, ? extends Object> properties, x45 callback);

    @z73
    void track(String event, String userId, x45 callback);

    @z73
    void track(String event, Map<String, ? extends Object> properties);

    @z73
    void track(String event, Map<String, ? extends Object> properties, x45 callback);

    @z73
    void track(String event, x45 callback);

    void trackAndPresent(EventPayload payload, Activity fromActivity);

    @z73
    void trackAndPresent(String event, String userId, String partnerAnonymousId, m15 fromActivity);

    @z73
    void trackAndPresent(String event, String userId, m15 fromActivity);

    @z73
    void trackAndPresent(String event, m15 fromActivity);

    void unpauseDisplayingSurveys();
}
