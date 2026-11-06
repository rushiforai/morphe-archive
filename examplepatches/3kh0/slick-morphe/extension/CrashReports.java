package slick.android;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.os.Build;
import android.os.Bundle;
import android.util.AtomicFile;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.nio.charset.StandardCharsets;
import java.time.Instant;

public final class CrashReports {
  private static boolean installed;
  private static volatile boolean reportActive;
  private static final Object STORAGE_LOCK = new Object();

  private CrashReports() {}

  public static synchronized void install(Application app) {
    if (installed) return;
    String metadata = metadata(app);
    Thread.UncaughtExceptionHandler previous = Thread.getDefaultUncaughtExceptionHandler();
    Thread.setDefaultUncaughtExceptionHandler((thread, error) -> {
      try {
        write(app, !reportActive, formatReport(error, metadata));
      } catch (Throwable ignored) {
      } finally {
        try {
          if (previous != null) previous.uncaughtException(thread, error);
        } finally {
          android.os.Process.killProcess(android.os.Process.myPid());
          System.exit(10);
        }
      }
    });
    app.registerActivityLifecycleCallbacks(
        new Application.ActivityLifecycleCallbacks() {
          @Override
          public void onActivityPreCreated(Activity activity, Bundle state) {
            if (activity instanceof CrashReportActivity) reportActive = true;
          }

          @Override
          public void onActivityResumed(Activity activity) {
            if ((reportActive = activity instanceof CrashReportActivity)
                || activity.isFinishing()
                || activity.isDestroyed()) return;
            synchronized (STORAGE_LOCK) {
              try {
                String saved = readRecord(app);
                if (saved == null || !saved.startsWith("1\n")) return;
                write(app, false, saved.substring(2));
              } catch (IOException | RuntimeException ignored) {
                return;
              }
            }
            try {
              show(activity);
            } catch (RuntimeException ignored) {
              // manual entry still here!
            }
          }

          @Override
          public void onActivityCreated(Activity a, Bundle b) {}

          @Override
          public void onActivityStarted(Activity a) {}

          @Override
          public void onActivityPaused(Activity a) {}

          @Override
          public void onActivityStopped(Activity a) {}

          @Override
          public void onActivitySaveInstanceState(Activity a, Bundle b) {}

          @Override
          public void onActivityDestroyed(Activity a) {
            if (a instanceof CrashReportActivity) reportActive = false;
          }
        });
    installed = true;
  }

  public static void show(Context context) {
    Intent i = new Intent(context, CrashReportActivity.class);
    context.startActivity(
        context instanceof Activity ? i : i.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
  }

  static String latest(Context context) {
    synchronized (STORAGE_LOCK) {
      try {
        String r = readRecord(context);
        return r == null ? "No saved Java crash report." : r.substring(2);
      } catch (IOException | RuntimeException e) {
        return "The saved crash report could not be read.";
      }
    }
  }

  private static AtomicFile file(Context context) {
    return new AtomicFile(new File(context.getNoBackupFilesDir(), "slick-java-crash.txt"));
  }

  private static String readRecord(Context context) throws IOException {
    String record;
    try {
      record = new String(file(context).readFully(), StandardCharsets.UTF_8);
    } catch (FileNotFoundException e) {
      return null;
    }
    if (!record.startsWith("1\n") && !record.startsWith("0\n"))
      throw new IOException("Invalid crash record");
    return record;
  }

  private static void write(Context context, boolean pending, String report) throws IOException {
    synchronized (STORAGE_LOCK) {
      AtomicFile file = file(context);
      FileOutputStream out = file.startWrite();
      try {
        out.write(((pending ? "1\n" : "0\n") + report).getBytes(StandardCharsets.UTF_8));
        out.flush();
        out.getFD().sync();
        file.finishWrite(out);
      } catch (IOException | RuntimeException | Error e) {
        file.failWrite(out);
        throw e;
      }
    }
  }

  static String formatReport(Throwable error, String metadata) {
    StringWriter trace = new StringWriter();
    error.printStackTrace(new PrintWriter(trace));
    return "Slick "
        + Version.NAME
        + " Java crash report\nTime (UTC): "
        + Instant.now()
        + "\n"
        + metadata
        + "\n"
        + "Only uncaught Java exceptions are captured; native crashes and ANRs are not caught.\n"
        + "Slick saves this report locally and adds no uploads. Slack's existing crash reporting is"
        + " unchanged.\n"
        + "Review for sensitive data before sharing.\n\n"
        + trace;
  }

  private static String metadata(Context context) {
    String version = "unavailable";
    try {
      PackageInfo p = context.getPackageManager().getPackageInfo(context.getPackageName(), 0);
      version = p.versionName + " (" + p.getLongVersionCode() + ")";
    } catch (Exception ignored) {
    }
    return "App: "
        + context.getPackageName()
        + "\nVersion: "
        + version
        + "\nAndroid: "
        + Build.VERSION.RELEASE
        + " (API "
        + Build.VERSION.SDK_INT
        + ")"
        + "\nBuild: "
        + Build.DISPLAY
        + "\n";
  }
}
