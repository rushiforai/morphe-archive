import app.morphe.extension.chmate.TcpConnectRace;
import app.morphe.extension.chmate.UpdateConnectPolicy;
import java.io.*;
import java.net.*;
import java.util.*;
import java.util.concurrent.atomic.AtomicBoolean;
import javax.net.SocketFactory;

public final class VerifyTcpConnectRace {
    static int checks;
    static void check(boolean ok, String label) {
        checks++;
        if (!ok) throw new AssertionError(label);
    }
    static class FakeSocket extends Socket {
        volatile boolean closed;
        volatile long started;
        int timeout;
        @Override public void connect(SocketAddress address, int timeout) throws IOException {
            this.timeout = timeout;
            started = System.nanoTime();
            int last = ((InetSocketAddress) address).getAddress().getAddress()[3];
            if (last == 3) throw new ConnectException("fixture failure");
            if (last != 1) {
                while (!closed) try { Thread.sleep(5); }
                catch (InterruptedException e) { throw new InterruptedIOException(); }
                throw new SocketException("fixture closed");
            }
        }
        @Override public void close() { closed = true; }
    }
    static class Factory extends SocketFactory {
        final List<FakeSocket> sockets = Collections.synchronizedList(new ArrayList<>());
        @Override public Socket createSocket() { FakeSocket s = new FakeSocket(); sockets.add(s); return s; }
        @Override public Socket createSocket(String h, int p) { throw new AssertionError(); }
        @Override public Socket createSocket(String h, int p, InetAddress l, int lp) { throw new AssertionError(); }
        @Override public Socket createSocket(InetAddress h, int p) { throw new AssertionError(); }
        @Override public Socket createSocket(InetAddress h, int p, InetAddress l, int lp) { throw new AssertionError(); }
    }
    static InetSocketAddress address(int last) throws Exception {
        return new InetSocketAddress(InetAddress.getByAddress(new byte[]{127,0,0,(byte)last}),16881);
    }
    public static void main(String[] args) throws Exception {
        List<InetSocketAddress> candidates = Arrays.asList(address(2), address(1));
        Factory f = new Factory();
        long start = System.nanoTime();
        TcpConnectRace.Result r = TcpConnectRace.connect(candidates, f, 15000, () -> false);
        long ms = (System.nanoTime() - start) / 1000000;
        check(r.index == 1 && ms >= 40 && ms < 500, "alternate starts near 50ms");
        check(f.sockets.get(0).closed && !f.sockets.get(1).closed, "only winning socket retained");
        check(f.sockets.get(0).timeout == 15000 && f.sockets.get(1).timeout == 15000, "timeouts unchanged");
        r.socket.close();
        f = new Factory();
        r = TcpConnectRace.connect(Arrays.asList(address(1), address(2)), f, 15000, () -> false);
        check(r.index == 0 && f.sockets.size() == 1, "fast first candidate avoids extra connection");
        r.socket.close();
        f = new Factory();
        r = TcpConnectRace.connect(Arrays.asList(address(3), address(1)), f, 15000, () -> false);
        check(r.index == 1 && f.sockets.get(0).closed, "immediate failure falls through");
        r.socket.close();
        f = new Factory();
        try {
            TcpConnectRace.connect(Arrays.asList(address(3), address(3)), f, 15000, () -> false);
            throw new AssertionError("all failed must throw");
        } catch (ConnectException expected) { check(f.sockets.stream().allMatch(s -> s.closed), "failed sockets closed"); }
        f = new Factory();
        final long cancelAt = System.nanoTime() + 80000000;
        try {
            TcpConnectRace.connect(Arrays.asList(address(2),address(4)), f, 15000, () -> System.nanoTime() >= cancelAt);
            throw new AssertionError("cancel must throw");
        } catch (InterruptedIOException expected) { check(f.sockets.stream().allMatch(s -> s.closed), "cancel closes active sockets"); }
        check(TcpConnectRace.connect(Collections.singletonList(address(1)), new Factory(), 15000, () -> false) == null,
                "single route stays native");
        for (String u : new String[]{"https://a.invalid/b/subject.txt", "https://a.invalid/b/dat/123.dat",
                "https://a.invalid/test/read.cgi/b/123/"})
            check(UpdateConnectPolicy.isThreadResource("GET", u), "thread GET eligible");
        for (String u : new String[]{"https://a.invalid/x.jpg", "https://a.invalid/x.mp4", "file:///b/subject.txt", "invalid", null})
            check(!UpdateConnectPolicy.isThreadResource("GET", u), "non-thread excluded");
        check(!UpdateConnectPolicy.isThreadResource("POST", "https://a.invalid/b/subject.txt"), "posting excluded");
        final Factory busy = new Factory();
        final AtomicBoolean stop = new AtomicBoolean();
        final List<InetSocketAddress> blocked = Arrays.asList(address(2), address(4));
        List<Thread> callers = new ArrayList<>();
        for (int i = 0; i < 4; i++) {
            Thread caller = new Thread(() -> {
                try { TcpConnectRace.connect(blocked, busy, 15000, stop::get); }
                catch (IOException expected) { }
            });
            callers.add(caller); caller.start();
        }
        long until = System.nanoTime() + 3000000000L;
        while (busy.sockets.size() < 8 && System.nanoTime() < until) Thread.sleep(10);
        check(busy.sockets.size() == 8, "global socket budget filled");
        check(TcpConnectRace.connect(candidates, new Factory(), 15000, () -> false) == null,
                "busy worker budget returns to native I/O");
        stop.set(true);
        for (Thread caller : callers) caller.join(2000);
        check(callers.stream().noneMatch(Thread::isAlive) && busy.sockets.stream().allMatch(s -> s.closed),
                "concurrent cancellation releases all sockets");
        System.out.println("PASSED " + checks + " TCP race/scope checks; measured fallback " + ms + "ms");
    }
}
