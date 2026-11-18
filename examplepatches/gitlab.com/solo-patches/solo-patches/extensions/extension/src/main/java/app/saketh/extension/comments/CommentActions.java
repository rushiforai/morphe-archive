package app.saketh.extension.comments;

import android.app.AlertDialog;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.widget.Button;
import android.widget.PopupWindow;
import android.widget.TextView;
import android.widget.Toast;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/** Copy and Translate items in WebNovel's comment long-press menu. */
public final class CommentActions {
    private static final Class<?>[] TRANSLATE_PARAMETERS = {
            String.class, String.class, ArrayList.class, String.class, Long.class, Long.class};

    private CommentActions() {}

    /** Replaces the menu's showAsDropDown(anchor). The anchor is the comment text or the layout that holds it. */
    public static void show(PopupWindow menu, View anchor) {
        Context context = anchor.getContext();
        String text = commentText(anchor);
        View items = menu.getContentView();
        // Hide Dislike. The menu measures itself when shown, so its width follows the visible items.
        for (String hidden : new String[]{"dislikeLL", "cancelDislikeLL"}) {
            View item = items.findViewById(id(context, hidden));
            if (item != null) item.setVisibility(View.GONE);
        }
        items.findViewById(id(context, "saketh_comment_copy")).setOnClickListener(view -> {
            menu.dismiss();
            copy(context, text);
        });
        items.findViewById(id(context, "saketh_comment_translate")).setOnClickListener(view -> {
            menu.dismiss();
            translate(context, text);
        });
        menu.showAsDropDown(anchor);
    }

    private static String commentText(View anchor) {
        View text = anchor instanceof TextView ? anchor : anchor.findViewById(id(anchor.getContext(), "commentContent"));
        return text instanceof TextView ? ((TextView) text).getText().toString() : "";
    }

    private static int id(Context context, String name) {
        return context.getResources().getIdentifier(name, "id", context.getPackageName());
    }

    static void copy(Context context, String text) {
        ClipboardManager clipboard = (ClipboardManager) context.getSystemService(Context.CLIPBOARD_SERVICE);
        clipboard.setPrimaryClip(ClipData.newPlainText("WebNovel text", text));
        // Android 13 and newer confirm clipboard writes themselves.
        if (Build.VERSION.SDK_INT < 33) Toast.makeText(context, "Copied", Toast.LENGTH_SHORT).show();
    }

    static void translate(Context context, String text) {
        AlertDialog dialog = new AlertDialog.Builder(context)
                .setTitle("Translation")
                .setMessage("")
                .setPositiveButton("Copy", null)
                .setNeutralButton("Language", null)
                .setNegativeButton("Close", null)
                .show();
        dialog.getButton(AlertDialog.BUTTON_NEUTRAL).setOnClickListener(view ->
                TranslateLanguage.choose(context, () -> translateInto(dialog, text)));
        translateInto(dialog, text);
    }

    private static void translateInto(AlertDialog dialog, String text) {
        Context context = dialog.getContext();
        String language = TranslateLanguage.code(context);
        dialog.setTitle("Translation · " + TranslateLanguage.label());
        dialog.setMessage("Translating…");
        Button copyButton = dialog.getButton(AlertDialog.BUTTON_POSITIVE);
        copyButton.setEnabled(false);
        Handler main = new Handler(Looper.getMainLooper());
        new Thread(() -> {
            String translated;
            try {
                translated = translateWithApp(text, language);
            } catch (ReflectiveOperationException | RuntimeException failed) {
                translated = null;
            }
            String result = translated;
            main.post(() -> {
                // Drop results for a language the user has since switched away from.
                if (!dialog.isShowing() || !language.equals(TranslateLanguage.code(context))) return;
                if (result == null) {
                    dialog.setMessage("Translation failed. Check your connection or try another language.");
                    return;
                }
                dialog.setMessage(result);
                TextView message = dialog.findViewById(android.R.id.message);
                if (message != null) message.setTextIsSelectable(true);
                copyButton.setEnabled(true);
                copyButton.setOnClickListener(view -> {
                    dialog.dismiss();
                    copy(context, result);
                });
            });
        }, "saketh-comment-translate").start();
    }

    /**
     * Runs WebNovel's own machine translator. Its class and result models keep their names,
     * but the method and singleton field are obfuscated, so they are found by signature.
     */
    private static String translateWithApp(String text, String language) throws ReflectiveOperationException {
        Class<?> translator = Class.forName("com.qidian.QDReader.utils.TempTranslateUtils");
        Class<?> tagInfo = Class.forName("com.qidian.QDReader.components.entity.TTSTagInfo");
        ArrayList<Object> paragraphs = new ArrayList<>();
        paragraphs.add(Class.forName("com.qidian.QDReader.components.entity.TTSSplitParagraph")
                .getConstructor(String.class, tagInfo).newInstance(text, null));
        Object result = translateMethod(translator)
                .invoke(singleton(translator), "auto", language, paragraphs, null, null, null);
        if (result == null || !Integer.valueOf(0).equals(call(result, "getCode"))) return null;
        List<?> data = (List<?>) call(result, "getData");
        return data == null || data.isEmpty() ? null : (String) call(data.get(0), "getText");
    }

    private static Method translateMethod(Class<?> translator) throws NoSuchMethodException {
        for (Method method : translator.getDeclaredMethods()) {
            if (!Modifier.isStatic(method.getModifiers())
                    && Arrays.equals(method.getParameterTypes(), TRANSLATE_PARAMETERS)) return method;
        }
        throw new NoSuchMethodException("WebNovel translator");
    }

    private static Object singleton(Class<?> translator) throws ReflectiveOperationException {
        for (Field field : translator.getDeclaredFields()) {
            if (Modifier.isStatic(field.getModifiers()) && field.getType() == translator) return field.get(null);
        }
        throw new NoSuchFieldException("WebNovel translator instance");
    }

    private static Object call(Object target, String getter) throws ReflectiveOperationException {
        return target.getClass().getMethod(getter).invoke(target);
    }
}
