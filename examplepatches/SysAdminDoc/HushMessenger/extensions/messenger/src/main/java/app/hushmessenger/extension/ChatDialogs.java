package app.hushmessenger.extension;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.res.ColorStateList;
import android.graphics.Bitmap;
import android.graphics.BitmapShader;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Matrix;
import android.graphics.Outline;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.InsetDrawable;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.util.DisplayMetrics;
import android.view.PixelCopy;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.TextView;

/**
 * The look of the questions Hush asks over a chat (#179). The platform's alert sheet is a flat grey rectangle with
 * shouting buttons, which sits badly on top of Messenger, so every Hush question goes up as a rounded card in the
 * palette's own colour with a filled accent button for the action and a plain one for Cancel. The card is frosted
 * glass, which is the look the request asked for: on Android 12 and later, where the system will blur behind a window,
 * the chat behind is blurred and the card is a see-through tint over it with a light edge. Where the system won't blur,
 * a small copy of the chat is taken as the card goes up, blurred here and drawn inside the card under the same tint, so
 * the card is frosted all the same. Until that copy arrives, and where there's no chat window to copy (a chat head),
 * the card is solid, so nothing is left washed out. Messenger's own dialogs are untouched.
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
    /** What keeps the filled button off the plain one next to it. */
    static final int BUTTON_GAP_DP = 8;
    /** How much of the words' colour a date picker's header keeps on the half that isn't selected. */
    static final int HEADER_REST_ALPHA = 0x99;
    /** The card's alpha over the blurred chat, low enough that the chat shows through as glass. Solid without it. */
    static final int GLASS_ALPHA = 0xA6;
    /** How far the copy of the chat is shrunk before it's blurred, which keeps the blur to a blink. */
    static final int FROST_SCALE = 8;
    /** The dim behind the card, lighter while the blur carries the separation. */
    static final float DIM = 0.45f;
    static final float DIM_WITH_BLUR = 0.2f;

    /** Whether the phone will blur behind a window right now. Tests swap it. */
    interface Blur {
        boolean enabled(Context context);
    }

    static volatile Blur blur = ChatDialogs::defaultBlur;

    /** Copies what a window shows into a bitmap, which PixelCopy does on a phone. Tests swap it. */
    interface Copier {
        void copy(Window window, Bitmap into, PixelCopy.OnPixelCopyFinishedListener done, Handler on);
    }

    static volatile Copier copier = PixelCopy::request;

    /** The window's side of the look, set before the dialog goes up. Never throws. */
    static void dress(Dialog dialog) {
        try {
            Window window = dialog == null ? null : dialog.getWindow();
            if (window == null) return;
            Context context = dialog.getContext();
            float density = density(context);
            boolean light = MaterialYouTheme.chatIsLight();
            boolean blurred = Build.VERSION.SDK_INT >= 31 && blur.enabled(context);
            GradientDrawable card = new GradientDrawable();
            card.setCornerRadius(CORNER_DP * density);
            card.setColor(blurred ? glass(surface(light)) : surface(light));
            if (blurred) card.setStroke(hairline(density), edge(light));
            int inset = (int) (INSET_DP * density);
            window.setBackgroundDrawable(new InsetDrawable(card, inset, inset, inset, inset));
            window.setDimAmount(blurred ? DIM_WITH_BLUR : DIM);
            if (blurred) {
                window.addFlags(WindowManager.LayoutParams.FLAG_BLUR_BEHIND);
                window.getAttributes().setBlurBehindRadius((int) (BLUR_DP * density));
            } else {
                frost(dialog, window, light, density, inset);
            }
        } catch (Throwable error) {
            // A question that looks like the platform's own is still a question.
            Settings.hookFailedPrivately("chat_dialog", "Can't dress a question over a chat", error);
        }
    }

    /**
     * Frosts the card on a phone that won't blur behind a window: the chat's window is copied small just before the card
     * goes up, and once the copy is in, it's blurred and becomes the card's glass. Without a chat window that has been
     * drawn, which is the case over a chat head, the card stays solid.
     */
    private static void frost(Dialog dialog, Window window, boolean light, float density, int inset) {
        Activity under = ChatJump.activity(dialog.getContext());
        Window chat = under == null ? null : under.getWindow();
        View behind = chat == null ? null : chat.peekDecorView();
        if (behind == null || !behind.isAttachedToWindow() || behind.getWidth() <= 0 || behind.getHeight() <= 0) return;
        int[] copiedAt = new int[2];
        behind.getLocationOnScreen(copiedAt);
        Bitmap copy = Bitmap.createBitmap(Math.max(1, behind.getWidth() / FROST_SCALE),
            Math.max(1, behind.getHeight() / FROST_SCALE), Bitmap.Config.ARGB_8888);
        copier.copy(chat, copy, result -> {
            try {
                if (result != PixelCopy.SUCCESS || !dialog.isShowing()) return;
                blur(copy, Math.max(1, Math.round(BLUR_DP * density / FROST_SCALE)));
                Frost glass = new Frost(copy, copiedAt, window.getDecorView(), CORNER_DP * density,
                    glass(surface(light)), edge(light), hairline(density));
                window.setBackgroundDrawable(new InsetDrawable(glass, inset, inset, inset, inset));
            } catch (Throwable error) {
                Settings.hookFailedPrivately("chat_dialog", "Can't frost a question over a chat", error);
            }
        }, new Handler(Looper.getMainLooper()));
    }

    /** A box blur run three times each way, which comes out close to a Gaussian one. Changes [bitmap] in place. */
    static void blur(Bitmap bitmap, int radius) {
        int width = bitmap.getWidth(), height = bitmap.getHeight();
        int[] pixels = new int[width * height], spare = new int[pixels.length];
        bitmap.getPixels(pixels, 0, width, 0, 0, width, height);
        for (int pass = 0; pass < 3; pass++) {
            boxBlur(pixels, spare, width, height, radius, 1, width);
            boxBlur(spare, pixels, height, width, radius, width, 1);
        }
        bitmap.setPixels(pixels, 0, width, 0, 0, width, height);
    }

    /**
     * One pass of a running-sum box blur along [lines] lines of [length] pixels each, where [step] moves along a line and
     * [next] moves to the next line, with the edge pixel repeated past either end.
     */
    private static void boxBlur(int[] from, int[] to, int length, int lines, int radius, int step, int next) {
        int span = radius * 2 + 1;
        for (int line = 0; line < lines; line++) {
            int start = line * next;
            int a = 0, r = 0, g = 0, b = 0;
            for (int i = -radius; i <= radius; i++) {
                int pixel = from[start + Math.min(length - 1, Math.max(0, i)) * step];
                a += pixel >>> 24; r += (pixel >> 16) & 0xFF; g += (pixel >> 8) & 0xFF; b += pixel & 0xFF;
            }
            for (int i = 0; i < length; i++) {
                to[start + i * step] = ((a / span) << 24) | ((r / span) << 16) | ((g / span) << 8) | (b / span);
                int out = from[start + Math.max(0, i - radius) * step];
                int in = from[start + Math.min(length - 1, i + radius + 1) * step];
                a += (in >>> 24) - (out >>> 24);
                r += ((in >> 16) & 0xFF) - ((out >> 16) & 0xFF);
                g += ((in >> 8) & 0xFF) - ((out >> 8) & 0xFF);
                b += (in & 0xFF) - (out & 0xFF);
            }
        }
    }

    /**
     * The frosted card: the blurred copy of the chat, lined up with the chat it was copied from wherever the card sits,
     * darkened by the same dim as the rest of the screen, under the card's tint and a light edge.
     */
    static final class Frost extends Drawable {
        final Bitmap copy;
        private final int[] copiedAt, hostAt = new int[2];
        private final View host;
        private final float corner, edgeWidth;
        private final int tint, edge;
        private final Paint picture = new Paint(Paint.ANTI_ALIAS_FLAG | Paint.FILTER_BITMAP_FLAG);
        private final Paint fill = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final BitmapShader shader;
        private final Matrix place = new Matrix();
        private final RectF card = new RectF();

        Frost(Bitmap copy, int[] copiedAt, View host, float corner, int tint, int edge, float edgeWidth) {
            this.copy = copy;
            this.copiedAt = copiedAt;
            this.host = host;
            this.corner = corner;
            this.tint = tint;
            this.edge = edge;
            this.edgeWidth = edgeWidth;
            shader = new BitmapShader(copy, Shader.TileMode.CLAMP, Shader.TileMode.CLAMP);
            picture.setShader(shader);
        }

        @Override public void draw(Canvas canvas) {
            card.set(getBounds());
            host.getLocationOnScreen(hostAt);
            place.setScale(FROST_SCALE, FROST_SCALE);
            place.postTranslate(copiedAt[0] - hostAt[0], copiedAt[1] - hostAt[1]);
            shader.setLocalMatrix(place);
            canvas.drawRoundRect(card, corner, corner, picture);
            fill.setStyle(Paint.Style.FILL);
            fill.setColor(((int) (DIM * 255) << 24));
            canvas.drawRoundRect(card, corner, corner, fill);
            fill.setColor(tint);
            canvas.drawRoundRect(card, corner, corner, fill);
            fill.setStyle(Paint.Style.STROKE);
            fill.setStrokeWidth(edgeWidth);
            fill.setColor(edge);
            card.inset(edgeWidth / 2, edgeWidth / 2);
            canvas.drawRoundRect(card, corner, corner, fill);
        }

        @Override public void getOutline(Outline outline) {
            outline.setRoundRect(getBounds(), corner);
            outline.setAlpha(Color.alpha(tint) / 255f);
        }

        @Override public void setAlpha(int alpha) { }

        @Override public void setColorFilter(ColorFilter filter) { }

        @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    }

    /** The buttons and the words, set once they exist, which is after the dialog goes up. Never throws. */
    static void dressButtons(Dialog dialog) {
        try {
            if (!(dialog instanceof AlertDialog)) return;
            AlertDialog alert = (AlertDialog) dialog;
            boolean light = MaterialYouTheme.chatIsLight();
            float density = density(dialog.getContext());
            dressButton(alert.getButton(DialogInterface.BUTTON_POSITIVE), true, light, density);
            dressButton(alert.getButton(DialogInterface.BUTTON_NEGATIVE), false, light, density);
            dressButton(alert.getButton(DialogInterface.BUTTON_NEUTRAL), false, light, density);
            dressWords(alert, onCard(light));
        } catch (Throwable error) {
            Settings.hookFailedPrivately("chat_dialog", "Can't dress a question's buttons", error);
        }
    }

    /**
     * The title and message take the card's own contrast rather than the theme's, which left the title dark on the dark
     * card. A date picker's header goes see-through too, so the card is glass from the top down.
     */
    private static void dressWords(AlertDialog dialog, int words) {
        for (String name : new String[] {"alertTitle", "message"}) {
            View part = part(dialog, name);
            if (part instanceof TextView) ((TextView) part).setTextColor(words);
        }
        View header = part(dialog, "date_picker_header");
        if (header == null) return;
        header.setBackgroundColor(Color.TRANSPARENT);
        ColorStateList colors = new ColorStateList(
            new int[][] {{android.R.attr.state_activated}, {}},
            new int[] {words, (HEADER_REST_ALPHA << 24) | (words & 0x00FFFFFF)});
        for (String name : new String[] {"date_picker_header_year", "date_picker_header_date"}) {
            View part = part(dialog, name);
            if (part instanceof TextView) ((TextView) part).setTextColor(colors);
        }
    }

    /** One of the platform's own views in a dialog, by the name it has there. */
    private static View part(Dialog dialog, String name) {
        int id = dialog.getContext().getResources().getIdentifier(name, "id", "android");
        return id == 0 ? null : dialog.findViewById(id);
    }

    private static void dressButton(Button button, boolean filled, boolean light, float density) {
        if (button == null || button.getVisibility() != View.VISIBLE) return;
        button.setAllCaps(false);
        GradientDrawable pill = new GradientDrawable();
        pill.setCornerRadius(BUTTON_CORNER_DP * density);
        if (filled) {
            pill.setColor(accent());
            button.setTextColor(onAccent());
            if (button.getLayoutParams() instanceof ViewGroup.MarginLayoutParams) {
                ViewGroup.MarginLayoutParams place = (ViewGroup.MarginLayoutParams) button.getLayoutParams();
                place.setMarginStart((int) (BUTTON_GAP_DP * density));
                button.setLayoutParams(place);
            }
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

    /** What reads on the card, by the card's own lightness, so a pasted palette still gets words that show. */
    static int onCard(boolean light) {
        return onAccent(surface(light));
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

    /** The glass card's edge: a light line, brighter on the light theme, where white glass needs it more. */
    static int edge(boolean light) {
        return light ? 0x80FFFFFF : 0x26FFFFFF;
    }

    private static int hairline(float density) {
        return Math.max(1, Math.round(density));
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
