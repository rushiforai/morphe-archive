// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Collections.Immutable;
using BaconReader.FakeReddit.World;

namespace BaconReader.E2E.Infrastructure.Reddit;

/// <summary>
/// YouTube, which the fake Reddit answers too ("E2E fake Reddit" moves YouTube's oEmbed endpoint and thumbnails to it),
/// in the Gherkins' words. Comments and posts link a video at YouTube's own address, which the patches know it by.
/// </summary>
public sealed partial class Reddit
{
    /// <summary>"YouTube has a video "&lt;title&gt;" on the channel "@&lt;channel&gt;"".</summary>
    public void YouTubeHasAVideo(string title, string channel) => world.YouTube.AddVideo(title, channel.TrimStart('@'));

    /// <summary>"YouTube has a Short "&lt;title&gt;" on the channel "@&lt;channel&gt;"": a video, which a comment links as a Short.</summary>
    public void YouTubeHasAShort(string title, string channel) => world.YouTube.AddVideo(title, channel.TrimStart('@'));

    /// <summary>"YouTube has removed its video "&lt;title&gt;"": oEmbed answers it 404, as YouTube does.</summary>
    public void YouTubeHasRemovedItsVideo(string title) => world.YouTube.AddVideo(title, "e2e_creator", removed: true);

    /// <summary>"Reddit has a link post "&lt;title&gt;" in r/&lt;subreddit&gt; linking to the YouTube video "&lt;video&gt;"", with no thumbnail or preview of Reddit's.</summary>
    public void HasALinkPostLinkingToTheYouTubeVideo(string title, string subreddit, string video) =>
        world.AddPost(subreddit, title, post => post.LinkingTo(YouTubeVideoTitled(video).Link));

    /// <summary>"… the address of the YouTube video "&lt;title&gt;"": the video's watch page, as a comment links it.</summary>
    public YouTubeVideoSnapshot ReadTheYouTubeVideo(string title) => new(title, YouTubeVideoTitled(title).Link);

    /// <summary>"YouTube served the thumbnail of "&lt;title&gt;"": the requests for the video's 16:9 thumbnail, each one's status.</summary>
    public YouTubeThumbnailRequestsSnapshot ReadRequestsForTheYouTubeThumbnailOf(string title)
    {
        var path = new Uri(YouTubeVideoTitled(title).Thumbnail).AbsolutePath;
        return new(title, [.. world.Requests.Where(request => request.Method == "GET" && request.Path == path).Select(request => request.Status)]);
    }

    /// <summary>Waits until YouTube served the thumbnail of the video "&lt;title&gt;": the patches ask for it as they show the link or the post.</summary>
    public Task WaitUntilTheYouTubeThumbnailOfTheVideoIsServedAsync(string title) =>
        WaitUntilAsync(
            () => ReadRequestsForTheYouTubeThumbnailOf(title).Statuses.Contains(200),
            TimeSpan.FromSeconds(15),
            $"YouTube didn't serve the thumbnail of \"{title}\" within 15 s.");

    internal YouTubeVideo YouTubeVideoTitled(string title) =>
        world.YouTube.FindVideoTitled(title)
            ?? throw new InvalidOperationException($"The scenario's YouTube has no video \"{title}\": a Given line makes it first.");
}

/// <summary>A YouTube video, by its title: its watch page's address, which a comment links.</summary>
public sealed record YouTubeVideoSnapshot(string Title, string Address);

/// <summary>The requests for the thumbnail of the YouTube video titled <c>Title</c>, each one's status.</summary>
public sealed record YouTubeThumbnailRequestsSnapshot(string Title, ImmutableArray<int> Statuses);
