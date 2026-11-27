// SPDX-License-Identifier: AGPL-3.0-or-later

package app.edbfi.extension.shared.imgur;

import java.util.Map;
import org.junit.Test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

public final class ImgurTest {
    @Test
    public void albumUsesCoverOrFirstValidImage() {
        assertEquals("https://i.imgur.com/Cover1m.jpg",
                Imgur.coverFromJson("{\"data\":{\"cover\":\"Cover1\",\"images\":[{\"id\":\"Image2\"}]}}"));
        assertEquals("https://i.imgur.com/Image2m.jpg",
                Imgur.coverFromJson("{\"data\":{\"images\":[{\"id\":\"bad/id\"},{\"id\":\"Image2\"}]}}"));
        assertNull(Imgur.coverFromJson("{\"data\":{\"images\":[]}}"));
    }

    @Test
    public void singleImageCoverUsesTheReturnedImageId() {
        assertEquals("https://i.imgur.com/Real123m.jpg", Imgur.imageCoverFromJson("{\"data\":{\"id\":\"Real123\"}}"));
        assertNull(Imgur.imageCoverFromJson("{\"data\":{\"id\":123}}"));
        assertNull(Imgur.imageCoverFromJson("{\"data\":{\"id\":\"bad/id\"}}"));
        assertNull(Imgur.imageCoverFromJson("{\"data\":{}}"));
    }

    @Test
    public void mapsTitledAlbumsAndDirectImagesToApiRoutes() {
        assertEquals("https://imgur.com/a/AbCd123", Imgur.normalizeAlbumLink("https://imgur.com/a/album-title-AbCd123"));
        assertEquals("https://api.imgur.com/3/gallery/album/AbCd123",
                Imgur.albumUrl("https://imgur.com/gallery/title-AbCd123"));
        assertEquals("https://api.imgur.com/3/image/UvWx123", Imgur.imageUrl("https://i.imgur.com/UvWx123.png"));
        assertEquals("", Imgur.id("https://imgur.com.invalid/a/AbCd123"));
    }

    @Test
    public void titledCommentCoversUseTrailingIdsAndPreserveGalleryRouting() {
        assertEquals("https://imgur.com/a/AbCd123", Imgur.titledCommentCoverModel(
                "http://imgur.com/a/captioned-album-AbCd123", "https://imgur.com/a/captioned"));
        assertEquals("https://imgur.com/gallery/XyZ4567", Imgur.titledCommentCoverModel(
                "http://www.imgur.com/gallery/captioned-gallery-XyZ4567/?sort=top#first",
                "https://imgur.com/a/captioned"));
    }

    @Test
    public void olderCommentCoversKeepTheStockExtractedId() {
        String stockModel = "https://imgur.com/a/AbCd123";
        for (String url : new String[] {
                "http://imgur.com/a/AbCd123",
                "http://imgur.com/a/AbCd123/layout",
                "http://imgur.com/a/AbCd123/HORIZONTAL/?sort=top#first",
                "http://iob.imgur.com/AbCd123",
                "http://iob.imgur.io/AbCd123",
                "http://imgur.com/gallery/AbCd123",
                "http://imgur.com/a/bad-title-null",
                "http://imgur.com.invalid/a/similar-host-AbCd123",
        }) {
            assertEquals(url, stockModel, Imgur.titledCommentCoverModel(url, stockModel));
        }
    }

    @Test
    public void scopesAuthorizationToTheExactHttpsApiAndPreservesOtherHeaders() {
        var original = Map.of("User-Agent", "fixture-app", "content-type", "application/x-www-form-urlencoded",
                "x-rapidapi-key", "obsolete", "X-RapidAPI-Host", "obsolete", "authorization", "obsolete");
        var unrelated = Map.of("User-Agent", "fixture-app", "content-type", "application/x-www-form-urlencoded");
        var expected = Map.of("User-Agent", "fixture-app", "content-type", "application/x-www-form-urlencoded",
                "Authorization", "Client-ID FixtureOnly");
        assertEquals(expected, Imgur.headers("https://api.imgur.com:443/3/image", original, "FixtureOnly"));
        for (String invalid : new String[] {"http://api.imgur.com/3/image", "https://api.imgur.com.invalid/3/image",
                "https://api.imgur.com:8443/3/image", "https://user@api.imgur.com/3/image",
                "https://api.imgur.com/30/image", "https://i.imgur.com/3/image"}) {
            assertEquals(invalid, unrelated, Imgur.headers(invalid, original, "FixtureOnly"));
        }
        assertEquals("obsolete", original.get("authorization"));
    }
}
