// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Collections.Immutable;
using BaconReader.FakeReddit.World;

namespace BaconReader.E2E.Infrastructure.Reddit;

/// <summary>
/// Imgur, which the fake Reddit answers too ("E2E fake Reddit" moves Imgur's API and images to it), in the Gherkins'
/// words. Posts and comments link an album at Imgur's own address, as Reddit has them: BaconReader and "Embed comment
/// images" know an album by it.
/// </summary>
public sealed partial class Reddit
{
    /// <summary>"Imgur has an album "&lt;title&gt;" of &lt;images&gt; images": JPEGs, linked <c>https://imgur.com/a/&lt;id&gt;</c>.</summary>
    public void ImgurHasAnAlbumOf(string title, int images) => world.Imgur.AddAlbum(title, images);

    /// <summary>"Imgur has an album "&lt;title&gt;" of &lt;videos&gt; video(s)": MP4s, Imgur's "mp4" set to each.</summary>
    public void ImgurHasAnAlbumOfVideos(string title, int videos) => world.Imgur.AddAlbum(title, 0, videos: videos);

    /// <summary>
    /// "Imgur has an album "&lt;title&gt;" of &lt;images&gt; image(s) and &lt;videos&gt; video(s)": its JPEGs first, then its
    /// MP4s.
    /// </summary>
    public void ImgurHasAnAlbumOfImagesAndVideos(string title, int images, int videos) => world.Imgur.AddAlbum(title, images, videos: videos);

    /// <summary>
    /// "Imgur has a gallery post "&lt;title&gt;" of &lt;images&gt; images": an album shared on Imgur's gallery, linked
    /// <c>https://imgur.com/gallery/&lt;id&gt;</c>.
    /// </summary>
    public void ImgurHasAGalleryPostOf(string title, int images) => world.Imgur.AddAlbum(title, images, inGallery: true);

    /// <summary>
    /// "Reddit has a link post "&lt;title&gt;" in r/&lt;subreddit&gt; linking to the Imgur album "&lt;album&gt;"": a link post
    /// whose address is the album's, <c>https://imgur.com/a/&lt;id&gt;</c>.
    /// </summary>
    public void HasALinkPostLinkingToTheImgurAlbum(string title, string subreddit, string album) =>
        world.AddPost(subreddit, title, post => post.LinkingTo(ImgurAlbumTitled(album).Link));

    /// <summary>
    /// "Reddit has a link post "&lt;title&gt;" in r/&lt;subreddit&gt; linking to the Imgur gallery post "&lt;album&gt;"": a
    /// link post whose address is the gallery post's, <c>https://imgur.com/gallery/&lt;id&gt;</c>.
    /// </summary>
    public void HasALinkPostLinkingToTheImgurGalleryPost(string title, string subreddit, string album) =>
        HasALinkPostLinkingToTheImgurAlbum(title, subreddit, album);

    /// <summary>
    /// "Imgur served the images of the album "&lt;album&gt;"": the requests Imgur's API got for the album's images,
    /// <c>/3/album/&lt;id&gt;/images</c>, each one's status.
    /// </summary>
    public ImgurRequestsSnapshot ReadRequestsForTheImgurAlbum(string album) =>
        Checked<ImgurRequestsSnapshot>(ImgurRequests($"the images of the album \"{album}\"", $"/_imgur/3/album/{ImgurAlbumTitled(album).Id}/images"), album);

    /// <summary>
    /// "Imgur served the gallery post "&lt;album&gt;"": the requests Imgur's API got for the gallery post,
    /// <c>/3/gallery/&lt;id&gt;</c>, each one's status.
    /// </summary>
    public ImgurRequestsSnapshot ReadRequestsForTheImgurGalleryPost(string album) =>
        Checked<ImgurRequestsSnapshot>(ImgurRequests($"the gallery post \"{album}\"", $"/_imgur/3/gallery/{ImgurAlbumTitled(album).Id}"), album);

    /// <summary>"Imgur got the upload …": the uploads Imgur got, oldest first, with their content type.</summary>
    public ImgurUploadsSnapshot ReadImgurUploads() =>
        Checked<ImgurUploadsSnapshot>(new([.. world.Imgur.Uploads.Select(upload => new ImgurUploadSeen(upload.ContentType, upload.Accepted))]));

    /// <summary>Waits until Imgur got an upload: BaconReader uploads the reply's images when it is sent.</summary>
    public Task WaitUntilImgurGotAnUploadAsync() =>
        WaitUntilAsync(() => !world.Imgur.Uploads.IsEmpty, TimeSpan.FromSeconds(30), "Imgur got no upload within 30 s.");

    private ImgurRequestsSnapshot ImgurRequests(string what, string path) =>
        new(what, [.. world.Requests.Where(request => request.Method == "GET" && request.Path.TrimEnd('/') == path).Select(request => request.Status)]);

    internal ImgurAlbum ImgurAlbumTitled(string title) =>
        world.Imgur.Albums.SingleOrDefault(album => album.Title == title)
            ?? throw new InvalidOperationException($"The scenario's Imgur has no album \"{title}\": a Given line makes it first.");
}

/// <summary>The requests Imgur's API got for one thing (<c>What</c>: "the images of the album "Trip""), each one's status.</summary>
public sealed record ImgurRequestsSnapshot(string What, ImmutableArray<int> Statuses);

/// <summary>An upload Imgur got: its content type (null without one) and whether Imgur took it.</summary>
public sealed record ImgurUploadSeen(string? ContentType, bool Accepted);

/// <summary>The uploads Imgur got, oldest first.</summary>
public sealed record ImgurUploadsSnapshot(ImmutableArray<ImgurUploadSeen> Uploads);
