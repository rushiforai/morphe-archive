import android.content.Context;
import android.graphics.Color;
import android.os.Looper;
import android.text.SpannableString;
import android.text.Spanned;
import android.view.MotionEvent;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.widget.TextView;
import dev.twitchpatches.extension.emotes.ReplayEmoteTouch;
import dev.twitchpatches.extension.settings.SettingsWindow;

public final class ChatUiProbe {
    public static void main(String[] args) {
        try { run(); }
        catch (Throwable error) { error.printStackTrace(); System.exit(1); }
    }

    private static void run() throws Exception {
        Looper.prepareMainLooper();
        Class.forName("android.graphics.Typeface").getDeclaredMethod("loadPreinstalledSystemFontMap").invoke(null);
        Object thread = Class.forName("android.app.ActivityThread").getMethod("systemMain").invoke(null);
        Context context = (Context) thread.getClass().getMethod("getSystemContext").invoke(thread);
        context = new android.view.ContextThemeWrapper(context, android.R.style.Theme_Material);
        TextView text = new TextView(context);
        SpannableString value = new SpannableString("Plain External end");
        Class<?> emoteType = Class.forName("dev.twitchpatches.extension.emotes.Emote");
        java.lang.reflect.Constructor<?> emoteConstructor = emoteType.getDeclaredConstructors()[0];
        emoteConstructor.setAccessible(true);
        Object emote = emoteConstructor.newInstance("External", "https://cdn.betterttv.net/emote/example/2x.gif", true, false);
        java.lang.reflect.Constructor<?> clickConstructor = Class.forName("dev.twitchpatches.extension.emotes.EmoteClickSpan").getDeclaredConstructor(emoteType);
        clickConstructor.setAccessible(true);
        value.setSpan(clickConstructor.newInstance(emote), 6, 14, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        text.setText(value);
        text.measure(View.MeasureSpec.makeMeasureSpec(600, View.MeasureSpec.EXACTLY), View.MeasureSpec.makeMeasureSpec(200, View.MeasureSpec.EXACTLY));
        text.layout(0, 0, 600, 200);
        int[] forwarded = {0};
        ReplayEmoteTouch.install(text, (view, event) -> { forwarded[0]++; return true; });
        float x = text.getLayout().getPrimaryHorizontal(8);
        float y = text.getLayout().getLineBaseline(0);
        dispatch(text, MotionEvent.ACTION_DOWN, x, y);
        dispatch(text, MotionEvent.ACTION_UP, x, y);
        float edge = text.getLayout().getPrimaryHorizontal(14) - 0.5f;
        dispatch(text, MotionEvent.ACTION_DOWN, edge, y);
        dispatch(text, MotionEvent.ACTION_UP, edge, y);
        check(forwarded[0] == 0, "external emote tap bypasses replay row touch redirection");
        dispatch(text, MotionEvent.ACTION_DOWN, 1, y);
        dispatch(text, MotionEvent.ACTION_UP, 1, y);
        check(forwarded[0] == 2, "ordinary message touches retain Twitch's listener");
        dispatch(text, MotionEvent.ACTION_DOWN, x, y);
        dispatch(text, MotionEvent.ACTION_CANCEL, x, y);
        dispatch(text, MotionEvent.ACTION_UP, 1, y);
        check(forwarded[0] == 3, "cancelled gestures release the external emote handler");
        Window window = new ProbeWindow(context);
        SettingsWindow.configure(window, Color.BLACK);
        check(window.getAttributes().width == -1 && window.getAttributes().height == -1, "settings window fills its bounds");
        check(window.getAttributes().layoutInDisplayCutoutMode == WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_DEFAULT,
                "settings retain default cutout handling without customization");
        check((window.getAttributes().softInputMode & WindowManager.LayoutParams.SOFT_INPUT_MASK_ADJUST) == WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE,
                "keyboard resizing is retained");
        check(((android.graphics.drawable.ColorDrawable) window.getDecorView().getBackground()).getColor() == Color.BLACK,
                "settings window has an opaque background");
        SettingsWindowProbe.verify(context);
        System.out.println("PASS replay touch routing and live settings-window system bars, cutout, rotation and lifecycle");
    }

    private static void dispatch(TextView view, int action, float x, float y) {
        MotionEvent event = MotionEvent.obtain(0, 1, action, x, y, 0);
        try { view.dispatchTouchEvent(event); }
        finally { event.recycle(); }
    }

    private static void check(boolean value, String message) { if (!value) throw new AssertionError(message); }
}
