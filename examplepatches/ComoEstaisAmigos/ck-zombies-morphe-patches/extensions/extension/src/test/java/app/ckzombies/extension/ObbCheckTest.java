package app.ckzombies.extension;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.content.Context;
import android.content.ContextWrapper;
import android.graphics.Rect;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;

import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.util.Vector;

public class ObbCheckTest {

    private static final String PKG = "com.glu.android.zombsniper";
    /** Stands in for 460,914,023 so the tests write small files. */
    private static final int SIZE = 4096;

    @Rule
    public TemporaryFolder tmp = new TemporaryFolder();

    private File storage;
    private File obbDir;
    private Context context;

    @Before
    public void setUp() throws IOException {
        ObbCheck.reset();
        storage = tmp.newFolder("storage");
        obbDir = new File(storage, "Android/obb/" + PKG);
        final File internal = tmp.newFolder("internal");
        context = new ContextWrapper(null) {
            @Override
            public String getPackageName() {
                return PKG;
            }

            @Override
            public File getDir(String name, int mode) {
                File dir = new File(internal, "app_" + name);
                dir.mkdirs();
                return dir;
            }
        };
    }

    @After
    public void tearDown() {
        ObbCheck.reset();
    }

    private File file(File dir, String name, long size) throws IOException {
        dir.mkdirs();
        File f = new File(dir, name);
        try (RandomAccessFile raf = new RandomAccessFile(f, "rw")) {
            raf.setLength(size);
        }
        return f;
    }

    // decide / explains

    @Test
    public void statesThatDoNotLeadToADownloadPassThrough() {
        for (int state : new int[] {-1, 0, 1, 3, 8, ObbCheck.STATE_ERROR, 0x11, 0x12, 0x64}) {
            assertEquals(state, ObbCheck.decide(state));
        }
    }

    @Test
    public void everyWayToADownloadEndsOnTheErrorPage() {
        for (int state : new int[] {2, 4, 5, 6, 7, 10}) {
            assertEquals(ObbCheck.STATE_ERROR, ObbCheck.decide(state));
            assertTrue(ObbCheck.explains(state, true));
            assertTrue(ObbCheck.explains(state, false));
        }
    }

    @Test
    public void theGamesOwnErrorPageKeepsItsTextUnlessTheObbIsMissing() {
        assertFalse(ObbCheck.explains(ObbCheck.STATE_ERROR, true));
        assertTrue(ObbCheck.explains(ObbCheck.STATE_ERROR, false));
        assertFalse(ObbCheck.explains(1, false));
    }

    // match

    @Test
    public void theObbFolderTakesAnyNameAndOthersOnlyGpkOrObb() throws IOException {
        File odd = file(obbDir, "com.glu.android.zombsniper", SIZE);
        assertSame(odd, ObbCheck.match(new File[] {odd}, SIZE, true));
        assertNull(ObbCheck.match(new File[] {odd}, SIZE, false));

        File gpk = file(tmp.newFolder("data"), "x.gpk", SIZE);
        assertSame(gpk, ObbCheck.match(new File[] {gpk}, SIZE, false));
    }

    @Test
    public void onlyTheExactSizeMatches() throws IOException {
        File small = file(obbDir, "main.310.com.glu.android.zombsniper.obb", SIZE - 1);
        File sub = new File(obbDir, "com.glu.android.zombsniper");
        sub.mkdirs();
        assertNull(ObbCheck.match(new File[] {small, sub}, SIZE, true));
        assertNull("an unreadable folder has no entries", ObbCheck.match(null, SIZE, true));
    }

    // describe

    @Test
    public void theMessageSaysWhereAndHowBig() {
        String text = ObbCheck.describe("Android/obb/" + PKG + "/", false, null, 460_914_023L);
        assertTrue(text, text.contains("\nAndroid/obb/com.glu.android.zombsniper/\n"));
        assertTrue(text, text.contains("exactly 460,914,023 bytes."));
        assertTrue(text, text.contains("That folder does not exist."));
        assertTrue(text, text.endsWith("Then open the game again."));
    }

    @Test
    public void theMessageTellsAnUnreadableFolderFromAnEmptyOne() {
        assertTrue(ObbCheck.describe("f/", true, null, SIZE)
                .contains("That folder exists, but Android does not let the game read it."));
        assertTrue(ObbCheck.describe("f/", true, new File[0], SIZE).contains("That folder is empty."));
    }

    @Test
    public void theMessageListsWhatIsThere() throws IOException {
        File small = file(obbDir, "a.obb", 1234);
        File sub = new File(obbDir, "com.glu.android.zombsniper");
        sub.mkdirs();
        String text = ObbCheck.describe("f/", true, new File[] {small, sub}, SIZE);
        assertTrue(text, text.contains("That folder has:\na.obb (1,234 bytes)\ncom.glu.android.zombsniper (folder)\n"));
    }

    @Test
    public void aLongListIsCut() throws IOException {
        File[] entries = new File[ObbCheck.LISTED + 3];
        for (int i = 0; i < entries.length; i++) {
            entries[i] = file(obbDir, "f" + i, i);
        }
        String text = ObbCheck.describe("f/", true, entries, SIZE);
        assertTrue(text, text.contains("\nf3 (3 bytes)\nand 3 more\n"));
        assertFalse(text, text.contains("f4 ("));
    }

    // route, end to end over a folder tree

    @Test
    public void withoutTheObbTheDownloadTurnsIntoTheMessageOnce() {
        assertEquals(ObbCheck.STATE_ERROR, ObbCheck.route(context, 2, SIZE, storage));
        String message = ObbCheck.takeMessage();
        assertTrue(message, message.contains("That folder does not exist."));
        assertNull("taken once", ObbCheck.takeMessage());
    }

    @Test
    public void aWrongFileIsListedWithItsSize() throws IOException {
        file(obbDir, "com.glu.android.zombsniper.obb", SIZE - 10);
        assertEquals(ObbCheck.STATE_ERROR, ObbCheck.route(context, 4, SIZE, storage));
        assertTrue(ObbCheck.takeMessage().contains("com.glu.android.zombsniper.obb (4,086 bytes)"));
    }

    @Test
    public void aDownloadNeverStartsEvenWhenAMatchingFileIsThere() throws IOException {
        // The game's own check ran first and did not take it; the page shows what is there.
        file(obbDir, "x.obb", SIZE);
        assertEquals(ObbCheck.STATE_ERROR, ObbCheck.route(context, 6, SIZE, storage));
        assertTrue(ObbCheck.takeMessage().contains("x.obb (4,096 bytes)"));
    }

    @Test
    public void theGamesOwnErrorPageWithTheObbPresentIsLeftAlone() throws IOException {
        file(new File(storage, "Android/data/" + PKG + "/files"), "res.gpk", SIZE);
        assertEquals(ObbCheck.STATE_ERROR, ObbCheck.route(context, ObbCheck.STATE_ERROR, SIZE, storage));
        assertNull(ObbCheck.takeMessage());
    }

    @Test
    public void otherStatesAndMissingInputsAreLeftAlone() {
        assertEquals(0x11, ObbCheck.route(context, 0x11, SIZE, storage));
        assertEquals(1, ObbCheck.route(context, 1, SIZE, storage));
        assertEquals(2, ObbCheck.route(null, 2, SIZE, storage));
        assertEquals(2, ObbCheck.route(context, 2, 0, storage));
        assertEquals(2, ObbCheck.route(context, 2, SIZE, null));
        assertNull(ObbCheck.takeMessage());
    }

    // exitOnly, on stand-ins with the public fields Glu's classes have

    public static class Widget {
        public int m_widgetID;
        public int m_x;
        public int m_y;
        public int m_dx;
        public int m_dy;
    }

    public static class Button extends Widget {
        public Rect m_rectBounds = new Rect();
        /** Height 135, as GluButton on a 720 high screen; like Glu's, it ignores the height asked for. */
        public void setBounds(int x, int y, int w, int h) {
            m_x = x;
            m_y = y;
            m_dx = x + w - 1;
            m_dy = y + 135 - 1;
            m_rectBounds.left = m_x;
            m_rectBounds.top = m_y;
            m_rectBounds.right = m_dx;
            m_rectBounds.bottom = m_dy;
        }
    }

    public static class View {
        public Vector<Widget> m_widgets = new Vector<>();
        public int m_screenWidth = 1600;
    }

    private static Button button(int id, int x, int width) {
        Button b = new Button();
        b.m_widgetID = id;
        b.setBounds(x, 508, width, 0);
        return b;
    }

    @Test
    public void exitOnlyDropsRetryAndLeavesASmallerExitInTheMiddle() {
        View view = new View();
        Widget text = new Widget();
        Button retry = button(ObbCheck.RETRY_BUTTON, 55, 718);
        Button exit = button(ObbCheck.EXIT_BUTTON, 793, 718);
        view.m_widgets.add(text);
        view.m_widgets.add(retry);
        view.m_widgets.add(exit);

        ObbCheck.exitOnly(view);

        assertEquals(2, view.m_widgets.size());
        assertSame(text, view.m_widgets.get(0));
        assertSame(exit, view.m_widgets.get(1));
        assertEquals("a third of the screen, centred", 533, exit.m_x);
        assertEquals(533 + 533 - 1, exit.m_dx);
        assertEquals("two thirds of 135, centred in the row", 508 + 22, exit.m_y);
        assertEquals(508 + 22 + 90 - 1, exit.m_dy);
        assertEquals(exit.m_y, exit.m_rectBounds.top);
        assertEquals(exit.m_dy, exit.m_rectBounds.bottom);
    }

    @Test
    public void exitOnlyLeavesAPageWithoutBothButtonsAlone() {
        View view = new View();
        Button exit = button(ObbCheck.EXIT_BUTTON, 793, 718);
        view.m_widgets.add(exit);
        ObbCheck.exitOnly(view);
        assertEquals(793, exit.m_x);
        ObbCheck.exitOnly(new Object()); // no m_widgets at all: nothing happens, nothing throws
    }

    @Test
    public void shortenKeepsTheMiddle() {
        assertArrayEquals(new int[] {530, 619}, ObbCheck.shorten(508, 642));
    }
}
