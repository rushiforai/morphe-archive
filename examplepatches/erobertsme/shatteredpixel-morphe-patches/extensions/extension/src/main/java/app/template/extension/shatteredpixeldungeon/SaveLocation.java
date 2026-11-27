package app.template.extension.shatteredpixeldungeon;

import android.Manifest;
import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.os.Handler;
import android.os.Looper;
import android.provider.Settings;
import android.util.Log;

import java.io.File;
import java.io.IOException;

@SuppressWarnings("unused")
public class SaveLocation {

	private static final String TAG = "SaveLocation";
	private static final String PREFS = "morphe_save_location";
	private static final String KEY_DECLINED = "declined";
	private static final int REQUEST_CODE = 0x5A7E;

	private static Boolean redirect;

	/**
	 * Replaced by the patch with the folder chosen in the patch options.
	 */
	private static String getFolderName() {
		return "Documents/ShatteredPixelDungeon";
	}

	/**
	 * Called at the start of FileUtils.setDefaultFileProperties.
	 * Returns the Absolute file type when saves should be redirected, otherwise the original type.
	 */
	public static Object getFileType(Object original) {
		if (!shouldRedirect()) return original;
		if (!(original instanceof Enum)) return original;

		Object[] constants = original.getClass().getEnumConstants();
		if (constants == null) return original;
		for (Object constant : constants) {
			if (((Enum<?>) constant).name().equals("Absolute")) return constant;
		}
		Log.e(TAG, "Absolute file type not found, using internal storage");
		redirect = false;
		return original;
	}

	/**
	 * Called at the start of FileUtils.setDefaultFileProperties.
	 * Returns the base path of the public save folder when saves should be redirected, otherwise the original path.
	 */
	public static String getBasePath(String original) {
		if (!shouldRedirect()) return original;
		return getSaveFolder().getAbsolutePath() + "/";
	}

	/**
	 * Called at the start of AndroidLauncher.onCreate.
	 */
	public static void onActivityCreated(Activity activity) {
		if (hasStorageAccess(activity)) return;
		if (activity.getSharedPreferences(PREFS, Context.MODE_PRIVATE).getBoolean(KEY_DECLINED, false)) return;
		new Handler(Looper.getMainLooper()).post(() -> showAccessDialog(activity));
	}

	private static void showAccessDialog(Activity activity) {
		if (activity.isFinishing()) return;

		SharedPreferences prefs = activity.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
		new AlertDialog.Builder(activity)
			.setTitle("Public save folder")
			.setMessage("To store saves in " + getFolderName() + " where you can edit them, allow storage access.\n\nRestart the game afterwards. Your existing saves will be copied over.")
			.setPositiveButton("Allow", (dialog, which) -> requestStorageAccess(activity))
			.setNegativeButton("Keep private", (dialog, which) -> prefs.edit().putBoolean(KEY_DECLINED, true).apply())
			.show();
	}

	private static void requestStorageAccess(Activity activity) {
		if (Build.VERSION.SDK_INT < Build.VERSION_CODES.R) {
			if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
				activity.requestPermissions(new String[] { Manifest.permission.WRITE_EXTERNAL_STORAGE }, REQUEST_CODE);
			}
			return;
		}

		try {
			Intent intent = new Intent(Settings.ACTION_MANAGE_APP_ALL_FILES_ACCESS_PERMISSION);
			intent.setData(Uri.parse("package:" + activity.getPackageName()));
			activity.startActivity(intent);
		} catch (Exception e) {
			activity.startActivity(new Intent(Settings.ACTION_MANAGE_ALL_FILES_ACCESS_PERMISSION));
		}
	}

	/**
	 * The folder the game is currently reading and writing saves from.
	 */
	public static File getActiveSaveFolder(Context context) {
		if (!hasStorageAccess(context)) return context.getFilesDir();
		File folder = getSaveFolder();
		return folder.isDirectory() ? folder : context.getFilesDir();
	}

	/**
	 * The folder the game writes its saves to right now, or null when there is no context yet.
	 */
	/**
	 * The app's cache folder, or null when the app context isn't available.
	 */
	static File cacheDir() {
		Context context = getContext();
		return context == null ? null : context.getCacheDir();
	}

	/**
	 * The app's private folder that is never backed up or exported, or null when the app context isn't available.
	 */
	static File privateDir() {
		Context context = getContext();
		return context == null ? null : context.getNoBackupFilesDir();
	}

	static File currentRoot() {
		Context context = getContext();
		if (context == null) return null;
		if (redirect != null) return redirect ? getSaveFolder() : context.getFilesDir();
		return getActiveSaveFolder(context);
	}

	private static boolean shouldRedirect() {
		if (redirect != null) return redirect;

		redirect = false;
		Context context = getContext();
		if (context == null) return false;
		if (!hasStorageAccess(context)) return false;

		File folder = getSaveFolder();
		if (!folder.isDirectory() && !folder.mkdirs()) {
			Log.e(TAG, "Could not create " + folder);
			return false;
		}

		migrate(context.getFilesDir(), folder);
		redirect = true;
		return true;
	}

	private static boolean hasStorageAccess(Context context) {
		if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) return Environment.isExternalStorageManager();
		if (Build.VERSION.SDK_INT < Build.VERSION_CODES.M) return true;
		return context.checkSelfPermission(Manifest.permission.WRITE_EXTERNAL_STORAGE) == PackageManager.PERMISSION_GRANTED;
	}

	private static File getSaveFolder() {
		return new File(Environment.getExternalStorageDirectory(), getFolderName());
	}

	private static void migrate(File source, File target) {
		String[] existing = target.list();
		if (existing != null && existing.length > 0) return;

		File[] children = source.listFiles();
		if (children == null || children.length == 0) return;

		try {
			for (File child : children) FileHelpers.copy(child, new File(target, child.getName()));
			Log.i(TAG, "Copied saves from " + source + " to " + target);
		} catch (IOException e) {
			Log.e(TAG, "Failed to copy saves", e);
		}
	}

	/**
	 * Puts [text] on the phone's clipboard. Returns false when it couldn't.
	 */
	static boolean copyText(String label, String text) {
		Context context = getContext();
		if (context == null) return false;
		try {
			android.content.ClipboardManager clipboard = (android.content.ClipboardManager) context.getSystemService(Context.CLIPBOARD_SERVICE);
			clipboard.setPrimaryClip(android.content.ClipData.newPlainText(label, text));
			return true;
		} catch (Throwable e) {
			Log.e(TAG, "Could not copy to the clipboard", e);
			return false;
		}
	}

	static Context getContext() {
		try {
			return (Context) Reflect.method(Reflect.require("android.app.ActivityThread"), "currentApplication").invoke(null);
		} catch (Exception e) {
			Log.e(TAG, "Could not get application context", e);
			return null;
		}
	}
}
