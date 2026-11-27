package app.jimaku.extension.gateway;

import java.io.BufferedReader;
import java.io.Closeable;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.nio.charset.StandardCharsets;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Deque;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArrayList;

/**
 * A local HTTP server for the gateway tests. It records each request's line and headers as sent,
 * and answers with what the test set for the path.
 */
public final class TestServer implements Closeable {
    public static final class Request {
        public final String line;
        /** Header names in lower case, each with every value sent. */
        public final Map<String, List<String>> headers;
        /** The body as sent, read by its Content-Length, as UTF-8. */
        public final String body;

        Request(String line, Map<String, List<String>> headers, String body) {
            this.line = line;
            this.headers = headers;
            this.body = body;
        }

        public String method() {
            return line.split(" ")[0];
        }

        /** The path with its query. */
        public String path() {
            return line.split(" ")[1];
        }

        public String header(String name) {
            List<String> values = headers.get(name);
            return values == null ? null : values.get(0);
        }
    }

    static final class Answer {
        final int status;
        public final String body;
        final boolean chunked;
        final long delayMillis;

        Answer(int status, String body, boolean chunked, long delayMillis) {
            this.status = status;
            this.body = body;
            this.chunked = chunked;
            this.delayMillis = delayMillis;
        }
    }

    private final ServerSocket server;
    /** Each path's answers in turn; the last one stays. */
    private final Map<String, Deque<Answer>> answers = Collections.synchronizedMap(new LinkedHashMap<>());
    public final List<Request> requests = new CopyOnWriteArrayList<>();

    public TestServer() throws IOException {
        server = new ServerSocket(0, 50, InetAddress.getLoopbackAddress());
        Thread accept = new Thread(this::acceptLoop, "test-server");
        accept.setDaemon(true);
        accept.start();
    }

    public String origin() {
        return "http://127.0.0.1:" + server.getLocalPort();
    }

    /** Answers {@code path}, with or without a query, from now on. */
    public void answer(String path, int status, String body) {
        answers.put(path, new ArrayDeque<>(List.of(new Answer(status, body, false, 0))));
    }

    /** Answers {@code path} first with {@code first}, then with {@code status} and {@code body} from then on. */
    public void answerFirst(String path, int firstStatus, String first, int status, String body) {
        answers.put(path, new ArrayDeque<>(List.of(new Answer(firstStatus, first, false, 0), new Answer(status, body, false, 0))));
    }

    public void answerChunked(String path, int status, String body) {
        answers.put(path, new ArrayDeque<>(List.of(new Answer(status, body, true, 0))));
    }

    public void answerLate(String path, long delayMillis) {
        answerLate(path, delayMillis, 200, "{}");
    }

    public void answerLate(String path, long delayMillis, int status, String body) {
        answers.put(path, new ArrayDeque<>(List.of(new Answer(status, body, false, delayMillis))));
    }

    /** The requests made to {@code path}, with or without a query. */
    public List<Request> requestsTo(String path) {
        List<Request> found = new ArrayList<>();
        for (Request request : requests) if (withoutQuery(request.path()).equals(path)) found.add(request);
        return found;
    }

    private static String withoutQuery(String path) {
        int query = path.indexOf('?');
        return query < 0 ? path : path.substring(0, query);
    }

    private Answer answerFor(String path) {
        synchronized (answers) {
            Deque<Answer> queue = answers.get(path);
            if (queue == null) queue = answers.get(withoutQuery(path));
            if (queue == null) return null;
            return queue.size() > 1 ? queue.poll() : queue.peek();
        }
    }

    private void acceptLoop() {
        while (!server.isClosed()) {
            try {
                Socket socket = server.accept();
                Thread handler = new Thread(() -> handle(socket), "test-server-request");
                handler.setDaemon(true);
                handler.start();
            } catch (IOException e) {
                return;
            }
        }
    }

    private void handle(Socket socket) {
        try (Socket s = socket) {
            BufferedReader in = new BufferedReader(new InputStreamReader(s.getInputStream(), StandardCharsets.ISO_8859_1));
            String line = in.readLine();
            if (line == null) return;
            Map<String, List<String>> headers = new LinkedHashMap<>();
            for (String header = in.readLine(); header != null && !header.isEmpty(); header = in.readLine()) {
                int colon = header.indexOf(':');
                String name = header.substring(0, colon).trim().toLowerCase(Locale.ROOT);
                headers.computeIfAbsent(name, key -> new ArrayList<>()).add(header.substring(colon + 1).trim());
            }
            // Read as ISO-8859-1, one char a byte, so the bytes come back as they were sent.
            List<String> length = headers.get("content-length");
            char[] raw = new char[length == null ? 0 : Integer.parseInt(length.get(0))];
            for (int read = 0; read < raw.length; ) {
                int got = in.read(raw, read, raw.length - read);
                if (got < 0) break;
                read += got;
            }
            String sentBody = new String(new String(raw).getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
            Request request = new Request(line, headers, sentBody);
            requests.add(request);

            Answer answer = answerFor(request.path());
            if (answer == null) answer = new Answer(404, "{\"error\":\"not_found\"}", false, 0);
            if (answer.delayMillis > 0) Thread.sleep(answer.delayMillis);
            byte[] body = answer.body.getBytes(StandardCharsets.UTF_8);
            OutputStream out = s.getOutputStream();
            StringBuilder head = new StringBuilder("HTTP/1.1 " + answer.status + " Test\r\n")
                    .append("Content-Type: application/json; charset=utf-8\r\n")
                    .append("Connection: close\r\n");
            if (answer.chunked) head.append("Transfer-Encoding: chunked\r\n\r\n");
            else head.append("Content-Length: ").append(body.length).append("\r\n\r\n");
            out.write(head.toString().getBytes(StandardCharsets.ISO_8859_1));
            if (answer.chunked) {
                // Two chunks, split inside a multi-byte character, and a chunk extension.
                int half = body.length / 2;
                out.write((Integer.toHexString(half) + ";x=1\r\n").getBytes(StandardCharsets.ISO_8859_1));
                out.write(body, 0, half);
                out.write(("\r\n" + Integer.toHexString(body.length - half) + "\r\n").getBytes(StandardCharsets.ISO_8859_1));
                out.write(body, half, body.length - half);
                out.write("\r\n0\r\n\r\n".getBytes(StandardCharsets.ISO_8859_1));
            } else {
                out.write(body);
            }
            out.flush();
        } catch (IOException | InterruptedException ignored) {
            // The client went away, as a cancelled read does.
        }
    }

    @Override
    public void close() throws IOException {
        server.close();
    }
}
