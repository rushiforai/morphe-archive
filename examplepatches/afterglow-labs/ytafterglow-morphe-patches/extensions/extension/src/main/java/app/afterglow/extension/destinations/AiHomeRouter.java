package app.afterglow.extension.destinations;

import android.app.Activity;
import android.view.View;
import java.lang.ref.WeakReference;
import java.util.List;
import app.afterglow.extension.Afterglow;

/** Native routes are offered only while a verified controller remains attached to its activity. */
public final class AiHomeRouter {
    public interface NativeHost {
        View afterglow_aiRoot();
        String afterglow_aiBrowseId();
        List<?> afterglow_aiChips();
        boolean afterglow_aiDispatch(byte[] command);
    }
    public interface NativeChip {
        int afterglow_aiStyle();
        byte[] afterglow_aiCommand();
    }
    public static final class Capability {
        public final boolean nativeEntry, runPrompt;
        public final String message;
        Capability(boolean entry, boolean run) {
            nativeEntry = entry; runPrompt = run;
            message = entry ? (run ? "YouTube's native custom feed can accept a prompt." : "YouTube's native custom-feed control is available. Paste your prompt into its editor.")
                    : "The native custom-feed control is not currently available to Afterglow. You can still save prompts here and use the prompt text box at the top of Home when YouTube provides it.";
        }
    }
    private static WeakReference<NativeHost> host = new WeakReference<>(null);
    private static WeakReference<View> home = new WeakReference<>(null);
    private AiHomeRouter() {}

    /** Called only from the verified native tab binding; never discovers tabs by translated text. */
    public static void captureHome(View view) { home = new WeakReference<>(view); }
    /** Captures the native Home controller, then reads its current chip model for every action. */
    public static void captureCustomFeed(NativeHost controller) {
        try { if (controller != null && "FEwhat_to_watch".equals(controller.afterglow_aiBrowseId())) host = new WeakReference<>(controller); }
        catch (Throwable error) { Afterglow.error("AiHomeRouter.capture", error); }
    }
    public static void clear() { host.clear(); }
    public static Capability capability() {
        try { byte[] command = selectedCommand(validHost()); return new Capability(command != null, command != null && AiHomeCommand.supportsPrompt(command)); }
        catch (Throwable error) { clear(); return new Capability(false, false); }
    }
    public static boolean openNativeEntry() {
        NativeHost controller = validHost();
        try { byte[] command = selectedCommand(controller); return command != null && controller.afterglow_aiDispatch(command); }
        catch (Throwable error) { clear(); Afterglow.error("AiHomeRouter.entry", error); return false; }
    }
    public static boolean runPrompt(String prompt) {
        NativeHost controller = validHost();
        try {
            byte[] command = selectedCommand(controller);
            return command != null && AiHomeCommand.supportsPrompt(command) && controller.afterglow_aiDispatch(AiHomeCommand.withPrompt(command, prompt));
        }
        catch (Throwable error) { clear(); Afterglow.error("AiHomeRouter.prompt", error); return false; }
    }
    public static boolean openNormalHome() {
        View view = home.get();
        try {
            if (validView(view) && view.isEnabled() && view.performClick()) return true;
            NativeHost controller = validHost();
            return controller != null && controller.afterglow_aiDispatch(AiHomeCommand.normalHome());
        } catch (Throwable error) { Afterglow.error("AiHomeRouter.home", error); return false; }
    }
    private static NativeHost validHost() {
        NativeHost controller = host.get();
        try { if (controller != null && "FEwhat_to_watch".equals(controller.afterglow_aiBrowseId())
                && validView(controller.afterglow_aiRoot()) && controller.afterglow_aiRoot().isShown()) return controller; }
        catch (Throwable ignored) {}
        return null;
    }
    private static byte[] selectedCommand(NativeHost controller) {
        if (controller == null) return null;
        List<?> chips = controller.afterglow_aiChips();
        if (chips == null || chips.size() > 128) return null;
        byte[] selected = null;
        for (Object object : chips) {
            if (!(object instanceof NativeChip)) continue;
            NativeChip chip = (NativeChip) object;
            // Stock enum explicitly identifies custom feed as 26; Ask/Search is 28.
            if (chip.afterglow_aiStyle() != 26) continue;
            byte[] command = chip.afterglow_aiCommand();
            if (!AiHomeCommand.nativeEntry(command)) return null;
            if (selected != null) return null; // ambiguous model: do not pick an arbitrary chip
            selected = command;
        }
        return selected;
    }
    private static boolean validView(View view) {
        Activity activity = Afterglow.mainActivity();
        return view != null && view.isAttachedToWindow() && activity != null && !activity.isFinishing() && !activity.isDestroyed()
                && activity.getWindow() != null && view.getRootView() == activity.getWindow().getDecorView().getRootView();
    }
}
