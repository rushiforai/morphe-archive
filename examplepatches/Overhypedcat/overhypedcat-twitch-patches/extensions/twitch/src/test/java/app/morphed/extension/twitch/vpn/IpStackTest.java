package app.morphed.extension.twitch.vpn;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import org.junit.Test;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.TimeUnit;

/** The tunnel's TCP/IP against a scripted server on the other end of a fake link. */
public class IpStackTest {
    private static final byte[] LOCAL = {10, 2, 0, 2};
    private static final byte[] REMOTE = {93, (byte) 184, (byte) 216, 34};
    private static final int FIN = 1, SYN = 2, RST = 4, ACK = 16;

    /** A parsed TCP segment the stack sent. */
    static final class Segment {
        int sourcePort, seq, ack, flags, window;
        byte[] data;
        byte[] options;
    }

    /** The link: what the stack sends lands in a queue; the test answers into the stack. */
    static final class FakeLink implements IpStack.Link {
        final LinkedBlockingQueue<byte[]> sent = new LinkedBlockingQueue<>();
        volatile boolean up = true;

        @Override
        public boolean send(byte[] packet, int offset, int length) {
            if (!up) return false;
            byte[] copy = new byte[length];
            System.arraycopy(packet, offset, copy, 0, length);
            sent.add(copy);
            return true;
        }
    }

    static Segment parse(byte[] packet) {
        assertEquals(0x45, packet[0]);
        assertEquals(0, IpStack.checksum(packet, 0, 20, 0)); // a valid IP header sums to zero
        assertEquals(IpStack.PROTO_TCP, packet[9]);
        int at = 20;
        Segment s = new Segment();
        s.sourcePort = ((packet[at] & 0xff) << 8) | (packet[at + 1] & 0xff);
        s.seq = getInt(packet, at + 4);
        s.ack = getInt(packet, at + 8);
        int header = ((packet[at + 12] & 0xff) >>> 4) * 4;
        s.flags = packet[at + 13] & 0x3f;
        s.window = ((packet[at + 14] & 0xff) << 8) | (packet[at + 15] & 0xff);
        s.options = new byte[header - 20];
        System.arraycopy(packet, at + 20, s.options, 0, s.options.length);
        s.data = new byte[packet.length - at - header];
        System.arraycopy(packet, at + header, s.data, 0, s.data.length);
        return s;
    }

    static int getInt(byte[] b, int at) {
        return (b[at] & 0xff) << 24 | (b[at + 1] & 0xff) << 16 | (b[at + 2] & 0xff) << 8 | (b[at + 3] & 0xff);
    }

    /** A segment from the server to the stack, as an IP packet. */
    static byte[] reply(int localPort, int seq, int ack, int flags, byte[] data, byte[] options) {
        int header = 20 + (options == null ? 0 : options.length);
        int length = 20 + header + (data == null ? 0 : data.length);
        byte[] p = new byte[length];
        p[0] = 0x45;
        p[2] = (byte) (length >>> 8);
        p[3] = (byte) length;
        p[8] = 64;
        p[9] = IpStack.PROTO_TCP;
        System.arraycopy(REMOTE, 0, p, 12, 4);
        System.arraycopy(LOCAL, 0, p, 16, 4);
        p[20] = 0x01;
        p[21] = (byte) 0xbb; // port 443
        p[22] = (byte) (localPort >>> 8);
        p[23] = (byte) localPort;
        putInt(p, 24, seq);
        putInt(p, 28, ack);
        p[32] = (byte) ((header / 4) << 4);
        p[33] = (byte) flags;
        p[34] = (byte) 0xff;
        p[35] = (byte) 0xff;
        if (options != null) System.arraycopy(options, 0, p, 40, options.length);
        if (data != null) System.arraycopy(data, 0, p, 20 + header, data.length);
        return p;
    }

    static void putInt(byte[] b, int at, int v) {
        b[at] = (byte) (v >>> 24);
        b[at + 1] = (byte) (v >>> 16);
        b[at + 2] = (byte) (v >>> 8);
        b[at + 3] = (byte) v;
    }

    private static Segment next(FakeLink link) throws InterruptedException {
        byte[] packet = link.sent.poll(5, TimeUnit.SECONDS);
        if (packet == null) fail("the stack sent nothing");
        return parse(packet);
    }

    /** Connects through a handshake answered by the test; returns [connection, server's seq, our next seq, port]. */
    private static Object[] connected(IpStack stack, FakeLink link) throws Exception {
        TcpConnection[] holder = new TcpConnection[1];
        Exception[] error = new Exception[1];
        Thread connecting = new Thread(() -> {
            try {
                holder[0] = stack.connect(REMOTE, 443, 5000);
            } catch (Exception e) {
                error[0] = e;
            }
        });
        connecting.start();
        Segment syn = next(link);
        assertEquals(SYN, syn.flags);
        assertEquals(8, syn.options.length); // MSS and window scale
        assertEquals(3, syn.options[5]);
        int serverSeq = 1_000_000;
        stack.receive(reply(syn.sourcePort, serverSeq, syn.seq + 1, SYN | ACK, null, new byte[]{2, 4, 0x05, (byte) 0xb4}), 0,
                reply(syn.sourcePort, serverSeq, syn.seq + 1, SYN | ACK, null, new byte[]{2, 4, 0x05, (byte) 0xb4}).length);
        Segment ack = next(link);
        assertEquals(ACK, ack.flags);
        assertEquals(serverSeq + 1, ack.ack);
        connecting.join(5000);
        if (error[0] != null) throw error[0];
        return new Object[]{holder[0], serverSeq + 1, syn.seq + 1, syn.sourcePort};
    }

    private static void deliver(IpStack stack, byte[] packet) {
        stack.receive(packet, 0, packet.length);
    }

    @Test
    public void connectsSendsAndReceivesInOrderEvenWhenSegmentsArriveOutOfOrder() throws Exception {
        FakeLink link = new FakeLink();
        IpStack stack = new IpStack(LOCAL, null, 1420, link);
        Object[] c = connected(stack, link);
        TcpConnection connection = (TcpConnection) c[0];
        int serverSeq = (Integer) c[1], ourSeq = (Integer) c[2], port = (Integer) c[3];

        connection.output.write("GET / HTTP/1.1\r\n\r\n".getBytes(StandardCharsets.US_ASCII));
        Segment request = next(link);
        assertEquals("GET / HTTP/1.1\r\n\r\n", new String(request.data, StandardCharsets.US_ASCII));
        assertEquals(ourSeq, request.seq);
        deliver(stack, reply(port, serverSeq, ourSeq + request.data.length, ACK, null, null));

        byte[] first = "hello ".getBytes(StandardCharsets.US_ASCII), second = "world".getBytes(StandardCharsets.US_ASCII);
        // the second piece first: kept until the gap before it fills
        deliver(stack, reply(port, serverSeq + first.length, ourSeq + request.data.length, ACK, second, null));
        Segment dupAck = next(link);
        assertEquals(serverSeq, dupAck.ack); // still waiting for the first
        deliver(stack, reply(port, serverSeq, ourSeq + request.data.length, ACK, first, null));
        Segment ack = next(link);
        assertEquals(serverSeq + first.length + second.length, ack.ack);
        deliver(stack, reply(port, serverSeq + 11, ourSeq + request.data.length, FIN | ACK, null, null));

        ByteArrayOutputStream got = new ByteArrayOutputStream();
        byte[] buffer = new byte[64];
        int read;
        while ((read = connection.input.read(buffer)) != -1) got.write(buffer, 0, read);
        assertEquals("hello world", got.toString("US-ASCII"));
        stack.close();
    }

    @Test
    public void unacknowledgedDataIsSentAgain() throws Exception {
        FakeLink link = new FakeLink();
        IpStack stack = new IpStack(LOCAL, null, 1420, link);
        Object[] c = connected(stack, link);
        TcpConnection connection = (TcpConnection) c[0];
        connection.output.write(new byte[]{1, 2, 3});
        Segment sent = next(link);
        Segment again = next(link); // no ACK came: the stack resends after its timeout
        assertEquals(sent.seq, again.seq);
        assertArrayEquals(sent.data, again.data);
        stack.close();
    }

    @Test
    public void aResetConnectionFailsItsReads() throws Exception {
        FakeLink link = new FakeLink();
        IpStack stack = new IpStack(LOCAL, null, 1420, link);
        Object[] c = connected(stack, link);
        TcpConnection connection = (TcpConnection) c[0];
        deliver(stack, reply((Integer) c[3], (Integer) c[1], (Integer) c[2], RST | ACK, null, null));
        try {
            connection.input.read(new byte[4]);
            fail("read after a reset");
        } catch (IOException expected) {
            assertTrue(expected.getMessage(), expected.getMessage().contains("reset"));
        }
        stack.close();
    }

    @Test
    public void largeDataIsSplitIntoSegmentsTheServerCanTake() throws Exception {
        FakeLink link = new FakeLink();
        IpStack stack = new IpStack(LOCAL, null, 1420, link);
        Object[] c = connected(stack, link);
        TcpConnection connection = (TcpConnection) c[0];
        connection.output.write(new byte[4000]);
        List<Segment> segments = new ArrayList<>();
        int total = 0;
        while (total < 4000) {
            Segment s = next(link);
            assertTrue(s.data.length <= 1460); // the server's MSS (1460) and ours (1380)
            if (segments.isEmpty() || s.seq != segments.get(0).seq) total += s.data.length;
            segments.add(s);
        }
        assertEquals(4000, total);
        stack.close();
    }

    @Test
    public void dnsAnswersAreRead() throws IOException {
        byte[] query = IpStack.Dns.query("usher.ttvnw.net", 0x1234);
        assertEquals(0x12, query[0] & 0xff);
        // an answer: header, the question again, then one A record (name pointer, type 1, class 1, ttl 300, 4 bytes)
        ByteArrayOutputStream answer = new ByteArrayOutputStream();
        answer.write(query, 0, 2);
        answer.write(new byte[]{(byte) 0x81, (byte) 0x80, 0, 1, 0, 1, 0, 0, 0, 0}, 0, 10);
        answer.write(query, 12, query.length - 12);
        answer.write(new byte[]{(byte) 0xc0, 0x0c, 0, 1, 0, 1, 0, 0, 1, 0x2c, 0, 4, 18, (byte) 239, 1, 2}, 0, 16);
        IpStack.Dns.Answer parsed = IpStack.Dns.parse(answer.toByteArray());
        assertArrayEquals(new byte[]{18, (byte) 239, 1, 2}, parsed.address);
        assertEquals(300, parsed.ttl);

        byte[] notFound = answer.toByteArray();
        notFound[3] = (byte) 0x83; // NXDOMAIN
        assertNull(IpStack.Dns.parse(notFound).address);
    }

    @Test
    public void ipLiteralsNeedNoDns() throws IOException {
        IpStack stack = new IpStack(LOCAL, null, 1420, new FakeLink());
        assertArrayEquals(new byte[]{1, 1, 1, 1}, stack.resolve("1.1.1.1"));
        stack.close();
    }

    @Test
    public void receivesMoreThanItsFirstBufferHolds() throws Exception {
        FakeLink link = new FakeLink();
        IpStack stack = new IpStack(LOCAL, null, 1420, link);
        Object[] c = connected(stack, link);
        TcpConnection connection = (TcpConnection) c[0];
        int serverSeq = (Integer) c[1], ourSeq = (Integer) c[2], port = (Integer) c[3];
        byte[] piece = new byte[1400];
        int total = 600 * 1024; // more than the 256 KB the buffer starts with, nothing read meanwhile
        for (int sent = 0; sent < total; sent += piece.length) {
            for (int i = 0; i < piece.length; i++) piece[i] = (byte) (sent + i);
            deliver(stack, reply(port, serverSeq + sent, ourSeq, ACK, piece, null));
        }
        link.sent.clear();
        byte[] all = new byte[((total + piece.length - 1) / piece.length) * piece.length];
        int read = 0;
        while (read < all.length) read += connection.input.read(all, read, all.length - read);
        for (int i = 0; i < all.length; i++) assertEquals("byte " + i, (byte) i, all[i]);
        stack.close();
    }

    @Test
    public void fragmentsAreDropped() throws Exception {
        FakeLink link = new FakeLink();
        IpStack stack = new IpStack(LOCAL, null, 1420, link);
        Object[] c = connected(stack, link);
        TcpConnection connection = (TcpConnection) c[0];
        byte[] packet = reply((Integer) c[3], (Integer) c[1], (Integer) c[2], ACK, new byte[]{1, 2, 3}, null);
        packet[6] = 0x20; // more fragments follow
        deliver(stack, packet);
        assertEquals(0, connection.input.available());
        stack.close();
    }
}
