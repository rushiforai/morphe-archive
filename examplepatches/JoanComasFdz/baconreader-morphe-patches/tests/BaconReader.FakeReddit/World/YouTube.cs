// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

namespace BaconReader.FakeReddit.World;

/// <summary>
/// YouTube, as "Embed comment images" and "Fix list thumbnails" reach it through "E2E fake Reddit": its oEmbed endpoint
/// under <c>&lt;base&gt;/_youtube/oembed</c> (<c>https://www.youtube.com/oembed</c>), which gives a video's title and
/// channel, and its thumbnails under <c>&lt;base&gt;/_media/i.ytimg.com/</c>. It holds the videos, which comments and
/// posts link at YouTube's own address (<see cref="YouTubeVideo.Link"/>).
/// </summary>
public sealed class YouTube
{
    private readonly RedditWorld world;
    private readonly List<YouTubeVideo> videos = [];
    private int nextId;

    internal YouTube(RedditWorld world) => this.world = world;

    /// <summary>
    /// Adds a video titled <paramref name="title"/> on the channel <paramref name="channel"/> (its @handle, without the
    /// "@"), with its thumbnails; <paramref name="removed"/> makes one YouTube no longer has, which oEmbed answers 404.
    /// </summary>
    public YouTubeVideo AddVideo(string title, string channel, bool removed = false)
    {
        lock (world.Sync)
        {
            // A video id is 11 letters, digits, "-" or "_": the patches take only those.
            var id = $"e2eVideo{nextId++:D3}";
            var video = new YouTubeVideo(
                id,
                title,
                channel,
                removed,
                world.AddMedia($"i.ytimg.com/vi/{id}/mqdefault.jpg", MediaAsset.Jpeg.ContentType, MediaAsset.Jpeg.Bytes));
            world.AddMedia($"i.ytimg.com/vi/{id}/hqdefault.jpg", MediaAsset.Jpeg.ContentType, MediaAsset.Jpeg.Bytes);
            videos.Add(video);
            return video;
        }
    }

    /// <summary>The video titled <paramref name="title"/>, or null.</summary>
    public YouTubeVideo? FindVideoTitled(string title) => videos.FirstOrDefault(video => video.Title == title);

    /// <summary>The video with the id <paramref name="id"/>, or null for one YouTube never had.</summary>
    public YouTubeVideo? FindVideo(string id) => videos.FirstOrDefault(video => video.Id == id);

    internal void Reset()
    {
        videos.Clear();
        nextId = 0;
    }
}

/// <summary>
/// A YouTube video: its id, title, channel's @handle (without the "@"), whether YouTube removed it, and the URL of its
/// 16:9 thumbnail (<c>mqdefault.jpg</c>) at the fake's address.
/// </summary>
public sealed record YouTubeVideo(string Id, string Title, string Channel, bool Removed, string Thumbnail)
{
    /// <summary>Its watch page, as a comment or a post links it: YouTube's own address.</summary>
    public string Link => $"https://www.youtube.com/watch?v={Id}";

    /// <summary>Its short link, at the second <paramref name="seconds"/> when that is given: <c>https://youtu.be/&lt;id&gt;?t=83</c>.</summary>
    public string ShortLink(int? seconds = null) => $"https://youtu.be/{Id}" + (seconds is { } at ? $"?t={at}" : "");
}
