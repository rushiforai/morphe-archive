package e.e.a;

import android.app.Activity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

/** Removes the obsolete registration footer and the video-info toolbar divider. */
public final class VideoInfoUi {
    private VideoInfoUi() {}

    /** Called after each metadata panel is populated, including embedded playback panels. */
    public static void bindStatistics(Object fragment, View root) {
        if (root == null) return;
        try {
            android.os.Bundle data = (android.os.Bundle) fragment.getClass().getField("i0").get(fragment);
            TextView view = (TextView) root.findViewById(0x7f080193);
            if (view == null || data == null) return;
            long[] counts = VideoInfoCounts.read(data::getString);
            if (counts[0] < 0 || counts[1] < 0 || counts[3] < 0) return;
            VideoCounts.render(view, counts);
            // Add 2dp above/below the original 5dp top gap; repeated binding cannot accumulate it.
            ViewGroup.LayoutParams params = view.getLayoutParams();
            if (params instanceof ViewGroup.MarginLayoutParams) {
                ViewGroup.MarginLayoutParams margins = (ViewGroup.MarginLayoutParams) params;
                float density = view.getResources().getDisplayMetrics().density;
                margins.topMargin = Math.max(margins.topMargin, Math.round(7 * density));
                margins.bottomMargin = Math.max(margins.bottomMargin, Math.round(2 * density));
                view.setLayoutParams(margins);
            }
        } catch (ReflectiveOperationException failure) {
            throw new IllegalStateException("Unsupported video information panel", failure);
        }
    }

    /** Reuse the metadata response already fetched by the app; never invent missing counts. */
    public static void captureStatistics(org.json.JSONObject data, android.os.Bundle bundle) {
        if (data == null || bundle == null) return;
        org.json.JSONObject video = data.optJSONObject("video");
        org.json.JSONObject counts = video == null ? null : video.optJSONObject("count");
        String[] source = {"view", "comment", "like", "mylist"};
        String[] target = {"viewCount", "commentCount", "likeCount", "mylistCount"};
        for (int i = 0; counts != null && i < source.length; i++) {
            long value = counts.optLong(source[i], -1);
            if (value >= 0) bundle.putString(target[i], Long.toString(value));
        }

    }

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
