package org.mozilla.geckoview;

import java.util.List;

/** Stub of the WebExtensionController members the extension uses (Focus 158.0 / GeckoView 158.0.1). */
public class WebExtensionController {
    public static final String INSTALLATION_METHOD_MANAGER = "manager";

    private WebExtensionController() {
        throw new RuntimeException("Stub!");
    }

    public GeckoResult<List<WebExtension>> list() {
        throw new RuntimeException("Stub!");
    }

    public GeckoResult<WebExtension> install(String uri, String installationMethod) {
        throw new RuntimeException("Stub!");
    }

    public GeckoResult<WebExtension> update(WebExtension extension) {
        throw new RuntimeException("Stub!");
    }

    public GeckoResult<Void> uninstall(WebExtension extension) {
        throw new RuntimeException("Stub!");
    }

    public GeckoResult<WebExtension> enable(WebExtension extension, int source) {
        throw new RuntimeException("Stub!");
    }

    public GeckoResult<WebExtension> disable(WebExtension extension, int source) {
        throw new RuntimeException("Stub!");
    }

    public GeckoResult<WebExtension> setAllowedInPrivateBrowsing(WebExtension extension, boolean allowed) {
        throw new RuntimeException("Stub!");
    }

    /** All three methods are default methods returning null in the real interface. */
    public interface PromptDelegate {
        default GeckoResult<WebExtension.PermissionPromptResponse> onInstallPromptRequest(
                WebExtension extension, String[] permissions, String[] origins, String[] dataCollectionPermissions) {
            return null;
        }

        default GeckoResult<AllowOrDeny> onUpdatePrompt(
                WebExtension extension, String[] newPermissions, String[] newOrigins, String[] newDataCollectionPermissions) {
            return null;
        }

        default GeckoResult<AllowOrDeny> onOptionalPrompt(
                WebExtension extension, String[] permissions, String[] origins, String[] dataCollectionPermissions) {
            return null;
        }
    }

    public interface DebuggerDelegate {
        default void onExtensionListUpdated() {
        }
    }

    public static class EnableSource {
        public static final int USER = 1;

        private EnableSource() {
            throw new RuntimeException("Stub!");
        }
    }
}
