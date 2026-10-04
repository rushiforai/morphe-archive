package e.e.a;

import android.app.Activity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

/** Removes the obsolete registration footer and the video-info toolbar divider. */
public final class VideoInfoUi {
    private VideoInfoUi() {}

    public static void hideRegistration(TextView message, CharSequence ignored) {
        message.setText("");
        message.setVisibility(View.GONE);
    }

    public static void hideDivider(Activity activity) {
        View toolbar = activity.findViewById(0x7f0801be);
        if (!(toolbar instanceof ViewGroup)) return;
        ViewGroup group = (ViewGroup) toolbar;
        if (group.getChildCount() == 0) return;
        View divider = group.getChildAt(0);
        // The supported layout's first child is an unnamed 2dp separator.
        // Keep the named toolbar and its playback buttons intact.
        if (divider.getId() == View.NO_ID) divider.setVisibility(View.GONE);
    }
}
