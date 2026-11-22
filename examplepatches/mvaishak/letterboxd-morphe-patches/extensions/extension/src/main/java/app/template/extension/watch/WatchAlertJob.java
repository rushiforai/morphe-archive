package app.template.extension.watch;

import android.app.job.JobParameters;
import android.app.job.JobService;
import android.net.Network;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import org.json.JSONException;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Set;

import static app.template.extension.watch.WatchAvailability.*;

public final class WatchAlertJob extends JobService {
    private Thread worker;

    @Override
    public boolean onStartJob(JobParameters parameters) {
        if (!WatchAlerts.notificationsEnabled(this)) return false;
        var reminders = WatchAlerts.all(this);
        if (reminders.isEmpty()) {
            WatchAlerts.stopWhenEmpty(this);
            return false;
        }
        if (new WatchPreferences(this).selections().isEmpty()) return false;

        Network network = parameters.getNetwork();
        worker = new Thread(() -> {
            try {
                for (WatchAlerts.Reminder reminder : reminders.values()) {
                    if (Thread.currentThread().isInterrupted()) return;
                    check(reminder, network);
                }
            } finally {
                Thread run = Thread.currentThread();
                new Handler(Looper.getMainLooper()).post(() -> {
                    if (worker != run) return;
                    worker = null;
                    jobFinished(parameters, false);
                    WatchAlerts.stopWhenEmpty(this);
                });
            }
        }, "letterboxd-streaming-reminders");
        worker.start();
        return true;
    }

    private void check(WatchAlerts.Reminder reminder, Network network) {
        for (Map.Entry<String, Set<Integer>> market : new WatchPreferences(this).selections().entrySet()) {
            if (Thread.currentThread().isInterrupted()) return;
            String region = market.getKey();
            try {
                List<Offer> offers = JustWatch.availability(reminder.film, region, network).offers();
                if (Thread.currentThread().isInterrupted()) return;
                Set<Integer> current = new WatchPreferences(this).services(region);
                Offer arrival = WatchAlertRules.arrival(reminder.known.get(region), offers, current);
                if (arrival != null) {
                    WatchAlerts.complete(this, reminder, arrival);
                    return;
                }
                reminder.known.put(region, WatchAlertRules.available(offers));
            } catch (IOException | JSONException | RuntimeException error) {
                Log.w("MorpheStreaming", "Could not check region " + region, error);
            }
        }
        if (!Thread.currentThread().isInterrupted()) WatchAlerts.complete(this, reminder, null);
    }

    @Override
    public boolean onStopJob(JobParameters parameters) {
        if (worker != null) {
            worker.interrupt();
            worker = null;
        }
        return true;
    }
}
