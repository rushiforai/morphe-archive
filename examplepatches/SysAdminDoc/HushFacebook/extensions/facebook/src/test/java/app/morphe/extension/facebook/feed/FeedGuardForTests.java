/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.feed;

import com.facebook.graphql.modelutil.BaseModelWithTree;
import com.facebook.graphservice.tree.TreeJNI;

import java.util.Arrays;
import java.util.Collection;
import java.util.List;

/**
 * The feed guard with both feed patches in, for a test outside this package. A test JVM has no
 * patched {@code SettingsStatus}, so the public guard would hide nothing whatever the switches say.
 * The GenAI reel filter's stub is unpatched there too, so its page filters take a stand-in finder.
 */
public final class FeedGuardForTests {
    private FeedGuardForTests() {
    }

    /** Stands in for the reel model class the patch names; the filter finds it in an item's field by type. */
    public static final class ReelModel {
        final Object attribution;

        public ReelModel(Object attribution) {
            this.attribution = attribution;
        }
    }

    /** An item of the Reels collection holding a reel model, as the Reels tab's items do. */
    public static final class ReelItem {
        final Object model;

        public ReelItem(Object model) {
            this.model = model;
        }
    }

    /** A reel model whose GenAI attribution carries the detected flag set to [flagged]. */
    public static ReelModel reelModel(boolean flagged) {
        return new ReelModel(new TreeJNI(GenAiReelFilter.ATTRIBUTION_TYPE).holding(GenAiReelFilter.DETECTED_FLAG, flagged));
    }

    /** Whether the reel page filter, with the patch's finder standing in, takes [item] out of a page. */
    public static boolean hidesAiReel(Object item) {
        Collection<?> kept = GenAiReelFilter.withoutAiReels(Arrays.asList(new Object(), item), ReelModel.class.getName(),
                model -> ((ReelModel) model).attribution, GenAiLabel.PATCHED);
        return !kept.contains(item);
    }

    /** The reel section filter with the patch's finder standing in, over [page]. */
    public static List<?> aiReelSections(List<?> page) {
        return GenAiReelFilter.withoutAiSections(page, ReelModel.class.getName(),
                model -> ((ReelModel) model).attribution, GenAiLabel.PATCHED);
    }

    public static boolean hides(Object category, Object feedUnit) {
        return FeedFilter.hideEdge(category, feedUnit, true, true);
    }

    /** The swap guard with both feed patches in: whether an edge swapped in over another stays out. */
    public static boolean swapHides(Object category, Object feedUnit) {
        return FeedFilter.hideSwappedEdge(category, feedUnit, true, true);
    }

    /**
     * The guard with the GenAI patch in as well. A test JVM has no patched accessor either, so any
     * story's GenAI info is {@code detectedInfo}, and no story has a recommendation context.
     */
    public static boolean hides(Object category, Object feedUnit, Object detectedInfo) {
        return FeedFilter.hideEdge(category, feedUnit, true, true, story -> null, true, story -> detectedInfo);
    }

    /**
     * The guard with the GenAI patch in, where any story's detected-AI info is {@code detectedInfo}
     * and its creator AI label info is {@code selfDisclosureInfo}.
     */
    public static boolean hidesLabelled(Object category, Object feedUnit, Object detectedInfo, Object selfDisclosureInfo) {
        return FeedFilter.hideEdge(category, feedUnit, true, true, story -> null, true, story -> detectedInfo, false,
                ShowcaseType.PATCHED, false, PostText.MESSAGE, PostText.ATTACHED, story -> selfDisclosureInfo);
    }

    /** The guard with both feed patches in, where any story's recommendation context is {@code context}. */
    public static boolean hidesRecommended(Object category, Object feedUnit, Object context) {
        return FeedFilter.hideEdge(category, feedUnit, true, true, story -> context, false, GenAiLabel.PATCHED);
    }

    /** The guard with the reels patch in, and none of the story flag rules. */
    public static boolean hidesReels(Object category, Object feedUnit) {
        return FeedFilter.hideEdge(category, feedUnit, true, true, story -> null, false, GenAiLabel.PATCHED, true);
    }

    /**
     * The guard with the reels patch in, where the showcase stub answers [storyType] for a unit
     * whose type name is ShowcaseFeedUnit.
     */
    public static boolean hidesShowcaseReels(Object category, Object storyType) {
        return FeedFilter.hideEdge(category, new TypedFeedUnit(ShowcaseType.UNIT_TYPE), true, true, story -> null,
                false, GenAiLabel.PATCHED, true, unit -> storyType);
    }

    /**
     * A row of Stories between posts, as Facebook's Discover unit sees it: a model answering
     * DiscoverFeedUnit whose is_unconnected_mbsu is [unconnected], true for "Stories you might like".
     */
    public static BaseModelWithTree storiesRow(boolean unconnected) {
        return new BaseModelWithTree(FeedFilter.DISCOVER_UNIT_TYPE) { }.with(FeedFilter.UNCONNECTED_STORIES_FLAG, unconnected);
    }

    /**
     * The guard with the word filter's patch in, and none of the story flag rules, where any story's
     * message is {@code message} and no story shares another. The hide list is whatever the test saved.
     */
    public static boolean hidesByWords(Object category, Object feedUnit, Object message) {
        return FeedFilter.hideEdge(category, feedUnit, true, true, story -> null, false, GenAiLabel.PATCHED, false,
                ShowcaseType.PATCHED, true, story -> message, story -> null);
    }

    /** A story's message, of the type Facebook's posts carry, holding [text]. */
    public static BaseModelWithTree postText(String text) {
        return new BaseModelWithTree(PostText.TEXT_TYPE_TAG).with(PostText.TEXT_FIELD, text);
    }

    /** GenAI info of the type Facebook's detection writes, with its flag set to [flagged]. */
    public static BaseModelWithTree detectedInfo(boolean flagged) {
        return new BaseModelWithTree(GenAiLabel.DETECTED_INFO_TYPE_TAG).with(GenAiLabel.DETECTED_FLAG, flagged);
    }

    /** A creator AI label info of the type Facebook writes, with its flag set to [labelled]. */
    public static BaseModelWithTree selfDisclosureInfo(boolean labelled) {
        return new BaseModelWithTree(GenAiLabel.SELF_DISCLOSURE_INFO_TYPE_TAG).with(GenAiLabel.SELF_DISCLOSED_FLAG, labelled);
    }

    /** A story's recommendation context, with Facebook's recommendation flag set to [recommended]. */
    public static BaseModelWithTree recommendationContext(boolean recommended) {
        return new BaseModelWithTree(RecommendationLabel.FLAG.modelTypeTag)
                .with(RecommendationLabel.RECOMMENDED_FLAG, recommended);
    }
}
