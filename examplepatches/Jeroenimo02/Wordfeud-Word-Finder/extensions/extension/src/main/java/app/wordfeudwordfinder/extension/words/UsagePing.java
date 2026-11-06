package app.wordfeudwordfinder.extension.words;

import app.wordfeudwordfinder.extension.core.Storage;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.TimeZone;
import java.util.function.LongSupplier;

/**
 * One anonymous usage ping per day (UTC) for the maintainer's usage numbers: when Wordfeud has shown the games of
 * the day for the first time, the patch version and the rulesets of the player's games are sent to the report worker
 * ({@link WordReporter#ping}). Nothing else (no user name, game or device id). The day of the last successful ping is
 * kept in {@code usage-ping.txt}; without network the next games list tries again. Off when reporting is off.
 */
public final class UsagePing {
    static final String FILE = "usage-ping.txt";

    private final Storage storage;
    private final WordReporter reporter;
    private final LongSupplier clock;
    private boolean sending;
    private String sentDay;

    public UsagePing(Storage storage, WordReporter reporter, LongSupplier clock) {
        this.storage = storage;
        this.reporter = reporter;
        this.clock = clock;
    }

    static String day(long millis) {
        SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd", Locale.ROOT);
        f.setTimeZone(TimeZone.getTimeZone("UTC"));
        return f.format(new Date(millis));
    }

    private String lastDay() {
        if (sentDay != null) return sentDay;
        try {
            String t = storage.readText(FILE);
            sentDay = t == null ? "" : t.trim();
        } catch (IOException | RuntimeException e) {
            sentDay = "";
        }
        return sentDay;
    }

    /** Called after each games list; sends the ping when none was sent today. Never throws. */
    public void onGames(Collection<Integer> rulesets) {
        try {
            if (reporter == null || !reporter.enabled() || rulesets == null || rulesets.isEmpty()) return;
            final String today = day(clock.getAsLong());
            synchronized (this) {
                if (sending || today.equals(lastDay())) return;
                sending = true;
            }
            List<Integer> sorted = new ArrayList<>(rulesets);
            Collections.sort(sorted);
            reporter.ping(sorted, () -> {
                synchronized (this) {
                    sentDay = today;
                }
                try {
                    storage.writeTextAtomic(FILE, today);
                } catch (IOException | RuntimeException e) {
                    // remembered in memory for this session
                }
            }, () -> {
                synchronized (this) {
                    sending = false;
                }
            });
        } catch (RuntimeException e) {
            synchronized (this) {
                sending = false;
            }
        }
    }
}
