package app.morphe.extension.chmate;

import java.net.URI;
import org.json.JSONObject;

/** Validated management links. A CDN URL is never a deletion credential. */
public final class MediaUploadManagementPolicy {
    private MediaUploadManagementPolicy() {}
    private static boolean token(String value) { return value != null && value.matches("[A-Za-z0-9_-]{1,512}"); }
    public static String imgbox(String id, String secret) {
        return token(id) && token(secret) ? "https://imgbox.com/upload/edit/" + id + "/" + secret : "";
    }
    public static String imgpile(String slug) {
        return token(slug) ? "https://imgpile.com/m/" + slug : "";
    }
    public static boolean valid(String provider, String link, String management) {
        if (!MediaUploadPolicy.mediaUrl(provider, link)) return false;
        try {
            URI u = new URI(management);
            if (!"https".equals(u.getScheme()) || u.getHost() == null || u.getRawUserInfo() != null || u.getPort() != -1
                    || u.getRawQuery() != null || u.getRawFragment() != null) return false;
            if (MediaUploadPolicy.IMGBOX.equals(provider)) return u.getRawPath().matches("/upload/edit/[A-Za-z0-9_-]{1,512}/[A-Za-z0-9_-]{1,512}");
            return MediaUploadPolicy.IMGPILE.equals(provider) && u.getRawPath().matches("/m/[A-Za-z0-9_-]{1,512}");
        } catch (Exception ignored) { return false; }
    }
    static JSONObject record(JSONObject result, long now) throws Exception {
        String provider = result.optString("haiagaruProvider"), link = result.optString("link");
        String management = result.optString("haiagaruManagementUrl");
        if (!valid(provider, link, management)) return null;
        return new JSONObject().put("provider", provider).put("link", link).put("management", management).put("time", now)
                .put("id", result.optString("id"));
    }
    public static boolean imgur(String link) {
        try {
            URI u = new URI(link);
            return ("https".equals(u.getScheme()) || "http".equals(u.getScheme()))
                    && u.getRawUserInfo() == null && (u.getPort() == -1 || u.getPort() == 443 || u.getPort() == 80)
                    && u.getHost() != null;
        } catch (Exception ignored) { return false; }
    }
}
