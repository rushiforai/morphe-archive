import java.util.Arrays;
import java.util.List;
import java.util.Objects;
import android.app.AlertDialog;
import android.content.ClipboardManager;
import android.view.MotionEvent;
import android.view.View;
import app.afterglow.extension.Afterglow;
import app.afterglow.extension.InstalledTweaks;
import app.afterglow.extension.litho.LithoContext;
import app.afterglow.extension.menus.LongPressTextHost;
import app.afterglow.extension.menus.LongPressTextTools;
import app.afterglow.extension.settings.LiteMode;

public final class LongPressTextToolsTest {
    private static int checks;
    private static final MotionEvent DOWN = new MotionEvent(MotionEvent.ACTION_DOWN);
    private static final String TITLE = "Watch page title for native long press tests";
    private static final String DESCRIPTION = "Native description text\nwith its second line";
    private static void check(String name, Object expected, Object actual) {
        checks++;
        if (!Objects.equals(expected, actual)) throw new AssertionError(name + ": " + actual);
    }
    private static final class Host extends View implements LongPressTextHost {
        List<CharSequence> items;
        Host(String text, boolean clickable) { items = Arrays.asList(text); this.clickable = clickable; }
        @Override public List<CharSequence> afterglow_textItems() { return items; }
        @Override public View.OnLongClickListener afterglow_longPressListener() { return listener; }
    }
    private static final class Context implements LithoContext {
        final String id, path;
        Context(String id, String path) { this.id = id; this.path = path; }
        @Override public String afterglow_getIdentifier() { return id; }
        @Override public StringBuilder afterglow_getPathBuilder() { return new StringBuilder(path); }
        @Override public Integer afterglow_getHeightConstraint() { return null; }
        @Override public Object afterglow_getSwipeProtector() { return null; }
    }
    public static void main(String[] args) {
        Context titleContext = new Context("video_metadata.eml", "video_metadata_inner.eml|TextType|");
        Context descriptionContext = new Context("description_rich_text_list.eml", "TextType|");
        // Observation while OFF permits live ON without requiring the native text to be regenerated.
        LongPressTextTools.onText(titleContext, TITLE);
        LongPressTextTools.onText(descriptionContext, DESCRIPTION);
        Host title = new Host(TITLE, true);
        LongPressTextTools.touch(title, DOWN);
        check("default OFF preserves native view", false, title.isLongClickable());
        LiteMode.videoInfo = true;
        InstalledTweaks.installed = false;
        LongPressTextTools.touch(title, DOWN);
        check("absent owner", false, title.isLongClickable());
        InstalledTweaks.installed = true;
        LongPressTextTools.touch(title, new MotionEvent(MotionEvent.ACTION_MOVE));
        check("move does not bind", false, title.isLongClickable());
        LongPressTextTools.touch(title, DOWN);
        check("live ON binds existing title", true, title.isLongClickable());
        check("title long press handled", true, title.performLongClick());
        check("title copied", TITLE, ClipboardManager.text);
        int writes = ClipboardManager.writes;
        LiteMode.videoInfo = false;
        check("live OFF between touch and long press", false, title.performLongClick());
        check("live OFF preserves clipboard", writes, ClipboardManager.writes);
        LongPressTextTools.touch(title, DOWN);
        check("OFF removes owned listener", null, title.listener);
        check("OFF restores native long-click flag", false, title.isLongClickable());
        LiteMode.videoInfo = true;
        LongPressTextTools.touch(title, DOWN);
        View.OnLongClickListener nativeListener = v -> true;
        title.setOnLongClickListener(nativeListener);
        LongPressTextTools.touch(title, DOWN);
        check("new native listener survives cleanup", nativeListener, title.listener);
        title.setLongClickable(false);
        LongPressTextTools.touch(title, DOWN);
        check("disabled native listener is not overwritten", nativeListener, title.listener);
        check("native disabled long-click flag is preserved", false, title.isLongClickable());
        title.setLongClickable(true);
        check("native listener remains reusable without reinstalling", true, title.performLongClick());
        check("re-enabled native listener does not copy Afterglow text", writes, ClipboardManager.writes);

        Host parent = new Host("", true), child = new Host(TITLE, false);
        child.parent = parent;
        LongPressTextTools.touch(parent, DOWN);
        LongPressTextTools.touch(child, DOWN);
        check("native clickable ancestor is bound", true, parent.isLongClickable());
        child.items = Arrays.asList("Recycled unrelated content");
        check("recycling during gesture rejects old title", false, parent.performLongClick());
        check("recycling preserves clipboard", writes, ClipboardManager.writes);
        LongPressTextTools.touch(parent, DOWN);
        check("new gesture removes stale parent listener", null, parent.listener);
        child.items = Arrays.asList(TITLE);
        LongPressTextTools.touch(child, DOWN);
        child.attached = false;
        check("detached host rejected", false, parent.performLongClick());
        child.attached = true;
        child.shown = false;
        check("hidden host rejected", false, parent.performLongClick());

        String common = "A long shared introduction for native video ";
        LongPressTextTools.onText(titleContext, common + "A");
        Host changedTitle = new Host(common + "A", true);
        LongPressTextTools.touch(changedTitle, DOWN);
        changedTitle.items = Arrays.asList(common + "B");
        check("changed common-prefix title rejects captured text", false, changedTitle.performLongClick());
        check("changed common-prefix title preserves clipboard", writes, ClipboardManager.writes);
        LongPressTextTools.onText(descriptionContext, common + "description A");
        Host changedDescription = new Host(common + "description A", false);
        LongPressTextTools.touch(changedDescription, DOWN);
        changedDescription.items = Arrays.asList(common + "description B");
        check("changed common-prefix description rejects captured text", false, changedDescription.performLongClick());
        LongPressTextTools.touch(changedDescription, DOWN);
        check("new common-prefix description does not bind stale text", null, changedDescription.listener);

        Host description = new Host(DESCRIPTION, false);
        LongPressTextTools.touch(description, DOWN);
        check("nonclickable description can long press", true, description.isLongClickable());
        check("description opens", true, description.performLongClick());
        check("description text remains complete", DESCRIPTION, AlertDialog.last.message);
        check("description is selectable", true, AlertDialog.last.textView.selectable);
        check("opening does not copy", writes, ClipboardManager.writes);
        check("Cancel has no copy action", null, AlertDialog.last.negative);
        AlertDialog.last.positive.onClick(AlertDialog.last, 1);
        check("Copy uses observed segment", DESCRIPTION, ClipboardManager.text);
        writes = ClipboardManager.writes;
        LiteMode.videoInfo = false;
        AlertDialog.last.positive.onClick(AlertDialog.last, 1);
        check("dialog Copy rechecks live setting", writes, ClipboardManager.writes);
        check("no errors", 0, Afterglow.errors);
        System.out.println(checks + " native text-copy gesture checks passed");
    }
}
