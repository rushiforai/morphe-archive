package app.morphe.extension.chmate;

import java.net.URI;
import java.util.Locale;
import java.util.regex.Pattern;

/** Only native board/thread URL shapes are eligible; draft text never selects a destination. */
final class StockChmatePostingRules {
    private static final String BOARD="[A-Za-z0-9_-]+";
    private static final Pattern REPLY = Pattern.compile("/test/read\\.cgi/("+BOARD+")/([0-9]{1,19})(?:/(?:[0-9nl,-]+)?)?");
    private static final Pattern SHITARABA = Pattern.compile("/bbs/read\\.cgi/("+BOARD+")/([0-9]{1,10})/([0-9]{1,19})(?:/(?:[0-9nl,-]+)?)?");
    static final int MAX_BODY = 128 * 1024;

    static String target(String address) {
        if (address == null) return null;
        try {
            URI uri = new URI(address);
            boolean https = "https".equalsIgnoreCase(uri.getScheme());
            boolean http = "http".equalsIgnoreCase(uri.getScheme());
            String host=uri.getHost();
            if ((!https && !http) || host==null
                    || uri.getRawUserInfo() != null || uri.getRawQuery() != null || uri.getRawFragment() != null
                    || uri.getPort() != -1 && uri.getPort() != (https ? 443 : 80)) return null;
            host=host.toLowerCase(Locale.ROOT);
            // Native loopback gateways are private to Haiagaru and unavailable in stock ChMate.
            if(!host.matches("[a-z0-9](?:[a-z0-9.-]*[a-z0-9])?\\.[a-z]{2,}")
                    ||host.endsWith(".localhost")||host.endsWith(".local")||host.endsWith(".invalid"))return null;
            String origin="https://"+host;
            String path = uri.getRawPath();
            if(path==null)return null;
            boolean shitaraba=host.equals("jbbs.shitaraba.net")||host.equals("jbbs.livedoor.jp");
            java.util.regex.Matcher reply=REPLY.matcher(path);
            if(!shitaraba&&reply.matches()&&Long.parseLong(reply.group(2))>0)
                return origin+"/test/read.cgi/"+reply.group(1)+"/"+reply.group(2)+"/";
            java.util.regex.Matcher jbbs=SHITARABA.matcher(path);
            if(shitaraba&&jbbs.matches()&&Long.parseLong(jbbs.group(3))>0)
                return "https://jbbs.shitaraba.net/bbs/read.cgi/"+jbbs.group(1)+"/"+jbbs.group(2)+"/"+jbbs.group(3)+"/";
            if(shitaraba&&path.matches("/"+BOARD+"/[0-9]{1,10}/?"))
                return "https://jbbs.shitaraba.net"+(path.endsWith("/")?path:path+"/");
            if(!shitaraba&&path.matches("/"+BOARD+"/?"))return origin+(path.endsWith("/")?path:path+"/");
            return null;
        } catch (Exception invalid) { return null; }
    }

    static boolean newThread(String target) {
        return target!=null&&target.equals(target(target))&&!target.contains("/test/read.cgi/")&&!target.contains("/bbs/read.cgi/");
    }

    static void validate(String target, String body, String subject) {
        if (target == null || !target.equals(target(target))) throw new IllegalArgumentException("通常版ChMateへ渡す投稿先を確認できません。");
        if (body == null || body.trim().isEmpty()) throw new IllegalArgumentException("本文を入力してから通常版へ渡してください。");
        if (body.length() > MAX_BODY) throw new IllegalArgumentException("本文が長すぎて通常版へ渡せません。Haiagaruの下書きは保持しています。");
        if (newThread(target) && (subject == null || subject.trim().isEmpty())) throw new IllegalArgumentException("スレタイを入力してから通常版へ渡してください。");
        if (subject != null && (subject.length() > 1024 || subject.indexOf('\n') >= 0 || subject.indexOf('\r') >= 0))
            throw new IllegalArgumentException("スレタイを確認してください（改行なし・1024文字まで）。");
    }

    private StockChmatePostingRules() {}
}
