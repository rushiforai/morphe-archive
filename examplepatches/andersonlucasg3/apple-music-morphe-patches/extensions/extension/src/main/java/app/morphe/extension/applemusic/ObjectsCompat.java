package app.morphe.extension.applemusic;

import java.util.Objects;
import java.util.function.Supplier;

/**
 * API 29 replacement for the {@link Objects#requireNonNullElse} family, which was added in
 * API 30. Apple Music 7.0.0 is compiled with minSdk 30, so R8 kept these calls without any
 * SDK_INT guard; the DiLink patch redirects them here (same descriptors, same semantics).
 */
public final class ObjectsCompat {

    private ObjectsCompat() {
    }

    public static <T> T requireNonNullElse(T obj, T defaultObj) {
        return obj != null ? obj : Objects.requireNonNull(defaultObj, "defaultObj");
    }

    public static <T> T requireNonNullElseGet(T obj, Supplier<? extends T> supplier) {
        return obj != null
                ? obj
                : Objects.requireNonNull(
                        Objects.requireNonNull(supplier, "supplier").get(),
                        "supplier.get()");
    }
}
