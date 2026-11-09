// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Collections.Immutable;

namespace BaconReader.FakeReddit.World;

/// <summary>
/// RedGIFs, as "Fix Redgifs API", "Fix list thumbnails" and "Improve post media loading" reach it through "E2E fake
/// Reddit": its API under <c>&lt;base&gt;/_redgifs/</c> (<c>https://api.redgifs.com/</c>) and its videos and images
/// under <c>&lt;base&gt;/_media/media.redgifs.com/</c>, where its API's answers point. It holds the videos, which posts
/// link at RedGIFs' own address (<see cref="RedGif.Link"/>), the tokens it gave, and what the app asked.
/// </summary>
public sealed class RedGifs
{
    private readonly RedditWorld world;
    private readonly List<RedGif> gifs = [];
    private readonly Dictionary<string, string> tokens = new(StringComparer.Ordinal);
    private readonly HashSet<string> clientTokens = new(StringComparer.Ordinal);
    private readonly List<RedGifsRequest> requests = [];
    private int nextToken;
    private int nextId;

    internal RedGifs(RedditWorld world) => this.world = world;

    /// <summary>The tokens the app asked for and the gif lookups it made, oldest first.</summary>
    public ImmutableArray<RedGifsRequest> Requests
    {
        get
        {
            lock (world.Sync)
            {
                return [.. requests];
            }
        }
    }

    /// <summary>
    /// Adds a video, with its picture and its thumbnail; <paramref name="state"/> says whether RedGIFs still has it.
    /// </summary>
    public RedGif AddGif(RedGifState state = RedGifState.Available)
    {
        lock (world.Sync)
        {
            // RedGIFs' ids are lowercase words ("watchfulwaterloggedcat"), letters only: "Fix list thumbnails" takes
            // only those.
            var id = "efake" + Letters(nextId++);
            var gif = new RedGif(
                id,
                state,
                world.AddMedia($"media.redgifs.com/{Capitalized(id)}.mp4", MediaAsset.Mp4.ContentType, MediaAsset.Mp4.Bytes),
                world.AddMedia($"media.redgifs.com/{Capitalized(id)}-mobile.mp4", MediaAsset.Mp4.ContentType, MediaAsset.Mp4.Bytes),
                world.AddMedia($"media.redgifs.com/{Capitalized(id)}-poster.jpg", MediaAsset.Jpeg.ContentType, MediaAsset.Jpeg.Bytes),
                world.AddMedia($"media.redgifs.com/{Capitalized(id)}-mobile.jpg", MediaAsset.Jpeg.ContentType, MediaAsset.Jpeg.Bytes));
            gifs.Add(gif);
            return gif;
        }
    }

    /// <summary>
    /// Stops taking the tokens it gave, as RedGIFs does when the phone's address changes: each is refused, 401
    /// WrongSender, until the app asks for a new one.
    /// </summary>
    public void ForgetTokens()
    {
        lock (world.Sync)
        {
            foreach (var token in tokens.Keys.ToList())
            {
                tokens[token] = "";
            }
        }
    }

    internal void Reset()
    {
        gifs.Clear();
        tokens.Clear();
        clientTokens.Clear();
        requests.Clear();
        nextToken = 0;
        nextId = 0;
    }

    /// <summary>Gives a temporary token to <paramref name="userAgent"/>: RedGIFs takes it only with the same User-Agent.</summary>
    internal string IssueToken(string userAgent)
    {
        var token = $"e2e-redgifs-token-{++nextToken}";
        tokens[token] = userAgent;
        requests.Add(new RedGifsRequest(RedGifsRequestKind.TemporaryToken, null, userAgent, null, 200));
        return token;
    }

    /// <summary>
    /// Gives BaconReader's own OAuth client a token, as RedGIFs did on 2026-11-08. It isn't tied to a User-Agent.
    /// </summary>
    internal string IssueClientToken()
    {
        var token = $"e2e-redgifs-client-token-{++nextToken}";
        clientTokens.Add(token);
        requests.Add(new RedGifsRequest(RedGifsRequestKind.ClientToken, null, "", null, 200));
        return token;
    }

    /// <summary>Whether <paramref name="token"/> is one <see cref="IssueClientToken"/> gave.</summary>
    internal bool IsClientToken(string token) => clientTokens.Contains(token);

    /// <summary>The User-Agent <paramref name="token"/> was given to, or null for a token RedGIFs never gave.</summary>
    internal string? UserAgentOf(string token) => tokens.GetValueOrDefault(token);

    /// <summary>The video with the id <paramref name="id"/>, or null for one RedGIFs never had.</summary>
    public RedGif? FindGif(string id) => gifs.FirstOrDefault(gif => string.Equals(gif.Id, id, StringComparison.OrdinalIgnoreCase));

    internal void RecordLookup(string id, string? token, string userAgent, int status) =>
        requests.Add(new RedGifsRequest(RedGifsRequestKind.Gif, id, userAgent, token, status));

    // 0 → "a", 25 → "z", 26 → "ba": base 26 in letters.
    private static string Letters(int number)
    {
        var letters = "";
        do
        {
            letters = (char)('a' + (number % 26)) + letters;
            number /= 26;
        }
        while (number > 0);
        return letters;
    }

    // RedGIFs names a video's files by its id in CamelCase: watchfulwaterloggedcat → WatchfulWaterloggedCat.
    private static string Capitalized(string id) => char.ToUpperInvariant(id[0]) + id[1..];
}

/// <summary>Whether RedGIFs still has a video: it answers a deleted one 410 and one it never had 404.</summary>
public enum RedGifState
{
    Available,
    Deleted,
}

/// <summary>
/// A RedGIFs video: its id, whether RedGIFs has it, and its files' URLs, at the fake's address, named as RedGIFs names
/// them: <c>&lt;Id&gt;.mp4</c>, <c>-mobile.mp4</c>, <c>-poster.jpg</c> and <c>-mobile.jpg</c>.
/// </summary>
public sealed record RedGif(string Id, RedGifState State, string Hd, string Sd, string Poster, string Thumbnail)
{
    /// <summary>Its page, as a post links it: RedGIFs' own address.</summary>
    public string Link => $"https://www.redgifs.com/watch/{Id}";
}

/// <summary>What the app asked RedGIFs: a temporary token, or a video's information.</summary>
public enum RedGifsRequestKind
{
    TemporaryToken,
    ClientToken,
    Gif,
}

/// <summary>A request the app sent RedGIFs: what it was, its video's id, its User-Agent and token, and the status answered.</summary>
public sealed record RedGifsRequest(RedGifsRequestKind Kind, string? GifId, string UserAgent, string? Token, int Status);
