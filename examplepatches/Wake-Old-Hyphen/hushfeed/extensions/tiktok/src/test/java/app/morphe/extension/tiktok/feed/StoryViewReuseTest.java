package app.morphe.extension.tiktok.feed;

import static org.junit.Assert.*;
import android.view.View;
import java.util.EnumMap;
import java.util.Map;
import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import app.morphe.extension.shared.settings.PausedProcess;
import app.morphe.extension.tiktok.SettingsContextRule;
import app.morphe.extension.tiktok.SignedInUser;
import app.morphe.extension.tiktok.settings.Settings;

/** #233: a native chat holder rebinds its retained AvatarComponentView to another inbox UID. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk=28)
public class StoryViewReuseTest {
    @Rule public final SettingsContextRule context = new SettingsContextRule();
    @org.junit.Before public void signedInReader() { SignedInUser.idForTests="reader-a"; }
    enum Business { LIVE, STORY }
    interface Controller {}
    static final class Opener implements Controller, View.OnClickListener {
        int opens;
        public void onClick(View view) { opens++; }
    }
    static class SharedState {
        final String label = "has_unconsumed_story_";
        final Controller controller;
        SharedState(Controller controller) { this.controller=controller; }
    }
    static final class Unseen extends SharedState {
        Unseen(Controller controller) { super(controller); }
    }
    public static final class Picture extends View {
        String uid;
        Map<Business,Object> business;
        Picture(String uid, Opener opener) {
            super(RuntimeEnvironment.getApplication());
            bind(uid,opener);
        }
        void bind(String uid, Opener opener) {
            this.uid=uid;
            business=new EnumMap<>(Business.class);
            business.put(Business.LIVE,new Object());
            business.put(Business.STORY,new Unseen(opener));
        }
        public Map<Business,Object> getCurrentActiveBusiness() { return business; }
        public String getUid() { return uid; }
    }
    @After public void restore() {
        StoryOverLive.reset();
        Settings.OPEN_STORY_OVER_LIVE.resetToDefault();
        PausedProcess.set(false);
        SignedInUser.idForTests=null;
    }
    @Test public void controlSameBindingStillAlternatesStoryThenNativeLive() {
        Settings.OPEN_STORY_OVER_LIVE.save(true);
        Opener opener=new Opener();
        Picture picture=new Picture("creator-a",opener);
        assertTrue(StoryOverLive.openChatStory(picture));
        assertFalse(StoryOverLive.openChatStory(picture));
        assertEquals(1,opener.opens);
    }
    @Test public void controlANewViewForAnotherUidStartsWithItsStory() {
        Settings.OPEN_STORY_OVER_LIVE.save(true);
        Opener first=new Opener(), second=new Opener();
        assertTrue(StoryOverLive.openChatStory(new Picture("creator-a",first)));
        assertTrue(StoryOverLive.openChatStory(new Picture("creator-b",second)));
        assertEquals(1,second.opens);
    }
    @Test public void aRecycledChatPictureDoesNotSpendAnotherCreatorsFirstStoryTap() {
        Settings.OPEN_STORY_OVER_LIVE.save(true);
        Opener first=new Opener(), second=new Opener();
        Picture picture=new Picture("creator-a",first);
        assertTrue(StoryOverLive.openChatStory(picture));
        picture.bind("creator-b",second);
        assertTrue("creator B's first tap must open B's Story after the native holder rebinds",StoryOverLive.openChatStory(picture));
        assertEquals(1,second.opens);
    }
    @Test public void aReboundUidWithTheSameControllerDoesNotInheritThePreviousCreatorsTap() {
        Settings.OPEN_STORY_OVER_LIVE.save(true);
        Opener first=new Opener();
        Picture picture=new Picture("creator-a",first);
        assertTrue(StoryOverLive.openChatStory(picture));
        picture.uid="creator-b";
        assertTrue("the adapter can retain its Story controller while binding a new UID",StoryOverLive.openChatStory(picture));
        assertEquals(2,first.opens);
    }

    @Test public void anAccountChangeDoesNotReuseAnotherAccountsSecondTap() {
        Settings.OPEN_STORY_OVER_LIVE.save(true);
        Opener opener=new Opener();
        Picture picture=new Picture("creator-a",opener);
        assertTrue(StoryOverLive.openChatStory(picture));
        SignedInUser.idForTests="reader-b";
        assertTrue(StoryOverLive.openChatStory(picture));
        assertEquals(2,opener.opens);
        assertFalse(StoryOverLive.openChatStory(picture));
    }
    @Test public void anUnknownBindingDoesNotMarkAFirstTap() {
        Settings.OPEN_STORY_OVER_LIVE.save(true);
        Opener opener=new Opener();
        Picture picture=new Picture(null,opener);
        assertFalse(StoryOverLive.openChatStory(picture));
        picture.uid="";
        assertFalse(StoryOverLive.openChatStory(picture));
        assertEquals(0,opener.opens);
        picture.uid="creator-a";
        assertTrue(StoryOverLive.openChatStory(picture));
        assertEquals(1,opener.opens);
    }
    @Test public void anUnknownAccountDoesNotMarkAFirstTap() {
        Settings.OPEN_STORY_OVER_LIVE.save(true);
        Opener opener=new Opener();
        Picture picture=new Picture("creator-a",opener);
        SignedInUser.idForTests="";
        assertFalse(StoryOverLive.openChatStory(picture));
        assertEquals(0,opener.opens);
        SignedInUser.idForTests="reader-a";
        assertTrue(StoryOverLive.openChatStory(picture));
    }
    @Test public void aMissingOpenerDoesNotMarkAFirstTap() {
        Settings.OPEN_STORY_OVER_LIVE.save(true);
        Opener opener=new Opener();
        Picture picture=new Picture("creator-a",null);
        assertFalse(StoryOverLive.openChatStory(picture));
        picture.business.put(Business.STORY,new Unseen(opener));
        assertTrue(StoryOverLive.openChatStory(picture));
    }
    @Test public void aThrowingOpenerDoesNotMarkAFirstTap() {
        Settings.OPEN_STORY_OVER_LIVE.save(true);
        Opener opener=new Opener();
        Picture picture=new Picture("creator-a",opener);
        picture.business.put(Business.STORY,new SharedState(new Throwing()));
        assertFalse(StoryOverLive.openChatStory(picture));
        picture.business.put(Business.STORY,new Unseen(opener));
        assertTrue(StoryOverLive.openChatStory(picture));
        assertEquals(1,opener.opens);
    }
    @Test public void anUnavailableInterveningCreatorCannotRestoreAnOldSecondTap() {
        Settings.OPEN_STORY_OVER_LIVE.save(true);
        Opener opener = new Opener();
        Picture picture = new Picture("creator-a", opener);
        assertTrue(StoryOverLive.openChatStory(picture));
        picture.bind("creator-b", null);
        assertFalse(StoryOverLive.openChatStory(picture));
        picture.bind("creator-a", opener);
        assertTrue(StoryOverLive.openChatStory(picture));
        assertEquals(2, opener.opens);
    }
    @Test public void anUnavailableInterveningAccountCannotRestoreAnOldSecondTap() {
        Settings.OPEN_STORY_OVER_LIVE.save(true);
        Opener opener = new Opener();
        Picture picture = new Picture("creator-a", opener);
        assertTrue(StoryOverLive.openChatStory(picture));
        SignedInUser.idForTests = "reader-b";
        picture.bind("creator-a", null);
        assertFalse(StoryOverLive.openChatStory(picture));
        SignedInUser.idForTests = "reader-a";
        picture.bind("creator-a", opener);
        assertTrue(StoryOverLive.openChatStory(picture));
        assertEquals(2, opener.opens);
    }
    @Test public void anUnknownInterveningUidCannotRestoreAnOldSecondTap() {
        Settings.OPEN_STORY_OVER_LIVE.save(true);
        Opener opener = new Opener();
        Picture picture = new Picture("creator-a", opener);
        assertTrue(StoryOverLive.openChatStory(picture));
        picture.uid = null;
        assertFalse(StoryOverLive.openChatStory(picture));
        picture.uid = "creator-a";
        assertTrue(StoryOverLive.openChatStory(picture));
        assertEquals(2, opener.opens);
    }
    @Test public void aSignedOutInterveningTapCannotRestoreAnOldSecondTap() {
        Settings.OPEN_STORY_OVER_LIVE.save(true);
        Opener opener = new Opener();
        Picture picture = new Picture("creator-a", opener);
        assertTrue(StoryOverLive.openChatStory(picture));
        SignedInUser.idForTests = "";
        assertFalse(StoryOverLive.openChatStory(picture));
        SignedInUser.idForTests = "reader-a";
        assertTrue(StoryOverLive.openChatStory(picture));
        assertEquals(2, opener.opens);
    }
    @Test public void aThrowingInterveningCreatorCannotRestoreAnOldSecondTap() {
        Settings.OPEN_STORY_OVER_LIVE.save(true);
        Opener opener = new Opener();
        Picture picture = new Picture("creator-a", opener);
        assertTrue(StoryOverLive.openChatStory(picture));
        picture.bind("creator-b", null);
        picture.business.put(Business.STORY, new SharedState(new Throwing()));
        assertFalse(StoryOverLive.openChatStory(picture));
        picture.bind("creator-a", opener);
        assertTrue(StoryOverLive.openChatStory(picture));
        assertEquals(2, opener.opens);
    }
    static final class Throwing implements Controller, View.OnClickListener {
        public void onClick(View view) { throw new IllegalStateException("unavailable"); }
    }
}
