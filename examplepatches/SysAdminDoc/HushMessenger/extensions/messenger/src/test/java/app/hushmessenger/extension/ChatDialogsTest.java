package app.hushmessenger.extension;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.graphics.Color;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.InsetDrawable;
import android.os.Build;
import android.view.Window;
import android.view.WindowManager;
import android.widget.Button;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

/**
 * #179: the questions Hush asks over a chat used to go up as the platform's flat grey sheet with shouting buttons.
 * They go up as a rounded card in the chat's own colour now, with a filled button for the action, and the chat behind
 * them blurred on a phone that will blur.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class ChatDialogsTest {
    private ActivityController<Activity> controller;
    private Activity activity;

    @Before public void open() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        Settings.hookErrors.clear();
        ChatDialogs.blur = context -> false;
        MaterialYouTheme.darkModeAnswer(true);
        controller = Robolectric.buildActivity(Activity.class).setup();
        activity = controller.get();
    }

    @After public void close() {
        ChatDialogs.blur = ChatDialogs::defaultBlur;
        // Messenger's dark mode answer is one static for the whole app, so it goes back to unanswered for the next test.
        MaterialYouTheme.forgetDarkModeAnswer();
        controller.close();
    }

    private AlertDialog question() {
        return new AlertDialog.Builder(activity, MaterialYouTheme.chatDialogTheme())
            .setMessage("Start a voice call?")
            .setPositiveButton("Call", (shown, which) -> {})
            .setNegativeButton("Cancel", null)
            .create();
    }

    private static GradientDrawable card(AlertDialog dialog) {
        Drawable background = dialog.getWindow().getDecorView().getBackground();
        assertTrue("the card sits inside an inset", background instanceof InsetDrawable);
        Drawable inside = ((InsetDrawable) background).getDrawable();
        assertTrue("the card is drawn, not a nine-patch", inside instanceof GradientDrawable);
        return (GradientDrawable) inside;
    }

    private static int colorOf(GradientDrawable card) {
        return card.getColor().getDefaultColor();
    }

    /** Dressed and put up, the way every question Hush asks over a chat goes up. */
    private AlertDialog shown() {
        AlertDialog dialog = question();
        ChatDialogs.dress(dialog);
        dialog.show();
        ChatDialogs.dressButtons(dialog);
        return dialog;
    }

    @Test public void theQuestionIsARoundedCardInTheChatsOwnColour() {
        float density = activity.getResources().getDisplayMetrics().density;
        AlertDialog dark = shown();
        assertEquals(ChatDialogs.CORNER_DP * density, card(dark).getCornerRadius(), 0.01f);
        assertEquals(0xFF252728, colorOf(card(dark)));
        assertEquals(255, Color.alpha(colorOf(card(dark))));
        dark.dismiss();

        MaterialYouTheme.darkModeAnswer(false);
        AlertDialog light = shown();
        assertEquals(0xFFFFFFFF, colorOf(card(light)));
    }

    @Test public void theChatBehindIsBlurredOnlyWhenThePhoneWillBlur() {
        AlertDialog solid = shown();
        Window plain = solid.getWindow();
        assertEquals(0, plain.getAttributes().flags & WindowManager.LayoutParams.FLAG_BLUR_BEHIND);
        assertEquals(ChatDialogs.DIM, plain.getAttributes().dimAmount, 0.001f);
        assertEquals(255, Color.alpha(colorOf(card(solid))));
        solid.dismiss();

        ChatDialogs.blur = context -> true;
        AlertDialog glass = shown();
        Window blurred = glass.getWindow();
        assertEquals(ChatDialogs.GLASS_ALPHA, Color.alpha(colorOf(card(glass))));
        assertEquals(ChatDialogs.DIM_WITH_BLUR, blurred.getAttributes().dimAmount, 0.001f);
        if (Build.VERSION.SDK_INT >= 31) {
            assertEquals(WindowManager.LayoutParams.FLAG_BLUR_BEHIND,
                blurred.getAttributes().flags & WindowManager.LayoutParams.FLAG_BLUR_BEHIND);
            assertEquals((int) (ChatDialogs.BLUR_DP * activity.getResources().getDisplayMetrics().density),
                blurred.getAttributes().getBlurBehindRadius());
        } else {
            // Android 11 and earlier have no blur to ask for, so the card keeps the dim it always had.
            assertEquals(0, blurred.getAttributes().flags & WindowManager.LayoutParams.FLAG_BLUR_BEHIND);
        }
    }

    @Test public void theActionIsAFilledPillAndCancelIsPlain() {
        AlertDialog dialog = shown();
        Button call = dialog.getButton(DialogInterface.BUTTON_POSITIVE);
        Button cancel = dialog.getButton(DialogInterface.BUTTON_NEGATIVE);
        assertFalse("the buttons stop shouting", call.isAllCaps());
        assertFalse(cancel.isAllCaps());

        GradientDrawable filled = (GradientDrawable) call.getBackground();
        assertEquals(ChatDialogs.accent(), filled.getColor().getDefaultColor());
        assertEquals(ChatDialogs.onAccent(), call.getCurrentTextColor());

        GradientDrawable plain = (GradientDrawable) cancel.getBackground();
        assertEquals(Color.TRANSPARENT, plain.getColor().getDefaultColor());
        assertEquals(ChatDialogs.accent(), cancel.getCurrentTextColor());
        assertNotEquals("Cancel reads as the quieter one", call.getCurrentTextColor(), cancel.getCurrentTextColor());
    }

    /** The words on the accent have to be readable, whatever colour a pasted theme gives it. */
    @Test public void theWordsOnTheActionFollowTheAccentsOwnLightness() {
        assertEquals(0xFFFFFFFF, ChatDialogs.onAccent());
        assertEquals(0xFF000000, ChatDialogs.onAccent(0xFFEFEFEF));
        assertEquals(0xFFFFFFFF, ChatDialogs.onAccent(0xFF1C2B33));
    }

    /** A question Hush can't dress still gets asked: nothing here may throw or be recorded as a hook failure. */
    @Test public void aQuestionWithNothingToDressIsLeftAlone() {
        ChatDialogs.dress(null);
        ChatDialogs.dressButtons(null);
        AlertDialog menu = new AlertDialog.Builder(activity, MaterialYouTheme.chatDialogTheme())
            .setTitle("Jump to").setItems(new CharSequence[] {"First message"}, null).create();
        ChatDialogs.dress(menu);
        menu.show();
        ChatDialogs.dressButtons(menu);
        assertTrue(menu.isShowing());
        assertTrue("dressing a question never records a hook failure", Settings.hookErrors.isEmpty());
    }
}
