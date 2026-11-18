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
