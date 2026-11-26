/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Written by lavinhoque33, 2026-11-25.
 */
package app.morphe.extension.youtube.patches.components;

import static app.morphe.extension.shared.patches.components.Filter.FilterContentType.IDENTIFIER;
import static app.morphe.extension.shared.patches.components.Filter.FilterContentType.PATH;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.content.pm.PackageInfo;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;

import java.lang.reflect.Field;
import java.nio.charset.StandardCharsets;
import java.util.List;

import app.morphe.extension.shared.patches.components.Filter;
import app.morphe.extension.shared.patches.components.Filter.FilterContentType;
import app.morphe.extension.shared.patches.components.LazyBufferFilter.Buffer;
import app.morphe.extension.shared.patches.components.StringFilterGroup;
import app.morphe.extension.shared.utils.Utils;
import app.morphe.extension.youtube.settings.Settings;
import app.morphe.extension.youtube.shared.PlayerType;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 28)
public class CommunityPostsFilterTest {
    // A converted root can use lockup in its path but retain a different identifier.
    private static final String INHERITED_ID = "video_lockup_with_attachment.eml-fe|ae0b730421953a37";
    private static final String LOCKUP_PATH = "lockup.eml-fe|8c3f407b04ae7a1f|CellType|";
    private static final String LEGACY_POST_ID = "images_post_root_slim.eml-fe|a1";
    private static final byte[] POST_BUFFER = "\n\013FEpost_home".getBytes(StandardCharsets.US_ASCII);
    private static final byte[] VIDEO_BUFFER = "\n\007FEwatch".getBytes(StandardCharsets.US_ASCII);
    private static final Buffer UNEXPECTED_ENCODE = () -> {
        throw new AssertionError("This component should not need its buffer encoded");
    };

    private FeedComponentsFilter filter;
    private List<StringFilterGroup> identifierCallbacks;
    private List<StringFilterGroup> pathCallbacks;

    @Before
    public void setUp() throws Exception {
        var application = RuntimeEnvironment.getApplication();
        PackageInfo packageInfo = new PackageInfo();
        packageInfo.packageName = application.getPackageName();
        packageInfo.versionName = "21.45.90";
        packageInfo.applicationInfo = application.getApplicationInfo();
        Shadows.shadowOf(application.getPackageManager()).installPackage(packageInfo);

        Utils.setContext(application);
        FeedComponentsFilter.setBrowseId("FEwhat_to_watch");
        PlayerType.setFromString("NONE");
        Settings.HIDE_COMMUNITY_POSTS_HOME_RELATED_VIDEOS.save(true);
        Settings.HIDE_COMMUNITY_POSTS_SUBSCRIPTIONS.save(false);
        Settings.HIDE_COMMUNITY_POSTS_CHANNEL.save(false);
        Settings.HIDE_LIVE_STREAMS.save(false);
        Settings.HIDE_CAROUSEL_SHELF_HOME.save(false);
        Settings.HIDE_LATEST_POSTS.save(false);

        filter = new FeedComponentsFilter();
        identifierCallbacks = callbacks("identifierCallbacks");
        pathCallbacks = callbacks("pathCallbacks");
    }

    @Test
    public void hidesWholePostByActualPathAndEndpoint() {
        assertTrue(isFiltered(INHERITED_ID, LOCKUP_PATH, () -> POST_BUFFER));
        assertFalse(isFiltered(INHERITED_ID, LOCKUP_PATH, () -> VIDEO_BUFFER));
        assertFalse(isFiltered(INHERITED_ID, LOCKUP_PATH + "ContainerType|", UNEXPECTED_ENCODE));
        assertFalse(isFiltered(INHERITED_ID, LOCKUP_PATH + "cell.eml|a1|CellType|", UNEXPECTED_ENCODE));
        assertFalse(isFiltered(INHERITED_ID, "horizontal_shelf.eml|a1|CellType|" + LOCKUP_PATH,
                () -> POST_BUFFER));

        Settings.HIDE_COMMUNITY_POSTS_HOME_RELATED_VIDEOS.save(false);
        assertFalse(isFiltered(INHERITED_ID, LOCKUP_PATH, UNEXPECTED_ENCODE));
    }

    @Test
    public void channelAndSubscriptionsHaveSeparateOptIns() {
        FeedComponentsFilter.setBrowseId("UCexample");
        assertFalse(isFiltered(INHERITED_ID, LOCKUP_PATH, UNEXPECTED_ENCODE));
        Settings.HIDE_COMMUNITY_POSTS_CHANNEL.save(true);
        assertTrue(isFiltered(INHERITED_ID, LOCKUP_PATH, () -> POST_BUFFER));

        FeedComponentsFilter.setBrowseId("FEsubscriptions");
        assertFalse(isFiltered(INHERITED_ID, LOCKUP_PATH, UNEXPECTED_ENCODE));
        PlayerType.setFromString("WATCH_WHILE_MAXIMIZED");
        assertTrue(isFiltered(INHERITED_ID, LOCKUP_PATH, () -> POST_BUFFER));

        PlayerType.setFromString("NONE");
        Settings.HIDE_COMMUNITY_POSTS_SUBSCRIPTIONS.save(true);
        assertTrue(isFiltered(INHERITED_ID, LOCKUP_PATH, () -> POST_BUFFER));
    }

    @Test
    public void keepsStandalonePageBodiesAndPreservesLegacyChannelOverride() {
        assertTrue(isFiltered(LEGACY_POST_ID, LEGACY_POST_ID + "|CellType|", UNEXPECTED_ENCODE));

        Settings.HIDE_COMMUNITY_POSTS_CHANNEL.save(true);
        FeedComponentsFilter.setBrowseId("FEcommunity_page");
        assertFalse(isFiltered(INHERITED_ID, LOCKUP_PATH, UNEXPECTED_ENCODE));
        assertTrue(isFiltered(LEGACY_POST_ID, LEGACY_POST_ID + "|CellType|", UNEXPECTED_ENCODE));

        FeedComponentsFilter.setBrowseId("FEpost_detail");
        assertFalse(isFiltered(INHERITED_ID, LOCKUP_PATH, UNEXPECTED_ENCODE));
    }

    @Test
    public void latestPostsShelfKeepsItsOwnSetting() {
        String shelf = "post_shelf.eml-fe|a1";
        assertFalse(isFiltered(shelf, shelf + "|CellType|", UNEXPECTED_ENCODE));
        Settings.HIDE_LATEST_POSTS.save(true);
        assertTrue(isFiltered(shelf, shelf + "|CellType|", UNEXPECTED_ENCODE));
    }

    @SuppressWarnings("unchecked")
    private List<StringFilterGroup> callbacks(String fieldName) throws ReflectiveOperationException {
        Field field = Filter.class.getDeclaredField(fieldName);
        field.setAccessible(true);
        return (List<StringFilterGroup>) field.get(filter);
    }

    private boolean isFiltered(String identifier, String path, Buffer buffer) {
        return matches(identifierCallbacks, identifier, IDENTIFIER, path, buffer)
                || matches(pathCallbacks, path, PATH, path, buffer);
    }

    private boolean matches(List<StringFilterGroup> groups, String input, FilterContentType type,
                            String path, Buffer buffer) {
        for (StringFilterGroup group : groups) {
            var result = group.check(input);
            if (result.isFiltered()
                    && filter.isFilteredLazy(path, "", "", buffer, group, type, result.getMatchedIndex())) {
                return true;
            }
        }

        return false;
    }
}
