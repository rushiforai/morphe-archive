package app.template.extension.shatteredpixeldungeon;

import android.util.Log;

import com.watabou.noosa.Group;

import java.io.File;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

/**
 * Keeps the error behind a crash, so the next time the game opens it can be shown and copied to send on.
 */
@SuppressWarnings("unused")
public final class CrashLog {

	private static final String TAG = "CrashLog";
	private static final String FILE = "cloverlord_crash.txt";

	private CrashLog() {
	}

	/**
	 * Called at the start of AndroidLauncher.onCreate. Records any crash before the game closes.
	 */
	public static void install() {
		Thread.UncaughtExceptionHandler previous = Thread.getDefaultUncaughtExceptionHandler();
		if (previous instanceof Recorder) return;
		Thread.setDefaultUncaughtExceptionHandler(new Recorder(previous));
	}

	private static final class Recorder implements Thread.UncaughtExceptionHandler {
		private final Thread.UncaughtExceptionHandler previous;

		Recorder(Thread.UncaughtExceptionHandler previous) {
			this.previous = previous;
		}

		@Override
		public void uncaughtException(Thread thread, Throwable error) {
			try {
				File file = file();
				if (file != null) FileHelpers.write(file, describe(thread, error).getBytes(StandardCharsets.UTF_8));
			} catch (Throwable ignored) {
			}
			if (previous != null) previous.uncaughtException(thread, error);
		}
	}

	private static String describe(Thread thread, Throwable error) {
		StringWriter trace = new StringWriter();
		error.printStackTrace(new PrintWriter(trace));
		String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.US).format(new Date());
		return "Crash at " + time + " on thread " + thread.getName() + "\n\n" + trace;
	}

	private static File file() {
		File base = SaveLocation.privateDir();
		return base == null ? null : new File(base, FILE);
	}

	/**
	 * The error from the last crash, or null when there wasn't one.
	 */
	static String last() {
		File file = file();
		if (file == null || !file.isFile()) return null;
		try {
			return new String(FileHelpers.read(file), StandardCharsets.UTF_8);
		} catch (Throwable e) {
			Log.e(TAG, "Could not read the crash log", e);
			return null;
		}
	}

	static void clear() {
		File file = file();
		if (file != null) file.delete();
	}

	/**
	 * Shows the error from the last crash on the title screen. Returns true when it did.
	 */
	static boolean showIfAny(Group scene) {
		String text = last();
		if (text == null) return false;
		scene.addToFront(new CrashWindow(text));
		return true;
	}

	/**
	 * The last crash's error, with buttons to copy it and to dismiss it.
	 */
	static final class CrashWindow extends EditorWindow {

		private static final int SHOWN_LENGTH = 700;

		private final String text;

		CrashWindow(String text) {
			super();
			this.text = text;
			addTitle("The game crashed");
			addHint("The error below is what made it close. Copy it and send it on so it can be fixed.");
			addHint(text.length() > SHOWN_LENGTH ? text.substring(0, SHOWN_LENGTH) + "..." : text);
			float half = (WIDTH - GAP) / 2f;
			addButton("Copy", 0, half, () -> {
				if (!SaveLocation.copyText("Crash", text)) com.shatteredpixel.shatteredpixeldungeon.utils.GLog.w("Could not copy the error.");
			});
			addButton("Dismiss", half + GAP, half, () -> {
				clear();
				hide();
			});
			pos += ROW_HEIGHT;
			finish();
		}

		@Override
		protected void reopen() {
			show(new CrashWindow(text));
		}
	}
}
