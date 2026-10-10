package app.ahmedyarub.extension.x;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.text.method.ScrollingMovementMethod;
import android.view.Gravity;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import app.morphe.extension.shared.Logger;

/**
 * Actions added to a post's "..." menu, and options hidden from it.
 *
 * The menu lists post action types, an enum. The added actions reuse action types the menu never
 * offers, with labels of their own, and are handled here before the app sees them.
 */
@SuppressWarnings("unused")
public final class PostMenu {

    /** The post action type enum. Rewritten by the patch. */
    private static String actionClass() { return ""; }

    /** The option group class, built from a list of actions. Rewritten by the patch. */
    private static String groupClass() { return ""; }

    /** Comma separated keys of the added actions. Rewritten by the patches that add them. */
    private static String enabledActions() { return ""; }

    /** Comma separated action type names hidden from the menu. Rewritten by Custom share menu. */
    private static String hiddenOptions() { return ""; }

    /** Each added action: its key, the unused action type it borrows, and its label. */
    private enum Action {
        COPY_MEDIA_LINK("copyMediaLink", "PromotedCopyLinkTo", "Copy media link"),
        EXTERNAL_DOWNLOADER("externalDownloader", "PromotedShareVia", "Open in downloader"),
        READER("reader", "DraftTweetId", "Reader mode"),
        TRANSLATE("translate", "TwitterShare", "Translate with Google"),
        DEBUG("debug", "ViewDebugDialog", "Post data"),
        KEYWORDS("keywords", "SendToAudioSpace", "Filtered keywords"),
        SETTINGS("settings", "PromotedDismissAd", "Feed filters");

        final String key;
        final String type;
        final String label;

        Action(String key, String type, String label) {
            this.key = key;
            this.type = type;
            this.label = label;
        }
    }

    private static final class Setup {
        static final List<Action> ACTIONS = enabled();
        static final Set<String> HIDDEN = new HashSet<>(Arrays.asList(hiddenOptions().split(",")));
    }

    private static List<Action> enabled() {
        List<String> keys = Arrays.asList(enabledActions().split(","));
        List<Action> actions = new ArrayList<>();
        for (Action action : Action.values()) {
            if (keys.contains(action.key)) actions.add(action);
        }
        return Collections.unmodifiableList(actions);
    }

    // region Menu state

    /** The menu's option groups, without the hidden options and with the added actions. */
    public static List<?> options(boolean shown, List<?> groups) {
        if (!shown || groups == null) return groups;

        try {
            List<Object> result = new ArrayList<>(groups.size() + 1);
            for (Object group : groups) {
                List<?> actions = actionsOf(group);
                List<Object> kept = new ArrayList<>(actions.size());
                for (Object action : actions) {
                    if (!Setup.HIDDEN.contains(((Enum<?>) action).name())) kept.add(action);
                }
                if (kept.size() == actions.size()) result.add(group);
                else if (!kept.isEmpty()) result.add(newGroup(kept));
            }

            if (!Setup.ACTIONS.isEmpty()) {
                List<Object> added = new ArrayList<>();
                for (Action action : Setup.ACTIONS) added.add(actionType(action));
                result.add(newGroup(added));
            }
            return result;
        } catch (Exception ex) {
            Logger.printException(() -> "PostMenu options failure", ex);
            return groups;
        }
    }

    /** The menu's labels, with the added actions'. */
    @SuppressWarnings({"rawtypes", "unchecked"})
    public static Map<?, ?> labels(boolean shown, Map<?, ?> labels) {
        if (!shown || Setup.ACTIONS.isEmpty()) return labels;

        try {
            Map result = labels == null ? new LinkedHashMap() : new LinkedHashMap(labels);
            for (Action action : Setup.ACTIONS) result.put(actionType(action), action.label);
            return result;
        } catch (Exception ex) {
            Logger.printException(() -> "PostMenu labels failure", ex);
            return labels;
        }
    }

    private static List<?> actionsOf(Object group) throws IllegalAccessException {
        for (Field field : group.getClass().getDeclaredFields()) {
            if (List.class.isAssignableFrom(field.getType())) {
                field.setAccessible(true);
                return (List<?>) field.get(group);
            }
        }
        return Collections.emptyList();
    }

    private static Object newGroup(List<Object> actions) throws Exception {
        Constructor<?> constructor = Class.forName(groupClass()).getDeclaredConstructor(List.class);
        constructor.setAccessible(true);
        return constructor.newInstance(actions);
    }

    @SuppressWarnings({"rawtypes", "unchecked"})
    private static Object actionType(Action action) throws ClassNotFoundException {
        return Enum.valueOf((Class) Class.forName(actionClass()), action.type);
    }

    // endregion

    // region Actions

    /**
     * Runs an added action the menu reports selected. True when it was one; the caller then
     * closes the menu without letting the app handle the selection.
     */
    public static boolean onOption(Context appContext, Object post, Object event) {
        try {
            // Dialogs need the activity; the menu only has the application context.
            Activity activity = MainActivity.get();
            Context context = activity != null ? activity : appContext;

            Enum<?> type = selectedType(event);
            if (type == null) return false;

            for (Action action : Setup.ACTIONS) {
                if (!action.type.equals(type.name())) continue;

                run(action, context, post);
                return true;
            }
        } catch (Exception ex) {
            Logger.printException(() -> "PostMenu action failure", ex);
        }
        return false;
    }

    private static Enum<?> selectedType(Object event) throws Exception {
        if (event == null) return null;

        Class<?> actionClass = Class.forName(actionClass());
        for (Field field : event.getClass().getDeclaredFields()) {
            if (field.getType() == actionClass) {
                field.setAccessible(true);
                return (Enum<?>) field.get(event);
            }
        }
        return null;
    }

    private static void run(Action action, Context context, Object post) throws Exception {
        switch (action) {
            case COPY_MEDIA_LINK -> copyMediaLinks(context, post);
            case EXTERNAL_DOWNLOADER -> openInDownloader(context, post);
            case READER -> showReader(context, post);
            case TRANSLATE -> translate(context, post);
            case DEBUG -> showText(context, "Post data", String.valueOf(post));
            case KEYWORDS -> editKeywords(context);
            case SETTINGS -> openSettings(context);
        }
    }

    private static final Pattern VARIANT = Pattern.compile(
            "MediaVariant\\(url=([^,\\s]+), bitRate=(\\d+|null), contentType=([^)]+)\\)");
    private static final Pattern IMAGE_URL = Pattern.compile("imageUrl=(https://pbs\\.twimg\\.com/[^,)\\s]+)");

    /**
     * The direct links of a post's media: the best mp4 of each video and GIF, and each photo at its
     * original size. Read from the post's own description, which lists them all.
     */
    static List<String> mediaLinks(Object post) {
        String text = String.valueOf(post);
        List<String> links = new ArrayList<>();

        for (String media : text.split("(?=MediaContent(Video|Gif|Image)\\()")) {
            if (media.startsWith("MediaContentVideo(") || media.startsWith("MediaContentGif(")) {
                String best = null;
                long bestRate = -1;
                Matcher variant = VARIANT.matcher(media);
                while (variant.find()) {
                    if (!variant.group(3).contains("mp4")) continue;
                    long rate = variant.group(2).equals("null") ? 0 : Long.parseLong(variant.group(2));
                    if (rate > bestRate) {
                        bestRate = rate;
                        best = variant.group(1);
                    }
                }
                if (best != null) links.add(best);
            } else if (media.startsWith("MediaContentImage(")) {
                Matcher image = IMAGE_URL.matcher(media);
                if (image.find()) {
                    String url = image.group(1);
                    int query = url.indexOf('?');
                    links.add((query < 0 ? url : url.substring(0, query)) + "?name=orig");
                }
            }
        }

        // A video's preview photo is listed inside it; keep only one entry per link.
        return new ArrayList<>(new LinkedHashSet<>(links));
    }

    private static void copyMediaLinks(Context context, Object post) {
        List<String> links = mediaLinks(post);
        if (links.isEmpty()) {
            Toast.makeText(context, "This post has no media", Toast.LENGTH_SHORT).show();
            return;
        }

        ClipboardManager clipboard = (ClipboardManager) context.getSystemService(Context.CLIPBOARD_SERVICE);
        clipboard.setPrimaryClip(ClipData.newPlainText("media_link", String.join("\n", links)));
        Toast.makeText(context, links.size() == 1 ? "Media link copied" : links.size() + " media links copied",
                Toast.LENGTH_SHORT).show();
    }

    private static void openInDownloader(Context context, Object post) throws Exception {
        Intent send = new Intent(Intent.ACTION_SEND)
                .setType("text/plain")
                .putExtra(Intent.EXTRA_TEXT, url(post));
        context.startActivity(Intent.createChooser(send, "Open in downloader").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
    }

    private static void showReader(Context context, Object post) throws Exception {
        StringBuilder page = new StringBuilder(text(post));
        List<String> media = mediaLinks(post);
        if (!media.isEmpty()) {
            page.append("\n\n");
            for (String link : media) page.append(link).append('\n');
        }
        showText(context, "Reader mode", page.toString().trim());
    }

    private static void translate(Context context, Object post) throws Exception {
        String target = Locale.getDefault().getLanguage();
        Uri uri = Uri.parse("https://translate.google.com/").buildUpon()
                .appendQueryParameter("sl", "auto")
                .appendQueryParameter("tl", target)
                .appendQueryParameter("op", "translate")
                .appendQueryParameter("text", text(post))
                .build();
        context.startActivity(new Intent(Intent.ACTION_VIEW, uri).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
    }

    private static void openSettings(Context context) {
        try {
            Intent intent = new Intent(context, SettingsActivity.class);
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            context.startActivity(intent);
        } catch (Exception ex) {
            Logger.printException(() -> "Open settings failure", ex);
            Toast.makeText(context, "Could not open settings: " + ex.getMessage(), Toast.LENGTH_LONG).show();
        }
    }

    /** Edits the keywords whose posts are hidden, one per line. */
    private static void editKeywords(Context context) {
        EditText editor = new EditText(context);
        editor.setText(TimelineFilter.keywordsText());
        editor.setHint("One keyword or phrase per line");
        editor.setMinLines(4);
        editor.setGravity(Gravity.TOP | Gravity.START);
        int padding = (int) (20 * context.getResources().getDisplayMetrics().density);

        FrameLayout frame = new FrameLayout(context);
        frame.setPadding(padding, padding / 2, padding, 0);
        frame.addView(editor);

        new AlertDialog.Builder(context)
                .setTitle("Filtered keywords")
                .setMessage("Posts containing any of these are hidden from timelines as they load.")
                .setView(frame)
                .setPositiveButton("Save", (dialog, which) -> {
                    TimelineFilter.setKeywords(editor.getText().toString());
                    Toast.makeText(context, "Saved. Refresh to apply.", Toast.LENGTH_SHORT).show();
                })
                .setNegativeButton("Cancel", null)
                .show();
    }

    /** A dialog with selectable, copyable text. */
    private static void showText(Context context, String title, String text) {
        TextView view = new TextView(context);
        view.setText(text);
        view.setTextIsSelectable(true);
        view.setMovementMethod(ScrollingMovementMethod.getInstance());
        int padding = (int) (20 * context.getResources().getDisplayMetrics().density);
        view.setPadding(padding, padding / 2, padding, 0);

        ScrollView scroll = new ScrollView(context);
        scroll.addView(view);

        new AlertDialog.Builder(context)
                .setTitle(title)
                .setView(scroll)
                .setPositiveButton("Copy", (dialog, which) -> {
                    ClipboardManager clipboard = (ClipboardManager) context.getSystemService(Context.CLIPBOARD_SERVICE);
                    clipboard.setPrimaryClip(ClipData.newPlainText(title, text));
                })
                .setNegativeButton("Close", null)
                .show();
    }

    // getUrl and getText keep their names in the post interface.

    private static String url(Object post) throws Exception {
        Method getUrl = post.getClass().getMethod("getUrl");
        return (String) getUrl.invoke(post);
    }

    private static String text(Object post) throws Exception {
        Method getText = post.getClass().getMethod("getText");
        Object text = getText.invoke(post);
        return text == null ? "" : text.toString();
    }

    // endregion
}
