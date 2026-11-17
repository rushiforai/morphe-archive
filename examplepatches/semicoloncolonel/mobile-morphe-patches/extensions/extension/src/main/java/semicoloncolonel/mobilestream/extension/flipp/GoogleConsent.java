package semicoloncolonel.mobilestream.extension.flipp;

import java.lang.reflect.Method;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * Registers the launcher for Google's consent screen in Flipp's Google sign-in.
 *
 * Flipp asks for Google access only after the account is picked, and when the
 * answer needs a consent screen it registers the launcher for it with
 * registerForActivityResult. The activity is already resumed by then, so
 * AndroidX refuses and sign-in fails with "An unexpected error occurred".
 * Google Play services rarely asks for consent there, but GmsCore does.
 *
 * The activity's ActivityResultRegistry also takes a launcher without a
 * lifecycle owner, which can be registered at any time. The contract and the
 * callback are Flipp's own, so the result goes back to Flipp as before.
 */
@SuppressWarnings("unused")
public final class GoogleConsent {
    private static final AtomicInteger NEXT = new AtomicInteger();

    private GoogleConsent() {
    }

    /** Called instead of ComponentActivity.registerForActivityResult(contract, callback). */
    public static Object register(Object activity, Object contract, Object callback) throws Exception {
        Object registry = activity.getClass().getMethod("getActivityResultRegistry").invoke(activity);
        for (Method method : registry.getClass().getMethods()) {
            Class<?>[] parameters = method.getParameterTypes();
            if (parameters.length == 3 && parameters[0] == String.class
                    && parameters[1].isInstance(contract) && parameters[2].isInstance(callback)) {
                return method.invoke(registry, "mobilestream_google_consent_" + NEXT.incrementAndGet(), contract, callback);
            }
        }
        throw new IllegalStateException("No ActivityResultRegistry.register(String, contract, callback)");
    }
}
