package semicoloncolonel.mobilestream.extension.yttv;

import android.app.Activity;
import android.app.PictureInPictureParams;
import android.app.RemoteAction;
import android.graphics.Rect;
import android.os.Build;
import android.util.Log;
import android.util.Rational;

import java.util.List;

/**
 * Keeps YouTube TV's picture-in-picture window at 16:9.
 *
 * YouTube TV works out the window's shape from its player layout. While the
 * player controls show, that layout gives a wider shape, and each resize
 * changes the layout again, so the window flips between 16:9 and the wider
 * shape until the controls hide. Every shape the app asks for is replaced
 * with 16:9 here. The rest of the settings, such as the play and pause
 * buttons, are kept.
 *
 * The settings are copied with getters added in Android 13. On older
 * versions the app's own settings are passed on unchanged.
 */
@SuppressWarnings("unused")
public final class YttvPictureInPicture {
    private static final String TAG = "MSP-YTTV-PIP";
    private static final Rational VIDEO = new Rational(16, 9);

    private YttvPictureInPicture() {
    }

    /** Replaces Activity.setPictureInPictureParams(params). */
    public static void setParams(Activity activity, PictureInPictureParams params) {
        activity.setPictureInPictureParams(lock(params));
    }

    /** Replaces Activity.enterPictureInPictureMode(params). */
    public static boolean enter(Activity activity, PictureInPictureParams params) {
        return activity.enterPictureInPictureMode(lock(params));
    }

    private static PictureInPictureParams lock(PictureInPictureParams params) {
        if (params == null || Build.VERSION.SDK_INT < Build.VERSION_CODES.TIRAMISU) return params;
        try {
            Rational ratio = params.getAspectRatio();
            if (ratio == null || ratio.equals(VIDEO)) return params;

            PictureInPictureParams.Builder builder = new PictureInPictureParams.Builder().setAspectRatio(VIDEO);
            List<RemoteAction> actions = params.getActions();
            if (actions != null) builder.setActions(actions);
            Rect hint = params.getSourceRectHint();
            if (hint != null) builder.setSourceRectHint(hint);
            RemoteAction close = params.getCloseAction();
            if (close != null) builder.setCloseAction(close);
            CharSequence title = params.getTitle();
            if (title != null) builder.setTitle(title);
            CharSequence subtitle = params.getSubtitle();
            if (subtitle != null) builder.setSubtitle(subtitle);
            builder.setAutoEnterEnabled(params.isAutoEnterEnabled());
            builder.setSeamlessResizeEnabled(params.isSeamlessResizeEnabled());
            return builder.build();
        } catch (Throwable t) {
            Log.w(TAG, "kept the app's picture-in-picture settings: " + t);
            return params;
        }
    }
}
