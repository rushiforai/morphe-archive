package app.template.extension.aare.adb;

import java.io.ByteArrayOutputStream;
import java.io.Closeable;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.charset.StandardCharsets;

import javax.net.ssl.SSLSocket;

/**
 * A minimal adb client for the phone's own wireless debugging: connects with AARE's paired key
 * over TLS and runs one shell command. Adapted from Shizuku's AdbClient (Apache-2.0).
 */
final class AdbClient implements Closeable {
    private static final int A_CNXN = 0x4e584e43;
    private static final int A_AUTH = 0x48545541;
    private static final int A_OPEN = 0x4e45504f;
    private static final int A_OKAY = 0x59414b4f;
    private static final int A_CLSE = 0x45534c43;
    private static final int A_WRTE = 0x45545257;
    private static final int A_STLS = 0x534C5453;
    private static final int A_VERSION = 0x01000000;
    private static final int A_MAXDATA = 4096;
    private static final int A_STLS_VERSION = 0x01000000;

    /** adbd asked for the old RSA authentication: this key isn't paired (or pairing was revoked). */
    static final class NotPairedException extends IOException {
        NotPairedException() {
            super("not paired");
        }
    }

    private final Socket socket;
    private InputStream in;
    private OutputStream out;

    private static final class Message {
        int command, arg0, arg1;
        byte[] data;
    }

    AdbClient(AdbKey key, String host, int port) throws Exception {
        socket = new Socket();
        socket.connect(new InetSocketAddress(host, port), 10_000);
        socket.setTcpNoDelay(true);
        socket.setSoTimeout(30_000);
        in = socket.getInputStream();
        out = socket.getOutputStream();

        write(A_CNXN, A_VERSION, A_MAXDATA, "host::\u0000".getBytes(StandardCharsets.UTF_8));
        Message m = read();
        if (m.command == A_STLS) {
            write(A_STLS, A_STLS_VERSION, 0, null);
            SSLSocket tls = (SSLSocket) key.sslContext().getSocketFactory().createSocket(socket, host, port, true);
            tls.startHandshake();
            in = tls.getInputStream();
            out = tls.getOutputStream();
            m = read();
        } else if (m.command == A_AUTH) {
            throw new NotPairedException();
        }
        if (m.command != A_CNXN) throw new IOException("adb: unexpected reply " + Integer.toHexString(m.command));
    }

    /** Runs a command with "sh -c" semantics and returns its output, after it ends. */
    private int nextLocalId = 1;

    String shell(String command) throws IOException {
        final int localId = nextLocalId++;
        write(A_OPEN, localId, 0, ("shell:" + command + "\u0000").getBytes(StandardCharsets.UTF_8));
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        Message m = read();
        while (m.arg1 != localId && m.arg1 != 0) m = read(); // skip leftovers of an earlier stream
        if (m.command == A_CLSE) {
            throw new IOException("adb: shell refused");
        }
        if (m.command != A_OKAY) throw new IOException("adb: unexpected reply " + Integer.toHexString(m.command));
        while (true) {
            m = read();
            int remoteId = m.arg0;
            if (m.arg1 != localId) continue; // a late message of an earlier stream
            if (m.command == A_WRTE) {
                if (m.data != null) output.write(m.data, 0, m.data.length);
                write(A_OKAY, localId, remoteId, null);
            } else if (m.command == A_CLSE) {
                write(A_CLSE, localId, remoteId, null);
                break;
            } else if (m.command != A_OKAY) {
                throw new IOException("adb: unexpected reply " + Integer.toHexString(m.command));
            }
        }
        return output.toString("UTF-8");
    }

    private void write(int command, int arg0, int arg1, byte[] data) throws IOException {
        int length = data == null ? 0 : data.length;
        ByteBuffer b = ByteBuffer.allocate(24 + length).order(ByteOrder.LITTLE_ENDIAN);
        b.putInt(command).putInt(arg0).putInt(arg1).putInt(length).putInt(checksum(data)).putInt(command ^ 0xFFFFFFFF);
        if (data != null) b.put(data);
        out.write(b.array());
        out.flush();
    }

    private Message read() throws IOException {
        DataInputStream din = new DataInputStream(in);
        byte[] header = new byte[24];
        din.readFully(header);
        ByteBuffer b = ByteBuffer.wrap(header).order(ByteOrder.LITTLE_ENDIAN);
        Message m = new Message();
        m.command = b.getInt();
        m.arg0 = b.getInt();
        m.arg1 = b.getInt();
        int length = b.getInt();
        b.getInt(); // checksum: not checked by modern adb either
        int magic = b.getInt();
        if (magic != (m.command ^ 0xFFFFFFFF)) throw new IOException("adb: bad message");
        if (length < 0 || length > 1024 * 1024) throw new IOException("adb: bad length " + length);
        if (length > 0) {
            m.data = new byte[length];
            din.readFully(m.data);
        }
        return m;
    }

    private static int checksum(byte[] data) {
        if (data == null) return 0;
        int sum = 0;
        for (byte x : data) sum += x & 0xFF;
        return sum;
    }

    @Override
    public void close() {
        try {
            socket.close();
        } catch (IOException ignored) {
        }
    }
}
