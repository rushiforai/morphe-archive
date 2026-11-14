package app.morphe.extension.mapsautomotive.android9;

import android.graphics.drawable.Drawable;
import android.os.Build;
import android.widget.EditText;

/**
 * TextView.getTextCursorDrawable through EditText (patch "Android 9 (API 28)"): Android 9 keeps the cursor drawable
 * private, so null, which Material's cursor tint already treats as "nothing to tint".
 */
public final class EditText28 {
    public static final String OWNER = "Landroid/widget/EditText;";

    private EditText28() {
    }

    public static Drawable getTextCursorDrawable(EditText view) {
        if (Build.VERSION.SDK_INT >= 29) return view.getTextCursorDrawable();
        return null;
    }
}
