package semicoloncolonel.mobilestream.extension.shared.misc;

import android.app.Activity;

import com.google.android.gms.tasks.Task;
import com.google.android.gms.tasks.Tasks;

/**
 * Stands in for Google Play's ReviewManager.launchReviewFlow(Activity, ReviewInfo).
 * The review sheet never opens. The returned task is already complete, which is
 * how Play answers when it decides not to show the sheet, so the app's
 * completion listeners still run.
 */
@SuppressWarnings("unused")
public final class RatingPromptBlocker {
    private RatingPromptBlocker() {
    }

    public static Task<Void> launchReviewFlow(Object reviewManager, Activity activity, Object reviewInfo) {
        return Tasks.forResult(null);
    }
}
