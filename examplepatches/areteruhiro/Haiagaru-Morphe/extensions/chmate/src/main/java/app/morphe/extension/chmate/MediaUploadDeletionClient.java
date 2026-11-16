package app.morphe.extension.chmate;

import java.io.*;
import java.net.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.regex.*;
import org.json.*;

/** Deletes only saved owner targets. Does not scrape credentials or guess deletion keys. */
final class MediaUploadDeletionClient {
    private final MediaUploadWebClient http;
    MediaUploadDeletionClient(MediaUploadWebClient http) { this.http = http; }
    boolean delete(JSONObject row) throws Exception {
        String provider = row.optString("provider"), management = row.optString("management");
        if (!MediaUploadManagementPolicy.valid(provider, row.optString("link"), management))
            throw new IOException("削除権限を確認できません");
        if (provider.equals("imgpile")) {
            // Same cookie-authorised owner action used by the current public site's Delete button.
            HttpURLConnection c = http.site(management + "/delete", "POST");
            c.setFixedLengthStreamingMode(0);
            try {
                try (OutputStream out = c.getOutputStream()) { }
                JSONObject result = MediaUploadWebClient.parse(http.response(c, true));
                return confirmed(result);
            } finally { c.disconnect(); }
        }
        String id = row.optString("id");
        if (!id.matches("[A-Za-z0-9_-]{1,512}")) throw new IOException("この履歴には画像IDがありません。管理ページで確認してください");
        HttpURLConnection page = http.site(management, "GET");
        String html;
        try { html = http.response(page, false); } finally { page.disconnect(); }
        DeleteForm form = form(html, id, management);
        if (form == null) throw new IOException("画像単位の削除フォームを確認できません。管理ページで確認してください");
        HttpURLConnection post = http.site(form.url, "POST");
        post.setRequestProperty("X-CSRF-Token", MediaUploadClient.csrf(html));
        post.setRequestProperty("X-Requested-With", "XMLHttpRequest");
        post.setRequestProperty("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
        byte[] bytes = form.body.getBytes(StandardCharsets.UTF_8); post.setFixedLengthStreamingMode(bytes.length);
        try {
            try (OutputStream out = post.getOutputStream()) { out.write(bytes); }
            return confirmed(MediaUploadWebClient.parse(http.response(post, true)));
        } finally { post.disconnect(); }
    }
    static boolean confirmed(JSONObject result) {
        if (result.has("error") && !result.isNull("error") && !result.optString("error").isEmpty()) return false;
        if (Boolean.FALSE.equals(result.opt("success")) || Boolean.FALSE.equals(result.opt("ok"))) return false;
        if (Boolean.TRUE.equals(result.opt("success")) || Boolean.TRUE.equals(result.opt("ok"))) return true;
        JSONObject data = result.optJSONObject("data");
        // imgpile's owner UI consumes data after a successful delete response.
        return data != null && (Boolean.TRUE.equals(data.opt("deleted")) || data.opt("postDeleted") instanceof Boolean);
    }
    static final class DeleteForm {
        final String url, body;
        DeleteForm(String url, String body) { this.url = url; this.body = body; }
    }
    static String attr(String tag, String name) {
        Matcher m = Pattern.compile("(?i)(?:^|\\s)" + Pattern.quote(name) + "\\s*=\\s*(['\"])(.*?)\\1", Pattern.DOTALL).matcher(tag);
        return m.find() ? m.group(2).replace("&amp;", "&").replace("&quot;", "\"").replace("&#39;", "'") : "";
    }
    static DeleteForm form(String html, String id) throws Exception { return form(html,id,"https://imgbox.com/"); }
    static DeleteForm form(String html, String id, String base) throws Exception {
        if (html == null || html.length() > 2 * 1024 * 1024 || !id.matches("[A-Za-z0-9_-]{1,512}")) return null;
        Matcher forms = Pattern.compile("(?is)<form\\b([^>]*)>(.*?)</form>").matcher(html);
        while (forms.find()) {
            if (!attr(forms.group(1), "method").equalsIgnoreCase("post")) continue;
            String action = attr(forms.group(1), "action");
            if (action.isEmpty()) continue;
            URI u = new URI(base).resolve(action);
            if (!"https".equals(u.getScheme()) || u.getHost() == null || u.getRawUserInfo() != null
                    || (u.getPort() != -1 && u.getPort() != 443)) continue;
            String path = u.getRawPath();
            if (u.getRawQuery() != null || u.getRawFragment() != null || path.contains("%")
                    || path.toLowerCase(Locale.ROOT).contains("gallery")
                    || !path.matches("(?i).*(?:delete|destroy|remove).*")) continue;
            boolean exact = Arrays.asList(path.split("/")).contains(id), conflicting = false;
            StringBuilder body = new StringBuilder();
            Matcher inputs = Pattern.compile("(?is)<input\\b[^>]*>").matcher(forms.group(2));
            while (inputs.find()) {
                String input = inputs.group();
                if (!attr(input, "type").equalsIgnoreCase("hidden")) continue;
                String name = attr(input, "name"), value = attr(input, "value");
                if (name.equals("id") || name.equals("image_id")) {
                    exact |= value.equals(id); conflicting |= !value.equals(id);
                }
                if (name.equals("_method") && !value.equalsIgnoreCase("delete")) conflicting = true;
                if (!Arrays.asList("id", "image_id", "_method", "authenticity_token").contains(name)) {
                    conflicting = true; continue;
                }
                if (name.isEmpty() || name.length() > 128 || value.length() > 4096) continue;
                if (body.length() != 0) body.append('&');
                body.append(URLEncoder.encode(name, "UTF-8")).append('=').append(URLEncoder.encode(value, "UTF-8"));
            }
            // A gallery-wide delete or a form for a different image must never be submitted.
            if (exact && !conflicting) return new DeleteForm(u.toString(), body.toString());
        }
        return null;
    }
}
