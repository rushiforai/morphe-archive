package app.badfella.extension.linkedin;

import android.app.Activity;
import com.sun.net.httpserver.HttpServer;
import java.io.ByteArrayOutputStream;
import java.net.InetSocketAddress;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;

/** Exercises production parsers and the actual asynchronous document-save failure path. */
class LinkedInRegressionCheck {
    static void check(boolean ok, String message) { if (!ok) throw new AssertionError(message); }
    static byte[] varint(long n) {
        var out = new ByteArrayOutputStream();
        while (n > 127) { out.write((int)(n & 127) | 128); n >>>= 7; }
        out.write((int)n); return out.toByteArray();
    }
    static byte[] concat(byte[]... parts) {
        var out = new ByteArrayOutputStream();
        for (var p : parts) out.writeBytes(p);
        return out.toByteArray();
    }
    static byte[] field(int n, byte[] bytes) {
        return concat(varint((n << 3) | 2), varint(bytes.length), bytes);
    }
    static byte[] text(String s) { return s.getBytes(StandardCharsets.UTF_8); }
    static byte[] post(String content) {
        return concat(field(26, concat(field(1, text("feed-commentary")),
                    field(4, text("1oJRCzEhRL+9jybkyTUkyA==")))),
                field(35, concat(varint(8), varint(13158), field(2, field(1, field(1, text(content)))))));
    }
    static void copyText() {
        for (var expected : List.of("First line\nSecond line\twith tab", "Hi", "你好 👋")) {
            check(expected.equals(PostCommentary.text(post(expected))), "Post text lost: " + expected);
        }
        var trackingOnly = field(26, concat(field(1, text("feed-commentary")),
                field(4, text("1oJRCzEhRL+9jybkyTUkyA=="))));
        check(PostCommentary.text(trackingOnly) == null, "Tracking metadata copied as post text");
        check(PostCommentary.text(new byte[]{(byte)0xFF}) == null, "Malformed payload accepted");
        check(PostCommentary.text(null) == null, "Null payload accepted");
        System.out.println("PASS: real post text, multiline/Unicode/short text and metadata rejection");
    }
    static void pdfFailure(int failAt) throws Exception {
        var cache = Files.createTempDirectory("linkedin-pdf-regression");
        var requests = new AtomicInteger();
        var server = HttpServer.create(new InetSocketAddress("127.0.0.1", 0), 0);
        server.createContext("/", exchange -> {
            int code = requests.incrementAndGet() == failAt ? 500 : 200;
            byte[] bytes = {1, 2, 3};
            exchange.sendResponseHeaders(code, bytes.length);
            try (var out = exchange.getResponseBody()) { out.write(bytes); }
        });
        server.start();
        var field = DocumentPdf.class.getDeclaredField("WORKER"); field.setAccessible(true);
        var worker = (ExecutorService)field.get(null);
        try {
            String root = "http://127.0.0.1:" + server.getAddress().getPort() + "/";
            var doc = new DocumentPdf.Doc("synthetic", root, null,
                    List.of(new DocumentPdf.Slice("one", 0, 0), new DocumentPdf.Slice("two", 1, 1)), 2);
            DocumentPdf.save(new Activity(cache.toFile()), doc);
            worker.submit(() -> {}).get(20, TimeUnit.SECONDS);
            check(requests.get() == failAt, "Did not reach expected failed request");
            check(Diagnostics.errors == 1, "Save failure not reported");
            try (var files = Files.list(cache)) {
                check(files.count() == 0, "Temporary PDFs leaked after failed slice " + failAt);
            }
            System.out.println("PASS: actual save failure at slice " + failAt + " leaves no temporary files");
        } finally {
            server.stop(0); worker.shutdownNow();
            try (var files = Files.list(cache)) { for (var file : files.toList()) Files.delete(file); }
            Files.delete(cache);
        }
    }
    public static void main(String[] args) throws Exception {
        if (args[0].equals("copy")) copyText(); else pdfFailure(Integer.parseInt(args[0]));
    }
}
