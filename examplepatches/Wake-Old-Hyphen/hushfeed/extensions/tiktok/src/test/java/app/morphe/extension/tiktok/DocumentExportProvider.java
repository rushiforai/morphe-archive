package app.morphe.extension.tiktok;

import android.content.Context;
import android.content.pm.ProviderInfo;
import android.database.Cursor;
import android.database.MatrixCursor;
import android.net.Uri;
import android.os.CancellationSignal;
import android.os.ParcelFileDescriptor;
import android.provider.DocumentsContract;
import android.provider.DocumentsProvider;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

import org.robolectric.shadows.ShadowContentResolver;

/** A SAF destination whose real DocumentsProvider dispatch distinguishes deleteDocument from delete. */
public final class DocumentExportProvider extends DocumentsProvider {
    public static final String AUTHORITY = "app.morphe.test.export.documents";
    public final Uri uri = DocumentsContract.buildDocumentUri(AUTHORITY, "backup");
    public final CountDownLatch deletion = new CountDownLatch(1);
    public volatile boolean exists = true;
    public volatile boolean failOpen;
    public volatile boolean refuseDeletion;
    public volatile int deleteCalls;
    public File file;

    public static DocumentExportProvider register(Context context) {
        DocumentExportProvider provider = new DocumentExportProvider();
        ProviderInfo info = new ProviderInfo();
        info.authority = AUTHORITY;
        info.exported = true;
        info.grantUriPermissions = true;
        info.readPermission = "android.permission.MANAGE_DOCUMENTS";
        info.writePermission = "android.permission.MANAGE_DOCUMENTS";
        provider.attachInfo(context, info);
        ShadowContentResolver.registerProviderInternal(AUTHORITY, provider);
        return provider;
    }

    @Override public boolean onCreate() {
        try {
            file = File.createTempFile("created-export", ".json", getContext().getCacheDir());
            return true;
        } catch (IOException failure) {
            throw new IllegalStateException(failure);
        }
    }

    @Override public Cursor queryRoots(String[] projection) {
        return new MatrixCursor(projection == null
                ? new String[]{DocumentsContract.Root.COLUMN_ROOT_ID} : projection);
    }

    @Override public Cursor queryDocument(String documentId, String[] projection) {
        MatrixCursor cursor = new MatrixCursor(new String[]{
                DocumentsContract.Document.COLUMN_DOCUMENT_ID,
                DocumentsContract.Document.COLUMN_DISPLAY_NAME,
                DocumentsContract.Document.COLUMN_MIME_TYPE,
                DocumentsContract.Document.COLUMN_FLAGS});
        if (exists) cursor.addRow(new Object[]{"backup", "backup.json", "application/json",
                DocumentsContract.Document.FLAG_SUPPORTS_WRITE
                        | DocumentsContract.Document.FLAG_SUPPORTS_DELETE});
        return cursor;
    }

    @Override public Cursor queryChildDocuments(String parent, String[] projection, String order) {
        return queryDocument("backup", projection);
    }

    @Override public ParcelFileDescriptor openDocument(String documentId, String mode,
            CancellationSignal signal) throws FileNotFoundException {
        if (failOpen || !exists) throw new FileNotFoundException("injected destination refusal");
        return ParcelFileDescriptor.open(file, ParcelFileDescriptor.parseMode(mode));
    }

    @Override public void deleteDocument(String documentId) throws FileNotFoundException {
        deleteCalls++;
        try {
            if (refuseDeletion) throw new FileNotFoundException("injected cleanup refusal");
            if (file.exists() && !file.delete()) throw new FileNotFoundException("could not remove fixture");
            exists = false;
        } finally {
            deletion.countDown();
        }
    }

    public boolean awaitDeletion() throws InterruptedException {
        return deletion.await(5, TimeUnit.SECONDS);
    }
}
