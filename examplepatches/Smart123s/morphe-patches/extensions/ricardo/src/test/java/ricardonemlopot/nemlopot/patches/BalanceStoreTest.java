package ricardonemlopot.nemlopot.patches;

import com.badlogic.gdx.Application;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.Preferences;
import org.junit.Test;
import ricardonemlopot.nemlopot.rube.RubeLoaderTest;
import static org.junit.Assert.*;

public class BalanceStoreTest {
    @Test public void acceptsZeroCurrentBalanceAndFullIntegerRange() {
        assertEquals(0, BalanceStore.parse("0"));
        assertEquals(1234, BalanceStore.parse(" 1234 "));
        assertEquals(42, BalanceStore.parse("00042"));
        assertEquals(Integer.MAX_VALUE, BalanceStore.parse("2147483647"));
        RubeLoaderTest.points = 751;
        assertEquals(751, BalanceStore.current());
    }

    @Test public void rejectsInvalidNegativeAndOverflowValues() {
        for (String text : new String[]{"", " ", "-1", "+1", "1.5", "1e3", "abc", "2147483648"}) {
            assertThrows(text, NumberFormatException.class, () -> BalanceStore.parse(text));
        }
    }

    @Test public void replacesRatherThanAddsAndFlushesTheRealWallet() {
        Wallet wallet = new Wallet();
        Gdx.app = new Application() {
            public void postRunnable(Runnable runnable) { runnable.run(); }
            public Preferences getPreferences(String name) {
                assertEquals("prefike", name);
                return wallet;
            }
        };
        RubeLoaderTest.points = 500;
        BalanceStore.save(123);
        assertEquals(123, RubeLoaderTest.points);
        assertEquals(123, wallet.balance);
        assertEquals(1, wallet.flushes);
        BalanceStore.save(0);
        assertEquals(0, BalanceStore.current());
        assertEquals(0, wallet.balance);
        BalanceStore.save(Integer.MAX_VALUE);
        assertEquals(Integer.MAX_VALUE, wallet.balance);
        assertEquals(Integer.MAX_VALUE, BalanceStore.current());
        assertThrows(IllegalArgumentException.class, () -> BalanceStore.save(-1));
        assertEquals(3, wallet.flushes);
    }

    private static class Wallet implements Preferences {
        int balance;
        int flushes;
        public void putInteger(String key, int value) {
            assertEquals("pontok", key);
            balance = value;
        }
        public void flush() { flushes++; }
    }
}
