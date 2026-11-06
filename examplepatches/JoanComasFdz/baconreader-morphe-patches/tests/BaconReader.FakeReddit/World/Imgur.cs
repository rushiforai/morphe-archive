// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Collections.Immutable;

namespace BaconReader.FakeReddit.World;

/// <summary>
/// Imgur, as "Fix Imgur API" and "Embed comment images" reach it through "E2E fake Reddit": its API under
/// <c>&lt;base&gt;/_imgur/</c> (<c>https://api.imgur.com/</c>) and its images under <c>&lt;base&gt;/_media/i.imgur.com/</c>.
/// It holds albums, which posts and comments link at Imgur's own address (<see cref="ImgurAlbum.Link"/>), and the images
/// the app uploaded.
/// </summary>
public sealed class Imgur
{
    private readonly RedditWorld world;
    private readonly List<ImgurAlbum> albums = [];
    private readonly Dictionary<string, MediaAsset> images = new(StringComparer.Ordinal);
    private readonly HashSet<string> videos = new(StringComparer.Ordinal);
    private readonly List<ImgurUpload> uploads = [];

    internal Imgur(RedditWorld world) => this.world = world;

    /// <summary>The albums, oldest first.</summary>
    public ImmutableArray<ImgurAlbum> Albums
    {
        get
        {
            lock (world.Sync)
            {
                return [.. albums];
            }
        }
    }

    /// <summary>The uploads the app sent to <c>POST /3/image</c>, oldest first, accepted or refused.</summary>
    public ImmutableArray<ImgurUpload> Uploads
    {
        get
        {
            lock (world.Sync)
            {
                return [.. uploads];
            }
        }
    }

    /// <summary>
    /// Adds an album titled <paramref name="title"/> of <paramref name="images"/> JPEGs, then <paramref name="videos"/>
    /// MP4 videos, on Imgur's gallery when <paramref name="inGallery"/> (linked <c>https://imgur.com/gallery/&lt;id&gt;</c>,
    /// else <c>https://imgur.com/a/&lt;id&gt;</c>).
    /// </summary>
    public ImgurAlbum AddAlbum(string title, int images, bool inGallery = false, int videos = 0)
    {
        lock (world.Sync)
        {
            var id = NewId();
            var album = new ImgurAlbum(id, title, inGallery, [
                .. Enumerable.Range(0, images).Select(_ => AddImage(MediaAsset.Jpeg)),
                .. Enumerable.Range(0, videos).Select(_ => AddVideo()),
            ]);
            albums.Add(album);
            return album;
        }
    }

    internal void Reset()
    {
        albums.Clear();
        images.Clear();
        videos.Clear();
        uploads.Clear();
    }

    internal ImgurAlbum? FindAlbum(string id) => albums.FirstOrDefault(album => album.Id == id);

    /// <summary>
    /// The image an <c>i.imgur.com</c> path names: <c>&lt;id&gt;.&lt;ext&gt;</c>, or a smaller size of it,
    /// <c>&lt;id&gt;&lt;s|b|t|m|l|h&gt;.&lt;ext&gt;</c>. Imgur serves an image in its own format whatever the extension
    /// asks for.
    /// </summary>
    internal MediaAsset? FindImageFile(string name)
    {
        var id = Path.GetFileNameWithoutExtension(name);
        if (images.TryGetValue(id, out var image))
        {
            // A video's own address is its MP4; any other is a still of it, as Imgur serves its thumbnails.
            return videos.Contains(id) && Path.GetExtension(name) != ".mp4" ? MediaAsset.Jpeg : image;
        }

        return id.Length > 1 && "sbtmlh".Contains(id[^1], StringComparison.Ordinal) && images.TryGetValue(id[..^1], out var sized)
            ? videos.Contains(id[..^1]) ? MediaAsset.Jpeg : sized
            : null;
    }

    /// <summary>Takes an upload: stores it as an image and answers it, or records it refused.</summary>
    internal ImgurImage? Upload(DateTimeOffset at, string? contentType, string? authorization, byte[] body)
    {
        var asset = Sniff(body);
        var accepted = asset is not null && contentType is not null && !contentType.StartsWith("application/x-www-form-urlencoded", StringComparison.Ordinal);
        uploads.Add(new ImgurUpload(at, contentType, authorization, body.Length, accepted));
        return accepted ? AddImage(asset!) : null;
    }

    private ImgurImage AddImage(MediaAsset asset)
    {
        var id = NewId();
        images[id] = asset;
        return new ImgurImage(id, asset.ContentType, world.MediaUrl($"i.imgur.com/{id}.{Extension(asset)}"), asset.Width, asset.Height);
    }

    // A video on Imgur: its link and its "mp4" are both its MP4.
    private ImgurImage AddVideo()
    {
        var id = NewId();
        images[id] = MediaAsset.Mp4;
        videos.Add(id);
        var link = world.MediaUrl($"i.imgur.com/{id}.mp4");
        return new ImgurImage(id, MediaAsset.Mp4.ContentType, link, MediaAsset.Mp4.Width, MediaAsset.Mp4.Height) { Mp4 = link };
    }

    // Imgur's ids are letters and digits, seven of them today; BaconReader takes an album's only when it is just those.
    private string NewId() => "e2e" + world.NewId();

    private static string Extension(MediaAsset asset) => asset.ContentType == "image/jpeg" ? "jpeg" : asset.Extension;

    // An uploaded file as the image it is, by its first bytes: a PNG (BaconReader's drawings) or a JPEG (a photo).
    private static MediaAsset? Sniff(byte[] body) =>
        body switch
        {
            [0x89, (byte)'P', (byte)'N', (byte)'G', ..] => new MediaAsset("image/png", "png", 0, 0, body),
            [0xFF, 0xD8, ..] => new MediaAsset("image/jpeg", "jpg", 0, 0, body),
            _ => null,
        };
}

/// <summary>An Imgur album: its title, its images, and whether it is on Imgur's gallery.</summary>
public sealed record ImgurAlbum(string Id, string Title, bool InGallery, ImmutableArray<ImgurImage> Images)
{
    /// <summary>The album's address, as a post or a comment links it: Imgur's own.</summary>
    public string Link => InGallery ? $"https://imgur.com/gallery/{Id}" : $"https://imgur.com/a/{Id}";
}

/// <summary>
/// An image on Imgur: its id, its type and its file's URL, at the fake's address, and for a video its MP4's
/// (<see cref="Mp4"/>, empty for a still image, as Imgur sends it).
/// </summary>
public sealed record ImgurImage(string Id, string Type, string Link, int Width, int Height)
{
    /// <summary>The video's MP4, as Imgur's "mp4": empty for a still image, never left out.</summary>
    public string Mp4 { get; init; } = "";

    /// <summary>Whether it is a video.</summary>
    public bool IsVideo => Mp4.Length > 0;
}

/// <summary>An upload the app sent: its content type and authorization, its size in bytes and whether Imgur took it.</summary>
public sealed record ImgurUpload(DateTimeOffset At, string? ContentType, string? Authorization, int Length, bool Accepted);
