package app.morphe.extension.syncforreddit.translate;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.widget.ProgressBar;

import androidx.preference.h;

import com.laurencedawson.reddit_sync.ui.preferences.defaults.SyncPreference;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.ResourceType;
import app.morphe.extension.shared.ResourceUtils;

/**
 * The row showing how much of a translation service's allowance is gone.
 *
 * <p>A row of Sync's own kind, so it is drawn in the app's style, with a bar put inside it. The
 * bar is a real one rather than something drawn out of characters: the row carries a layout of
 * its own for the space to the side, and this fills it in as the row is drawn.
 *
 * @noinspection unused
 */
public class UsagePreference extends SyncPreference {
    /** What is known of the allowance, set by whatever asked the service about it. */
    private static volatile int used;
    private static volatile int allowed;

    public UsagePreference(Context context, AttributeSet attributes) {
        super(context, attributes);
    }

    /**
     * Takes what a service said about its allowance and draws it.
     *
     * @param charactersUsed  How much has been translated in the period.
     * @param charactersAllowed The whole allowance, or zero where the service does not say.
     */
    static void say(UsagePreference row, int charactersUsed, int charactersAllowed) {
        used = charactersUsed;
        allowed = charactersAllowed;
        if (row != null) {
            // Drawn again, now that there is something to draw.
            row.M();
        }
    }

    @Override
    public void S(h holder) {
        super.S(holder);
        try {
            View bar = holder.itemView.findViewById(
                    ResourceUtils.getIdentifier(ResourceType.ID, "sync_up_usage_bar"));
            if (!(bar instanceof ProgressBar)) {
                return;
            }
            ProgressBar drawn = (ProgressBar) bar;
            if (allowed <= 0) {
                // Nothing said about an allowance, so there is no proportion to show.
                drawn.setVisibility(View.GONE);
                return;
            }
            drawn.setVisibility(View.VISIBLE);
            drawn.setMax(allowed);
            drawn.setProgress(Math.min(used, allowed));
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not draw the usage: " + ex);
        }
    }
}
