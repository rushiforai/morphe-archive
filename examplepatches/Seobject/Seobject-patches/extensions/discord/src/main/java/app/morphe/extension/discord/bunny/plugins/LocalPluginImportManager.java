package app.morphe.extension.discord.bunny.plugins;

import android.app.Activity;
import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.net.Uri;
import android.provider.OpenableColumns;

import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.Locale;
import java.util.UUID;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Native Android boundary for Bunny local plugin packages.
 *
 * This class only selects, reads, validates, and stages a .bunnyplugin
 * transport package.
 *
 * It does NOT:
 * - evaluate the selected JavaScript;
 * - install or register a plugin;
 * - start a plugin;
 * - modify plugins/manifests;
 * - modify plugins/scripts;
 * - modify plugins/settings.json.
 */
public final class LocalPluginImportManager {
    public static final int REQUEST_CODE = 0xB153;

    /*
     * Grounded in PluginRollbackManager.MAX_PLUGIN_BYTES:
     * 16 * 1024 * 1024 bytes per modern plugin component.
     */
    private static final long MAX_COMPONENT_BYTES =
            16L * 1024L * 1024L;

    /*
     * The .bunnyplugin envelope contains the manifest and script, so permit
     * at most two existing component limits for the complete transport.
     */
    private static final long MAX_PACKAGE_BYTES =
            MAX_COMPONENT_BYTES * 2L;

    private static final Object LOCK =
            new Object();

    private static final ExecutorService EXECUTOR =
            Executors.newSingleThreadExecutor(
                    runnable -> {
                        Thread thread =
                                new Thread(
                                        runnable,
                                        "BunnyMorphe-LocalPluginImport"
                                );

                        thread.setDaemon(true);
                        return thread;
                    }
            );

    private static boolean pending;
    private static Object pendingPromise;
    private static Context pendingContext;

    private LocalPluginImportManager() {
    }

    /**
     * Opens Android's document picker.
     *
     * The selected package is only validated and staged.
     */
    public static boolean begin(
            Activity activity,
            Context context,
            Object promise
    ) {
        if (activity == null || context == null) {
            resolve(
                    promise,
                    result(
                            "error",
                            null,
                            null,
                            null,
                            null,
                            null,
                            "Discord does not currently have an active window."
                    )
            );

            return true;
        }

        Context applicationContext =
                context.getApplicationContext();

        if (applicationContext == null) {
            applicationContext = context;
        }

        synchronized (LOCK) {
            if (pending) {
                resolve(
                        promise,
                        result(
                                "error",
                                null,
                                null,
                                null,
                                null,
                                null,
                                "A local plugin picker is already open."
                        )
                );

                return true;
            }

            pending = true;
            pendingPromise = promise;
            pendingContext = applicationContext;
        }

        activity.runOnUiThread(
                () -> {
                    try {
                        Intent picker =
                                new Intent(
                                        Intent.ACTION_OPEN_DOCUMENT
                                );

                        picker.addCategory(
                                Intent.CATEGORY_OPENABLE
                        );

                        /*
                         * Android document providers do not agree on a MIME
                         * type for custom extensions. Use a broad picker and
                         * enforce .bunnyplugin + transport validation after
                         * Android returns the content URI.
                         */
                        picker.setType("*/*");

                        picker.putExtra(
                                Intent.EXTRA_MIME_TYPES,
                                new String[]{
                                        "application/json",
                                        "application/octet-stream",
                                        "text/plain"
                                }
                        );

                        activity.startActivityForResult(
                                picker,
                                REQUEST_CODE
                        );
                    }
                    catch (Throwable error) {
                        failPending(
                                "Could not open Android's plugin file picker."
                        );
                    }
                }
        );

        return true;
    }

    /**
     * Consumes only Bunny's own local-plugin picker request code.
     */
    public static boolean handleActivityResult(
            int requestCode,
            int resultCode,
            Intent data
    ) {
        if (requestCode != REQUEST_CODE) {
            return false;
        }

        final Object promise;
        final Context context;
        final boolean wasPending;

        synchronized (LOCK) {
            wasPending = pending;
            promise = pendingPromise;
            context = pendingContext;

            pending = false;
            pendingPromise = null;
            pendingContext = null;
        }

        /*
         * REQUEST_CODE is Bunny-owned, so consume it even if Java state was
         * lost rather than passing it into Discord's result handling.
         */
        if (!wasPending) {
            return true;
        }

        if (resultCode == Activity.RESULT_CANCELED) {
            resolve(
                    promise,
                    result(
                            "cancelled",
                            null,
                            null,
                            null,
                            null,
                            null,
                            null
                    )
            );

            return true;
        }

        if (resultCode != Activity.RESULT_OK) {
            resolve(
                    promise,
                    result(
                            "error",
                            null,
                            null,
                            null,
                            null,
                            null,
                            "Android did not return a successful file selection."
                    )
            );

            return true;
        }

        if (context == null) {
            resolve(
                    promise,
                    result(
                            "error",
                            null,
                            null,
                            null,
                            null,
                            null,
                            "Discord context is unavailable."
                    )
            );

            return true;
        }

        Uri uri =
                data == null
                        ? null
                        : data.getData();

        if (uri == null) {
            resolve(
                    promise,
                    result(
                            "error",
                            null,
                            null,
                            null,
                            null,
                            null,
                            "Android did not return a selected document."
                    )
            );

            return true;
        }

        EXECUTOR.execute(
                () -> validateAndStage(
                        context,
                        uri,
                        promise
                )
        );

        return true;
    }

    private static void validateAndStage(
            Context context,
            Uri uri,
            Object promise
    ) {
        try {
            if (
                    !"content".equalsIgnoreCase(
                            uri.getScheme()
                    )
            ) {
                throw new IllegalArgumentException(
                        "Local plugin imports must use an Android content URI."
                );
            }

            ContentResolver resolver =
                    context.getContentResolver();

            DocumentInfo info =
                    inspectDocument(
                            resolver,
                            uri
                    );

            if (
                    !info.name
                            .toLowerCase(Locale.ROOT)
                            .endsWith(".bunnyplugin")
            ) {
                throw new IllegalArgumentException(
                        "Choose a .bunnyplugin plugin package."
                );
            }

            if (
                    info.size >= 0L
                            && info.size > MAX_PACKAGE_BYTES
            ) {
                throw new IllegalArgumentException(
                        "The selected plugin package is too large."
                );
            }

            byte[] bytes =
                    readBounded(
                            resolver,
                            uri
                    );

            /*
             * Security boundary.
             *
             * This parses and validates the transport only. The script field
             * remains inert text and is never evaluated here.
             */
            LocalPluginPackage.parse(bytes);

            JSONObject envelope =
                    new JSONObject(
                            new String(
                                    bytes,
                                    StandardCharsets.UTF_8
                            )
                    );

            JSONObject manifest =
                    envelope.getJSONObject(
                            "manifest"
                    );

            String script =
                    envelope.getString(
                            "script"
                    );

            if (
                    script.getBytes(
                            StandardCharsets.UTF_8
                    ).length > MAX_COMPONENT_BYTES
            ) {
                throw new IllegalArgumentException(
                        "The plugin script exceeds Bunny's plugin size limit."
                );
            }

            if (
                    manifest.toString()
                            .getBytes(
                                    StandardCharsets.UTF_8
                            ).length > MAX_COMPONENT_BYTES
            ) {
                throw new IllegalArgumentException(
                        "The plugin manifest exceeds Bunny's plugin size limit."
                );
            }

            String id =
                    manifest.getString("id");

            String version =
                    manifest.getString("version");

            String name =
                    manifest
                            .getJSONObject("display")
                            .getString("name");

            String repository = null;

            JSONObject provenance =
                    envelope.optJSONObject(
                            "provenance"
                    );

            if (
                    provenance != null
                            && provenance.has("repository")
                            && !provenance.isNull("repository")
            ) {
                repository =
                        provenance.getString(
                                "repository"
                        );
            }

            String token =
                    stage(
                            context,
                            bytes
                    );

            resolve(
                    promise,
                    result(
                            "success",
                            token,
                            id,
                            name,
                            version,
                            repository,
                            "Validated local plugin package."
                    )
            );
        }
        catch (Throwable error) {
            resolve(
                    promise,
                    result(
                            "error",
                            null,
                            null,
                            null,
                            null,
                            null,
                            cleanMessage(error)
                    )
            );
        }
    }

    private static DocumentInfo inspectDocument(
            ContentResolver resolver,
            Uri uri
    ) {
        String name = null;
        long size = -1L;

        try (
                Cursor cursor =
                        resolver.query(
                                uri,
                                new String[]{
                                        OpenableColumns.DISPLAY_NAME,
                                        OpenableColumns.SIZE
                                },
                                null,
                                null,
                                null
                        )
        ) {
            if (
                    cursor != null
                            && cursor.moveToFirst()
            ) {
                int nameColumn =
                        cursor.getColumnIndex(
                                OpenableColumns.DISPLAY_NAME
                        );

                if (
                        nameColumn >= 0
                                && !cursor.isNull(nameColumn)
                ) {
                    name =
                            cursor.getString(
                                    nameColumn
                            );
                }

                int sizeColumn =
                        cursor.getColumnIndex(
                                OpenableColumns.SIZE
                        );

                if (
                        sizeColumn >= 0
                                && !cursor.isNull(sizeColumn)
                ) {
                    size =
                            cursor.getLong(
                                    sizeColumn
                            );
                }
            }
        }
        catch (Throwable ignored) {
            /*
             * Metadata is advisory. The actual stream read remains bounded.
             */
        }

        if (
                name == null
                        || name.trim().isEmpty()
        ) {
            name =
                    uri.getLastPathSegment();
        }

        if (
                name == null
                        || name.trim().isEmpty()
        ) {
            throw new IllegalArgumentException(
                    "Android did not provide a usable plugin filename."
            );
        }

        return new DocumentInfo(
                name.trim(),
                size
        );
    }

    private static byte[] readBounded(
            ContentResolver resolver,
            Uri uri
    ) throws Exception {
        try (
                InputStream input =
                        resolver.openInputStream(uri)
        ) {
            if (input == null) {
                throw new IllegalArgumentException(
                        "Android could not open the selected plugin package."
                );
            }

            ByteArrayOutputStream output =
                    new ByteArrayOutputStream();

            byte[] buffer =
                    new byte[8192];

            long total = 0L;

            while (true) {
                int count =
                        input.read(buffer);

                if (count < 0) {
                    break;
                }

                if (count == 0) {
                    continue;
                }

                total += count;

                if (total > MAX_PACKAGE_BYTES) {
                    throw new IllegalArgumentException(
                            "The selected plugin package is too large."
                    );
                }

                output.write(
                        buffer,
                        0,
                        count
                );
            }

            return output.toByteArray();
        }
    }

    /**
     * Stage into Bunny-private storage only.
     *
     * This directory is intentionally separate from the live plugin engine.
     */
    private static String stage(
            Context context,
            byte[] bytes
    ) throws Exception {
        File directory =
                new File(
                        context.getFilesDir(),
                        "pyoncord/imports/plugins/staged"
                );

        if (
                !directory.isDirectory()
                        && !directory.mkdirs()
        ) {
            throw new IllegalStateException(
                    "Could not create Bunny's private plugin staging directory."
            );
        }

        /*
         * Keep only the newest unconsumed selection.
         */
        File[] existing =
                directory.listFiles();

        if (existing != null) {
            for (File file : existing) {
                if (!file.isFile()) {
                    continue;
                }

                String lower =
                        file.getName()
                                .toLowerCase(
                                        Locale.ROOT
                                );

                if (
                        lower.endsWith(".bunnyplugin")
                                || lower.endsWith(".tmp")
                ) {
                    if (!file.delete()) {
                        throw new IllegalStateException(
                                "Could not clear a previous staged plugin package."
                        );
                    }
                }
            }
        }

        String token =
                UUID.randomUUID().toString();

        File temporary =
                new File(
                        directory,
                        token + ".tmp"
                );

        File staged =
                new File(
                        directory,
                        token + ".bunnyplugin"
                );

        try (
                FileOutputStream output =
                        new FileOutputStream(
                                temporary,
                                false
                        )
        ) {
            output.write(bytes);
            output.flush();
            output.getFD().sync();
        }

        if (!temporary.renameTo(staged)) {
            temporary.delete();

            throw new IllegalStateException(
                    "Could not finalize Bunny's staged plugin package."
            );
        }

        return token;
    }

    /**
     * Commits a previously validated staged package into Bunny's normal
     * modern plugin manifest/script storage.
     *
     * This boundary does not register, enable, start, or execute a plugin.
     */
    public static boolean commit(
            Context context,
            String token,
            boolean allowReplace,
            Object promise
    ) {
        if (context == null) {
            resolve(
                    promise,
                    result(
                            "error",
                            null,
                            null,
                            null,
                            null,
                            null,
                            "Discord context is unavailable."
                    )
            );

            return true;
        }

        final String normalizedToken;

        try {
            String raw =
                    token == null
                            ? ""
                            : token.trim();

            UUID uuid =
                    UUID.fromString(raw);

            normalizedToken =
                    uuid.toString();

            if (
                    !normalizedToken.equals(
                            raw.toLowerCase(Locale.ROOT)
                    )
            ) {
                throw new IllegalArgumentException();
            }
        }
        catch (Throwable error) {
            resolve(
                    promise,
                    result(
                            "error",
                            null,
                            null,
                            null,
                            null,
                            null,
                            "The staged local plugin token is invalid."
                    )
            );

            return true;
        }

        Context applicationContext =
                context.getApplicationContext();

        if (applicationContext == null) {
            applicationContext =
                    context;
        }

        final Context resolvedContext =
                applicationContext;

        EXECUTOR.execute(
                () -> commitStagedPackage(
                        resolvedContext,
                        normalizedToken,
                        allowReplace,
                        promise
                )
        );

        return true;
    }

    private static void commitStagedPackage(
            Context context,
            String token,
            boolean allowReplace,
            Object promise
    ) {
        File staged =
                new File(
                        new File(
                                context.getFilesDir(),
                                "pyoncord/imports/plugins/staged"
                        ),
                        token + ".bunnyplugin"
                );

        try {
            if (
                    !staged.isFile()
                            || !staged.canRead()
            ) {
                throw new IllegalArgumentException(
                        "The validated local plugin package is no longer staged."
                );
            }

            if (staged.length() > MAX_PACKAGE_BYTES) {
                throw new IllegalArgumentException(
                        "The staged plugin package is too large."
                );
            }

            byte[] bytes =
                    readBoundedFile(
                            staged,
                            MAX_PACKAGE_BYTES
                    );

            /*
             * Revalidate the exact bytes entering live plugin storage.
             * The JavaScript payload remains inert at this boundary.
             */
            LocalPluginPackage.parse(bytes);

            JSONObject envelope =
                    new JSONObject(
                            new String(
                                    bytes,
                                    StandardCharsets.UTF_8
                            )
                    );

            JSONObject manifest =
                    envelope.getJSONObject(
                            "manifest"
                    );

            String script =
                    envelope.getString(
                            "script"
                    );

            String id =
                    manifest.getString(
                            "id"
                    );

            String version =
                    manifest.getString(
                            "version"
                    );

            String name =
                    manifest
                            .getJSONObject("display")
                            .getString("name");

            String repository =
                    null;

            JSONObject provenance =
                    envelope.optJSONObject(
                            "provenance"
                    );

            if (
                    provenance != null
                            && provenance.has("repository")
                            && !provenance.isNull("repository")
            ) {
                repository =
                        provenance.getString(
                                "repository"
                        );
            }

            byte[] scriptBytes =
                    script.getBytes(
                            StandardCharsets.UTF_8
                    );

            if (scriptBytes.length > MAX_COMPONENT_BYTES) {
                throw new IllegalArgumentException(
                        "The plugin script exceeds Bunny's plugin size limit."
                );
            }

            /*
             * Bunny owns these runtime-only fields. LocalPluginPackage rejects
             * packages that try to provide them.
             *
             * parentRepository is deliberately not created.
             */
            manifest.put(
                    "__bunnyLocal",
                    true
            );

            manifest.put(
                    "jsPath",
                    "plugins/scripts/" +
                            id +
                            ".js"
            );

            byte[] manifestBytes =
                    manifest.toString()
                            .getBytes(
                                    StandardCharsets.UTF_8
                            );

            if (manifestBytes.length > MAX_COMPONENT_BYTES) {
                throw new IllegalArgumentException(
                        "The plugin manifest exceeds Bunny's plugin size limit."
                );
            }

            File bunnyRoot =
                    new File(
                            context.getFilesDir(),
                            "pyoncord"
                    );

            /*
             * Native defense in depth: never replace an ID Bunny already
             * considers installed. Registered-but-uninstalled replacement
             * must be explicitly authorized by the JS plugin engine.
             */
            File settingsFile =
                    new File(
                            bunnyRoot,
                            "plugins/settings.json"
                    );

            if (settingsFile.isFile()) {
                byte[] settingsBytes =
                        readBoundedFile(
                                settingsFile,
                                MAX_PACKAGE_BYTES
                        );

                JSONObject settings;

                try {
                    settings =
                            new JSONObject(
                                    new String(
                                            settingsBytes,
                                            StandardCharsets.UTF_8
                                    )
                            );
                }
                catch (Throwable error) {
                    throw new IllegalStateException(
                            "Could not safely verify the current plugin installation state."
                    );
                }

                if (
                        settings.has(id)
                                && !settings.isNull(id)
                ) {
                    throw new IllegalStateException(
                            "A plugin with this ID is already installed."
                    );
                }
            }

            File manifestDirectory =
                    new File(
                            bunnyRoot,
                            "plugins/manifests"
                    );

            File scriptDirectory =
                    new File(
                            bunnyRoot,
                            "plugins/scripts"
                    );

            ensureDirectory(
                    manifestDirectory
            );

            ensureDirectory(
                    scriptDirectory
            );

            File manifestFile =
                    new File(
                            manifestDirectory,
                            id + ".json"
                    );

            File scriptFile =
                    new File(
                            scriptDirectory,
                            id + ".js"
                    );

            boolean existingPayload =
                    manifestFile.exists()
                            || scriptFile.exists();

            if (
                    existingPayload
                            && !allowReplace
            ) {
                throw new IllegalStateException(
                        "A registered plugin with this ID already has stored payload files."
                );
            }

            byte[] previousManifest =
                    manifestFile.isFile()
                            ? readBoundedFile(
                                    manifestFile,
                                    MAX_COMPONENT_BYTES
                            )
                            : null;

            byte[] previousScript =
                    scriptFile.isFile()
                            ? readBoundedFile(
                                    scriptFile,
                                    MAX_COMPONENT_BYTES
                            )
                            : null;

            try {
                writeAtomic(
                        scriptFile,
                        scriptBytes
                );

                writeAtomic(
                        manifestFile,
                        manifestBytes
                );
            }
            catch (Throwable commitError) {
                try {
                    restoreFile(
                            scriptFile,
                            previousScript
                    );
                }
                catch (Throwable ignored) {
                }

                try {
                    restoreFile(
                            manifestFile,
                            previousManifest
                    );
                }
                catch (Throwable ignored) {
                }

                throw commitError;
            }

            if (
                    staged.exists()
                            && !staged.delete()
            ) {
                android.util.Log.w(
                        "BunnyLocalPluginImport",
                        "Could not remove consumed staged plugin package"
                );
            }

            resolve(
                    promise,
                    result(
                            "success",
                            null,
                            id,
                            name,
                            version,
                            repository,
                            "Local plugin payload committed."
                    )
            );
        }
        catch (Throwable error) {
            resolve(
                    promise,
                    result(
                            "error",
                            null,
                            null,
                            null,
                            null,
                            null,
                            cleanMessage(error)
                    )
            );
        }
    }

    private static byte[] readBoundedFile(
            File file,
            long limit
    ) throws Exception {
        if (
                file == null
                        || !file.isFile()
                        || !file.canRead()
        ) {
            throw new IllegalArgumentException(
                    "The local plugin file is unavailable."
            );
        }

        if (file.length() > limit) {
            throw new IllegalArgumentException(
                    "The local plugin file exceeds Bunny's size limit."
            );
        }

        try (
                InputStream input =
                        new java.io.FileInputStream(
                                file
                        )
        ) {
            ByteArrayOutputStream output =
                    new ByteArrayOutputStream();

            byte[] buffer =
                    new byte[8192];

            long total =
                    0L;

            while (true) {
                int count =
                        input.read(buffer);

                if (count < 0) {
                    break;
                }

                if (count == 0) {
                    continue;
                }

                total += count;

                if (total > limit) {
                    throw new IllegalArgumentException(
                            "The local plugin file exceeds Bunny's size limit."
                    );
                }

                output.write(
                        buffer,
                        0,
                        count
                );
            }

            return output.toByteArray();
        }
    }

    private static void ensureDirectory(
            File directory
    ) {
        if (directory.isDirectory()) {
            return;
        }

        if (!directory.mkdirs()) {
            throw new IllegalStateException(
                    "Could not create Bunny plugin storage."
            );
        }
    }

    private static void writeAtomic(
            File target,
            byte[] bytes
    ) throws Exception {
        File parent =
                target.getParentFile();

        if (parent == null) {
            throw new IllegalStateException(
                    "Plugin storage has no parent directory."
            );
        }

        ensureDirectory(
                parent
        );

        File temporary =
                new File(
                        parent,
                        target.getName() +
                                ".bunny-import-" +
                                UUID.randomUUID() +
                                ".tmp"
                );

        try {
            try (
                    FileOutputStream output =
                            new FileOutputStream(
                                    temporary,
                                    false
                            )
            ) {
                output.write(bytes);
                output.flush();
                output.getFD().sync();
            }

            if (
                    target.exists()
                            && !target.delete()
            ) {
                throw new IllegalStateException(
                        "Could not replace existing Bunny plugin storage."
                );
            }

            if (!temporary.renameTo(target)) {
                throw new IllegalStateException(
                        "Could not finalize Bunny plugin storage."
                );
            }
        }
        finally {
            if (temporary.exists()) {
                temporary.delete();
            }
        }
    }

    private static void restoreFile(
            File target,
            byte[] previous
    ) throws Exception {
        if (previous == null) {
            if (
                    target.exists()
                            && !target.delete()
            ) {
                throw new IllegalStateException(
                        "Could not roll back Bunny plugin storage."
                );
            }

            return;
        }

        writeAtomic(
                target,
                previous
        );
    }
    private static void failPending(
            String message
    ) {
        final Object promise;
        final boolean wasPending;

        synchronized (LOCK) {
            wasPending = pending;
            promise = pendingPromise;

            pending = false;
            pendingPromise = null;
            pendingContext = null;
        }

        if (!wasPending) {
            return;
        }

        resolve(
                promise,
                result(
                        "error",
                        null,
                        null,
                        null,
                        null,
                        null,
                        message
                )
        );
    }

    private static String result(
            String status,
            String token,
            String id,
            String name,
            String version,
            String repository,
            String message
    ) {
        JSONObject result =
                new JSONObject();

        try {
            result.put(
                    "status",
                    status
            );

            if (token != null) {
                result.put(
                        "token",
                        token
                );
            }

            if (id != null) {
                result.put(
                        "id",
                        id
                );
            }

            if (name != null) {
                result.put(
                        "name",
                        name
                );
            }

            if (version != null) {
                result.put(
                        "version",
                        version
                );
            }

            if (repository != null) {
                result.put(
                        "repository",
                        repository
                );
            }

            if (message != null) {
                result.put(
                        "message",
                        message
                );
            }

            result.put(
                    "scriptExecuted",
                    false
            );

            result.put(
                    "installed",
                    false
            );

            return result.toString();
        }
        catch (org.json.JSONException error) {
            android.util.Log.e(
                    "BunnyLocalPluginImport",
                    "LOCAL_PLUGIN_IMPORT_RESULT_JSON_FAILURE",
                    error
            );

            /*
             * Constant valid JSON fallback. No selected package data or
             * script content is interpolated into this string.
             */
            return "{\"status\":\"error\"," +
                    "\"message\":\"Could not build the local plugin import result.\"," +
                    "\"scriptExecuted\":false," +
                    "\"installed\":false}";
        }
    }

    private static void resolve(
            Object promise,
            String value
    ) {
        if (promise == null) {
            return;
        }

        try {
            java.lang.reflect.Method resolveMethod = null;

            for (
                    java.lang.reflect.Method method :
                    promise.getClass().getMethods()
            ) {
                if (
                        "resolve".equals(method.getName())
                                && method.getParameterTypes().length == 1
                ) {
                    resolveMethod = method;
                    break;
                }
            }

            if (resolveMethod == null) {
                throw new NoSuchMethodException(
                        "Promise.resolve(Object)"
                );
            }

            resolveMethod.setAccessible(true);
            resolveMethod.invoke(
                    promise,
                    value
            );
        }
        catch (Throwable error) {
            android.util.Log.e(
                    "BunnyLocalPluginImport",
                    "Could not resolve local plugin import promise",
                    error
            );
        }
    }

    private static String cleanMessage(
            Throwable error
    ) {
        String value =
                error == null
                        ? null
                        : error.getMessage();

        if (
                value == null
                        || value.trim().isEmpty()
        ) {
            value =
                    error == null
                            ? "Unknown local plugin import failure."
                            : error.getClass().getSimpleName();
        }

        value =
                value
                        .replace('\r', ' ')
                        .replace('\n', ' ')
                        .trim();

        if (value.length() > 320) {
            value =
                    value.substring(
                            0,
                            320
                    );
        }

        return value;
    }

    private static final class DocumentInfo {
        final String name;
        final long size;

        DocumentInfo(
                String name,
                long size
        ) {
            this.name = name;
            this.size = size;
        }
    }
}