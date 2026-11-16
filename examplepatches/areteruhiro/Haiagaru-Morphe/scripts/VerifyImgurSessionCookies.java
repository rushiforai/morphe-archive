package app.morphe.extension.chmate;

import java.util.*;

public final class VerifyImgurSessionCookies {
    private static final class Sink implements ImgurWebPolicy.CookieSink {
        final List<String> values = new ArrayList<>();
        int flushes;
        public void set(String url, String value) { values.add(value); }
        public void flush() { flushes++; }
    }
    public static void main(String[] args) {
        String rotated = "fixture=new; Path=/; Secure; HttpOnly; SameSite=None";
        String expired = "fixture=; Max-Age=0; Path=/; Secure";
        String dated = "another=value; Expires=Wed, 21 Oct 2037 07:28:00 GMT; Secure";
        Sink sink = new Sink();
        Map<String, List<String>> headers = new LinkedHashMap<>();
        headers.put(null, List.of("HTTP/1.1 200 OK"));
        headers.put("sEt-CoOkIe", List.of(rotated, dated, expired));
        headers.put("Cookie", List.of("not-a-response-cookie"));
        ImgurWebPolicy.receiveCookies("https://api.imgur.com/3/account/me", headers, sink);
        if (!sink.values.equals(List.of(rotated, dated, expired)) || sink.flushes != 1)
            throw new AssertionError("Rotation/expiry/multiple cookie preservation");
        for (String url : List.of("http://api.imgur.com/", "https://api.imgur.com:8443/",
                "https://user@api.imgur.com/", "invalid")) {
            sink = new Sink(); ImgurWebPolicy.receiveCookies(url, headers, sink);
            if (!sink.values.isEmpty() || sink.flushes != 0) throw new AssertionError("Untrusted origin: " + url);
        }
        sink = new Sink();
        ImgurWebPolicy.receiveCookies("https://new-api.example.org/account", headers, sink);
        if (sink.values.size()!=3 || sink.flushes!=1) throw new AssertionError("alternate cookie response host");
        sink = new Sink();
        ImgurWebPolicy.receiveCookies("https://api.imgur.com/", null, sink);
        ImgurWebPolicy.receiveCookies("https://api.imgur.com/", Map.of(), sink);
        Map<String, List<String>> malformed = new HashMap<>();
        malformed.put("Set-Cookie", Arrays.asList(null, "", "a=b\r\nInjected: test"));
        ImgurWebPolicy.receiveCookies("https://api.imgur.com/", malformed, sink);
        if (!sink.values.isEmpty() || sink.flushes != 0) throw new AssertionError("Empty/malformed headers");
        System.out.println("PASS session cookies: rotation, expiry, multiple headers, alternate HTTPS origins and malformed headers");
    }
}
