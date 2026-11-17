package app.ak800i.extension.waze;

import android.util.Log;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

/**
 * Access to Waze's custom voice recordings.
 *
 * While the custom voice screen is open, Waze keeps the voice's prompts as
 * {@code <promptId>.mp3} files in one working folder. When the user taps Done, Waze saves
 * that folder as the voice. The folder path and the list of prompt ids come from Waze's
 * native code. Only JNI method names are used here, because Waze does not obfuscate them.
 */
final class WazeVoices {
    private static final String SOUND_NATIVE_MANAGER = "com.waze.sound.SoundNativeManager";
    private static final String NATIVE_MANAGER = "com.waze.NativeManager";
    private static final String TEMP_SUFFIX = "_temp.mp3";
    private static final String STAGING_PREFIX = ".voicepack-";

    /** The folder that holds the recordings of the voice on screen. */
    final File recordDir;
    /** Prompt ids in Waze's display order. Empty if Waze did not provide them. */
    final List<String> promptIds;

    private WazeVoices(File recordDir, List<String> promptIds) {
        this.recordDir = recordDir;
        this.promptIds = Collections.unmodifiableList(promptIds);
    }

    /** Asks Waze's native layer for the folder and prompt ids. Do not call on the main thread. */
    static WazeVoices query() throws Exception {
        final Object[] result = new Object[1];
        final Throwable[] error = new Throwable[1];
        final CountDownLatch done = new CountDownLatch(1);
        Runnable task = () -> {
            try {
                result[0] = readFromNative();
            } catch (Throwable t) {
                error[0] = t;
            } finally {
                done.countDown();
            }
        };
        // Waze calls these methods only on its native thread, so this does the same.
        Method post;
        try {
            post = Class.forName(NATIVE_MANAGER).getMethod("Post", Runnable.class);
        } catch (ReflectiveOperationException e) {
            throw new IllegalStateException("Waze's native thread is not available", e);
        }
        if (Boolean.FALSE.equals(post.invoke(null, task))) {
            throw new IllegalStateException("Waze's native thread is not running");
        }
        if (!done.await(10, TimeUnit.SECONDS)) {
            throw new IllegalStateException("Waze did not answer in time");
        }
        if (error[0] != null) throw new Exception(error[0]);
        return (WazeVoices) result[0];
    }

    private static WazeVoices readFromNative() throws Exception {
        Class<?> managerClass = Class.forName(SOUND_NATIVE_MANAGER);
        Object manager = null;
        // The static getter of the SoundNativeManager instance has an obfuscated name.
        for (Method m : managerClass.getDeclaredMethods()) {
            if (Modifier.isStatic(m.getModifiers()) && m.getParameterTypes().length == 0
                    && m.getReturnType() == managerClass) {
                m.setAccessible(true);
                manager = m.invoke(null);
                break;
            }
        }
        if (manager == null) throw new IllegalStateException("Waze's sound manager is not available");

        String path = (String) managerClass.getMethod("getCustomPromptsTempRecordPathNTV").invoke(manager);
        if (path == null || path.isEmpty()) throw new IllegalStateException("Waze did not return its recordings folder");

        List<String> ids = new ArrayList<>();
        try {
            Object[] definitions = (Object[]) managerClass.getMethod("getPromptDefinitionsNTV").invoke(manager);
            if (definitions != null) {
                for (Object definition : definitions) {
                    String id = (String) definition.getClass().getMethod("getId").invoke(definition);
                    if (id != null && !ids.contains(id)) ids.add(id);
                }
            }
        } catch (Exception e) {
            Log.w(VoicePack.TAG, "Could not read Waze's prompt list", e);
        }
        Log.i(VoicePack.TAG, "Recordings folder: " + path + ", prompt ids: " + ids);
        return new WazeVoices(new File(path), ids);
    }

    /** The prompt ids that have a saved recording, in Waze's order when it is known. */
    List<String> recordedPromptIds() {
        List<String> recorded = new ArrayList<>();
        File[] files = recordDir.listFiles();
        if (files == null) return recorded;
        for (File f : files) {
            String name = f.getName();
            if (!f.isFile() || f.length() == 0 || !name.endsWith(".mp3") || name.endsWith(TEMP_SUFFIX)) continue;
            String id = name.substring(0, name.length() - 4);
            if (promptIds.isEmpty() || promptIds.contains(id)) recorded.add(id);
        }
        if (promptIds.isEmpty()) {
            Collections.sort(recorded);
        } else {
            recorded.sort((a, b) -> promptIds.indexOf(a) - promptIds.indexOf(b));
        }
        return recorded;
    }

    File recording(String promptId) {
        return new File(recordDir, promptId + ".mp3");
    }

    /**
     * A new, empty folder for one import. It is next to the recordings folder, so files can be
     * moved between them without copying. Folders left behind by an earlier import that did
     * not finish (for example because Waze was killed) are removed first.
     */
    File newStagingDir() throws IOException {
        File parent = recordDir.getAbsoluteFile().getParentFile();
        File[] stale = parent.listFiles((dir, name) -> name.startsWith(STAGING_PREFIX));
        if (stale != null) for (File f : stale) deleteRecursively(f);
        File dir = new File(parent, STAGING_PREFIX + System.nanoTime());
        if (!dir.mkdirs()) throw new IOException("Cannot create " + dir);
        return dir;
    }

    /**
     * Replaces every recording of the voice on screen with the {@code .mp3} files in
     * {@code staging}. The old recordings are moved to a backup folder first and are put back
     * if anything fails. Only Waze's working copy is changed: a saved voice is only replaced
     * when the user taps Done.
     */
    void replaceRecordings(File staging) throws IOException {
        if (!recordDir.isDirectory() && !recordDir.mkdirs()) {
            throw new IOException("Cannot create " + recordDir);
        }
        File[] staged = staging.listFiles();
        if (staged == null || staged.length == 0) throw new IOException("Nothing to import");

        File backup = new File(staging.getParentFile(), staging.getName() + "-backup");
        if (!backup.mkdirs()) throw new IOException("Cannot create " + backup);
        List<File> installed = new ArrayList<>();
        try {
            File[] old = recordDir.listFiles();
            if (old != null) {
                for (File f : old) {
                    if (f.isFile() && f.getName().endsWith(".mp3")) move(f, new File(backup, f.getName()));
                }
            }
            for (File f : staged) {
                File target = new File(recordDir, f.getName());
                move(f, target);
                installed.add(target);
            }
        } catch (IOException e) {
            for (File f : installed) f.delete();
            File[] saved = backup.listFiles();
            if (saved != null) {
                for (File f : saved) {
                    try {
                        move(f, new File(recordDir, f.getName()));
                    } catch (IOException restoreError) {
                        Log.e(VoicePack.TAG, "Could not restore " + f, restoreError);
                    }
                }
            }
            throw e;
        }
        deleteRecursively(backup);
    }

    static void deleteRecursively(File file) {
        File[] children = file.listFiles();
        if (children != null) for (File child : children) deleteRecursively(child);
        file.delete();
    }

    private static void move(File from, File to) throws IOException {
        if (from.renameTo(to)) return;
        try (InputStream in = new FileInputStream(from); OutputStream out = new FileOutputStream(to)) {
            byte[] buffer = new byte[64 * 1024];
            int n;
            while ((n = in.read(buffer)) > 0) out.write(buffer, 0, n);
        } catch (IOException e) {
            to.delete();
            throw new IOException("Cannot move " + from.getName() + ": " + e.getMessage(), e);
        }
        if (!from.delete()) throw new IOException("Cannot remove " + from);
    }
}
