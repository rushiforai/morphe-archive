package org.mozilla.geckoview;

/** Stub of the WebExtension members the extension uses (Focus 158.0 / GeckoView 158.0.1). */
public class WebExtension {
    public final String id;
    public final boolean isBuiltIn;
    public final MetaData metaData;

    private WebExtension() {
        throw new RuntimeException("Stub!");
    }

    /** Lorg/mozilla/geckoview/WebExtension$MetaData; (an inner class in the real dex). */
    public class MetaData {
        public final String name;
        public final String version;
        public final boolean enabled;
        public final boolean allowedInPrivateBrowsing;
        public final String optionsPageUrl;
        public final String baseUrl;
        public final Image icon;

        private MetaData() {
            throw new RuntimeException("Stub!");
        }
    }

    public static class PermissionPromptResponse {
        public PermissionPromptResponse(
                Boolean isPermissionsGranted,
                Boolean isPrivateModeGranted,
                Boolean isTechnicalAndInteractionDataGranted) {
            throw new RuntimeException("Stub!");
        }
    }
}
