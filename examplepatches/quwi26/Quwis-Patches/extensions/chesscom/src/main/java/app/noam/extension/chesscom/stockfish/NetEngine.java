package app.noam.extension.chesscom.stockfish;

import android.content.Context;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.nio.charset.StandardCharsets;

import app.noam.extension.chesscom.Utils;

/**
 * The same Stockfish, running on the computer instead of the phone: the UCI conversation goes over a
 * socket to sf-bridge, which starts a Stockfish per connection and passes every line through
 * untouched. Everything above this class (FishnetSearch, LocalAnalysisFlow, the review's marks)
 * cannot tell the two apart — the Result is built the same way from the same info lines.
 *
 * The bridge speaks one line of its own first: it greets with "sf-bridge 1 cores 8", expects
 * "auth &lt;token&gt;" and answers "auth ok" (or "auth fail" and hangs up). After that it is plain UCI.
 */
public final class NetEngine extends Engine {
    private static final int CONNECT_TIMEOUT_MS = 5_000;
    private static final int AUTH_TIMEOUT_MS = 8_000;
    /** When an older bridge does not say: a typical desktop, and half of it for a review. */
    private static final int UNKNOWN_CORES = 8;

    private Socket socket;
    private volatile boolean hungUp;
    /** The computer's cores, from the bridge's greeting: what Auto threads and hash are sized for. */
    private int hostCores = UNKNOWN_CORES;

    /** Sized for the computer: its threads and hash from the settings, or its own when none are set. */
    public NetEngine() {
        super(BridgeSettings.threads(), BridgeSettings.hashMb());
    }

    @Override
    public boolean start(Context context) {
        String host = BridgeSettings.host();
        int port = BridgeSettings.port();
        if (host.isEmpty()) {
            Utils.log("Computer Stockfish: no address set");
            return false;
        }
        if (BridgeSettings.token().isEmpty()) {
            Utils.log("Computer Stockfish: no token set");
            return false;
        }
        try {
            Socket opened = new Socket();
            opened.connect(new InetSocketAddress(host, port), CONNECT_TIMEOUT_MS);
            opened.setTcpNoDelay(true);
            opened.setSoTimeout(AUTH_TIMEOUT_MS);
            socket = opened;

            BufferedReader reader = new BufferedReader(
                new InputStreamReader(opened.getInputStream(), StandardCharsets.UTF_8), 1 << 16);
            PrintWriter writer = new PrintWriter(
                new OutputStreamWriter(opened.getOutputStream(), StandardCharsets.UTF_8), true);

            String greeting = reader.readLine();
            if (greeting == null) throw new IOException("the bridge said nothing");
            int cores = coresIn(greeting);
            if (cores > 0) hostCores = cores;
            writer.println("auth " + BridgeSettings.token());
            String answer = reader.readLine();
            if (!"auth ok".equals(answer)) {
                throw new IOException(answer == null ? "the bridge hung up" : "the bridge refused the token");
            }
            // A search can take a minute: from here on reads block until Stockfish answers.
            opened.setSoTimeout(0);
            return handshake(context, reader, writer);
        } catch (IOException e) {
            Utils.logError("Computer Stockfish did not connect to " + host + ":" + port, e);
            quit();
            return false;
        }
    }

    @Override
    protected boolean alive() {
        Socket current = socket;
        return !hungUp && current != null && current.isConnected() && !current.isClosed();
    }

    @Override
    protected void closeTransport() {
        hungUp = true;
        Socket current = socket;
        socket = null;
        if (current != null) {
            try {
                current.close();
            } catch (IOException ignored) {
                // Already gone.
            }
        }
    }

    /** Auto on the computer means every one of its cores: nothing else is using them during a review. */
    @Override
    protected int autoThreads(Context context) {
        return Math.max(1, Math.min(32, hostCores));
    }

    /** Auto hash on the computer: 32 MB a core, kept between 128 MB and 1 GB. */
    @Override
    protected int autoHashMb(Context context) {
        return Math.max(128, Math.min(1_024, hostCores * 32));
    }

    /** The computer's cores from the bridge's greeting ("sf-bridge 1 cores 8"), or 0 when it names none. */
    static int coresIn(String greeting) {
        String[] parts = greeting.trim().split("\\s+");
        for (int i = 0; i + 1 < parts.length; i++) {
            if (!parts[i].equals("cores")) continue;
            try {
                return Integer.parseInt(parts[i + 1]);
            } catch (NumberFormatException ignored) {
                return 0;
            }
        }
        return 0;
    }

    /**
     * Asks the computer whether it is there: connects, sends the token and waits for Stockfish's
     * uciok. Null when all is well, otherwise what is wrong, in words the settings screen can show.
     * Called off the UI thread.
     */
    public static String ping() {
        String host = BridgeSettings.host();
        int port = BridgeSettings.port();
        if (host.isEmpty()) return "Set your computer's address first";
        if (BridgeSettings.token().isEmpty()) return "Set the bridge token first";

        Socket opened = new Socket();
        try {
            opened.connect(new InetSocketAddress(host, port), CONNECT_TIMEOUT_MS);
            opened.setSoTimeout(AUTH_TIMEOUT_MS);
            BufferedReader reader = new BufferedReader(
                new InputStreamReader(opened.getInputStream(), StandardCharsets.UTF_8), 1 << 16);
            PrintWriter writer = new PrintWriter(
                new OutputStreamWriter(opened.getOutputStream(), StandardCharsets.UTF_8), true);

            String greeting = reader.readLine();
            if (greeting == null) return "The bridge said nothing at " + host + ":" + port;
            writer.println("auth " + BridgeSettings.token());
            String answer = reader.readLine();
            if (!"auth ok".equals(answer)) {
                return answer == null ? "The bridge hung up" : "The bridge refused the token";
            }
            writer.println("uci");
            long deadline = System.currentTimeMillis() + AUTH_TIMEOUT_MS;
            while (System.currentTimeMillis() < deadline) {
                String line = reader.readLine();
                if (line == null) return "The bridge hung up before Stockfish answered";
                if (line.startsWith("uciok")) {
                    writer.println("quit");
                    return null;
                }
            }
            return "Connected, but Stockfish did not answer";
        } catch (IOException e) {
            return "No bridge at " + host + ":" + port + " (" + e.getMessage() + ")";
        } finally {
            try {
                opened.close();
            } catch (IOException ignored) {
                // Already gone.
            }
        }
    }
}
