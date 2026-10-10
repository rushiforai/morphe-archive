package app.hushmessenger.extension;

import android.app.Activity;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Intent;
import android.content.ContentResolver;
import android.content.res.AssetFileDescriptor;
import android.net.Uri;
import android.os.CancellationSignal;
import android.os.ParcelFileDescriptor;
import android.os.Bundle;
import android.os.Looper;
import android.view.View;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;
import org.robolectric.shadows.ShadowContentResolver;
import org.robolectric.shadows.ShadowParcelFileDescriptor;
import org.robolectric.shadows.ShadowToast;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 29, 36}, shadows = {ChoiceBackupTest.DocumentResolver.class, ChoiceBackupTest.SeekableDescriptor.class, ChoiceBackupTest.SeekableOs.class, ChoiceBackupTest.MediaDocuments.class})
public class ChoiceBackupTest {
    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        CrashGuard.resetForTests();
        DocumentResolver.opener = null;
        DocumentResolver.onOpen = null;
        DocumentResolver.query = null;
        MediaDocuments.alias = null;
        SeekableDescriptor.files.clear();
        SeekableOs.errno = 0;
        SettingsActivity.documentTimeoutMillis = 30_000;
    }

    /** Keep the original stream fault fixtures while exercising cancellable descriptor opens. */
    @Implements(ContentResolver.class)
    public static class DocumentResolver extends ShadowContentResolver {
        static java.util.function.BiFunction<Uri, CancellationSignal, AssetFileDescriptor> opener;
        static java.util.function.Consumer<CancellationSignal> onOpen;
        static java.util.function.BiFunction<Uri, CancellationSignal, android.database.Cursor> query;

        @Implementation protected android.database.Cursor query(Uri uri, String[] projection, String selection,
                String[] selectionArgs, String sortOrder, CancellationSignal signal) {
            assertArrayEquals(new String[] {"owner_package_name"}, projection);
            assertNotNull(signal);
            signal.throwIfCanceled();
            return query == null ? null : query.apply(uri, signal);
        }

        @Implementation protected AssetFileDescriptor openAssetFileDescriptor(Uri uri, String mode, CancellationSignal signal)
                throws java.io.FileNotFoundException {
            signal.throwIfCanceled();
            if (onOpen != null) onOpen.accept(signal);
            if (opener != null) return opener.apply(uri, signal);
            java.io.InputStream input = "r".equals(mode) ? super.openInputStream(uri) : null;
            java.io.OutputStream output = "r".equals(mode) ? null : super.openOutputStream(uri, mode);
            if (input == null && output == null) return null;
            try {
                java.io.File file = Files.createTempFile("choices-descriptor", ".tmp").toFile();
                ParcelFileDescriptor descriptor = ParcelFileDescriptor.open(file, ParcelFileDescriptor.MODE_READ_WRITE);
                return new AssetFileDescriptor(descriptor, 0, AssetFileDescriptor.UNKNOWN_LENGTH) {
                    @Override public java.io.FileInputStream createInputStream() {
                        return new ParcelFileDescriptor.AutoCloseInputStream(descriptor) {
                            @Override public int read() throws java.io.IOException { return input.read(); }
                            @Override public int read(byte[] bytes) throws java.io.IOException { return input.read(bytes); }
                            @Override public int read(byte[] bytes, int offset, int length) throws java.io.IOException {
                                return input.read(bytes, offset, length);
                            }
                            @Override public void close() throws java.io.IOException {
                                try { input.close(); } finally { super.close(); }
                            }
                        };
                    }
                    @Override public java.io.FileOutputStream createOutputStream() {
                        return new ParcelFileDescriptor.AutoCloseOutputStream(descriptor) {
                            @Override public void write(int value) throws java.io.IOException { output.write(value); }
                            @Override public void write(byte[] bytes) throws java.io.IOException { output.write(bytes); }
                            @Override public void write(byte[] bytes, int offset, int length) throws java.io.IOException {
                                output.write(bytes, offset, length);
                            }
                            @Override public void close() throws java.io.IOException {
                                try { output.close(); } finally { super.close(); }
                            }
                        };
                    }
                    @Override public void close() throws java.io.IOException {
                        try { super.close(); } finally { file.delete(); }
                    }
                };
            } catch (java.io.IOException error) { throw new java.io.FileNotFoundException("Fixture descriptor failed"); }
        }
    }

    /** The system provider bridge is outside these in-process document fixtures. */
    @Implements(android.provider.MediaStore.class)
    public static class MediaDocuments {
        static Uri alias;
        @Implementation(minSdk = 29) protected static Uri getMediaUri(android.content.Context context, Uri document) {
            return alias;
        }
    }

    /** Robolectric 4.17 doesn't implement the seek used by Android's sliced output stream. */
    @Implements(ParcelFileDescriptor.class)
    public static class SeekableDescriptor extends ShadowParcelFileDescriptor {
        static final java.util.Map<java.io.FileDescriptor, java.io.RandomAccessFile> files = new java.util.concurrent.ConcurrentHashMap<>();
        @Implementation protected java.io.FileDescriptor getFileDescriptor() {
            java.io.FileDescriptor descriptor = super.getFileDescriptor();
            java.io.RandomAccessFile file = org.robolectric.util.ReflectionHelpers.getField(this, "file");
            if (file != null) files.put(descriptor, file);
            return descriptor;
        }
        @Implementation protected long seekTo(long position) throws java.io.IOException {
            java.io.RandomAccessFile file = org.robolectric.util.ReflectionHelpers.getField(this, "file");
            file.seek(position);
            return file.getFilePointer();
        }
    }

    /** ShadowOs tracks offsets separately from real host descriptors. Supply the actual seek primitive. */
    @Implements(android.system.Os.class)
    public static class SeekableOs {
        static int errno;
        @Implementation protected static long sysconf(int name) {
            return org.robolectric.util.ReflectionHelpers.callStaticMethod(org.robolectric.shadows.ShadowOs.class,
                "sysconf", org.robolectric.util.ReflectionHelpers.ClassParameter.from(int.class, name));
        }
        @Implementation protected static long lseek(java.io.FileDescriptor descriptor, long offset, int whence)
                throws android.system.ErrnoException {
            if (errno != 0) throw new android.system.ErrnoException("lseek", errno);
            java.io.RandomAccessFile file = SeekableDescriptor.files.get(descriptor);
            if (file == null) throw new android.system.ErrnoException("lseek", android.system.OsConstants.ESPIPE);
            try {
                long base = whence == android.system.OsConstants.SEEK_SET ? 0 :
                    whence == android.system.OsConstants.SEEK_CUR ? file.getFilePointer() : file.length();
                file.seek(base + offset);
                return file.getFilePointer();
            } catch (java.io.IOException error) {
                throw new android.system.ErrnoException("lseek", android.system.OsConstants.EBADF, error);
            }
        }
    }

    @Test public void bothVersionsRoundTripOnlyInstalledChoices() {
        Settings.preferences.edit().putBoolean("stories", true).putBoolean("paused", true)
            .putBoolean("safe_mode", true).putString("account", "private").putString("hook_error_stories", "private")
            .putBoolean("check_updates", true).commit();
        String backup = ChoiceCodec.encode(Settings.preferences, new HashSet<>(Set.of("stories")));
        assertEquals(ChoiceCodec.HEADER + "\npaused=true\nstories=true\n", backup);
        assertEquals(Map.of("paused", true, "stories", true), ChoiceCodec.parse(backup));
        assertEquals(ChoiceCodec.parse(backup), ChoiceCodec.parse(backup.replace(ChoiceCodec.HEADER, ChoiceCodec.LEGACY_HEADER)));
        assertEquals(ChoiceCodec.parse(backup), ChoiceCodec.parse(backup.replace("\n", "\r\n")));
    }

    @Test public void everyMalformedBackupLeavesAllPreferencesUntouched() {
        String[] invalid = {"", "hushmessenger:choices-extra\nstories=true", "hushmessenger:choices:v2\nstories=true",
            "hushmessenger:choices\nstories=true\nstories=false", "hushmessenger:choices\nstories=true\npeople=maybe",
            "hushmessenger:choices\nstories=true\nbroken", "hushmessenger:choices\nstories=TRUE",
            "hushmessenger:choices\nstories=true\n\npeople=false", "hushmessenger:choices\nstories=true\nunknown=bad",
            "hushmessenger:choices\nstories=true\n" + "x".repeat(ChoiceCodec.MAX_BYTES)};
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            Settings.preferences.edit().putBoolean("stories", false).putBoolean("people", true).commit();
            Map<String, ?> before = Settings.preferences.getAll();
            for (String raw : invalid) {
                clipboard(raw);
                screen.get().getWindow().getDecorView().findViewWithTag("import_choices").performClick();
                assertEquals(raw.substring(0, Math.min(60, raw.length())), before, Settings.preferences.getAll());
                assertTrue(ShadowToast.getTextOfLatestToast().startsWith("Not a valid"));
            }
        }
    }

    @Test public void omittedAbsentAndUnknownChoicesAreNotOverwritten() {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            Settings.installed = new HashSet<>(Set.of("stories"));
            Settings.preferences.edit().putBoolean("people", true).putBoolean("typing", true).commit();
            clipboard(ChoiceCodec.HEADER + "\nstories=true\npeople=false\nnew_control=true\n");
            screen.get().getWindow().getDecorView().findViewWithTag("import_choices").performClick();
            assertTrue(Settings.preferences.getBoolean("stories", false));
            assertTrue(Settings.preferences.getBoolean("people", false));
            assertTrue(Settings.preferences.getBoolean("typing", false));
            assertFalse(Settings.preferences.contains("new_control"));
            assertEquals("Restored 1 choice Skipped 1 choice this version doesn't know. Skipped 1 choice whose patch isn't installed.", ShadowToast.getTextOfLatestToast());
            Map<String, ?> before = Settings.preferences.getAll();
            clipboard(ChoiceCodec.HEADER + "\nnew_control=false\n");
            screen.get().getWindow().getDecorView().findViewWithTag("import_choices").performClick();
            assertEquals(before, Settings.preferences.getAll());
            assertTrue(ShadowToast.getTextOfLatestToast().startsWith("No installed"));
        }
    }

    @Test public void streamLimitCountsBytesAndAllowsTheExactBoundary() throws Exception {
        assertEquals(ChoiceCodec.MAX_BYTES, ChoiceCodec.read(new ByteArrayInputStream(new byte[ChoiceCodec.MAX_BYTES])).length());
        assertThrows(java.io.IOException.class, () -> ChoiceCodec.read(new ByteArrayInputStream(new byte[ChoiceCodec.MAX_BYTES + 1])));
        assertThrows(IllegalArgumentException.class, () -> ChoiceCodec.parse("\u20ac".repeat(ChoiceCodec.MAX_BYTES / 2)));
        assertThrows(java.io.IOException.class, () -> ChoiceCodec.read(null));
    }

    @Test public void malformedUtf8CannotTurnIntoAnAcceptedUnknownKey() throws Exception {
        ByteArrayOutputStream raw = new ByteArrayOutputStream();
        raw.write((ChoiceCodec.HEADER + "\nstories=true\nnew_").getBytes(StandardCharsets.UTF_8));
        raw.write(0xc3);
        raw.write("=true\n".getBytes(StandardCharsets.UTF_8));
        String decoded = ChoiceCodec.read(new ByteArrayInputStream(raw.toByteArray()));
        assertThrows(IllegalArgumentException.class, () -> ChoiceCodec.parse(decoded));
    }

    @Test public void onlyOnePickerCanBePendingAndCancelAllowsRetry() {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            SettingsActivity activity = screen.get();
            View root = activity.getWindow().getDecorView();
            root.findViewWithTag("read_choices_file").performClick();
            root.findViewWithTag("read_choices_file").performClick();
            root.findViewWithTag("save_choices_file").performClick();
            var first = Shadows.shadowOf(activity).getNextStartedActivityForResult();
            assertEquals(Intent.ACTION_OPEN_DOCUMENT, first.intent.getAction());
            assertNull(Shadows.shadowOf(activity).getNextStartedActivityForResult());
            activity.onActivityResult(first.requestCode, Activity.RESULT_CANCELED, null);
            root.findViewWithTag("save_choices_file").performClick();
            assertEquals(Intent.ACTION_CREATE_DOCUMENT, Shadows.shadowOf(activity).getNextStartedActivityForResult().intent.getAction());
        }
    }

    @Test public void filePickerExportUsesTheSameSettingsOnlyFormat() throws Exception {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            Settings.preferences.edit().putBoolean("stories", true).commit();
            SettingsActivity activity = screen.get();
            activity.getWindow().getDecorView().findViewWithTag("save_choices_file").performClick();
            var request = Shadows.shadowOf(activity).getNextStartedActivityForResult();
            assertEquals(Intent.ACTION_CREATE_DOCUMENT, request.intent.getAction());
            assertTrue(request.intent.hasCategory(Intent.CATEGORY_OPENABLE));
            assertEquals("text/plain", request.intent.getType());
            Uri uri = Uri.parse("content://choices/export");
            ByteArrayOutputStream output = new ByteArrayOutputStream();
            Shadows.shadowOf(activity.getContentResolver()).registerOutputStream(uri, output);
            activity.onActivityResult(request.requestCode, Activity.RESULT_OK, new Intent().setData(uri));
            awaitToast("Choices file saved");
            assertEquals(ChoiceCodec.encode(Settings.preferences, Settings.installed), output.toString(StandardCharsets.UTF_8));
        }
    }

    @Test public void legacyFileImportAndCancelPreserveOmittedChoices() throws Exception {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            SettingsActivity activity = screen.get();
            Settings.preferences.edit().putBoolean("people", true).commit();
            View button = activity.getWindow().getDecorView().findViewWithTag("read_choices_file");
            button.performClick();
            var request = Shadows.shadowOf(activity).getNextStartedActivityForResult();
            assertEquals(Intent.ACTION_OPEN_DOCUMENT, request.intent.getAction());
            assertTrue(request.intent.hasCategory(Intent.CATEGORY_OPENABLE));
            Map<String, ?> before = Settings.preferences.getAll();
            activity.onActivityResult(request.requestCode, Activity.RESULT_CANCELED, null);
            assertEquals(before, Settings.preferences.getAll());
            button.performClick();
            Uri uri = Uri.parse("content://choices/import");
            Shadows.shadowOf(activity.getContentResolver()).registerInputStream(uri,
                new ByteArrayInputStream((ChoiceCodec.LEGACY_HEADER + "\nstories=true\n").getBytes(StandardCharsets.UTF_8)));
            activity.onActivityResult(SettingsActivity.READ_CHOICES, Activity.RESULT_OK, new Intent().setData(uri));
            awaitToast("Restored 1 choice");
            assertTrue(Settings.preferences.getBoolean("stories", false));
            assertTrue(Settings.preferences.getBoolean("people", false));
        }
    }

    @Test public void unreadableCorruptAndRecreatedFileResultsChangeNothing() throws Exception {
        for (String data : new String[] {"corrupt", "oversized", "unreadable"}) {
            try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
                SettingsActivity activity = screen.get();
                Map<String, ?> before = Settings.preferences.getAll();
                activity.getWindow().getDecorView().findViewWithTag("read_choices_file").performClick();
                Uri uri = Uri.parse("content://choices/" + data);
                if (!"unreadable".equals(data)) Shadows.shadowOf(activity.getContentResolver()).registerInputStream(uri,
                    new ByteArrayInputStream(("oversized".equals(data) ? "x".repeat(ChoiceCodec.MAX_BYTES + 1) :
                        ChoiceCodec.HEADER + "\nstories=true\npeople=bad").getBytes(StandardCharsets.UTF_8)));
                else Shadows.shadowOf(activity.getContentResolver()).registerInputStreamSupplier(uri,
                    () -> { throw new SecurityException("Refused"); });
                ShadowToast.reset();
                activity.onActivityResult(SettingsActivity.READ_CHOICES, Activity.RESULT_OK, new Intent().setData(uri));
                awaitToast("Not a valid");
                assertEquals(before, Settings.preferences.getAll());
            }
        }
        Bundle saved = new Bundle();
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            screen.get().getWindow().getDecorView().findViewWithTag("read_choices_file").performClick();
            screen.get().onSaveInstanceState(saved);
        }
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).create(saved).start().resume()) {
            Map<String, ?> before = Settings.preferences.getAll();
            screen.get().onActivityResult(SettingsActivity.READ_CHOICES, Activity.RESULT_OK, new Intent().setData(Uri.parse("content://choices/import")));
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            assertEquals(before, Settings.preferences.getAll());
        }
    }

    @Test public void pickerCannotReadOrOverwritePrivateFiles() throws Exception {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            SettingsActivity activity = screen.get();
            java.io.File file = new java.io.File(activity.getFilesDir(), "private-sentinel.txt");
            byte[] original = (ChoiceCodec.HEADER + "\nstories=true\n").getBytes(StandardCharsets.UTF_8);
            Files.write(file.toPath(), original);
            Map<String, ?> before = Settings.preferences.getAll();
            Uri uri = Uri.fromFile(file);
            activity.getWindow().getDecorView().findViewWithTag("read_choices_file").performClick();
            activity.onActivityResult(SettingsActivity.READ_CHOICES, Activity.RESULT_OK, new Intent().setData(uri));
            awaitToast("Not a valid");
            assertEquals(before, Settings.preferences.getAll());
            ShadowToast.reset();
            activity.getWindow().getDecorView().findViewWithTag("save_choices_file").performClick();
            activity.onActivityResult(SettingsActivity.SAVE_CHOICES, Activity.RESULT_OK, new Intent().setData(uri));
            awaitToast("Couldn't export");
            assertArrayEquals(original, Files.readAllBytes(file.toPath()));
        }
    }

    @Test public void documentProviderRuntimeFailuresLeaveChoicesAlone() throws Exception {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            SettingsActivity activity = screen.get();
            Map<String, ?> before = Settings.preferences.getAll();
            Uri uri = Uri.parse("content://choices/provider-failed");
            Shadows.shadowOf(activity.getContentResolver()).registerInputStreamSupplier(uri,
                () -> { throw new IllegalStateException("private provider details"); });
            activity.getWindow().getDecorView().findViewWithTag("read_choices_file").performClick();
            activity.onActivityResult(SettingsActivity.READ_CHOICES, Activity.RESULT_OK, new Intent().setData(uri));
            awaitToast("Not a valid");
            assertEquals(before, Settings.preferences.getAll());
            assertTrue(org.robolectric.shadows.ShadowLog.getLogsForTag("HushMessenger").stream()
                .noneMatch(log -> log.throwable != null && "private provider details".equals(log.throwable.getMessage())));
        }
    }

    @Test public void pickerCannotUseAProviderOwnedByMessenger() throws Exception {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            SettingsActivity activity = screen.get();
            android.content.pm.ProviderInfo provider = new android.content.pm.ProviderInfo();
            provider.name = "PrivateProvider";
            provider.authority = "choices.private";
            provider.packageName = activity.getPackageName();
            provider.applicationInfo = new android.content.pm.ApplicationInfo();
            provider.applicationInfo.uid = android.os.Process.myUid();
            var owner = activity.getPackageManager().getPackageInfo(activity.getPackageName(), 0);
            owner.providers = new android.content.pm.ProviderInfo[] {provider};
            Shadows.shadowOf(activity.getPackageManager()).installPackage(owner);
            Uri uri = Uri.parse("content://choices.private/sentinel");
            ByteArrayOutputStream output = new ByteArrayOutputStream();
            Shadows.shadowOf(activity.getContentResolver()).registerOutputStream(uri, output);
            Shadows.shadowOf(activity.getContentResolver()).registerInputStream(uri,
                new ByteArrayInputStream((ChoiceCodec.HEADER + "\nstories=true\n").getBytes(StandardCharsets.UTF_8)));
            Map<String, ?> before = Settings.preferences.getAll();
            activity.getWindow().getDecorView().findViewWithTag("read_choices_file").performClick();
            activity.onActivityResult(SettingsActivity.READ_CHOICES, Activity.RESULT_OK, new Intent().setData(uri));
            awaitToast("Not a valid");
            assertEquals(before, Settings.preferences.getAll());
            activity.getWindow().getDecorView().findViewWithTag("save_choices_file").performClick();
            activity.onActivityResult(SettingsActivity.SAVE_CHOICES, Activity.RESULT_OK, new Intent().setData(uri));
            awaitToast("Couldn't export");
            assertEquals(0, output.size());
        }
    }

    @Test public void pickerCannotUseAUserPrefixedPrivateProvider() throws Exception {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            SettingsActivity activity = screen.get();
            android.content.pm.ProviderInfo provider = new android.content.pm.ProviderInfo();
            provider.name = "PrivateProvider";
            provider.authority = "choices.user.private";
            provider.packageName = activity.getPackageName();
            provider.applicationInfo = new android.content.pm.ApplicationInfo();
            provider.applicationInfo.uid = android.os.Process.myUid();
            var owner = activity.getPackageManager().getPackageInfo(activity.getPackageName(), 0);
            owner.providers = new android.content.pm.ProviderInfo[] {provider};
            Shadows.shadowOf(activity.getPackageManager()).installPackage(owner);
            for (String authority : new String[] {"0@choices.user.private", "0%40choices.user.private"}) {
                Uri uri = Uri.parse("content://" + authority + "/sentinel");
                ByteArrayOutputStream output = new ByteArrayOutputStream();
                var reads = new java.util.concurrent.atomic.AtomicInteger();
                ByteArrayInputStream input = new ByteArrayInputStream(
                    (ChoiceCodec.HEADER + "\nstories=true\n").getBytes(StandardCharsets.UTF_8)) {
                    @Override public synchronized int read(byte[] bytes, int offset, int length) {
                        reads.incrementAndGet();
                        return super.read(bytes, offset, length);
                    }
                };
                Shadows.shadowOf(activity.getContentResolver()).registerOutputStream(uri, output);
                Shadows.shadowOf(activity.getContentResolver()).registerInputStream(uri, input);
                Map<String, ?> before = Settings.preferences.getAll();
                ShadowToast.reset();
                activity.getWindow().getDecorView().findViewWithTag("read_choices_file").performClick();
                activity.onActivityResult(SettingsActivity.READ_CHOICES, Activity.RESULT_OK, new Intent().setData(uri));
                awaitToast("Not a valid");
                assertEquals(before, Settings.preferences.getAll());
                assertEquals(0, reads.get());
                ShadowToast.reset();
                activity.getWindow().getDecorView().findViewWithTag("save_choices_file").performClick();
                activity.onActivityResult(SettingsActivity.SAVE_CHOICES, Activity.RESULT_OK, new Intent().setData(uri));
                awaitToast("Couldn't export");
                assertEquals(0, output.size());
            }
        }
    }

    @Test public void mediaDestinationsRequireKnownForeignOwnershipBeforeOpeningForWrite() throws Exception {
        for (String authority : new String[] {"media", "0@media", "com.android.providers.media.documents", "com.android.externalstorage.documents"}) {
            for (String owner : new String[] {RuntimeEnvironment.getApplication().getPackageName(), "org.example.files", "", "missing", "error"}) {
                try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
                    Uri uri = Uri.parse("content://" + authority + "/document/17");
                    Uri media = authority.endsWith("media") ? uri : Uri.parse("content://media/external/file/17");
                    MediaDocuments.alias = media;
                    var queries = new java.util.concurrent.atomic.AtomicInteger();
                    var opens = new java.util.concurrent.atomic.AtomicInteger();
                    var cursor = new android.database.MatrixCursor(new String[] {"owner_package_name"});
                    if (!owner.equals("missing")) cursor.addRow(new Object[] {owner.isEmpty() ? null : owner});
                    DocumentResolver.query = (requested, signal) -> {
                        assertEquals(media, requested);
                        queries.incrementAndGet();
                        if (owner.equals("error")) throw new SecurityException("Unavailable owner");
                        return cursor;
                    };
                    byte[] original = "existing Messenger content".getBytes(StandardCharsets.UTF_8);
                    ByteArrayOutputStream output = new ByteArrayOutputStream();
                    output.write(original);
                    DocumentResolver.onOpen = signal -> { opens.incrementAndGet(); output.reset(); };
                    Shadows.shadowOf(screen.get().getContentResolver()).registerOutputStream(uri, output);
                    // API 28 has no ownership column or document-to-media bridge.
                    boolean ordinaryOldDocument = android.os.Build.VERSION.SDK_INT == 28 && authority.equals("com.android.externalstorage.documents");
                    boolean allowed = ordinaryOldDocument || android.os.Build.VERSION.SDK_INT >= 29 && owner.equals("org.example.files");
                    startFile(screen.get(), true, uri);
                    awaitToast(allowed ? "Choices file saved" : "Couldn't export");
                    finishWorkers();
                    assertEquals(allowed ? 1 : 0, opens.get());
                    if (!allowed) assertArrayEquals(original, output.toByteArray());
                    else assertEquals(ChoiceCodec.encode(Settings.preferences, Settings.installed), output.toString(StandardCharsets.UTF_8));
                    if (android.os.Build.VERSION.SDK_INT >= 29) {
                        assertEquals(1, queries.get());
                        if (!owner.equals("error")) assertTrue(cursor.isClosed());
                    } else assertEquals(0, queries.get());
                }
            }
        }
    }

    @Test public void userPrefixedExternalDocumentsStillRoundTrip() throws Exception {
        Settings.installed = new HashSet<>(Set.of("stories"));
        Settings.preferences.edit().putBoolean("stories", false).commit();
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            SettingsActivity activity = screen.get();
            var provider = new android.content.pm.ProviderInfo();
            provider.name = "DocumentProvider";
            provider.authority = "choices.external";
            provider.packageName = "org.example.documents";
            provider.applicationInfo = new android.content.pm.ApplicationInfo();
            provider.applicationInfo.uid = android.os.Process.myUid() + 1;
            var owner = new android.content.pm.PackageInfo();
            owner.packageName = provider.packageName;
            owner.applicationInfo = provider.applicationInfo;
            owner.providers = new android.content.pm.ProviderInfo[] {provider};
            Shadows.shadowOf(activity.getPackageManager()).installPackage(owner);
            Uri uri = Uri.parse("content://0@choices.external/backup");
            ByteArrayOutputStream output = new ByteArrayOutputStream();
            Shadows.shadowOf(activity.getContentResolver()).registerOutputStream(uri, output);
            Shadows.shadowOf(activity.getContentResolver()).registerInputStream(uri,
                new ByteArrayInputStream((ChoiceCodec.HEADER + "\nstories=true\n").getBytes(StandardCharsets.UTF_8)));
            ShadowToast.reset();
            activity.getWindow().getDecorView().findViewWithTag("save_choices_file").performClick();
            activity.onActivityResult(SettingsActivity.SAVE_CHOICES, Activity.RESULT_OK, new Intent().setData(uri));
            awaitToast("Choices file saved");
            assertEquals(ChoiceCodec.encode(Settings.preferences, Settings.installed), output.toString(StandardCharsets.UTF_8));
            ShadowToast.reset();
            activity.getWindow().getDecorView().findViewWithTag("read_choices_file").performClick();
            activity.onActivityResult(SettingsActivity.READ_CHOICES, Activity.RESULT_OK, new Intent().setData(uri));
            awaitToast("Restored 1 choice");
            assertTrue(Settings.preferences.getBoolean("stories", false));
        }
    }

    @Test public void slowImportCannotOverwriteANewerImportOrChoice() throws Exception {
        for (boolean clipboard : new boolean[] {true, false}) {
            try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
                SettingsActivity activity = screen.get();
                CountDownLatch started = new CountDownLatch(1), release = new CountDownLatch(1), closed = new CountDownLatch(1);
                Uri uri = Uri.parse("content://choices/slow");
                Shadows.shadowOf(activity.getContentResolver()).registerInputStream(uri,
                    new ByteArrayInputStream((ChoiceCodec.HEADER + "\nstories=true\n").getBytes(StandardCharsets.UTF_8)) {
                        @Override public synchronized int read(byte[] bytes, int offset, int length) {
                            started.countDown();
                            try { if (!release.await(5, TimeUnit.SECONDS)) throw new IllegalStateException("Timed out"); }
                            catch (InterruptedException error) { throw new IllegalStateException(error); }
                            return super.read(bytes, offset, length);
                        }
                        @Override public void close() { closed.countDown(); }
                    });
                activity.getWindow().getDecorView().findViewWithTag("read_choices_file").performClick();
                activity.onActivityResult(SettingsActivity.READ_CHOICES, Activity.RESULT_OK, new Intent().setData(uri));
                try {
                    assertTrue(started.await(5, TimeUnit.SECONDS));
                    assertFalse(activity.getWindow().getDecorView().findViewWithTag("read_choices_file").isEnabled());
                    assertFalse(activity.getWindow().getDecorView().findViewWithTag("save_choices_file").isEnabled());
                    assertEquals("Reading choices file...", ((android.widget.TextView) activity.getWindow().getDecorView()
                        .findViewWithTag("choices_file_status")).getText().toString());
                    if (clipboard) {
                        clipboard(ChoiceCodec.HEADER + "\nstories=false\n");
                        activity.getWindow().getDecorView().findViewWithTag("import_choices").performClick();
                    } else {
                        Settings.preferences.edit().putBoolean("people", true).commit();
                    }
                } finally { release.countDown(); }
                assertTrue(closed.await(5, TimeUnit.SECONDS));
                // Closing the stream precedes posting the result, so drain after the worker exits.
                for (Thread thread : Thread.getAllStackTraces().keySet())
                    if ("HushChoicesDocument".equals(thread.getName())) thread.join(5000);
                Shadows.shadowOf(Looper.getMainLooper()).idle();
                assertFalse(Settings.preferences.getBoolean("stories", false));
                assertTrue(activity.getWindow().getDecorView().findViewWithTag("read_choices_file").isEnabled());
                assertEquals(View.GONE, activity.getWindow().getDecorView().findViewWithTag("choices_file_status").getVisibility());
            }
        }
    }

    @Test public void cancelBlockedReadRestoresActionsAndPreventsLateChoices() throws Exception {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            SettingsActivity activity = screen.get();
            Settings.installed = new HashSet<>(Set.of("stories"));
            CountDownLatch started = new CountDownLatch(1), release = new CountDownLatch(1);
            Uri uri = Uri.parse("content://choices/cancel");
            Shadows.shadowOf(activity.getContentResolver()).registerInputStream(uri,
                new ByteArrayInputStream((ChoiceCodec.HEADER + "\nstories=true\n").getBytes(StandardCharsets.UTF_8)) {
                    @Override public synchronized int read(byte[] bytes, int offset, int length) {
                        started.countDown();
                        try { if (!release.await(5, TimeUnit.SECONDS)) throw new IllegalStateException("Timed out"); }
                        catch (InterruptedException error) { throw new IllegalStateException(error); }
                        return super.read(bytes, offset, length);
                    }
                });
            View root = activity.getWindow().getDecorView();
            root.findViewWithTag("read_choices_file").performClick();
            activity.onActivityResult(SettingsActivity.READ_CHOICES, Activity.RESULT_OK, new Intent().setData(uri));
            try {
                assertTrue(started.await(5, TimeUnit.SECONDS));
                View cancel = root.findViewWithTag("cancel_choices_file");
                assertNotNull("An in-flight document must have a Cancel action", cancel);
                assertEquals(View.VISIBLE, cancel.getVisibility());
                cancel.performClick();
                assertTrue(root.findViewWithTag("save_choices_file").isEnabled());
                assertTrue(root.findViewWithTag("read_choices_file").isEnabled());
            } finally { release.countDown(); }
            for (Thread thread : Thread.getAllStackTraces().keySet())
                if ("HushChoicesDocument".equals(thread.getName())) thread.join(5000);
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            assertFalse(Settings.preferences.getBoolean("stories", false));
        }
    }

    @Test public void blockedOpenReceivesCancellationAndAllowsRetry() throws Exception {
        CountDownLatch started = new CountDownLatch(1), canceled = new CountDownLatch(1);
        DocumentResolver.opener = (uri, signal) -> {
            signal.setOnCancelListener(canceled::countDown);
            started.countDown();
            try { assertTrue(canceled.await(5, TimeUnit.SECONDS)); }
            catch (InterruptedException ignored) { }
            signal.throwIfCanceled();
            return null;
        };
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            SettingsActivity activity = screen.get();
            startFile(activity, false, Uri.parse("content://choices/open"));
            assertTrue(started.await(5, TimeUnit.SECONDS));
            activity.getWindow().getDecorView().findViewWithTag("cancel_choices_file").performClick();
            assertTrue(canceled.await(5, TimeUnit.SECONDS));
            finishWorkers();
            DocumentResolver.opener = null;
            Uri retry = Uri.parse("content://choices/retry");
            Settings.installed = new HashSet<>(Set.of("stories"));
            Shadows.shadowOf(activity.getContentResolver()).registerInputStream(retry,
                new ByteArrayInputStream((ChoiceCodec.HEADER + "\nstories=true\n").getBytes(StandardCharsets.UTF_8)));
            startFile(activity, false, retry);
            awaitToast("Restored 1 choice");
            assertTrue(Settings.preferences.getBoolean("stories", false));
        }
    }

    @Test public void deadlineDetachesUncooperativeOpensAndBoundsRetryWorkers() throws Exception {
        CountDownLatch started = new CountDownLatch(2), release = new CountDownLatch(1);
        var opens = new java.util.concurrent.atomic.AtomicInteger();
        DocumentResolver.opener = (uri, signal) -> {
            opens.incrementAndGet();
            started.countDown();
            while (release.getCount() != 0) {
                try { release.await(); }
                catch (InterruptedException ignored) { }
            }
            return null;
        };
        SettingsActivity.documentTimeoutMillis = 50;
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            SettingsActivity activity = screen.get();
            View root = activity.getWindow().getDecorView();
            Uri uri = Uri.parse("content://choices/ignores-cancellation");
            startFile(activity, false, uri);
            long until = System.nanoTime() + TimeUnit.SECONDS.toNanos(5);
            while (opens.get() == 0 && System.nanoTime() < until) Thread.sleep(10);
            assertEquals(1, opens.get());
            Shadows.shadowOf(Looper.getMainLooper()).idleFor(51, TimeUnit.MILLISECONDS);
            assertTrue(((android.widget.TextView) root.findViewWithTag("choices_file_status")).getText().toString().contains("too long"));
            assertTrue(root.findViewWithTag("read_choices_file").isEnabled());
            startFile(activity, false, uri);
            assertTrue(started.await(5, TimeUnit.SECONDS));
            root.findViewWithTag("cancel_choices_file").performClick();
            startFile(activity, false, uri);
            assertEquals(2, opens.get());
            assertTrue(((android.widget.TextView) root.findViewWithTag("choices_file_status")).getText().toString().startsWith("Earlier file"));
            assertTrue(root.findViewWithTag("save_choices_file").isEnabled());
            release.countDown();
            finishWorkers();
            DocumentResolver.opener = null;
            Shadows.shadowOf(activity.getContentResolver()).registerInputStream(uri,
                new ByteArrayInputStream((ChoiceCodec.HEADER + "\npaused=true\n").getBytes(StandardCharsets.UTF_8)));
            startFile(activity, false, uri);
            awaitToast("Restored 1 choice");
            assertTrue(Settings.preferences.getBoolean("paused", false));
        } finally {
            release.countDown();
            finishWorkers();
            SettingsActivity.documentTimeoutMillis = 30_000;
        }
    }

    @Test public void destructionClearsOwnerAndClosesAfterAThrowingCancelListener() throws Exception {
        CountDownLatch started = new CountDownLatch(1), release = new CountDownLatch(1), closed = new CountDownLatch(1);
        var canceled = new CountDownLatch(1);
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            SettingsActivity activity = screen.get();
            Uri uri = Uri.parse("content://choices/destroy");
            var input = new ByteArrayInputStream((ChoiceCodec.HEADER + "\nstories=true\n").getBytes(StandardCharsets.UTF_8)) {
                @Override public synchronized int read(byte[] bytes, int offset, int length) {
                    started.countDown();
                    while (release.getCount() != 0) {
                        try { release.await(); } catch (InterruptedException ignored) { }
                    }
                    return super.read(bytes, offset, length);
                }
                @Override public void close() { release.countDown(); closed.countDown(); }
            };
            Shadows.shadowOf(activity.getContentResolver()).registerInputStream(uri, input);
            // Install the listener on the actual signal without changing the stream fault fixture.
            DocumentResolver.onOpen = signal -> signal.setOnCancelListener(() -> {
                canceled.countDown();
                throw new IllegalStateException("private provider details");
            });
            Settings.installed = new HashSet<>(Set.of("stories"));
            startFile(activity, false, uri);
            assertTrue(started.await(5, TimeUnit.SECONDS));
            var field = SettingsActivity.class.getDeclaredField("documentJob");
            field.setAccessible(true);
            Object job = field.get(activity);
            var ownerField = job.getClass().getDeclaredField("owner");
            ownerField.setAccessible(true);
            var owner = (java.lang.ref.WeakReference<?>) ownerField.get(job);
            assertSame(activity, owner.get());
            screen.pause().stop().destroy();
            assertNull(owner.get());
            assertTrue(canceled.await(5, TimeUnit.SECONDS));
            assertTrue(closed.await(5, TimeUnit.SECONDS));
            finishWorkers();
            assertFalse(Settings.preferences.getBoolean("stories", false));
            assertTrue(org.robolectric.shadows.ShadowLog.getLogsForTag("HushMessenger").stream()
                .noneMatch(log -> log.throwable != null || log.msg.contains("private provider details")));
        } finally { release.countDown(); finishWorkers(); }
    }

    @Test public void aStartedSaveFinishesAfterRotationOrBackWithoutKeepingTheScreen() throws Exception {
        for (boolean rotate : new boolean[] {false, true}) {
            CountDownLatch started = new CountDownLatch(1), release = new CountDownLatch(1);
            var canceled = new java.util.concurrent.atomic.AtomicBoolean();
            var bytes = new ByteArrayOutputStream() {
                @Override public synchronized void write(byte[] data) throws java.io.IOException {
                    started.countDown();
                    while (release.getCount() != 0) {
                        try { release.await(); } catch (InterruptedException ignored) { }
                    }
                    super.write(data);
                }
            };
            try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
                SettingsActivity original = screen.get();
                Settings.installed = new HashSet<>(Set.of("stories"));
                String expected = ChoiceCodec.encode(Settings.preferences, Settings.installed);
                Uri uri = Uri.parse("content://choices/save-after-close");
                Shadows.shadowOf(original.getContentResolver()).registerOutputStream(uri, bytes);
                DocumentResolver.onOpen = signal -> signal.setOnCancelListener(() -> canceled.set(true));
                startFile(original, true, uri);
                assertTrue(started.await(5, TimeUnit.SECONDS));
                Object job = org.robolectric.util.ReflectionHelpers.getField(original, "documentJob");
                java.lang.ref.WeakReference<?> owner = org.robolectric.util.ReflectionHelpers.getField(job, "owner");
                if (rotate) screen.recreate();
                else screen.pause().stop().destroy();
                assertNull(owner.get());
                release.countDown();
                finishWorkers();
                assertFalse("Closing the screen must not cancel an authorized save", canceled.get());
                assertEquals(expected, bytes.toString(StandardCharsets.UTF_8));
                assertEquals("Choices file saved", ShadowToast.getTextOfLatestToast());
            } finally { release.countDown(); finishWorkers(); }
        }
    }

    @Test public void aDetachedSaveStillTimesOutAndReportsTheIncompleteFile() throws Exception {
        CountDownLatch started = new CountDownLatch(1), canceled = new CountDownLatch(1);
        SettingsActivity.documentTimeoutMillis = 100;
        DocumentResolver.onOpen = signal -> {
            signal.setOnCancelListener(canceled::countDown);
            started.countDown();
            try { canceled.await(5, TimeUnit.SECONDS); }
            catch (InterruptedException interrupted) { Thread.currentThread().interrupt(); }
            signal.throwIfCanceled();
        };
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            startFile(screen.get(), true, Uri.parse("content://choices/detached-timeout"));
            assertTrue(started.await(5, TimeUnit.SECONDS));
            screen.pause().stop().destroy();
            assertEquals(1, canceled.getCount());
            Shadows.shadowOf(Looper.getMainLooper()).idleFor(java.time.Duration.ofMillis(101));
            assertTrue(canceled.await(5, TimeUnit.SECONDS));
            finishWorkers();
            assertEquals("The file save or restore took too long. Try again. A save may leave an incomplete file.", ShadowToast.getTextOfLatestToast());
        } finally { canceled.countDown(); finishWorkers(); SettingsActivity.documentTimeoutMillis = 30_000; }
    }

    @Test public void realDescriptorSlicesPreserveInputAndOutputBoundaries() throws Exception {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            SettingsActivity activity = screen.get();
            Settings.installed = new HashSet<>(Set.of("stories"));
            for (boolean saving : new boolean[] {false, true}) {
                byte[] payload = (saving ? ChoiceCodec.encode(Settings.preferences, Settings.installed) :
                    ChoiceCodec.HEADER + "\nstories=true\n").getBytes(StandardCharsets.UTF_8);
                var file = Files.createTempFile("choices-slice", ".txt");
                byte[] prefix = "prefix:".getBytes(StandardCharsets.UTF_8), suffix = ":suffix".getBytes(StandardCharsets.UTF_8);
                ByteArrayOutputStream bytes = new ByteArrayOutputStream();
                bytes.write(prefix);
                bytes.write(saving ? new byte[payload.length] : payload);
                bytes.write(suffix);
                Files.write(file, bytes.toByteArray());
                ParcelFileDescriptor descriptor = ParcelFileDescriptor.open(file.toFile(), saving ?
                    ParcelFileDescriptor.MODE_READ_WRITE : ParcelFileDescriptor.MODE_READ_ONLY);
                DocumentResolver.opener = (uri, signal) -> new AssetFileDescriptor(descriptor, prefix.length, payload.length);
                try {
                    ShadowToast.reset();
                    startFile(activity, saving, Uri.parse("content://choices/slice"));
                    awaitToast(saving ? "Choices file saved" : "Restored 1 choice");
                    finishWorkers();
                    byte[] result = Files.readAllBytes(file);
                    assertArrayEquals(prefix, java.util.Arrays.copyOfRange(result, 0, prefix.length));
                    assertArrayEquals(payload, java.util.Arrays.copyOfRange(result, prefix.length, prefix.length + payload.length));
                    assertArrayEquals(suffix, java.util.Arrays.copyOfRange(result, prefix.length + payload.length, result.length));
                } finally { descriptor.close(); Files.deleteIfExists(file); }
            }
        }
    }

    @Test public void tooSmallOutputSliceFailsWithoutChangingAnyBytes() throws Exception {
        var file = Files.createTempFile("choices-short-slice", ".txt");
        byte[] original = "prefix:short:suffix".getBytes(StandardCharsets.UTF_8);
        Files.write(file, original);
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup();
             ParcelFileDescriptor descriptor = ParcelFileDescriptor.open(file.toFile(), ParcelFileDescriptor.MODE_READ_WRITE)) {
            DocumentResolver.opener = (uri, signal) -> new AssetFileDescriptor(descriptor, 7, 5);
            startFile(screen.get(), true, Uri.parse("content://choices/short-slice"));
            awaitToast("Couldn't export");
            finishWorkers();
            assertArrayEquals(original, Files.readAllBytes(file));
        } finally { Files.deleteIfExists(file); }
    }

    @Test public void prepositionedInputSlicesUseTheirAbsoluteStartOffset() throws Exception {
        byte[] payload = (ChoiceCodec.HEADER + "\nstories=true\n").getBytes(StandardCharsets.UTF_8);
        byte[] prefix = "provider prefix:".getBytes(StandardCharsets.UTF_8);
        byte[] suffix = ":provider suffix".getBytes(StandardCharsets.UTF_8);
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        bytes.write(prefix); bytes.write(payload); bytes.write(suffix);
        var file = Files.createTempFile("choices-positioned-slice", ".txt");
        Files.write(file, bytes.toByteArray());
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup();
             var descriptor = ParcelFileDescriptor.open(file.toFile(), ParcelFileDescriptor.MODE_READ_ONLY)) {
            Settings.installed = new HashSet<>(Set.of("stories"));
            // Providers may pass an already-used descriptor rather than a newly opened one.
            ShadowParcelFileDescriptor shadow = org.robolectric.shadow.api.Shadow.extract(descriptor);
            java.io.RandomAccessFile underlying = org.robolectric.util.ReflectionHelpers.getField(shadow, "file");
            underlying.seek(prefix.length + 4);
            DocumentResolver.opener = (uri, signal) -> new AssetFileDescriptor(descriptor, prefix.length, payload.length);
            startFile(screen.get(), false, Uri.parse("content://choices/positioned-slice"));
            awaitToast("Restored 1 choice");
            finishWorkers();
            assertTrue(Settings.preferences.getBoolean("stories", false));
            assertArrayEquals(bytes.toByteArray(), Files.readAllBytes(file));
        } finally { Files.deleteIfExists(file); }
    }

    @Test public void aFailedAbsoluteSeekKeepsExistingChoicesAndReportsFailure() throws Exception {
        var file = Files.createTempFile("choices-bad-seek", ".txt");
        byte[] original = (ChoiceCodec.HEADER + "\nstories=true\n").getBytes(StandardCharsets.UTF_8);
        Files.write(file, original);
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup();
             var descriptor = ParcelFileDescriptor.open(file.toFile(), ParcelFileDescriptor.MODE_READ_ONLY)) {
            Settings.installed = new HashSet<>(Set.of("stories"));
            SeekableOs.errno = android.system.OsConstants.EBADF;
            DocumentResolver.opener = (uri, signal) -> new AssetFileDescriptor(descriptor, 0, original.length);
            startFile(screen.get(), false, Uri.parse("content://choices/bad-seek"));
            awaitToast("Not a valid HushMessenger backup");
            finishWorkers();
            assertFalse(Settings.preferences.getBoolean("stories", false));
            assertArrayEquals(original, Files.readAllBytes(file));
        } finally { Files.deleteIfExists(file); }
    }

    @Test @Config(sdk = {30, 36}) public void atomicReplacementUsesPosixSemanticsAlongsideDocumentShadows() throws Exception {
        var file = Files.createTempFile("choices-atomic", ".txt");
        var atomic = new android.util.AtomicFile(file.toFile());
        try {
            Files.write(file, "old".getBytes(StandardCharsets.UTF_8));
            var output = atomic.startWrite();
            output.write("new".getBytes(StandardCharsets.UTF_8));
            atomic.finishWrite(output);
            assertArrayEquals("new".getBytes(StandardCharsets.UTF_8), Files.readAllBytes(file));
            assertFalse(Files.exists(java.nio.file.Path.of(file + ".new")));
        } finally { atomic.delete(); }
    }

    @Test @Config(sdk = {28, 29, 36}) public void aNonSeekableFiniteStreamStillRestoresChoices() throws Exception {
        var file = Files.createTempFile("choices-nonseekable", ".txt");
        byte[] original = (ChoiceCodec.HEADER + "\nstories=true\n").getBytes(StandardCharsets.UTF_8);
        Files.write(file, original);
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup();
             var descriptor = ParcelFileDescriptor.open(file.toFile(), ParcelFileDescriptor.MODE_READ_ONLY)) {
            Settings.installed = new HashSet<>(Set.of("stories"));
            SeekableOs.errno = android.system.OsConstants.ESPIPE;
            DocumentResolver.opener = (uri, signal) -> new AssetFileDescriptor(descriptor, 0, original.length);
            startFile(screen.get(), false, Uri.parse("content://choices/nonseekable"));
            awaitToast("Restored 1 choice");
            finishWorkers();
            assertTrue(Settings.preferences.getBoolean("stories", false));
            assertArrayEquals(original, Files.readAllBytes(file));
        } finally { Files.deleteIfExists(file); }
    }

    @Test @Config(sdk = 36, qualifiers = "w411dp-h914dp-mdpi")
    @org.robolectric.annotation.GraphicsMode(org.robolectric.annotation.GraphicsMode.Mode.NATIVE)
    public void cancelFileActionIsReachableWithNativeRenderingAndLargeText() throws Exception {
        for (boolean light : new boolean[] {false, true}) for (float scale : new float[] {1f, 2f}) {
            RuntimeEnvironment.setFontScale(scale);
            Settings.preferences.edit().clear().putBoolean("light", light).commit();
            CountDownLatch started = new CountDownLatch(1), release = new CountDownLatch(1);
            DocumentResolver.opener = (uri, signal) -> {
                signal.setOnCancelListener(release::countDown);
                started.countDown();
                while (release.getCount() != 0) {
                    try { release.await(); } catch (InterruptedException ignored) { }
                }
                return null;
            };
            try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
                SettingsActivity activity = screen.get();
                View root = activity.getWindow().getDecorView();
                root.findViewWithTag("tab_app").performClick();
                startFile(activity, true, Uri.parse("content://choices/native-render"));
                assertTrue(started.await(5, TimeUnit.SECONDS));
                View cancel = root.findViewWithTag("cancel_choices_file");
                assertEquals(View.VISIBLE, cancel.getVisibility());
                renderFileState(root, cancel, light, scale, "busy");
                assertTrue(cancel.performAccessibilityAction(android.view.accessibility.AccessibilityNodeInfo.ACTION_CLICK, null));
                assertTrue(root.findViewWithTag("save_choices_file").isEnabled());
                assertTrue(root.findViewWithTag("read_choices_file").isEnabled());
                assertEquals(View.GONE, cancel.getVisibility());
                var status = (android.widget.TextView) root.findViewWithTag("choices_file_status");
                assertEquals(View.ACCESSIBILITY_LIVE_REGION_POLITE, status.getAccessibilityLiveRegion());
                assertTrue(status.getText().toString().contains("incomplete file"));
                renderFileState(root, status, light, scale, "canceled");
            } finally { release.countDown(); finishWorkers(); }
        }
        RuntimeEnvironment.setFontScale(1f);
    }

    private static void renderFileState(View root, View target, boolean light, float scale, String state) throws Exception {
        for (int pass = 0; pass < 3; pass++) {
            root.measure(View.MeasureSpec.makeMeasureSpec(411, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(914, View.MeasureSpec.EXACTLY));
            root.layout(0, 0, 411, 914);
            if (pass == 1) target.requestRectangleOnScreen(new android.graphics.Rect(0, 0, target.getWidth(), target.getHeight()), true);
            Shadows.shadowOf(Looper.getMainLooper()).idle();
        }
        android.graphics.Rect visible = new android.graphics.Rect();
        assertTrue(target.getGlobalVisibleRect(visible));
        assertEquals("Whole action/status remains visible", target.getHeight(), visible.height());
        String output = System.getenv("HUSH_SETTINGS_CAPTURES");
        if (output != null) {
            var directory = java.nio.file.Path.of(output);
            Files.createDirectories(directory);
            var pixels = android.graphics.Bitmap.createBitmap(411, 914, android.graphics.Bitmap.Config.ARGB_8888);
            root.draw(new android.graphics.Canvas(pixels));
            try (var stream = Files.newOutputStream(directory.resolve("choices-" + (light ? "light" : "dark") +
                    "-" + (int) scale + "-" + state + ".png"))) {
                assertTrue(pixels.compress(android.graphics.Bitmap.CompressFormat.PNG, 100, stream));
            } finally { pixels.recycle(); }
        }
    }

    private static void startFile(SettingsActivity activity, boolean saving, Uri uri) {
        activity.getWindow().getDecorView().findViewWithTag(saving ? "save_choices_file" : "read_choices_file").performClick();
        activity.onActivityResult(saving ? SettingsActivity.SAVE_CHOICES : SettingsActivity.READ_CHOICES,
            Activity.RESULT_OK, new Intent().setData(uri));
    }

    private static void finishWorkers() throws InterruptedException {
        for (Thread thread : Thread.getAllStackTraces().keySet())
            if (thread.getName().equals("HushChoicesDocument") || thread.getName().equals("HushChoicesCancel")) thread.join(5000);
        Shadows.shadowOf(Looper.getMainLooper()).idle();
    }

    private static void clipboard(String text) {
        RuntimeEnvironment.getApplication().getSystemService(ClipboardManager.class).setPrimaryClip(ClipData.newPlainText("choices", text));
    }

    private static void awaitToast(String prefix) throws InterruptedException {
        long deadline = System.currentTimeMillis() + 5000;
        do {
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            String toast = ShadowToast.getTextOfLatestToast();
            if (toast != null && toast.startsWith(prefix)) return;
            Thread.sleep(20);
        } while (System.currentTimeMillis() < deadline);
        fail("Missing document result: " + prefix);
    }
}
