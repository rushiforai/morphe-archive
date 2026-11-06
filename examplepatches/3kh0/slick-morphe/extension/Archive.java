package slick.android;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.util.Log;
import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.function.Consumer;

public final class Archive {
  private static final ThreadLocal<WeakReference<Object>> handler = new ThreadLocal<>();
  private static final ThreadPoolExecutor io =
      new ThreadPoolExecutor(
          1,
          1,
          0,
          TimeUnit.SECONDS,
          new ArrayBlockingQueue<>(256),
          r -> new Thread(r, "Slick-history"),
          (r, executor) -> Log.w("Slick", "History queue full; event not archived"));
  private static SQLiteOpenHelper helper;

  public static void begin(Object source) {
    handler.remove();
    if (Settings.enabled("message_logger") || Settings.enabled("last_seen"))
      handler.set(new WeakReference<>(source));
  }

  private static Object take() {
    WeakReference<Object> r = handler.get();
    handler.remove();
    return r == null ? null : r.get();
  }

  private static String scope(Object owner) throws ReflectiveOperationException {
    return Accounts.scope(Host.get(owner, "loggedInUser"));
  }

  private static Object call(Object target, String method) throws ReflectiveOperationException {
    return target.getClass().getMethod(method).invoke(target);
  }

  public static void newMessage(Object message) {
    Object source = take();
    if (source == null) return;
    try {
      String scope = scope(source);
      snapshot(scope, Host.string(message, "channel"), message, "Received");
      if (Settings.enabled("last_seen")) {
        String user = Host.string(message, "user");
        long time = timestamp(Host.string(message, "ts"));
        if (user.matches("[UW][A-Z0-9]+") && time > 0)
          io.execute(() -> saveActivity(scope, user, time));
      }
    } catch (ReflectiveOperationException | RuntimeException e) {
      failed(e);
    }
  }

  public static void changed(Object event) {
    Object source = take();
    if (source == null || !Settings.enabled("message_logger")) return;
    try {
      String scope = scope(source), channel = (String) call(event, "getChannel");
      Object message = call(event, "getMessage"), previous = call(event, "getPreviousMessage");
      if (previous == null) previous = cached(source, channel, Host.string(message, "ts"));
      if (previous == null || Host.string(previous, "text").equals(Host.string(message, "text"))) {
        snapshot(scope, channel, message, "Observed");
        return;
      }
      snapshot(scope, channel, previous, "Before edit");
      snapshot(scope, channel, message, "Edited");
    } catch (ReflectiveOperationException | RuntimeException e) {
      failed(e);
    }
  }

  public static void deleted(Object event) {
    Object source = take();
    if (source == null || !Settings.enabled("message_logger")) return;
    try {
      String scope = scope(source),
          channel = (String) call(event, "getChannel"),
          ts = (String) call(event, "getDeletedTs");
      Object previous = cached(source, channel, ts);
      if (previous != null) snapshot(scope, channel, previous, "Deleted");
      else io.execute(() -> save(scope, channel, ts, "", null, "Deleted", null));
    } catch (ReflectiveOperationException | RuntimeException e) {
      failed(e);
    }
  }

  private static Object cached(Object source, String channel, String ts)
      throws ReflectiveOperationException {
    Object p = Host.get(source, "messagePersistenceHelper");
    Optional<?> r =
        (Optional<?>)
            p.getClass().getMethod("getMessage", String.class, String.class).invoke(p, channel, ts);
    return r.isPresent() ? Host.get(r.get(), "obj") : null;
  }

  public static void history(Object owner, Object chunk, String thread, Object trace) {
    if (!Settings.enabled("message_logger")) return;
    try {
      String scope = scope(owner), channel = Host.string(chunk, "conversationId");
      Object dao = Host.get(owner, "searchClogger");
      Method get =
          Class.forName("slack.persistence.messages.MessageDao")
              .getMethod(
                  "getMessage",
                  String.class,
                  String.class,
                  Class.forName("slack.telemetry.tracing.TraceContext"));
      for (Object message : (List<?>) Host.get(chunk, "messages")) {
        Object old =
            thread == null
                ? Host.get(get.invoke(dao, channel, Host.string(message, "ts"), trace), "obj")
                : null;
        boolean edited =
            old != null && !Host.string(old, "text").equals(Host.string(message, "text"));
        if (edited) snapshot(scope, channel, old, "Before edit");
        snapshot(scope, channel, message, edited ? "Edited" : "Observed", thread);
      }
      for (Object d : (List<?>) Host.get(chunk, "deletedMessages")) {
        String ts = (String) d;
        Object old = thread == null ? Host.get(get.invoke(dao, channel, ts, trace), "obj") : null;
        if (old != null) snapshot(scope, channel, old, "Deleted");
        else
          io.execute(
              () -> save(scope, channel, ts, "", null, "Deleted", thread == null ? "" : thread));
      }
    } catch (ReflectiveOperationException | RuntimeException e) {
      failed(e);
    }
  }

  private static void snapshot(String scope, String channel, Object message, String status)
      throws ReflectiveOperationException {
    snapshot(scope, channel, message, status, null);
  }

  private static void snapshot(
      String scope, String channel, Object message, String status, String requestThread)
      throws ReflectiveOperationException {
    if (!Settings.enabled("message_logger") || message == null) return;
    String ts = Host.string(message, "ts"),
        user = Host.string(message, "user"),
        text = Host.string(message, "text"),
        bounded = text.substring(0, Math.min(4000, text.length())),
        thread = requestThread == null ? Host.string(message, "threadTs") : requestThread;
    io.execute(() -> save(scope, channel, ts, user, bounded, status, thread));
  }

  static long timestamp(String value) {
    try {
      double seconds = Double.parseDouble(value);
      long ms = (long) (seconds * 1000);
      return Double.isFinite(seconds) && ms > 0 && ms <= System.currentTimeMillis() + 60000
          ? ms
          : 0;
    } catch (NumberFormatException e) {
      return 0;
    }
  }

  private static SQLiteDatabase database() {
    if (helper == null)
      helper =
          new SQLiteOpenHelper(Settings.context, "slick-history.db", null, 2) {
            @Override
            public void onCreate(SQLiteDatabase db) {
              db.execSQL(
                  "CREATE TABLE log (id INTEGER PRIMARY KEY, scope TEXT NOT NULL, channel TEXT NOT"
                      + " NULL, ts TEXT NOT NULL, user TEXT, text TEXT, status TEXT, recorded"
                      + " INTEGER, thread TEXT)");
              db.execSQL("CREATE INDEX log_message ON log(scope,channel,ts,id)");
              db.execSQL(
                  "CREATE TABLE activity (scope TEXT NOT NULL, user TEXT NOT NULL, seen INTEGER,"
                      + " PRIMARY KEY(scope,user))");
            }

            @Override
            public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
              if (oldVersion == 1 && newVersion == 2)
                db.execSQL("ALTER TABLE log ADD COLUMN thread TEXT");
              else throw new IllegalStateException("Unsupported history schema");
            }
          };
    return helper.getWritableDatabase();
  }

  private static void prune(SQLiteDatabase db, String scope) {
    String[] cutoff = {Long.toString(System.currentTimeMillis() - TimeUnit.DAYS.toMillis(30))};
    db.delete("log", "recorded < ?", cutoff);
    db.delete("activity", "seen < ?", cutoff);
    db.execSQL(
        "DELETE FROM log WHERE scope=? AND id NOT IN (SELECT id FROM log WHERE scope=? ORDER BY id"
            + " DESC LIMIT 1000)",
        new Object[] {scope, scope});
    db.execSQL(
        "DELETE FROM activity WHERE scope=? AND user NOT IN (SELECT user FROM activity WHERE"
            + " scope=? ORDER BY seen DESC LIMIT 2000)",
        new Object[] {scope, scope});
  }

  private static void save(
      String scope,
      String channel,
      String ts,
      String user,
      String text,
      String status,
      String thread) {
    if (scope == null || channel.isEmpty() || ts.isEmpty()) return;
    try {
      SQLiteDatabase db = database();
      prune(db, scope);
      String oldText = null, oldUser = null, oldThread = null;
      try (Cursor last =
          db.rawQuery(
              "SELECT text,user,status,thread FROM log WHERE scope=? AND channel=? AND ts=? ORDER"
                  + " BY id DESC LIMIT 1",
              new String[] {scope, channel, ts})) {
        if (last.moveToFirst()) {
          String t = last.getString(0),
              u = last.getString(1),
              st = last.getString(2),
              th = last.getString(3);
          if (text == null) {
            text = t;
            user = u;
          }
          if (thread == null) thread = th;
          if (status.equals("Observed") && !st.equals("Deleted")) {
            if (text.equals(t)) return;
            oldText = t;
            oldUser = u;
            oldThread = th;
          }
          if (text.equals(t) && status.equals(st)) return;
        }
      }
      if (oldText != null) save(scope, channel, ts, oldUser, oldText, "Before edit", oldThread);
      if (status.equals("Observed")) status = oldText == null ? "Received" : "Edited";
      ContentValues row = new ContentValues();
      row.put("scope", scope);
      row.put("channel", channel);
      row.put("ts", ts);
      row.put("user", user);
      row.put("text", text == null ? "[Content not observed]" : text);
      row.put("status", status);
      row.put("recorded", System.currentTimeMillis());
      row.put("thread", thread);
      db.insertOrThrow("log", null, row);
      db.execSQL(
          "DELETE FROM log WHERE scope=? AND channel=? AND ts=? AND id NOT IN (SELECT id FROM log"
              + " WHERE scope=? AND channel=? AND ts=? ORDER BY id DESC LIMIT 20)",
          new Object[] {scope, channel, ts, scope, channel, ts});
      prune(db, scope);
      InlineHistory.invalidate(scope, channel);
    } catch (RuntimeException e) {
      failed(e);
    }
  }

  private static void saveActivity(String scope, String user, long time) {
    try {
      SQLiteDatabase db = database();
      db.execSQL(
          "INSERT INTO activity(scope,user,seen) VALUES(?,?,?) ON CONFLICT(scope,user) DO UPDATE"
              + " SET seen=MAX(seen,excluded.seen)",
          new Object[] {scope, user, time});
      prune(db, scope);
    } catch (RuntimeException e) {
      failed(e);
    }
  }

  static void clear(String scope) {
    if (scope == null) return;
    io.execute(() -> {
      try {
        SQLiteDatabase db = database();
        db.delete("log", "scope=?", new String[] {scope});
        db.delete("activity", "scope=?", new String[] {scope});
        InlineHistory.invalidate(scope, null);
      } catch (RuntimeException e) {
        failed(e);
      }
    });
  }

  static void read(String scope, boolean activity, Consumer<String> callback) {
    if (scope == null) {
      callback.accept("No workspace identity available.");
      return;
    }
    io.execute(() -> {
      try {
        SQLiteDatabase db = database();
        prune(db, scope);
        StringBuilder text =
            new StringBuilder(
                activity
                    ? "Latest observed message activity (not last online).\n\n"
                    : "Latest 100 local text records.\n\n");
        if (!activity && lastError != null)
          text.append("Latest capture/storage error (may contain sensitive text):\n")
              .append(lastError)
              .append("\n\n");
        String sql =
            activity
                ? "SELECT user,seen FROM activity WHERE scope=? ORDER BY seen DESC LIMIT 100"
                : "SELECT channel,ts,user,text,status,recorded FROM log WHERE scope=? ORDER BY id"
                    + " DESC LIMIT 100";
        try (Cursor rows = db.rawQuery(sql, new String[] {scope})) {
          if (rows.getCount() == 0) text.append("No records yet.");
          while (rows.moveToNext()) {
            if (activity)
              text.append(rows.getString(0))
                  .append(" — ")
                  .append(DateFormat.getDateTimeInstance().format(new Date(rows.getLong(1))));
            else
              text.append(rows.getString(4))
                  .append(" · ")
                  .append(rows.getString(0))
                  .append(" · ")
                  .append(rows.getString(1))
                  .append("\n")
                  .append(rows.getString(2))
                  .append(": ")
                  .append(rows.getString(3));
            text.append("\n\n");
          }
        }
        callback.accept(text.toString());
      } catch (RuntimeException e) {
        failed(e);
        callback.accept("Could not read local history.\n\n" + lastError);
      }
    });
  }

  static final class Entry {
    final String ts, user, text, status, thread;

    Entry(String ts, String user, String text, String status, String thread) {
      this.ts = ts;
      this.user = user;
      this.text = text;
      this.status = status;
      this.thread = thread;
    }
  }

  static void inline(String scope, String channel, Consumer<List<Entry>> callback) {
    io.execute(() -> {
      List<Entry> result = new ArrayList<>();
      try {
        SQLiteDatabase db = database();
        prune(db, scope);
        try (Cursor rows =
            db.rawQuery(
                "SELECT ts,user,text,status,thread FROM log WHERE scope=? AND channel=? ORDER BY id"
                    + " ASC",
                new String[] {scope, channel})) {
          while (rows.moveToNext())
            result.add(
                new Entry(
                    rows.getString(0),
                    rows.getString(1),
                    rows.getString(2),
                    rows.getString(3),
                    rows.getString(4)));
        }
      } catch (RuntimeException e) {
        failed(e);
      }
      callback.accept(result);
    });
  }

  private static volatile String lastError;

  static void failed(Exception e) {
    lastError = Log.getStackTraceString(e);
    Log.e("Slick", "Local history operation failed", e);
  }
}
