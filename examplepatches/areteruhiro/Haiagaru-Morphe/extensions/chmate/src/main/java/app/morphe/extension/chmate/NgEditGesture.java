package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.preference.PreferenceManager;
import android.view.View;
import android.widget.Toast;

/** Adds an unassigned-by-default action to ChMate's own gesture registry. */
public final class NgEditGesture {
    public static final String KEY = "haiagaruGestureNgEdit";
    /** ChMate本体のジェスチャー設定から割り当てるレスフィルター表示。 */
    public static final String FILTER_KEY = "haiagaruGestureQuickFilters";
    private static final int ACTION = 0x48690042;
    private static Class<?> previewOwner;
    private static Object previewAction;
    private static int previewSequence;
    private static String previewLabel;
    private static final java.util.Map<View, android.graphics.PointF> starts = new java.util.WeakHashMap<>();
    public static void rememberStart(View view, android.graphics.PointF start) {
        if(start != null) starts.put(view, new android.graphics.PointF(start.x, start.y));
        else starts.remove(view);
    }
    private NgEditGesture() {}

    public static boolean onGesture(View view, int gesture) {
        return onGesture(view, gesture, starts.get(view));
    }

    public static boolean onGesture(View view, int gesture, android.graphics.PointF start) {
        if (gesture == 0 || !view.isShown()) return false;
        if (assigned(view, gesture, OpenTabsRefresh.GESTURE)) return OpenTabsRefresh.gesture(view);
        if (assigned(view, gesture, DeleteReadThreads.KEY)) return DeleteReadThreads.gesture(view, start);
        if (assigned(view, gesture, FILTER_KEY)) return ExtraQuickFilters.openFromGesture(view);
        if (!assigned(view, gesture)) return false;
        return handle(view, ACTION);
    }

    private static boolean assigned(View view, int gesture) {
        return assigned(view, gesture, KEY);
    }

    private static boolean assigned(View view, int gesture, String key) {
        android.content.SharedPreferences preferences =
                PreferenceManager.getDefaultSharedPreferences(view.getContext());
        if (preferences.getInt(key, 0) != gesture) return false;
        // Preserve existing actions when an already-used gesture is assigned.
        for (java.util.Map.Entry<String, ?> entry : preferences.getAll().entrySet()) {
            if ((entry.getKey().startsWith("gesture") && !entry.getKey().equals("gestureLength")
                    || (entry.getKey().startsWith("haiagaruGesture") && !entry.getKey().equals(key)))
                    && entry.getValue() instanceof Integer && ((Integer) entry.getValue()) == gesture)
                return false;
        }
        return true;
    }

    /** Supply only the missing preview row; never insert an action into the native registry. */
    public static Object preview(View view, int gesture, Object original) {
        if (original != null || gesture == 0) return original;
        boolean delete = assigned(view, gesture, DeleteReadThreads.KEY);
        boolean refresh = assigned(view, gesture, OpenTabsRefresh.GESTURE);
        boolean filters = assigned(view, gesture, FILTER_KEY);
        if (!delete && !refresh && !filters && !assigned(view, gesture)) return original;
        String label = delete ? "既読スレをすべて削除" : refresh ? "開いているスレ・板を一括更新" : filters ? "フィルター" : "NG編集";
        synchronized (NgEditGesture.class) {
            Class<?> owner = view.getClass();
            // Preference assignment can change without changing the gesture sequence.
            if (previewOwner == owner && previewSequence == gesture && label.equals(previewLabel)
                    && previewAction != null) return previewAction;
            try {
                Object candidate = null;
                for (Class<?> nested : owner.getDeclaredClasses()) {
                    for (java.lang.reflect.Constructor<?> constructor : nested.getDeclaredConstructors()) {
                        Class<?>[] parameters = constructor.getParameterTypes();
                        if (java.util.Arrays.equals(parameters, new Class<?>[]{int.class, String.class})) {
                            if (candidate != null) return original;
                            constructor.setAccessible(true);
                            candidate = constructor.newInstance(ACTION, label);
                        } else if (java.util.Arrays.equals(parameters,
                                new Class<?>[]{int.class, int.class, String.class})) {
                            if (candidate != null) return original;
                            constructor.setAccessible(true);
                            candidate = constructor.newInstance(ACTION, gesture, label);
                        }
                    }
                }
                previewOwner = owner;
                previewSequence = gesture;
                previewLabel = label;
                previewAction = candidate;
                return candidate;
            } catch (ReflectiveOperationException | RuntimeException error) {
                return original;
            }
        }
    }

    public static boolean handle(View view, int action) {
        if (action != ACTION) return false;
        Context context = view.getContext();
        while (context instanceof ContextWrapper && !(context instanceof Activity)) {
            Context next = ((ContextWrapper) context).getBaseContext();
            if (next == context) break;
            context = next;
        }
        try {
            Class<?> editor = Class.forName("jp.syoboi.a2chMate.activity.NGEditorActivity", false,
                    context.getClassLoader());
            Intent intent = new Intent(context, editor);
            if (context instanceof Activity) ((Activity) context).startActivityForResult(intent, 0);
            else context.startActivity(intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
        } catch (ReflectiveOperationException | RuntimeException error) {
            Toast.makeText(view.getContext(), "NG編集を開けませんでした", Toast.LENGTH_SHORT).show();
        }
        return true;
    }
}
