package e.e.a;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InterruptedIOException;
import java.lang.management.ManagementFactory;
import java.lang.management.ThreadInfo;
import java.lang.management.ThreadMXBean;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.FutureTask;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;

/** Uses local connection doubles and checks wakeups for unrelated requests. */
public final class PageCacheContentionTest {
    private static final ThreadMXBean THREADS = ManagementFactory.getThreadMXBean();
    private static final byte[] RESPONSE = "<meta name=\"server-response\" content=\"{}\">"
            .getBytes(StandardCharsets.UTF_8);

    private static final class Connection extends HttpURLConnection {
        final CountDownLatch entered = new CountDownLatch(1);
        final CountDownLatch completion = new CountDownLatch(1);
        final AtomicInteger reads;
        volatile boolean disconnected;

        Connection(String url, AtomicInteger reads) throws Exception {
            super(new URL(url));
            this.reads = reads;
        }

        @Override public InputStream getInputStream() throws IOException {
            reads.incrementAndGet();
            entered.countDown();
            try {
                if (!completion.await(10, TimeUnit.SECONDS)) throw new IOException("test timed out");
            } catch (InterruptedException ex) {
                Thread.currentThread().interrupt();
                throw new InterruptedIOException("test interrupted");
            }
            return new ByteArrayInputStream(RESPONSE);
        }

        @Override public void connect() {}
        @Override public boolean usingProxy() { return false; }
        @Override public void disconnect() { disconnected = true; }
    }

    private static final class Request {
        final FutureTask<byte[]> response;
        final Thread thread;

        Request(Connection connection) {
            response = new FutureTask<>(() -> {
                try (InputStream input = PageCache.input(connection)) {
                    return input.readAllBytes();
                }
            });
            thread = new Thread(response);
            thread.setDaemon(true);
            thread.start();
        }

        void verify() throws Exception {
            if (!java.util.Arrays.equals(RESPONSE, response.get(5, TimeUnit.SECONDS))) {
                throw new AssertionError("invalid response");
            }
        }
    }

    private static ThreadInfo parked(Thread thread) throws InterruptedException {
        long deadline = System.nanoTime() + TimeUnit.SECONDS.toNanos(5);
        do {
            ThreadInfo info = THREADS.getThreadInfo(thread.getId());
            if (info != null && info.getThreadState() == Thread.State.TIMED_WAITING) return info;
            Thread.sleep(1);
        } while (System.nanoTime() < deadline);
        throw new AssertionError("follower did not park");
    }

    public static void main(String[] args) throws Exception {
        PageCache.refresh();
        int keys = 8;
        Connection[] servers = new Connection[keys];
        Request[] leaders = new Request[keys], followers = new Request[keys];
        long[] waits = new long[keys];
        for (int i = 0; i < keys; i++) {
            String url = "https://example.invalid/search/" + i;
            AtomicInteger reads = new AtomicInteger();
            servers[i] = new Connection(url, reads);
            leaders[i] = new Request(servers[i]);
            if (!servers[i].entered.await(5, TimeUnit.SECONDS)) throw new AssertionError("leader did not enter");
            followers[i] = new Request(new Connection(url, reads));
            waits[i] = parked(followers[i].thread).getWaitedCount();
        }
        long unrelatedWakeups = 0;
        for (int i = 0; i < keys; i++) {
            servers[i].completion.countDown();
            leaders[i].verify();
            followers[i].verify();
            if (servers[i].reads.get() != 1 || !servers[i].disconnected) throw new AssertionError("duplicate fetch or leaked request");
            Thread.sleep(30);
            for (int next = i + 1; next < keys; next++) {
                long observed = parked(followers[next].thread).getWaitedCount();
                unrelatedWakeups += observed - waits[next];
                waits[next] = observed;
            }
        }
        System.out.println("8 URL groups / 16 clients, 8 opens, extra follower waits: " + unrelatedWakeups);
        if (args.length > 0 && unrelatedWakeups != 0) throw new AssertionError("unexpected wakeups");
    }
}
