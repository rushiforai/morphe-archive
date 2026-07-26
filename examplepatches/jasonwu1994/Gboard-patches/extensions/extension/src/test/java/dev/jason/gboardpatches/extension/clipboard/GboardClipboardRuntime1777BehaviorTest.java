package dev.jason.gboardpatches.extension.clipboard;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.Context;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.database.MatrixCursor;
import android.net.Uri;
import android.widget.TextView;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.shadows.ShadowContentResolver;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

@RunWith(RobolectricTestRunner.class)
public final class GboardClipboardRuntime1777BehaviorTest {
    private Context context;
    private TargetClassLoader targetLoader;
    private ClipboardProvider provider;

    @Before
    public void setUp() throws Exception {
        context = RuntimeEnvironment.getApplication();
        context.getSharedPreferences(GboardClipboardSettings.PREF_FILE, Context.MODE_PRIVATE)
                .edit().clear().commit();
        targetLoader = new TargetClassLoader(getClass().getClassLoader());
        clearTargetState();
        provider = new ClipboardProvider();
        provider.onCreate();
        ShadowContentResolver.registerProviderInternal("clipboard1777", provider);
    }

    @Test
    public void resolvesExact1777HandlesAndInstantTimestamp() throws Throwable {
        GboardClipboardRuntimeSupport support = new GboardClipboardRuntimeSupport();
        GboardClipboardRuntimeSupport.ReflectionHandles handles =
                support.reflectionHandles(targetLoader);

        Assert.assertEquals("eun", handles.loaderCallableOwnerField.getDeclaringClass().getName());
        Assert.assertEquals("euo", handles.loaderContextField.getDeclaringClass().getName());
        Assert.assertEquals("evu", handles.pruneCallableOwnerField.getDeclaringClass().getName());
        Assert.assertEquals("ewb", handles.dataHandlerContextField.getDeclaringClass().getName());
        Assert.assertEquals("f", handles.dataHandlerDisabledField.getName());
        Assert.assertEquals("g", handles.dataHandlerCountField.getName());
        Assert.assertEquals("evn", handles.adapterItemsField.getDeclaringClass().getName());
        Assert.assertEquals("n", handles.adapterItemsField.getName());
        Assert.assertEquals("o", handles.adapterRecentCountField.getName());
        Assert.assertEquals("y", handles.adapterPinnedVisibleCountField.getName());
        Assert.assertEquals("e", handles.adapterContextField.getName());
        Assert.assertEquals("evl", handles.clipItemViewHolderTextField.getDeclaringClass().getName());
        Assert.assertEquals("l", handles.dataHandlerCleanupCursorMethod.getName());
        Assert.assertEquals("N", handles.preferencesAccessorMethod.getName());
        Assert.assertEquals("s", handles.preferenceWriteLongMethod.getName());

        Object clip = newClip(7L, 1234L, 0, false, false);
        Assert.assertEquals(1234L, support.clipTimestamp(handles, clip));
        Method converter = GboardClipboardRuntimeSupport.class.getDeclaredMethod(
                "timestampToEpochMillis", Object.class);
        converter.setAccessible(true);
        Assert.assertEquals(5678L,
                ((Long) converter.invoke(null, Long.valueOf(5678L))).longValue());
    }

    @Test
    public void reconcilesEverySmallerAndGreaterDimensionButNotEqual() throws Exception {
        Method method = GboardClipboardUiHookAdapter.class.getDeclaredMethod(
                "shouldRestoreAfterStockTrim",
                int.class, int.class, int.class, int.class, int.class, int.class);
        method.setAccessible(true);

        assertRestore(method, true, 1, 4, 2, 2, 9, 9);
        assertRestore(method, true, 5, 5, 0, 2, 9, 9);
        assertRestore(method, true, 5, 5, 2, 2, 1, 4);
        assertRestore(method, true, 1, 4, 0, 2, 1, 4);
        assertRestore(method, true, 6, 5, 2, 2, 9, 9);
        assertRestore(method, true, 5, 5, 3, 2, 9, 9);
        assertRestore(method, true, 5, 5, 2, 2, 10, 9);
        assertRestore(method, false, 5, 5, 2, 2, 9, 9);
    }

    @Test
    public void columnContextSkipsShadowingYAndUsesTargetW() throws Throwable {
        Object receiver = construct("ClipboardKeyboard1777Stub",
                new Class<?>[] { Context.class, Object.class }, context, new Object());
        GboardClipboardRuntimeSupport support = new GboardClipboardRuntimeSupport();
        Assert.assertSame(context, support.runtimeContext(receiver));
    }

    @Test
    public void customSnapshotReadersNeverOpenAnEditor() {
        Map<String, Object> values = new HashMap<String, Object>();
        values.put(GboardClipboardSettings.PREF_KEY_CLIPBOARD_TTL_MS,
                GboardClipboardSettings.PREF_VALUE_CUSTOM);
        values.put(GboardClipboardSettings.PREF_KEY_CLIPBOARD_TTL_CUSTOM_MINUTES, 7);
        values.put(GboardClipboardSettings.PREF_KEY_CLIPBOARD_MAX_COUNT,
                GboardClipboardSettings.PREF_VALUE_CUSTOM);
        values.put(GboardClipboardSettings.PREF_KEY_CLIPBOARD_MAX_COUNT_CUSTOM, 13);
        values.put(GboardClipboardSettings.PREF_KEY_CLIPBOARD_CONTENT_MAX_LINES,
                GboardClipboardSettings.PREF_VALUE_CUSTOM);
        values.put(GboardClipboardSettings.PREF_KEY_CLIPBOARD_CONTENT_MAX_LINES_CUSTOM, 11);
        CountingPreferences snapshot = new CountingPreferences(values);

        Assert.assertEquals(7L * GboardClipboardSettings.MINUTE_MS,
                GboardClipboardSettings.readClipboardTtlMs(snapshot.preferences));
        Assert.assertEquals(13,
                GboardClipboardSettings.readClipboardMaxCount(snapshot.preferences));
        Assert.assertEquals(11,
                GboardClipboardSettings.readClipboardContentMaxLines(snapshot.preferences));
        Assert.assertEquals(0, snapshot.editCalls);
    }

    @Test
    public void loaderPreservesSectionsSupportsTtlSmallerAndMoreThanFiveGroups()
            throws Throwable {
        setRuntimePreferences(-1L, -1, 5, true, false, false, "newest_first", 2);
        long now = System.currentTimeMillis();
        List<Object> sevenGroups = new ArrayList<Object>();
        for (int i = 0; i < 7; i++) {
            sevenGroups.add(newClip(100L + i, now - (i * 1000L), 0, false, false));
        }
        sevenGroups.add(newClip(200L, now - 200_000L, 1, true, false));
        sevenGroups.add(newClip(300L, now - 300_000L, 2, false, true));
        setQueryItems(sevenGroups);

        List<?> expanded = (List<?>) newLoaderAdapter().maybeBuildLoaderResult(newLoaderReceiver());
        Assert.assertEquals(12, expanded.size());
        assertHeaderCounts(expanded);

        setRuntimePreferences(60_000L, 100, 5, true, false, false,
                "newest_first", 2);
        Object recent = newClip(1L, now - 10_000L, 0, false, false);
        Object expired = newClip(2L, now - 120_000L, 0, false, false);
        Object pinned = newClip(3L, now - 180_000L, 1, true, false);
        Object special = newClip(4L, now - 240_000L, 2, false, true);
        setQueryItems(Arrays.asList(recent, expired, pinned, special));
        setStaticLong("cbv", "lastVisibleTimestamp", 0L);

        List<?> ttlResult = (List<?>) newLoaderAdapter().maybeBuildLoaderResult(newLoaderReceiver());
        Assert.assertEquals(6, ttlResult.size());
        Assert.assertTrue(ttlResult.contains(recent));
        Assert.assertFalse(ttlResult.contains(expired));
        Assert.assertTrue(ttlResult.contains(pinned));
        Assert.assertTrue(ttlResult.contains(special));
        assertHeaderCounts(ttlResult);
    }

    @Test
    public void adapterRestoresSmallerTtlAndGreaterThanFiveGroupAssemblies() throws Throwable {
        long now = System.currentTimeMillis();
        setRuntimePreferences(-1L, -1, 5, false, false, false, "newest_first", 2);
        List<Object> expected = new ArrayList<Object>();
        for (int i = 0; i < 7; i++) {
            expected.add(newClip(10L + i, now - (i * 1000L), 0, false, false));
        }
        setQueryItems(expected);
        List<Object> stockFive = assemblyWithRecent(expected.subList(0, 5));
        Object adapter = newAdapter(stockFive, 5, 0);
        newUiAdapter().afterAdapterTrim(adapter);
        Assert.assertEquals(7, getInt(adapter, "o"));
        Assert.assertEquals(10, ((List<?>) getField(adapter, "n")).size());

        setRuntimePreferences(60_000L, 100, 5, false, false, false,
                "newest_first", 2);
        Object recent = newClip(31L, now - 5_000L, 0, false, false);
        Object expired = newClip(32L, now - 120_000L, 0, false, false);
        setQueryItems(Arrays.asList(recent, expired));
        Object ttlAdapter = newAdapter(assemblyWithRecent(Arrays.asList(recent, expired)), 2, 0);
        newUiAdapter().afterAdapterTrim(ttlAdapter);
        Assert.assertEquals(1, getInt(ttlAdapter, "o"));
        Assert.assertFalse(((List<?>) getField(ttlAdapter, "n")).contains(expired));
    }

    @Test
    public void bindUsesTargetHolderInstantPreviewAndDoesNotDuplicateMetadata() throws Throwable {
        long timestamp = System.currentTimeMillis() - 5_000L;
        setRuntimePreferences(60_000L, 100, 10, true, true, true,
                "newest_first", 2);
        setStaticLong("ewb", "primaryTimestamp", timestamp);
        Object clip = newClip(41L, timestamp, 0, false, false);
        Object second = newClip(40L, timestamp - 1_000L, 0, false, false);
        Object adapter = newAdapter(assemblyWithRecent(Arrays.asList(clip, second)), 2, 0);
        TextView textView = new TextView(context);
        textView.setText("payload");
        textView.setMaxLines(5);
        Object holder = construct("evl", new Class<?>[] { TextView.class }, textView);
        GboardClipboardUiHookAdapter ui = newUiAdapter();

        ui.afterItemBind(adapter, holder, 1);
        ui.afterItemBind(adapter, holder, 1);

        String rendered = textView.getText().toString();
        Assert.assertEquals(1, count(rendered, "payload"));
        Assert.assertEquals(1, count(rendered, "primary"));
        Assert.assertTrue(rendered.contains("[1]"));
        Assert.assertEquals(10, textView.getMaxLines());
    }

    @Test
    public void recycledHolderKeepsNewStockPayloadWhenBindingDifferentItem() throws Throwable {
        long now = System.currentTimeMillis();
        setRuntimePreferences(60_000L, 100, 5, false, false, true,
                "newest_first", 2);
        Object first = newClip(51L, now - 1_000L, 0, false, false);
        Object second = newClip(50L, now - 2_000L, 0, false, false);
        Object adapter = newAdapter(assemblyWithRecent(Arrays.asList(first, second)), 2, 0);
        TextView textView = new TextView(context);
        textView.setText("payload-A");
        textView.setMaxLines(5);
        Object holder = construct("evl", new Class<?>[] { TextView.class }, textView);
        GboardClipboardUiHookAdapter ui = newUiAdapter();

        ui.afterItemBind(adapter, holder, 1);
        textView.setText("payload-B");
        ui.afterItemBind(adapter, holder, 2);

        String rendered = textView.getText().toString();
        Assert.assertEquals(1, count(rendered, "payload-B"));
        Assert.assertEquals(0, count(rendered, "payload-A"));
        Assert.assertTrue(rendered.contains("[2]"));
    }

    @Test
    public void recycledHolderKeepsEditedStockPayloadWhenClipIdUnchanged() throws Throwable {
        long now = System.currentTimeMillis();
        setRuntimePreferences(60_000L, 100, 5, false, false, true,
                "newest_first", 2);
        Object clip = newClip(61L, now - 1_000L, 0, false, false);
        Object adapter = newAdapter(assemblyWithRecent(Arrays.asList(clip)), 1, 0);
        TextView textView = new TextView(context);
        textView.setText("original-payload");
        textView.setMaxLines(5);
        Object holder = construct("evl", new Class<?>[] { TextView.class }, textView);
        GboardClipboardUiHookAdapter ui = newUiAdapter();

        ui.afterItemBind(adapter, holder, 1);
        textView.setText("edited-payload");
        ui.afterItemBind(adapter, holder, 1);

        String rendered = textView.getText().toString();
        Assert.assertEquals(1, count(rendered, "edited-payload"));
        Assert.assertEquals(0, count(rendered, "original-payload"));
        Assert.assertEquals(1, count(rendered, "[1]"));
    }

    @Test
    public void recycledHolderKeepsDifferentClipPayloadEqualToPreviousRenderedText()
            throws Throwable {
        long now = System.currentTimeMillis();
        setRuntimePreferences(60_000L, 100, 5, false, false, true,
                "newest_first", 2);
        Object first = newClip(91L, now - 1_000L, 0, false, false);
        Object second = newClip(90L, now - 2_000L, 0, false, false);
        Object adapter = newAdapter(assemblyWithRecent(Arrays.asList(first, second)), 2, 0);
        TextView textView = new TextView(context);
        textView.setText("payload-A");
        textView.setMaxLines(5);
        Object holder = construct("evl", new Class<?>[] { TextView.class }, textView);
        GboardClipboardUiHookAdapter ui = newUiAdapter();

        ui.afterItemBind(adapter, holder, 1);
        String secondStockPayload = textView.getText().toString();
        textView.setText(secondStockPayload);
        ui.afterItemBind(adapter, holder, 2);

        Assert.assertEquals("[2]\n" + secondStockPayload, textView.getText().toString());
    }

    @Test
    public void disabledBindPreservesMetadataLikeStockPayloadAfterRecycling() throws Throwable {
        long now = System.currentTimeMillis();
        setRuntimePreferences(60_000L, 100, 5, false, false, true,
                "newest_first", 2);
        Object first = newClip(101L, now - 1_000L, 0, false, false);
        Object second = newClip(100L, now - 2_000L, 0, false, false);
        Object adapter = newAdapter(assemblyWithRecent(Arrays.asList(first, second)), 2, 0);
        TextView textView = new TextView(context);
        textView.setText("payload-A");
        textView.setMaxLines(5);
        Object holder = construct("evl", new Class<?>[] { TextView.class }, textView);
        GboardClipboardUiHookAdapter ui = newUiAdapter();
        ui.afterItemBind(adapter, holder, 1);

        context.getSharedPreferences(GboardClipboardSettings.PREF_FILE, Context.MODE_PRIVATE)
                .edit().putBoolean(GboardClipboardSettings.PREF_KEY_CLIPBOARD_ENABLED, false)
                .commit();
        textView.setText("[1]\nstock-payload-B");
        ui.afterItemBind(adapter, holder, 2);

        Assert.assertEquals("[1]\nstock-payload-B", textView.getText().toString());
    }

    @Test
    public void metadataFreeBindPreservesMetadataLikeStockPayloadAfterRecycling()
            throws Throwable {
        long now = System.currentTimeMillis();
        setRuntimePreferences(60_000L, 100, 5, false, false, true,
                "newest_first", 2);
        Object first = newClip(111L, now - 1_000L, 0, false, false);
        Object second = newClip(110L, now - 2_000L, 0, false, false);
        Object adapter = newAdapter(assemblyWithRecent(Arrays.asList(first, second)), 2, 0);
        TextView textView = new TextView(context);
        textView.setText("payload-A");
        textView.setMaxLines(5);
        Object holder = construct("evl", new Class<?>[] { TextView.class }, textView);
        GboardClipboardUiHookAdapter ui = newUiAdapter();
        ui.afterItemBind(adapter, holder, 1);

        setRuntimePreferences(60_000L, 100, 5, false, false, false,
                "newest_first", 2);
        textView.setText("[1]\nstock-payload-B");
        ui.afterItemBind(adapter, holder, 2);

        Assert.assertEquals("[1]\nstock-payload-B", textView.getText().toString());
    }

    @Test
    public void bindStripsStaleMetadataWhenActiveBindingIsMissing() throws Throwable {
        long now = System.currentTimeMillis();
        setRuntimePreferences(60_000L, 100, 5, false, false, true,
                "newest_first", 2);
        Object clip = newClip(71L, now - 1_000L, 0, false, false);
        Object adapter = newAdapter(assemblyWithRecent(Arrays.asList(clip)), 1, 0);
        TextView textView = new TextView(context);
        textView.setText("[1]\npayload");
        textView.setMaxLines(5);
        Object holder = construct("evl", new Class<?>[] { TextView.class }, textView);

        newUiAdapter().afterItemBind(adapter, holder, 1);

        String rendered = textView.getText().toString();
        Assert.assertEquals(1, count(rendered, "payload"));
        Assert.assertEquals(1, count(rendered, "[1]"));
    }

    @Test
    public void pruneAppliesTtlAndRetainMaxWithCleanupBeforeDeleteAndPreservation()
            throws Throwable {
        long now = System.currentTimeMillis();
        long primaryTimestamp = now - 400_000L;
        setRuntimePreferences(60_000L, 3, 5, false, false, false,
                "newest_first", 2);
        setStaticLong("ewb", "primaryTimestamp", primaryTimestamp);
        provider.rows.add(new Row(10L, now - 500_000L, 1));
        provider.rows.add(new Row(11L, now - 500_000L, 2));
        provider.rows.add(new Row(2L, primaryTimestamp, 0));
        provider.rows.add(new Row(3L, now - 300_000L, 0));
        provider.rows.add(new Row(4L, now - 1_000L, 0));
        provider.rows.add(new Row(5L, now - 2_000L, 0));
        provider.rows.add(new Row(6L, now - 3_000L, 0));
        Object dataHandler = construct("ewb",
                new Class<?>[] { Context.class, boolean.class, int.class },
                context, Boolean.FALSE, Integer.valueOf(provider.rows.size()));
        Object receiver = construct("evu",
                new Class<?>[] { targetClass("ewb"), int.class },
                dataHandler, Integer.valueOf(120));
        GboardClipboardRuntimeSupport support = new GboardClipboardRuntimeSupport();
        GboardClipboardPruneHookAdapter prune = new GboardClipboardPruneHookAdapter(
                support,
                new GboardClipboardRetentionFeature(support),
                new GboardClipboardMaxCountFeature(support));

        Assert.assertTrue(prune.handleCustomPrune(receiver));

        Assert.assertEquals(new HashSet<Long>(Arrays.asList(2L, 4L, 5L, 10L, 11L)),
                provider.ids());
        Assert.assertEquals(Arrays.asList(
                "cleanup:3", "delete:3", "cleanup:6", "delete:6"), targetEvents());
        Object count = getField(dataHandler, "g");
        Assert.assertEquals(5, ((java.util.concurrent.atomic.AtomicInteger) count).get());
    }

    @Test
    public void pruneDoesNotDeleteExpiredItemWhenCleanupFails() throws Throwable {
        long now = System.currentTimeMillis();
        setRuntimePreferences(60_000L, 100, 5, false, false, false,
                "newest_first", 2);
        setStaticLong("ewb", "cleanupFailureId", 81L);
        provider.rows.add(new Row(81L, now - 120_000L, 0));
        provider.rows.add(new Row(82L, now - 1_000L, 0));
        Object dataHandler = construct("ewb",
                new Class<?>[] { Context.class, boolean.class, int.class },
                context, Boolean.FALSE, Integer.valueOf(provider.rows.size()));
        Object receiver = construct("evu",
                new Class<?>[] { targetClass("ewb"), int.class },
                dataHandler, Integer.valueOf(120));
        GboardClipboardRuntimeSupport support = new GboardClipboardRuntimeSupport();
        GboardClipboardPruneHookAdapter prune = new GboardClipboardPruneHookAdapter(
                support,
                new GboardClipboardRetentionFeature(support),
                new GboardClipboardMaxCountFeature(support));

        Assert.assertTrue(prune.handleCustomPrune(receiver));

        Assert.assertEquals(new HashSet<Long>(Arrays.asList(81L, 82L)), provider.ids());
        Assert.assertEquals(Arrays.asList("cleanup-failed:81"), targetEvents());
        Object count = getField(dataHandler, "g");
        Assert.assertEquals(2, ((java.util.concurrent.atomic.AtomicInteger) count).get());
    }

    @Test
    public void columnOverrideSupportsOneTwoThreeStockAndDisabledPassThrough() throws Throwable {
        for (int columns : new int[] { 1, 2, 3 }) {
            setRuntimePreferences(60_000L, 100, 5, false, false, false,
                    "newest_first", columns);
            GboardClipboardRuntimeSupport support = new GboardClipboardRuntimeSupport();
            Object receiver = construct("ClipboardKeyboard1777Stub",
                    new Class<?>[] { Context.class, Object.class }, context, new Object());
            Assert.assertEquals(Integer.valueOf(columns),
                    new GboardClipboardColumnCountFeature(support).resolveOverride(receiver));
        }

        setRuntimePreferences(60_000L, 100, 5, false, false, false,
                "newest_first", 4);
        GboardClipboardRuntimeSupport invalidSupport = new GboardClipboardRuntimeSupport();
        Object receiver = construct("ClipboardKeyboard1777Stub",
                new Class<?>[] { Context.class, Object.class }, context, new Object());
        Assert.assertEquals(Integer.valueOf(2),
                new GboardClipboardColumnCountFeature(invalidSupport).resolveOverride(receiver));

        context.getSharedPreferences(GboardClipboardSettings.PREF_FILE, Context.MODE_PRIVATE)
                .edit().putBoolean(GboardClipboardSettings.PREF_KEY_CLIPBOARD_ENABLED, false)
                .commit();
        GboardClipboardRuntimeSupport disabledSupport = new GboardClipboardRuntimeSupport();
        Assert.assertNull(new GboardClipboardColumnCountFeature(disabledSupport)
                .resolveOverride(receiver));
        Assert.assertNull(new GboardClipboardColumnCountFeature(disabledSupport)
                .resolveOverride(null));
    }

    private GboardClipboardLoaderHookAdapter newLoaderAdapter() {
        GboardClipboardRuntimeSupport support = new GboardClipboardRuntimeSupport();
        return new GboardClipboardLoaderHookAdapter(support,
                new GboardClipboardRetentionFeature(support),
                new GboardClipboardMaxCountFeature(support));
    }

    private GboardClipboardUiHookAdapter newUiAdapter() {
        GboardClipboardRuntimeSupport support = new GboardClipboardRuntimeSupport();
        GboardClipboardRetentionFeature retention = new GboardClipboardRetentionFeature(support);
        GboardClipboardMaxCountFeature maxCount = new GboardClipboardMaxCountFeature(support);
        GboardClipboardLoaderHookAdapter loader =
                new GboardClipboardLoaderHookAdapter(support, retention, maxCount);
        return new GboardClipboardUiHookAdapter(support, maxCount,
                new GboardClipboardPreviewLinesFeature(support),
                new GboardClipboardCountdownFeature(support, retention),
                new GboardClipboardCreationTimeFeature(support),
                new GboardClipboardOrderIndexFeature(support), loader);
    }

    private Object newLoaderReceiver() throws Exception {
        Object owner = construct("euo", new Class<?>[] { Context.class }, context);
        return construct("eun", new Class<?>[] { targetClass("euo") }, owner);
    }

    private Object newAdapter(List<Object> items, int recent, int pinned) throws Exception {
        return construct("evn", new Class<?>[] { Context.class, List.class, int.class, int.class },
                context, items, Integer.valueOf(recent), Integer.valueOf(pinned));
    }

    private Object newClip(long id, long timestamp, int itemType, boolean pinned,
            boolean special) throws Exception {
        Object instant = construct("j$.time.Instant", new Class<?>[] { long.class },
                Long.valueOf(timestamp));
        return construct("euk", new Class<?>[] { long.class, targetClass("j$.time.Instant"),
                int.class, boolean.class, boolean.class }, Long.valueOf(id), instant,
                Integer.valueOf(itemType), Boolean.valueOf(pinned), Boolean.valueOf(special));
    }

    private List<Object> assemblyWithRecent(List<Object> recent) throws Exception {
        List<Object> result = new ArrayList<Object>();
        result.add(header("a"));
        result.addAll(recent);
        result.add(header("b"));
        result.add(header("c"));
        return result;
    }

    private void assertHeaderCounts(List<?> items) throws Exception {
        Assert.assertEquals(1, occurrences(items, header("a")));
        Assert.assertEquals(1, occurrences(items, header("b")));
        Assert.assertEquals(1, occurrences(items, header("c")));
    }

    private Object header(String name) throws Exception {
        Field field = targetClass("euk").getDeclaredField(name);
        field.setAccessible(true);
        return field.get(null);
    }

    private int occurrences(List<?> values, Object target) {
        int count = 0;
        for (Object value : values) if (value == target) count++;
        return count;
    }

    private void setQueryItems(List<Object> values) throws Exception {
        Field field = targetClass("evr").getDeclaredField("items");
        field.setAccessible(true);
        @SuppressWarnings("unchecked")
        List<Object> items = (List<Object>) field.get(null);
        items.clear();
        items.addAll(values);
    }

    private void clearTargetState() throws Exception {
        setQueryItems(new ArrayList<Object>());
        setStaticLong("ewb", "primaryTimestamp", 0L);
        setStaticLong("ewb", "cleanupFailureId", Long.MIN_VALUE);
        setStaticLong("cbv", "lastVisibleTimestamp", 0L);
    }

    @SuppressWarnings("unchecked")
    private List<String> targetEvents() throws Exception {
        Field field = targetClass("ewb").getDeclaredField("events");
        field.setAccessible(true);
        return new ArrayList<String>((List<String>) field.get(null));
    }

    private void setStaticLong(String className, String fieldName, long value) throws Exception {
        Field field = targetClass(className).getDeclaredField(fieldName);
        field.setAccessible(true);
        field.setLong(null, value);
    }

    private void setRuntimePreferences(long ttlMs, int maxCount, int previewLines,
            boolean countdown, boolean creation, boolean order, String orderMode, int columns) {
        context.getSharedPreferences(GboardClipboardSettings.PREF_FILE, Context.MODE_PRIVATE)
                .edit()
                .putBoolean(GboardClipboardSettings.PREF_KEY_CLIPBOARD_ENABLED, true)
                .putBoolean(GboardClipboardSettings.PREF_KEY_CLIPBOARD_SHOW_COUNTDOWN, countdown)
                .putBoolean(GboardClipboardSettings.PREF_KEY_CLIPBOARD_SHOW_CREATION_TIME, creation)
                .putBoolean(GboardClipboardSettings.PREF_KEY_CLIPBOARD_SHOW_ORDER_INDEX, order)
                .putString(GboardClipboardSettings.PREF_KEY_CLIPBOARD_ORDER_INDEX_MODE, orderMode)
                .putString(GboardClipboardSettings.PREF_KEY_CLIPBOARD_TTL_MS,
                        Long.toString(ttlMs))
                .putString(GboardClipboardSettings.PREF_KEY_CLIPBOARD_MAX_COUNT,
                        Integer.toString(maxCount))
                .putString(GboardClipboardSettings.PREF_KEY_CLIPBOARD_CONTENT_MAX_LINES,
                        Integer.toString(previewLines))
                .putString(GboardClipboardSettings.PREF_KEY_CLIPBOARD_COLUMN_COUNT,
                        Integer.toString(columns))
                .commit();
    }

    private Object construct(String className, Class<?>[] parameterTypes, Object... args)
            throws Exception {
        Constructor<?> constructor = targetClass(className).getDeclaredConstructor(parameterTypes);
        constructor.setAccessible(true);
        return constructor.newInstance(args);
    }

    private Class<?> targetClass(String name) throws Exception {
        return Class.forName(name, true, targetLoader);
    }

    private Object getField(Object owner, String name) throws Exception {
        Field field = owner.getClass().getDeclaredField(name);
        field.setAccessible(true);
        return field.get(owner);
    }

    private int getInt(Object owner, String name) throws Exception {
        return ((Integer) getField(owner, name)).intValue();
    }

    private void assertRestore(Method method, boolean expected, int expectedRecent,
            int currentRecent, int expectedPinned, int currentPinned, int expectedSize,
            int currentSize) throws Exception {
        Assert.assertEquals(Boolean.valueOf(expected), method.invoke(null,
                expectedRecent, currentRecent, expectedPinned, currentPinned,
                expectedSize, currentSize));
    }

    private int count(String value, String token) {
        return value.split(java.util.regex.Pattern.quote(token), -1).length - 1;
    }

    private static final class TargetClassLoader extends ClassLoader {
        private static final Set<String> TARGETS = new HashSet<String>(Arrays.asList(
                "eun", "euo", "evu", "ewb", "evm", "evn", "kl", "evl", "eum",
                "euk", "evr", "cbv", "pnp", "AbstractKeyboard1777Stub",
                "ClipboardKeyboard1777Stub", "j$.time.Instant"));

        TargetClassLoader(ClassLoader parent) {
            super(parent);
        }

        @Override
        protected Class<?> loadClass(String name, boolean resolve) throws ClassNotFoundException {
            synchronized (this) {
                Class<?> loaded = findLoadedClass(name);
                if (loaded == null && TARGETS.contains(name)) {
                    loaded = defineTarget(name);
                }
                if (loaded == null) loaded = super.loadClass(name, false);
                if (resolve) resolveClass(loaded);
                return loaded;
            }
        }

        private Class<?> defineTarget(String name) throws ClassNotFoundException {
            String resource = "pnp".equals(name) ? "qnp.class" :
                    name.replace('.', '/') + ".class";
            try (InputStream input = getParent().getResourceAsStream(resource)) {
                if (input == null) throw new ClassNotFoundException(name);
                ByteArrayOutputStream output = new ByteArrayOutputStream();
                byte[] buffer = new byte[4096];
                int count;
                while ((count = input.read(buffer)) >= 0) output.write(buffer, 0, count);
                byte[] bytes = output.toByteArray();
                if ("pnp".equals(name)) {
                    for (int i = 0; i + 2 < bytes.length; i++) {
                        if (bytes[i] == 'q' && bytes[i + 1] == 'n' && bytes[i + 2] == 'p') {
                            bytes[i] = 'p';
                        }
                    }
                }
                return defineClass(name, bytes, 0, bytes.length);
            } catch (ClassNotFoundException missing) {
                throw missing;
            } catch (Exception failure) {
                throw new ClassNotFoundException(name, failure);
            }
        }
    }

    private static final class CountingPreferences implements InvocationHandler {
        final Map<String, Object> values;
        final SharedPreferences preferences;
        int editCalls;

        CountingPreferences(Map<String, Object> values) {
            this.values = values;
            preferences = (SharedPreferences) Proxy.newProxyInstance(
                    getClass().getClassLoader(), new Class<?>[] { SharedPreferences.class }, this);
        }

        @Override
        public Object invoke(Object proxy, Method method, Object[] args) {
            String name = method.getName();
            if ("getAll".equals(name)) return values;
            if ("contains".equals(name)) return values.containsKey(args[0]);
            if ("edit".equals(name)) {
                editCalls++;
                return Proxy.newProxyInstance(getClass().getClassLoader(),
                        new Class<?>[] { SharedPreferences.Editor.class },
                        (editor, editorMethod, editorArgs) -> {
                            Class<?> returnType = editorMethod.getReturnType();
                            if (returnType == SharedPreferences.Editor.class) return editor;
                            if (returnType == boolean.class) return Boolean.TRUE;
                            return null;
                        });
            }
            if ("registerOnSharedPreferenceChangeListener".equals(name)
                    || "unregisterOnSharedPreferenceChangeListener".equals(name)) return null;
            Object value = values.get(args[0]);
            if (value != null) return value;
            return args.length > 1 ? args[1] : null;
        }
    }

    private static final class Row {
        final long id;
        final long timestamp;
        final int itemType;

        Row(long id, long timestamp, int itemType) {
            this.id = id;
            this.timestamp = timestamp;
            this.itemType = itemType;
        }
    }

    private static final class ClipboardProvider extends ContentProvider {
        final List<Row> rows = new ArrayList<Row>();

        @Override
        public boolean onCreate() {
            return true;
        }

        @Override
        public Cursor query(Uri uri, String[] projection, String selection,
                String[] selectionArgs, String sortOrder) {
            MatrixCursor cursor = new MatrixCursor(
                    new String[] { "_id", "timestamp", "item_type", "uri" });
            List<Row> ordered = new ArrayList<Row>(rows);
            ordered.sort((left, right) -> Long.compare(right.timestamp, left.timestamp));
            for (Row row : ordered) {
                if ("item_type = ?".equals(selection)
                        && row.itemType != Integer.parseInt(selectionArgs[0])) {
                    continue;
                }
                cursor.addRow(new Object[] {
                        Long.valueOf(row.id), Long.valueOf(row.timestamp),
                        Integer.valueOf(row.itemType), null });
            }
            return cursor;
        }

        @Override
        public int delete(Uri uri, String selection, String[] selectionArgs) {
            long id = Long.parseLong(selectionArgs[0]);
            int before = rows.size();
            rows.removeIf(row -> row.id == id);
            return before - rows.size();
        }

        Set<Long> ids() {
            Set<Long> ids = new HashSet<Long>();
            for (Row row : rows) ids.add(Long.valueOf(row.id));
            return ids;
        }

        @Override public String getType(Uri uri) { return null; }
        @Override public Uri insert(Uri uri, ContentValues values) { return null; }
        @Override public int update(Uri uri, ContentValues values, String selection,
                String[] selectionArgs) { return 0; }
    }
}
