package app.hushmessenger.extension;

import android.app.AlertDialog;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.InsetDrawable;
import android.os.Build;
import android.util.DisplayMetrics;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.widget.Button;

/**
 * The look of the questions Hush asks over a chat (#179). The platform's alert sheet is a flat grey rectangle with
 * shouting buttons, which sits badly on top of Messenger, so every Hush question goes up as a rounded card in the
 * palette's own colour with a filled accent button for the action and a plain one for Cancel. On Android 12 and later,
 * where the system will blur behind a window, the chat behind the card is blurred and the card itself is slightly
 * see-through, which is the glass look the request asked for. Where blur isn't on, the card stays solid and the usual
 * dim stands in, so nothing is left washed out. Messenger's own dialogs are untouched.
 */
final class ChatDialogs {
    private ChatDialogs() {}

    /** The corner of the card, and the inset that keeps it off the screen edges. */
    static final int CORNER_DP = 28;
    static final int INSET_DP = 16;
    /** How far the chat behind the card is blurred, and how round and wide the buttons are. */
    static final int BLUR_DP = 32;
    static final int BUTTON_CORNER_DP = 20;
    static final int BUTTON_PADDING_DP = 18;
    /** The card's alpha while the chat behind it is blurred. Solid without the blur. */
    static final int GLASS_ALPHA = 0xE8;
    /** The dim behind the card, lighter while the blur carries the separation. */
    static final float DIM = 0.45f;
    static final float DIM_WITH_BLUR = 0.2f;

    /** Whether the phone will blur behind a window right now. Tests swap it. */
    interface Blur {
        boolean enabled(Context context);
    }

    static volatile Blur blur = ChatDialogs::defaultBlur;

    /** The window's side of the look, set before the dialog goes up. Never throws. */
    static void dress(Dialog dialog) {
        try {
            Window window = dialog == null ? null : dialog.getWindow();
            if (window == null) return;
            Context context = dialog.getContext();
            float density = density(context);
            boolean light = MaterialYouTheme.chatIsLight();
            boolean blurred = blur.enabled(context);
            GradientDrawable card = new GradientDrawable();
            card.setCornerRadius(CORNER_DP * density);
            card.setColor(blurred ? glass(surface(light)) : surface(light));
            int inset = (int) (INSET_DP * density);
            window.setBackgroundDrawable(new InsetDrawable(card, inset, inset, inset, inset));
            window.setDimAmount(blurred ? DIM_WITH_BLUR : DIM);
            if (blurred && Build.VERSION.SDK_INT >= 31) {
                window.addFlags(WindowManager.LayoutParams.FLAG_BLUR_BEHIND);
                window.getAttributes().setBlurBehindRadius((int) (BLUR_DP * density));
            }
        } catch (Throwable error) {
            // A question that looks like the platform's own is still a question.
            Settings.hookFailedPrivately("chat_dialog", "Can't dress a question over a chat", error);
        }
    }

    /** The buttons' side, set once they exist, which is after the dialog goes up. Never throws. */
    static void dressButtons(Dialog dialog) {
        try {
            if (!(dialog instanceof AlertDialog)) return;
            AlertDialog alert = (AlertDialog) dialog;
            boolean light = MaterialYouTheme.chatIsLight();
            float density = density(dialog.getContext());
            dressButton(alert.getButton(DialogInterface.BUTTON_POSITIVE), true, light, density);
            dressButton(alert.getButton(DialogInterface.BUTTON_NEGATIVE), false, light, density);
            dressButton(alert.getButton(DialogInterface.BUTTON_NEUTRAL), false, light, density);
        } catch (Throwable error) {
            Settings.hookFailedPrivately("chat_dialog", "Can't dress a question's buttons", error);
        }
    }

    private static void dressButton(Button button, boolean filled, boolean light, float density) {
        if (button == null || button.getVisibility() != View.VISIBLE) return;
        button.setAllCaps(false);
        GradientDrawable pill = new GradientDrawable();
        pill.setCornerRadius(BUTTON_CORNER_DP * density);
        if (filled) {
            pill.setColor(accent());
            button.setTextColor(onAccent());
        } else {
            pill.setColor(Color.TRANSPARENT);
            pill.setStroke(Math.max(1, (int) density), outline(light));
            button.setTextColor(accent());
        }
        button.setBackground(pill);
        int side = (int) (BUTTON_PADDING_DP * density);
        button.setPadding(side, button.getPaddingTop(), side, button.getPaddingBottom());
    }

    /** The card's colour: Messenger's own surface, recoloured with the rest of the app when Material You is on. */
    static int surface(boolean light) {
        return MaterialYouTheme.fds(light ? 0xFFFFFFFF : 0xFF252728);
    }

    /** The action button's colour: Messenger's blue, and the palette's accent when Material You is on. */
    static int accent() {
        return MaterialYouTheme.fds(0xFF0A7CFF);
    }

    /** What reads on the accent. Its own lightness decides, so a pale palette still gets dark words. */
    static int onAccent() {
        return onAccent(accent());
    }

    static int onAccent(int accent) {
        int light = (((accent >> 16) & 0xFF) * 299 + ((accent >> 8) & 0xFF) * 587 + (accent & 0xFF) * 114) / 1000;
        return light >= 160 ? 0xFF000000 : 0xFFFFFFFF;
    }

    /** The plain button's outline, drawn from the card's own colour so it shows on either theme. */
    static int outline(boolean light) {
        return (light ? 0x33000000 : 0x33FFFFFF);
    }

    static int glass(int solid) {
        return (GLASS_ALPHA << 24) | (solid & 0x00FFFFFF);
    }

    private static float density(Context context) {
        if (context == null) return 1f;
        DisplayMetrics metrics = context.getResources().getDisplayMetrics();
        return metrics.density <= 0 ? 1f : metrics.density;
    }

    static boolean defaultBlur(Context context) {
        if (Build.VERSION.SDK_INT < 31 || context == null) return false;
        try {
            WindowManager windows = context.getSystemService(WindowManager.class);
            return windows != null && windows.isCrossWindowBlurEnabled();
        } catch (Throwable unanswered) {
            // A phone that won't say gets the solid card, which is what a phone that won't blur gets anyway.
            return false;
        }
    }
}
