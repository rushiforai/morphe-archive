package app.morphed.extension.twitch.vpn;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.SocketTimeoutException;
import java.util.Iterator;
import java.util.Map;
import java.util.TreeMap;

/**
 * One TCP connection through the tunnel, as a client: the handshake, sending with retransmission, and receiving
 * in order with a large window (window scaling) so a 1440p stream's segments come in at full speed.
 */
public final class TcpConnection {
    private static final int FIN = 1, SYN = 2, RST = 4, PSH = 8, ACK = 16;
    private static final int RECEIVE_CAPACITY = 1 << 22; // 4 MB
    private static final int OUR_SCALE = 7;
    private static final int MAX_FLIGHT = 256 * 1024;
    private static final long MIN_RTO = 300, MAX_RTO = 16_000;
    private static final int MAX_RETRIES = 8;

    final IpStack stack;
    final byte[] remoteAddress;
    final int remotePort, localPort;
    private final int iss;

    // send side
    private int sndUna, sndNxt;
    private byte[] sendBuffer = new byte[16384];
    private int sendLength; // bytes from sndUna on: in flight and not yet sent
    private long peerWindow = 65535;
    private int peerScale;
    private int peerMss = 536;
    private long rto = 1000;
    private long lastTransmitAt;
    private int retries;
    private int duplicateAcks;
    private boolean closeWanted, finSent, finAcked;

    // receive side
    private int rcvNxt;
    private byte[] receiveBuffer = new byte[256 * 1024]; // grows up to RECEIVE_CAPACITY while data waits
    private int readAt, readable;
    private final TreeMap<Long, byte[]> outOfOrder = new TreeMap<>(); // by sequence number
    private int outOfOrderBytes;
    private long lastAdvertised;
    private boolean finReceived;

    private boolean established;
    private String error;
    private int timeoutMs = 15_000;

    TcpConnection(IpStack stack, byte[] remoteAddress, int remotePort, int localPort, int iss) {
        this.stack = stack;
        this.remoteAddress = remoteAddress;
        this.remotePort = remotePort;
        this.localPort = localPort;
        this.iss = iss;
        sndUna = iss;
        sndNxt = iss;
        lastTransmitAt = System.currentTimeMillis(); // the SYN goes out right away: no early resend by the timer
    }

    public synchronized void setTimeout(int ms) {
        timeoutMs = ms;
    }

    // --- connecting

    synchronized void connect(int timeout) throws IOException {
        sendSegment(SYN, iss, null, 0, 0);
        sndNxt = iss + 1;
        lastTransmitAt = System.currentTimeMillis();
        long deadline = System.currentTimeMillis() + timeout;
        while (!established && error == null) {
            long left = deadline - System.currentTimeMillis();
            if (left <= 0) {
                error = "no answer";
                stack.forget(this);
                throw new SocketTimeoutException("Connecting through the VPN timed out");
            }
            try {
                wait(left);
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
                throw new IOException("Interrupted");
            }
        }
        if (error != null) throw new IOException("Connecting through the VPN failed: " + error);
    }

    // --- segments out

    private int advertisedWindow() {
        long free = RECEIVE_CAPACITY - readable - outOfOrderBytes;
        lastAdvertised = Math.max(0, free);
        return (int) Math.min(65535, Math.max(0, free) >> OUR_SCALE);
    }

    private void sendSegment(int flags, int seq, byte[] data, int offset, int length) {
        boolean syn = (flags & SYN) != 0;
        int headerLength = syn ? 28 : 20;
        byte[] segment = new byte[headerLength + length];
        segment[0] = (byte) (localPort >>> 8);
        segment[1] = (byte) localPort;
        segment[2] = (byte) (remotePort >>> 8);
        segment[3] = (byte) remotePort;
        putInt(segment, 4, seq);
        putInt(segment, 8, (flags & ACK) != 0 ? rcvNxt : 0);
        segment[12] = (byte) ((headerLength / 4) << 4);
        segment[13] = (byte) flags;
        int window = syn ? 65535 : advertisedWindow();
        segment[14] = (byte) (window >>> 8);
        segment[15] = (byte) window;
        if (syn) {
            segment[20] = 2; // MSS
            segment[21] = 4;
            segment[22] = (byte) (stack.mss >>> 8);
            segment[23] = (byte) stack.mss;
            segment[24] = 1; // NOP
            segment[25] = 3; // window scale
            segment[26] = 3;
            segment[27] = OUR_SCALE;
        }
        if (length > 0) System.arraycopy(data, offset, segment, headerLength, length);
        int sum = IpStack.checksum(segment, 0, segment.length,
                stack.pseudoHeaderSum(remoteAddress, IpStack.PROTO_TCP, segment.length));
        segment[16] = (byte) (sum >>> 8);
        segment[17] = (byte) sum;
        stack.sendIp(IpStack.PROTO_TCP, remoteAddress, segment, segment.length);
    }

    private static void putInt(byte[] b, int at, int v) {
        b[at] = (byte) (v >>> 24);
        b[at + 1] = (byte) (v >>> 16);
        b[at + 2] = (byte) (v >>> 8);
        b[at + 3] = (byte) v;
    }

    private static int getInt(byte[] b, int at) {
        return (b[at] & 0xff) << 24 | (b[at + 1] & 0xff) << 16 | (b[at + 2] & 0xff) << 8 | (b[at + 3] & 0xff);
    }

    private void sendAck() {
        sendSegment(ACK, sndNxt, null, 0, 0);
    }

    /** Sends what the peer's window allows of what's queued, then the FIN once everything went. */
    private void pump() {
        if (!established || error != null) return;
        while (true) {
            int inFlight = Math.min(sndNxt - sndUna, sendLength);
            int unsent = sendLength - inFlight;
            long room = Math.min(peerWindow, MAX_FLIGHT) - inFlight;
            if (unsent <= 0 || room <= 0) break;
            int size = (int) Math.min(Math.min(unsent, room), Math.min(peerMss, stack.mss));
            if (sndNxt == sndUna) lastTransmitAt = System.currentTimeMillis();
            sendSegment(ACK | PSH, sndNxt, sendBuffer, inFlight, size);
            sndNxt += size;
        }
        if (closeWanted && !finSent && sndNxt - sndUna == sendLength) {
            if (sndNxt == sndUna) lastTransmitAt = System.currentTimeMillis();
            sendSegment(FIN | ACK, sndNxt, null, 0, 0);
            sndNxt += 1;
            finSent = true;
        }
    }

    /** Resends from the oldest byte not acknowledged. */
    private void retransmit() {
        int inFlight = Math.min(sndNxt - sndUna, sendLength);
        if (inFlight > 0) {
            int size = Math.min(inFlight, Math.min(peerMss, stack.mss));
            sendSegment(ACK | PSH, sndUna, sendBuffer, 0, size);
        } else if (finSent && !finAcked) {
            sendSegment(FIN | ACK, sndNxt - 1, null, 0, 0);
        }
        lastTransmitAt = System.currentTimeMillis();
    }

    /** Called by the stack's timer every few tens of milliseconds. */
    synchronized void tick(long now) {
        if (error != null) return;
        if (!established) {
            if (now - lastTransmitAt > rto) {
                if (++retries > MAX_RETRIES / 2) {
                    fail("no answer");
                    return;
                }
                rto = Math.min(rto * 2, MAX_RTO);
                sendSegment(SYN, iss, null, 0, 0);
                lastTransmitAt = now;
            }
            return;
        }
        boolean outstanding = sndNxt != sndUna;
        if (outstanding && now - lastTransmitAt > rto) {
            if (++retries > MAX_RETRIES) {
                fail("the server stopped answering");
                return;
            }
            rto = Math.min(rto * 2, MAX_RTO);
            retransmit();
        } else if (!outstanding && sendLength > 0 && peerWindow == 0 && now - lastTransmitAt > rto) {
            sendSegment(ACK, sndNxt - 1, null, 0, 0); // window probe
            lastTransmitAt = now;
        }
    }

    private void fail(String why) {
        error = why;
        stack.forget(this);
        notifyAll();
    }

    void abort(String why) {
        synchronized (this) {
            fail(why);
        }
    }

    // --- segments in

    synchronized void onSegment(byte[] packet, int at, int size) {
        int seq = getInt(packet, at + 4);
        int ack = getInt(packet, at + 8);
        int headerLength = ((packet[at + 12] & 0xff) >>> 4) * 4;
        int flags = packet[at + 13] & 0x3f;
        int window = ((packet[at + 14] & 0xff) << 8) | (packet[at + 15] & 0xff);
        if (headerLength < 20 || headerLength > size) return;
        int dataAt = at + headerLength, dataLength = size - headerLength;

        if ((flags & RST) != 0) {
            if (established ? inWindow(seq) : (flags & ACK) != 0 && ack == iss + 1) fail("the server reset the connection");
            return;
        }
        if (!established) {
            if ((flags & (SYN | ACK)) == (SYN | ACK) && ack == iss + 1) {
                readOptions(packet, at + 20, headerLength - 20);
                rcvNxt = seq + 1;
                sndUna = ack;
                peerWindow = window; // not scaled in a SYN
                established = true;
                retries = 0;
                rto = 1000;
                sendAck();
                notifyAll();
            }
            return;
        }
        if ((flags & SYN) != 0) { // a repeated SYN-ACK: our ACK was lost
            sendAck();
            return;
        }
        if ((flags & ACK) != 0) onAck(ack, window, dataLength == 0 && (flags & FIN) == 0);
        boolean answer = false;
        if (dataLength > 0) {
            receive(seq, packet, dataAt, dataLength);
            answer = true;
        }
        if ((flags & FIN) != 0 && seq + dataLength == rcvNxt && !finReceived) {
            finReceived = true;
            rcvNxt += 1;
            answer = true;
        } else if ((flags & FIN) != 0) {
            answer = true;
        }
        if (answer) sendAck();
        pump();
        notifyAll();
    }

    private boolean inWindow(int seq) {
        int offset = seq - rcvNxt;
        return offset >= 0 && offset < RECEIVE_CAPACITY;
    }

    private void readOptions(byte[] p, int at, int length) {
        int end = at + length;
        while (at < end) {
            int kind = p[at] & 0xff;
            if (kind == 0) break;
            if (kind == 1) {
                at++;
                continue;
            }
            if (at + 1 >= end) break;
            int size = p[at + 1] & 0xff;
            if (size < 2) break;
            if (kind == 2 && size == 4) peerMss = ((p[at + 2] & 0xff) << 8) | (p[at + 3] & 0xff);
            if (kind == 3 && size == 3) peerScale = Math.min(p[at + 2] & 0xff, 14);
            at += size;
        }
    }

    private void onAck(int ack, int window, boolean pureAck) {
        int acked = ack - sndUna;
        int outstanding = sndNxt - sndUna;
        long newWindow = (long) window << peerScale;
        if (acked > 0 && acked <= outstanding) {
            int dataAcked = Math.min(acked, sendLength);
            System.arraycopy(sendBuffer, dataAcked, sendBuffer, 0, sendLength - dataAcked);
            sendLength -= dataAcked;
            sndUna = ack;
            if (finSent && ack == sndNxt) finAcked = true;
            retries = 0;
            rto = Math.max(MIN_RTO, Math.min(rto, 1000));
            duplicateAcks = 0;
            lastTransmitAt = System.currentTimeMillis();
        } else if (acked == 0 && outstanding > 0 && pureAck && newWindow == peerWindow) {
            if (++duplicateAcks == 3) retransmit(); // fast retransmit
        }
        peerWindow = newWindow;
    }

    private void receive(int seq, byte[] data, int at, int length) {
        int offset = seq - rcvNxt;
        if (offset < 0) { // partly old (a retransmission): keep the new part
            if (-offset >= length) return;
            at -= offset;
            length += offset;
            offset = 0;
        }
        if (offset > 0) { // ahead of a gap: kept until the gap fills
            if (offset >= RECEIVE_CAPACITY || outOfOrderBytes + length > RECEIVE_CAPACITY / 2) return;
            long key = (offset + rcvNxt) & 0xffffffffL; // its sequence number
            byte[] copy = new byte[length];
            System.arraycopy(data, at, copy, 0, length);
            if (!outOfOrder.containsKey(key)) {
                outOfOrder.put(key, copy);
                outOfOrderBytes += length;
            }
            return;
        }
        append(data, at, length);
        // Filled a gap: what waited behind it follows.
        boolean progressed = true;
        while (progressed && !outOfOrder.isEmpty()) {
            progressed = false;
            Iterator<Map.Entry<Long, byte[]>> it = outOfOrder.entrySet().iterator();
            while (it.hasNext()) {
                Map.Entry<Long, byte[]> entry = it.next();
                int behind = (int) entry.getKey().longValue() - rcvNxt; // wraps like sequence numbers do
                byte[] piece = entry.getValue();
                if (behind > 0 && behind < RECEIVE_CAPACITY) continue; // still a gap before it
                it.remove();
                outOfOrderBytes -= piece.length;
                int skip = -behind;
                if (skip >= 0 && skip < piece.length) {
                    append(piece, skip, piece.length - skip);
                    progressed = true;
                }
            }
        }
    }

    private void append(byte[] data, int at, int length) {
        int room = RECEIVE_CAPACITY - readable;
        int take = Math.min(room, length);
        if (readable + take > receiveBuffer.length) { // more waiting than fits: grow (data in order from 0)
            int size = receiveBuffer.length;
            while (size < readable + take) size *= 2;
            byte[] grown = new byte[Math.min(size, RECEIVE_CAPACITY)];
            int first = Math.min(readable, receiveBuffer.length - readAt);
            System.arraycopy(receiveBuffer, readAt, grown, 0, first);
            System.arraycopy(receiveBuffer, 0, grown, first, readable - first);
            receiveBuffer = grown;
            readAt = 0;
        }
        int capacity = receiveBuffer.length;
        int writeAt = (readAt + readable) % capacity;
        int first = Math.min(take, capacity - writeAt);
        System.arraycopy(data, at, receiveBuffer, writeAt, first);
        System.arraycopy(data, at + first, receiveBuffer, 0, take - first);
        readable += take;
        rcvNxt += take;
    }

    // --- the application's side

    private synchronized int read(byte[] out, int offset, int length) throws IOException {
        long deadline = System.currentTimeMillis() + timeoutMs;
        while (readable == 0) {
            if (finReceived) return -1;
            if (error != null) throw new IOException("The VPN connection broke: " + error);
            long left = deadline - System.currentTimeMillis();
            if (left <= 0) throw new SocketTimeoutException("No data through the VPN in time");
            try {
                wait(left);
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
                throw new IOException("Interrupted");
            }
        }
        int take = Math.min(length, readable);
        int capacity = receiveBuffer.length;
        int first = Math.min(take, capacity - readAt);
        System.arraycopy(receiveBuffer, readAt, out, offset, first);
        System.arraycopy(receiveBuffer, 0, out, offset + first, take - first);
        readAt = (readAt + take) % capacity;
        readable -= take;
        // The window opened up a lot since it was last told: tell it, or the server waits for nothing.
        long free = RECEIVE_CAPACITY - readable - outOfOrderBytes;
        if (lastAdvertised < RECEIVE_CAPACITY / 4 && free >= RECEIVE_CAPACITY / 2) sendAck();
        return take;
    }

    private synchronized void write(byte[] data, int offset, int length) throws IOException {
        if (error != null) throw new IOException("The VPN connection broke: " + error);
        if (closeWanted) throw new IOException("The connection is closed");
        if (sendLength + length > sendBuffer.length) {
            sendBuffer = java.util.Arrays.copyOf(sendBuffer, Math.max(sendBuffer.length * 2, sendLength + length));
        }
        System.arraycopy(data, offset, sendBuffer, sendLength, length);
        sendLength += length;
        pump();
    }

    public synchronized void close() {
        if (closeWanted) return;
        closeWanted = true;
        pump();
        if (error == null && finReceived) stack.forget(this);
    }

    /** Ends at once (a pooled connection that's no longer wanted, or a broken one). */
    public synchronized void reset() {
        try {
            if (error == null && established) sendSegment(RST | ACK, sndNxt, null, 0, 0);
        } catch (RuntimeException ignored) {
            // the tunnel is going away: the connection is let go either way
        } finally {
            fail("closed");
        }
    }

    /** Whether it's over (failed, reset, or both sides closed): nothing more will come or go. */
    synchronized boolean isFinished() {
        return error != null || (finReceived && closeWanted);
    }

    public synchronized boolean isOpen() {
        return error == null && established && !finReceived && !closeWanted;
    }

    public final InputStream input = new InputStream() {
        @Override
        public int read() throws IOException {
            byte[] one = new byte[1];
            int n = read(one, 0, 1);
            return n < 0 ? -1 : one[0] & 0xff;
        }

        @Override
        public int read(byte[] b, int off, int len) throws IOException {
            if (len == 0) return 0;
            return TcpConnection.this.read(b, off, len);
        }

        @Override
        public int available() {
            synchronized (TcpConnection.this) {
                return readable;
            }
        }
    };

    public final OutputStream output = new OutputStream() {
        @Override
        public void write(int b) throws IOException {
            TcpConnection.this.write(new byte[]{(byte) b}, 0, 1);
        }

        @Override
        public void write(byte[] b, int off, int len) throws IOException {
            TcpConnection.this.write(b, off, len);
        }
    };
}
