package app.template.extension.extension;

import java.util.function.BooleanSupplier;
import java.util.function.Consumer;

/** Retries asynchronous map operations while their originating route is still active. */
final class RouteMapReadyRetry {
    static void start(BooleanSupplier active, Consumer<Runnable> schedule,
                      Consumer<Consumer<Boolean>> attempt) {
        run(active, schedule, attempt, 0);
    }

    private static void run(BooleanSupplier active, Consumer<Runnable> schedule,
                            Consumer<Consumer<Boolean>> attempt, int count) {
        if (!active.getAsBoolean()) return;
        attempt.accept(ready -> {
            if (!ready && count < 39 && active.getAsBoolean()) {
                schedule.accept(() -> run(active, schedule, attempt, count + 1));
            }
        });
    }
}
