// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Collections.Immutable;
using BaconReader.FakeReddit.World;

namespace BaconReader.E2E.Infrastructure.Reddit;

/// <summary>
/// X and Bluesky, which the fake Reddit answers too ("E2E fake Reddit" moves X's embed service and Bluesky's public API
/// to it), in the Gherkins' words. Comments link a post at the service's own address, which the patch knows it by.
/// Every post is made on 2 October 2025, so the patch shows its date as "Oct 2, 2025" in any later year.
/// </summary>
public sealed partial class Reddit
{
    /// <summary>The address of an X post X doesn't have: a status id no post of the fake X takes.</summary>
    internal const string MissingXPost = "https://x.com/e2ewriter/status/1999999999999999999";

    /// <summary>The address of a Bluesky post Bluesky doesn't have: a record key no post of the fake Bluesky takes.</summary>
    internal const string MissingBlueskyPost = "https://bsky.app/profile/e2eposter.bsky.social/post/3e2epost99999";

    private static readonly DateTimeOffset SocialPostDate = new(2025, 10, 2, 15, 22, 58, TimeSpan.Zero);

    // What follows the start of a long X post: enough to make it longer than the 279 characters X's embed service sends.
    private const string LongPostRest =
        " that goes on and on about many things, far longer than X's embed service sends in one piece, so that the"
        + " service cuts it somewhere around its two hundred and eightieth character, and the patch marks the cut. It"
        + " keeps going after that, with more words than anyone reads in a comment.";

    /// <summary>"X has a post by "&lt;name&gt;" @&lt;handle&gt; saying "&lt;text&gt;"", with <paramref name="media"/> under it ("with a photo", "with a video").</summary>
    public void XHasAPost(string name, string handle, string text, XMedia media = XMedia.None) =>
        world.X.AddPost(name, handle.TrimStart('@'), text, SocialPostDate, media);

    /// <summary>"X has a long post by "&lt;name&gt;" @&lt;handle&gt; starting "&lt;start&gt;"": longer than X's embed service sends, which cuts it.</summary>
    public void XHasALongPost(string name, string handle, string start) =>
        world.X.AddPost(name, handle.TrimStart('@'), start + LongPostRest, SocialPostDate, @long: true);

    /// <summary>"Bluesky has a post by "&lt;name&gt;" @&lt;handle&gt; saying "&lt;text&gt;"", with <paramref name="embed"/> under it ("with photos", "with a video", "with a link card", "with a gallery").</summary>
    public void BlueskyHasAPost(string name, string handle, string text, BlueskyEmbed embed = BlueskyEmbed.None) =>
        world.Bluesky.AddPost(name, handle.TrimStart('@'), text, SocialPostDate, embed);

    /// <summary>"… shows its link's address": the address of the X post that starts with "&lt;text&gt;", as a comment links it.</summary>
    public LinkSnapshot ReadTheLinkToTheXPost(string text) => Checked<LinkSnapshot>(new($"the X post \"{text}\"", XPostStarting(text).Link), text);

    /// <summary>"… shows its link's address": the address of the X post X doesn't have, as a comment links it.</summary>
    public LinkSnapshot ReadTheLinkToTheMissingXPost() => Checked<LinkSnapshot>(new("the X post X doesn't have", MissingXPost));

    /// <summary>"… shows its link's address": the address of the Bluesky post that says "&lt;text&gt;", as a comment links it.</summary>
    public LinkSnapshot ReadTheLinkToTheBlueskyPost(string text) => Checked<LinkSnapshot>(new($"the Bluesky post \"{text}\"", BlueskyPostSaying(text).Link), text);

    /// <summary>"… shows its link's address": the address of the Bluesky post Bluesky doesn't have, as a comment links it.</summary>
    public LinkSnapshot ReadTheLinkToTheMissingBlueskyPost() => Checked<LinkSnapshot>(new("the Bluesky post Bluesky doesn't have", MissingBlueskyPost));

    /// <summary>"X served the small photo of "&lt;text&gt;"": the requests for the post's photo, each with whether it asked for the small one and its status.</summary>
    public XPhotoRequestsSnapshot ReadRequestsForThePhotoOfTheXPost(string text)
    {
        var path = new Uri(XPostStarting(text).Image!).AbsolutePath;
        return Checked<XPhotoRequestsSnapshot>(new(text, [.. world.Requests
            .Where(request => request.Method == "GET" && request.Path == path)
            .Select(request => new XPhotoRequest(request.Query.Contains("name=small", StringComparison.Ordinal), request.Status))]), text);
    }

    /// <summary>Waits until X served the photo of the post that starts with "&lt;text&gt;": the patch asks for it once the post shows.</summary>
    public Task WaitUntilThePhotoOfTheXPostIsServedAsync(string text) =>
        WaitUntilAsync(
            () => ReadRequestsForThePhotoOfTheXPost(text).Requests.Any(request => request.Status == 200),
            TimeSpan.FromSeconds(15),
            $"X didn't serve the photo of \"{text}\" within 15 s.");

    internal XPost XPostStarting(string text) =>
        world.X.FindPostStarting(text)
            ?? throw new InvalidOperationException($"The scenario's X has no post starting \"{text}\": a Given line makes it first.");

    internal BlueskyPost BlueskyPostSaying(string text) =>
        world.Bluesky.FindPostSaying(text)
            ?? throw new InvalidOperationException($"The scenario's Bluesky has no post \"{text}\": a Given line makes it first.");
}

/// <summary>The address of a link a comment holds, and what it links: "the X post "…"".</summary>
public sealed record LinkSnapshot(string What, string Address);

/// <summary>A request for an X post's photo: whether it asked for the small one (<c>?name=small</c>), and its status.</summary>
public sealed record XPhotoRequest(bool Small, int Status);

/// <summary>The requests for the photo of the X post that starts with <c>Text</c>, oldest first.</summary>
public sealed record XPhotoRequestsSnapshot(string Text, ImmutableArray<XPhotoRequest> Requests);
