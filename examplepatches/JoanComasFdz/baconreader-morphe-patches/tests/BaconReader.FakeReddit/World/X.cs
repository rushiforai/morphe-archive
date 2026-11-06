// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

namespace BaconReader.FakeReddit.World;

/// <summary>
/// X (Twitter), as "Embed comment images" reaches it through "E2E fake Reddit": X's embed service, the one embedded
/// posts on web pages use, under <c>&lt;base&gt;/_x/tweet-result</c> (<c>https://cdn.syndication.twimg.com/</c>), and
/// its photos and video stills under <c>&lt;base&gt;/_media/pbs.twimg.com/</c>. It holds the posts, which comments link
/// at X's own address (<see cref="XPost.Link"/>).
/// </summary>
public sealed class X
{
    private readonly RedditWorld world;
    private readonly List<XPost> posts = [];
    private int nextId;

    internal X(RedditWorld world) => this.world = world;

    /// <summary>
    /// Adds a post by <paramref name="name"/> (@<paramref name="handle"/>) saying <paramref name="text"/>, made at
    /// <paramref name="createdAt"/>, with a photo or a video under it (<paramref name="media"/>); a
    /// <paramref name="long"/> one is longer than X's embed service sends, which cuts it.
    /// </summary>
    public XPost AddPost(string name, string handle, string text, DateTimeOffset createdAt, XMedia media = XMedia.None, bool @long = false)
    {
        lock (world.Sync)
        {
            // A post's id is a number: the patch takes only digits.
            var id = (1990000000000000000L + nextId++).ToString(System.Globalization.CultureInfo.InvariantCulture);
            string? image = media switch
            {
                XMedia.Photo => world.AddMedia($"pbs.twimg.com/media/E2e{id}.jpg", MediaAsset.Jpeg.ContentType, MediaAsset.Jpeg.Bytes),
                XMedia.Video => world.AddMedia($"pbs.twimg.com/amplify_video_thumb/{id}/img/E2e{id}.jpg", MediaAsset.Jpeg.ContentType, MediaAsset.Jpeg.Bytes),
                _ => null,
            };
            var post = new XPost(id, name, handle, text, createdAt, media, image, @long);
            posts.Add(post);
            return post;
        }
    }

    /// <summary>The post whose text starts with <paramref name="text"/>, or null.</summary>
    public XPost? FindPostStarting(string text) => posts.FirstOrDefault(post => post.Text.StartsWith(text, StringComparison.Ordinal));

    /// <summary>The post with the id <paramref name="id"/>, or null for one X doesn't have.</summary>
    public XPost? FindPost(string id) => posts.FirstOrDefault(post => post.Id == id);

    internal void Reset()
    {
        posts.Clear();
        nextId = 0;
    }
}

/// <summary>What an X post shows under its text.</summary>
public enum XMedia
{
    None,
    Photo,
    Video,
}

/// <summary>
/// An X post: its id, its author's name and @handle, its text, when it was made, its photo or video, its photo's or
/// video still's URL at the fake's address (null without one), and whether it is longer than X's embed service sends.
/// </summary>
public sealed record XPost(string Id, string Name, string Handle, string Text, DateTimeOffset CreatedAt, XMedia Media, string? Image, bool Long)
{
    /// <summary>Its page, as a comment links it: X's own address.</summary>
    public string Link => $"https://x.com/{Handle}/status/{Id}";
}
