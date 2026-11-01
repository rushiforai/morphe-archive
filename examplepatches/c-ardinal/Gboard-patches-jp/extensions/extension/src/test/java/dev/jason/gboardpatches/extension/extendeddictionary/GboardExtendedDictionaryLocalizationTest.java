package dev.jason.gboardpatches.extension.extendeddictionary;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;
import static org.robolectric.Shadows.shadowOf;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Application;
import android.content.Context;
import android.content.res.Configuration;
import android.os.Looper;
import android.view.View;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.shadows.ShadowDialog;

import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import dev.jason.gboardpatches.extension.R;
import dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsContract;
import dev.jason.gboardpatches.extension.settings.GboardSettingsText;

@RunWith(RobolectricTestRunner.class)
public final class GboardExtendedDictionaryLocalizationTest {
    private static final Pattern HAN = Pattern.compile("[\\p{IsHan}]");

    @Test
    public void unsupportedGboardBuildShowsEnglishSummaryAndDisablesActions() {
        Context english = localized(Locale.ENGLISH);
        clearStore(english);
        GboardExtendedDictionarySettingsFeature feature =
                new GboardExtendedDictionarySettingsFeature(english,
                        new ClassLoader(getClass().getClassLoader()) {
                        });

        GboardPatchesSettingsContract.Screen screen = feature.buildScreen(new TestHost(english));

        assertEquals("Extended Dictionary", feature.getEntryTitle());
        assertEquals(GboardSettingsText.get(english,
                R.string.gboard_patches_extended_dictionary_unsupported_summary),
                screen.getHeaderSummary());
        List<GboardPatchesSettingsContract.Row> rows = screen.getSections().get(0).getItems();
        assertEquals(3, rows.size());
        assertEquals("Import word list", rows.get(0).getTitle().toString());
        assertFalse(rows.get(0).isEnabled());
        assertEquals("Remove imported words", rows.get(1).getTitle().toString());
        assertFalse(rows.get(1).isEnabled());
        assertEquals("0 words managed by this feature", rows.get(2).getSummary());
        assertEnglish(screen);
    }

    @Test
    public void actionsReportFailuresAsMessagesInsteadOfThrowing() {
        Context english = localized(Locale.ENGLISH);
        GboardExtendedDictionarySettingsFeature feature =
                new GboardExtendedDictionarySettingsFeature(english,
                        new ClassLoader(getClass().getClassLoader()) {
                        });

        String unsupported = GboardSettingsText.get(english,
                R.string.gboard_patches_extended_dictionary_unsupported_summary);
        assertEquals(unsupported, feature.importDocument(english,
                "a\tA\ten-US\n".getBytes(StandardCharsets.UTF_8)));
        assertEquals(unsupported, feature.removeAll(english));
        assertEquals("Line 1 has the wrong number of columns.", feature.importDocument(english,
                "a\tA\n".getBytes(StandardCharsets.UTF_8)));
        assertEquals("The file contains no words.",
                feature.importDocument(english, new byte[0]));
    }

    @Test
    public void remainingTimeTextAndCount() {
        Context english = localized(Locale.ENGLISH);
        Context chinese = localized(Locale.forLanguageTag("zh-Hant"));

        assertEquals(ExtendedDictionaryProgressDialog.UNKNOWN_REMAINING,
                ExtendedDictionaryProgressDialog.remainingText(english, -1L));
        assertEquals("About 30 s remaining",
                ExtendedDictionaryProgressDialog.remainingText(english, 30L));
        assertTrue(HAN.matcher(
                ExtendedDictionaryProgressDialog.remainingText(chinese, 30L)).find());
        assertEquals("250 / 1000", ExtendedDictionaryProgressDialog.countText(250, 1000));
    }

    @Test
    public void progressDialogIsModalCancelsTheJobAndClosesWhenItFinishes() {
        Activity activity = Robolectric.buildActivity(Activity.class).setup().get();
        ExtendedDictionaryProgressDialog.Job job = new ExtendedDictionaryProgressDialog.Job(
                R.string.gboard_patches_extended_dictionary_progress_import_title, true);
        job.onProgress(0, 1000);
        boolean[] dismissed = {false};

        assertTrue(ExtendedDictionaryProgressDialog.create(activity, job)
                .show(() -> dismissed[0] = true));
        AlertDialog dialog = (AlertDialog) ShadowDialog.getLatestDialog();
        assertTrue(dialog.isShowing());
        assertFalse(shadowOf(dialog).isCancelable());

        job.onProgress(250, 1000);
        job.render();
        dialog.getButton(AlertDialog.BUTTON_NEGATIVE).performClick();
        assertTrue(job.cancel.get());
        assertTrue(dialog.isShowing());

        job.complete(true);
        job.finished = true;
        job.render();
        assertTrue("100% stays visible briefly", dialog.isShowing());
        shadowOf(Looper.getMainLooper()).idleFor(java.time.Duration.ofMillis(
                ExtendedDictionaryProgressDialog.COMPLETE_HOLD_MS + 100));
        assertFalse(dialog.isShowing());
        assertTrue(dismissed[0]);
        assertNull(job.view);
        assertEquals(1f, job.snapshot.get().overallFraction, 0f);
    }

    @Test
    public void cancelledOrFailedJobsCloseAtOnceWithoutFakingOneHundredPercent() {
        Activity activity = Robolectric.buildActivity(Activity.class).setup().get();
        ExtendedDictionaryProgressDialog.Job job = new ExtendedDictionaryProgressDialog.Job(
                R.string.gboard_patches_extended_dictionary_progress_import_title, true);
        job.onProgress(250, 1000);
        float reached = job.snapshot.get().overallFraction;
        assertTrue(reached < 1f);
        ExtendedDictionaryProgressDialog.create(activity, job).show(() -> {
        });
        AlertDialog dialog = (AlertDialog) ShadowDialog.getLatestDialog();

        job.complete(false);
        job.finished = true;
        job.render();
        shadowOf(Looper.getMainLooper()).idle();

        assertFalse("closed without the 100% hold", dialog.isShowing());
        assertEquals(reached, job.snapshot.get().overallFraction, 0f);
    }

    @Test
    public void destroyingTheActivityMidJobNeitherCrashesNorLeaksTheJob() throws Exception {
        ActivityController<Activity> controller =
                Robolectric.buildActivity(Activity.class).setup();
        Activity activity = controller.get();
        Context application = activity.getApplicationContext();
        clearStore(application);
        CountDownLatch release = new CountDownLatch(1);
        ExtendedDictionaryProgressDialog.Job job = new ExtendedDictionaryProgressDialog.Job(
                R.string.gboard_patches_extended_dictionary_progress_import_title, true);

        GboardExtendedDictionarySettingsFeature.runInBackground(new TestHost(activity), job,
                "failed", (progress, cancel) -> {
                    progress.onProgress(PhasedEta.Phase.INSERT, 1, 2);
                    try {
                        assertTrue(release.await(10, TimeUnit.SECONDS));
                    } catch (InterruptedException interrupted) {
                        throw new IllegalStateException(interrupted);
                    }
                    ManagedEntryStore.open(application).save(Collections.singletonList(
                            new ManagedEntryStore.Entry(1L, "A", "a", "en-US", "")));
                    return "done";
                });
        // TestHost ignores submitted intents, so attach the dialog as the Activity would.
        assertTrue(ExtendedDictionaryProgressDialog.create(activity, job).show(() -> {
        }));
        shadowOf(Looper.getMainLooper()).idle();
        controller.pause().stop().destroy();
        release.countDown();
        for (int attempt = 0; attempt < 1000
                && GboardExtendedDictionarySettingsFeature.currentJob() != null; attempt++) {
            Thread.sleep(10);
        }
        shadowOf(Looper.getMainLooper()).idle();

        assertNull(GboardExtendedDictionarySettingsFeature.currentJob());
        assertTrue(job.finished);
        assertNull(job.view);
        assertNull(job.attachedHost.get());
        assertEquals(1, ManagedEntryStore.open(application).load().size());
    }

    @Test
    public void removalDialogDefaultsToTrackedOnlyAndOffersRemoveAll() {
        Activity activity = Robolectric.buildActivity(Activity.class).setup().get();
        List<Boolean> choices = new java.util.ArrayList<>();

        GboardExtendedDictionarySettingsFeature.removalDialog(activity, 3, choices::add)
                .show(() -> {
                });
        AlertDialog dialog = (AlertDialog) ShadowDialog.getLatestDialog();
        assertTrue(dialog.getButton(AlertDialog.BUTTON_POSITIVE).getText().toString()
                .contains("tracked only"));
        dialog.getButton(AlertDialog.BUTTON_NEUTRAL).performClick();
        shadowOf(Looper.getMainLooper()).idle();
        assertEquals(java.util.Collections.singletonList(true), choices);

        GboardExtendedDictionarySettingsFeature.removalDialog(activity, 0, choices::add)
                .show(() -> {
                });
        AlertDialog simple = (AlertDialog) ShadowDialog.getLatestDialog();
        assertEquals(View.GONE, simple.getButton(AlertDialog.BUTTON_NEUTRAL).getVisibility());
        simple.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
        shadowOf(Looper.getMainLooper()).idle();
        assertEquals(java.util.Arrays.asList(true, false), choices);
    }

    @Test
    public void detachedDialogThatThrowsOnDismissDoesNotBreakCompletion() throws Exception {
        ActivityController<Activity> controller =
                Robolectric.buildActivity(Activity.class).setup();
        Activity activity = controller.get();
        Context application = activity.getApplicationContext();
        clearStore(application);
        CountDownLatch release = new CountDownLatch(1);
        ExtendedDictionaryProgressDialog.Job job = new ExtendedDictionaryProgressDialog.Job(
                R.string.gboard_patches_extended_dictionary_progress_import_title, true);
        int[] dismissAttempts = {0};

        GboardExtendedDictionarySettingsFeature.runInBackground(new TestHost(activity), job,
                "failed", (progress, cancel) -> {
                    try {
                        assertTrue(release.await(10, TimeUnit.SECONDS));
                    } catch (InterruptedException interrupted) {
                        throw new IllegalStateException(interrupted);
                    }
                    ManagedEntryStore.open(application).save(Collections.singletonList(
                            new ManagedEntryStore.Entry(1L, "A", "a", "en-US", "")));
                    return "done";
                });
        // A dialog whose window went away with the Activity: Android throws exactly this.
        job.view = () -> {
            dismissAttempts[0]++;
            throw new IllegalArgumentException("View not attached to window manager");
        };
        controller.pause().stop().destroy();
        release.countDown();
        for (int attempt = 0; attempt < 1000
                && GboardExtendedDictionarySettingsFeature.currentJob() != null; attempt++) {
            Thread.sleep(10);
        }
        shadowOf(Looper.getMainLooper()).idle();

        assertEquals(1, dismissAttempts[0]);
        assertNull(GboardExtendedDictionarySettingsFeature.currentJob());
        assertNull(job.view);
        assertNull(job.attachedHost.get());
        assertEquals(1, ManagedEntryStore.open(application).load().size());
    }

    @Test
    public void workerTasksTurnEveryThrowableIntoTheFailureMessage() {
        assertEquals("done", GboardExtendedDictionarySettingsFeature.runSafely(
                () -> "done", "failed"));
        assertEquals("failed", GboardExtendedDictionarySettingsFeature.runSafely(() -> {
            throw new IllegalArgumentException("malformed input");
        }, "failed"));
        assertEquals("failed", GboardExtendedDictionarySettingsFeature.runSafely(() -> {
            throw new OutOfMemoryError("simulated");
        }, "failed"));
    }

    @Test
    public void everyParseErrorHasEnglishAndTraditionalChineseText() {
        Context english = localized(Locale.ENGLISH);
        Context chinese = localized(Locale.forLanguageTag("zh-Hant"));
        for (WordListParser.Error error : WordListParser.Error.values()) {
            WordListParser.ParseException failure = new WordListParser.ParseException(error, 7);
            String englishText =
                    GboardExtendedDictionarySettingsFeature.parseErrorMessage(english, failure);
            assertFalse(englishText.isEmpty());
            assertNoHan(englishText);
            assertTrue(HAN.matcher(GboardExtendedDictionarySettingsFeature.parseErrorMessage(
                    chinese, failure)).find());
        }
        assertEquals("擴充字典",
                new GboardExtendedDictionarySettingsFeature(chinese).getEntryTitle());
    }

    @Test
    public void everyExtendedDictionaryResourceHasBothRequiredTranslations() throws Exception {
        Path sourceRoot = Path.of(
                "src/main/java/dev/jason/gboardpatches/extension/extendeddictionary");
        Pattern referencePattern = Pattern.compile("R\\.string\\.([A-Za-z0-9_]+)");
        Set<String> resourceNames = new LinkedHashSet<>();
        try (var paths = Files.walk(sourceRoot)) {
            for (Path path : paths.filter(file -> file.toString().endsWith(".java")).toList()) {
                String source = new String(Files.readAllBytes(path), StandardCharsets.UTF_8);
                assertFalse("Hard-coded Chinese text in " + path, HAN.matcher(source).find());
                Matcher references = referencePattern.matcher(source);
                while (references.find()) {
                    resourceNames.add(references.group(1));
                }
            }
        }
        String authority = new String(Files.readAllBytes(
                Path.of("src/main/settings-text/gboard_settings_text.xml")),
                StandardCharsets.UTF_8);
        for (String resourceName : resourceNames) {
            Matcher block = Pattern.compile("<string name=\"" + Pattern.quote(resourceName)
                    + "\">(.*?)</string>", Pattern.DOTALL).matcher(authority);
            assertTrue("Missing settings-text entry: " + resourceName, block.find());
            Matcher englishText = Pattern.compile(
                    "<translation locale=\"en\">(.*?)</translation>", Pattern.DOTALL)
                    .matcher(block.group(1));
            assertTrue("Missing English translation: " + resourceName, englishText.find());
            assertFalse("Chinese text in English translation: " + resourceName,
                    HAN.matcher(englishText.group(1)).find());
            assertTrue("Missing Traditional Chinese translation: " + resourceName,
                    block.group(1).contains("<translation locale=\"zh-Hant\">"));
        }
        assertTrue("No extended dictionary resources were audited", resourceNames.size() > 20);
    }

    private static Context localized(Locale locale) {
        Application application = RuntimeEnvironment.getApplication();
        Configuration configuration =
                new Configuration(application.getResources().getConfiguration());
        configuration.setLocale(locale);
        return application.createConfigurationContext(configuration);
    }

    private static void clearStore(Context context) {
        context.getSharedPreferences(ManagedEntryStore.PREF_FILE, Context.MODE_PRIVATE)
                .edit().clear().commit();
        context.deleteDatabase(ManagedEntryStore.DATABASE_NAME);
    }

    private static void assertEnglish(GboardPatchesSettingsContract.Screen screen) {
        assertNoHan(screen.getToolbarTitle());
        assertNoHan(screen.getHeaderTitle());
        assertNoHan(screen.getHeaderSummary());
        for (GboardPatchesSettingsContract.Section section : screen.getSections()) {
            assertNoHan(section.getTitle());
            for (GboardPatchesSettingsContract.Row row : section.getItems()) {
                assertNoHan(row.getTitle());
                assertNoHan(row.getSummary());
            }
        }
    }

    private static void assertNoHan(CharSequence value) {
        if (value != null) {
            assertFalse("Unexpected Chinese UI text: " + value, HAN.matcher(value).find());
        }
    }

    private static final class TestHost implements GboardPatchesSettingsContract.FeatureHost {
        private final Context context;

        TestHost(Context context) {
            this.context = context;
        }

        @Override
        public Context getContext() {
            return context;
        }

        @Override
        public void submit(GboardPatchesSettingsContract.Intent intent) {
        }
    }
}
