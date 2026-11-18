package app.saketh.extension.comments;

import android.app.Activity;
import android.app.AlertDialog;
import android.view.GestureDetector;
import android.view.MotionEvent;
import android.view.View;
import android.widget.TextView;
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

    private BookSynopsis() {}

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

    /** Called from every Flutter page's dispatchTouchEvent; watches for a long press. */
    public static void touch(Activity activity, MotionEvent event) {
        View decor = activity.getWindow().getDecorView();
        if (!(decor.getTag() instanceof GestureDetector)) {
            decor.setTag(new GestureDetector(activity, new GestureDetector.SimpleOnGestureListener() {
                @Override public void onLongPress(MotionEvent press) {
                    show(activity);
                }
            }));
        }
        ((GestureDetector) decor.getTag()).onTouchEvent(event);
    }

    private static void show(Activity activity) {
        String[] book = bookOnScreen(activity);
        if (book == null) return;
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
    }

    /** The Flutter page's route carries the book id of a book details page. */
    private static String[] bookOnScreen(Activity activity) {
        ArrayList<String> arguments = activity.getIntent().getStringArrayListExtra("dart_entrypoint_args");
        String route = arguments == null || arguments.isEmpty() ? "" : arguments.get(0);
        if (route == null || route.isEmpty()) return null;
        synchronized (BOOKS) {
            for (Map.Entry<String, String[]> book : BOOKS.entrySet()) {
                if (route.contains(book.getKey())) return book.getValue();
            }
        }
        return null;
    }
}
