package app.hushmessenger.extension;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.DatePickerDialog;
import android.content.DialogInterface;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Outline;
import android.graphics.Rect;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.InsetDrawable;
import android.os.Build;
import android.os.Looper;
import android.view.PixelCopy;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.TextView;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;

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
        // A copy of the chat that never comes back, so the card stays the solid one unless a test hands a copy over.
        ChatDialogs.copier = (window, into, done, on) -> { };
        MaterialYouTheme.darkModeAnswer(true);
        controller = Robolectric.buildActivity(Activity.class).setup();
        activity = controller.get();
    }

    @After public void close() {
        ChatDialogs.blur = ChatDialogs::defaultBlur;
        ChatDialogs.copier = PixelCopy::request;
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
        if (Build.VERSION.SDK_INT >= 31) {
            assertEquals(ChatDialogs.GLASS_ALPHA, Color.alpha(colorOf(card(glass))));
            assertEquals(ChatDialogs.DIM_WITH_BLUR, blurred.getAttributes().dimAmount, 0.001f);
            assertEquals(WindowManager.LayoutParams.FLAG_BLUR_BEHIND,
                blurred.getAttributes().flags & WindowManager.LayoutParams.FLAG_BLUR_BEHIND);
            assertEquals((int) (ChatDialogs.BLUR_DP * activity.getResources().getDisplayMetrics().density),
                blurred.getAttributes().getBlurBehindRadius());
        } else {
            // Android 11 and earlier have no blur to ask for, so the card keeps the dim it always had.
            assertEquals(0, blurred.getAttributes().flags & WindowManager.LayoutParams.FLAG_BLUR_BEHIND);
            assertEquals(ChatDialogs.DIM, blurred.getAttributes().dimAmount, 0.001f);
        }
    }

    /**
     * On a phone that won't blur behind a window, the card is frosted from a copy of the chat: a red chat behind it shows
     * through the card as a dimmed red, where the solid card was the same grey whatever sat behind it.
     */
    @Test @Config(sdk = 36) @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void onAPhoneThatWontBlurTheCardIsFrostedFromTheChatBehindIt() {
        // The chat behind is red. On a phone PixelCopy reads it off the screen; here the copy is handed over red.
        Window[] copied = {null};
        ChatDialogs.copier = (window, into, done, on) -> {
            copied[0] = window;
            into.eraseColor(Color.RED);
            on.post(() -> done.onPixelCopyFinished(PixelCopy.SUCCESS));
        };
        AlertDialog dialog = shown();
        assertSame("the chat's own window is the one copied", activity.getWindow(), copied[0]);
        assertTrue("solid until the copy is in", ((InsetDrawable) dialog.getWindow().getDecorView().getBackground()).getDrawable() instanceof GradientDrawable);
        shadowOf(Looper.getMainLooper()).idle();

        Drawable background = dialog.getWindow().getDecorView().getBackground();
        assertTrue(background instanceof InsetDrawable);
        Drawable inside = ((InsetDrawable) background).getDrawable();
        assertTrue("frosted once the copy is in", inside instanceof ChatDialogs.Frost);
        View behind = activity.getWindow().getDecorView();
        assertEquals(behind.getWidth() / ChatDialogs.FROST_SCALE, ((ChatDialogs.Frost) inside).copy.getWidth());

        Rect bounds = inside.getBounds();
        Bitmap drawn = Bitmap.createBitmap(Math.max(1, background.getBounds().width()), Math.max(1, background.getBounds().height()), Bitmap.Config.ARGB_8888);
        background.draw(new Canvas(drawn));
        int middle = drawn.getPixel(bounds.centerX(), bounds.centerY());
        assertTrue("the red chat shows through: " + Integer.toHexString(middle), Color.red(middle) > Color.green(middle) + 20);
        assertEquals("the card is still the card", ChatDialogs.CORNER_DP * activity.getResources().getDisplayMetrics().density,
            outlineRadius(inside), 0.01f);
        assertTrue(Settings.hookErrors.isEmpty());
    }

    /** A copy that fails, or one that lands after the question was answered, leaves the solid card as it was. */
    @Test public void aCopyThatFailsOrComesLateLeavesTheSolidCard() {
        ChatDialogs.copier = (window, into, done, on) -> on.post(() -> done.onPixelCopyFinished(PixelCopy.ERROR_SOURCE_NO_DATA));
        AlertDialog failed = shown();
        shadowOf(Looper.getMainLooper()).idle();
        assertEquals(0xFF252728, colorOf(card(failed)));
        failed.dismiss();

        ChatDialogs.copier = (window, into, done, on) -> on.post(() -> done.onPixelCopyFinished(PixelCopy.SUCCESS));
        AlertDialog answered = shown();
        answered.dismiss();
        shadowOf(Looper.getMainLooper()).idle();
        assertTrue(((InsetDrawable) answered.getWindow().getDecorView().getBackground()).getDrawable() instanceof GradientDrawable);
        assertTrue(Settings.hookErrors.isEmpty());
    }

    private static float outlineRadius(Drawable drawable) {
        Outline outline = new Outline();
        drawable.getOutline(outline);
        return outline.getRadius();
    }

    /** The blur spreads a lone bright line across its neighbours and keeps the picture's overall brightness. */
    @Test @Config(sdk = 36) @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void theBlurSpreadsALineAcrossItsNeighbours() {
        Bitmap picture = Bitmap.createBitmap(20, 20, Bitmap.Config.ARGB_8888);
        picture.eraseColor(Color.BLACK);
        for (int x = 0; x < 20; x++) picture.setPixel(x, 10, Color.WHITE);
        ChatDialogs.blur(picture, 2);
        assertTrue(Color.red(picture.getPixel(10, 10)) < 255);
        assertTrue(Color.red(picture.getPixel(10, 12)) > 0);
        assertEquals(0, Color.red(picture.getPixel(10, 0)));
        assertEquals(255, Color.alpha(picture.getPixel(10, 12)));
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

    private View part(android.app.Dialog dialog, String name) {
        return dialog.findViewById(activity.getResources().getIdentifier(name, "id", "android"));
    }

    private void titleIsReadable(int words) {
        AlertDialog dialog = new AlertDialog.Builder(activity, MaterialYouTheme.chatDialogTheme())
            .setTitle("Jump to").setMessage("Where to?").create();
        ChatDialogs.dress(dialog);
        dialog.show();
        TextView title = (TextView) part(dialog, "alertTitle");
        TextView message = (TextView) part(dialog, "message");
        // On the S22 the title came up dark on the dark card.
        title.setTextColor(0xFF777777);
        message.setTextColor(0xFF777777);

        ChatDialogs.dressButtons(dialog);

        assertEquals(words, title.getCurrentTextColor());
        assertEquals(words, message.getCurrentTextColor());
        dialog.dismiss();
    }

    @Test public void theTitleAndMessageReadOnTheCard() {
        titleIsReadable(0xFFFFFFFF);
        MaterialYouTheme.darkModeAnswer(false);
        titleIsReadable(0xFF000000);
    }

    @Test public void theFilledButtonKeepsOffThePlainOne() {
        AlertDialog dialog = shown();
        int gap = (int) (ChatDialogs.BUTTON_GAP_DP * activity.getResources().getDisplayMetrics().density);
        View call = dialog.getButton(DialogInterface.BUTTON_POSITIVE);
        assertEquals(gap, ((ViewGroup.MarginLayoutParams) call.getLayoutParams()).getMarginStart());
    }

    private void headerIsGlass(int words) {
        DatePickerDialog dialog = new DatePickerDialog(activity, MaterialYouTheme.chatDialogTheme(), null, 2026, 10, 18);
        ChatDialogs.dress(dialog);
        dialog.show();
        ChatDialogs.dressButtons(dialog);

        View header = part(dialog, "date_picker_header");
        assertNotNull(header);
        assertEquals(Color.TRANSPARENT, ((ColorDrawable) header.getBackground()).getColor());
        int[] selected = {android.R.attr.state_activated};
        for (String name : new String[] {"date_picker_header_year", "date_picker_header_date"}) {
            assertEquals(name, words, ((TextView) part(dialog, name)).getTextColors().getColorForState(selected, 0));
        }
        dialog.dismiss();
    }

    @Test public void aDatePickersHeaderIsPartOfTheGlass() {
        headerIsGlass(0xFFFFFFFF);
        MaterialYouTheme.darkModeAnswer(false);
        headerIsGlass(0xFF000000);
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
