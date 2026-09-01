package com.userleap;

import android.app.Activity;
import android.content.Context;
import defpackage.m15;
import defpackage.x45;
import defpackage.z73;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;
import sprig.view.e;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000\u0084\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010$\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010 \n\u0002\b\u0004\n\u0002\u0010\b\n\u0002\b\t\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u000b\n\u0002\b\n\n\u0002\u0018\u0002\n\u0002\b!\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J \u0010\t\u001a\u00020\b2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u0006H\u0096\u0001¢\u0006\u0004\b\t\u0010\nJ \u0010\u000f\u001a\u00020\b2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\u000e\u001a\u00020\rH\u0096\u0001¢\u0006\u0004\b\u000f\u0010\u0010J@\u0010\u000f\u001a\u00020\b2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\u000e\u001a\u00020\r2\u0014\u0010\u0013\u001a\u0010\u0012\u0004\u0012\u00020\r\u0012\u0004\u0012\u00020\u0012\u0018\u00010\u00112\b\u0010\u0015\u001a\u0004\u0018\u00010\u0014H\u0096\u0001¢\u0006\u0004\b\u000f\u0010\u0016J\u0010\u0010\u0017\u001a\u00020\bH\u0096\u0001¢\u0006\u0004\b\u0017\u0010\u0003J8\u0010\u001b\u001a\u00020\b2\u0006\u0010\u0018\u001a\u00020\u00122\b\u0010\u0019\u001a\u0004\u0018\u00010\r2\u0014\u0010\u001a\u001a\u0010\u0012\u0004\u0012\u00020\r\u0012\u0004\u0012\u00020\r\u0018\u00010\u0011H\u0096\u0001¢\u0006\u0004\b\u001b\u0010\u001cJ\u0010\u0010\u001d\u001a\u00020\bH\u0096\u0001¢\u0006\u0004\b\u001d\u0010\u0003J\u0018\u0010 \u001a\u00020\b2\u0006\u0010\u001f\u001a\u00020\u001eH\u0096\u0001¢\u0006\u0004\b \u0010!J\u0010\u0010\"\u001a\u00020\bH\u0096\u0001¢\u0006\u0004\b\"\u0010\u0003J\u001c\u0010%\u001a\u00020\b2\n\b\u0002\u0010$\u001a\u0004\u0018\u00010#H\u0096\u0001¢\u0006\u0004\b%\u0010&J\u0018\u0010(\u001a\u00020\b2\u0006\u0010'\u001a\u00020\rH\u0096\u0001¢\u0006\u0004\b(\u0010)J.\u0010(\u001a\u00020\b2\u0006\u0010'\u001a\u00020\r2\u0014\u0010,\u001a\u0010\u0012\u0004\u0012\u00020+\u0012\u0004\u0012\u00020\b\u0018\u00010*H\u0096\u0001¢\u0006\u0004\b(\u0010-J \u0010.\u001a\u00020\b2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u0006H\u0096\u0001¢\u0006\u0004\b.\u0010\nJ\u001e\u00100\u001a\u00020\b2\f\u0010\u001a\u001a\b\u0012\u0004\u0012\u00020\r0/H\u0096\u0001¢\u0006\u0004\b0\u00101J\u0018\u00103\u001a\u00020\b2\u0006\u00102\u001a\u00020\rH\u0096\u0001¢\u0006\u0004\b3\u0010)J\u001a\u00106\u001a\u00020\b2\b\u00105\u001a\u0004\u0018\u000104H\u0096\u0001¢\u0006\u0004\b6\u00107J\u0018\u00109\u001a\u00020\b2\u0006\u00108\u001a\u00020\rH\u0096\u0001¢\u0006\u0004\b9\u0010)J\u0018\u0010;\u001a\u00020\b2\u0006\u0010:\u001a\u00020\rH\u0096\u0001¢\u0006\u0004\b;\u0010)J\u0018\u0010=\u001a\u00020\b2\u0006\u0010<\u001a\u00020\rH\u0096\u0001¢\u0006\u0004\b=\u0010)J\u0018\u0010@\u001a\u00020\b2\u0006\u0010?\u001a\u00020>H\u0096\u0001¢\u0006\u0004\b@\u0010AJ\u0018\u0010B\u001a\u00020\b2\u0006\u0010:\u001a\u00020\rH\u0096\u0001¢\u0006\u0004\bB\u0010)J \u0010F\u001a\u00020\b2\u0006\u0010C\u001a\u00020\r2\u0006\u0010E\u001a\u00020DH\u0096\u0001¢\u0006\u0004\bF\u0010GJ \u0010F\u001a\u00020\b2\u0006\u0010C\u001a\u00020\r2\u0006\u0010E\u001a\u000204H\u0096\u0001¢\u0006\u0004\bF\u0010HJ \u0010F\u001a\u00020\b2\u0006\u0010C\u001a\u00020\r2\u0006\u0010E\u001a\u00020\rH\u0096\u0001¢\u0006\u0004\bF\u0010IJ$\u0010J\u001a\u00020\b2\u0012\u0010\u001a\u001a\u000e\u0012\u0004\u0012\u00020\r\u0012\u0004\u0012\u00020\r0\u0011H\u0096\u0001¢\u0006\u0004\bJ\u0010KJ8\u0010J\u001a\u00020\b2\u0012\u0010\u001a\u001a\u000e\u0012\u0004\u0012\u00020\r\u0012\u0004\u0012\u00020\r0\u00112\b\u0010\u0019\u001a\u0004\u0018\u00010\r2\b\u0010L\u001a\u0004\u0018\u00010\rH\u0096\u0001¢\u0006\u0004\bJ\u0010MJ\u0010\u0010N\u001a\u00020\bH\u0096\u0001¢\u0006\u0004\bN\u0010\u0003J\u0018\u0010Q\u001a\u00020\b2\u0006\u0010P\u001a\u00020OH\u0096\u0001¢\u0006\u0004\bQ\u0010RJ\u0018\u0010Q\u001a\u00020\b2\u0006\u0010S\u001a\u00020\rH\u0097\u0001¢\u0006\u0004\bQ\u0010)J.\u0010Q\u001a\u00020\b2\u0006\u0010S\u001a\u00020\r2\u0014\u0010,\u001a\u0010\u0012\u0004\u0012\u00020+\u0012\u0004\u0012\u00020\b\u0018\u00010*H\u0097\u0001¢\u0006\u0004\bQ\u0010-J8\u0010Q\u001a\u00020\b2\u0006\u0010S\u001a\u00020\r2\b\u0010\u0019\u001a\u0004\u0018\u00010\r2\u0014\u0010,\u001a\u0010\u0012\u0004\u0012\u00020+\u0012\u0004\u0012\u00020\b\u0018\u00010*H\u0097\u0001¢\u0006\u0004\bQ\u0010TJ,\u0010Q\u001a\u00020\b2\u0006\u0010S\u001a\u00020\r2\b\u0010\u0019\u001a\u0004\u0018\u00010\r2\b\u0010L\u001a\u0004\u0018\u00010\rH\u0097\u0001¢\u0006\u0004\bQ\u0010UJB\u0010Q\u001a\u00020\b2\u0006\u0010S\u001a\u00020\r2\b\u0010\u0019\u001a\u0004\u0018\u00010\r2\b\u0010L\u001a\u0004\u0018\u00010\r2\u0014\u0010,\u001a\u0010\u0012\u0004\u0012\u00020+\u0012\u0004\u0012\u00020\b\u0018\u00010*H\u0097\u0001¢\u0006\u0004\bQ\u0010VJB\u0010Q\u001a\u00020\b2\u0006\u0010S\u001a\u00020\r2\b\u0010\u0019\u001a\u0004\u0018\u00010\r2\b\u0010L\u001a\u0004\u0018\u00010\r2\u0014\u0010W\u001a\u0010\u0012\u0004\u0012\u00020\r\u0012\u0004\u0012\u00020\u0012\u0018\u00010\u0011H\u0097\u0001¢\u0006\u0004\bQ\u0010XJX\u0010Q\u001a\u00020\b2\u0006\u0010S\u001a\u00020\r2\b\u0010\u0019\u001a\u0004\u0018\u00010\r2\b\u0010L\u001a\u0004\u0018\u00010\r2\u0014\u0010W\u001a\u0010\u0012\u0004\u0012\u00020\r\u0012\u0004\u0012\u00020\u0012\u0018\u00010\u00112\u0014\u0010,\u001a\u0010\u0012\u0004\u0012\u00020+\u0012\u0004\u0012\u00020\b\u0018\u00010*H\u0097\u0001¢\u0006\u0004\bQ\u0010YJN\u0010Q\u001a\u00020\b2\u0006\u0010S\u001a\u00020\r2\b\u0010\u0019\u001a\u0004\u0018\u00010\r2\u0014\u0010W\u001a\u0010\u0012\u0004\u0012\u00020\r\u0012\u0004\u0012\u00020\u0012\u0018\u00010\u00112\u0014\u0010,\u001a\u0010\u0012\u0004\u0012\u00020+\u0012\u0004\u0012\u00020\b\u0018\u00010*H\u0097\u0001¢\u0006\u0004\bQ\u0010ZJ,\u0010Q\u001a\u00020\b2\u0006\u0010S\u001a\u00020\r2\u0012\u0010W\u001a\u000e\u0012\u0004\u0012\u00020\r\u0012\u0004\u0012\u00020\u00120\u0011H\u0097\u0001¢\u0006\u0004\bQ\u0010[JB\u0010Q\u001a\u00020\b2\u0006\u0010S\u001a\u00020\r2\u0012\u0010W\u001a\u000e\u0012\u0004\u0012\u00020\r\u0012\u0004\u0012\u00020\u00120\u00112\u0014\u0010,\u001a\u0010\u0012\u0004\u0012\u00020+\u0012\u0004\u0012\u00020\b\u0018\u00010*H\u0097\u0001¢\u0006\u0004\bQ\u0010\\J$\u0010]\u001a\u00020\b2\u0006\u0010P\u001a\u00020O2\n\b\u0002\u0010$\u001a\u0004\u0018\u00010#H\u0096\u0001¢\u0006\u0004\b]\u0010^J \u0010]\u001a\u00020\b2\u0006\u0010S\u001a\u00020\r2\u0006\u0010$\u001a\u00020\u0014H\u0097\u0001¢\u0006\u0004\b]\u0010_J*\u0010]\u001a\u00020\b2\u0006\u0010S\u001a\u00020\r2\b\u0010\u0019\u001a\u0004\u0018\u00010\r2\u0006\u0010$\u001a\u00020\u0014H\u0097\u0001¢\u0006\u0004\b]\u0010`J4\u0010]\u001a\u00020\b2\u0006\u0010S\u001a\u00020\r2\b\u0010\u0019\u001a\u0004\u0018\u00010\r2\b\u0010L\u001a\u0004\u0018\u00010\r2\u0006\u0010$\u001a\u00020\u0014H\u0097\u0001¢\u0006\u0004\b]\u0010aJ\u0010\u0010b\u001a\u00020\bH\u0096\u0001¢\u0006\u0004\bb\u0010\u0003R\u001c\u0010g\u001a\u0002048\u0016@\u0016X\u0096\u000f¢\u0006\f\u001a\u0004\bc\u0010d\"\u0004\be\u0010fR\u0014\u0010j\u001a\u00020\r8\u0016X\u0096\u0005¢\u0006\u0006\u001a\u0004\bh\u0010iR\u0016\u0010m\u001a\u0004\u0018\u0001048\u0016X\u0096\u0005¢\u0006\u0006\u001a\u0004\bk\u0010lR\u0016\u0010o\u001a\u0004\u0018\u00010\r8\u0016X\u0096\u0005¢\u0006\u0006\u001a\u0004\bn\u0010i¨\u0006p"}, d2 = {"Lcom/userleap/Sprig;", "Lcom/userleap/UserLeapInterface;", "<init>", "()V", "Lcom/userleap/EventName;", "eventName", "Lcom/userleap/EventListener;", "listener", "Lc1e;", "addEventListener", "(Lcom/userleap/EventName;Lcom/userleap/EventListener;)V", "Landroid/content/Context;", "context", "", "environmentId", "configure", "(Landroid/content/Context;Ljava/lang/String;)V", "", "", "configuration", "Lm15;", "fragmentActivity", "(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;Lm15;)V", "dismissActiveSurvey", "optimizelySdk", "userId", "attributes", "integrateOptimizely", "(Ljava/lang/Object;Ljava/lang/String;Ljava/util/Map;)V", "logout", "Lcom/userleap/SprigUserInterfaceMode;", "style", "overrideUserInterfaceMode", "(Lcom/userleap/SprigUserInterfaceMode;)V", "pauseDisplayingSurveys", "Landroid/app/Activity;", "fromActivity", "presentSurvey", "(Landroid/app/Activity;)V", "surveyId", "presentSurveyWithId", "(Ljava/lang/String;)V", "Lkotlin/Function1;", "Lcom/userleap/SurveyState;", "callback", "(Ljava/lang/String;Lx45;)V", "removeEventListener", "", "removeVisitorAttributes", "(Ljava/util/List;)V", "emailAddress", "setEmailAddress", "", "height", "setKeyboardHeightForSurveyPlacement", "(Ljava/lang/Integer;)V", "locale", "setLocale", "identifier", "setPartnerAnonymousId", "previewKey", "setPreviewKey", "Lsprig/d/e;", "approvalBlock", "setSessionReplayApprovalBlock", "(Lsprig/d/e;)V", "setUserIdentifier", "key", "", "value", "setVisitorAttribute", "(Ljava/lang/String;Z)V", "(Ljava/lang/String;I)V", "(Ljava/lang/String;Ljava/lang/String;)V", "setVisitorAttributes", "(Ljava/util/Map;)V", "partnerAnonymousId", "(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V", "stopRecording", "Lcom/userleap/EventPayload;", "payload", "track", "(Lcom/userleap/EventPayload;)V", "event", "(Ljava/lang/String;Ljava/lang/String;Lx45;)V", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lx45;)V", "properties", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lx45;)V", "(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lx45;)V", "(Ljava/lang/String;Ljava/util/Map;)V", "(Ljava/lang/String;Ljava/util/Map;Lx45;)V", "trackAndPresent", "(Lcom/userleap/EventPayload;Landroid/app/Activity;)V", "(Ljava/lang/String;Lm15;)V", "(Ljava/lang/String;Ljava/lang/String;Lm15;)V", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lm15;)V", "unpauseDisplayingSurveys", "getBottomSafeArea", "()I", "setBottomSafeArea", "(I)V", "bottomSafeArea", "getSdkVersion", "()Ljava/lang/String;", "sdkVersion", "getVisitorIdentifier", "()Ljava/lang/Integer;", "visitorIdentifier", "getVisitorIdentifierString", "visitorIdentifierString", "userleap_release"}, k = 1, mv = {1, 8, 0})
public final class Sprig implements UserLeapInterface {
    public static final Sprig INSTANCE = new Sprig();
    private final /* synthetic */ UserLeap $$delegate_0 = UserLeap.INSTANCE;

    private Sprig() {
    }

    @Override // com.userleap.UserLeapInterface
    public void addEventListener(EventName eventName, EventListener listener) {
        eventName.getClass();
        listener.getClass();
        this.$$delegate_0.addEventListener(eventName, listener);
    }

    @Override // com.userleap.UserLeapInterface
    public void configure(Context context, String environmentId) {
        context.getClass();
        environmentId.getClass();
        this.$$delegate_0.configure(context, environmentId);
    }

    @Override // com.userleap.UserLeapInterface
    public void dismissActiveSurvey() {
        this.$$delegate_0.dismissActiveSurvey();
    }

    @Override // com.userleap.UserLeapInterface
    public int getBottomSafeArea() {
        return this.$$delegate_0.getBottomSafeArea();
    }

    @Override // com.userleap.UserLeapInterface
    public String getSdkVersion() {
        return this.$$delegate_0.getSdkVersion();
    }

    @Override // com.userleap.UserLeapInterface
    public Integer getVisitorIdentifier() {
        return this.$$delegate_0.getVisitorIdentifier();
    }

    @Override // com.userleap.UserLeapInterface
    public String getVisitorIdentifierString() {
        return this.$$delegate_0.getVisitorIdentifierString();
    }

    @Override // com.userleap.UserLeapInterface
    public void integrateOptimizely(Object optimizelySdk, String userId, Map<String, String> attributes) {
        optimizelySdk.getClass();
        this.$$delegate_0.integrateOptimizely(optimizelySdk, userId, attributes);
    }

    @Override // com.userleap.UserLeapInterface
    public void logout() {
        this.$$delegate_0.logout();
    }

    @Override // com.userleap.UserLeapInterface
    public void overrideUserInterfaceMode(SprigUserInterfaceMode style) {
        style.getClass();
        this.$$delegate_0.overrideUserInterfaceMode(style);
    }

    @Override // com.userleap.UserLeapInterface
    public void pauseDisplayingSurveys() {
        this.$$delegate_0.pauseDisplayingSurveys();
    }

    @Override // com.userleap.UserLeapInterface
    public void presentSurvey(Activity fromActivity) {
        this.$$delegate_0.presentSurvey(fromActivity);
    }

    @Override // com.userleap.UserLeapInterface
    public void presentSurveyWithId(String surveyId) {
        surveyId.getClass();
        this.$$delegate_0.presentSurveyWithId(surveyId);
    }

    @Override // com.userleap.UserLeapInterface
    public void removeEventListener(EventName eventName, EventListener listener) {
        eventName.getClass();
        listener.getClass();
        this.$$delegate_0.removeEventListener(eventName, listener);
    }

    @Override // com.userleap.UserLeapInterface
    public void removeVisitorAttributes(List<String> attributes) {
        attributes.getClass();
        this.$$delegate_0.removeVisitorAttributes(attributes);
    }

    @Override // com.userleap.UserLeapInterface
    public void setBottomSafeArea(int i) {
        this.$$delegate_0.setBottomSafeArea(i);
    }

    @Override // com.userleap.UserLeapInterface
    public void setEmailAddress(String emailAddress) {
        emailAddress.getClass();
        this.$$delegate_0.setEmailAddress(emailAddress);
    }

    @Override // com.userleap.UserLeapInterface
    public void setKeyboardHeightForSurveyPlacement(Integer height) {
        this.$$delegate_0.setKeyboardHeightForSurveyPlacement(height);
    }

    @Override // com.userleap.UserLeapInterface
    public void setLocale(String locale) {
        locale.getClass();
        this.$$delegate_0.setLocale(locale);
    }

    @Override // com.userleap.UserLeapInterface
    public void setPartnerAnonymousId(String identifier) {
        identifier.getClass();
        this.$$delegate_0.setPartnerAnonymousId(identifier);
    }

    @Override // com.userleap.UserLeapInterface
    public void setPreviewKey(String previewKey) {
        previewKey.getClass();
        this.$$delegate_0.setPreviewKey(previewKey);
    }

    @Override // com.userleap.UserLeapInterface
    public void setSessionReplayApprovalBlock(e approvalBlock) {
        approvalBlock.getClass();
        this.$$delegate_0.setSessionReplayApprovalBlock(approvalBlock);
    }

    @Override // com.userleap.UserLeapInterface
    public void setUserIdentifier(String identifier) {
        identifier.getClass();
        this.$$delegate_0.setUserIdentifier(identifier);
    }

    @Override // com.userleap.UserLeapInterface
    public void setVisitorAttribute(String key, String value) {
        key.getClass();
        value.getClass();
        this.$$delegate_0.setVisitorAttribute(key, value);
    }

    @Override // com.userleap.UserLeapInterface
    public void setVisitorAttributes(Map<String, String> attributes) {
        attributes.getClass();
        this.$$delegate_0.setVisitorAttributes(attributes);
    }

    @Override // com.userleap.UserLeapInterface
    public void stopRecording() {
        this.$$delegate_0.stopRecording();
    }

    @Override // com.userleap.UserLeapInterface
    @z73
    public void track(String event, Map<String, ? extends Object> properties) {
        event.getClass();
        properties.getClass();
        this.$$delegate_0.track(event, properties);
    }

    @Override // com.userleap.UserLeapInterface
    @z73
    public void trackAndPresent(String event, m15 fromActivity) {
        event.getClass();
        fromActivity.getClass();
        this.$$delegate_0.trackAndPresent(event, fromActivity);
    }

    @Override // com.userleap.UserLeapInterface
    public void unpauseDisplayingSurveys() {
        this.$$delegate_0.unpauseDisplayingSurveys();
    }

    @Override // com.userleap.UserLeapInterface
    public void presentSurveyWithId(String surveyId, x45 callback) {
        surveyId.getClass();
        this.$$delegate_0.presentSurveyWithId(surveyId, callback);
    }

    @Override // com.userleap.UserLeapInterface
    public void setVisitorAttributes(Map<String, String> attributes, String userId, String partnerAnonymousId) {
        attributes.getClass();
        this.$$delegate_0.setVisitorAttributes(attributes, userId, partnerAnonymousId);
    }

    @Override // com.userleap.UserLeapInterface
    public void configure(Context context, String environmentId, Map<String, ? extends Object> configuration, m15 fragmentActivity) {
        context.getClass();
        environmentId.getClass();
        this.$$delegate_0.configure(context, environmentId, configuration, fragmentActivity);
    }

    @Override // com.userleap.UserLeapInterface
    public void setVisitorAttribute(String key, int value) {
        key.getClass();
        this.$$delegate_0.setVisitorAttribute(key, value);
    }

    @Override // com.userleap.UserLeapInterface
    @z73
    public void track(String event) {
        event.getClass();
        this.$$delegate_0.track(event);
    }

    @Override // com.userleap.UserLeapInterface
    public void trackAndPresent(EventPayload payload, Activity fromActivity) {
        payload.getClass();
        this.$$delegate_0.trackAndPresent(payload, fromActivity);
    }

    @Override // com.userleap.UserLeapInterface
    public void setVisitorAttribute(String key, boolean value) {
        key.getClass();
        this.$$delegate_0.setVisitorAttribute(key, value);
    }

    @Override // com.userleap.UserLeapInterface
    @z73
    public void track(String event, String userId, String partnerAnonymousId) {
        event.getClass();
        this.$$delegate_0.track(event, userId, partnerAnonymousId);
    }

    @Override // com.userleap.UserLeapInterface
    @z73
    public void trackAndPresent(String event, String userId, m15 fromActivity) {
        event.getClass();
        fromActivity.getClass();
        this.$$delegate_0.trackAndPresent(event, userId, fromActivity);
    }

    @Override // com.userleap.UserLeapInterface
    @z73
    public void track(String event, String userId, String partnerAnonymousId, Map<String, ? extends Object> properties) {
        event.getClass();
        this.$$delegate_0.track(event, userId, partnerAnonymousId, properties);
    }

    @Override // com.userleap.UserLeapInterface
    @z73
    public void trackAndPresent(String event, String userId, String partnerAnonymousId, m15 fromActivity) {
        event.getClass();
        fromActivity.getClass();
        this.$$delegate_0.trackAndPresent(event, userId, partnerAnonymousId, fromActivity);
    }

    @Override // com.userleap.UserLeapInterface
    @z73
    public void track(String event, String userId, String partnerAnonymousId, Map<String, ? extends Object> properties, x45 callback) {
        event.getClass();
        this.$$delegate_0.track(event, userId, partnerAnonymousId, properties, callback);
    }

    @Override // com.userleap.UserLeapInterface
    @z73
    public void track(String event, String userId, String partnerAnonymousId, x45 callback) {
        event.getClass();
        this.$$delegate_0.track(event, userId, partnerAnonymousId, callback);
    }

    @Override // com.userleap.UserLeapInterface
    @z73
    public void track(String event, String userId, Map<String, ? extends Object> properties, x45 callback) {
        event.getClass();
        this.$$delegate_0.track(event, userId, properties, callback);
    }

    @Override // com.userleap.UserLeapInterface
    @z73
    public void track(String event, String userId, x45 callback) {
        event.getClass();
        this.$$delegate_0.track(event, userId, callback);
    }

    @Override // com.userleap.UserLeapInterface
    public void track(EventPayload payload) {
        payload.getClass();
        this.$$delegate_0.track(payload);
    }

    @Override // com.userleap.UserLeapInterface
    @z73
    public void track(String event, Map<String, ? extends Object> properties, x45 callback) {
        event.getClass();
        properties.getClass();
        this.$$delegate_0.track(event, properties, callback);
    }

    @Override // com.userleap.UserLeapInterface
    @z73
    public void track(String event, x45 callback) {
        event.getClass();
        this.$$delegate_0.track(event, callback);
    }
}
