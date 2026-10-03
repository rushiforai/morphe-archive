package app.hushmessenger.extension;

import android.content.ComponentName;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.pm.PackageManager;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;
import org.robolectric.shadows.ShadowLog;
import org.robolectric.shadows.ShadowToast;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36}, shadows = LegacyDrawerTest.FactoryShadow.class)
public class LegacyDrawerTest {
    @Implements(value = Settings.class, isInAndroidSdk = false)
    public static class FactoryShadow {
        static Function<Context, Object> factory;
        static int calls;

        @Implementation protected static Object legacyDrawerSection(Context context) {
            calls++;
            return factory.apply(context);
        }
    }

    static class FakeDrawerFolderKey { }
    static final class FakeSettingsFolderKey extends FakeDrawerFolderKey { }
    static final class FakeHeterogeneousMap {
        final Map<Object, Object> entries;
        FakeHeterogeneousMap(Map<Object, Object> entries) { this.entries = entries; }
    }
    static final class Row {
        final Context A00;
        final Object A01;
        final Object A02;
        final FakeDrawerFolderKey A03;
        final FakeHeterogeneousMap A04;
        final Integer A05;
        final String A06;
        final List<String> A07;
        Row(Context context, FakeDrawerFolderKey key, FakeHeterogeneousMap metadata,
                Integer badge, String title, List<String> snippets) {
            this(context, new Object(), new Object(), key, metadata, badge, title, snippets);
        }
        Row(Context context, Object dispatcher, Object icon, FakeDrawerFolderKey key,
                FakeHeterogeneousMap metadata, Integer badge, String title, List<String> snippets) {
            A00 = context; A01 = dispatcher; A02 = icon; A03 = key;
            A04 = metadata; A05 = badge; A06 = title; A07 = snippets;
        }
    }
    static final class Section {
        final List<?> A06;
        Section(List<?> rows) { A06 = rows; }
    }
    public static class Fragment {
        private final Context context;
        Fragment(Context context) { this.context = context; }
        public Context getContext() { return context; }
    }

    @Before public void reset() throws Exception {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        Settings.hookErrors.clear();
        CrashGuard.resetForTests();
        ShadowLog.clear();
        var cached = Settings.class.getDeclaredField("legacyDrawerKey");
        cached.setAccessible(true);
        cached.set(null, null);
        FactoryShadow.calls = 0;
        FactoryShadow.factory = context -> new Section(Collections.singletonList(new Row(context, null, new Object(),
                (FakeDrawerFolderKey) Settings.cachedLegacyDrawerKey(new FakeSettingsFolderKey()),
                new FakeHeterogeneousMap(Collections.emptyMap()), null, "HushMessenger", null)));
    }

    @After public void forgetApplication() {
        HostScreens.applicationCreated(null);
        Settings.initialize(RuntimeEnvironment.getApplication());
    }

    private static Row added(List<?> result) {
        Section section = (Section) result.get(result.size() - 1);
        assertEquals(1, section.A06.size());
        return (Row) section.A06.get(0);
    }

    @Test public void appendsWithoutASettingsSectionAndPreservesEveryOriginalObject() {
        var app = RuntimeEnvironment.getApplication();
        var metadata = new FakeHeterogeneousMap(Map.of("badge", 7));
        var snippets = List.of("existing snippet");
        Row ordinary = new Row(app, new FakeDrawerFolderKey(), metadata, 7, "Chats", snippets);
        Row nullable = new Row(null, new FakeDrawerFolderKey(), null, null, "Community", null);
        List<Row> firstRows = Arrays.asList(ordinary, nullable);
        Section first = new Section(firstRows), empty = new Section(Collections.emptyList());
        List<Section> source = Collections.unmodifiableList(Arrays.asList(first, empty));

        List<?> result = Settings.addLegacyDrawerEntry(new Fragment(app), source);
        assertNotSame(source, result);
        assertEquals(2, source.size());
        assertEquals(3, result.size());
        assertSame(first, result.get(0));
        assertSame(empty, result.get(1));
        assertSame(firstRows, first.A06);
        assertSame(ordinary, first.A06.get(0));
        assertSame(nullable, first.A06.get(1));
        assertSame(metadata, ordinary.A04);
        assertEquals(Map.of("badge", 7), metadata.entries);
        assertSame(snippets, ordinary.A07);
        assertEquals(Integer.valueOf(7), ordinary.A05);
        Row hush = added(result);
        assertSame(app, hush.A00);
        assertEquals("HushMessenger", hush.A06);
        assertNull(hush.A01);
        assertTrue(hush.A04.entries.isEmpty());
        assertNull(hush.A05);
        assertNull(hush.A07);
    }

    @Test public void emptyDrawersStillGetTheRecoveryEntry() {
        List<?> source = Collections.emptyList();
        List<?> result = Settings.addLegacyDrawerEntry(new Fragment(RuntimeEnvironment.getApplication()), source);
        assertTrue(source.isEmpty());
        assertEquals(1, result.size());
        assertEquals("HushMessenger", added(result).A06);
    }

    @Test public void refreshesUseFreshRowsAndCurrentContextWithOneIndependentKey() {
        Context firstContext = new ContextWrapper(RuntimeEnvironment.getApplication());
        Context nextContext = new ContextWrapper(RuntimeEnvironment.getApplication());
        FakeSettingsFolderKey stockKey = new FakeSettingsFolderKey();
        Row stock = new Row(firstContext, stockKey, null, 3, "Settings", null);
        List<Section> source = List.of(new Section(List.of(stock)));
        List<?> first = Settings.addLegacyDrawerEntry(new Fragment(firstContext), source);
        List<?> next = Settings.addLegacyDrawerEntry(new Fragment(nextContext), source);
        Row firstRow = added(first), nextRow = added(next);
        assertNotSame(first.get(1), next.get(1));
        assertNotSame(firstRow, nextRow);
        assertNotSame(firstRow.A04, nextRow.A04);
        assertNotSame(firstRow.A02, nextRow.A02);
        assertSame(firstContext, firstRow.A00);
        assertSame(nextContext, nextRow.A00);
        assertSame(firstRow.A03, nextRow.A03);
        assertNotSame(stockKey, firstRow.A03);
        assertSame(stock, ((Section) next.get(0)).A06.get(0));
    }

    @Test public void repeatedRefreshDoesNotAppendADuplicate() {
        Fragment fragment = new Fragment(RuntimeEnvironment.getApplication());
        List<?> first = Settings.addLegacyDrawerEntry(fragment, Collections.emptyList());
        assertSame(first, Settings.addLegacyDrawerEntry(fragment, first));
        assertEquals(1, first.size());
        assertEquals(2, FactoryShadow.calls);
    }

    @Test public void aCommunityWithTheSameNameKeepsItsOwnClickAndGetsASeparateEntry() {
        var app = RuntimeEnvironment.getApplication();
        Row community = new Row(app, new FakeDrawerFolderKey(), null, null, "HushMessenger", null);
        List<Section> source = List.of(new Section(List.of(community)));
        List<?> result = Settings.addLegacyDrawerEntry(new Fragment(app), source);
        assertEquals(2, result.size());
        assertSame(community, Settings.drawerFolderClicked(community));
        assertNull(Shadows.shadowOf(app).getNextStartedActivity());
        assertNull(Settings.drawerFolderClicked(added(result)));
        assertEquals(SettingsActivity.class.getName(),
                Shadows.shadowOf(app).getNextStartedActivity().getComponent().getClassName());
    }

    @Test public void pauseAndSafeModeKeepTheRecoveryEntryUsable() {
        var app = RuntimeEnvironment.getApplication();
        Settings.preferences.edit().putBoolean("paused", true).putBoolean("safe_mode", true).commit();
        List<?> result = Settings.addLegacyDrawerEntry(new Fragment(app), Collections.emptyList());
        assertEquals(1, result.size());
        assertNull(Settings.drawerFolderClicked(added(result)));
        assertNotNull(Shadows.shadowOf(app).getNextStartedActivity());
        assertTrue(Settings.preferences.getBoolean("paused", false));
        assertTrue(Settings.preferences.getBoolean("safe_mode", false));
    }

    @Test public void mountedManifestRoutingUsesTheStockScreen() {
        var app = RuntimeEnvironment.getApplication();
        ComponentName settings = new ComponentName(app, SettingsActivity.class);
        app.getPackageManager().setComponentEnabledSetting(settings,
                PackageManager.COMPONENT_ENABLED_STATE_DISABLED, PackageManager.DONT_KILL_APP);
        Shadows.shadowOf(app.getPackageManager()).removeActivity(settings);
        List<?> result = Settings.addLegacyDrawerEntry(new Fragment(app), Collections.emptyList());
        assertNull(Settings.drawerFolderClicked(added(result)));
        Intent intent = Shadows.shadowOf(app).getNextStartedActivity();
        assertEquals(new ComponentName(app.getPackageName(), HostScreens.SCREEN_HOST), intent.getComponent());
        assertEquals(HostScreens.SETTINGS, intent.getStringExtra(HostScreens.EXTRA));
    }

    @Test public void aRejectedLaunchConsumesOnlyOurRowAndKeepsPrivateDetailsOutOfLogs() {
        Context context = new ContextWrapper(RuntimeEnvironment.getApplication()) {
            @Override public void startActivity(Intent intent) { throw new SecurityException("private launch detail"); }
        };
        List<?> result = Settings.addLegacyDrawerEntry(new Fragment(context), Collections.emptyList());
        Row community = new Row(context, new FakeDrawerFolderKey(), null, null, "HushMessenger", null);
        assertSame(community, Settings.drawerFolderClicked(community));
        assertNull(Settings.drawerFolderClicked(added(result)));
        assertNotNull(Settings.hookErrors.get("menu_row"));
        assertFalse(Settings.hookErrors.get("menu_row").contains("private launch detail"));
        assertEquals("Couldn't open HushMessenger settings. Long-press Messenger's home screen icon and try Patch controls.",
                ShadowToast.getTextOfLatestToast());
        for (ShadowLog.LogItem item : ShadowLog.getLogsForTag("HushMessenger")) {
            assertFalse(item.msg.contains("private launch detail"));
            assertNull(item.throwable);
        }
    }

    @Test public void nullAndDetachedInputsStayIdenticalWithoutCallingTheFactory() {
        List<?> source = new ArrayList<>();
        assertNull(Settings.addLegacyDrawerEntry(new Fragment(RuntimeEnvironment.getApplication()), null));
        assertSame(source, Settings.addLegacyDrawerEntry(null, source));
        assertSame(source, Settings.addLegacyDrawerEntry(new Fragment(null), source));
        assertEquals(0, FactoryShadow.calls);
    }

    @Test public void anUnpatchedFactoryLeavesThePreviewUnchanged() {
        FactoryShadow.factory = context -> null;
        List<?> source = new ArrayList<>();
        assertSame(source, Settings.addLegacyDrawerEntry(new Fragment(RuntimeEnvironment.getApplication()), source));
        assertTrue(Settings.hookErrors.isEmpty());
    }

    @Test public void malformedLaterSectionsAreCheckedEvenAfterAnExistingEntry() {
        Fragment fragment = new Fragment(RuntimeEnvironment.getApplication());
        List<?> valid = Settings.addLegacyDrawerEntry(fragment, Collections.emptyList());
        List<Object> source = new ArrayList<>(valid);
        Object malformed = new Object();
        source.add(malformed);
        Settings.hookErrors.clear();
        assertSame(source, Settings.addLegacyDrawerEntry(fragment, source));
        assertEquals(2, source.size());
        assertSame(valid.get(0), source.get(0));
        assertSame(malformed, source.get(1));
        assertNotNull(Settings.hookErrors.get("menu_row"));
    }

    @Test public void malformedRowsAndNullListsNeverPublishAPartialResult() {
        Context app = RuntimeEnvironment.getApplication();
        for (List<?> rows : Arrays.asList(null, Arrays.asList((Object) null), List.of(new Object()),
                List.of(new Row(app, null, null, null, "Chats", null)),
                List.of(new Row(app, new FakeDrawerFolderKey(), null, null, null, null)))) {
            Section section = new Section(rows);
            List<Section> source = List.of(section);
            Settings.hookErrors.clear();
            assertSame(source, Settings.addLegacyDrawerEntry(new Fragment(app), source));
            assertSame(rows, section.A06);
            assertNotNull(Settings.hookErrors.get("menu_row"));
        }
    }

    @Test public void changedFactoryValuesReturnTheOriginalList() {
        Context app = RuntimeEnvironment.getApplication();
        for (Object prototype : Arrays.asList(new Object(), new Section(Collections.emptyList()),
                new Section(List.of(new Row(null, new FakeSettingsFolderKey(),
                        new FakeHeterogeneousMap(Map.of()), null, "HushMessenger", null))),
                new Section(List.of(new Row(app, new FakeSettingsFolderKey(), null, null, "HushMessenger", null))),
                new Section(List.of(new Row(app, new FakeDrawerFolderKey(),
                        new FakeHeterogeneousMap(Map.of()), null, "HushMessenger", null))),
                new Section(List.of(new Row(app, new FakeSettingsFolderKey(),
                        new FakeHeterogeneousMap(Map.of()), null, "Changed", null))))) {
            FactoryShadow.factory = context -> prototype;
            Settings.hookErrors.clear();
            List<?> source = Collections.emptyList();
            assertSame(source, Settings.addLegacyDrawerEntry(new Fragment(app), source));
            assertNotNull(Settings.hookErrors.get("menu_row"));
        }
    }

    @Test public void aFailingFragmentNeverLeaksItsExceptionMessage() {
        String privateValue = "private drawer state";
        Fragment fragment = new Fragment(null) {
            @Override public Context getContext() { throw new IllegalStateException(privateValue); }
        };
        List<?> source = Collections.emptyList();
        assertSame(source, Settings.addLegacyDrawerEntry(fragment, source));
        assertEquals(0, FactoryShadow.calls);
        assertNotNull(Settings.hookErrors.get("menu_row"));
        assertFalse(Settings.hookErrors.get("menu_row").contains(privateValue));
        for (ShadowLog.LogItem item : ShadowLog.getLogsForTag("HushMessenger")) {
            assertFalse(item.msg.contains(privateValue));
            assertNull(item.throwable);
        }
    }

    @Test public void theKeyCacheNeverAcceptsNullOrAnUnrelatedType() {
        assertNull(Settings.cachedLegacyDrawerKey(null));
        Object first = new FakeSettingsFolderKey();
        assertSame(first, Settings.cachedLegacyDrawerKey(first));
        assertSame(first, Settings.cachedLegacyDrawerKey(new FakeSettingsFolderKey()));
        assertNull(Settings.cachedLegacyDrawerKey(new FakeDrawerFolderKey()));
        assertNull(Settings.cachedLegacyDrawerKey(null));
        assertSame(first, Settings.cachedLegacyDrawerKey(new FakeSettingsFolderKey()));
    }
}
