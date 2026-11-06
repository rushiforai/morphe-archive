// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Collections.Immutable;
using BaconReader.FakeReddit.World;

namespace BaconReader.E2E.Infrastructure.Reddit;

/// <summary>
/// RedGIFs, which the fake Reddit answers too ("E2E fake Reddit" moves RedGIFs' API to it), in the Gherkins' words.
/// Posts link a video at RedGIFs' own address, <c>https://www.redgifs.com/watch/&lt;id&gt;</c>, with no thumbnail of
/// Reddit's: BaconReader and "Fix list thumbnails" know a RedGIFs video by that address and ask RedGIFs for it.
/// </summary>
public sealed partial class Reddit
{
    /// <summary>"Reddit has a RedGIFs post "&lt;title&gt;" in r/&lt;subreddit&gt;": a link post to a video RedGIFs has.</summary>
    public void HasARedGifsPost(string title, string subreddit) =>
        world.AddPost(subreddit, title, post => post.LinkingTo(world.RedGifs.AddGif().Link));

    /// <summary>"Reddit has a RedGIFs post "&lt;title&gt;" in r/&lt;subreddit&gt; whose video was deleted": RedGIFs answers it 410.</summary>
    public void HasARedGifsPostWhoseVideoWasDeleted(string title, string subreddit) =>
        world.AddPost(subreddit, title, post => post.LinkingTo(world.RedGifs.AddGif(RedGifState.Deleted).Link));

    /// <summary>"Reddit has a RedGIFs post "&lt;title&gt;" in r/&lt;subreddit&gt; whose video RedGIFs never had": RedGIFs answers it 404.</summary>
    public void HasARedGifsPostWhoseVideoRedGifsNeverHad(string title, string subreddit) =>
        world.AddPost(subreddit, title, post => post.LinkingTo("https://www.redgifs.com/watch/neverthereatall"));

    /// <summary>
    /// "the phone joins another network": RedGIFs ties a token to the phone's address, so it refuses each token it gave
    /// (401 WrongSender) until BaconReader asks for a new one. The phone's network doesn't change: the fake RedGIFs
    /// answers as RedGIFs does once it has.
    /// </summary>
    public void ThePhoneJoinsAnotherNetwork()
    {
        tokensBeforeTheNetworkChanged = world.RedGifs.Requests.Count(request => request.Kind == RedGifsRequestKind.TemporaryToken);
        world.RedGifs.ForgetTokens();
    }

    /// <summary>
    /// "RedGIFs answered the video of "&lt;title&gt;" to BaconReader's temporary token and User-Agent": the lookups of
    /// the RedGIFs post's video, each with its status, whether its token was one RedGIFs gave, and its User-Agent.
    /// </summary>
    public RedGifsLookupsSnapshot ReadRedGifsLookupsOfTheVideoOf(string title)
    {
        var id = RedGifOf(title);
        return new(title, [.. world.RedGifs.Requests
            .Where(request => request.Kind == RedGifsRequestKind.Gif && request.GifId == id)
            .Select(request => new RedGifsLookup(request.Status, request.Token is not null, request.UserAgent))]);
    }

    /// <summary>
    /// "BaconReader asked RedGIFs for a new temporary token": how many temporary tokens BaconReader asked for, before
    /// and since the phone joined another network.
    /// </summary>
    public RedGifsTokensSnapshot ReadRedGifsTemporaryTokens()
    {
        var all = world.RedGifs.Requests.Count(request => request.Kind == RedGifsRequestKind.TemporaryToken);
        return new(tokensBeforeTheNetworkChanged ?? all, all - (tokensBeforeTheNetworkChanged ?? all));
    }

    /// <summary>"RedGIFs served the thumbnail of "&lt;title&gt;"": the requests for the RedGIFs post's video's thumbnail, each one's status.</summary>
    public RedGifsThumbnailRequestsSnapshot ReadRequestsForTheRedGifsThumbnailOf(string title)
    {
        var path = new Uri(world.RedGifs.FindGif(RedGifOf(title))!.Thumbnail).AbsolutePath;
        return new(title, [.. world.Requests.Where(request => request.Method == "GET" && request.Path == path).Select(request => request.Status)]);
    }

    /// <summary>Waits until RedGIFs served the thumbnail of the RedGIFs post "&lt;title&gt;": "Fix list thumbnails" asks for it as the list shows the post.</summary>
    public Task WaitUntilTheRedGifsThumbnailOfThePostIsServedAsync(string title) =>
        WaitUntilAsync(
            () => ReadRequestsForTheRedGifsThumbnailOf(title).Statuses.Contains(200),
            TimeSpan.FromSeconds(15),
            $"RedGIFs didn't serve the thumbnail of \"{title}\" within 15 s.");

    private int? tokensBeforeTheNetworkChanged;

    // The id of the video a RedGIFs post links: the last part of its address, https://www.redgifs.com/watch/<id>.
    private string RedGifOf(string title) =>
        PostTitled(title).Url?.Split('/')[^1] ?? throw new InvalidOperationException($"\"{title}\" isn't a RedGIFs post.");
}

/// <summary>A lookup of a RedGIFs video: the status RedGIFs answered, whether it carried a token RedGIFs gave, and its User-Agent.</summary>
public sealed record RedGifsLookup(int Status, bool WithAToken, string UserAgent);

/// <summary>The lookups of the video of the RedGIFs post titled <c>Title</c>, oldest first.</summary>
public sealed record RedGifsLookupsSnapshot(string Title, ImmutableArray<RedGifsLookup> Lookups);

/// <summary>How many temporary tokens BaconReader asked RedGIFs for, before and since the phone joined another network.</summary>
public sealed record RedGifsTokensSnapshot(int Before, int Since);

/// <summary>The requests for the thumbnail of the video of the RedGIFs post titled <c>Title</c>, each one's status.</summary>
public sealed record RedGifsThumbnailRequestsSnapshot(string Title, ImmutableArray<int> Statuses);
