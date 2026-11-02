package app.morphe.extension.vk.ad;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

public class FeedAdsFilter {

    private static volatile boolean postFieldsResolved = false;
    private static Field postMarkedAsAdField = null;
    private static Field postAdMarkerField = null;
    private static Field postEasyPromoteField = null;
    private static Field postRepostField = null;
    private static Field postAttachmentsField = null;

    private static synchronized void resolvePostFields(Class<?> clazz) {
        if (postFieldsResolved) return;
        try {
            Field[] fields = clazz.getDeclaredFields();
            Field prevBoolean = null;
            Field prevString = null;

            for (Field f : fields) {
                f.setAccessible(true);
                Class<?> type = f.getType();

                if (type == boolean.class) {
                    prevBoolean = f;
                } else if (type == String.class) {
                    prevString = f;
                } else if (type == clazz) {
                    postRepostField = f;
                } else if (List.class.isAssignableFrom(type)) {
                    if (postAttachmentsField == null) {
                        postAttachmentsField = f;
                    }
                } else if (type.getName().endsWith("EasyPromote")) {
                    postEasyPromoteField = f;
                    if (prevBoolean != null) {
                        postMarkedAsAdField = prevBoolean;
                    }
                    if (prevString != null) {
                        postAdMarkerField = prevString;
                    }
                }
            }

            // Fallback for known VK 8.201 layout if not dynamically found
            if (postMarkedAsAdField == null) {
                try {
                    Field fF = clazz.getDeclaredField("F");
                    fF.setAccessible(true);
                    if (fF.getType() == boolean.class) {
                        postMarkedAsAdField = fF;
                    }
                } catch (Throwable ignored) {}
            }
            if (postAdMarkerField == null) {
                try {
                    Field fH = clazz.getDeclaredField("H");
                    fH.setAccessible(true);
                    if (fH.getType() == String.class) {
                        postAdMarkerField = fH;
                    }
                } catch (Throwable ignored) {}
            }
            if (postRepostField == null) {
                try {
                    Field fD = clazz.getDeclaredField("D");
                    fD.setAccessible(true);
                    postRepostField = fD;
                } catch (Throwable ignored) {}
            }
            if (postAttachmentsField == null) {
                try {
                    Field fz = clazz.getDeclaredField("z");
                    fz.setAccessible(true);
                    postAttachmentsField = fz;
                } catch (Throwable ignored) {}
            }
        } catch (Throwable ignored) {}
        postFieldsResolved = true;
    }

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
                if (!postFieldsResolved) {
                    resolvePostFields(item.getClass());
                }

                // 1. Check markedAsAd (field F in 8.201)
                if (postMarkedAsAdField != null) {
                    try {
                        if (postMarkedAsAdField.getBoolean(item)) {
                            return true;
                        }
                    } catch (Throwable ignored) {}
                }

                // 2. Check easyPromote block
                if (postEasyPromoteField != null) {
                    try {
                        if (postEasyPromoteField.get(item) != null) {
                            return true;
                        }
                    } catch (Throwable ignored) {}
                }

                // 3. Check adMarker text (field H in 8.201)
                if (postAdMarkerField != null) {
                    try {
                        Object marker = postAdMarkerField.get(item);
                        if (marker != null) {
                            String s = marker.toString().toLowerCase();
                            if (s.contains("реклама") || s.contains("promoted")) {
                                return true;
                            }
                        }
                    } catch (Throwable ignored) {}
                }

                // 4. Check repost
                if (postRepostField != null) {
                    try {
                        Object repost = postRepostField.get(item);
                        if (repost != null && repost != item && isAdItem(repost)) {
                            return true;
                        }
                    } catch (Throwable ignored) {}
                }

                // 5. Check ShitAttachment in attachments
                Field attachField = postAttachmentsField;
                if (attachField == null) {
                    try {
                        attachField = item.getClass().getDeclaredField("z");
                        attachField.setAccessible(true);
                    } catch (Throwable ignored) {}
                }
                if (attachField != null) {
                    try {
                        Object attaches = attachField.get(item);
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
                }
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
                || className.endsWith(".RecommendedMiniAppEntry")
                || className.endsWith(".DzenArticlesBlock")
                || className.endsWith(".DzenNews")
                || className.endsWith(".DzenStory")
                || className.endsWith(".ShitAttachment")
                || className.endsWith(".StoriesAds")
                || className.endsWith(".MyTargetAdStoriesContainer")
                || className.endsWith(".PromoStoriesContainer");
    }

    public static void sanitizePost(Object post) {
        if (post == null) return;
        try {
            if (!postFieldsResolved) {
                resolvePostFields(post.getClass());
            }
            Field fz = postAttachmentsField;
            if (fz == null) {
                fz = post.getClass().getDeclaredField("z");
                fz.setAccessible(true);
            }
            Object attaches = fz.get(post);
            if (attaches instanceof List) {
                List<?> list = (List<?>) attaches;
                ArrayList<Object> cleaned = new ArrayList<>(list.size());
                boolean modified = false;
                for (Object item : list) {
                    if (item == null) continue;

                    Object actualAttach = unwrapAttachment(item);
                    String aName = actualAttach.getClass().getName();

                    // Remove standalone promo/ad attachments
                    if (aName.contains("ShitAttachment")
                            || aName.contains("MiniAppSnippetAttachment")
                            || aName.contains("ActionButtonAttachment")) {
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
            if (b == null || isCatalogAdBlock(b) || app.morphe.extension.vk.friends.FriendsFilter.isFriendSuggestionsBlock(b)) {
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
