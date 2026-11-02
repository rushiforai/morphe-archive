package app.hushmessenger.extension;

import android.content.Context;
import android.os.Looper;
import java.io.File;
import java.io.IOException;
import java.time.Duration;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowToast;
import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class LocalPinsTest {
    public static final class Key {
        final String id;

        public Key(String id) {
            this.id = id;
        }

        @Override public String toString() {
            return id;
        }
    }

    /** A chat row's hash reads the pinned flag in Messenger, which is why LocalPins may only compare rows by identity. */
    public static final class Summary {
        public Key key;
        public boolean flag;
        public boolean other;

        public Summary(String id) {
            key = new Key(id);
        }

        @Override public boolean equals(Object o) {
            return o instanceof Summary && ((Summary) o).key.id.equals(key.id) && ((Summary) o).flag == flag;
        }

        @Override public int hashCode() {
            return key.id.hashCode() + (flag ? 1 : 0);
        }

        @Override public String toString() {
            return key.id;
        }
    }

    /** An item in Messenger's list that isn't a chat, like a section header. */
    public static final class Header {
    }

    public static final class Rows extends ArrayList<Object> {
        public static Rows copyOf(Collection<?> rows) {
            Rows copy = new Rows();
            copy.addAll(rows);
            return copy;
        }
    }

    public static final class Supplier {
        public Rows list;
        public int count;
        int subscribed;

        Supplier(Object... rows) {
            list = Rows.copyOf(Arrays.asList(rows));
        }

        private static void subscribe(Supplier supplier, boolean retry) {
            assertTrue(retry);
            supplier.subscribed++;
        }
    }

    private static final String SUMMARY = "Lapp/hushmessenger/extension/LocalPinsTest$Summary;";
    private static final String SUPPLIER = "Lapp/hushmessenger/extension/LocalPinsTest$Supplier;";
    private static final String ROUTE = SUMMARY + "->key:Lapp/hushmessenger/extension/LocalPinsTest$Key;|" + SUMMARY + "->flag:Z|" + SUMMARY + "->other:Z|"
        + SUPPLIER + "->list:Lapp/hushmessenger/extension/LocalPinsTest$Rows;|" + SUPPLIER + "->subscribe(" + SUPPLIER + "Z)V|" + SUPPLIER + "->count:I";

    private Context context;

    @Before public void reset() throws Exception {
        context = RuntimeEnvironment.getApplication();
        Settings.initialize(context);
        Settings.preferences.edit().clear().putBoolean(LocalPins.KEY, true).commit();
        Settings.activeAt.clear();
        CrashGuard.resetForTests();
        ShadowToast.reset();
        LocalPins.resetForTests();
        File folder = context.getDatabasePath(LocalPins.KEY).getParentFile();
        folder.mkdirs();
        for (File old : folder.listFiles()) old.delete();
        account("100");
        LocalPins.route = LocalPins.Route.of(ROUTE, LocalPinsTest.class.getClassLoader());
    }

    private void account(String id) throws IOException {
        assertTrue(new File(context.getDatabasePath(LocalPins.KEY).getParentFile(), "msys_database_" + id).createNewFile());
    }

    private static void idle() {
        shadowOf(Looper.getMainLooper()).idle();
    }

    private static List<String> order(Supplier supplier) {
        List<String> names = new ArrayList<>();
        for (Object row : supplier.list) names.add(row.toString());
        return names;
    }

    /** Messenger's next process: nothing kept in memory, the saved pins still in its preferences. */
    private void restart() throws Exception {
        LocalPins.resetForTests();
        LocalPins.route = LocalPins.Route.of(ROUTE, LocalPinsTest.class.getClassLoader());
    }

    @Test public void aPinPastTheAccountsLimitStaysHereAndSitsUnderItsServerPins() {
        Summary server = new Summary("server");
        server.other = true;
        Summary first = new Summary("first");
        Summary second = new Summary("second");
        Summary plain = new Summary("plain");
        Header header = new Header();
        Supplier supplier = new Supplier(server, header, plain, second, first);

        assertTrue("Messenger's count said the account is full", LocalPins.pinFull(second.key));
        assertTrue(LocalPins.pinFull(first.key));
        LocalPins.arrange(supplier);

        assertTrue(first.flag);
        assertTrue(second.flag);
        assertFalse(plain.flag);
        assertEquals("Pinned order, not list order, and nothing dropped",
            Arrays.asList("server", "second", "first", header.toString(), "plain"), order(supplier));
        assertTrue(Settings.lastActive(LocalPins.KEY) > 0);
    }

    @Test public void keepingAPinRunsTheListsOwnSubscribeAndSaysSo() {
        Summary chat = new Summary("chat");
        Supplier supplier = new Supplier(new Summary("plain"), chat);
        LocalPins.arrange(supplier);

        assertTrue(LocalPins.pinFull(chat.key));
        idle();
        assertEquals(1, supplier.subscribed);
        assertEquals(new SettingsText(context).get("local_pin_kept"), ShadowToast.getTextOfLatestToast());

        LocalPins.arrange(supplier);
        assertTrue(LocalPins.unpinning(chat.key));
        idle();
        assertEquals(2, supplier.subscribed);
        assertEquals(new SettingsText(context).get("local_pin_removed"), ShadowToast.getTextOfLatestToast());
    }

    @Test public void anUnchangedListIsLeftAloneSoRepeatedReadsDontChurnIt() {
        Summary chat = new Summary("chat");
        Supplier supplier = new Supplier(chat, new Summary("plain"));
        assertTrue(LocalPins.pinFull(chat.key));
        Rows before = supplier.list;
        LocalPins.arrange(supplier);
        assertSame(before, supplier.list);
        assertTrue(chat.flag);
    }

    @Test public void theFirstListWithASavedPinReloadsOnceSoMessengersOwnPinsGetTheirFlags() throws Exception {
        assertTrue(LocalPins.pinFull(new Key("chat")));
        restart();
        Summary chat = new Summary("chat");
        Supplier empty = new Supplier();
        LocalPins.arrange(empty);
        Supplier other = new Supplier(new Summary("plain"));
        LocalPins.arrange(other);
        Supplier supplier = new Supplier(new Summary("plain"), chat);
        LocalPins.arrange(supplier);
        LocalPins.arrange(supplier);
        assertEquals("Not before it had a chance to load", 0, supplier.subscribed);
        shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(3));
        assertEquals(1, supplier.subscribed);
        assertEquals("No saved pin on these lists", 0, empty.subscribed + other.subscribed);
        LocalPins.arrange(supplier);
        shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(3));
        assertEquals("Reads that follow don't start it again", 1, supplier.subscribed);
    }

    @Test public void pinsComeBackAfterARestartInTheSameOrder() throws Exception {
        Summary a = new Summary("a");
        Summary b = new Summary("b");
        assertTrue(LocalPins.pinFull(b.key));
        assertTrue(LocalPins.pinFull(a.key));
        restart();

        Summary againA = new Summary("a");
        Summary againB = new Summary("b");
        Supplier supplier = new Supplier(new Summary("plain"), againA, againB);
        LocalPins.arrange(supplier);
        assertEquals(Arrays.asList("b", "a", "plain"), order(supplier));
        assertTrue(againA.flag && againB.flag);
    }

    @Test public void aNewlyLoadedRowForTheSameChatGetsMarkedToo() {
        Summary chat = new Summary("chat");
        assertTrue(LocalPins.pinFull(chat.key));
        LocalPins.arrange(new Supplier(new Summary("plain"), chat));

        Summary fresh = new Summary("chat");
        Supplier supplier = new Supplier(new Summary("plain"), fresh);
        LocalPins.arrange(supplier);
        assertTrue("A list update builds new rows", fresh.flag);
        assertEquals(Arrays.asList("chat", "plain"), order(supplier));
    }

    @Test public void unpinningTakesItOffTheRowAndOutOfTheSavedPins() throws Exception {
        Summary chat = new Summary("chat");
        Supplier supplier = new Supplier(new Summary("plain"), chat);
        assertFalse("Nothing to unpin yet", LocalPins.unpinRow(false, chat));
        assertTrue(LocalPins.pinFull(chat.key));
        LocalPins.arrange(supplier);

        assertTrue(LocalPins.unpinRow(false, chat));
        assertFalse("The Pin row steps aside for it", LocalPins.pinRow(true, chat));

        assertTrue(LocalPins.unpinning(chat.key));
        LocalPins.arrange(supplier);
        assertFalse(chat.flag);
        assertFalse(LocalPins.unpinRow(false, chat));

        restart();
        assertFalse("It stays gone", LocalPins.unpinning(chat.key));
        Summary again = new Summary("chat");
        LocalPins.arrange(new Supplier(again));
        assertFalse(again.flag);
    }

    @Test public void aServerPinsUnpinStillGoesToTheServer() {
        assertFalse(LocalPins.unpinning(new Key("server")));
        Summary server = new Summary("server");
        server.flag = true;
        assertTrue("Messenger's own Unpin row stays", LocalPins.unpinRow(true, server));
    }

    @Test public void thePinRowComesBackOnChatsMessengerRefusesAndThatPinStaysHere() {
        Summary refused = new Summary("refused");
        assertTrue(LocalPins.pinRow(false, refused));
        assertTrue("The server can't take this one, so the pin call stops here", LocalPins.pinning(refused.key));
        assertFalse("Only once", LocalPins.pinning(refused.key));
        Supplier supplier = new Supplier(new Summary("plain"), refused);
        LocalPins.arrange(supplier);
        assertTrue(refused.flag);
        assertEquals(Arrays.asList("refused", "plain"), order(supplier));
    }

    @Test public void aChatMessengerOffersPinForStillGoesToTheServerUntilFull() {
        Summary chat = new Summary("chat");
        assertTrue(LocalPins.pinRow(true, chat));
        assertFalse("Messenger's own pin keeps going", LocalPins.pinning(chat.key));
        assertTrue("Unless its count says full", LocalPins.pinFull(chat.key));
    }

    @Test public void anAlreadyPinnedChatNeverGetsAPinRow() {
        Summary server = new Summary("server");
        server.flag = true;
        assertFalse(LocalPins.pinRow(false, server));
        server.flag = false;
        server.other = true;
        assertFalse(LocalPins.pinRow(false, server));
        assertFalse("Messenger offered no row and none was promised", LocalPins.pinning(server.key));
    }

    @Test public void offPauseSafeModeAndAMissingControlBringStockBackAndKeepThePins() throws Exception {
        for (String state : new String[] {"off", "paused", "safe", "missing"}) {
            reset();
            Set<String> installed = Settings.installed;
            Summary chat = new Summary("chat");
            Supplier supplier = new Supplier(new Summary("plain"), chat);
            assertTrue(state, LocalPins.pinFull(chat.key));
            LocalPins.arrange(supplier);
            assertTrue(state, chat.flag);
            idle();
            int subscribes = supplier.subscribed;

            Settings.preferences.edit().putBoolean(LocalPins.KEY, !state.equals("off"))
                .putBoolean("paused", state.equals("paused")).putBoolean("safe_mode", state.equals("safe")).commit();
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(context);
            if (state.equals("missing")) Settings.installed = Collections.emptySet();

            Summary fresh = new Summary("chat");
            Supplier stock = new Supplier(new Summary("plain"), fresh);
            LocalPins.arrange(stock);
            LocalPins.arrange(supplier);
            assertFalse(state + " takes the mark back off", chat.flag);
            assertFalse(state, fresh.flag);
            assertEquals(state + " keeps Messenger's order", Arrays.asList("plain", "chat"), order(stock));

            assertFalse(state, LocalPins.pinRow(false, chat));
            assertTrue(state, LocalPins.pinRow(true, chat));
            assertFalse(state, LocalPins.unpinRow(false, chat));
            assertTrue(state, LocalPins.unpinRow(true, chat));
            assertFalse(state + " lets the can't pin dialog show", LocalPins.pinFull(new Key("another")));
            assertFalse(state, LocalPins.pinning(new Key("another")));
            assertFalse(state, LocalPins.unpinning(chat.key));
            idle();
            assertEquals(state, subscribes, supplier.subscribed);

            Settings.installed = installed;
            Settings.preferences.edit().putBoolean(LocalPins.KEY, true).putBoolean("paused", false).putBoolean("safe_mode", false).commit();
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(context);
            restart();
            Summary back = new Summary("chat");
            Supplier later = new Supplier(new Summary("plain"), back);
            LocalPins.arrange(later);
            assertTrue(state + " kept the pin for later", back.flag);
            assertEquals(state, Arrays.asList("chat", "plain"), order(later));
        }
    }

    @Test public void eachAccountKeepsItsOwnPins() throws Exception {
        assertTrue(LocalPins.pinFull(new Key("mine")));
        File folder = context.getDatabasePath(LocalPins.KEY).getParentFile();
        assertTrue(new File(folder, "msys_database_100").delete());
        account("200");
        restart();

        Summary mine = new Summary("mine");
        LocalPins.arrange(new Supplier(mine));
        assertFalse(mine.flag);
    }

    @Test public void withNoAccountToSaveUnderThePinIsLeftToMessenger() throws Exception {
        File folder = context.getDatabasePath(LocalPins.KEY).getParentFile();
        assertTrue(new File(folder, "msys_database_100").delete());
        restart();
        assertFalse("The can't pin dialog tells them, rather than a pin that disappears", LocalPins.pinFull(new Key("chat")));
    }

    @Test public void aBuildWithNoRouteStaysStock() {
        LocalPins.route = null;
        Summary chat = new Summary("chat");
        Supplier supplier = new Supplier(new Summary("plain"), chat);
        assertFalse(LocalPins.pinFull(chat.key));
        assertFalse(LocalPins.pinning(chat.key));
        assertFalse(LocalPins.unpinning(chat.key));
        assertFalse(LocalPins.pinRow(false, chat));
        assertTrue(LocalPins.pinRow(true, chat));
        assertFalse(LocalPins.unpinRow(false, chat));
        LocalPins.arrange(supplier);
        assertEquals(Arrays.asList("plain", "chat"), order(supplier));
    }

    @Test public void aRowThatIsntAChatKeepsMessengersAnswer() {
        assertTrue(LocalPins.pinRow(true, new Header()));
        assertFalse(LocalPins.pinRow(false, new Header()));
        assertFalse(LocalPins.unpinRow(false, null));
    }
}
