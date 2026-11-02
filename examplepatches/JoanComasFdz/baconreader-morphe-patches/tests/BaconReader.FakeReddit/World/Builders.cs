// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.FakeReddit.Json;

namespace BaconReader.FakeReddit.World;

/// <summary>
/// What a post holds, in a test's words: <c>world.AddPost("e2e", "Weekly thread", post => post.WithImage())</c>. Each
/// member fills in everything Reddit sends for it (the URL, the thumbnail, the preview), with media the fake serves.
/// </summary>
public sealed class PostBuilder
{
    private readonly RedditWorld world;

    internal PostBuilder(RedditWorld world, Post post)
    {
        this.world = world;
        Post = post;
    }

    /// <summary>The post being built.</summary>
    public Post Post { get; }

    /// <summary>Posted by <paramref name="author"/>.</summary>
    public PostBuilder By(string author)
    {
        Post.Author = author;
        return this;
    }

    /// <summary>A text post whose text is <paramref name="markdown"/>.</summary>
    public PostBuilder WithText(string markdown)
    {
        Post.Text = markdown;
        Post.Url = null;
        return this;
    }

    /// <summary>A link post to <paramref name="url"/>.</summary>
    public PostBuilder LinkingTo(string url)
    {
        Post.Text = null;
        Post.Url = url;
        return this;
    }

    /// <summary>An image post, as Reddit sends one uploaded to i.redd.it: a JPEG unless <paramref name="asset"/> says otherwise.</summary>
    public PostBuilder WithImage(MediaAsset? asset = null)
    {
        var image = asset ?? MediaAsset.Jpeg;
        var url = world.AddMedia($"i.redd.it/{world.NewId()}.{image.Extension}", image.ContentType, image.Bytes);
        LinkingTo(url);
        Post.Thumbnail = url;
        Post.PreviewImages.Add(url);
        return this;
    }

    /// <summary>A GIF post, uploaded to i.redd.it.</summary>
    public PostBuilder WithGif() => WithImage(MediaAsset.Gif);

    /// <summary>
    /// A text post whose text is <paramref name="markdown"/> and then an image uploaded in it, as Reddit sends one: its
    /// preview's URL on a line of its own in its text, which its <c>selftext_html</c> makes a bare link, and an entry in
    /// its <c>media_metadata</c> (<see cref="CommentBuilder.WithImage"/>). A PNG unless <paramref name="image"/> says
    /// otherwise.
    /// </summary>
    public PostBuilder WithTextAndImage(string markdown, MediaAsset? image = null)
    {
        var uploaded = UploadedMedia.Upload(world, image ?? MediaAsset.Png);
        Post.Media[uploaded.Id] = uploaded;
        return WithText($"{markdown}\n\n{RedditMarkdown.UploadedImageUrl(world.BaseUrl, uploaded)}");
    }

    /// <summary>Its score: upvotes less downvotes.</summary>
    public PostBuilder WithScore(int score)
    {
        Post.Score = score;
        return this;
    }

    /// <summary>Posted <paramref name="ago"/> before now.</summary>
    public PostBuilder PostedAgo(TimeSpan ago)
    {
        Post.Created = DateTimeOffset.UtcNow - ago;
        return this;
    }

    /// <summary>Marked NSFW.</summary>
    public PostBuilder Nsfw()
    {
        Post.IsNsfw = true;
        return this;
    }

    /// <summary>Stickied at the top of its subreddit.</summary>
    public PostBuilder Stickied()
    {
        Post.IsStickied = true;
        return this;
    }

    /// <summary>With the flair <paramref name="flair"/>.</summary>
    public PostBuilder WithFlair(string flair)
    {
        Post.Flair = flair;
        return this;
    }
}

/// <summary>
/// What a comment holds, in a test's words: <c>world.AddComment(post, "Look", comment => comment.WithGif())</c>.
/// </summary>
public sealed class CommentBuilder
{
    private readonly RedditWorld world;

    internal CommentBuilder(RedditWorld world, Comment comment)
    {
        this.world = world;
        Comment = comment;
    }

    /// <summary>The comment being built.</summary>
    public Comment Comment { get; }

    /// <summary>Written by <paramref name="author"/>.</summary>
    public CommentBuilder By(string author)
    {
        Comment.Author = author;
        return this;
    }

    /// <summary>
    /// A GIF uploaded in the comment, as Reddit sends it: <c>![gif](&lt;id&gt;)</c> in its body, an entry in its
    /// <c>media_metadata</c>, a link to the GIF around a preview in its <c>body_html</c>, and the GIF at
    /// <c>i.redd.it/&lt;id&gt;.gif</c> in the media store.
    /// </summary>
    public CommentBuilder WithGif(MediaAsset? gif = null) => WithMedia("gif", gif ?? MediaAsset.Gif);

    /// <summary>
    /// An image uploaded in the comment, as Reddit sends it: its preview's URL on a line of its own in its body
    /// (<c>preview.redd.it/&lt;id&gt;.png?width=…</c>, unlike a GIF, which is <c>![gif](&lt;id&gt;)</c>), which its
    /// <c>body_html</c> makes a bare link, an entry in its <c>media_metadata</c>, and the image there in the media store.
    /// A PNG unless <paramref name="image"/> says otherwise.
    /// </summary>
    public CommentBuilder WithImage(MediaAsset? image = null)
    {
        var uploaded = UploadedMedia.Upload(world, image ?? MediaAsset.Png);
        Comment.Media[uploaded.Id] = uploaded;
        return Add(RedditMarkdown.UploadedImageUrl(world.BaseUrl, uploaded));
    }

    /// <summary>
    /// A video uploaded in the comment, as Reddit sends it: a link to its player on a line of its own in its body,
    /// <c>https://reddit.com/link/&lt;comment&gt;/video/&lt;id&gt;/player</c>, named by the comment's own id (as real
    /// comments in Reddit's API have it, seen in the Arctic Shift archive), an entry (<c>RedditVideo</c>) in its
    /// <c>media_metadata</c> (the archive has none for these comments: unconfirmed), and the video in the media store as
    /// v.redd.it serves it: its DASH playlist, <c>v.redd.it/&lt;id&gt;/DASHPlaylist.mpd</c>, and its one rendition next to
    /// it (<see cref="MediaAsset.DashPlaylist"/>).
    /// </summary>
    public CommentBuilder WithVideo()
    {
        var id = world.NewId() + "e2evideo";
        var playlist = $"v.redd.it/{id}/DASHPlaylist.mpd";
        world.AddMedia(playlist, MediaAsset.DashPlaylist.ContentType, MediaAsset.DashPlaylist.Bytes);
        world.AddMedia($"v.redd.it/{id}/DASH_240.mp4", MediaAsset.DashVideo.ContentType, MediaAsset.DashVideo.Bytes);
        Comment.Media[id] = new UploadedMedia(id, MediaAsset.DashVideo.ContentType, playlist, MediaAsset.DashVideo.Width, MediaAsset.DashVideo.Height);
        return Add($"https://reddit.com/link/{Comment.Id}/video/{id}/player");
    }

    /// <summary>
    /// A bare link to an image file the fake serves, <c>&lt;baseUrl&gt;/_media/example.com/&lt;id&gt;.jpg</c>, posted on
    /// its own line: a JPEG unless <paramref name="image"/> says otherwise.
    /// </summary>
    public CommentBuilder LinkingToAnImage(MediaAsset? image = null) => LinkingTo(image ?? MediaAsset.Jpeg);

    /// <summary>
    /// A bare link to a video file the fake serves, <c>&lt;baseUrl&gt;/_media/example.com/&lt;id&gt;.mp4</c>, posted on
    /// its own line: ten seconds long unless <paramref name="video"/> says otherwise.
    /// </summary>
    public CommentBuilder LinkingToAVideo(MediaAsset? video = null) => LinkingTo(video ?? MediaAsset.LongMp4);

    /// <summary>Its score.</summary>
    public CommentBuilder WithScore(int score)
    {
        Comment.Score = score;
        return this;
    }

    private CommentBuilder WithMedia(string kind, MediaAsset asset)
    {
        var uploaded = UploadedMedia.Upload(world, asset);
        Comment.Media[uploaded.Id] = uploaded;
        return Add($"![{kind}]({uploaded.Id})");
    }

    private CommentBuilder LinkingTo(MediaAsset asset) =>
        Add(world.AddMedia($"example.com/{world.NewId()}e2elink.{asset.Extension}", asset.ContentType, asset.Bytes));

    // A paragraph of its own, after what the body says already.
    private CommentBuilder Add(string markdown)
    {
        var separator = Comment.Body.Length == 0 ? "" : "\n\n";
        Comment.Body += separator + markdown;
        return this;
    }
}
