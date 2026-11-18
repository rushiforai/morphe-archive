/* Component name from Morphe patches v2.2.0 (GPLv3),
 * https://github.com/MorpheApp/morphe-patches. See NOTICE.
 * Uses Afterglow's iOS preference and independently installed Player overlay patch.
 */
package app.afterglow.extension.litho.filters;

import app.afterglow.extension.litho.LithoFilter;
import app.afterglow.extension.litho.StringFilterGroup;

/** Modern channel branding; the native legacy ImageView is bound separately. */
public final class PlayerOverlayFilter extends LithoFilter {
    public PlayerOverlayFilter() {
        addPathCallbacks(new StringFilterGroup("noWatermarks", "featured_channel_watermark_overlay"));
    }
}
