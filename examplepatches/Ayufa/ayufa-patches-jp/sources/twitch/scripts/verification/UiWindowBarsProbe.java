import android.content.Context;
import android.view.WindowInsets;
import android.view.WindowInsetsController;
import android.view.WindowManager;
import dev.twitchpatches.extension.ui.UiWindowBars;
import java.lang.reflect.Proxy;

final class UiWindowBarsProbe {
    static void verify(Context context) {
        int status = WindowInsets.Type.statusBars(), navigation = WindowInsets.Type.navigationBars();
        int[] state = {0, 1, 0};
        WindowInsetsController controller = (WindowInsetsController) Proxy.newProxyInstance(
                WindowInsetsController.class.getClassLoader(), new Class<?>[] {WindowInsetsController.class}, (p, method, args) -> {
                    switch (method.getName()) {
                        case "hide": state[0] |= (Integer) args[0]; state[2]++; return null;
                        case "show": state[0] &= ~(Integer) args[0]; state[2]++; return null;
                        case "getSystemBarsBehavior": return state[1];
                        case "setSystemBarsBehavior": state[1] = (Integer) args[0]; return null;
                        default: throw new UnsupportedOperationException(method.getName());
                    }
                });
        var window = new ProbeWindow(context) {
            @Override public WindowInsetsController getInsetsController() { return controller; }
        };
        UiWindowBars bars = new UiWindowBars();
        for (int cycle = 0; cycle < 5; cycle++) {
            bars.hostRequested(false);
            bars.apply(window, true, true);
            check(state[0] == (status | navigation), "both hidden");
            check(window.getAttributes().layoutInDisplayCutoutMode == WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_SHORT_EDGES, "cutout enabled");
            int commands = state[2];
            for (int i = 0; i < 30; i++) bars.apply(window, true, true);
            check(state[2] == commands, "layout must not fight the controller");
            controller.show(status | navigation);
            controller.setSystemBarsBehavior(0);
            bars.hostRequested(false);
            bars.apply(window, true, true);
            check(state[0] == (status | navigation), "host reset corrected");
            bars.apply(window, false, true);
            check(state[0] == navigation, "status independently restored");
            bars.apply(window, false, false);
            check(state[0] == 0 && state[1] == 0, "host visibility and behavior restored");
            check(window.getAttributes().layoutInDisplayCutoutMode == 0, "cutout restored");
            bars.apply(window, true, true);
            controller.show(status | navigation);
            bars.invalidate();
            bars.apply(window, true, true);
            check(state[0] == (status | navigation), "focus recovery");
            controller.hide(status | navigation);
            controller.setSystemBarsBehavior(1);
            bars.hostRequested(true);
            bars.apply(window, true, true);
            bars.apply(window, false, false);
            check(state[0] == (status | navigation) && state[1] == 1, "retain native immersive request");
            controller.show(status | navigation);
        }
        System.out.println("PASS WindowInsetsController: five live cycles, independent restoration, host override, focus and no layout loop");
    }
    private static void check(boolean condition, String label) { if (!condition) throw new AssertionError(label); }
}
