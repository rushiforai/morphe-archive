package app.morphe.extension.chmate;

import java.net.URI;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Only the editor's native Edge target is eligible; draft text never selects a destination. */
final class StockChmatePostingRules {
    private static final String ORIGIN = "https://bbs.eddibb.cc";
    private static final Pattern REPLY = Pattern.compile("/test/read\\.cgi/liveedge/([0-9]{1,19})(?:/(?:[0-9nl,-]+)?)?");
    static final int MAX_BODY = 128 * 1024;

    static String target(String address) {
        if (address == null) return null;
        try {
            URI uri = new URI(address);
            boolean https = "https".equalsIgnoreCase(uri.getScheme());
            boolean http = "http".equalsIgnoreCase(uri.getScheme());
            if ((!https && !http) || !"bbs.eddibb.cc".equalsIgnoreCase(uri.getHost())
                    || uri.getRawUserInfo() != null || uri.getRawQuery() != null || uri.getRawFragment() != null
                    || uri.getPort() != -1 && uri.getPort() != (https ? 443 : 80)) return null;
            String path = uri.getRawPath();
            if ("/liveedge/".equals(path) || "/liveedge".equals(path)) return ORIGIN + "/liveedge/";
            Matcher reply = REPLY.matcher(path == null ? "" : path);
            if (!reply.matches() || Long.parseLong(reply.group(1)) <= 0) return null;
            return ORIGIN + "/test/read.cgi/liveedge/" + reply.group(1) + "/";
        } catch (Exception invalid) { return null; }
    }

    static boolean newThread(String target) { return (ORIGIN + "/liveedge/").equals(target); }

    static void validate(String target, String body, String subject) {
        if (target == null || !target.equals(target(target))) throw new IllegalArgumentException("エッヂの投稿先を確認できません。");
        if (body == null || body.trim().isEmpty()) throw new IllegalArgumentException("本文を入力してから通常版へ渡してください。");
        if (body.length() > MAX_BODY) throw new IllegalArgumentException("本文が長すぎて通常版へ渡せません。Haiagaruの下書きは保持しています。");
        if (newThread(target) && (subject == null || subject.trim().isEmpty())) throw new IllegalArgumentException("スレタイを入力してから通常版へ渡してください。");
        if (subject != null && (subject.length() > 1024 || subject.indexOf('\n') >= 0 || subject.indexOf('\r') >= 0))
            throw new IllegalArgumentException("スレタイを確認してください（改行なし・1024文字まで）。");
    }

    private StockChmatePostingRules() {}
}
