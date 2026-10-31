package app.morphe.extension.chmate;

import android.app.Activity;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import java.util.WeakHashMap;

/** Only invoked by the posting activity; never changes reading/settings screens. */
public final class PostEditorTextSize {
    private static final WeakHashMap<EditText, Float> ORIGINAL_SIZES = new WeakHashMap<>();
    private PostEditorTextSize() {}

    public static void apply(Activity activity) {
        View root = activity.findViewById(android.R.id.content);
        if (root == null) return;
        PostMailInput.apply(root);
        update(root, Haiagaru.postEditorTextSizeSp());
        // Fragment views may be attached after the activity's onResume callback.
        root.post(() -> {
            if (!activity.isFinishing() && !activity.isDestroyed()) {
                PostMailInput.apply(root);
                update(root, Haiagaru.postEditorTextSizeSp());
            }
        });
    }

    private static void update(View view, float sizeSp) {
        if (view instanceof EditText) {
            EditText field = (EditText) view;
            Float original = ORIGINAL_SIZES.get(field);
            if (original == null) {
                if (sizeSp == 0) return;
                original = field.getTextSize();
                ORIGINAL_SIZES.put(field, original);
            }
            if (sizeSp == 0) field.setTextSize(TypedValue.COMPLEX_UNIT_PX, original);
            else field.setTextSize(TypedValue.COMPLEX_UNIT_SP, sizeSp);
        } else if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) update(group.getChildAt(i), sizeSp);
        }
    }
}
