/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.download;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import android.content.Context;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;

import com.facebook.graphql.model.GraphQLMedia;
import com.facebook.graphql.model.GraphQLStory;
import com.facebook.graphql.model.GraphQLStoryAttachment;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

import java.net.InetAddress;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

/**
 * Save photo in a post's menu: added below Facebook's own rows only for a post holding photos,
 * only while both switches are on and Hushfacebook runs, and a tap that saves each photo, one
 * after another, through the pipeline every save uses.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class PhotoMenuItemTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final String ATTACHMENTS = VideoMenuItemForTests.ATTACHMENTS;
    private static final String MEDIA = VideoMenuItemForTests.MEDIA;
    private static final String ATTACHED_STORY = VideoMenuItemForTests.ATTACHED_STORY;
    private static final String SUBATTACHMENTS = PhotoMenuItemForTests.SUBATTACHMENTS;

    private final List<PostDetails> saved = Collections.synchronizedList(new ArrayList<>());
    private Context context;

    @Before
    public void setUp() {
        context = RuntimeEnvironment.getApplication();
        Settings.DOWNLOAD_PHOTOS.save(true);
        Settings.POST_MENU_PHOTO_SAVE.save(true);
        HookStatus.clear();
        // Every Meta name answers a private address, so a save that starts is refused before a
        // socket opens.
        MediaDownload.policyForTests = new MediaUrlPolicy(host -> new InetAddress[] { InetAddress.getByName("10.9.8.7") });
        MediaDownload.detailsForTests = saved::add;
    }

    @After
    public void tearDown() throws InterruptedException {
        long deadline = System.nanoTime() + 20_000_000_000L;
        while (MediaDownload.savesInFlight() > 0) {
            assertTrue("a save never finished", System.nanoTime() < deadline);
            Thread.sleep(10);
        }
        MediaDownload.policyForTests = null;
        MediaDownload.detailsForTests = null;
        PauseForTests.resume();
        Settings.DOWNLOAD_PHOTOS.resetToDefault();
        Settings.POST_MENU_PHOTO_SAVE.resetToDefault();
        HookStatus.clear();
    }

    private Menu filled(Object item) {
        Menu menu = VideoMenuItemForTests.facebooksMenu(context);
        PhotoMenuItem.add(menu, new View(context), item, VideoMenuItemForTests.ICON,
                ATTACHMENTS, MEDIA, ATTACHED_STORY, SUBATTACHMENTS);
        return menu;
    }

    private static String added(Menu menu) {
        return menu.size() == 3 ? String.valueOf(menu.getItem(2).getTitle()) : null;
    }

    private static GraphQLStory album(int photos) {
        GraphQLStoryAttachment[] each = new GraphQLStoryAttachment[photos];
        for (int i = 0; i < photos; i++) each[i] = new GraphQLStoryAttachment(PhotoMenuItemForTests.photo(i + 1));
        return new GraphQLStory(null, new GraphQLStoryAttachment(null, each));
    }

    @Test
    public void aPhotoPostGetsSavePhotoAndAnAlbumSaveAllPhotos() {
        assertEquals("Save photo", added(filled(PhotoMenuItemForTests.photoPost())));
        assertEquals("Save all photos", added(filled(album(3))));
        assertEquals("a shared post's photo is the shared post's", "Save photo",
                added(filled(new GraphQLStory(PhotoMenuItemForTests.photoPost()))));
        assertEquals("an attachment's own menu reads that attachment", "Save photo",
                added(filled(new GraphQLStoryAttachment(PhotoMenuItemForTests.photo(1)))));
        assertTrue("Hook status has no line for the item",
                String.join(" | ", HookStatus.report()).contains(FamilyNames.PHOTO_DOWNLOAD));
    }

    @Test
    public void offPausedOrNoPhotoLeavesFacebooksMenu() {
        assertNull("a video post got the photo item",
                added(filled(new GraphQLStory(null, new GraphQLStoryAttachment(new GraphQLMedia("Video"))))));
        assertNull("a photo with no image got the item",
                added(filled(new GraphQLStory(null, new GraphQLStoryAttachment(new GraphQLMedia("Photo"))))));
        assertNull("something that isn't a post got the item", added(filled(new Object())));

        Settings.POST_MENU_PHOTO_SAVE.save(false);
        assertNull("its own switch off", added(filled(PhotoMenuItemForTests.photoPost())));
        Settings.POST_MENU_PHOTO_SAVE.save(true);
        Settings.DOWNLOAD_PHOTOS.save(false);
        assertNull("Save any photo off", added(filled(PhotoMenuItemForTests.photoPost())));
        Settings.DOWNLOAD_PHOTOS.save(true);
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        assertNull("paused", added(filled(PhotoMenuItemForTests.photoPost())));
    }

    @Test
    public void aTapSavesEachPhotoInOrder() throws InterruptedException {
        List<PhotoMenuItem.Photo> photos = PhotoMenuItem.photosOf(album(3), ATTACHMENTS, MEDIA, ATTACHED_STORY, SUBATTACHMENTS);
        assertEquals(3, photos.size());
        assertEquals(PhotoMenuItemForTests.image(1), photos.get(0).url);
        assertEquals(PhotoMenuItemForTests.image(3), photos.get(2).url);

        Thread saves = PhotoMenuItem.tap(context, photos);
        assertNotNull("the saves didn't start", saves);
        saves.join(20_000);
        assertFalse("the saves never ended", saves.isAlive());
        assertEquals("each photo went to the downloader", 3, saved.size());

        Settings.POST_MENU_PHOTO_SAVE.save(false);
        assertNull("a tap after the switch went off saved", PhotoMenuItem.tap(context, photos));
        assertEquals(3, saved.size());
    }

    @Test
    public void theMenuItemTakesTheTap() {
        Menu menu = filled(PhotoMenuItemForTests.photoPost());
        MenuItem item = menu.getItem(menu.size() - 1);
        // Switched off after the menu opened, the tap is taken and starts nothing, so no save
        // outlives the test. aTapSavesEachPhotoInOrder covers the saves.
        Settings.POST_MENU_PHOTO_SAVE.save(false);
        assertTrue("the tap wasn't taken", menu.performIdentifierAction(item.getItemId(), 0));
        assertEquals("a tap after the switch went off saved", 0, saved.size());
    }
}
