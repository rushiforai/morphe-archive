package app.morphe.extension.tiktok.settings.preference;

import static org.junit.Assert.*;

import android.app.Activity;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.os.Bundle;
import android.os.Looper;
import android.preference.Preference;
import android.preference.SwitchPreference;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.FrameLayout;
import android.widget.ListView;
import android.widget.TextView;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.tiktok.SettingsContextRule;
import app.morphe.extension.tiktok.settings.L10n;
import app.morphe.extension.tiktok.settings.Settings;
import app.morphe.extension.tiktok.settings.SettingsSearchHistory;
import app.morphe.extension.tiktok.settings.SettingsStatus;

import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import org.robolectric.annotation.LooperMode;

import java.io.File;
import java.io.FileOutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.time.Duration;
import java.util.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28, qualifiers = "en-w360dp-h640dp-night-mdpi")
@LooperMode(LooperMode.Mode.PAUSED)
@SuppressWarnings("deprecation")
public class SettingsSearchLocationTest {
    @Rule public final SettingsContextRule context = new SettingsContextRule();
    private final Map<Field, Boolean> statuses = new LinkedHashMap<>();
    private ActivityController<Window> owner;
    private boolean oldAdId, oldAdvance, oldSearchAdvance, oldDark;
    private boolean sawHighlight;
    private ListView observedList;
    private Runnable highlightFrame;
    private String highlightScreenshot;
    private android.app.FragmentManager.FragmentLifecycleCallbacks frameLifecycle;

    public static class Window extends Activity {
        @Override
        public void onCreate(Bundle state) {
            boolean dark = (getResources().getConfiguration().uiMode & 0x30) == 0x20;
            setTheme(
                    dark
                            ? android.R.style.Theme_Material_NoActionBar
                            : android.R.style.Theme_Material_Light_NoActionBar);
            Utils.setIsDarkModeEnabled(dark);
            super.onCreate(state);
            ((FrameLayout) findViewById(android.R.id.content))
                    .setTag(SettingsActionBanner.CONTENT_ROOT_TAG);
        }
    }

    @Before
    public void prepare() throws Exception {
        app.morphe.extension.shared.Utils.setContext(RuntimeEnvironment.getApplication());
        for (Field field : SettingsStatus.class.getDeclaredFields()) {
            if (field.getType() == boolean.class && Modifier.isStatic(field.getModifiers())) {
                field.setAccessible(true);
                statuses.put(field, field.getBoolean(null));
                field.setBoolean(null, true);
            }
        }
        oldAdId = Settings.BLOCK_ADVERTISING_ID.savedValue();
        oldAdvance = Settings.AUTO_ADVANCE.savedValue();
        oldSearchAdvance = Settings.AUTO_ADVANCE_SEARCH.savedValue();
        oldDark = Utils.isDarkModeEnabled();
        Settings.BLOCK_ADVERTISING_ID.save(false);
        Settings.AUTO_ADVANCE.save(false);
        Settings.AUTO_ADVANCE_SEARCH.save(false);
        SettingsSearchHistory.clear();
    }

    @After
    public void restore() throws Exception {
        if (owner != null) {
            if (frameLifecycle != null)
                owner.get()
                        .getFragmentManager()
                        .unregisterFragmentLifecycleCallbacks(frameLifecycle);
            owner.pause().stop().destroy();
        }
        SettingsActionBanner.dismissForTests();
        for (Map.Entry<Field, Boolean> entry : statuses.entrySet())
            entry.getKey().setBoolean(null, entry.getValue());
        Settings.BLOCK_ADVERTISING_ID.save(oldAdId);
        Settings.AUTO_ADVANCE.save(oldAdvance);
        Settings.AUTO_ADVANCE_SEARCH.save(oldSearchAdvance);
        SettingsSearchHistory.clear();
        Utils.setIsDarkModeEnabled(oldDark);
    }

    @Test
    public void touchHoldOpensTheOriginalSwitchWithoutATrailingToggle() throws Exception {
        TikTokPreferenceFragment search = search("advertising id");
        ListView list = list(search);
        int position = position(list, Settings.BLOCK_ADVERTISING_ID.key);
        View row = visible(list, position);
        assertFalse("a row touch listener would steal normal ListView taps", row.isLongClickable());
        long down = android.os.SystemClock.uptimeMillis();
        float x = row.getWidth() / 2f, y = row.getTop() + row.getHeight() / 2f;
        MotionEvent press = MotionEvent.obtain(down, down, MotionEvent.ACTION_DOWN, x, y, 0);
        try {
            assertTrue(list.dispatchTouchEvent(press));
        } finally {
            press.recycle();
        }
        settle();
        Shadows.shadowOf(Looper.getMainLooper())
                .idleFor(Duration.ofMillis(ViewConfiguration.getTapTimeout() + 1L));
        Shadows.shadowOf(Looper.getMainLooper())
                .idleFor(Duration.ofMillis(ViewConfiguration.getLongPressTimeout() + 50L));
        MotionEvent release =
                MotionEvent.obtain(
                        down,
                        android.os.SystemClock.uptimeMillis(),
                        MotionEvent.ACTION_UP,
                        x,
                        y,
                        0);
        try {
            list.dispatchTouchEvent(release);
        } finally {
            release.recycle();
        }
        settle();
        assertOrigin(search, Settings.BLOCK_ADVERTISING_ID.key);
        assertFalse(Settings.BLOCK_ADVERTISING_ID.get());
        assertEquals(List.of("advertising id"), SettingsSearchHistory.recent());
    }

    @Test
    public void normalItemTapStillFlipsInPlace() throws Exception {
        TikTokPreferenceFragment search = search("advertising id");
        ListView list = list(search);
        int position = position(list, Settings.BLOCK_ADVERTISING_ID.key);
        View row = visible(list, position);
        assertFalse(row.isLongClickable());
        assertTrue(list.performItemClick(row, position, list.getItemIdAtPosition(position)));
        settle();
        assertSame(search, page());
        assertTrue(Settings.BLOCK_ADVERTISING_ID.get());
    }

    @Test
    public void labeledAccessibilityActionLocatesAndTheClickActionStillToggles() throws Exception {
        TikTokPreferenceFragment search = search("advertising id");
        ListView list = list(search);
        View row = visible(list, position(list, Settings.BLOCK_ADVERTISING_ID.key));
        AccessibilityNodeInfo info = row.createAccessibilityNodeInfo();
        assertAction(
                info,
                AccessibilityNodeInfo.ACTION_LONG_CLICK,
                L10n.t(owner.get(), "Open setting location"));
        assertEquals(
                position(list, Settings.BLOCK_ADVERTISING_ID.key),
                info.getCollectionItemInfo().getRowIndex());
        assertTrue(info.isCheckable());
        assertFalse(info.isChecked());
        assertTrue(row.performAccessibilityAction(AccessibilityNodeInfo.ACTION_CLICK, null));
        settle();
        assertSame(search, page());
        assertTrue(Settings.BLOCK_ADVERTISING_ID.get());
        row = visible(list(search), position(list(search), Settings.BLOCK_ADVERTISING_ID.key));
        assertTrue(row.performAccessibilityAction(AccessibilityNodeInfo.ACTION_LONG_CLICK, null));
        settle();
        assertOrigin(search, Settings.BLOCK_ADVERTISING_ID.key);
        assertTrue(Settings.BLOCK_ADVERTISING_ID.get());
    }

    @Test
    public void theListNodeDoesNotOfferAnUnusableHoldWhileTouchHoldsStayEnabled() throws Exception {
        TikTokPreferenceFragment search = search("advertising id");
        ListView list = list(search);
        assertTrue(list.isLongClickable());
        AccessibilityNodeInfo info = list.createAccessibilityNodeInfo();
        assertFalse(info.isLongClickable());
        for (AccessibilityNodeInfo.AccessibilityAction action : info.getActionList())
            assertNotEquals(AccessibilityNodeInfo.ACTION_LONG_CLICK, action.getId());
    }

    @Test
    public void aNonSwitchResultOffersClickWithoutALongPressHint() throws Exception {
        TikTokPreferenceFragment search = search("speed tests");
        ListView list = list(search);
        View row = visible(list, positionByTitle(list, "Stop TikTok's speed tests"));
        AccessibilityNodeInfo info = row.createAccessibilityNodeInfo();
        assertFalse(info.isLongClickable());
        for (AccessibilityNodeInfo.AccessibilityAction action : info.getActionList())
            assertNotEquals(AccessibilityNodeInfo.ACTION_LONG_CLICK, action.getId());
        assertTrue(row.performAccessibilityAction(AccessibilityNodeInfo.ACTION_CLICK, null));
        settle();
        assertSame(search, page());
        assertTrue(((SettingsMenuPreference) page().findPreference("section_privacy")).isExpanded());
        assertTrue(page().findPreference("action_search_settings") instanceof SettingsSearchEntryPreference);
        assertEquals(0, owner.get().getFragmentManager().getBackStackEntryCount());
    }

    @Test
    public void detachedAndDisabledRowsCannotRunAStaleAccessibilityAction() throws Exception {
        TikTokPreferenceFragment search = search("advertising id");
        ListView list = list(search);
        View row = visible(list, position(list, Settings.BLOCK_ADVERTISING_ID.key));
        Preference pref =
                (Preference)
                        list.getItemAtPosition(position(list, Settings.BLOCK_ADVERTISING_ID.key));
        pref.setEnabled(false);
        settle();
        row = visible(list, position(list, Settings.BLOCK_ADVERTISING_ID.key));
        assertFalse(row.performAccessibilityAction(AccessibilityNodeInfo.ACTION_LONG_CLICK, null));
        assertFalse(row.performAccessibilityAction(AccessibilityNodeInfo.ACTION_CLICK, null));
        pref.setEnabled(true);
        settle();
        row = visible(list, position(list, Settings.BLOCK_ADVERTISING_ID.key));
        assertTrue(row.performAccessibilityAction(AccessibilityNodeInfo.ACTION_LONG_CLICK, null));
        settle();
        assertFalse(row.isAttachedToWindow());
        assertFalse(row.performAccessibilityAction(AccessibilityNodeInfo.ACTION_LONG_CLICK, null));
        assertFalse(Settings.BLOCK_ADVERTISING_ID.get());
    }

    @Test
    public void locatingAScrolledResultClosesSearchOnTheSameMainList() throws Exception {
        TikTokPreferenceFragment search = search("  hide  ");
        ListView list = list(search);
        assertTrue(list.getCount() > 30);
        list.setSelectionFromTop(20, -17);
        settle();
        holdFirstSwitch(list);
        settle();
        assertSame(search, page());
        assertTrue(search.findPreference("action_search_settings") instanceof SettingsSearchEntryPreference);
        assertEquals(0, owner.get().getFragmentManager().getBackStackEntryCount());
        assertFalse(owner.get().isFinishing());
    }

    @Test
    public void recreationKeepsTheInlineSearchQueryResultsAndScrollOffset() throws Exception {
        TikTokPreferenceFragment search = search("hide");
        List<String> order = resultOrder(search);
        ListView list = list(search);
        list.setSelectionFromTop(15, -11);
        settle();
        int first = list.getFirstVisiblePosition(), top = list.getChildAt(0).getTop();
        owner.recreate();
        settle();
        assertEquals("hide", input(page()).getQuery());
        assertEquals(order, resultOrder(page()));
        assertEquals(first, list(page()).getFirstVisiblePosition());
        assertEquals(top, list(page()).getChildAt(0).getTop());
        assertEquals(0, owner.get().getFragmentManager().getBackStackEntryCount());
    }

    @Test
    public void aMissingOriginalGetsAnAccurateNoticeWithoutChangingTheSwitch() throws Exception {
        TikTokPreferenceFragment search = search("advertising id");
        ListView list = list(search);
        int position = position(list, Settings.BLOCK_ADVERTISING_ID.key);
        View row = visible(list, position);
        SettingsStatus.devicePrivacyGuardEnabled = false;
        hold(list, row, position);
        settle();
        assertNull(page().findPreference(Settings.BLOCK_ADVERTISING_ID.key));
        TextView notice =
                owner.get()
                        .findViewById(android.R.id.content)
                        .findViewWithTag(SettingsActionBanner.MESSAGE_TAG);
        assertNotNull("missing target failed silently", notice);
        assertEquals(
                L10n.t(
                        owner.get(),
                        "This setting isn't available. Search for another setting."),
                notice.getText().toString());
        assertFalse(Settings.BLOCK_ADVERTISING_ID.get());
    }

    @Test
    public void unavailableChildStillOpensItsDisabledRowWithTheParentReason() throws Exception {
        TikTokPreferenceFragment search = search("auto advance in search results");
        Preference result =
                resultByTitle(search, L10n.t(owner.get(), "Auto-advance in search results"));
        assertFalse(result instanceof SwitchPreference);
        assertTrue(result.getOnPreferenceClickListener().onPreferenceClick(result));
        settle();
        Preference original = page().findPreference(Settings.AUTO_ADVANCE_SEARCH.key);
        assertNotNull(original);
        assertFalse(original.isEnabled());
        assertTrue(
                original.getSummary()
                        .toString()
                        .contains(
                                L10n.f(
                                        owner.get(),
                                        "Turn on %1$s first.",
                                        L10n.t(owner.get(), "Auto-advance videos"))));
        assertFalse(Settings.AUTO_ADVANCE.get());
        assertFalse(Settings.AUTO_ADVANCE_SEARCH.get());
    }

    @Test
    public void aResultDeepInFeedScreenLandsOnItsRow() throws Exception {
        // On the S22 these opened Feed screen at its top, 5 to 15 swipes above the row.
        assertResultLandsOnRow("liked grids", "Sort loaded videos on Liked grids",
                Settings.LIKED_GRID_SORT.key);
        assertResultLandsOnRow("double tap", "Double tap", Settings.DOUBLE_TAP_ACTION.key);
    }

    private void assertResultLandsOnRow(String query, String title, String key) throws Exception {
        if (owner != null) {
            owner.get().getFragmentManager().unregisterFragmentLifecycleCallbacks(frameLifecycle);
            owner.pause().stop().destroy();
        }
        TikTokPreferenceFragment search = search(query);
        // Typing leaves the field focused, and the list followed that focus back to the top.
        android.widget.EditText field = findEditText(list(search));
        assertNotNull(field);
        assertTrue(field.requestFocus());
        settle();
        // The keyboard takes the bottom of the window, and the page grows back as it closes.
        View decor = owner.get().getWindow().getDecorView();
        decor.measure(View.MeasureSpec.makeMeasureSpec(360, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(360, View.MeasureSpec.EXACTLY));
        decor.layout(0, 0, 360, 360);
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        Preference result = resultByTitle(search, L10n.t(owner.get(), title));
        assertTrue(result.getOnPreferenceClickListener().onPreferenceClick(result));
        // The page lays out keyboard-sized once, then grows while the result's scroll is pending.
        decor.measure(View.MeasureSpec.makeMeasureSpec(360, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(360, View.MeasureSpec.EXACTLY));
        decor.layout(0, 0, 360, 360);
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        settle();
        ListView list = list(page());
        int position = position(list, key);
        assertTrue(title + " at " + position + " is not on screen ("
                        + list.getFirstVisiblePosition() + ".." + list.getLastVisiblePosition() + ")",
                position >= list.getFirstVisiblePosition() && position <= list.getLastVisiblePosition());
    }

    private static android.widget.EditText findEditText(View root) {
        if (root instanceof android.widget.EditText) return (android.widget.EditText) root;
        if (!(root instanceof android.view.ViewGroup)) return null;
        android.view.ViewGroup group = (android.view.ViewGroup) root;
        for (int i = 0; i < group.getChildCount(); i++) {
            android.widget.EditText found = findEditText(group.getChildAt(i));
            if (found != null) return found;
        }
        return null;
    }

    @Test
    public void recycledDestinationDropsOnlyItsOwnedFlashAndIgnoresTheOldFade() throws Exception {
        TikTokPreferenceFragment search = search("advertising id");
        ListView results = list(search);
        int found = position(results, Settings.BLOCK_ADVERTISING_ID.key);
        View[] recycled = new View[1];
        android.graphics.drawable.ColorDrawable replacement =
                new android.graphics.drawable.ColorDrawable(android.graphics.Color.BLUE);
        highlightFrame =
                () -> {
                    ListView original = observedList;
                    int target = position(original, Settings.BLOCK_ADVERTISING_ID.key);
                    View highlighted =
                            original.getChildAt(target - original.getFirstVisiblePosition());
                    assertTrue(hasOverlay(highlighted));
                    int other = Math.min(target + 1, original.getCount() - 1);
                    recycled[0] = original.getAdapter().getView(other, highlighted, original);
                    assertSame(highlighted, recycled[0]);
                    assertFalse(hasOverlay(recycled[0]));
                    recycled[0].setForeground(replacement);
                };
        hold(results, visible(results, found), found);
        settle();
        assertNotNull("no highlighted frame was drawn", recycled[0]);
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(800));
        assertSame(replacement, recycled[0].getForeground());
    }

    @Test
    public void aPendingHighlightCannotPaintAReplacedSearchResult() throws Exception {
        TikTokPreferenceFragment search = search("advertising id");
        ListView list = list(search);
        TikTokPreferenceFragment.highlightRow(
                list, position(list, Settings.BLOCK_ADVERTISING_ID.key));
        searchFor(search, "speed tests");
        int position = positionByTitle(list, L10n.t(owner.get(), "Stop TikTok's speed tests"));
        View current = visible(list, position);
        assertFalse(hasOverlay(current));
    }

    @Test
    public void aRecycledSearchSwitchCannotKeepThePreviousLocationAction() throws Exception {
        TikTokPreferenceFragment search = search("advertising id");
        ListView list = list(search);
        View old = visible(list, position(list, Settings.BLOCK_ADVERTISING_ID.key));
        searchFor(search, "speed tests");
        list = list(search);
        int position = positionByTitle(list, L10n.t(owner.get(), "Stop TikTok's speed tests"));
        View reused = list.getAdapter().getView(position, old, list);
        assertSame(old, reused);
        AccessibilityNodeInfo info = reused.createAccessibilityNodeInfo();
        for (AccessibilityNodeInfo.AccessibilityAction action : info.getActionList()) {
            assertFalse(
                    "old location label leaked to a different preference",
                    L10n.t(owner.get(), "Open setting location")
                            .contentEquals(action.getLabel() == null ? "" : action.getLabel()));
        }
        assertFalse(
                reused.performAccessibilityAction(AccessibilityNodeInfo.ACTION_LONG_CLICK, null));
        assertSame(search, page());
    }

    @Test
    @Config(qualifiers = "de-rDE-w360dp-h640dp-night-mdpi", fontScale = 1.5f)
    @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void darkGermanLargeTextKeepsTheActionAndHighlightsTheOriginal() throws Exception {
        render("dark");
    }

    @Test
    @Config(qualifiers = "de-rDE-w360dp-h640dp-notnight-mdpi", fontScale = 1.5f)
    @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void lightGermanLargeTextKeepsTheActionAndHighlightsTheOriginal() throws Exception {
        render("light");
    }

    private void render(String theme) throws Exception {
        TikTokPreferenceFragment search =
                search(L10n.t(RuntimeEnvironment.getApplication(), "Block the advertising ID"));
        ListView list = list(search);
        int position = position(list, Settings.BLOCK_ADVERTISING_ID.key);
        View result = visible(list, position);
        assertNotEquals("Open setting location", L10n.t(owner.get(), "Open setting location"));
        assertAction(
                result.createAccessibilityNodeInfo(),
                AccessibilityNodeInfo.ACTION_LONG_CLICK,
                L10n.t(owner.get(), "Open setting location"));
        TextView title = result.findViewById(android.R.id.title);
        assertTrue(title.getHeight() >= title.getLayout().getHeight());
        screenshot(theme + "-search");
        highlightScreenshot = theme + "-location";
        hold(list, result, position);
        settle();
        Preference original = assertOrigin(search, Settings.BLOCK_ADVERTISING_ID.key);
        ListView targetList = list(page());
        View target =
                targetList.getChildAt(
                        position(targetList, original.getKey())
                                - targetList.getFirstVisiblePosition());
        assertNotNull("original row was not scrolled into view", target);
        assertTrue("original row was not highlighted in a drawn frame", sawHighlight);
        assertFalse(Settings.BLOCK_ADVERTISING_ID.get());
        assertNull("no highlighted render was captured", highlightScreenshot);
    }

    private void screenshot(String name) throws Exception {
        String output = System.getProperty("hushfeed.search.screenshots");
        if (output == null) return;
        File directory = new File(output);
        if (!directory.mkdirs() && !directory.isDirectory())
            throw new java.io.IOException("Cannot create render output");
        View view = owner.get().getWindow().getDecorView();
        Bitmap bitmap =
                Bitmap.createBitmap(view.getWidth(), view.getHeight(), Bitmap.Config.ARGB_8888);
        try (FileOutputStream file = new FileOutputStream(new File(directory, name + ".png"))) {
            view.draw(new Canvas(bitmap));
            assertTrue(bitmap.compress(Bitmap.CompressFormat.PNG, 100, file));
        } finally {
            bitmap.recycle();
        }
    }

    private TikTokPreferenceFragment search(String query) throws Exception {
        owner = Robolectric.buildActivity(Window.class).setup().visible();
        frameLifecycle =
                new android.app.FragmentManager.FragmentLifecycleCallbacks() {
                    @Override
                    public void onFragmentActivityCreated(
                            android.app.FragmentManager manager,
                            android.app.Fragment fragment,
                            Bundle state) {
                        if (!(fragment instanceof TikTokPreferenceFragment)
                                || fragment.getView() == null) return;
                        ListView list = fragment.getView().findViewById(android.R.id.list);
                        list.getViewTreeObserver()
                                .addOnPreDrawListener(
                                        new android.view.ViewTreeObserver.OnPreDrawListener() {
                                            @Override
                                            public boolean onPreDraw() {
                                                if (fragment.getView() != null
                                                        && fragment.getView().getAlpha() >= 0.99f
                                                        && Math.abs(
                                                                        fragment.getView()
                                                                                .getTranslationX())
                                                                < 1f)
                                                    observeHighlight(fragment.getView());
                                                if (sawHighlight || fragment.getView() == null) {
                                                    android.view.ViewTreeObserver observer =
                                                            list.getViewTreeObserver();
                                                    if (observer.isAlive())
                                                        observer.removeOnPreDrawListener(this);
                                                }
                                                return true;
                                            }
                                        });
                    }
                };
        owner.get().getFragmentManager().registerFragmentLifecycleCallbacks(frameLifecycle, false);
        TikTokPreferenceFragment fragment = new TikTokPreferenceFragment();
        Bundle arguments = new Bundle();
        arguments.putBoolean("morphe_settings_search", true);
        fragment.setArguments(arguments);
        owner.get()
                .getFragmentManager()
                .beginTransaction()
                .replace(android.R.id.content, fragment)
                .commit();
        settle();
        searchFor(fragment, query);
        return fragment;
    }

    private void searchFor(TikTokPreferenceFragment fragment, String query) throws Exception {
        input(fragment).setQuery(query);
        var method =
                TikTokPreferenceFragment.class.getDeclaredMethod(
                        "updateSearchResults", String.class);
        method.setAccessible(true);
        method.invoke(fragment, query);
        settle();
    }

    private static SettingsSearchInputPreference input(TikTokPreferenceFragment fragment)
            throws Exception {
        Field field = TikTokPreferenceFragment.class.getDeclaredField("searchInput");
        field.setAccessible(true);
        return (SettingsSearchInputPreference) field.get(fragment);
    }

    private TikTokPreferenceFragment page() {
        return (TikTokPreferenceFragment)
                owner.get().getFragmentManager().findFragmentById(android.R.id.content);
    }

    private static ListView list(TikTokPreferenceFragment fragment) {
        return fragment.getView().findViewById(android.R.id.list);
    }

    private View visible(ListView list, int position) {
        list.setSelectionFromTop(position, 0);
        settle();
        View row = list.getChildAt(position - list.getFirstVisiblePosition());
        assertNotNull(row);
        return row;
    }

    private void holdFirstSwitch(ListView list) {
        for (int i = 0; i < list.getChildCount(); i++) {
            int position = list.getFirstVisiblePosition() + i;
            if (list.getItemAtPosition(position) instanceof SearchTogglePreference) {
                hold(list, list.getChildAt(i), position);
                return;
            }
        }
        fail("no visible search switch");
    }

    private static void hold(ListView list, View row, int position) {
        assertNotNull("search has no item long-click route", list.getOnItemLongClickListener());
        assertTrue(
                list.getOnItemLongClickListener()
                        .onItemLongClick(list, row, position, list.getItemIdAtPosition(position)));
    }

    private Preference assertOrigin(TikTokPreferenceFragment search, String key) {
        assertSame("locating the setting replaced the main fragment", search, page());
        assertTrue(((SettingsMenuPreference) page().findPreference("section_privacy")).isExpanded());
        assertTrue(page().findPreference("action_search_settings") instanceof SettingsSearchEntryPreference);
        assertEquals(0, owner.get().getFragmentManager().getBackStackEntryCount());
        Preference original = page().findPreference(key);
        assertNotNull(original);
        assertTrue(original instanceof SwitchPreference);
        assertEquals(
                Settings.BLOCK_ADVERTISING_ID.savedValue(),
                ((SwitchPreference) original).isChecked());
        return original;
    }

    private static int position(ListView list, String key) {
        for (int i = 0; i < list.getCount(); i++) {
            Object item = list.getItemAtPosition(i);
            if (item instanceof Preference && key.equals(((Preference) item).getKey())) return i;
        }
        throw new AssertionError("missing result " + key);
    }

    private static int positionByTitle(ListView list, String title) {
        for (int i = 0; i < list.getCount(); i++) {
            Object item = list.getItemAtPosition(i);
            if (item instanceof Preference
                    && ((Preference) item).getTitle() != null
                    && title.contentEquals(((Preference) item).getTitle())) return i;
        }
        throw new AssertionError("missing result " + title);
    }

    private static Preference resultByTitle(TikTokPreferenceFragment page, String title) {
        for (int i = 0; i < page.getPreferenceScreen().getPreferenceCount(); i++) {
            Preference item = page.getPreferenceScreen().getPreference(i);
            if (item.getTitle() != null && title.contentEquals(item.getTitle())) return item;
        }
        throw new AssertionError("missing result " + title);
    }

    private static List<String> resultOrder(TikTokPreferenceFragment page) {
        List<String> result = new ArrayList<>();
        for (int i = 0; i < page.getPreferenceScreen().getPreferenceCount(); i++) {
            Preference row = page.getPreferenceScreen().getPreference(i);
            result.add(String.valueOf(row.getTitle()));
        }
        return result;
    }

    private void observeHighlight() {
        observeHighlight(owner.get().getWindow().getDecorView());
    }

    private void observeHighlight(View root) {
        if (root instanceof ListView) {
            ListView list = (ListView) root;
            for (int index = 0; index < list.getChildCount(); index++) {
                Object item = list.getItemAtPosition(list.getFirstVisiblePosition() + index);
                View row = list.getChildAt(index);
                if (!(item instanceof Preference)
                        || !Settings.BLOCK_ADVERTISING_ID.key.equals(((Preference) item).getKey())
                        || !hasOverlay(row)) continue;
                sawHighlight = true;
                observedList = list;
                Runnable frame = highlightFrame;
                highlightFrame = null;
                if (frame != null) frame.run();
                String image = highlightScreenshot;
                highlightScreenshot = null;
                if (image != null) {
                    try {
                        screenshot(image);
                    } catch (Exception failure) {
                        throw new AssertionError(failure);
                    }
                }
            }
            return;
        }
        if (root instanceof android.view.ViewGroup) {
            android.view.ViewGroup group = (android.view.ViewGroup) root;
            for (int i = 0; i < group.getChildCount(); i++) observeHighlight(group.getChildAt(i));
        }
    }

    private static boolean hasOverlay(View row) {
        return !((Boolean)
                org.robolectric.util.ReflectionHelpers.callInstanceMethod(
                        row.getOverlay(), "isEmpty"));
    }

    private static void assertAction(AccessibilityNodeInfo info, int id, String label) {
        for (AccessibilityNodeInfo.AccessibilityAction action : info.getActionList())
            if (action.getId() == id
                    && label.contentEquals(action.getLabel() == null ? "" : action.getLabel()))
                return;
        fail("missing labeled accessibility action " + label);
    }

    private void settle() {
        owner.get().getFragmentManager().executePendingTransactions();
        for (int i = 0; i < 3; i++) {
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            View decor = owner.get().getWindow().getDecorView();
            decor.measure(
                    View.MeasureSpec.makeMeasureSpec(360, View.MeasureSpec.EXACTLY),
                    View.MeasureSpec.makeMeasureSpec(640, View.MeasureSpec.EXACTLY));
            decor.layout(0, 0, 360, 640);
            decor.getViewTreeObserver().dispatchOnPreDraw();
            observeHighlight();
        }
        owner.windowFocusChanged(true);
    }
}
