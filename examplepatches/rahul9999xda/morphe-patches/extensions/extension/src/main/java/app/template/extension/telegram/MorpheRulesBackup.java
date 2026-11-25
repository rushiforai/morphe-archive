package app.template.extension.telegram;

import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.os.Build;

import java.io.File;
import java.io.FileOutputStream;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.Locale;

/** App-private daily snapshots; manual export/import is handled by the Settings Activity. */
public final class MorpheRulesBackup {
    private static final long DAY_MS = 24L * 60L * 60L * 1000L;
    private static final String DIR = "morphe-rule-backups";
    private MorpheRulesBackup() { }

    public static void schedule(Context context) {
        try {
            Context app = context.getApplicationContext();
            AlarmManager alarm = (AlarmManager) app.getSystemService(Context.ALARM_SERVICE);
            if (alarm == null) return;
            Intent intent = new Intent(app, MorpheRulesBackupReceiver.class).setAction(MorpheRulesBackupReceiver.ACTION_DAILY);
            int flags = PendingIntent.FLAG_UPDATE_CURRENT;
            if (Build.VERSION.SDK_INT >= 23) flags |= PendingIntent.FLAG_IMMUTABLE;
            PendingIntent pending = PendingIntent.getBroadcast(app, 73142, intent, flags);
            long first = app.getSharedPreferences("morphe_backup", Context.MODE_PRIVATE).getLong("next", 0L);
            if (first <= System.currentTimeMillis()) first = System.currentTimeMillis() + DAY_MS;
            app.getSharedPreferences("morphe_backup", Context.MODE_PRIVATE).edit().putLong("next", first).apply();
            if (Build.VERSION.SDK_INT >= 23) alarm.setAndAllowWhileIdle(AlarmManager.RTC_WAKEUP, first, pending);
            else alarm.set(AlarmManager.RTC_WAKEUP, first, pending);
        } catch (Throwable ignored) { }
    }

    public static boolean create(Context context) {
        try {
            Context app = context.getApplicationContext();
            SharedPreferencesForwardingRuleStore store = new SharedPreferencesForwardingRuleStore(app);
            File dir = new File(app.getFilesDir(), DIR);
            if (!dir.exists() && !dir.mkdirs()) return false;
            // Millisecond precision prevents two launches in the same second from colliding.
            String stamp = new SimpleDateFormat("yyyyMMdd-HHmmss-SSS", Locale.US).format(new Date());
            File target = new File(dir, "morphe-rules-" + stamp + ".json");
            File temp = new File(dir, target.getName() + ".tmp");
            byte[] bytes = store.exportBackupJson().getBytes(StandardCharsets.UTF_8);
            try (FileOutputStream out = new FileOutputStream(temp)) { out.write(bytes); out.getFD().sync(); }
            if (!temp.renameTo(target)) { if (!temp.delete()) { } return false; }
            File[] files = dir.listFiles((d, name) -> name.startsWith("morphe-rules-") && name.endsWith(".json"));
            if (files != null && files.length > 7) {
                Arrays.sort(files, (a, b) -> Long.compare(b.lastModified(), a.lastModified()));
                for (int i = 7; i < files.length; i++) files[i].delete();
            }
            return true;
        } catch (Throwable ignored) { return false; }
    }

    public static void runDaily(Context context) {
        create(context);
        context.getSharedPreferences("morphe_backup", Context.MODE_PRIVATE).edit()
                .putLong("next", System.currentTimeMillis() + DAY_MS).apply();
        schedule(context);
    }
}
