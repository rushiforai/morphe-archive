import java.util.Objects;
import android.content.ClipboardManager;
import android.content.Context;
import app.afterglow.extension.Afterglow;
import app.afterglow.extension.InstalledTweaks;
import app.afterglow.extension.menus.LongPressTools;
import app.afterglow.extension.settings.LiteMode;
import app.afterglow.extension.video.VideoState;

/** Execute the production hook against an observable clipboard and native readiness command. */
public final class LongPressToolsTest {
    private static int checks;
    private static final LongPressTools.PauseCommand READY = () -> true;
    private static void check(String name, Object expected, Object actual) {
        checks++;
        if (!Objects.equals(expected, actual)) throw new AssertionError(name + ": " + actual);
    }
    private static void unchanged(String name, LongPressTools.PauseCommand command) {
        int before = ClipboardManager.writes;
        String text = ClipboardManager.text;
        LongPressTools.pauseClicked(command);
        check(name + " writes", before, ClipboardManager.writes);
        check(name + " clipboard", text, ClipboardManager.text);
    }
    public static void main(String[] args) {
        unchanged("default OFF", READY);
        LiteMode.enabled = true;
        InstalledTweaks.installed = false;
        unchanged("owner absent", READY);
        InstalledTweaks.installed = true;
        unchanged("missing native command", null);
        unchanged("native controls not ready", () -> false);
        VideoState.ad = true;
        unchanged("native ad", READY);
        VideoState.ad = false;
        VideoState.shorts = true;
        unchanged("Shorts in front", READY);
        VideoState.shorts = false;
        VideoState.foreground = false;
        unchanged("minimized or closed player", READY);
        VideoState.foreground = true;
        VideoState.time = -1;
        unchanged("unknown native time", READY);
        VideoState.time = 61999;
        VideoState.id = "";
        unchanged("missing video identity", READY);
        VideoState.id = "rfscVS0vtbw";
        LongPressTools.pauseClicked(READY);
        check("native content pause copies once", 1, ClipboardManager.writes);
        check("canonical URL", "https://www.youtube.com/watch?v=rfscVS0vtbw&t=61s", ClipboardManager.text);
        VideoState.id = "aqz-KE-bpKQ";
        VideoState.time = 0;
        LongPressTools.pauseClicked(READY);
        check("navigation uses current identity", "https://www.youtube.com/watch?v=aqz-KE-bpKQ&t=0s", ClipboardManager.text);
        LiteMode.enabled = false;
        unchanged("live OFF or reset", READY);
        LiteMode.enabled = true;
        ClipboardManager.fail = true;
        unchanged("clipboard write failure", READY);
        check("write failure is logged", 1, Afterglow.errors);
        ClipboardManager.fail = false;
        Context.serviceAvailable = false;
        unchanged("missing clipboard service", READY);
        check("missing service is logged", 2, Afterglow.errors);
        Context.serviceAvailable = true;
        Afterglow.context = null;
        unchanged("missing application context", READY);
        check("missing context is logged", 3, Afterglow.errors);
        System.out.println(checks + " long-press clipboard checks passed");
    }
}
