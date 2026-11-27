package app.template.extension.shatteredpixeldungeon;

import android.content.pm.ApplicationInfo;
import android.database.Cursor;
import android.database.MatrixCursor;
import android.os.CancellationSignal;
import android.os.ParcelFileDescriptor;
import android.provider.DocumentsContract.Document;
import android.provider.DocumentsContract.Root;
import android.provider.DocumentsProvider;
import android.webkit.MimeTypeMap;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;

@SuppressWarnings("unused")
public class SaveFilesProvider extends DocumentsProvider {

	private static final String ROOT_ID = "root";

	private static final String[] DEFAULT_ROOT_PROJECTION = {
		Root.COLUMN_ROOT_ID,
		Root.COLUMN_DOCUMENT_ID,
		Root.COLUMN_TITLE,
		Root.COLUMN_SUMMARY,
		Root.COLUMN_FLAGS,
		Root.COLUMN_ICON,
	};

	private static final String[] DEFAULT_DOCUMENT_PROJECTION = {
		Document.COLUMN_DOCUMENT_ID,
		Document.COLUMN_DISPLAY_NAME,
		Document.COLUMN_MIME_TYPE,
		Document.COLUMN_LAST_MODIFIED,
		Document.COLUMN_SIZE,
		Document.COLUMN_FLAGS,
	};

	private File baseDir;

	@Override
	public boolean onCreate() {
		baseDir = getContext().getFilesDir();
		return true;
	}

	@Override
	public Cursor queryRoots(String[] projection) {
		MatrixCursor result = new MatrixCursor(projection != null ? projection : DEFAULT_ROOT_PROJECTION);
		ApplicationInfo info = getContext().getApplicationInfo();
		MatrixCursor.RowBuilder row = result.newRow();
		row.add(Root.COLUMN_ROOT_ID, ROOT_ID);
		row.add(Root.COLUMN_DOCUMENT_ID, ROOT_ID);
		row.add(Root.COLUMN_TITLE, getContext().getPackageManager().getApplicationLabel(info).toString());
		row.add(Root.COLUMN_SUMMARY, "Save files");
		row.add(Root.COLUMN_FLAGS, Root.FLAG_SUPPORTS_CREATE | Root.FLAG_SUPPORTS_IS_CHILD | Root.FLAG_LOCAL_ONLY);
		row.add(Root.COLUMN_ICON, info.icon);
		return result;
	}

	@Override
	public Cursor queryDocument(String documentId, String[] projection) throws FileNotFoundException {
		MatrixCursor result = new MatrixCursor(projection != null ? projection : DEFAULT_DOCUMENT_PROJECTION);
		addRow(result, getFile(documentId));
		return result;
	}

	@Override
	public Cursor queryChildDocuments(String parentDocumentId, String[] projection, String sortOrder) throws FileNotFoundException {
		MatrixCursor result = new MatrixCursor(projection != null ? projection : DEFAULT_DOCUMENT_PROJECTION);
		File[] children = getFile(parentDocumentId).listFiles();
		if (children == null) return result;
		for (File child : children) addRow(result, child);
		return result;
	}

	@Override
	public ParcelFileDescriptor openDocument(String documentId, String mode, CancellationSignal signal) throws FileNotFoundException {
		return ParcelFileDescriptor.open(getFile(documentId), ParcelFileDescriptor.parseMode(mode));
	}

	@Override
	public String createDocument(String parentDocumentId, String mimeType, String displayName) throws FileNotFoundException {
		File parent = getFile(parentDocumentId);
		File file = uniqueFile(parent, displayName);
		try {
			boolean created = Document.MIME_TYPE_DIR.equals(mimeType) ? file.mkdir() : file.createNewFile();
			if (!created) throw new FileNotFoundException("Failed to create " + displayName);
		} catch (IOException e) {
			throw new FileNotFoundException(e.getMessage());
		}
		return getDocumentId(file);
	}

	@Override
	public String renameDocument(String documentId, String displayName) throws FileNotFoundException {
		File file = getFile(documentId);
		File target = uniqueFile(file.getParentFile(), displayName);
		if (!file.renameTo(target)) throw new FileNotFoundException("Failed to rename " + documentId);
		return getDocumentId(target);
	}

	@Override
	public void deleteDocument(String documentId) throws FileNotFoundException {
		File file = getFile(documentId);
		if (!deleteRecursively(file)) throw new FileNotFoundException("Failed to delete " + documentId);
	}

	@Override
	public boolean isChildDocument(String parentDocumentId, String documentId) {
		return documentId.equals(parentDocumentId) || documentId.startsWith(parentDocumentId + "/");
	}

	private void addRow(MatrixCursor result, File file) {
		int flags = 0;
		if (file.isDirectory()) {
			flags |= Document.FLAG_DIR_SUPPORTS_CREATE;
		} else {
			flags |= Document.FLAG_SUPPORTS_WRITE;
		}
		boolean isRoot = file.equals(baseDir);
		if (!isRoot) flags |= Document.FLAG_SUPPORTS_DELETE | Document.FLAG_SUPPORTS_RENAME;

		MatrixCursor.RowBuilder row = result.newRow();
		row.add(Document.COLUMN_DOCUMENT_ID, getDocumentId(file));
		row.add(Document.COLUMN_DISPLAY_NAME, isRoot ? "Saves" : file.getName());
		row.add(Document.COLUMN_MIME_TYPE, getMimeType(file));
		row.add(Document.COLUMN_LAST_MODIFIED, file.lastModified());
		row.add(Document.COLUMN_SIZE, file.length());
		row.add(Document.COLUMN_FLAGS, flags);
	}

	private String getDocumentId(File file) {
		String base = baseDir.getAbsolutePath();
		String path = file.getAbsolutePath();
		if (path.equals(base)) return ROOT_ID;
		return ROOT_ID + "/" + path.substring(base.length() + 1);
	}

	private File getFile(String documentId) throws FileNotFoundException {
		if (!isChildDocument(ROOT_ID, documentId)) throw new FileNotFoundException("Unknown document " + documentId);
		File file = documentId.equals(ROOT_ID) ? baseDir : new File(baseDir, documentId.substring(ROOT_ID.length() + 1));
		try {
			String canonicalBase = baseDir.getCanonicalPath();
			String canonical = file.getCanonicalPath();
			if (!canonical.equals(canonicalBase) && !canonical.startsWith(canonicalBase + File.separator)) {
				throw new FileNotFoundException("Document outside save folder: " + documentId);
			}
		} catch (IOException e) {
			throw new FileNotFoundException(e.getMessage());
		}
		if (!file.exists()) throw new FileNotFoundException("Missing document " + documentId);
		return file;
	}

	private static File uniqueFile(File parent, String displayName) {
		File file = new File(parent, displayName);
		if (!file.exists()) return file;

		int dot = displayName.lastIndexOf('.');
		String name = dot > 0 ? displayName.substring(0, dot) : displayName;
		String extension = dot > 0 ? displayName.substring(dot) : "";
		for (int i = 1; ; i++) {
			file = new File(parent, name + " (" + i + ")" + extension);
			if (!file.exists()) return file;
		}
	}

	private static String getMimeType(File file) {
		if (file.isDirectory()) return Document.MIME_TYPE_DIR;

		String name = file.getName();
		int dot = name.lastIndexOf('.');
		if (dot < 0) return "application/octet-stream";

		String extension = name.substring(dot + 1).toLowerCase();
		if (extension.equals("dat")) return "application/octet-stream";
		String mime = MimeTypeMap.getSingleton().getMimeTypeFromExtension(extension);
		return mime != null ? mime : "application/octet-stream";
	}

	private static boolean deleteRecursively(File file) {
		File[] children = file.listFiles();
		if (children != null) {
			for (File child : children) {
				if (!deleteRecursively(child)) return false;
			}
		}
		return file.delete();
	}
}
