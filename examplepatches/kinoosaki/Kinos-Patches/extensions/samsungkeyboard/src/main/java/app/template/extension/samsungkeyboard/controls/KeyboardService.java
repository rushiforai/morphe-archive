package app.template.extension.samsungkeyboard.controls;

import android.inputmethodservice.InputMethodService;

import java.lang.ref.WeakReference;

/**
 * The running keyboard service, remembered by a hook at the start of HoneyBoardService.onCreate.
 * Held weakly. Used where a view's context cannot be unwrapped to the service.
 */
@SuppressWarnings("unused")
public final class KeyboardService {
    private static volatile WeakReference<InputMethodService> current;

    /** Patched in at the start of HoneyBoardService.onCreate. */
    public static void set(InputMethodService service) {
        current = service == null ? null : new WeakReference<>(service);
    }

    /** The keyboard service, or null before it was created or after it was collected. */
    public static InputMethodService get() {
        WeakReference<InputMethodService> reference = current;
        return reference == null ? null : reference.get();
    }

    private KeyboardService() { }
}
