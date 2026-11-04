package app.wordfeudwordfinder.extension.play;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.fail;

import app.wordfeudwordfinder.extension.core.WfError;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;

public class SessionReaderTest {
    /** Expires=Tue, 03 Nov 2099 13:14:36 GMT in the fixture. */
    private static final long EXPIRES_MS = 4097394876_000L;
    private static final long NOW_MS = 1793538877_000L; // 2026-11-01

    @Rule public TemporaryFolder tmp = new TemporaryFolder();

    private static String fixture(String name) {
        try (InputStream in = SessionReaderTest.class.getResourceAsStream("/fixtures/" + name)) {
            if (in == null) throw new AssertionError("missing fixture " + name);
            return new String(in.readAllBytes(), StandardCharsets.UTF_8);
        } catch (IOException e) {
            throw new AssertionError(e);
        }
    }

    private File write(String subdir, String content) throws IOException {
        File dir = new File(tmp.getRoot(), ".cookies/" + subdir);
        if (!dir.isDirectory() && !dir.mkdirs()) throw new IOException("mkdirs");
        File f = new File(dir, ".domains");
        try (OutputStream out = new FileOutputStream(f)) {
            out.write(content.getBytes(StandardCharsets.UTF_8));
        }
        return f;
    }

    private static String domains(String cookie) {
        return "{\"wordfeud.com\":{\"/\":{\"sessionid\":\"" + cookie + "\"}}}";
    }

    private static void assertSessionError(SessionReader r) {
        try {
            r.sessionId();
            fail("expected MV-SESSION");
        } catch (WfError e) {
            assertEquals("MV-SESSION", e.code());
        }
    }

    @Test
    public void readsSessionFromCorrectDomain() throws Exception {
        write("ie0_ps1", fixture("cookies_domains.json"));
        assertEquals("TESTSESSION", new SessionReader(tmp.getRoot(), () -> NOW_MS).sessionId());
    }

    @Test
    public void expiredSessionIsError() throws Exception {
        write("ie0_ps1", fixture("cookies_domains.json"));
        assertSessionError(new SessionReader(tmp.getRoot(), () -> EXPIRES_MS + 1));
        // exactly at Expires: still expired? No: valid strictly before, expired from Expires on.
        assertSessionError(new SessionReader(tmp.getRoot(), () -> EXPIRES_MS));
        assertEquals("TESTSESSION", new SessionReader(tmp.getRoot(), () -> EXPIRES_MS - 1).sessionId());
    }

    @Test
    public void missingFileIsError() {
        assertSessionError(new SessionReader(tmp.getRoot(), () -> NOW_MS));
        assertSessionError(new SessionReader(new File(tmp.getRoot(), "does-not-exist"), () -> NOW_MS));
    }

    @Test
    public void missingCookieOrDomainIsError() throws Exception {
        write("a", "{\"example.com\":{\"/\":{\"sessionid\":\"sessionid=X\"}}}");
        assertSessionError(new SessionReader(tmp.getRoot(), () -> NOW_MS));
        write("a", "{\"wordfeud.com\":{\"/\":{\"other\":\"other=X\"}}}");
        assertSessionError(new SessionReader(tmp.getRoot(), () -> NOW_MS));
        write("a", domains("sessionid=; Path=/"));
        assertSessionError(new SessionReader(tmp.getRoot(), () -> NOW_MS));
        write("a", "{\"wordfeud.com\":{\"/\":{\"sessionid\":null}}}");
        assertSessionError(new SessionReader(tmp.getRoot(), () -> NOW_MS));
        write("a", "not json");
        assertSessionError(new SessionReader(tmp.getRoot(), () -> NOW_MS));
    }

    @Test
    public void sessionCookieWithoutExpiresIsValid() throws Exception {
        write("a", domains("sessionid=ABC; Path=/; HttpOnly"));
        assertEquals("ABC", new SessionReader(tmp.getRoot(), () -> NOW_MS).sessionId());
    }

    @Test
    public void toleratesDashedAndWeekdaylessDates() throws Exception {
        write("a", domains("sessionid=ABC; expires=Tue, 03-Nov-2099 13:14:36 GMT"));
        SessionReader r = new SessionReader(tmp.getRoot(), () -> NOW_MS);
        assertEquals("ABC", r.sessionId());
        assertSessionError(new SessionReader(tmp.getRoot(), () -> EXPIRES_MS));
        write("a", domains("sessionid=ABC; Expires=03 Nov 2099 13:14:36 GMT"));
        assertEquals("ABC", new SessionReader(tmp.getRoot(), () -> NOW_MS).sessionId());
        assertSessionError(new SessionReader(tmp.getRoot(), () -> EXPIRES_MS));
    }

    @Test
    public void unparseableExpiresFallsBackToMaxAge() throws Exception {
        write("a", domains("sessionid=ABC; Expires=garbage; Max-Age=100;_crt=1000"));
        assertEquals("ABC", new SessionReader(tmp.getRoot(), () -> 1_099_999L).sessionId());
        assertSessionError(new SessionReader(tmp.getRoot(), () -> 1_100_000L));
    }

    @Test
    public void picksFirstValidSubdirSorted() throws Exception {
        write("b", domains("sessionid=SECOND"));
        write("c", domains("sessionid=THIRD"));
        write("a", domains("sessionid=EXPIRED; Expires=Thu, 01 Jan 1970 00:00:01 GMT"));
        assertEquals("SECOND", new SessionReader(tmp.getRoot(), () -> NOW_MS).sessionId());
    }

    @Test
    public void rejectsValueWithControlCharacters() throws Exception {
        write("a", domains("sessionid=AB\\r\\nX: y"));
        assertSessionError(new SessionReader(tmp.getRoot(), () -> NOW_MS));
    }
}
