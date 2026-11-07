package app.noam.extension.chesscom.stockfish;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.nio.charset.StandardCharsets;

/**
 * Times your computer's Stockfish on the four review budgets, over one connection and one engine, the
 * way a review runs it. Starting Stockfish happens once per review (a review reuses the process for
 * every move of the game), so that start is measured on its own and kept out of the search times.
 */
public final class BridgeBenchmark {
    /** Ten moves into a middlegame: the kind of position a review spends its budget on. */
    private static final String FEN =
        "r1bq1rk1/pp2ppbp/2np1np1/8/2BNP3/2N1BP2/PPPQ2PP/R3K2R w KQ - 0 10";
    /** LocalAnalysisFlow's budgets: Fast, Standard, Deep, Maximum, one position each. */
    public static final long[] BUDGETS = {100_000, 300_000, 1_000_000, 5_000_000};
    private static final int CONNECT_TIMEOUT_MS = 5_000;
    private static final int READ_TIMEOUT_MS = 180_000;

    public static final class Report {
        /** Opening the socket, authenticating and starting Stockfish: paid once per review. */
        public final long startupMillis;
        public final int threads, hashMb;
        /** How long each budget took to search, in BUDGETS order. */
        public final long[] millis;

        Report(long startupMillis, int threads, int hashMb, long[] millis) {
            this.startupMillis = startupMillis;
            this.threads = threads;
            this.hashMb = hashMb;
            this.millis = millis;
        }
    }

    private BridgeBenchmark() {}

    /** Runs the benchmark; throws with a message the settings screen can show. Called off the UI thread. */
    public static Report run() throws IOException {
        String host = BridgeSettings.host();
        int port = BridgeSettings.port();
        if (host.isEmpty()) throw new IOException("Set your computer's address first");
        if (BridgeSettings.token().isEmpty()) throw new IOException("Set the bridge token first");

        long[] millis = new long[BUDGETS.length];
        long startup = 0;
        int threads = 0, hash = 0;
        Socket socket = new Socket();
        try {
            long opened = System.currentTimeMillis();
            socket.connect(new InetSocketAddress(host, port), CONNECT_TIMEOUT_MS);
            socket.setSoTimeout(READ_TIMEOUT_MS);
            BufferedReader reader = new BufferedReader(
                new InputStreamReader(socket.getInputStream(), StandardCharsets.UTF_8), 1 << 16);
            PrintWriter writer = new PrintWriter(
                new OutputStreamWriter(socket.getOutputStream(), StandardCharsets.UTF_8), true);

            String greeting = reader.readLine();
            if (greeting == null) throw new IOException("The bridge said nothing at " + host + ":" + port);
            int cores = NetEngine.coresIn(greeting);
            if (cores <= 0) cores = 8;
            writer.println("auth " + BridgeSettings.token());
            if (!"auth ok".equals(reader.readLine())) throw new IOException("The bridge refused the token");

            // The same sizing a review would use, so the numbers mean something.
            threads = BridgeSettings.threads() > 0 ? BridgeSettings.threads() : Math.max(1, Math.min(32, cores));
            hash = BridgeSettings.hashMb() > 0 ? BridgeSettings.hashMb() : Math.max(128, Math.min(1_024, cores * 32));

            writer.println("uci");
            if (!until(reader, "uciok")) throw new IOException("Stockfish did not answer");
            writer.println("setoption name Threads value " + threads);
            writer.println("setoption name Hash value " + hash);
            writer.println("setoption name MultiPV value 1");
            writer.println("isready");
            if (!until(reader, "readyok")) throw new IOException("Stockfish did not get ready");
            startup = System.currentTimeMillis() - opened;

            for (int i = 0; i < BUDGETS.length; i++) {
                writer.println("ucinewgame");
                writer.println("position fen " + FEN);
                long started = System.nanoTime();
                writer.println("go nodes " + BUDGETS[i]);
                if (!until(reader, "bestmove")) throw new IOException("The search did not finish");
                millis[i] = Math.max(1, (System.nanoTime() - started) / 1_000_000L);
            }
            writer.println("quit");
        } finally {
            try {
                socket.close();
            } catch (IOException ignored) {
                // Already gone.
            }
        }
        return new Report(startup, threads, hash, millis);
    }

    /** Reads lines until one starts with the token; the info lines of a search are skipped on the way. */
    private static boolean until(BufferedReader reader, String token) throws IOException {
        String line;
        while ((line = reader.readLine()) != null) {
            if (line.startsWith(token)) return true;
        }
        return false;
    }
}
