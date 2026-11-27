package app.hushmessenger.extension;

import android.app.Application;
import android.graphics.Rect;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

/**
 * The long-press menu's floating card (#176). The tree and every number in it are the Samsung S22's own, read off
 * Messenger 587 with the menu open on a message of my own: the emoji row at 112,196 to 969,374, the message under it at
 * 381,365 to 1057,466, and Reply, Copy, Delete and More in a bar across the bottom from 0,1959 to 1080,2274.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36}, qualifiers = "w360dp-h800dp-mdpi")
public class FloatingMenuTest {
    private final Map<View, Rect> screen = new HashMap<>();
    private Application app;
    private float density;
    private FrameLayout frame, overlay, host;
    private ViewGroup panel, actions;
    private final List<Button> pressed = new ArrayList<>();

    @Before public void chat() {
        app = RuntimeEnvironment.getApplication();
        Settings.initialize(app);
        Settings.preferences.edit().clear().commit();
        FloatingMenu.resetForTests();
        FloatingMenu.bounds = view -> screen.containsKey(view) ? new Rect(screen.get(view)) : new Rect();
        ChatDialogs.blur = context -> false;
        density = app.getResources().getDisplayMetrics().density;

        frame = at(new FrameLayout(app), 0, 75, 1080, 2274);
        overlay = at(new FrameLayout(app), 0, 75, 1080, 2274);
        frame.addView(overlay);
        View scrim = at(new View(app), 0, 75, 1080, 2274);
        scrim.setClickable(true);
        overlay.addView(scrim);

        panel = at(new FrameLayout(app), 112, 196, 969, 374);
        FrameLayout reactions = at(new FrameLayout(app), 128, 204, 953, 350);
        reactions.setClickable(true);
        panel.addView(reactions);
        // The emoji buttons take no tap of their own on this build; the row around them does.
        String[] faces = {"❤", "😆", "😮", "😢", "😠", "👍"};
        for (int i = 0; i < faces.length; i++) {
            Button face = at(new Button(app), 162 + i * 112, 232, 252 + i * 112, 322);
            face.setText(faces[i]);
            face.setClickable(false);
            reactions.addView(face);
        }
        overlay.addView(panel);

        actions = at(new LinearLayout(app), 0, 1959, 1080, 2274);
        String[] labels = {"Reply", "Copy", "Delete", "More"};
        for (int i = 0; i < labels.length; i++) {
            Button action = at(new Button(app), i * 270, 1959, (i + 1) * 270, 2274);
            action.setText(labels[i]);
            action.setClickable(true);
            action.setOnClickListener(view -> pressed.add((Button) view));
            actions.addView(action);
        }
        overlay.addView(actions);

        host = at(new FrameLayout(app), 0, 75, 1080, 2274);
        host.addView(bubble(381, 365, 1057, 466));
        host.addView(bubble(100, 700, 700, 801));
    }

    @After public void close() {
        FloatingMenu.resetForTests();
        ChatDialogs.blur = ChatDialogs::defaultBlur;
        MaterialYouTheme.forgetDarkModeAnswer();
    }

    private View bubble(int left, int top, int right, int bottom) {
        View bubble = at(new View(app), left, top, right, bottom);
        bubble.setLongClickable(true);
        return bubble;
    }

    private <T extends View> T at(T view, int left, int top, int right, int bottom) {
        screen.put(view, new Rect(left, top, right, bottom));
        view.layout(0, 0, right - left, bottom - top);
        return view;
    }

    private LinearLayout card() {
        for (int i = 0; i < frame.getChildCount(); i++) {
            if (frame.getChildAt(i) instanceof LinearLayout) return (LinearLayout) frame.getChildAt(i);
        }
        return null;
    }

    /** A switch left out of SUB_SWITCHES is written to no backup and comes back off on the next phone. */
    @Test public void theFloatingMenuSwitchIsBackedUpUnderBlurBehindMenus() {
        assertEquals(MenuBlur.KEY, Settings.SUB_SWITCHES.get(FloatingMenu.KEY));
    }

    @Test public void theActionsLeaveTheBottomOfTheScreenForACardUnderTheMessage() {
        FloatingMenu.dress(overlay, host);

        LinearLayout card = card();
        assertNotNull(card);
        assertEquals(View.GONE, actions.getVisibility());
        assertEquals(4, card.getChildCount());
        String[] expected = {"Reply", "Copy", "Delete", "More"};
        for (int i = 0; i < expected.length; i++) {
            assertEquals(expected[i], ((TextView) card.getChildAt(i)).getText().toString());
            assertEquals("#191: listed in Invisible buttons by its words", expected[i], InvisibleButtons.nameOf(card.getChildAt(i)));
        }
        FrameLayout.LayoutParams params = (FrameLayout.LayoutParams) card.getLayoutParams();
        // Under the message, lined up with its right edge, since that message is on the right.
        assertEquals((int) (466 + FloatingMenu.GAP_DP * density) - 75, params.topMargin);
        assertEquals(1057 - (int) (FloatingMenu.WIDTH_DP * density), params.leftMargin);
        assertEquals(FloatingMenu.height(4, density), params.height);
    }

    @Test public void aTapOnARowIsThePressMessengersOwnButtonWouldHaveGot() {
        FloatingMenu.dress(overlay, host);

        card().getChildAt(2).performClick();

        assertEquals(1, pressed.size());
        assertEquals("Delete", pressed.get(0).getText().toString());
    }

    @Test public void theEmojiRowIsNeverTakenForTheBarOfActions() {
        assertSame(actions, FloatingMenu.actionBar(overlay));
        assertSame(panel, FloatingMenu.emojiRow(overlay, actions, new Rect(0, 75, 1080, 2274)));
    }

    @Test public void theMessageUnderTheEmojiRowIsTheOneTheCardGoesUnder() {
        Rect found = FloatingMenu.bubble(host, new Rect(112, 196, 969, 374), density);

        assertEquals(new Rect(381, 365, 1057, 466), found);
    }

    @Test public void aMenuWhoseActionsArentAllButtonsIsLeftAsMessengerDrewIt() {
        actions.addView(at(new View(app), 0, 1959, 60, 2274));
        FloatingMenu.dress(overlay, host);

        assertNull(card());
        assertEquals(View.VISIBLE, actions.getVisibility());
    }

    @Test public void aSheetWithNoEmojiRowOverAMessageKeepsMessengersOwnLayout() {
        overlay.removeView(panel);
        FloatingMenu.dress(overlay, host);

        assertNull(card());
        assertEquals(View.VISIBLE, actions.getVisibility());
    }

    @Test public void withoutTheSwitchNothingMoves() {
        assertFalse(FloatingMenu.wanted());

        Settings.preferences.edit().putBoolean(FloatingMenu.KEY, true).commit();

        assertTrue(Settings.installed.contains(MenuBlur.KEY));
        assertTrue(FloatingMenu.wanted());
    }

    @Test public void aMessageOnTheLeftGetsTheCardOnTheLeft() {
        Rect placed = FloatingMenu.place(new Rect(112, 196, 969, 374), new Rect(23, 365, 699, 466),
            new Rect(0, 75, 1080, 2274), 600, 200, 20, 12);

        assertEquals(new Rect(23, 486, 623, 686), placed);
    }

    @Test public void withNoRoomUnderTheLastMessageTheCardGoesOverTheEmojiRow() {
        Rect placed = FloatingMenu.place(new Rect(112, 1800, 969, 1978), new Rect(381, 1969, 1070, 2070),
            new Rect(0, 75, 1080, 2274), 600, 400, 20, 12);

        assertEquals(1800 - 20 - 400, placed.top);
        assertEquals(1080 - 12 - 600, placed.left);
    }

    @Test public void aCardWithRoomNeitherUnderNorOverStaysOnTheScreen() {
        Rect placed = FloatingMenu.place(new Rect(112, 300, 969, 478), new Rect(381, 469, 1070, 570),
            new Rect(0, 75, 1080, 2274), 600, 1900, 20, 12);

        assertEquals(2274 - 12 - 1900, placed.top);
    }

    @Test public void theLastMessageRisesJustEnoughForTheCardUnderIt() {
        Rect frame = new Rect(0, 75, 1080, 2274);
        Rect panel = new Rect(112, 1800, 969, 1978);

        assertEquals(2070 + 20 + 400 - (2274 - 12), FloatingMenu.rise(panel, new Rect(381, 1969, 1070, 2070), frame, 400, 20, 12));
        assertEquals(0, FloatingMenu.rise(new Rect(112, 196, 969, 374), new Rect(381, 365, 1057, 466), frame, 400, 20, 12));
        // Never past the top of the chat: the emoji row stops an edge under it.
        assertEquals(200 - (75 + 12), FloatingMenu.rise(new Rect(112, 200, 969, 378), new Rect(381, 369, 1070, 2070), frame, 400, 20, 12));
    }

    @Test public void aPhotoTheEmojiRowLiesAcrossStillGetsTheCardUnderIt() {
        // #162 on the S22: the newest photo sat at [372,1511][1057,2025] with Messenger's emoji row across its top, and
        // the card went under the row, over the photo, leaving a strip of it between the two.
        Rect frame = new Rect(0, 75, 1080, 2274);
        Rect panel = new Rect(112, 1480, 969, 1658);
        Rect photo = new Rect(372, 1511, 1057, 2025);

        int rise = FloatingMenu.rise(panel, photo, frame, 400, 20, 12);
        assertEquals(2025 + 20 + 400 - (2274 - 12), rise);
        panel.offset(0, -rise);
        photo.offset(0, -rise);
        Rect placed = FloatingMenu.place(panel, photo, frame, 600, 400, 20, 12);

        assertEquals(photo.bottom + 20, placed.top);
        assertTrue(placed.bottom <= 2274 - 12);
    }

    @Test public void aMessageTooTallToShareTheScreenWithTheCardKeepsItUnderTheEmojiRow() {
        Rect frame = new Rect(0, 75, 1080, 2274);
        Rect panel = new Rect(112, 1000, 969, 1178);
        Rect video = new Rect(381, 300, 1070, 2200);

        assertEquals(0, FloatingMenu.rise(panel, video, frame, 400, 20, 12));
        assertEquals(1178 + 20, FloatingMenu.place(panel, video, frame, 600, 400, 20, 12).top);
    }

    /**
     * #162 on the S22 (density 2.8125): Messenger put the emoji row 38 px down the newest photo, the photo rose 410 px
     * for the card, and the row still hid the photo's top third. The emoji in the row sat at [128,1557][953,1703].
     */
    @Test public void theEmojiRowMovesUpOffThePhotoItLiesAcross() {
        float s22 = 2.8125f;
        int gap = (int) (FloatingMenu.GAP_DP * s22), edge = (int) (FloatingMenu.EDGE_DP * s22);
        int width = (int) (FloatingMenu.WIDTH_DP * s22), height = FloatingMenu.height(4, s22);
        Rect frame = new Rect(0, 75, 1080, 2274);
        Rect panel = new Rect(112, 1549, 969, 1727);
        Rect photo = new Rect(372, 1511, 1057, 2025);

        int rise = FloatingMenu.rise(panel, photo, frame, height, gap, edge);
        assertEquals("What the S22 showed", 410, rise);
        panel.offset(0, -rise);
        photo.offset(0, -rise);
        int clear = FloatingMenu.clear(panel, photo, frame, height, gap, edge);
        assertEquals(1727 - 1511, clear);
        panel.offset(0, -clear);
        assertEquals("The row ends where the photo starts", photo.top, panel.bottom);
        assertEquals(photo.bottom + gap, FloatingMenu.place(panel, photo, frame, width, height, gap, edge).top);

        // The upper photo in that chat had room for the card already, and only its row moves.
        Rect upper = new Rect(372, 991, 1057, 1505);
        Rect row = new Rect(112, 1029, 969, 1207);
        assertEquals(0, FloatingMenu.rise(row, upper, frame, height, gap, edge));
        assertEquals(1207 - 991, FloatingMenu.clear(row, upper, frame, height, gap, edge));
    }

    @Test public void withoutTheBlurTheRowStillMovesOffThePhotoAndTheCardGoesOverIt() {
        Rect frame = new Rect(0, 75, 1080, 2274);
        Rect panel = new Rect(112, 1549, 969, 1727);
        Rect photo = new Rect(372, 1511, 1057, 2025);

        int clear = FloatingMenu.clear(panel, photo, frame, 600, 28, 33);
        assertEquals(1727 - 1511, clear);
        panel.offset(0, -clear);
        Rect placed = FloatingMenu.place(panel, photo, frame, 652, 600, 28, 33);

        assertEquals("Over the row, since it can't go under the photo", panel.top - 28 - 600, placed.top);
    }

    @Test public void onlyARowLaidAcrossAMessageMovesOffIt() {
        Rect frame = new Rect(0, 75, 1080, 2274);
        // A short message: Messenger puts the row over it, its padding just reaching the bubble.
        assertEquals(0, FloatingMenu.clear(new Rect(112, 196, 969, 374), new Rect(381, 365, 1057, 466), frame, 400, 20, 12));
        // A video too tall to share the screen with the row and the card keeps the row where the press was.
        assertEquals(0, FloatingMenu.clear(new Rect(112, 1000, 969, 1178), new Rect(381, 300, 1070, 2200), frame, 400, 20, 12));
        // So does one whose top is already off the screen.
        assertEquals(0, FloatingMenu.clear(new Rect(112, 300, 969, 478), new Rect(381, 40, 1070, 900), frame, 400, 20, 12));
        assertEquals(0, FloatingMenu.clear(new Rect(112, 1480, 969, 1658), null, frame, 400, 20, 12));
        // Near the top of the chat the row goes no higher than an edge under it.
        assertEquals(130 - (75 + 12), FloatingMenu.clear(new Rect(112, 130, 969, 308), new Rect(372, 120, 1057, 700), frame, 400, 20, 12));
    }

    /** #250 on the S22: a short message near the top of the chat had the emoji row's bottom edge over its top. */
    @Test public void nearTheTopTheRowMovesUpOffAShortMessageItReachesInto() {
        float s22 = 2.8125f;
        int gap = (int) (FloatingMenu.GAP_DP * s22), edge = (int) (FloatingMenu.EDGE_DP * s22);
        int height = FloatingMenu.height(4, s22);
        Rect frame = new Rect(0, 75, 1080, 2274);
        // Mid-screen Messenger ends the row's clear edge on the message, and the drawn row stops 17 px above it.
        assertEquals(0, FloatingMenu.clear(new Rect(112, 1160, 969, 1338), new Rect(789, 1338, 1057, 1437), frame, height, gap, edge));
        // Near the top it left the row 29 px into the message, and the drawn row covered the bubble's top edge.
        Rect row = new Rect(112, 421, 969, 599);
        Rect message = new Rect(789, 570, 1057, 671);
        int clear = FloatingMenu.clear(row, message, frame, height, gap, edge);
        assertEquals(599 - 570, clear);
        row.offset(0, -clear);
        assertEquals("The row ends where the message starts, as it does mid-screen", message.top, row.bottom);
        assertEquals("The card still goes under the message", message.bottom + gap,
                FloatingMenu.place(row, message, frame, (int) (FloatingMenu.WIDTH_DP * s22), height, gap, edge).top);
        // With no room above it the row goes no higher than an edge under the top.
        assertEquals(130 - (75 + edge), FloatingMenu.clear(new Rect(112, 130, 969, 308), new Rect(789, 260, 1057, 361), frame, height, gap, edge));
    }

    @Test public void aBubbleThatOnlySaysItTakesATapIsStillThePressedMessage() {
        View litho = at(new View(app), 23, 365, 699, 466);
        litho.setClickable(true);
        host.removeAllViews();
        host.addView(litho);

        assertEquals(new Rect(23, 365, 699, 466), FloatingMenu.bubble(host, new Rect(112, 196, 969, 374), density));
    }

    @Test public void withNoWordOnWhereTheMessageIsTheCardGoesUnderTheEmojiRow() {
        Rect placed = FloatingMenu.place(new Rect(112, 196, 969, 374), null,
            new Rect(0, 75, 1080, 2274), 600, 200, 20, 12);

        assertEquals(394, placed.top);
    }
}
