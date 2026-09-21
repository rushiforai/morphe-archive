import app.morphe.extension.chmate.HissiMenuCompatibility;
import java.util.regex.Pattern;

/** Standalone regression check; compile together with HissiMenuCompatibility.java. */
public class VerifyHissiMenu {
    private static void check(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }

    public static void main(String[] args) {
        String url = "http://hissi.org/read.php/{$bbs}/{$date[yyyyMMdd]}/{$id[base64_]}.html";
        String original = url + "{$host[match:[25]ch.net$]}";
        String fixed = HissiMenuCompatibility.rewriteTemplate(original);
        check(fixed.startsWith(url), "Destination and ID/date expansion must stay intact");
        // Use ChMate's own placeholder grammar and regex find semantics.
        var placeholders = Pattern.compile("\\{\\$(.*?)(?:\\[(.*?)])?\\}").matcher(fixed);
        Pattern hostFilter = null;
        while (placeholders.find()) {
            if (placeholders.group(1).equals("host")) {
                hostFilter = Pattern.compile(placeholders.group(2).substring(6));
            }
        }
        check(hostFilter != null, "Host filter must parse using ChMate's grammar");
        for (String host : new String[]{"egg.5ch.io", "mi.5ch.io", "5ch.io", "egg.5ch.net", "hayabusa.2ch.net"}) {
            check(hostFilter.matcher(host).find(), "Missing menu for " + host);
        }
        for (String host : new String[]{"talk.jp", "open2ch.net", "2ch.sc", "evil5ch.io", "egg.5ch.io.example", "egg.5chXio"}) {
            check(!hostFilter.matcher(host).find(), "Unexpected menu for " + host);
        }
        check(fixed.equals(HissiMenuCompatibility.rewriteTemplate(fixed)), "Rewrite must be idempotent");
        check(HissiMenuCompatibility.rewriteTemplate(null) == null, "Null handling");
        String custom = original.replace("hissi.org", "example.org");
        check(custom.equals(HissiMenuCompatibility.rewriteTemplate(custom)), "Unrelated services must stay intact");
        custom = url + "{$host[match:example.org$]}";
        check(custom.equals(HissiMenuCompatibility.rewriteTemplate(custom)), "Custom filters must stay intact");
        check(HissiMenuCompatibility.rewriteTemplate("必死チェッカーもどき " + original).equals("必死チェッカーもどき " + fixed),
                "Japanese labels must not prevent repair");
        System.out.println("PASS: Hissi template grammar, old/new hosts, unrelated hosts, custom templates and idempotence");
    }
}
