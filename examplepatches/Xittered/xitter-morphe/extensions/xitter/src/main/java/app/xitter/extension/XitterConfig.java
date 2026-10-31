package app.xitter.extension;

/**
 * Values chosen in Morphe Manager. The bodies here are placeholders: the "Xitter" patch
 * replaces each method with a constant from its options when the app is patched.
 */
@SuppressWarnings("unused")
public final class XitterConfig {
    private XitterConfig() {}

    /** The instance's address, e.g. https://xitter.example or http://192.168.1.5:3000. */
    public static String serverUrl() {
        return "http://localhost:3000";
    }

    /** An optional client app token (xitter_...) from Admin > Client apps. */
    public static String clientToken() {
        return "";
    }

    /** Whether hosts that are neither X's nor the instance's are blocked too. */
    public static boolean blockThirdParty() {
        return true;
    }

    /** Extra hosts allowed through, comma separated. */
    public static String allowedHosts() {
        return "";
    }
}
