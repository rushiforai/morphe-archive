package com.amplitude.core;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\b\n\u0002\b\u0006\bÆ\u0002\u0018\u00002\u00020\u0001:\u0002\u0010\u0011B\u0007\b\u0002¢\u0006\u0002\u0010\u0002R\u000e\u0010\u0003\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\b\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\fX\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\r\u001a\u00020\fX\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u000e\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u000f\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000¨\u0006\u0012"}, d2 = {"Lcom/amplitude/core/Constants;", b.f42142b, "()V", "AMP_REVENUE_EVENT", b.f42142b, "BATCH_API_HOST", "DEFAULT_API_HOST", "EU_BATCH_API_HOST", "EU_DEFAULT_API_HOST", "GROUP_IDENTIFY_EVENT", "IDENTIFY_EVENT", "MAX_PROPERTY_KEYS", b.f42142b, "MAX_STRING_LENGTH", "SDK_LIBRARY", "SDK_VERSION", "EventProperties", "EventTypes", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class Constants {

    @NotNull
    public static final String AMP_REVENUE_EVENT = "revenue_amount";

    @NotNull
    public static final String BATCH_API_HOST = "https://api2.amplitude.com/batch";

    @NotNull
    public static final String DEFAULT_API_HOST = "https://api2.amplitude.com/2/httpapi";

    @NotNull
    public static final String EU_BATCH_API_HOST = "https://api.eu.amplitude.com/batch";

    @NotNull
    public static final String EU_DEFAULT_API_HOST = "https://api.eu.amplitude.com/2/httpapi";

    @NotNull
    public static final String GROUP_IDENTIFY_EVENT = "$groupidentify";

    @NotNull
    public static final String IDENTIFY_EVENT = "$identify";

    @NotNull
    public static final Constants INSTANCE = new Constants();
    public static final int MAX_PROPERTY_KEYS = 1024;
    public static final int MAX_STRING_LENGTH = 1024;

    @NotNull
    public static final String SDK_LIBRARY = "amplitude-kotlin";

    @NotNull
    public static final String SDK_VERSION = "0.0.1";

    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b)\bÆ\u0002\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002R\u000e\u0010\u0003\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\b\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\f\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\r\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u000e\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u000f\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0010\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0011\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0012\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0013\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0014\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0015\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0016\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0017\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0018\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0019\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u001a\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u001b\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u001c\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u001d\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u001e\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u001f\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010 \u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010!\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\"\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010#\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010$\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010%\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010&\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010'\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010(\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010)\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010*\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010+\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010,\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000¨\u0006-"}, d2 = {"Lcom/amplitude/core/Constants$EventProperties;", b.f42142b, "()V", "ACTION", b.f42142b, "BEGIN_TIME", "BUILD", "CLICKS", "CLICK_COUNT", "COORDINATE_X", "COORDINATE_Y", "DURATION", "END_TIME", "FRAGMENT_CLASS", "FRAGMENT_IDENTIFIER", "FRAGMENT_TAG", "FROM_BACKGROUND", "HIERARCHY", "LINK_REFERRER", "LINK_URL", "NETWORK_TRACKING_COMPLETION_TIME", "NETWORK_TRACKING_DURATION", "NETWORK_TRACKING_ERROR_MESSAGE", "NETWORK_TRACKING_REQUEST_BODY", "NETWORK_TRACKING_REQUEST_BODY_SIZE", "NETWORK_TRACKING_REQUEST_HEADERS", "NETWORK_TRACKING_REQUEST_METHOD", "NETWORK_TRACKING_RESPONSE_BODY", "NETWORK_TRACKING_RESPONSE_BODY_SIZE", "NETWORK_TRACKING_RESPONSE_HEADERS", "NETWORK_TRACKING_START_TIME", "NETWORK_TRACKING_STATUS_CODE", "NETWORK_TRACKING_URL", "NETWORK_TRACKING_URL_FRAGMENT", "NETWORK_TRACKING_URL_QUERY", "PREVIOUS_BUILD", "PREVIOUS_VERSION", "SCREEN_NAME", "TARGET_ACCESSIBILITY_LABEL", "TARGET_CLASS", "TARGET_RESOURCE", "TARGET_SOURCE", "TARGET_TAG", "TARGET_TEXT", "VERSION", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
    public static final class EventProperties {

        @NotNull
        public static final String ACTION = "[Amplitude] Action";

        @NotNull
        public static final String BEGIN_TIME = "[Amplitude] Begin Time";

        @NotNull
        public static final String BUILD = "[Amplitude] Build";

        @NotNull
        public static final String CLICKS = "[Amplitude] Clicks";

        @NotNull
        public static final String CLICK_COUNT = "[Amplitude] Click Count";

        @NotNull
        public static final String COORDINATE_X = "[Amplitude] X";

        @NotNull
        public static final String COORDINATE_Y = "[Amplitude] Y";

        @NotNull
        public static final String DURATION = "[Amplitude] Duration";

        @NotNull
        public static final String END_TIME = "[Amplitude] End Time";

        @NotNull
        public static final String FRAGMENT_CLASS = "[Amplitude] Fragment Class";

        @NotNull
        public static final String FRAGMENT_IDENTIFIER = "[Amplitude] Fragment Identifier";

        @NotNull
        public static final String FRAGMENT_TAG = "[Amplitude] Fragment Tag";

        @NotNull
        public static final String FROM_BACKGROUND = "[Amplitude] From Background";

        @NotNull
        public static final String HIERARCHY = "[Amplitude] Hierarchy";

        @NotNull
        public static final EventProperties INSTANCE = new EventProperties();

        @NotNull
        public static final String LINK_REFERRER = "[Amplitude] Link Referrer";

        @NotNull
        public static final String LINK_URL = "[Amplitude] Link URL";

        @NotNull
        public static final String NETWORK_TRACKING_COMPLETION_TIME = "[Amplitude] Completion Time";

        @NotNull
        public static final String NETWORK_TRACKING_DURATION = "[Amplitude] Duration";

        @NotNull
        public static final String NETWORK_TRACKING_ERROR_MESSAGE = "[Amplitude] Error Message";

        @NotNull
        public static final String NETWORK_TRACKING_REQUEST_BODY = "[Amplitude] Request Body";

        @NotNull
        public static final String NETWORK_TRACKING_REQUEST_BODY_SIZE = "[Amplitude] Request Body Size";

        @NotNull
        public static final String NETWORK_TRACKING_REQUEST_HEADERS = "[Amplitude] Request Headers";

        @NotNull
        public static final String NETWORK_TRACKING_REQUEST_METHOD = "[Amplitude] Request Method";

        @NotNull
        public static final String NETWORK_TRACKING_RESPONSE_BODY = "[Amplitude] Response Body";

        @NotNull
        public static final String NETWORK_TRACKING_RESPONSE_BODY_SIZE = "[Amplitude] Response Body Size";

        @NotNull
        public static final String NETWORK_TRACKING_RESPONSE_HEADERS = "[Amplitude] Response Headers";

        @NotNull
        public static final String NETWORK_TRACKING_START_TIME = "[Amplitude] Start Time";

        @NotNull
        public static final String NETWORK_TRACKING_STATUS_CODE = "[Amplitude] Status Code";

        @NotNull
        public static final String NETWORK_TRACKING_URL = "[Amplitude] URL";

        @NotNull
        public static final String NETWORK_TRACKING_URL_FRAGMENT = "[Amplitude] URL Fragment";

        @NotNull
        public static final String NETWORK_TRACKING_URL_QUERY = "[Amplitude] URL Query";

        @NotNull
        public static final String PREVIOUS_BUILD = "[Amplitude] Previous Build";

        @NotNull
        public static final String PREVIOUS_VERSION = "[Amplitude] Previous Version";

        @NotNull
        public static final String SCREEN_NAME = "[Amplitude] Screen Name";

        @NotNull
        public static final String TARGET_ACCESSIBILITY_LABEL = "[Amplitude] Target Accessibility Label";

        @NotNull
        public static final String TARGET_CLASS = "[Amplitude] Target Class";

        @NotNull
        public static final String TARGET_RESOURCE = "[Amplitude] Target Resource";

        @NotNull
        public static final String TARGET_SOURCE = "[Amplitude] Target Source";

        @NotNull
        public static final String TARGET_TAG = "[Amplitude] Target Tag";

        @NotNull
        public static final String TARGET_TEXT = "[Amplitude] Target Text";

        @NotNull
        public static final String VERSION = "[Amplitude] Version";

        private EventProperties() {
        }
    }

    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u000b\bÆ\u0002\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002R\u000e\u0010\u0003\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\b\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\f\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\r\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u000e\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000¨\u0006\u000f"}, d2 = {"Lcom/amplitude/core/Constants$EventTypes;", b.f42142b, "()V", "APPLICATION_BACKGROUNDED", b.f42142b, "APPLICATION_INSTALLED", "APPLICATION_OPENED", "APPLICATION_UPDATED", "DEAD_CLICK", "DEEP_LINK_OPENED", "ELEMENT_INTERACTED", "FRAGMENT_VIEWED", "NETWORK_TRACKING", "RAGE_CLICK", "SCREEN_VIEWED", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
    public static final class EventTypes {

        @NotNull
        public static final String APPLICATION_BACKGROUNDED = "[Amplitude] Application Backgrounded";

        @NotNull
        public static final String APPLICATION_INSTALLED = "[Amplitude] Application Installed";

        @NotNull
        public static final String APPLICATION_OPENED = "[Amplitude] Application Opened";

        @NotNull
        public static final String APPLICATION_UPDATED = "[Amplitude] Application Updated";

        @NotNull
        public static final String DEAD_CLICK = "[Amplitude] Dead Click";

        @NotNull
        public static final String DEEP_LINK_OPENED = "[Amplitude] Deep Link Opened";

        @NotNull
        public static final String ELEMENT_INTERACTED = "[Amplitude] Element Interacted";

        @NotNull
        public static final String FRAGMENT_VIEWED = "[Amplitude] Fragment Viewed";

        @NotNull
        public static final EventTypes INSTANCE = new EventTypes();

        @NotNull
        public static final String NETWORK_TRACKING = "[Amplitude] Network Request";

        @NotNull
        public static final String RAGE_CLICK = "[Amplitude] Rage Click";

        @NotNull
        public static final String SCREEN_VIEWED = "[Amplitude] Screen Viewed";

        private EventTypes() {
        }
    }

    private Constants() {
    }
}
