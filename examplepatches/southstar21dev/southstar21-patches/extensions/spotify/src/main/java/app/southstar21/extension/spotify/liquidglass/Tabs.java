package app.southstar21.extension.spotify.liquidglass;

import android.view.View;

import java.util.List;

/** The tabs the selection moves between, as the lens sees them. */
interface Tabs {
    /**
     * One view per tab, laid out in the bar's coordinates. The selected one reports
     * {@link View#isSelected()}, and {@link View#performClick()} opens it.
     */
    List<View> views();

    /** The views to scale and move when the bar shrinks or leans. */
    List<View> transformed();

    /** Called on every pre-draw, before the lens syncs. */
    void update();
}
