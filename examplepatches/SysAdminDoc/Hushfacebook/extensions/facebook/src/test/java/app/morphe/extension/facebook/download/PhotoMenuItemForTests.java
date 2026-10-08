/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.download;

import android.content.Context;
import android.view.Menu;
import android.view.View;

import com.facebook.graphql.model.GraphQLMedia;
import com.facebook.graphql.model.GraphQLStory;
import com.facebook.graphql.model.GraphQLStoryAttachment;
import com.facebook.graphservice.tree.TreeJNI;

import org.robolectric.RuntimeEnvironment;

/**
 * The photo menu hook, for a test outside this package: one post menu Facebook has filled, handed
 * to the hook the way the patch hands it over.
 */
public final class PhotoMenuItemForTests {
    private PhotoMenuItemForTests() {
    }

    /** The name the attachment fake gives its list of an album's attachments. */
    static final String SUBATTACHMENTS = "A09";

    /** A full-size photo on Meta's CDN, numbered so each photo of a post has its own. */
    static String image(int number) {
        return "https://scontent-iad3-1.xx.fbcdn.net/v/t39.30808-6/"
                + "47514847" + number + "_1134540631592283_1316146539584337463_n.jpg?_nc_cat=1&oh=00_AYA&oe=66F0A1B2";
    }

    /** A photo whose biggest image is [image(number)]. */
    static GraphQLMedia photo(int number) {
        GraphQLMedia media = new GraphQLMedia("Photo");
        media.with("id", "10000000000000" + number);
        media.with("imageHigh", new TreeJNI().with("uri", image(number)).number("width", 2048).number("height", 1536));
        return media;
    }

    /** A post holding one photo. */
    static GraphQLStory photoPost() {
        return new GraphQLStory(null, new GraphQLStoryAttachment(photo(1)));
    }

    /** Fills a post menu for a photo post and says whether the hook added its item. */
    public static boolean addsAnItem() {
        Context context = RuntimeEnvironment.getApplication();
        Menu menu = VideoMenuItemForTests.facebooksMenu(context);
        int before = menu.size();
        PhotoMenuItem.add(menu, new View(context), photoPost(), VideoMenuItemForTests.ICON,
                VideoMenuItemForTests.ATTACHMENTS, VideoMenuItemForTests.MEDIA,
                VideoMenuItemForTests.ATTACHED_STORY, SUBATTACHMENTS);
        return menu.size() > before;
    }
}
