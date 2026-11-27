package app.template.extension.shatteredpixeldungeon;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Process;
import android.util.Log;
import android.widget.Toast;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import java.util.zip.ZipOutputStream;

@SuppressWarnings("unused")
public class SaveBackupActivity extends Activity {

	public static final String ACTION_EXPORT = "app.template.extension.shatteredpixeldungeon.EXPORT_SAVES";
	public static final String ACTION_IMPORT = "app.template.extension.shatteredpixeldungeon.IMPORT_SAVES";

	private static final String TAG = "SaveBackup";
	private static final String ZIP_MIME = "application/zip";
	private static final int REQUEST_EXPORT = 1;
	private static final int REQUEST_IMPORT = 2;

	/**
	 * Replaced by the Save backup patch to return true.
	 */
	public static boolean isAvailable() {
		return false;
	}

	public static void launch(String action) {
		Context context = SaveLocation.getContext();
		if (context == null) return;
		Intent intent = new Intent(action)
			.setClass(context, SaveBackupActivity.class)
			.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
		context.startActivity(intent);
	}

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		if (savedInstanceState != null) return;

		String action = getIntent().getAction();
		if (ACTION_EXPORT.equals(action)) {
			startExport();
			return;
		}
		if (ACTION_IMPORT.equals(action)) {
			startImport();
			return;
		}
		finish();
	}

	private void startExport() {
		String stamp = new SimpleDateFormat("yyyyMMdd-HHmmss", Locale.US).format(new Date());
		Intent intent = new Intent(Intent.ACTION_CREATE_DOCUMENT)
			.addCategory(Intent.CATEGORY_OPENABLE)
			.setType(ZIP_MIME)
			.putExtra(Intent.EXTRA_TITLE, "ShatteredPixelDungeon-saves-" + stamp + ".zip");
		startActivityForResult(intent, REQUEST_EXPORT);
	}

	private void startImport() {
		Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT)
			.addCategory(Intent.CATEGORY_OPENABLE)
			.setType("*/*")
			.putExtra(Intent.EXTRA_MIME_TYPES, new String[] { ZIP_MIME, "application/x-zip-compressed", "application/octet-stream" });
		startActivityForResult(intent, REQUEST_IMPORT);
	}

	@Override
	protected void onActivityResult(int requestCode, int resultCode, Intent data) {
		super.onActivityResult(requestCode, resultCode, data);
		if (resultCode != RESULT_OK || data == null || data.getData() == null) {
			finish();
			return;
		}

		Uri uri = data.getData();
		if (requestCode == REQUEST_EXPORT) {
			export(uri);
			return;
		}
		if (requestCode == REQUEST_IMPORT) {
			confirmImport(uri);
			return;
		}
		finish();
	}

	private void export(Uri uri) {
		File saves = saveRoot();
		try (OutputStream out = getContentResolver().openOutputStream(uri, "wt"); ZipOutputStream zip = new ZipOutputStream(out)) {
			int count = zipFolder(zip, saves, "");
			zip.finish();
			toast("Exported " + count + " save files");
		} catch (IOException e) {
			Log.e(TAG, "Export failed", e);
			toast("Export failed: " + e.getMessage());
		}
		finish();
	}

	private void confirmImport(Uri uri) {
		new AlertDialog.Builder(this)
			.setTitle("Import saves")
			.setMessage("This replaces all current saves, badges and rankings with the backup. A copy of your current saves is kept in the app's cache until the next import.\n\nThe game will close when the import finishes.")
			.setPositiveButton("Import", (dialog, which) -> importBackup(uri))
			.setNegativeButton(android.R.string.cancel, (dialog, which) -> finish())
			.setOnCancelListener(dialog -> finish())
			.show();
	}

	private void importBackup(Uri uri) {
		File saves = saveRoot();
		File staging = new File(getCacheDir(), "save-import");
		File previous = new File(getCacheDir(), "save-before-import");

		try {
			FileHelpers.delete(staging);
			if (!staging.mkdirs()) throw new IOException("Could not create " + staging);

			int count;
			try (InputStream in = getContentResolver().openInputStream(uri)) {
				if (in == null) throw new IOException("Could not open backup");
				count = unzip(new BufferedInputStream(in), staging);
			}
			if (!containsSaveData(staging)) throw new IOException("This file does not contain Shattered Pixel Dungeon saves");

			FileHelpers.delete(previous);
			if (!previous.mkdirs()) throw new IOException("Could not create " + previous);
			copyChildren(saves, previous);

			clearChildren(saves);
			copyChildren(staging, saves);
			FileHelpers.delete(staging);

			toast("Imported " + count + " save files. Start the game again to load them.");
		} catch (IOException e) {
			Log.e(TAG, "Import failed", e);
			FileHelpers.delete(staging);
			toast("Import failed: " + e.getMessage());
			finish();
			return;
		}

		finishAffinity();
		new Handler(Looper.getMainLooper()).postDelayed(() -> Process.killProcess(Process.myPid()), 1500);
	}

	private File saveRoot() {
		File root = SaveLocation.currentRoot();
		return root != null ? root : SaveLocation.getActiveSaveFolder(this);
	}

	private static int zipFolder(ZipOutputStream zip, File folder, String prefix) throws IOException {
		File[] children = folder.listFiles();
		if (children == null) return 0;

		int count = 0;
		for (File child : children) {
			String name = prefix + child.getName();
			if (child.isDirectory()) {
				zip.putNextEntry(new ZipEntry(name + "/"));
				zip.closeEntry();
				count += zipFolder(zip, child, name + "/");
				continue;
			}

			zip.putNextEntry(new ZipEntry(name));
			try (InputStream in = new FileInputStream(child)) {
				FileHelpers.pipe(in, zip);
			}
			zip.closeEntry();
			count++;
		}
		return count;
	}

	private static int unzip(InputStream in, File target) throws IOException {
		String targetPath = target.getCanonicalPath() + File.separator;
		int count = 0;

		try (ZipInputStream zip = new ZipInputStream(in)) {
			ZipEntry entry;
			while ((entry = zip.getNextEntry()) != null) {
				File file = new File(target, entry.getName());
				if (!file.getCanonicalPath().startsWith(targetPath)) throw new IOException("Invalid entry " + entry.getName());

				if (entry.isDirectory()) {
					if (!file.isDirectory() && !file.mkdirs()) throw new IOException("Could not create " + file);
					continue;
				}

				File parent = file.getParentFile();
				if (parent != null && !parent.isDirectory() && !parent.mkdirs()) throw new IOException("Could not create " + parent);
				try (OutputStream out = new FileOutputStream(file)) {
					FileHelpers.pipe(zip, out);
				}
				count++;
			}
		}
		return count;
	}

	private static boolean containsSaveData(File folder) {
		File[] children = folder.listFiles();
		if (children == null) return false;
		for (File child : children) {
			if (child.isFile() && child.getName().endsWith(".dat")) return true;
			if (child.isDirectory() && containsSaveData(child)) return true;
		}
		return false;
	}

	private static void copyChildren(File source, File target) throws IOException {
		File[] children = source.listFiles();
		if (children == null) return;
		for (File child : children) FileHelpers.copy(child, new File(target, child.getName()));
	}

	private static void clearChildren(File folder) {
		File[] children = folder.listFiles();
		if (children == null) return;
		for (File child : children) FileHelpers.delete(child);
	}

	private void toast(String message) {
		Toast.makeText(getApplicationContext(), message, Toast.LENGTH_LONG).show();
	}
}
