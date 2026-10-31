package app.morphe.extension.vk.ad;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

public class FeedAdsFilter {

    /**
     * Checks whether an item is any form of advertisement or promotional block.
     */
    public static boolean isAdItem(Object item) {
        if (item == null) {
            return false;
        }

        String className = item.getClass().getName();
        if (isAdClassName(className)) {
            return true;
        }

        // For Post: check ONLY actual ad indicators
        if (className.endsWith(".Post")) {
            try {
                // 1. Check marked_as_ads (field J)
                try {
                    Field fJ = item.getClass().getDeclaredField("J");
                    fJ.setAccessible(true);
                    if (fJ.getBoolean(item)) {
                        return true;
                    }
                } catch (Throwable ignored) {}

                // 2. Check marked_as_author_ad (field F)
                try {
                    Field fF = item.getClass().getDeclaredField("F");
                    fF.setAccessible(true);
                    if (fF.getBoolean(item)) {
                        return true;
                    }
                } catch (Throwable ignored) {}

                // 3. Check ad marker text (field G) - only if it actually indicates an advertisement
                try {
                    Field fG = item.getClass().getDeclaredField("G");
                    fG.setAccessible(true);
                    Object valG = fG.get(item);
                    if (valG != null) {
                        String s = valG.toString().toLowerCase();
                        if (s.contains("реклама") || s.contains("promoted")) {
                            return true;
                        }
                    }
                } catch (Throwable ignored) {}

                // 4. Check repost
                try {
                    Field fD = item.getClass().getDeclaredField("D");
                    fD.setAccessible(true);
                    Object repost = fD.get(item);
                    if (repost != null && repost != item && isAdItem(repost)) {
                        return true;
                    }
                } catch (Throwable ignored) {}

                // 5. Check ShitAttachment in attachments (unwrapping EntryAttachment if wrapped)
                try {
                    Field fz = item.getClass().getDeclaredField("z");
                    fz.setAccessible(true);
                    Object attaches = fz.get(item);
                    if (attaches instanceof List) {
                        List<?> list = (List<?>) attaches;
                        for (Object attach : list) {
                            if (attach == null) continue;
                            Object real = unwrapAttachment(attach);
                            if (real != null) {
                                String rName = real.getClass().getName();
                                // Standalone ShitAttachment without video is an ad post
                                if (rName.endsWith(".ShitAttachment")) {
                                    try {
                                        Field fVideo = real.getClass().getDeclaredField("I");
                                        fVideo.setAccessible(true);
                                        if (fVideo.get(real) == null) {
                                            return true;
                                        }
                                    } catch (Throwable t) {
                                        return true;
                                    }
                                }
                            }
                        }
                    }
                } catch (Throwable ignored) {}
            } catch (Throwable ignored) {}
        }

        return false;
    }

    private static Object unwrapAttachment(Object attach) {
        if (attach == null) return null;
        try {
            Field fb = attach.getClass().getDeclaredField("b");
            fb.setAccessible(true);
            Object inner = fb.get(attach);
            if (inner != null) return inner;
        } catch (Throwable ignored) {}
        return attach;
    }

    private static boolean isAdClassName(String className) {
        return className.endsWith(".PromoPost")
                || className.endsWith(".MyTargetNativeAdEntry")
                || className.endsWith(".OptionalNativeAdEntry")
                || className.endsWith(".YandexNativeAdEntry")
                || className.endsWith(".AdStubEntry")
                || className.endsWith(".PromoButton")
                || className.endsWith(".ShitAttachment")
                || className.endsWith(".StoriesAds")
                || className.endsWith(".MyTargetAdStoriesContainer")
                || className.endsWith(".PromoStoriesContainer");
    }

    public static void sanitizePost(Object post) {
        if (post == null) return;
        try {
            Field fz = post.getClass().getDeclaredField("z");
            fz.setAccessible(true);
            Object attaches = fz.get(post);
            if (attaches instanceof List) {
                List<?> list = (List<?>) attaches;
                ArrayList<Object> cleaned = new ArrayList<>(list.size());
                boolean modified = false;
                for (Object item : list) {
                    if (item == null) continue;

                    Object actualAttach = unwrapAttachment(item);
                    String aName = actualAttach.getClass().getName();

                    // Remove standalone ad attachments; mini-app snippets and action buttons are set by
                    // the post's author, so they stay
                    if (aName.contains("ShitAttachment")) {
                        modified = true;
                        continue;
                    }

                    // If it is a VideoAttachment (or VideoSnippetAttachment):
                    // Strip the attached ShitAttachment (field h) which displays ad cards below video
                    if (aName.contains("VideoAttachment") || aName.contains("VideoSnippetAttachment")) {
                        try {
                            Field fh = actualAttach.getClass().getDeclaredField("h");
                            fh.setAccessible(true);
                            if (fh.get(actualAttach) != null) {
                                fh.set(actualAttach, null);
                                modified = true;
                            }
                        } catch (Throwable ignored) {}

                        try {
                            Field fk = actualAttach.getClass().getDeclaredField("k");
                            fk.setAccessible(true);
                            Object vf = fk.get(actualAttach);
                            if (vf != null) {
                                sanitizeVideoFile(vf);
                            }
                        } catch (Throwable ignored) {}
                    }

                    cleaned.add(item);
                }
                if (modified) {
                    fz.set(post, cleaned);
                }
            }
        } catch (Throwable ignored) {}
    }

    public static void sanitizeVideoFile(Object vf) {
        if (vf == null) return;
        try {
            // a0: InstreamAd
            try {
                Field fa0 = vf.getClass().getDeclaredField("a0");
                fa0.setAccessible(true);
                fa0.set(vf, null);
            } catch (Throwable ignored) {}

            // c0: VideoAdInfo
            try {
                Field fc0 = vf.getClass().getDeclaredField("c0");
                fc0.setAccessible(true);
                fc0.set(vf, null);
            } catch (Throwable ignored) {}

            // d0: OrdAdInfo
            try {
                Field fd0 = vf.getClass().getDeclaredField("d0");
                fd0.setAccessible(true);
                fd0.set(vf, null);
            } catch (Throwable ignored) {}
        } catch (Throwable ignored) {}
    }

    /**
     * Filters advertising, promo, and spam items from VK newsfeed.
     *
     * @param entries Original list of feed entries (List<NewsEntry>)
     * @return Filtered list with all ad entries removed
     */
    public static List<?> filterNewsfeedList(List<?> entries) {
        if (entries == null) {
            return null;
        }

        ArrayList<Object> filtered = new ArrayList<>(entries.size());
        for (Object item : entries) {
            if (item == null || isAdItem(item)) {
                continue;
            }

            sanitizePost(item);
            filtered.add(item);
        }

        return filtered;
    }

    /**
     * Filters promotional and advertisement widgets from the SuperApp / Services tab.
     */
    public static List<?> filterSuperAppWidgets(List<?> widgets) {
        if (widgets == null) {
            return null;
        }

        ArrayList<Object> filtered = new ArrayList<>(widgets.size());
        for (Object w : widgets) {
            if (w == null || isSuperAppAdWidget(w)) {
                continue;
            }
            filtered.add(w);
        }
        return filtered;
    }

    private static boolean isSuperAppAdWidget(Object w) {
        if (w == null) return false;
        String name = w.getClass().getName();
        if (name.contains("PromoWidget")
                || name.contains("VideoBannerWidget")
                || name.contains("AdsEasyPromote")
                || name.contains("PromoDto")
                || name.contains("BannerView")
                || name.contains("AdBanner")) {
            return true;
        }
        try {
            Method getType = w.getClass().getMethod("getType");
            Object type = getType.invoke(w);
            if (type != null) {
                String typeStr = type.toString().toLowerCase();
                if (typeStr.contains("promo") || typeStr.contains("banner") || typeStr.contains("ad")) {
                    return true;
                }
            }
        } catch (Throwable ignored) {}
        try {
            String repr = w.toString().toLowerCase();
            if (repr.contains("promowidget") || repr.contains("videobanner") || repr.contains("advertisement")) {
                return true;
            }
        } catch (Throwable ignored) {}
        return false;
    }

    /**
     * Filters promotional banner blocks from VK Catalog (Music, Video, etc.).
     */
    public static List<?> filterCatalogBlocks(List<?> blocks) {
        if (blocks == null) {
            return null;
        }

        ArrayList<Object> filtered = new ArrayList<>(blocks.size());
        for (Object b : blocks) {
            if (b == null || isCatalogAdBlock(b)) {
                continue;
            }
            filtered.add(b);
        }
        return filtered;
    }

    private static boolean isCatalogAdBlock(Object b) {
        if (b == null) return false;
        String name = b.getClass().getName();
        if (name.contains("Banner") || name.contains("Promo") || name.contains("AdBlock")) {
            return true;
        }
        try {
            Field fc = b.getClass().getDeclaredField("c");
            fc.setAccessible(true);
            Object cVal = fc.get(b);
            if (cVal != null) {
                String cName = cVal.toString().toUpperCase();
                if (cName.contains("BANNER") || cName.contains("AD_BLOCK") || cName.contains("ADS")) {
                    return true;
                }
            }
        } catch (Throwable ignored) {}
        try {
            String repr = b.toString().toLowerCase();
            if (repr.contains("catalog_banners") || repr.contains("ad_blocks") || repr.contains("banner")) {
                return true;
            }
        } catch (Throwable ignored) {}
        return false;
    }
}
