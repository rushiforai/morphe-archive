package app.template.extension.niagaralauncher;

import java.time.ZoneId;
import java.util.*;
import java.util.concurrent.*;

/** Provider orchestration, shared by the Android engine and host integration tests. */
public final class WeatherSelection {
    public interface Loader {
        WeatherData load(WeatherSource source) throws Exception;
    }

    public static WeatherData select(
            List<WeatherSource> profiles,
            boolean aggregate,
            Loader loader,
            long now,
            ZoneId zone,
            long timeoutMs,
            Runnable stillCurrent)
            throws Exception {
        List<WeatherSource> enabled = new ArrayList<>();
        for (WeatherSource s : profiles) if (s.enabled) enabled.add(s);
        if (enabled.isEmpty()) throw new IllegalArgumentException("No enabled sources");
        List<WeatherData> results = new ArrayList<>();
        long deadline = System.nanoTime() + TimeUnit.MILLISECONDS.toNanos(timeoutMs);
        ExecutorService pool =
                Executors.newFixedThreadPool(
                        aggregate ? enabled.size() : 1,
                        r -> {
                            Thread t = new Thread(r, "Niagara-weather-source");
                            t.setDaemon(true);
                            return t;
                        });
        List<Future<WeatherData>> futures = new ArrayList<>();
        try {
            if (aggregate) {
                for (WeatherSource s : enabled) futures.add(pool.submit(() -> loader.load(s)));
                for (Future<WeatherData> f : futures) {
                    long left = deadline - System.nanoTime();
                    if (left <= 0 && !f.isDone()) continue;
                    try {
                        results.add(f.get(Math.max(0, left), TimeUnit.NANOSECONDS));
                    } catch (ExecutionException | TimeoutException ignored) {
                    }
                    stillCurrent.run();
                }
            } else
                for (WeatherSource s : enabled) {
                    stillCurrent.run();
                    long left = deadline - System.nanoTime();
                    if (left <= 0) break;
                    Future<WeatherData> f = pool.submit(() -> loader.load(s));
                    futures.add(f);
                    try {
                        results.add(f.get(left, TimeUnit.NANOSECONDS));
                    } catch (ExecutionException ignored) {
                    } catch (TimeoutException e) {
                        break;
                    }
                    stillCurrent.run();
                    if (WeatherData.complete(WeatherData.merge(results, false), now, zone)) break;
                }
            stillCurrent.run();
            return WeatherData.merge(results, aggregate);
        } finally {
            for (Future<?> f : futures) if (!f.isDone()) f.cancel(true);
            pool.shutdownNow();
        }
    }
}
