package dev.jason.gboardpatches.extension.customtheme;

import org.junit.Assert;
import org.junit.Test;

import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;

public final class GboardCustomThemeNavigationSourceTest {
    @Test
    public void settingsPageOwnsToggleAndRoutesToGalleryChild() throws Exception {
        String source = readSource("GboardCustomThemeSettingsFeature.java");

        Assert.assertTrue(source.contains("getNavigationChildren()"));
        Assert.assertTrue(source.contains("new GboardPatchesSettingsContract.ToggleRow("));
        Assert.assertTrue(source.contains("new GboardPatchesSettingsContract.NavigationRow("));
        Assert.assertTrue(source.contains("GboardPatchesSettingsContract.openFeature("));
        Assert.assertTrue(source.contains("host, galleryFeature"));
        Assert.assertFalse(source.contains("CustomViewRow"));
    }

    @Test
    public void galleryIncludesPackOverviewAndSelectiveCacheDeletion() throws Exception {
        String source = readSource("GboardCustomThemeGalleryView.java");

        Assert.assertTrue(source.contains("buildPackPickerButton"));
        Assert.assertTrue(source.contains("showPackChooser()"));
        Assert.assertTrue(source.contains("showDeletePacksDialog()"));
        Assert.assertTrue(source.contains("setMultiChoiceItems"));
        Assert.assertTrue(source.contains("deletePackCache("));
    }

    @Test
    public void galleryViewLifecycleStaysBehindMainThreadCustomViewFactory() throws Exception {
        String feature = readSource("GboardCustomThemeGalleryFeature.java");
        String buildScreen = methodBody(feature,
                "public GboardPatchesSettingsContract.Screen buildScreen(",
                "    @Override\n    public void onHidden(");
        String createGallery = methodBody(feature,
                "private View createGalleryView(",
                "    private void showDeletePacksDialog()");

        Assert.assertTrue(buildScreen.contains("this::createGalleryView"));
        Assert.assertTrue(buildScreen.contains("this::showDeletePacksDialog"));
        Assert.assertFalse(buildScreen.contains("new GboardCustomThemeGalleryView"));
        Assert.assertFalse(buildScreen.contains("closeGallery();"));
        Assert.assertTrue(createGallery.contains("closeGallery();"));
        Assert.assertTrue(createGallery.contains("new GboardCustomThemeGalleryView(host)"));
        Assert.assertTrue(feature.contains("activeGallery = null;"));
        Assert.assertTrue(feature.contains("gallery.close();"));
    }

    @Test
    public void galleryAddsDeleteBeforeSharedRestartAndRestartsOnlyAfterCommit() throws Exception {
        String feature = readSource("GboardCustomThemeGalleryFeature.java");
        String gallery = readSource("GboardCustomThemeGalleryView.java");
        int install = gallery.indexOf("GboardCustomThemeInstaller.install");
        int restart = gallery.indexOf("requestTargetRestart(host)");

        Assert.assertTrue(feature.contains("ToolbarIcon.DELETE"));
        Assert.assertTrue(feature.contains("SectionStyle.FULL_BLEED"));
        Assert.assertTrue(feature.contains("showDeletePacksDialog"));
        Assert.assertTrue(install >= 0);
        Assert.assertTrue(restart > install);
    }

    @Test
    public void galleryDownloadsPersistentPreviewsAndRefreshesInPlace() throws Exception {
        String gallery = readSource("GboardCustomThemeGalleryView.java");
        String repository = readSource("GboardCustomThemePreviewRepository.java");

        Assert.assertTrue(gallery.contains("startPreviewDownload()"));
        Assert.assertTrue(gallery.contains("GboardCustomThemePreviewRepository.ensureInstalled"));
        Assert.assertTrue(gallery.contains("rebuildGrid();"));
        Assert.assertTrue(repository.contains("context.getFilesDir()"));
        Assert.assertTrue(repository.contains("SHA-256 mismatch"));
        Assert.assertFalse(gallery.contains("context.getAssets().open(assetPath)"));
    }

    @Test
    public void selectedPackAlwaysScrollsNextToPackPicker() throws Exception {
        String gallery = readSource("GboardCustomThemeGalleryView.java");
        String rebuildTabs = methodBody(gallery, "private void rebuildTabs()",
                "private void selectPack(");
        String selectPack = methodBody(gallery, "private void selectPack(",
                "private void showPackChooser() ");

        Assert.assertTrue(gallery.contains("private final HorizontalScrollView tabScroller;"));
        Assert.assertTrue(rebuildTabs.contains(
                "tabScroller.post(this::scrollSelectedTabIntoView);"));
        Assert.assertTrue(gallery.contains("private void scrollSelectedTabIntoView()"));
        Assert.assertTrue(gallery.contains("Math.min(target, maximum)"));
        Assert.assertTrue(selectPack.contains("if (pack == selectedPack)"));
        Assert.assertTrue(selectPack.contains("tabScroller.post(this::scrollSelectedTabIntoView);"));
    }

    @Test
    public void packStatusUsesContinuousMarqueeWhenTextOverflows() throws Exception {
        String gallery = readSource("GboardCustomThemeGalleryView.java");

        Assert.assertTrue(gallery.contains(
                "status.setEllipsize(TextUtils.TruncateAt.MARQUEE);"));
        Assert.assertTrue(gallery.contains("status.setMarqueeRepeatLimit(-1);"));
        Assert.assertTrue(gallery.contains("status.setHorizontallyScrolling(true);"));
        Assert.assertTrue(gallery.contains("status.setSelected(true);"));
    }

    @Test
    public void galleryCallbacksHaveFeatureOwnedFailSafeBoundaries() throws Exception {
        String gallery = readSource("GboardCustomThemeGalleryView.java");

        Assert.assertTrue(gallery.contains("private void invokeSafely(Runnable callback)"));
        Assert.assertTrue(gallery.contains(
                "button.setOnClickListener(view -> invokeSafely(this::showPackChooser));"));
        Assert.assertTrue(gallery.contains(
                "tab.setOnClickListener(view -> invokeSafely(() -> selectPack(pack)));"));
        Assert.assertTrue(gallery.contains(
                "card.setOnClickListener(view -> invokeSafely(() -> apply(theme)));"));
        Assert.assertTrue(gallery.contains("postSafely(() -> updatePreviewDownloadProgress"));
    }

    @Test
    public void committedApplyRequestsRestartBeforeClosedViewGuard() throws Exception {
        String gallery = readSource("GboardCustomThemeGalleryView.java");
        int success = gallery.indexOf("// Restart after a committed install");
        int restart = gallery.indexOf("requestTargetRestart(host)", success);
        int closed = gallery.indexOf("if (closed) return;", restart);

        Assert.assertTrue(success >= 0);
        Assert.assertTrue(restart > success);
        Assert.assertTrue(closed > restart);
        Assert.assertFalse(gallery.contains("main.removeCallbacksAndMessages(null)"));
    }

    @Test
    public void closingGalleryDetachesCardsWithoutRecyclingDisplayedBitmaps() throws Exception {
        String gallery = readSource("GboardCustomThemeGalleryView.java");
        String close = methodBody(gallery, "void close()", "private void load()");
        String release = methodBody(gallery, "private void releasePreviews()",
                "private static String formatBytes(");

        Assert.assertTrue(close.contains("grid.removeAllViews();"));
        Assert.assertTrue(close.indexOf("grid.removeAllViews();")
                < close.indexOf("releasePreviews();"));
        Assert.assertFalse(release.contains(".recycle()"));
    }

    private static String methodBody(String source, String startMarker, String endMarker) {
        int start = source.indexOf(startMarker);
        int end = source.indexOf(endMarker, start + startMarker.length());
        Assert.assertTrue("Missing method start: " + startMarker, start >= 0);
        Assert.assertTrue("Missing method end: " + endMarker, end > start);
        return source.substring(start, end);
    }

    private static String readSource(String fileName) throws Exception {
        return new String(Files.readAllBytes(Path.of(
                "src/main/java/dev/jason/gboardpatches/extension/customtheme/" + fileName)),
                StandardCharsets.UTF_8);
    }
}
