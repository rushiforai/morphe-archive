package app.morphe.extension.chmate;

import java.io.*;
import java.net.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.*;
import java.util.*;
import org.json.*;

/** Synthetic responses only: does not upload or delete any real media. */
public final class MediaUploadWebClientTest {
    private static int checks;
    private static void check(boolean ok, String name) { checks++; if (!ok) throw new AssertionError(name); }
    interface Action { void run() throws Exception; }
    private static void fails(Action action, String name) throws Exception {
        try { action.run(); } catch (IOException expected) { checks++; return; }
        throw new AssertionError(name);
    }
    static final class Reply extends HttpURLConnection {
        final String response; final int status;
        final ByteArrayOutputStream sent = new ByteArrayOutputStream(); boolean closed;
        Reply(URL url, String response, int status) { super(url); this.response = response; this.status = status; }
        public void connect() {} public void disconnect() { closed = true; } public boolean usingProxy() { return false; }
        public int getResponseCode() { return status; }
        public InputStream getInputStream() { return new ByteArrayInputStream(response.getBytes(StandardCharsets.UTF_8)); }
        public OutputStream getOutputStream() { return sent; }
        public Map<String, List<String>> getHeaderFields() { return Collections.emptyMap(); }
    }
    static final class Fake implements MediaUploadClient.Transport, MediaUploadWebClient.Cookies {
        final List<Reply> calls = new ArrayList<>(); final Queue<String> bodies = new ArrayDeque<>(); int status = 200;
        Fake(String... bodies) { this.bodies.addAll(Arrays.asList(bodies)); }
        public HttpURLConnection open(URL url) { Reply r = new Reply(url, bodies.remove(), status); calls.add(r); return r; }
        public String get(String url) { return "session=fixture-" + URI.create(url).getHost(); }
        public void set(String url, String value) { throw new AssertionError("No cookie response expected"); }
        MediaUploadWebClient client() { return new MediaUploadWebClient(this, this); }
    }
    public static void main(String[] args) throws Exception {
        File fixture = Files.createTempFile("haiagaru-web-protocol-", ".dat").toFile();
        try {
            byte[] media = new byte[]{0, 0, 0, 24, 'f', 't', 'y', 'p', 'i', 's', 'o', 'm'};
            Files.write(fixture.toPath(), media);
            String init = "{\"data\":{\"uploadUrl\":\"https://fixture.r2.cloudflarestorage.com/bucket/file?signature=fixture\",\"token\":\"fixture-token\"}}";
            String done = "{\"data\":{\"slug\":\"Fixture\",\"urls\":{\"original\":\"https://cdn.imgpile.com/f/Fixture.mp4\"}}}";
            Fake pile = new Fake(init, "", done);
            JSONObject result = pile.client().upload("imgpile-web", fixture, "video/mp4");
            check(pile.calls.size() == 3, "init PUT confirm once each");
            check(pile.calls.get(0).getRequestMethod().equals("POST"), "init POST");
            check(new JSONObject(pile.calls.get(0).sent.toString("UTF-8")).getLong("size") == media.length, "file size before sending");
            check(Arrays.equals(media, pile.calls.get(1).sent.toByteArray()), "stream bytes unchanged");
            check(pile.calls.get(1).getRequestMethod().equals("PUT"), "storage PUT");
            check(pile.calls.get(1).getRequestProperty("Cookie") == null, "storage has no cookie");
            check(pile.calls.get(1).getRequestProperty("Authorization") == null, "no API key");
            check(pile.calls.get(1).getRequestProperty("Origin") == null, "no site headers to storage");
            check(pile.calls.get(2).getRequestProperty("Cookie").endsWith("imgpile.com"), "own session for confirm");
            check(result.getString("link").equals("https://cdn.imgpile.com/f/Fixture.mp4"), "native direct URL");
            check(result.getString("deletehash").isEmpty(), "not an Imgur delete key");
            for (Reply r : pile.calls) check(r.closed && !r.getInstanceFollowRedirects(), "closed and no redirect");
            check(MediaUploadWebClient.signedUpload("https://new-storage.example.org/bucket/file?signature=fixture"), "storage hostname unrestricted");
            for (String url : new String[]{"http://fixture.r2.cloudflarestorage.com/a", "https://user@fixture.r2.cloudflarestorage.com/a", "https://fixture.r2.cloudflarestorage.com:444/a"})
                check(!MediaUploadWebClient.signedUpload(url), "storage URL isolation");
            MediaUploadPolicy.validate("imgpile-web", "image/png", 100_000_000, ""); checks++;
            fails(() -> MediaUploadPolicy.validate("imgpile-web", "image/png", 100_000_001, ""), "Web 100MB limit");
            fails(() -> MediaUploadPolicy.validate("sendvid", "image/png", 10, ""), "Sendvid videos only");
            Fake send = new Fake("<meta name=\"csrf-token\" content=\"FixtureCSRF==\">", "{\"status\":\"0\",\"video\":{\"slug\":\"abcd1234\",\"secret\":\"private\"}}");
            result = send.client().upload("sendvid", fixture, "video/mp4");
            check(result.getString("link").equals("https://sendvid.com/abcd1234"), "public watch link only");
            check(!result.toString().contains("private"), "deletion secret not published");
            check(send.calls.get(1).sent.toString("ISO-8859-1").contains("name=\"video\"; filename=\"upload.mp4\""), "Sendvid multipart file");
            check(send.calls.get(1).getRequestProperty("X-CSRF-Token").equals("FixtureCSRF=="), "Sendvid CSRF");
            check(send.calls.get(1).getRequestProperty("Cookie").endsWith("sendvid.com"), "Sendvid session isolated");
            check(send.calls.size() == 2, "no retry or another service");
            Fake forbidden = new Fake("challenge"); forbidden.status = 403;
            fails(() -> forbidden.client().upload("imgpile-web", fixture, "video/mp4"), "challenge not bypassed");
            check(forbidden.calls.size() == 1, "no media after challenge");
            JSONObject row = new JSONObject().put("provider", "imgpile").put("link", "https://cdn.imgpile.com/f/Fixture.mp4").put("management", "https://imgpile.com/m/Fixture");
            Fake deletion = new Fake("{\"data\":{\"postDeleted\":false}}");
            check(new MediaUploadDeletionClient(deletion.client()).delete(row), "imgpile explicit deletion result");
            check(deletion.calls.get(0).getURL().toString().equals("https://imgpile.com/m/Fixture/delete"), "exact saved slug only");
            check(deletion.calls.get(0).getRequestMethod().equals("POST"), "delete is not a GET");
            check(!MediaUploadDeletionClient.confirmed(new JSONObject("{}")), "empty response is not success");
            check(!MediaUploadDeletionClient.confirmed(new JSONObject("{\"error\":\"denied\",\"success\":true}")), "error wins");
            check(!MediaUploadDeletionClient.confirmed(new JSONObject("{\"success\":\"true\"}")), "typed success only");
            check(!MediaUploadDeletionClient.confirmed(new JSONObject("{\"success\":false,\"data\":{\"deleted\":true}}")), "explicit failure wins over data");
            row.put("management", "https://evil.test/m/Fixture");
            JSONObject rejectedRow = row;
            check(MediaUploadManagementPolicy.valid("imgpile",row.getString("link"),row.getString("management")),"management hostname unrestricted");
            Fake alternate = new Fake("{\"success\":true}");
            check(new MediaUploadDeletionClient(alternate.client()).delete(rejectedRow),"alternate management host deletion");
            check(alternate.calls.size()==1&&alternate.calls.get(0).getRequestProperty("Cookie").equals("session=fixture-evil.test"), "alternate request uses its own URL cookie");
            String form = "<form method='post' action='/images/delete/Fixture'><input type='hidden' name='_method' value='delete'><input type='hidden' name='authenticity_token' value='a+b=='></form>";
            MediaUploadDeletionClient.DeleteForm parsed = MediaUploadDeletionClient.form(form, "Fixture");
            check(parsed != null && parsed.body.contains("a%2Bb%3D%3D"), "server supplied form and encoded CSRF");
            check(MediaUploadDeletionClient.form(form, "Other") == null, "not another image");
            check(MediaUploadDeletionClient.form(form.replace("/images/delete/Fixture", "/gallery/delete/Fixture"), "Fixture") == null, "never delete a gallery");
            check(MediaUploadDeletionClient.form(form.replace("/images/delete/Fixture", "https://new.example.org/images/delete/Fixture"), "Fixture") != null, "alternate form host with exact ID");
            check(MediaUploadDeletionClient.form(form,"Fixture","https://new.example.org/upload/edit/Fixture/key").url.startsWith("https://new.example.org/"),"relative form keeps actual origin");
            check(MediaUploadDeletionClient.form(form.replace("method='post'", "method='get'"), "Fixture") == null, "no GET destructive request");
            check(MediaUploadDeletionClient.form(form.replace("</form>", "<input type='hidden' name='id' value='Other'></form>"), "Fixture") == null, "contradicting target rejected");
            check(MediaUploadDeletionClient.form(form.replace("</form>", "<input type='hidden' name='ids[]' value='Other'></form>"), "Fixture") == null, "unexpected batch target rejected");
            Fake box = new Fake("<meta name='csrf-token' content='fixture=='/>" + form, "{\"success\":true}");
            row = new JSONObject().put("provider", "imgbox").put("link", "https://images2.imgbox.com/a/b/Fixture_o.png")
                    .put("management", "https://imgbox.com/upload/edit/123/fixture").put("id", "Fixture");
            check(new MediaUploadDeletionClient(box.client()).delete(row), "imgbox verified deletion form");
            check(box.calls.size() == 2, "imgbox page then delete");
            System.out.println("PASS " + checks + " Web upload / bulk-delete protocol safety checks (synthetic HTTP only)");
        } finally { Files.deleteIfExists(fixture.toPath()); }
    }
}
