package io.github.bryceaspringfield.morphe.extension.youtube;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.patches.components.BufferAsciiStrings;
import app.morphe.extension.shared.patches.components.ContextInterface;
import app.morphe.extension.shared.patches.components.Filter;
import app.morphe.extension.shared.patches.components.StringFilterGroup;

@SuppressWarnings("unused")
public final class XLayoutFilter extends Filter {

    private final StringFilterGroup statusDot = new StringFilterGroup(null, "status_dot.e");

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
