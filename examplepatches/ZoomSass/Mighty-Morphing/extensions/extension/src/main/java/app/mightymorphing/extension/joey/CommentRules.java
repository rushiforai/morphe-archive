package app.mightymorphing.extension.joey;

import android.app.Activity;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONObject;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

/**
 * What a subreddit allows in comments. Reddit lists it in the subreddit's details as the media
 * types allowed in comments. When the list is there, the image button is dimmed if nothing
 * visual is allowed, a file the subreddit would refuse is stopped before it uploads, and a
 * refused reply says what is allowed. When the list is missing, nothing changes.
 */
public final class CommentRules {
    private static final String TAG = "MM.CommentRules";
    private static final Map<String, JSONArray> KNOWN = new HashMap<>();
    private static final Map<String, Boolean> ASKED = new HashMap<>();

    private CommentRules() {
    }

    /** Called as the reply screen starts. Looks the subreddit up in the background. */
    public static void prepare(Activity activity) {
        try {
            String sub = subreddit(activity);
            if (sub.isEmpty()) return;
            String key = sub.toLowerCase(Locale.US);
            synchronized (KNOWN) {
                if (KNOWN.containsKey(key)) {
                    activity.getWindow().getDecorView().post(() -> dim(activity));
                    return;
                }
                if (ASKED.containsKey(key)) return;
                ASKED.put(key, true);
            }
            new Thread(() -> {
                try {
                    String token = EditorUpload.token(activity);
                    String text = EditorUpload.get(token,
                            "https://oauth.reddit.com/r/" + sub + "/about.json?raw_json=1", 8000);
                    JSONObject data = new JSONObject(text).getJSONObject("data");
                    JSONArray list = data.optJSONArray("allowed_media_in_comments");
                    Log.i(TAG, "r/" + sub + " allowed_media_in_comments=" + list);
                    if (list == null) return;
                    synchronized (KNOWN) {
                        KNOWN.put(key, list);
                    }
                    activity.runOnUiThread(() -> dim(activity));
                } catch (Throwable failure) {
                    Log.i(TAG, "lookup failed", failure);
                }
            }, "mm-comment-rules").start();
        } catch (Throwable failure) {
            Log.i(TAG, "prepare", failure);
        }
    }

    private static void tell(Activity activity, String message) {
        try {
            android.widget.LinearLayout page = MorpheDialog.page(activity, "Not allowed here", message);
            android.widget.TextView ok = MorpheDialog.action(activity, "OK", MorpheDialog.GOLD);
            page.addView(MorpheDialog.actions(activity, ok));
            android.app.AlertDialog dialog = MorpheDialog.show(activity, page, 360);
            ok.setOnClickListener(v -> dialog.dismiss());
        } catch (Throwable failure) {
            Toast.makeText(activity, message, Toast.LENGTH_LONG).show();
        }
    }

    /** False, with an explanation, when the subreddit is known to refuse this kind of file. */
    static boolean permits(Activity activity, boolean gif) {
        try {
            JSONArray list = list(activity);
            if (list == null) return true;
            boolean ok = has(list, gif ? "animated" : "static");
            if (!ok) {
                tell(activity, "r/" + subreddit(activity) + " doesn't allow "
                        + (gif ? "GIFs" : "images") + " in comments.\n" + allowed(list).trim());
            }
            return ok;
        } catch (Throwable failure) {
            return true;
        }
    }

    /** Adds what is allowed to Reddit's own refusal, which does not say. */
    public static String explain(Activity activity, String message) {
        try {
            if (message == null || !message.toLowerCase(Locale.US).contains("media types")) return message;
            JSONArray list = list(activity);
            if (list == null) return message;
            return message + "\n\nr/" + subreddit(activity) + " allows" + allowed(list).substring(" Allowed:".length());
        } catch (Throwable failure) {
            return message;
        }
    }

    private static void dim(Activity activity) {
        try {
            JSONArray list = list(activity);
            if (list == null) return;
            String sub = subreddit(activity);
            if (!has(list, "static") && !has(list, "animated")) {
                hold(activity, "editor_actions_image", "r/" + sub + " doesn't allow images or GIFs in comments.\n"
                        + allowed(list).trim());
            }
        } catch (Throwable failure) {
            Log.i(TAG, "dim", failure);
        }
    }

    /** Dims a button and explains why instead of letting the tap through. */
    private static void hold(Activity activity, String idName, String message) {
        int id = activity.getResources().getIdentifier(idName, "id", activity.getPackageName());
        View button = id == 0 ? null : activity.findViewById(id);
        if (button == null) return;
        button.setAlpha(0.35f);
        button.setOnTouchListener((v, event) -> {
            if (event.getAction() == MotionEvent.ACTION_UP) tell(activity, message);
            return true;
        });
    }

    private static JSONArray list(Activity activity) {
        String sub = subreddit(activity);
        if (sub.isEmpty()) return null;
        synchronized (KNOWN) {
            return KNOWN.get(sub.toLowerCase(Locale.US));
        }
    }

    private static boolean has(JSONArray list, String kind) {
        for (int i = 0; i < list.length(); i++) {
            if (kind.equals(list.optString(i))) return true;
        }
        return false;
    }

    private static String allowed(JSONArray list) {
        StringBuilder out = new StringBuilder();
        for (int i = 0; i < list.length(); i++) {
            String kind = list.optString(i);
            String name = "static".equals(kind) ? "images" : "animated".equals(kind) ? "GIFs"
                    : "giphy".equals(kind) ? "Giphy" : "expression".equals(kind) ? "emotes" : kind;
            if (out.length() > 0) out.append(", ");
            out.append(name);
        }
        return " Allowed: " + (out.length() == 0 ? "text only" : out) + ".";
    }

    /** The subreddit being replied in, from the comment or post on the reply screen. */
    private static String subreddit(Activity activity) {
        try {
            Object target = field(activity, "m1");
            if (target == null) {
                // Editing a comment: the screen holds the comment's node, not a contribution.
                Object node = field(activity, "A1");
                if (node != null) target = node.getClass().getMethod("p").invoke(node);
            }
            if (target == null) return "";
            String type = target.getClass().getName();
            String method = type.endsWith(".Submission") ? "Z" : type.endsWith(".Comment") ? "U" : null;
            if (method == null) return "";
            Method call = target.getClass().getMethod(method);
            Object value = call.invoke(target);
            return value instanceof String ? (String) value : "";
        } catch (Throwable failure) {
            return "";
        }
    }

    private static Object field(Activity activity, String name) {
        for (Class<?> type = activity.getClass(); type != null; type = type.getSuperclass()) {
            try {
                Field f = type.getDeclaredField(name);
                f.setAccessible(true);
                return f.get(activity);
            } catch (NoSuchFieldException ignored) {
            } catch (Throwable failure) {
                return null;
            }
        }
        return null;
    }
}
