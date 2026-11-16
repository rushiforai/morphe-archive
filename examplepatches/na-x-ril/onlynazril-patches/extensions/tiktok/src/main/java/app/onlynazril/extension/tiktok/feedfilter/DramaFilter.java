package app.onlynazril.extension.tiktok.feedfilter;

import app.onlynazril.extension.tiktok.internal.Reflect;

/**
 * Mini-drama and series videos.
 *
 * The item itself is not marked as a drama; the payload is on its `PaidContentInfo`. Any of the
 * mini-drama fields is enough: a serialized `miniDramaInfo`, a drama card, the parsed
 * `paidContentMiniDramaInfo`, an episode number, or the limited-free short-drama flag. A paid post
 * without those fields is left alone.
 */
public final class DramaFilter implements IFilter {
    @Override
    public boolean shouldRemove(Object item) {
        Object paid = Reflect.property(item, "getMPaidContentInfo", "mPaidContentInfo");
        if (paid == null) return false;
        return nonEmpty(Reflect.property(paid, "getMiniDramaInfo", "miniDramaInfo"))
                || Reflect.property(paid, "getMiniDramaCardInfo", "miniDramaCardInfo") != null
                || Reflect.property(paid, "getPaidContentMiniDramaInfo", "paidContentMiniDramaInfo") != null
                || nonEmpty(Reflect.property(paid, "getEpisodeNumber", "episodeNumber"))
                || Boolean.TRUE.equals(
                        Reflect.property(paid, "isLimitedFreeShortDrama", "isLimitedFreeShortDrama"));
    }

    private static boolean nonEmpty(Object value) {
        return value instanceof String && !((String) value).isEmpty();
    }

    @Override
    public String reason(Object item) {
        return "drama";
    }
}
