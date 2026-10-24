/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.timeline;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import com.tumblr.rumblr.model.TimelineObject;
import com.tumblr.rumblr.model.TimelineObjectType;
import com.tumblr.rumblr.model.post.blocks.ImageBlock;
import com.tumblr.rumblr.model.post.blocks.TextBlock;
import com.tumblr.rumblr.model.post.blocks.VideoBlock;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.Arrays;
import java.util.Collections;
import java.util.EnumSet;
import java.util.List;

import app.hushtumblr.extension.shared.SettingsContextRule;
import app.hushtumblr.extension.shared.diagnostics.HookStatus;
import app.hushtumblr.extension.shared.settings.HushTumblrPause;
import app.hushtumblr.extension.shared.settings.PauseForTests;
import app.hushtumblr.extension.tumblr.settings.FamilyNames;
import app.hushtumblr.extension.tumblr.settings.PatchFamily;
import app.hushtumblr.extension.tumblr.settings.PatchFamilyForTests;
import app.hushtumblr.extension.tumblr.settings.Settings;
import app.hushtumblr.extension.tumblr.settings.TextSettings;

/** What the post switches take out of a page: reblogs, posts by kind, and posts with a hidden word. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class PostRulesTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before
    public void everyPatchIsIn() {
        PatchFamilyForTests.inBuild(EnumSet.allOf(PatchFamily.class));
        PatchFamilyForTests.capabilities(EnumSet.allOf(PatchFamily.Capability.class));
        Settings.HIDE_ADS.save(false);
    }

    @After
    public void restore() {
        PatchFamilyForTests.inBuild(null);
        PatchFamilyForTests.capabilities(null);
        Settings.HIDE_ADS.resetToDefault();
        Settings.HIDE_REBLOGS.resetToDefault();
        Settings.KEEP_TAGGED_REBLOGS.resetToDefault();
        Settings.KEEP_REBLOGS_WITH_CONTENT.resetToDefault();
        Settings.HIDE_VIDEO_POSTS.resetToDefault();
        Settings.HIDE_PHOTO_POSTS.resetToDefault();
        Settings.HIDE_TEXT_POSTS.resetToDefault();
        Settings.HIDE_POSTS_WITH_WORDS.resetToDefault();
        Settings.WORDS_CURRENT_TEXT.resetToDefault();
        Settings.WORDS_REBLOG_TRAIL.resetToDefault();
        Settings.WORDS_TAGS.resetToDefault();
        Settings.WORDS_SUMMARY.resetToDefault();
        Settings.HIDE_FILTERED_POSTS.resetToDefault();
        TextSettings.HIDDEN_WORDS.resetToDefault();
        TextSettings.ALLOWED_WORDS.resetToDefault();
        HookStatus.clear();
    }

    private static final TimelineObject TEXT = TimelineItems.postWith(new TextBlock("hello"));
    private static final TimelineObject PHOTO = TimelineItems.postWith(new ImageBlock(), new TextBlock("caption"));
    private static final TimelineObject VIDEO = TimelineItems.postWith(new ImageBlock(), new VideoBlock());
    private static final TimelineObject YOUTUBE = TimelineItems.postWith(new VideoBlock.YouTube());

    private static List<?> shown(Object... items) {
        return TimelineFilter.filter(Arrays.asList(items));
    }

    @Test
    public void withEverySwitchOffEveryPostStays() {
        List<Object> page = Arrays.asList(TEXT, PHOTO, VIDEO,
                TimelineItems.filteredPost(Collections.singletonList("spoilers"), null));
        assertSame(page, TimelineFilter.filter(page));
    }

    /** A post Tumblr covers for a filtered tag or word goes, and one with an empty note stays. */
    @Test
    public void hideFilteredPostsTakesOutWhatTumblrWouldCover() {
        Settings.HIDE_FILTERED_POSTS.save(true);
        TimelineObject tagged = TimelineItems.filteredPost(Collections.singletonList("spoilers"), Collections.emptyList(),
                new TextBlock("covered"));
        TimelineObject worded = TimelineItems.filteredPost(null, Collections.singletonList("finale"), new ImageBlock());
        TimelineObject empty = TimelineItems.filteredPost(Collections.emptyList(), Collections.singletonList(null));
        HookStatus.clear();
        assertEquals(Arrays.asList(TEXT, empty, PHOTO), shown(TEXT, tagged, empty, worded, PHOTO));
        String report = String.join(" | ", HookStatus.report());
        assertTrue(report, report.contains(FamilyNames.HIDE_FILTERED_POSTS) && report.contains("post removed 2"));
    }

    /** Without the bridge's capability the switch does nothing, even when it's on. */
    @Test
    public void hideFilteredPostsNeedsItsBridge() {
        Settings.HIDE_FILTERED_POSTS.save(true);
        PatchFamilyForTests.capabilities(EnumSet.complementOf(EnumSet.of(PatchFamily.Capability.FILTERED_POSTS)));
        List<Object> page = Arrays.asList(TEXT, TimelineItems.filteredPost(Collections.singletonList("spoilers"), null));
        assertSame(page, TimelineFilter.filter(page));
    }

    /** Any video makes a video post, pictures without one a photo post, and anything else is text. */
    @Test
    public void aPostsKindComesFromAllItsBlocks() {
        Settings.HIDE_VIDEO_POSTS.save(true);
        assertEquals(Arrays.asList(TEXT, PHOTO), shown(TEXT, PHOTO, VIDEO, YOUTUBE));
        Settings.HIDE_VIDEO_POSTS.save(false);
        Settings.HIDE_PHOTO_POSTS.save(true);
        assertEquals(Arrays.asList(TEXT, VIDEO, YOUTUBE), shown(TEXT, PHOTO, VIDEO, YOUTUBE));
        Settings.HIDE_PHOTO_POSTS.save(false);
        Settings.HIDE_TEXT_POSTS.save(true);
        HookStatus.clear();
        assertEquals(Arrays.asList(PHOTO, VIDEO, YOUTUBE), shown(TEXT, PHOTO, VIDEO, YOUTUBE));
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains(FamilyNames.HIDE_TEXT_POSTS) && report.contains("post removed 1"));
    }

    /** A reblog's kind includes the post it reblogs, so a text comment on a video is a video post. */
    @Test
    public void aReblogsTrailCountsTowardItsKind() {
        Settings.HIDE_VIDEO_POSTS.save(true);
        TimelineObject reblog = TimelineItems.reblogOf(Collections.singletonList(new VideoBlock()), new TextBlock("lol"));
        assertEquals(Collections.singletonList(TEXT), shown(reblog, TEXT));
    }

    @Test
    public void aPostWithNoBlocksHasNoKindAndStays() {
        Settings.HIDE_TEXT_POSTS.save(true);
        TimelineObject empty = TimelineItems.postWith();
        assertEquals(Collections.singletonList(empty), shown(empty));
    }

    @Test
    public void hideReblogsTakesOutReblogsAndLeavesOriginalPosts() {
        Settings.HIDE_REBLOGS.save(true);
        TimelineObject reblog = TimelineItems.reblogOf(Collections.singletonList(new TextBlock("first")));
        assertEquals(Arrays.asList(TEXT, PHOTO), shown(TEXT, reblog, PHOTO));
    }

    @Test
    public void taggedReblogExceptionStartsOffAndOnlyTheCurrentPostsTagsCanKeepIt() {
        assertFalse(Settings.KEEP_TAGGED_REBLOGS.get());
        Settings.HIDE_REBLOGS.save(true);
        List<?> taggedTrail = Arrays.asList(new Object(), new HushTrail() {
            @Override public List<?> hushContent() { return Collections.singletonList(new TextBlock("original")); }
            public List<String> tags() { return Collections.singletonList("original authors tag"); }
        });
        TimelineObject tagged = new TimelineObject(new TimelineItems.Post(null, taggedTrail,
                Collections.singletonList("my comment"), null, "100"), false);
        TimelineObject ancestorTagsOnly = new TimelineObject(new TimelineItems.Post(null, taggedTrail, null, null, "100"), false);
        TimelineObject whitespace = new TimelineObject(new TimelineItems.Post(null, taggedTrail,
                Arrays.asList(null, "", " \t\n", "\u00a0\u2003", new Object()), null, "100"), false);
        assertEquals(Collections.singletonList(TEXT), shown(tagged, ancestorTagsOnly, whitespace, TEXT));
        Settings.KEEP_TAGGED_REBLOGS.save(true);
        assertEquals(Arrays.asList(tagged, TEXT), shown(tagged, ancestorTagsOnly, whitespace, TEXT));
    }

    @Test
    public void retainingATaggedReblogStillAppliesAdsPostKindsAndWordRules() {
        Settings.HIDE_REBLOGS.save(true);
        Settings.KEEP_TAGGED_REBLOGS.save(true);
        HushTrail trail = () -> Collections.singletonList(new TextBlock("original"));
        TimelineItems.Post photo = new TimelineItems.Post(Collections.singletonList(new ImageBlock()),
                Collections.singletonList(trail), Collections.singletonList("my tag"), null, "100");
        TimelineObject taggedPhoto = new TimelineObject(photo, false);
        TimelineObject paidPhoto = new TimelineObject(photo, true);
        Settings.HIDE_ADS.save(true);
        assertEquals(Arrays.asList(taggedPhoto, TEXT), shown(taggedPhoto, paidPhoto, TEXT));
        Settings.HIDE_PHOTO_POSTS.save(true);
        assertEquals(Collections.singletonList(TEXT), shown(taggedPhoto, TEXT));
        Settings.HIDE_PHOTO_POSTS.save(false);
        Settings.HIDE_POSTS_WITH_WORDS.save(true);
        TextSettings.HIDDEN_WORDS.save("original");
        assertEquals(Collections.singletonList(TEXT), shown(taggedPhoto, TEXT));
        PauseForTests.pause(HushTumblrPause.Reason.SWITCH);
        try {
            List<Object> page = Arrays.asList(taggedPhoto, paidPhoto, TEXT);
            assertSame(page, TimelineFilter.filter(page));
        } finally {
            PauseForTests.resume();
        }
    }

    @Test
    public void aTaggedReblogExceptionDoesNotActivateTheRuleByItself() {
        Settings.KEEP_TAGGED_REBLOGS.save(true);
        List<Object> page = Arrays.asList(TEXT, TimelineItems.reblogOf(Collections.singletonList(new TextBlock("original"))));
        assertSame(page, TimelineFilter.filter(page));
    }

    @Test
    public void addedContentExceptionStartsOffAndOnlyTheCurrentPostsOwnBlocksCanKeepIt() {
        assertFalse(Settings.KEEP_REBLOGS_WITH_CONTENT.defaultValue);
        assertFalse(Settings.KEEP_REBLOGS_WITH_CONTENT.get());
        Settings.HIDE_REBLOGS.save(true);
        List<HushTrail> trail = Collections.singletonList(() -> Collections.singletonList(new TextBlock("original")));
        TimelineObject added = TimelineItems.reblogOf(Collections.singletonList(new TextBlock("original")),
                new TextBlock("my comment"));
        TimelineObject addedWithoutATrail = new TimelineObject(new TimelineItems.Post(
                Collections.singletonList(new ImageBlock()), null, null, null, "100"), false);
        TimelineObject trailOnly = TimelineItems.reblogOf(Collections.singletonList(new TextBlock("original")));
        TimelineObject noContent = new TimelineObject(new TimelineItems.Post(null, trail, null, null, "100"), false);
        TimelineObject nullBlocks = new TimelineObject(new TimelineItems.Post(Arrays.asList((Object) null, null),
                trail, null, null, "100"), false);
        TimelineObject taggedOnly = new TimelineObject(new TimelineItems.Post(Collections.emptyList(), trail,
                Collections.singletonList("my tag"), null, "100"), false);
        assertEquals(Collections.singletonList(TEXT),
                shown(added, addedWithoutATrail, trailOnly, noContent, nullBlocks, taggedOnly, TEXT));
        Settings.KEEP_REBLOGS_WITH_CONTENT.save(true);
        assertEquals(Arrays.asList(added, addedWithoutATrail, TEXT),
                shown(added, addedWithoutATrail, trailOnly, noContent, nullBlocks, taggedOnly, TEXT));
        // Each exception keeps its own reblogs, and neither widens the other.
        Settings.KEEP_TAGGED_REBLOGS.save(true);
        assertEquals(Arrays.asList(added, addedWithoutATrail, taggedOnly, TEXT),
                shown(added, addedWithoutATrail, trailOnly, noContent, nullBlocks, taggedOnly, TEXT));
        Settings.KEEP_REBLOGS_WITH_CONTENT.save(false);
        assertEquals(Arrays.asList(taggedOnly, TEXT),
                shown(added, addedWithoutATrail, trailOnly, noContent, nullBlocks, taggedOnly, TEXT));
    }

    @Test
    public void keepingAReblogWithAddedContentStillAppliesAdsPostKindsAndWordRules() {
        Settings.HIDE_REBLOGS.save(true);
        Settings.KEEP_REBLOGS_WITH_CONTENT.save(true);
        List<HushTrail> trail = Collections.singletonList(() -> Collections.singletonList(new TextBlock("original")));
        TimelineItems.Post photo = new TimelineItems.Post(Collections.singletonList(new ImageBlock()), trail, null, null, "100");
        TimelineItems.Post video = new TimelineItems.Post(Collections.singletonList(new VideoBlock()), trail, null, null, "100");
        TimelineItems.Post text = new TimelineItems.Post(Collections.singletonList(new TextBlock("mine")), trail, null, null, "100");
        for (TimelineItems.Post kept : Arrays.asList(photo, video, text)) assertNull(PostRules.now().removes(kept));
        TimelineObject keptPhoto = new TimelineObject(photo, false);
        TimelineObject paidPhoto = new TimelineObject(photo, true);
        Settings.HIDE_ADS.save(true);
        assertEquals(Arrays.asList(keptPhoto, TEXT), shown(keptPhoto, paidPhoto, TEXT));
        Settings.HIDE_PHOTO_POSTS.save(true);
        Settings.HIDE_VIDEO_POSTS.save(true);
        Settings.HIDE_TEXT_POSTS.save(true);
        assertEquals(FamilyNames.HIDE_PHOTO_POSTS, PostRules.now().removes(photo));
        assertEquals(FamilyNames.HIDE_VIDEO_POSTS, PostRules.now().removes(video));
        assertEquals(FamilyNames.HIDE_TEXT_POSTS, PostRules.now().removes(text));
        Settings.HIDE_PHOTO_POSTS.save(false);
        Settings.HIDE_VIDEO_POSTS.save(false);
        Settings.HIDE_TEXT_POSTS.save(false);
        Settings.HIDE_POSTS_WITH_WORDS.save(true);
        TextSettings.HIDDEN_WORDS.save("original");
        assertEquals(FamilyNames.HIDE_POSTS_WITH_WORDS, PostRules.now().removes(photo));
        assertEquals(Collections.singletonList(TEXT), shown(keptPhoto, TEXT));
        PauseForTests.pause(HushTumblrPause.Reason.SWITCH);
        try {
            List<Object> page = Arrays.asList(keptPhoto, paidPhoto, TEXT);
            assertSame(page, TimelineFilter.filter(page));
        } finally {
            PauseForTests.resume();
        }
    }

    @Test
    public void anAddedContentExceptionDoesNotActivateTheRuleByItself() {
        Settings.KEEP_REBLOGS_WITH_CONTENT.save(true);
        assertNull(PostRules.now());
        List<Object> page = Arrays.asList(TEXT, TimelineItems.reblogOf(Collections.singletonList(new TextBlock("original")),
                new TextBlock("mine")));
        assertSame(page, TimelineFilter.filter(page));
    }

    /** Without the reblog hook in the build, Hide reblogs and its exceptions answer off together. */
    @Test
    public void withoutTheReblogHookTheAddedContentExceptionIsOffToo() {
        Settings.HIDE_REBLOGS.save(true);
        Settings.KEEP_REBLOGS_WITH_CONTENT.save(true);
        Settings.HIDE_TEXT_POSTS.save(true);
        PatchFamilyForTests.capabilities(EnumSet.complementOf(EnumSet.of(PatchFamily.Capability.REBLOG_POSTS)));
        PostRules rules = PostRules.now();
        assertFalse(rules.reblogs);
        assertFalse(rules.keepReblogsWithContent);
        TimelineObject photoReblog = TimelineItems.reblogOf(Collections.singletonList(new TextBlock("original")), new ImageBlock());
        TimelineObject textReblog = TimelineItems.reblogOf(Collections.singletonList(new TextBlock("original")), new TextBlock("mine"));
        assertNull(rules.removes(photoReblog.getData()));
        assertEquals(FamilyNames.HIDE_TEXT_POSTS, rules.removes(textReblog.getData()));
    }

    /**
     * A campaign in your own Blaze dashboard carries your post, but it isn't a post in a feed, so no
     * post switch takes it out. The same posts in a feed go, as the control.
     */
    @Test
    public void aBlazeCampaignIsLeftAloneByThePostSwitches() {
        Settings.HIDE_REBLOGS.save(true);
        Settings.HIDE_VIDEO_POSTS.save(true);
        Settings.HIDE_TEXT_POSTS.save(true);
        TimelineObject reblog = TimelineItems.reblogOf(Collections.singletonList(new TextBlock("first")));
        TimelineObject campaign = TimelineItems.blazed(VIDEO);
        TimelineObject reblogCampaign = TimelineItems.blazed(reblog);
        TimelineObject textCampaign = TimelineItems.blazed(TEXT);
        assertEquals(Arrays.asList(campaign, reblogCampaign, textCampaign),
                shown(campaign, VIDEO, reblogCampaign, reblog, textCampaign, TEXT));
    }

    @Test
    public void wordsMatchWholeWordsIgnoringCaseInTextTrailTagsAndSummary() {
        Settings.HIDE_POSTS_WITH_WORDS.save(true);
        TextSettings.HIDDEN_WORDS.save("Cat\n  big news , ");
        TimelineObject inText = TimelineItems.postWith(new TextBlock("My CAT, again."));
        TimelineObject inTrail = TimelineItems.reblogOf(Collections.singletonList(new TextBlock("BIG NEWS: soon")),
                new TextBlock("lol"));
        TimelineObject inTag = TimelineItems.postTagged(null, "cat");
        TimelineObject inSummary = TimelineItems.postTagged("a cat");
        TimelineObject partOfAWord = TimelineItems.postWith(new TextBlock("category concatenate"));
        assertEquals(Collections.singletonList(partOfAWord), shown(inText, inTrail, inTag, inSummary, partOfAWord));
    }

    @Test
    public void anEmptyWordListHidesNothing() {
        Settings.HIDE_POSTS_WITH_WORDS.save(true);
        TextSettings.HIDDEN_WORDS.save(" ,\n ");
        List<Object> page = Arrays.asList(TEXT, PHOTO);
        assertSame(page, TimelineFilter.filter(page));
    }

    @Test
    public void theWordListIsOneEntryALineOrByCommasTrimmedAndOnce() {
        assertEquals(Arrays.asList("cat", "big news", "dog"), PostRules.wordList("Cat\r\n big news,dog, CAT,,"));
        assertTrue(PostRules.wordList("").isEmpty());
        assertTrue(PostRules.containsWord("#cat pics", "cat"));
        assertTrue(PostRules.containsWord("cat", "cat"));
        assertFalse(PostRules.containsWord("cats", "cat"));
        assertFalse(PostRules.containsWord("bobcat", "cat"));
    }

    @Test @Config(sdk = {26, 36, 37})
    public void canonicallyEquivalentWordsMatchAndShareOneParsedRule() {
        String saved = "Caf\u00e9, CAFE\u0301";
        List<String> words = PostRules.wordList(saved);
        assertEquals(Collections.singletonList("caf\u00e9"), words);
        assertSame(words, PostRules.wordList(saved));
        assertTrue(PostRules.matches("a CAF\u00c9.", words));
        assertTrue(PostRules.matches("a CAFE\u0301.", words));
        assertFalse(PostRules.matches("cafe", words));
        assertFalse(PostRules.matches("\uff43\uff41\uff46\uff45\u0301", words));
        assertFalse(PostRules.matches("caf\u00e9", PostRules.wordList("cafe")));
    }

    @Test @Config(sdk = {26, 36, 37})
    public void codePointBoundariesIncludeMarksAndConnectorsAndLeaveEmojiAsSeparators() {
        List<String> words = PostRules.wordList("cat, big news");
        for (String text : Arrays.asList("category", "bobcat", "cat2", "2cat", "cat\u0661",
                "cat\u0338", "\u0338cat", "cat\u0903", "\u20ddcat", "cat_", "_cat", "cat\u203f",
                "cat\ud801\udc00", "\ud801\udc00cat", "big news\ud801\udc00", "\ud801\udc00big news")) {
            assertFalse(text, PostRules.matches(text, words));
        }
        for (String text : Arrays.asList("Cat pics", "my cat.", "(cat)", "#cat", "cat-dog",
                "cat/dog", "\ud83d\ude3acat\ud83d\ude3a", "\ud83d\ude3abig news!")) {
            assertTrue(text, PostRules.matches(text, words));
        }
        assertFalse(PostRules.containsWord("cat", ""));
        assertFalse(PostRules.containsWord("", ""));
        assertFalse(PostRules.matches(null, words));
        assertFalse(PostRules.matches("", words));
    }

    @Test @Config(sdk = {26, 36, 37})
    public void canonicalWordsAndCodePointBoundariesApplyToReblogTrailsToo() {
        Settings.HIDE_POSTS_WITH_WORDS.save(true);
        TextSettings.HIDDEN_WORDS.save("caf\u00e9, cat");
        TimelineObject matching = TimelineItems.reblogOf(Collections.singletonList(new TextBlock("CAFE\u0301!")));
        TimelineObject adjacentLetter = TimelineItems.reblogOf(Collections.singletonList(new TextBlock("cat\ud801\udc00")));
        TimelineObject adjacentMark = TimelineItems.reblogOf(Collections.singletonList(new TextBlock("cat\u0338")));
        assertEquals(Arrays.asList(adjacentLetter, adjacentMark), shown(matching, adjacentLetter, adjacentMark));
    }

    @Test
    public void wordFieldsDistinguishCurrentTextTrailTagsAndSummary() {
        Settings.HIDE_POSTS_WITH_WORDS.save(true);
        TextSettings.HIDDEN_WORDS.save("cat");
        TimelineObject own = TimelineItems.postWith(new TextBlock("cat"));
        TimelineObject trail = TimelineItems.reblogOf(Collections.singletonList(new TextBlock("cat")), new TextBlock("hello"));
        TimelineObject tag = TimelineItems.postTagged(null, "cat");
        TimelineObject summary = TimelineItems.postTagged("cat");
        Settings.WORDS_CURRENT_TEXT.save(false);
        assertEquals(Collections.singletonList(own), shown(own, trail, tag, summary));
        Settings.WORDS_REBLOG_TRAIL.save(false);
        assertEquals(Arrays.asList(own, trail), shown(own, trail, tag, summary));
        Settings.WORDS_TAGS.save(false);
        assertEquals(Arrays.asList(own, trail, tag), shown(own, trail, tag, summary));
        Settings.WORDS_SUMMARY.save(false);
        List<Object> page = Arrays.asList(own, trail, tag, summary);
        assertSame(page, TimelineFilter.filter(page));
        Settings.WORDS_CURRENT_TEXT.save(true);
        assertEquals(Arrays.asList(trail, tag, summary), shown(own, trail, tag, summary));
    }

    @Test
    public void missingWordFieldsStayAndUnselectedFieldsAreNeverRead() {
        Settings.HIDE_POSTS_WITH_WORDS.save(true);
        TextSettings.HIDDEN_WORDS.save("cat");
        TimelineObject missing = new TimelineObject(new TimelineItems.Post(null, Arrays.asList(null, new Object()), null, null, null), false);
        assertEquals(Collections.singletonList(missing), shown(missing));
        Settings.WORDS_REBLOG_TRAIL.save(false);
        Settings.WORDS_TAGS.save(false);
        Settings.WORDS_SUMMARY.save(false);
        TimelineObject readable = new TimelineObject(new TimelineItems.Post(Collections.singletonList(new TextBlock("cat")), null, null, null, null) {
            @Override public List<?> hushTrail() { throw new AssertionError("unselected trail"); }
            @Override public List<?> hushTags() { throw new AssertionError("unselected tags"); }
            @Override public String hushSummary() { throw new AssertionError("unselected summary"); }
        }, false);
        assertTrue(shown(readable).isEmpty());
    }

    @Test @Config(sdk = {26, 36, 37})
    public void allowedWordsUseSelectedFieldsAndCanonicalWholeWordMatching() {
        Settings.HIDE_POSTS_WITH_WORDS.save(true);
        TextSettings.HIDDEN_WORDS.save("cat");
        TextSettings.ALLOWED_WORDS.save("CAF\u00c9");
        TimelineObject kept = TimelineItems.postWith(new TextBlock("cat CAFE\u0301"));
        TimelineObject accent = TimelineItems.postWith(new TextBlock("cat cafe"));
        TimelineObject suffix = TimelineItems.postWith(new TextBlock("cat caf\u00e9_"));
        TimelineObject compatibility = TimelineItems.postWith(new TextBlock("cat \uff43\uff41\uff46\uff45\u0301"));
        TimelineObject tag = new TimelineObject(new TimelineItems.Post(Collections.singletonList(new TextBlock("cat")), null,
                Collections.singletonList("caf\u00e9"), null, null), false);
        assertEquals(Arrays.asList(kept, tag), shown(kept, accent, suffix, compatibility, tag));
        Settings.WORDS_TAGS.save(false);
        assertEquals(Collections.singletonList(kept), shown(kept, tag));
        TextSettings.ALLOWED_WORDS.save("cat");
        assertEquals(Arrays.asList(kept, accent), shown(kept, accent));
        PostRules first = PostRules.now(), second = PostRules.now();
        assertSame(first.words, second.words);
        assertSame(first.allowedWords, second.allowedWords);
    }

    @Test
    public void wordExceptionsNeverRestoreAdsOrPostsHiddenByAnotherCategory() {
        Settings.HIDE_POSTS_WITH_WORDS.save(true);
        TextSettings.HIDDEN_WORDS.save("cat");
        TextSettings.ALLOWED_WORDS.save("hello");
        TimelineObject text = TimelineItems.postWith(new TextBlock("cat hello"));
        TimelineObject reblog = TimelineItems.reblogOf(Collections.singletonList(new TextBlock("cat hello")));
        TimelineObject photo = TimelineItems.postWith(new ImageBlock(), new TextBlock("cat hello"));
        TimelineObject video = TimelineItems.postWith(new VideoBlock(), new TextBlock("cat hello"));
        TimelineObject ad = new TimelineObject(new TimelineItems.Post(Collections.singletonList(new TextBlock("cat hello")),
                null, null, null, null), true);
        Settings.HIDE_ADS.save(true);
        assertEquals(Arrays.asList(text, reblog, photo, video), shown(text, reblog, photo, video, ad));
        Settings.HIDE_REBLOGS.save(true);
        Settings.HIDE_TEXT_POSTS.save(true);
        Settings.HIDE_PHOTO_POSTS.save(true);
        Settings.HIDE_VIDEO_POSTS.save(true);
        assertTrue(shown(text, reblog, photo, video, ad).isEmpty());
        PauseForTests.pause(HushTumblrPause.Reason.SWITCH);
        try {
            List<Object> page = Arrays.asList(text, reblog, photo, video, ad);
            assertSame(page, TimelineFilter.filter(page));
        } finally {
            PauseForTests.resume();
        }
    }

    /** A heading in front of a post the post switches take out heads the posts after it too. */
    @Test
    public void aHeadingStaysWhenThePostAfterItGoes() {
        Settings.HIDE_TEXT_POSTS.save(true);
        TimelineObject heading = TimelineItems.of(TimelineObjectType.TITLE);
        assertEquals(Arrays.asList(heading, PHOTO), shown(heading, TEXT, PHOTO));
    }

    @Test
    public void whilePausedEveryPostStays() {
        Settings.HIDE_TEXT_POSTS.save(true);
        Settings.HIDE_POSTS_WITH_WORDS.save(true);
        TextSettings.HIDDEN_WORDS.save("hello");
        PauseForTests.pause(HushTumblrPause.Reason.SWITCH);
        try {
            List<Object> page = Arrays.asList(TEXT, PHOTO);
            assertSame(page, TimelineFilter.filter(page));
        } finally {
            PauseForTests.resume();
        }
    }

    @Test
    public void aPostThatThrowsIsKeptAndReported() {
        Settings.HIDE_TEXT_POSTS.save(true);
        TimelineObject broken = new TimelineObject(new TimelineItems.Post(null, null, null, null, null) {
            @Override public List<?> hushContent() { throw new IllegalStateException("unreadable"); }
        }, false);
        assertEquals(Collections.singletonList(broken), shown(broken));
        assertEquals(Collections.singletonList("a working 'timeline post' hook (it threw java.lang.IllegalStateException)"),
                HookStatus.missing(FamilyNames.HIDE_TEXT_POSTS));
    }
}
