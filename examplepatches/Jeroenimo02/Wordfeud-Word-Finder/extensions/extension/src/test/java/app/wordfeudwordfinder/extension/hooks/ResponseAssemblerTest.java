package app.wordfeudwordfinder.extension.hooks;

import static org.junit.Assert.*;

import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;
import org.junit.Test;

public class ResponseAssemblerTest {
    private static final String DETAIL = "https://api.wordfeud.com/wf/user/games/detail/?ids=1";
    private static final String MOVE = "https://api.wordfeud.com/wf/game/5/move/";

    /** Mimics Cronet: bytes at [0, position), limit = capacity. */
    private static ByteBuffer chunk(String s) {
        byte[] b = s.getBytes(StandardCharsets.UTF_8);
        ByteBuffer buf = ByteBuffer.allocate(16);
        buf.put(b);
        return buf;
    }

    @Test
    public void chunksConcatenated() {
        ResponseAssembler a = new ResponseAssembler();
        Object r = new Object();
        ByteBuffer b1 = chunk("ab"), b2 = chunk("cd");
        a.started(r, DETAIL);
        a.read(r, b1);
        a.read(r, b2);
        assertEquals(2, b1.position());
        assertEquals(2, b2.position());
        assertEquals(16, b1.limit());
        ResponseAssembler.Completed c = a.succeeded(r);
        assertEquals("abcd", c.body);
        assertEquals(DETAIL, c.url);
    }

    @Test
    public void interleavedRequestsSeparated() {
        ResponseAssembler a = new ResponseAssembler();
        Object ra = new Object(), rb = new Object();
        a.started(ra, DETAIL);
        a.started(rb, MOVE);
        a.read(ra, chunk("A1"));
        a.read(rb, chunk("B1"));
        a.read(ra, chunk("A2"));
        a.read(rb, chunk("B2"));
        assertEquals("A1A2", a.succeeded(ra).body);
        assertEquals("B1B2", a.succeeded(rb).body);
    }

    @Test
    public void irrelevantUrlIgnored() {
        ResponseAssembler a = new ResponseAssembler();
        Object r = new Object();
        a.started(r, "https://example.com/wf/user/games/detail/");
        a.read(r, chunk("x"));
        assertNull(a.succeeded(r));
    }

    @Test
    public void everyWordfeudApiUrlIsCollected() {
        ResponseAssembler a = new ResponseAssembler();
        Object r = new Object();
        a.started(r, "https://api.wordfeud.com/wf/game/123/?game_format=log");
        a.read(r, chunk("x"));
        assertEquals("x", a.succeeded(r).body);
    }

    @Test
    public void droppedClears() {
        ResponseAssembler a = new ResponseAssembler();
        Object r = new Object();
        a.started(r, MOVE);
        a.read(r, chunk("x"));
        a.dropped(r);
        assertNull(a.succeeded(r));
    }

    @Test
    public void oversizedBodyDropped() {
        ResponseAssembler a = new ResponseAssembler();
        Object r = new Object();
        a.started(r, DETAIL);
        ByteBuffer big = ByteBuffer.allocate(ResponseAssembler.MAX_BODY + 1);
        big.position(big.capacity());
        a.read(r, big);
        assertNull(a.succeeded(r));
    }

    @Test
    public void chunkedJsonBodyIsValid() throws Exception {
        ResponseAssembler a = new ResponseAssembler();
        Object r = new Object();
        a.started(r, DETAIL);
        a.read(r, chunk("{\"status\":\"su"));
        a.read(r, chunk("ccess\"}"));
        assertEquals("success", new org.json.JSONObject(a.succeeded(r).body).getString("status"));
    }
}
