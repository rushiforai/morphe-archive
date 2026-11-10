package io.github.bryceaspringfield.morphe.extension.youtube;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.patches.components.BufferAsciiStrings;
import app.morphe.extension.shared.patches.components.ContextInterface;
import app.morphe.extension.shared.patches.components.Filter;
import app.morphe.extension.shared.patches.components.StringFilterGroup;

/**
 * Layout pieces: the community panel of comment sections and the new-content dots of the subscribed channels bar.
 * With Log feed items on, it logs every component path under the channel bar and the comments panel, which is how
 * the paths below were chosen.
 */
@SuppressWarnings("unused")
public final class XLayoutFilter extends Filter {

    /**
     * The dot on a channel's avatar in the subscribed channels bar ("subscriptions_channel_bar_channel.eml|...|
     * decorated_avatar.eml|...|status_dot.eml", YouTube 21.44).
     */
    private final StringFilterGroup statusDot = new StringFilterGroup(null, "status_dot.e");

    /**
     * The community card of the watch page's comments carousel ("CHANNEL's Community ... Visit", reached by swiping
     * the comments teaser): a cell of video_metadata_carousel whose buffer opens FEcommunity_page.
     */
    private final StringFilterGroup commentsCommunity = new StringFilterGroup(null, "video_metadata_carousel.e");

    public XLayoutFilter() {
        addPathCallbacks(statusDot, commentsCommunity);
    }

    @Override
    public boolean isFiltered(ContextInterface contextInterface, String identifier, String accessibility,
                              CharSequence path, byte[] buffer, BufferAsciiStrings asciiStrings,
                              StringFilterGroup matchedGroup, FilterContentType contentType, int contentIndex) {
        if (matchedGroup == commentsCommunity) {
            return XSettings.HIDE_COMMENTS_COMMUNITY.get() && path.toString().endsWith("|CollectionType|CellType|")
                    && new String(buffer, java.nio.charset.StandardCharsets.ISO_8859_1).contains("FEcommunity_page");
        }
        if (matchedGroup == statusDot) {
            return XSettings.HIDE_CHANNEL_BAR_DOTS.get() && path.toString().contains("subscriptions_channel_bar");
        }
        return false;
    }

}
