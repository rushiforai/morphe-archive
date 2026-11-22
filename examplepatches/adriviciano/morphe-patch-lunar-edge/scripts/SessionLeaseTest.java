import java.util.concurrent.atomic.AtomicInteger;
import local.lunaredge.cast.SessionLease;

public final class SessionLeaseTest {
    private static void require(boolean ok) { if (!ok) throw new AssertionError(); }
    public static void main(String[] args) throws Exception {
        SessionLease.Registry registry = new SessionLease.Registry();
        AtomicInteger stopped = new AtomicInteger(), released = new AtomicInteger();
        SessionLease old = registry.open(stopped::incrementAndGet, released::incrementAndGet);
        SessionLease next = registry.open(stopped::incrementAndGet, released::incrementAndGet);
        require(stopped.get() == 1 && released.get() == 0 && next.isCurrent());
        old.close(); require(next.isCurrent() && released.get() == 0);
        Thread[] threads = new Thread[12];
        for (int i = 0; i < threads.length; i++) { threads[i] = new Thread(next::stop); threads[i].start(); }
        for (Thread thread : threads) thread.join();
        require(stopped.get() == 2 && released.get() == 1 && !next.isCurrent());
        SessionLease failed = registry.open(() -> { throw new IllegalStateException(); }, released::incrementAndGet);
        try { failed.stop(); } catch (IllegalStateException expected) { }
        require(released.get() == 2 && !failed.isCurrent());
        SessionLease natural = registry.open(stopped::incrementAndGet, released::incrementAndGet);
        natural.close(); natural.stop();
        require(stopped.get() == 2 && released.get() == 3);
        registry.open(() -> { throw new IllegalStateException(); }, released::incrementAndGet);
        SessionLease replacement = registry.open(stopped::incrementAndGet, released::incrementAndGet);
        require(replacement.isCurrent() && released.get() == 3);
        replacement.close(); require(released.get() == 4);
        System.out.println("OK: reemplazo de sesión, cierre tardío, parada concurrente y liberación tras error sin duplicados.");
    }
}
