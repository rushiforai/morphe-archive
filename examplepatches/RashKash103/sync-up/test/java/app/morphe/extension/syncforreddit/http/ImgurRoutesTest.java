package app.morphe.extension.syncforreddit.http;

import java.util.List;

import app.morphe.extension.syncforreddit.redirects.imgur.ImgurRoutes;
import app.morphe.extension.syncforreddit.redirects.imgur.ImgurRoutes.Kind;

/**
 * Offline regression checks for which Imgur addresses go which way round the block.
 *
 * <p>The three routes do not cover the same ground, and the consequence of getting that wrong is
 * not an error but a broken picture: DuckDuckGo's proxy answers anything it will not serve with
 * 400 and a little SVG apology, and an SVG apology handed to an image decoder draws as a broken
 * image. So what each route is offered is worth pinning down here, where it can be read, rather
 * than finding out on a device.
 */
public final class ImgurRoutesTest {
    private static int checks;

    public static void main(String[] args) {
        whatCountsAsImgur();
        whatEachAddressIs();
        whatDuckDuckGoIsOffered();
        whatRimgoIsAsked();
        whatIsHandedOut();
        readingAnAlbum();

        System.out.println("Passed " + checks + " Imgur route checks.");
    }

    private static void whatCountsAsImgur() {
        for (String host : new String[]{
                "imgur.com", "i.imgur.com", "m.imgur.com", "IMGUR.COM", "imgur.io", "i.imgur.io",
        }) {
            check(ImgurRoutes.isImgur(host), "Did not recognise " + host + " as Imgur");
        }

        // Stack Overflow's images merely live on a name ending in Imgur's. They are not what is
        // being refused, and sending them somewhere else would break pictures that work.
        check(!ImgurRoutes.isImgur("i.stack.imgur.com"), "Took Stack Overflow's images for Imgur");
        for (String host : new String[]{
                "example.com", "notimgur.com", "imgur.com.example.com", "", null,
        }) {
            check(!ImgurRoutes.isImgur(host), "Took " + host + " for Imgur");
        }
    }

    private static void whatEachAddressIs() {
        check(ImgurRoutes.kindOf("i.imgur.com", "/abc12345.png") == Kind.PICTURE, "A png");
        check(ImgurRoutes.kindOf("i.imgur.com", "/abc12345.JPEG") == Kind.PICTURE, "A JPEG");
        check(ImgurRoutes.kindOf("i.imgur.com", "/abc12345.gif") == Kind.PICTURE, "A gif");
        // Imgur's own size suffixes are part of the name, not something to strip.
        check(ImgurRoutes.kindOf("i.imgur.com", "/abc12345m.jpg") == Kind.PICTURE, "A thumbnail");
        // A bare id on the picture host is a picture whose address carries no extension.
        check(ImgurRoutes.kindOf("i.imgur.com", "/abc12345") == Kind.PICTURE, "A bare id");

        check(ImgurRoutes.kindOf("i.imgur.com", "/abc12345.mp4") == Kind.VIDEO, "An mp4");
        check(ImgurRoutes.kindOf("i.imgur.com", "/abc12345.webm") == Kind.VIDEO, "A webm");

        // .gifv is Imgur's name for the page wrapping a video, and it is what Sync asks for
        // when it wants the video. Asked for as it stands, Imgur and every Rimgo instance
        // answer with markup holding a player — so it counts as a video and is asked for as
        // one, which is the same id with .mp4 on the end.
        check(ImgurRoutes.kindOf("i.imgur.com", "/abc12345.gifv") == Kind.VIDEO, "A gifv");
        check(ImgurRoutes.kindOf("imgur.com", "/a/abc12345") == Kind.PAGE, "An album");
        check(ImgurRoutes.kindOf("imgur.com", "/gallery/abc12345") == Kind.PAGE, "A gallery");
        check(ImgurRoutes.kindOf("imgur.com", "/t/cats/abc12345") == Kind.PAGE, "A tag");
        check(ImgurRoutes.kindOf("imgur.com", "/abc12345") == Kind.PAGE, "A post");

        check(ImgurRoutes.kindOf("api.imgur.com", "/3/image/abc") == Kind.API, "The API");
        check(ImgurRoutes.kindOf("example.com", "/abc.png") == Kind.NONE, "Not Imgur at all");
        check(ImgurRoutes.kindOf("imgur.com", "/") == Kind.NONE, "The front page");
    }

    private static void whatDuckDuckGoIsOffered() {
        String asked = ImgurRoutes.duckDuckGo("https://i.imgur.com/abc12345.png", Kind.PICTURE);
        check(asked != null, "Would not fetch a picture");
        check(asked.startsWith("https://external-content.duckduckgo.com/iu/?u="),
                "Did not ask DuckDuckGo's proxy");
        // The scheme and the slashes are left as they are: both are allowed in a query, the
        // proxy takes the address either way, and it keeps the address readable in a log.
        check(asked.endsWith("https://i.imgur.com/abc12345.png"),
                "Did not hand over the address whole: " + asked);

        // What must not be left alone is anything that would end the parameter. An address
        // carrying a query of its own would otherwise read as further parameters of the
        // proxy's, and the proxy would be asked to fetch half an address.
        String withAQuery = ImgurRoutes.duckDuckGo(
                "https://i.imgur.com/abc12345.png?maxwidth=640&shape=thumb", Kind.PICTURE);
        check(withAQuery != null, "Would not fetch a picture with a query on it");
        check(withAQuery.indexOf('?') == withAQuery.lastIndexOf('?'),
                "Left a second question mark in: " + withAQuery);
        check(!withAQuery.contains("&"), "Left an ampersand in: " + withAQuery);
        check(withAQuery.endsWith("abc12345.png%3Fmaxwidth%3D640%26shape%3Dthumb"),
                "Did not hide the address's own query from the proxy: " + withAQuery);

        // The proxy wants something that looks like a picture. Imgur serves a picture whatever
        // ending is asked for, so an ending is added where the address has none.
        String bare = ImgurRoutes.duckDuckGo("https://i.imgur.com/abc12345", Kind.PICTURE);
        check(bare != null && bare.endsWith(".png"), "Did not give a bare id an ending: " + bare);

        // And an address with no ending but a query of its own gets the ending on its path,
        // which is the only place an ending means anything.
        String bareWithAQuery = ImgurRoutes.duckDuckGo(
                "https://i.imgur.com/abc12345?maxwidth=640", Kind.PICTURE);
        check(bareWithAQuery != null && bareWithAQuery.contains("abc12345.png%3F"),
                "Put the ending after the query: " + bareWithAQuery);

        // Everything it would answer with an apology rather than a picture.
        check(ImgurRoutes.duckDuckGo("https://i.imgur.com/a.mp4", Kind.VIDEO) == null,
                "Offered DuckDuckGo a video");
        check(ImgurRoutes.duckDuckGo("https://imgur.com/a/abc", Kind.PAGE) == null,
                "Offered DuckDuckGo an album");
        check(ImgurRoutes.duckDuckGo("https://api.imgur.com/3/image", Kind.API) == null,
                "Offered DuckDuckGo the API");
        check(ImgurRoutes.duckDuckGo("i.imgur.com/abc.png", Kind.PICTURE) == null,
                "Offered DuckDuckGo an address with no scheme, which it refuses");
        check(ImgurRoutes.duckDuckGo(null, Kind.PICTURE) == null, "Invented an address");
    }

    private static void whatRimgoIsAsked() {
        String where = "https://rimgo.example.com";

        // Media is named by the last segment alone, on the instance's own media path.
        check("https://rimgo.example.com/abc12345.png".equals(
                ImgurRoutes.rimgo(where, "i.imgur.com", "/abc12345.png", Kind.PICTURE)),
                "Did not ask the instance for the picture");
        check("https://rimgo.example.com/abc12345.mp4".equals(
                ImgurRoutes.rimgo(where, "i.imgur.com", "/abc12345.mp4", Kind.VIDEO)),
                "Did not ask the instance for the video");
        check("https://rimgo.example.com/abc12345.png".equals(
                ImgurRoutes.rimgo(where, "i.imgur.com", "/abc12345", Kind.PICTURE)),
                "Did not give a bare id an ending");
        // A .gifv asked for as it stands is answered with a page, so the video is asked for.
        check("https://rimgo.example.com/abc12345.mp4".equals(
                ImgurRoutes.rimgo(where, "i.imgur.com", "/abc12345.gifv", Kind.VIDEO)),
                "Asked the instance for the gifv page rather than the video: "
                        + ImgurRoutes.rimgo(where, "i.imgur.com", "/abc12345.gifv", Kind.VIDEO));

        // An album is at both of Imgur's own two shapes on an instance, and both are worth
        // asking: which one answers depends on what the id turns out to be, and instances are
        // not all built from the same commit.
        java.util.List<String> pages = ImgurRoutes.rimgoAlbumPages(where, "abc12345");
        check(pages.size() == 2, "Did not offer both album shapes: " + pages);
        check(pages.get(0).equals("https://rimgo.example.com/a/abc12345"), "Not the album path");
        check(pages.get(1).equals("https://rimgo.example.com/gallery/abc12345"),
                "Not the gallery path");
        check(ImgurRoutes.rimgoAlbumPages(where, "").isEmpty(), "Asked about no album");
        check(ImgurRoutes.rimgoAlbumPages("", "abc").isEmpty(), "Asked nobody about an album");

        // A page keeps Imgur's own shape, which is the shape the instance serves it under.
        check("https://rimgo.example.com/a/abc12345".equals(
                ImgurRoutes.rimgo(where, "imgur.com", "/a/abc12345", Kind.PAGE)),
                "Did not ask the instance for the album");
        check("https://rimgo.example.com/gallery/abc12345".equals(
                ImgurRoutes.rimgo(where, "imgur.com", "/gallery/abc12345", Kind.PAGE)),
                "Did not ask the instance for the gallery");

        // A trailing slash on the instance would otherwise double up.
        check("https://rimgo.example.com/abc.png".equals(
                ImgurRoutes.rimgo(where + "/", "i.imgur.com", "/abc.png", Kind.PICTURE)),
                "Doubled the slash after the instance");

        check(ImgurRoutes.rimgo(where, "api.imgur.com", "/3/image", Kind.API) == null,
                "Asked an instance for the API, which it does not serve");
        check(ImgurRoutes.rimgo("", "i.imgur.com", "/abc.png", Kind.PICTURE) == null,
                "Asked an instance that is not set");
    }

    private static void readingAnAlbum() {
        check("abc12345".equals(ImgurRoutes.albumIdIn("imgur.com", "/a/abc12345")), "Album id");
        check("abc12345".equals(ImgurRoutes.albumIdIn("imgur.com", "/gallery/abc12345")),
                "Gallery id");
        check("abc12345".equals(ImgurRoutes.albumIdIn("imgur.com", "/a/abc12345.json")),
                "Did not cut the ending off an album id");
        check(ImgurRoutes.albumIdIn("imgur.com", "/abc12345") == null, "Took a post for an album");
        check(ImgurRoutes.albumIdIn("example.com", "/a/abc") == null, "Took another site's album");

        // What an instance's album page looks like: each item as its own media path, alongside
        // the static files it serves for itself, which are not items.
        String page = "<link href=\"/static/favicon/favicon-32x32.png\">"
                + "<img src=\"/wG1nGfK.mp4\"><img src=\"/SMbc8Vv.gif\">"
                + "<img src=\"/eea4KYK.jpg\"><img src=\"/eea4KYK.jpg\">";
        List<String> media = ImgurRoutes.mediaInRimgoAlbum(page);
        check(media.size() == 3, "Read " + media.size() + " items out of the album, not 3");
        check("wG1nGfK.mp4".equals(media.get(0)), "Lost the order of the album");
        check(!media.contains("favicon-32x32.png"), "Took a favicon for part of the album");
        check(media.indexOf("eea4KYK.jpg") == media.lastIndexOf("eea4KYK.jpg"),
                "Listed the same item twice");
        check(ImgurRoutes.mediaInRimgoAlbum("<p>Too many requests</p>").isEmpty(),
                "Read items out of a page that is an error");
        check(ImgurRoutes.mediaInRimgoAlbum(null).isEmpty(), "Read items out of nothing");

        check("https://i.imgur.com/wG1nGfK.mp4".equals(ImgurRoutes.imgurLinkFor("wG1nGfK.mp4")),
                "Did not name the item on Imgur itself");

        // A page as a working instance actually writes one, taken from one: the instance's own
        // icons under /static, the album's items, and the thumbnails of other posts in the
        // sidebar, which carry a query and are not part of this album at all.
        String real = "<img src=\"/static/img/rimgo.svg\">"
                + "<img src=\"/static/icons/PhEye.svg\">"
                + "<img src=\"/eZ9iusF.png\"><video><source src=\"/gEOoGEn.mp4\"></video>"
                + "<img src=\"/0E5T6m0.jpeg\">"
                + "<img src=\"/GVSpSgt_d.png?maxwidth=290&amp;fidelity=grand\">";
        List<String> items = ImgurRoutes.mediaInRimgoAlbum(real);
        check(items.size() == 3, "Read " + items + " out of the page, not the three items");
        check(items.get(0).equals("eZ9iusF.png") && items.get(1).equals("gEOoGEn.mp4")
                        && items.get(2).equals("0E5T6m0.jpeg"),
                "Not the album in the order the page lists it: " + items);

        // A picture somebody posted in the comments underneath the album is on the page and
        // is not part of the album. An album of twenty came back as twenty-two without this,
        // and nothing in the viewer says which two do not belong.
        String withComments = "<img class=\"my-2 max-h-96 object-contain\" src=\"/aaa111.jpeg\">"
                + "<img src=\"/bbb222.png\" class=\"comment__media\" loading=\"lazy\"/>";
        List<String> album = ImgurRoutes.mediaInRimgoAlbum(withComments);
        check(album.size() == 1 && album.get(0).equals("aaa111.jpeg"),
                "Took a picture posted in the comments for part of the album: " + album);
    }

    private static void whatIsHandedOut() {
        String instance = "https://rimgo.example.com";
        String picture = "https://i.imgur.com/abc12345.png";
        String album = "https://imgur.com/a/abc12345";
        String video = "https://i.imgur.com/abc12345.mp4";

        // Nothing is on: what was there is what is handed out.
        check(ImgurRoutes.handedOut(picture, false, false, instance) == null,
                "Changed an address with no route asked to");

        // DuckDuckGo serves a picture and nothing else, so with it alone an album and a video
        // are handed out as Imgur's own addresses. This is the whole of the rule.
        String byProxy = ImgurRoutes.handedOut(picture, true, false, instance);
        check(byProxy != null && byProxy.startsWith("https://external-content.duckduckgo.com/"),
                "Did not hand out the proxy's address for a picture: " + byProxy);
        check(ImgurRoutes.handedOut(album, true, false, instance) == null,
                "Handed out a DuckDuckGo address for an album, which it cannot serve");
        check(ImgurRoutes.handedOut(video, true, false, instance) == null,
                "Handed out a DuckDuckGo address for a video, which it cannot serve");

        // An instance serves all three.
        check("https://rimgo.example.com/abc12345.png".equals(
                ImgurRoutes.handedOut(picture, false, true, instance)), "Not the instance");
        check("https://rimgo.example.com/a/abc12345".equals(
                ImgurRoutes.handedOut(album, false, true, instance)), "Not the album");
        check("https://rimgo.example.com/abc12345.mp4".equals(
                ImgurRoutes.handedOut(video, false, true, instance)), "Not the video");

        // With both on, a picture goes out as the proxy's, which is where it came from, and
        // an album falls through to the instance.
        check(ImgurRoutes.handedOut(picture, true, true, instance)
                .startsWith("https://external-content.duckduckgo.com/"), "Not the proxy's");
        check("https://rimgo.example.com/a/abc12345".equals(
                ImgurRoutes.handedOut(album, true, true, instance)), "Not the instance's album");

        // An instance that is asked for and not there leaves the address alone.
        check(ImgurRoutes.handedOut(album, false, true, null) == null, "Invented an instance");
        check(ImgurRoutes.handedOut(album, false, true, "") == null, "Invented an instance");

        // Anything that is not exactly one Imgur address is left exactly as it is.
        check(ImgurRoutes.handedOut("Look at " + picture, true, true, instance) == null,
                "Rewrote a sentence that mentions an address");
        check(ImgurRoutes.handedOut(picture + " is good", true, true, instance) == null,
                "Rewrote a sentence that starts with an address");
        check(ImgurRoutes.handedOut("https://example.com/a.png", true, true, instance) == null,
                "Rewrote somebody else's address");
        check(ImgurRoutes.handedOut("https://i.stack.imgur.com/a.png", true, true, instance)
                        == null,
                "Rewrote Stack Overflow's picture");
        check(ImgurRoutes.handedOut("https://api.imgur.com/3/image", true, true, instance)
                        == null,
                "Rewrote the API, which no address can stand in for");
        check(ImgurRoutes.handedOut("imgur.com/a/abc", true, true, instance) == null,
                "Rewrote something with no scheme");
        check(ImgurRoutes.handedOut(null, true, true, instance) == null, "Invented an address");
        // A name in front of the host is how a link is disguised, and is not one of these.
        check(ImgurRoutes.handedOut("https://imgur.com@evil.example/a/abc", true, true, instance)
                        == null,
                "Took an address that only looks like Imgur's for Imgur's");

        check("i.imgur.com".equals(ImgurRoutes.hostIn(picture)), "Did not read the host");
        check("/a/abc12345".equals(ImgurRoutes.pathIn(album)), "Did not read the path");
        check("".equals(ImgurRoutes.pathIn("https://imgur.com")), "Invented a path");
        check("/abc.png".equals(ImgurRoutes.pathIn("https://i.imgur.com/abc.png?w=1")),
                "Took the query for part of the path");
    }

    private static void check(boolean passed, String failure) {
        if (!passed) {
            throw new AssertionError(failure);
        }
        checks++;
    }
}
