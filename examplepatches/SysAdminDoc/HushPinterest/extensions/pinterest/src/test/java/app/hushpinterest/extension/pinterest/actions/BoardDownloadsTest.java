/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.actions;

import static org.junit.Assert.*;
import android.app.Activity;
import android.app.AlertDialog;
import android.app.DownloadManager;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Looper;
import android.view.View;
import android.widget.ListView;
import android.widget.ScrollView;
import android.widget.TextView;
import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;
import org.robolectric.shadow.api.Shadow;
import org.robolectric.shadows.ShadowActivity;
import org.robolectric.shadows.ShadowAlertDialog;
import org.robolectric.shadows.ShadowDownloadManager;
import org.robolectric.shadows.ShadowToast;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.EnumSet;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import app.hushpinterest.extension.pinterest.NativeDialogCapture;
import app.hushpinterest.extension.pinterest.settings.PatchFamily;
import app.hushpinterest.extension.pinterest.settings.PatchFamilyForTests;
import app.hushpinterest.extension.pinterest.settings.Settings;
import app.hushpinterest.extension.shared.SettingsContextRule;
import app.hushpinterest.extension.shared.Utils;
import app.hushpinterest.extension.shared.settings.HushPinterestPause;
import app.hushpinterest.extension.shared.settings.PauseForTests;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30, shadows = BoardDownloadsTest.Stubs.class,
        instrumentedPackages = "app.hushpinterest.extension.pinterest.actions")
public class BoardDownloadsTest {
    @Rule public final SettingsContextRule context = new SettingsContextRule();
    private Activity activity;

    /** Pinterest's option group as the stubs see it: its rows and the handler they're chosen through. */
    static final class Group {
        final List<?> items;
        final Object handler;

        Group(List<?> items, Object handler) {
            this.items = items;
            this.handler = handler;
        }
    }

    /** The board screen, counting the sheets it was asked to close. */
    static final class Screen {
        int dismissed;
    }

    /** What the patch writes into the stubs, for the classes above. */
    @Implements(value = BoardDownloads.class, isInAndroidSdk = false)
    public static class Stubs {
        @Implementation protected static List<?> menuItems(Object menu) { return ((Group) menu).items; }
        @Implementation protected static Object menuHandler(Object menu) { return ((Group) menu).handler; }
        @Implementation protected static Object menuCopy(Object menu, List<?> items, Object handler) { return new Group(items, handler); }
        @Implementation protected static Object menuRow(int title, int index, String text) { return Arrays.asList(title, index, text); }
        @Implementation protected static int title() { return 7; }
        @Implementation protected static String boardId(Object screen) { return "4242"; }
        @Implementation protected static void dismissMenu(Object screen) { ((Screen) screen).dismissed++; }
    }

    @Before public void prepare() {
        activity = Robolectric.buildActivity(Activity.class).setup().visible().get();
        Utils.setActivity(activity);
        PauseForTests.resume();
        PatchFamilyForTests.capabilities(EnumSet.of(PatchFamily.Capability.PIN_DOWNLOADS,
                PatchFamily.Capability.BOARD_MENU, PatchFamily.Capability.BOARD_PINS));
        Settings.DOWNLOAD_PINS.save(true);
        Settings.DOWNLOAD_BOARD.save(true);
        BoardDownloads.forget();
    }

    @After public void reset() {
        BoardDownloads.forget();
        Settings.DOWNLOAD_BOARD.save(false);
        Settings.DOWNLOAD_PINS.save(false);
        PatchFamilyForTests.capabilities(null);
        PauseForTests.resume();
        Utils.setActivity(null);
        RuntimeEnvironment.setFontScale(1f);
    }

    private static Map<String, Object> pin(String id, String board) {
        return Map.of("id", id, "images", Map.of("orig", Map.of("url", "https://i.pinimg.com/originals/" + id + ".jpg")),
                "board", Map.of("id", board));
    }

    private static List<Object> page(String board, int first, int count) {
        List<Object> pins = new ArrayList<>();
        for (int n = first; n < first + count; n++) pins.add(pin(String.valueOf(n), board));
        return pins;
    }

    private static List<Object> ids(List<Object> pins) {
        List<Object> ids = new ArrayList<>();
        for (Object pin : pins) ids.add(PinMedia.id(pin));
        return ids;
    }

    @Test public void aPageOfOneBoardIsKeptAndAFeedOfManyBoardsIsNot() {
        assertTrue(BoardDownloads.record(page("77", 100, 10)));
        assertEquals(10, BoardDownloads.loaded("77").size());

        List<Object> feed = new ArrayList<>();
        for (int n = 0; n < 10; n++) feed.add(pin(String.valueOf(500 + n), String.valueOf(10 + n % 5)));
        assertFalse("a home feed names no one board", BoardDownloads.record(feed));
        for (int board = 10; board < 15; board++) assertTrue(BoardDownloads.loaded(String.valueOf(board)).isEmpty());

        // Nine of ten naming board 77 is a page of it. Only those nine are kept.
        List<Object> mostly = page("77", 200, 9);
        mostly.add(pin("900", "88"));
        mostly.add("a story, not a pin");
        assertTrue(BoardDownloads.record(mostly));
        assertEquals(19, BoardDownloads.loaded("77").size());
        assertFalse(ids(BoardDownloads.loaded("77")).contains("900"));
        assertTrue(BoardDownloads.loaded("88").isEmpty());

        // A pin Pinterest loads again keeps its place.
        assertTrue(BoardDownloads.record(page("77", 100, 1)));
        assertEquals("100", PinMedia.id(BoardDownloads.loaded("77").get(0)));
        assertEquals(19, BoardDownloads.loaded("77").size());
    }

    @Test public void aBoardKeepsUpToItsLimitAndOnlyTheLastFewBoardsStay() {
        BoardDownloads.record(page("1", 0, BoardDownloads.PINS + 20));
        assertEquals(BoardDownloads.PINS, BoardDownloads.loaded("1").size());
        for (int board = 2; board <= BoardDownloads.BOARDS + 1; board++) BoardDownloads.record(page(String.valueOf(board), 10_000 * board, 3));
        assertTrue("the least recently used board goes first", BoardDownloads.loaded("1").isEmpty());
        for (int board = 2; board <= BoardDownloads.BOARDS + 1; board++) assertEquals(3, BoardDownloads.loaded(String.valueOf(board)).size());
    }

    /** A kept pin is its id and resolved media, never Pinterest's model, and a board batch still saves from it. */
    @Test public void keptPinsHoldOnlyTheirResolvedMediaAndStillDownload() throws Exception {
        List<Object> models = page("77", 100, 2);
        assertTrue(BoardDownloads.record(models));
        List<Object> kept = BoardDownloads.loaded("77");
        assertEquals(Arrays.asList("100", "101"), ids(kept));
        for (int i = 0; i < kept.size(); i++) {
            assertNotSame(models.get(i), kept.get(i));
            assertTrue(kept.get(i) instanceof PinMedia.Resolution);
            assertEquals("https://i.pinimg.com/originals/" + (100 + i) + ".jpg", PinMedia.source(kept.get(i)).url);
        }

        assertTrue(BoardDownloads.start("77"));
        settle();
        // The board asks which kind to queue, every pin to begin with.
        AlertDialog choice = ShadowAlertDialog.getLatestAlertDialog();
        assertEquals(0, choice.getListView().getCheckedItemPosition());
        choice.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
        settle();
        assertFalse(GridDownloads.running());
        ShadowDownloadManager downloads = Shadows.shadowOf((DownloadManager) activity.getSystemService(Context.DOWNLOAD_SERVICE));
        assertEquals(2, downloads.getRequestCount());
        for (long id = 0; id < 2; id++) {
            assertEquals("https://i.pinimg.com/originals/" + (100 + id) + ".jpg",
                    Shadow.<ShadowDownloadManager.ShadowRequest>extract(downloads.getRequest(id)).getUri().toString());
        }
    }

    private static void settle() throws Exception {
        for (int i = 0; i < 10; i++) {
            Utils.awaitBackgroundTasksForTests();
            Shadows.shadowOf(Looper.getMainLooper()).idle();
        }
    }

    private static Map<String, Object> video(String id, String file, String board) {
        return Map.of("id", id, "images", Map.of(), "board", Map.of("id", board),
                "videos", Map.of("video_list", Map.of("V_720P", Map.of("url", "https://v1.pinimg.com/videos/mc/" + file))));
    }

    /** What the board chooser offers, from the media each kept pin was resolved to. */
    private AlertDialog openChooser(List<Object> pins) throws Exception {
        assertTrue(BoardDownloads.record(pins));
        assertTrue(BoardDownloads.start("77"));
        settle();
        return ShadowAlertDialog.getLatestAlertDialog();
    }

    /**
     * Videos only: the image pins stay out, and Download history is read again on Queue pins, so a
     * video that finished while the choice was open is skipped rather than saved twice.
     */
    @Test public void theBoardOffersEachKindAndRereadsHistoryWhenItQueues() throws Exception {
        List<Object> pins = page("77", 100, 2);
        pins.add(video("102", "102.mp4", "77"));
        pins.add(video("103", "dash/103.mpd", "77"));
        AlertDialog choice = openChooser(pins);
        android.widget.ListView kinds = choice.getListView();
        assertEquals(Arrays.asList("All (4)\nUnsupported: 1", "Images (2)\nUnsupported: 0", "Videos (2)\nUnsupported: 1"),
                Arrays.asList(kinds.getAdapter().getItem(0).toString(), kinds.getAdapter().getItem(1).toString(),
                        kinds.getAdapter().getItem(2).toString()));
        assertEquals(0, kinds.getCheckedItemPosition());
        assertTrue(choice.getButton(AlertDialog.BUTTON_POSITIVE).isEnabled());
        kinds.performItemClick(kinds.getChildAt(2), 2, 2);
        assertEquals(2, kinds.getCheckedItemPosition());

        DownloadManager manager = (DownloadManager) activity.getSystemService(Context.DOWNLOAD_SERVICE);
        long finished = manager.enqueue(new DownloadManager.Request(android.net.Uri.parse("https://v1.pinimg.com/videos/mc/102.mp4")));
        assertTrue(DownloadLedger.record(activity, finished, "102"));
        choice.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
        settle();

        assertEquals("only the request made before Queue pins", 1, Shadows.shadowOf(manager).getRequestCount());
        String summary = Shadows.shadowOf(ShadowAlertDialog.getLatestAlertDialog()).getMessage().toString();
        assertTrue(summary, summary.contains("Unsupported: 1"));
        assertTrue(summary, summary.contains("Skipped because they're already in Download history: 1"));
        List<DownloadLedger.Job> history = new DownloadLedger(activity).reconcile();
        assertEquals(Arrays.asList("103", "102"), history.stream().map(job -> job.pinId).collect(java.util.stream.Collectors.toList()));
    }

    /** With every loaded pin already in Download history there's nothing to queue, but Save list still works. */
    @Test public void aBoardWithNothingNewStillOffersSaveList() throws Exception {
        DownloadManager manager = (DownloadManager) activity.getSystemService(Context.DOWNLOAD_SERVICE);
        for (String id : new String[]{"100", "101"}) {
            long job = manager.enqueue(new DownloadManager.Request(Uri.parse("https://i.pinimg.com/originals/" + id + ".jpg")));
            assertTrue(DownloadLedger.record(activity, job, id));
        }
        AlertDialog choice = openChooser(page("77", 100, 2));
        assertNotNull("the chooser opens even with nothing new", choice);
        assertTrue(choice.isShowing());
        assertEquals("All (0)\nUnsupported: 0", choice.getListView().getAdapter().getItem(0).toString());
        assertFalse(choice.getButton(AlertDialog.BUTTON_POSITIVE).isEnabled());
        assertTrue(choice.getButton(AlertDialog.BUTTON_NEUTRAL).isEnabled());
        assertEquals(2, BoardDownloads.listed("77", GridDownloads.Filter.ALL).size());
        assertEquals("nothing queued", 2, Shadows.shadowOf(manager).getRequestCount());
    }

    /** A kind whose new pins are all streamed-only keeps Queue pins off, Save list on, and a tap that gets there queues nothing. */
    @Test public void aKindWithNothingThatCanBeSavedKeepsQueueOff() throws Exception {
        List<Object> pins = page("77", 100, 1);
        pins.add(video("102", "dash/102.mpd", "77"));
        pins.add(video("103", "dash/103.mpd", "77"));
        AlertDialog choice = openChooser(pins);
        android.widget.ListView kinds = choice.getListView();
        assertEquals("Videos (2)\nUnsupported: 2", kinds.getAdapter().getItem(2).toString());
        assertTrue("the image under All can be saved", choice.getButton(AlertDialog.BUTTON_POSITIVE).isEnabled());

        kinds.performItemClick(kinds.getChildAt(2), 2, 2);
        assertFalse(choice.getButton(AlertDialog.BUTTON_POSITIVE).isEnabled());
        assertTrue(choice.getButton(AlertDialog.BUTTON_NEUTRAL).isEnabled());
        kinds.performItemClick(kinds.getChildAt(1), 1, 1);
        assertTrue(choice.getButton(AlertDialog.BUTTON_POSITIVE).isEnabled());
        kinds.performItemClick(kinds.getChildAt(2), 2, 2);
        assertFalse(choice.getButton(AlertDialog.BUTTON_POSITIVE).isEnabled());

        assertTrue(choice.getButton(AlertDialog.BUTTON_POSITIVE).callOnClick());
        settle();
        assertSame("no batch started", choice, ShadowAlertDialog.getLatestAlertDialog());
        assertFalse(GridDownloads.running());
        DownloadManager manager = (DownloadManager) activity.getSystemService(Context.DOWNLOAD_SERVICE);
        assertEquals(0, Shadows.shadowOf(manager).getRequestCount());
        assertTrue(new DownloadLedger(activity).reconcile().isEmpty());
    }

    /** A board of only streamed-only videos opens with Queue pins off and Save list on. */
    @Test public void aBoardOfOnlyStreamedVideosOpensWithQueueOff() throws Exception {
        List<Object> pins = new ArrayList<>();
        pins.add(video("102", "dash/102.mpd", "77"));
        pins.add(video("103", "dash/103.mpd", "77"));
        AlertDialog choice = openChooser(pins);
        assertEquals("All (2)\nUnsupported: 2", choice.getListView().getAdapter().getItem(0).toString());
        assertFalse(choice.getButton(AlertDialog.BUTTON_POSITIVE).isEnabled());
        assertTrue(choice.getButton(AlertDialog.BUTTON_NEUTRAL).isEnabled());
        assertTrue(choice.getButton(AlertDialog.BUTTON_POSITIVE).callOnClick());
        settle();
        assertSame("no batch started", choice, ShadowAlertDialog.getLatestAlertDialog());
        assertEquals(0, Shadows.shadowOf((DownloadManager) activity.getSystemService(Context.DOWNLOAD_SERVICE)).getRequestCount());
        assertTrue(new DownloadLedger(activity).reconcile().isEmpty());
    }

    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Config(qualifiers = "en-rUS-w390dp-h844dp-night-xhdpi")
    public void theBoardExplanationKeepsTheChoicesAndActionsReachableAtTwiceTheTextSize() throws Exception {
        RuntimeEnvironment.setFontScale(2f);
        assertEquals(2f, activity.getResources().getConfiguration().fontScale, 0f);
        DownloadManager manager = (DownloadManager) activity.getSystemService(Context.DOWNLOAD_SERVICE);
        for (String id : new String[]{"100", "101"}) {
            long job = manager.enqueue(new DownloadManager.Request(Uri.parse("https://i.pinimg.com/originals/" + id + ".jpg")));
            assertTrue(DownloadLedger.record(activity, job, id));
        }
        AlertDialog choice = openChooser(page("77", 100, 2));
        NativeDialogCapture.capture("board-picker-known-large-text", activity.findViewById(android.R.id.content), choice);
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        View decor = choice.getWindow().getDecorView();
        ListView kinds = choice.getListView();
        assertEquals(ListView.CHOICE_MODE_SINGLE, kinds.getChoiceMode());
        assertEquals(0, kinds.getCheckedItemPosition());
        assertEquals(3, kinds.getCount());
        assertTrue("the explanation left no room for the choices", kinds.getHeight() > 0);
        int[] at = new int[2];
        for (int which : new int[]{AlertDialog.BUTTON_POSITIVE, AlertDialog.BUTTON_NEUTRAL, AlertDialog.BUTTON_NEGATIVE}) {
            View button = choice.getButton(which);
            button.getLocationInWindow(at);
            assertTrue(button + " has no height", button.getHeight() > 0);
            assertTrue(button + " is below the dialog", at[1] + button.getHeight() <= decor.getHeight());
            android.graphics.Rect shown = new android.graphics.Rect();
            assertTrue(button + " isn't visible", button.getGlobalVisibleRect(shown));
            assertEquals(button + " is clipped", button.getHeight(), shown.height());
        }
        TextView explanation = visibleMessage(decor);
        assertNotNull(explanation);
        assertTrue(explanation.getText().toString().contains("Every pin loaded from this board is already in Download history."));
        assertTrue(explanation.getText().toString().contains("To include more, scroll further down the board first."));
        assertFalse(choice.getButton(AlertDialog.BUTTON_POSITIVE).isEnabled());
        assertTrue(choice.getButton(AlertDialog.BUTTON_NEUTRAL).isEnabled());
        kinds.performItemClick(kinds.getAdapter().getView(2, null, kinds), 2, kinds.getItemIdAtPosition(2));
        assertEquals(2, kinds.getCheckedItemPosition());
        assertFalse(choice.getButton(AlertDialog.BUTTON_NEUTRAL).isEnabled());
        assertEquals("reading and selecting must not queue", 2, Shadows.shadowOf(manager).getRequestCount());
    }

    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Config(qualifiers = "en-rUS-w640dp-h360dp-land-night-xhdpi")
    public void aShortLandscapeBoardChooserScrollsItsFullExplanationAndEveryKindAtTwiceTheTextSize() throws Exception {
        RuntimeEnvironment.setFontScale(2f);
        assertEquals(2f, activity.getResources().getConfiguration().fontScale, 0f);
        assertEquals(1280, activity.getResources().getDisplayMetrics().widthPixels);
        assertEquals(720, activity.getResources().getDisplayMetrics().heightPixels);
        DownloadManager manager = (DownloadManager) activity.getSystemService(Context.DOWNLOAD_SERVICE);
        for (String id : new String[]{"100", "101"}) {
            long job = manager.enqueue(new DownloadManager.Request(Uri.parse("https://i.pinimg.com/originals/" + id + ".jpg")));
            assertTrue(DownloadLedger.record(activity, job, id));
        }
        AlertDialog choice = openChooser(Arrays.asList(pin("100", "77"), video("101", "101.mp4", "77")));
        View decor = choice.getWindow().getDecorView();
        layoutInCurrentViewport(choice);
        NativeDialogCapture.assertReadable(decor);
        ListView kinds = choice.getListView();
        assertEquals(ListView.CHOICE_MODE_SINGLE, kinds.getChoiceMode());
        assertEquals(0, kinds.getCheckedItemPosition());
        assertEquals(3, kinds.getCount());
        assertTrue("the header starved the native choice list", kinds.getHeight() > 0);
        for (int which : new int[]{AlertDialog.BUTTON_POSITIVE, AlertDialog.BUTTON_NEUTRAL, AlertDialog.BUTTON_NEGATIVE}) {
            assertWholeInWindow(choice.getButton(which));
        }

        TextView explanation = visibleMessage(decor);
        assertNotNull(explanation);
        assertTrue(explanation.getText().toString().contains("Every pin loaded from this board is already in Download history."));
        assertTrue(explanation.getText().toString().endsWith("To include more, scroll further down the board first."));
        View ancestor = explanation;
        while (ancestor.getParent() instanceof View && !(ancestor instanceof ScrollView)) ancestor = (View) ancestor.getParent();
        assertTrue("the full explanation has no scrolling viewport", ancestor instanceof ScrollView);
        ScrollView guidance = (ScrollView) ancestor;
        assertTrue("the short window didn't exercise overflow", guidance.getChildAt(0).getHeight() > guidance.getHeight());
        for (int line = 0; line < explanation.getLineCount(); line++) {
            android.graphics.Rect wanted = new android.graphics.Rect();
            explanation.getLayout().getLineBounds(line, wanted);
            wanted.offset(explanation.getCompoundPaddingLeft(), explanation.getCompoundPaddingTop());
            android.view.ViewGroup content = (android.view.ViewGroup) guidance.getChildAt(0);
            content.offsetDescendantRectToMyCoords(explanation, wanted);
            guidance.requestChildRectangleOnScreen(content, wanted, true);
            int[] textAt = new int[2], viewportAt = new int[2];
            explanation.getLocationInWindow(textAt);
            guidance.getLocationInWindow(viewportAt);
            int top = textAt[1] + explanation.getCompoundPaddingTop() + explanation.getLayout().getLineTop(line);
            int bottom = textAt[1] + explanation.getCompoundPaddingTop() + explanation.getLayout().getLineBottom(line);
            assertTrue("explanation line " + line + " can't scroll into view", top >= viewportAt[1]
                    && bottom <= viewportAt[1] + guidance.getHeight());
        }
        assertTrue("the explanation never scrolled", guidance.getScrollY() > 0);

        for (int position = 0; position < kinds.getCount(); position++) {
            kinds.setSelection(position);
            layoutInCurrentViewport(choice);
            View row = kinds.getChildAt(position - kinds.getFirstVisiblePosition());
            assertNotNull("kind " + position + " can't be reached by scrolling", row);
            assertWholeInWindow(row);
            assertTrue(kinds.performItemClick(row, position, kinds.getItemIdAtPosition(position)));
            assertEquals(position, kinds.getCheckedItemPosition());
            assertFalse("known pins became queueable", choice.getButton(AlertDialog.BUTTON_POSITIVE).isEnabled());
            assertTrue("a loaded kind lost Save list", choice.getButton(AlertDialog.BUTTON_NEUTRAL).isEnabled());
        }
        assertEquals("reading and selecting queued a request", 2, Shadows.shadowOf(manager).getRequestCount());
        assertEquals(Arrays.asList("100", "101"), ids(BoardDownloads.loaded("77")));
        assertEquals(java.util.Set.of("100", "101"), DownloadLedger.downloadedPinIds(activity));
        assertTrue(Settings.DOWNLOAD_PINS.get());
        assertTrue(Settings.DOWNLOAD_BOARD.get());
        assertFalse(GridDownloads.running());
    }

    /** Use this test's real landscape viewport, not the portrait capture helper's fixed canvas. */
    private void layoutInCurrentViewport(AlertDialog dialog) {
        android.util.DisplayMetrics metrics = activity.getResources().getDisplayMetrics();
        View decor = dialog.getWindow().getDecorView();
        int width = Math.min(metrics.widthPixels, dialog.getWindow().getAttributes().width);
        for (int pass = 0; pass < 2; pass++) {
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            decor.measure(View.MeasureSpec.makeMeasureSpec(width, View.MeasureSpec.EXACTLY),
                    View.MeasureSpec.makeMeasureSpec(metrics.heightPixels, View.MeasureSpec.AT_MOST));
            decor.layout(0, 0, decor.getMeasuredWidth(), decor.getMeasuredHeight());
        }
        assertTrue("dialog exceeds the short viewport", decor.getHeight() <= metrics.heightPixels);
    }

    private static void assertWholeInWindow(View view) {
        android.graphics.Rect shown = new android.graphics.Rect();
        assertTrue(view + " has no height", view.getHeight() > 0);
        assertTrue(view + " is outside the dialog", view.getGlobalVisibleRect(shown));
        assertEquals(view + " is clipped vertically", view.getHeight(), shown.height());
        assertEquals(view + " is clipped horizontally", view.getWidth(), shown.width());
    }

    private static TextView visibleMessage(View view) {
        if (view.getVisibility() != View.VISIBLE) return null;
        if (view instanceof TextView && view.getId() == android.R.id.message) return (TextView) view;
        if (view instanceof android.view.ViewGroup) {
            android.view.ViewGroup group = (android.view.ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                TextView found = visibleMessage(group.getChildAt(i));
                if (found != null) return found;
            }
        }
        return null;
    }

    @Test public void aKindWithNoNewPinsCantBeQueued() throws Exception {
        AlertDialog choice = openChooser(page("77", 100, 2));
        android.widget.ListView kinds = choice.getListView();
        assertEquals("Videos (0)\nUnsupported: 0", kinds.getAdapter().getItem(2).toString());
        kinds.performItemClick(kinds.getChildAt(2), 2, 2);
        assertFalse(choice.getButton(AlertDialog.BUTTON_POSITIVE).isEnabled());
        assertFalse("no video loaded, so there's no list of them", choice.getButton(AlertDialog.BUTTON_NEUTRAL).isEnabled());
        kinds.performItemClick(kinds.getChildAt(1), 1, 1);
        assertTrue(choice.getButton(AlertDialog.BUTTON_POSITIVE).isEnabled());
        assertTrue(choice.getButton(AlertDialog.BUTTON_NEUTRAL).isEnabled());
    }

    /**
     * Save list names every loaded pin of the kind chosen, Download history's too, with the title
     * and checked link each carried when it loaded, and downloads nothing.
     */
    @Test public void saveListHasTheKindsLoadedPinsAsTheyWereWhenTheyLoaded() throws Exception {
        PinListProvider.install();
        Map<String, Object> titled = new HashMap<>(pin("100", "77"));
        titled.put("title", "Rye bread");
        titled.put("link", "https://example.com/rye");
        List<Object> pins = new ArrayList<>(Arrays.asList(titled, pin("101", "77"), video("102", "102.mp4", "77")));
        DownloadManager manager = (DownloadManager) activity.getSystemService(Context.DOWNLOAD_SERVICE);
        long saved = manager.enqueue(new DownloadManager.Request(Uri.parse("https://i.pinimg.com/originals/101.jpg")));
        assertTrue(DownloadLedger.record(activity, saved, "101"));
        AlertDialog choice = openChooser(pins);
        titled.put("title", "Changed after it loaded");
        android.widget.ListView kinds = choice.getListView();
        kinds.performItemClick(kinds.getChildAt(1), 1, 1);
        choice.getButton(AlertDialog.BUTTON_NEUTRAL).performClick();
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        // Save list asks for the kind of file first. This list is the JSON one.
        int json = PinManifest.Format.JSON.ordinal();
        android.widget.ListView formats = ShadowAlertDialog.getLatestAlertDialog().getListView();
        formats.performItemClick(formats.getChildAt(json), json, json);
        Shadows.shadowOf(Looper.getMainLooper()).idle();

        ShadowActivity.IntentForResult started = Shadows.shadowOf(activity).getNextStartedActivityForResult();
        assertEquals(Intent.ACTION_CREATE_DOCUMENT, started.intent.getAction());
        Uri file = PinListProvider.put("board.json", null);
        Shadows.shadowOf(activity).receiveResult(started.intent, Activity.RESULT_OK, new Intent().setData(file));
        PinManifest.awaitFileWorkForTests();
        settle();
        assertEquals("Saved a list of 2 pins.", ShadowToast.getTextOfLatestToast());
        JSONObject list = new JSONObject(new String(PinListProvider.get(file), StandardCharsets.UTF_8));
        assertEquals("board_loaded_pins", list.getString("scope"));
        JSONArray listed = list.getJSONArray("pins");
        assertEquals(2, listed.length());
        assertEquals("100", listed.getJSONObject(0).getString("id"));
        assertEquals("Rye bread", listed.getJSONObject(0).getString("title"));
        assertEquals("https://example.com/rye", listed.getJSONObject(0).getString("source_link"));
        assertEquals("101", listed.getJSONObject(1).getString("id"));
        assertEquals("missing", listed.getJSONObject(1).getString("source_link_status"));
        assertEquals("only the request made before Save list", 1, Shadows.shadowOf(manager).getRequestCount());
    }

    /** Switched off while the choice is open, the board forgets its pins and Queue pins says why nothing starts. */
    @Test public void queueingAfterTheSwitchWentOffStartsNothing() throws Exception {
        AlertDialog choice = openChooser(page("77", 100, 2));
        Settings.DOWNLOAD_BOARD.save(false);
        BoardDownloads.record(page("77", 200, 2));
        choice.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
        settle();
        assertEquals("Resume HushPinterest, turn on Download pins and Download board.",
                ShadowToast.getTextOfLatestToast());
        assertEquals(0, Shadows.shadowOf((DownloadManager) activity.getSystemService(Context.DOWNLOAD_SERVICE)).getRequestCount());
        assertFalse(GridDownloads.running());
    }

    @Test public void switchedOffOrPausedItKeepsNothingAndForgetsWhatItHad() {
        BoardDownloads.record(page("77", 100, 5));
        Settings.DOWNLOAD_BOARD.save(false);
        assertFalse(BoardDownloads.record(page("77", 200, 5)));
        assertTrue(BoardDownloads.loaded("77").isEmpty());

        Settings.DOWNLOAD_BOARD.save(true);
        BoardDownloads.record(page("77", 100, 5));
        PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
        assertFalse(BoardDownloads.record(page("77", 200, 5)));
        assertTrue(BoardDownloads.loaded("77").isEmpty());

        // Download pins off doesn't stop the keeping: its switch is this one.
        PauseForTests.resume();
        Settings.DOWNLOAD_PINS.save(false);
        assertTrue(BoardDownloads.record(page("77", 100, 5)));
    }

    @Test public void theMenuGainsOneRowAtAnIndexPinterestDoesNotUse() throws Exception {
        List<Object> chosen = new ArrayList<>();
        Group menu = new Group(Arrays.asList("edit", "share"), function(chosen));
        Screen screen = new Screen();
        Object answered = BoardDownloads.menu(menu, screen);
        assertNotSame(menu, answered);
        Group copy = (Group) answered;
        assertEquals(Arrays.asList("edit", "share", Arrays.asList(7, 2, "Download board")), copy.items);

        // Pinterest's rows still reach Pinterest's handler, with what it answers.
        assertEquals("pinterest answered 1", invoke(copy.handler, 1));
        assertEquals(Arrays.asList(1), chosen);

        // The new row closes the sheet and doesn't reach Pinterest. Nothing loaded yet, so it says so.
        invoke(copy.handler, 2);
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        assertEquals(Arrays.asList(1), chosen);
        assertEquals(1, screen.dismissed);
        assertEquals("This board's pins haven't loaded yet. Scroll it and try again.",
                ShadowToast.getTextOfLatestToast());
    }

    @Test public void theMenuStaysPinterestsWhenOffPausedOrWithoutDownloadPins() throws Exception {
        Group menu = new Group(Arrays.asList("edit"), function(new ArrayList<>()));
        Screen screen = new Screen();
        Settings.DOWNLOAD_BOARD.save(false);
        assertSame(menu, BoardDownloads.menu(menu, screen));
        Settings.DOWNLOAD_BOARD.save(true);
        Settings.DOWNLOAD_PINS.save(false);
        assertSame("every pin goes through Download pins", menu, BoardDownloads.menu(menu, screen));
        Settings.DOWNLOAD_PINS.save(true);
        PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
        assertSame(menu, BoardDownloads.menu(menu, screen));
        PauseForTests.resume();
        PatchFamilyForTests.capabilities(EnumSet.of(PatchFamily.Capability.PIN_DOWNLOADS, PatchFamily.Capability.BOARD_PINS));
        assertSame("a build without the menu hook", menu, BoardDownloads.menu(menu, screen));
        assertEquals(0, screen.dismissed);
    }

    /** A Kotlin Function1 like Pinterest's row handler: it notes the index and answers. */
    private static Object function(List<Object> chosen) throws Exception {
        Class<?> face = Class.forName("kotlin.jvm.functions.Function1");
        return Proxy.newProxyInstance(face.getClassLoader(), new Class<?>[]{face}, (proxy, method, args) -> {
            if (method.getName().equals("invoke")) {
                chosen.add(args[0]);
                return "pinterest answered " + args[0];
            }
            if (method.getName().equals("equals")) return proxy == args[0];
            if (method.getName().equals("hashCode")) return System.identityHashCode(proxy);
            return "handler";
        });
    }

    private static Object invoke(Object handler, int index) throws Exception {
        Method invoke = Class.forName("kotlin.jvm.functions.Function1").getMethod("invoke", Object.class);
        return invoke.invoke(handler, index);
    }
}
