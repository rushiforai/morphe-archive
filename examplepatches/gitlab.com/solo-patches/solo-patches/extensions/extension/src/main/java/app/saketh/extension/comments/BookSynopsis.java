package app.saketh.extension.comments;

import android.app.Activity;
import android.app.AlertDialog;
import android.view.GestureDetector;
import android.view.MotionEvent;
import android.view.View;
import android.widget.TextView;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import org.json.JSONObject;

/**
 * Book details are a Flutter screen, so its synopsis cannot be selected. Flutter fetches the
 * details through WebNovel's native HTTP bridge; this keeps the synopses seen there and shows the
 * one for the open book in a selectable dialog when the reader long-presses the screen.
 */
public final class BookSynopsis {
    private static final int KEPT = 30;
    // Book id -> {book name, synopsis}, oldest dropped first.
    private static final Map<String, String[]> BOOKS = new LinkedHashMap<String, String[]>() {
        @Override protected boolean removeEldestEntry(Map.Entry<String, String[]> eldest) {
            return size() > KEPT;
        }
    };
    // The last book details response, whose Data object is the book itself, and the Flutter page
    // that was in front when it arrived.
    private static String latest = "";
    private static WeakReference<Activity> latestPage = new WeakReference<>(null);
    private static WeakReference<Activity> front = new WeakReference<>(null);

    private BookSynopsis() {}

    /** Called when a Flutter page comes to the front. */
    public static void resumed(Activity activity) {
        synchronized (BOOKS) {
            front = new WeakReference<>(activity);
        }
    }

    /** Called with every successful response of the native HTTP bridge. */
    public static void seen(JSONObject response) {
        try {
            collect(response, 0);
        } catch (RuntimeException ignored) {
            // Only reading a response; never disturb its delivery to Flutter.
        }
    }

    private static void collect(JSONObject object, int depth) {
        String id = field(object, "bookId");
        String synopsis = field(object, "description");
        if (!id.isEmpty() && !synopsis.isEmpty()) {
            synchronized (BOOKS) {
                BOOKS.put(id, new String[]{field(object, "bookName"), synopsis});
                if (depth == 1) {
                    latest = id;
                    latestPage = front;
                }
            }
            return;
        }
        if (depth == 3) return;
        for (Iterator<String> keys = object.keys(); keys.hasNext(); ) {
            Object child = object.opt(keys.next());
            if (child instanceof JSONObject) collect((JSONObject) child, depth + 1);
        }
    }

    /** Value of a key matched without case, or "" when absent. */
    private static String field(JSONObject object, String name) {
        for (Iterator<String> keys = object.keys(); keys.hasNext(); ) {
            String key = keys.next();
            if (key.equalsIgnoreCase(name)) {
                Object value = object.opt(key);
                return value instanceof String || value instanceof Number ? value.toString().trim() : "";
            }
        }
        return "";
    }

    // True from a long press that opened the synopsis until that finger lifts.
    private static boolean swallowing;

    /**
     * Called from every Flutter page's dispatchTouchEvent; watches for a long press. Returns true
     * when the event must not reach Flutter: after the synopsis opens, Flutter gets a cancel and
     * none of the rest of that touch, so the long press does not also tap what was under the finger.
     */
    public static boolean touch(Activity activity, MotionEvent event) {
        View decor = activity.getWindow().getDecorView();
        if (!(decor.getTag() instanceof GestureDetector)) {
            decor.setTag(new GestureDetector(activity, new GestureDetector.SimpleOnGestureListener() {
                @Override public void onLongPress(MotionEvent press) {
                    if (!show(activity)) return;
                    MotionEvent cancel = MotionEvent.obtain(press);
                    cancel.setAction(MotionEvent.ACTION_CANCEL);
                    activity.getWindow().superDispatchTouchEvent(cancel);
                    cancel.recycle();
                    swallowing = true;
                }
            }));
        }
        int action = event.getActionMasked();
        if (action == MotionEvent.ACTION_DOWN) swallowing = false;
        ((GestureDetector) decor.getTag()).onTouchEvent(event);
        if (!swallowing) return false;
        if (action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL) swallowing = false;
        return true;
    }

    private static boolean show(Activity activity) {
        String[] book = bookOnScreen(activity);
        if (book == null) return false;
        String synopsis = book[1];
        AlertDialog dialog = new AlertDialog.Builder(activity)
                .setTitle(book[0].isEmpty() ? "Synopsis" : book[0])
                .setMessage(synopsis)
                .setPositiveButton("Copy", (shown, which) -> CommentActions.copy(activity, synopsis))
                .setNeutralButton("Translate", (shown, which) -> CommentActions.translate(activity, synopsis))
                .setNegativeButton("Close", null)
                .show();
        TextView message = dialog.findViewById(android.R.id.message);
        if (message != null) message.setTextIsSelectable(true);
        return true;
    }

    /**
     * A book details page opened from native screens is its own Flutter page whose route carries
     * the book id. One opened from another Flutter page, such as search, is pushed inside that
     * page, so it is the book whose details that page fetched last.
     */
    private static String[] bookOnScreen(Activity activity) {
        ArrayList<String> arguments = activity.getIntent().getStringArrayListExtra("dart_entrypoint_args");
        String route = arguments == null || arguments.isEmpty() || arguments.get(0) == null ? "" : arguments.get(0);
        synchronized (BOOKS) {
            for (Map.Entry<String, String[]> book : BOOKS.entrySet()) {
                if (!route.isEmpty() && route.contains(book.getKey())) return book.getValue();
            }
            // ponytail: after going back from those details to the page that opened them, a long
            // press there still shows them; tracking Flutter's own route stack would fix it.
            return latestPage.get() == activity ? BOOKS.get(latest) : null;
        }
    }
}
