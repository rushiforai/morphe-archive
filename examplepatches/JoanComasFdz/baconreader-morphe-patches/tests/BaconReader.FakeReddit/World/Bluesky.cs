// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

namespace BaconReader.FakeReddit.World;

/// <summary>
/// Bluesky, as "Embed comment images" reaches it through "E2E fake Reddit": its public API under
/// <c>&lt;base&gt;/_bluesky/xrpc/…</c> (<c>https://public.api.bsky.app/</c>), and its images and video stills under
/// <c>&lt;base&gt;/_media/cdn.bsky.app/</c> and <c>…/video.bsky.app/</c>, where its answers point. It holds the posts,
/// which comments link at Bluesky's own address (<see cref="BlueskyPost.Link"/>).
/// </summary>
public sealed class Bluesky
{
    private readonly RedditWorld world;
    private readonly List<BlueskyPost> posts = [];
    private int nextId;

    internal Bluesky(RedditWorld world) => this.world = world;

    /// <summary>
    /// Adds a post by <paramref name="name"/> (@<paramref name="handle"/>, as <c>e2e.bsky.social</c>) saying
    /// <paramref name="text"/>, made at <paramref name="createdAt"/>, with <paramref name="embed"/> under it.
    /// </summary>
    public BlueskyPost AddPost(string name, string handle, string text, DateTimeOffset createdAt, BlueskyEmbed embed = BlueskyEmbed.None)
    {
        lock (world.Sync)
        {
            // A post's record key: Bluesky's are 13 letters and digits.
            var key = $"3e2epost{nextId++:D5}";
            var did = "did:plc:e2e" + handle.Replace(".", "", StringComparison.Ordinal);
            string? image = embed switch
            {
                BlueskyEmbed.None => null,
                BlueskyEmbed.Video => world.AddMedia($"video.bsky.app/watch/{did}/bafkreie2e{key}/thumbnail.jpg", MediaAsset.Jpeg.ContentType, MediaAsset.Jpeg.Bytes),
                _ => world.AddMedia($"cdn.bsky.app/img/feed_thumbnail/plain/{did}/bafkreie2e{key}", MediaAsset.Jpeg.ContentType, MediaAsset.Jpeg.Bytes),
            };
            var post = new BlueskyPost(key, did, name, handle, text, createdAt, embed, image);
            posts.Add(post);
            return post;
        }
    }

    /// <summary>The post that says <paramref name="text"/>, or null.</summary>
    public BlueskyPost? FindPostSaying(string text) => posts.FirstOrDefault(post => post.Text == text);

    /// <summary>The post of <paramref name="actor"/> (its handle or its DID) with the record key <paramref name="key"/>, or null.</summary>
    public BlueskyPost? FindPost(string actor, string key) =>
        posts.FirstOrDefault(post => post.Key == key && (post.Handle == actor || post.Did == actor));

    internal void Reset()
    {
        posts.Clear();
        nextId = 0;
    }
}

/// <summary>What a Bluesky post shows under its text, as its embed's type names it.</summary>
public enum BlueskyEmbed
{
    None,

    /// <summary><c>app.bsky.embed.images</c>: photos.</summary>
    Images,

    /// <summary><c>app.bsky.embed.video</c>: a video, shown by its still.</summary>
    Video,

    /// <summary><c>app.bsky.embed.external</c>: a link's preview card, with its picture.</summary>
    External,

    /// <summary><c>app.bsky.embed.gallery</c>: photos in a gallery, as Bluesky sent posts of several photos on 2026-11-04.</summary>
    Gallery,
}

/// <summary>
/// A Bluesky post: its record key, its author's DID, name and handle, its text, when it was made, its embed, and its
/// picture's URL at the fake's address (null without one).
/// </summary>
public sealed record BlueskyPost(string Key, string Did, string Name, string Handle, string Text, DateTimeOffset CreatedAt, BlueskyEmbed Embed, string? Image)
{
    /// <summary>Its page, as a comment links it: Bluesky's own address.</summary>
    public string Link => $"https://bsky.app/profile/{Handle}/post/{Key}";
}
