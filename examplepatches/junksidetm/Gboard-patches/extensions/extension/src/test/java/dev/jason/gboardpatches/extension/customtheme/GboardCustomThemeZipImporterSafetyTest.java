package dev.jason.gboardpatches.extension.customtheme;

import android.os.Handler;
import android.os.Looper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.Shadows;
import org.robolectric.annotation.LooperMode;

import java.io.File;
import java.lang.reflect.Method;

@RunWith(RobolectricTestRunner.class)
@LooperMode(LooperMode.Mode.PAUSED)
public final class GboardCustomThemeZipImporterSafetyTest {
    @Test
    public void throwingCompletionCallbacksCannotEscapeImporterBoundary() throws Exception {
        GboardCustomThemeZipImporter.Completion completion =
                new GboardCustomThemeZipImporter.Completion() {
                    @Override
                    public void onCommitted(String fileName) {
                        throw new AssertionError("stale success callback");
                    }

                    @Override
                    public void onFailure(Throwable failure) {
                        throw new AssertionError("stale failure callback");
                    }
                };

        invoke("notifyCommittedSafely",
                new Class<?>[] {GboardCustomThemeZipImporter.Completion.class, String.class},
                completion, "user_theme_test.zip");
        invoke("notifyFailureSafely",
                new Class<?>[] {GboardCustomThemeZipImporter.Completion.class, Throwable.class},
                completion, new IllegalStateException("test failure"));
    }

    @Test
    public void throwingPostedCallbackCannotEscapeMainLooper() throws Exception {
        Handler main = new Handler(Looper.getMainLooper());
        invoke("postSafely",
                new Class<?>[] {Handler.class, String.class, Runnable.class},
                main, "test posted callback",
                (Runnable) () -> { throw new AssertionError("stale activity callback"); });

        Shadows.shadowOf(Looper.getMainLooper()).idle();
    }

    @Test
    public void temporaryFileDeletionFailureIsContained() throws Exception {
        File throwingFile = new File("unused") {
            @Override
            public boolean delete() {
                throw new AssertionError("delete failure");
            }
        };

        invoke("safeDelete", new Class<?>[] {File.class}, throwingFile);
    }

    private static Object invoke(String name, Class<?>[] parameterTypes, Object... arguments)
            throws Exception {
        Method method = GboardCustomThemeZipImporter.class.getDeclaredMethod(
                name, parameterTypes);
        method.setAccessible(true);
        return method.invoke(null, arguments);
    }
}
