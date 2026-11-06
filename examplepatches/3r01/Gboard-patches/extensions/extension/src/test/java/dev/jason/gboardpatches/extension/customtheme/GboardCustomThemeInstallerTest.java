package dev.jason.gboardpatches.extension.customtheme;

import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import java.io.File;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;

public final class GboardCustomThemeInstallerTest {
    private File directory;

    @Before
    public void setUp() throws Exception {
        directory = Files.createTempDirectory("custom-theme-installer").toFile();
    }

    @After
    public void tearDown() {
        deleteRecursively(directory);
    }

    @Test
    public void activationFailurePreservesPreExistingDuplicate() throws Exception {
        File duplicate = theme("user_theme_existing.zip");

        new GboardCustomThemeInstaller.ImportedArchive(duplicate, false)
                .rollbackActivationFailure();

        Assert.assertTrue(duplicate.isFile());
    }

    @Test
    public void activationFailureDeletesOnlyNewlyCreatedArchive() throws Exception {
        File created = theme("user_theme_new.zip");

        new GboardCustomThemeInstaller.ImportedArchive(created, true)
                .rollbackActivationFailure();

        Assert.assertFalse(created.exists());
    }

    private File theme(String name) throws Exception {
        File file = new File(directory, name);
        Files.write(file.toPath(), "theme".getBytes(StandardCharsets.UTF_8));
        return file;
    }

    private static void deleteRecursively(File file) {
        if (file == null || !file.exists()) return;
        File[] children = file.listFiles();
        if (children != null) for (File child : children) deleteRecursively(child);
        file.delete();
    }
}
