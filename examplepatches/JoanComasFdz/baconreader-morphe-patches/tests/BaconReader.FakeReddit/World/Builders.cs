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

    /// <summary>
    /// A GIF post, uploaded to i.redd.it, as Reddit sends one: a still of it as preview, another as thumbnail on
    /// b.thumbs.redditmedia.com, and the GIF in the preview's <c>variants.gif</c>. <see cref="MediaAsset.LargeGif"/>
    /// unless <paramref name="gif"/> says otherwise.
    /// </summary>
    public PostBuilder WithGif(MediaAsset? gif = null)
    {
        var id = world.NewId();
        var url = world.AddMedia($"i.redd.it/{id}.gif", "image/gif", (gif ?? MediaAsset.LargeGif).Bytes);
        LinkingTo(url);
        var still = world.AddMedia($"preview.redd.it/{id}e2estill.jpg", MediaAsset.Jpeg.ContentType, MediaAsset.Jpeg.Bytes);
        Post.Thumbnail = world.AddMedia($"b.thumbs.redditmedia.com/{id}e2ethumbnail.jpg", MediaAsset.Jpeg.ContentType, MediaAsset.Jpeg.Bytes);
        Post.PreviewImages.Add(still);
        Post.PreviewGif = url;
        return this;
    }

    /// <summary>
    /// A gallery post of JPEGs, one unless <paramref name="images"/> says otherwise, as Reddit sends one: its URL
    /// <c>https://www.reddit.com/gallery/&lt;id&gt;</c>, which "E2E fake Reddit" leaves on Reddit, its image in
    /// <c>media_metadata</c> and <c>gallery_data</c>.
    /// </summary>
    public PostBuilder AsGallery(int images = 1)
    {
        for (var image = 0; image < images; image++)
        {
            var uploaded = UploadedMedia.Upload(world, MediaAsset.Jpeg);
            Post.Media[uploaded.Id] = uploaded;
        }

        Post.IsGallery = true;
        // As BaconReader recognizes a gallery, and as Reddit sends it: "E2E fake Reddit" leaves the app's gallery
        // address on Reddit, so the app treats it as a Reddit link, as it does on Reddit.
        LinkingTo($"https://www.reddit.com/gallery/{Post.Id}");
        Post.Thumbnail = world.MediaUrl(Post.Media.Values.First().Path);
        return this;
    }

    /// <summary>
    /// Its thumbnail a signed preview of its image, as Reddit sends one without <c>raw_json</c>:
    /// <c>preview.redd.it/&lt;id&gt;.jpg?width=140&amp;amp;height=105&amp;amp;…&amp;amp;s=…</c>, its "&amp;" HTML-escaped. The
    /// preview is refused unless they are unescaped (<see cref="Endpoints.Media"/>). Returns the preview's path.
    /// </summary>
    public string WithASignedThumbnail()
    {
        var path = $"preview.redd.it/{world.NewId()}e2ethumbnail.jpg";
        Post.Thumbnail = world.MediaUrl(path) + "?width=140&amp;height=105&amp;crop=140:105,smart&amp;auto=webp&amp;s=e2ethumbnail";
        world.AddMedia(path, MediaAsset.Jpeg.ContentType, MediaAsset.Jpeg.Bytes);
        return path;
    }

    /// <summary>
    /// A link post to a web page the fake serves, <c>&lt;baseUrl&gt;/_media/example.com/&lt;id&gt;e2epage.html</c>, with
    /// Reddit's preview of it but no thumbnail (<c>"default"</c>), as Reddit sends many link posts. Returns the preview's
    /// path.
    /// </summary>
    public string LinkingToAPageWithAPreview()
    {
        var id = world.NewId();
        LinkingTo(world.AddMedia($"example.com/{id}e2epage.html", "text/html", MediaAsset.WebPage.Bytes));
        var preview = $"preview.redd.it/{id}e2epreview.jpg";
        Post.PreviewImages.Add(world.AddMedia(preview, MediaAsset.Jpeg.ContentType, MediaAsset.Jpeg.Bytes));
        return preview;
    }

    /// <summary>Marked as a spoiler.</summary>
    public PostBuilder Spoiler()
    {
        Post.IsSpoiler = true;
        return this;
    }

    /// <summary>
    /// A crosspost of <paramref name="shared"/>: its URL the shared post's, and the shared post in its
    /// <c>crosspost_parent_list</c>, with no thumbnail or gallery of its own, as Reddit sends one.
    /// </summary>
    public PostBuilder CrosspostOf(Post shared)
    {
        Post.CrosspostOf = shared;
        LinkingTo(shared.Url ?? "https://www.reddit.com" + shared.Permalink);
        return this;
    }

    /// <summary>
    /// A video post, as Reddit sends one uploaded to v.redd.it: its URL <c>https://v.redd.it/&lt;id&gt;</c>, moved to the
    /// fake, which redirects it to the post as v.redd.it does; its <c>media.reddit_video</c> (the DASH and HLS
    /// playlists, and the MP4 its <c>fallback_url</c> names, at the fake); and a still as thumbnail and preview. The
    /// video is served as v.redd.it serves it, with a sound track unless <paramref name="withSound"/> is false
    /// (<see cref="RedditWorld.AddRedditVideo"/>).
    /// </summary>
    public PostBuilder AsVideo(bool withSound = true)
    {
        var id = world.NewId() + "e2evideo";
        world.AddRedditVideo(id, withSound);
        Post.VideoHasSound = withSound;
        // Where "E2E fake Reddit" moves https://v.redd.it/<id>: the fake answers it as v.redd.it does, with a redirect
        // to the post, which BaconReader follows to the post's media.reddit_video.
        LinkingTo(world.MediaUrl($"v.redd.it/{id}"));
        Post.VideoId = id;
        var still = world.AddMedia($"preview.redd.it/{id}.jpg", MediaAsset.Jpeg.ContentType, MediaAsset.Jpeg.Bytes);
        Post.Thumbnail = still;
        Post.PreviewImages.Add(still);
        return this;
    }

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

    /// <summary>
    /// A text post that starts with an image uploaded in it, as Reddit sends one (<see cref="WithTextAndImage"/>), and then
    /// says <paramref name="markdown"/>: its preview's bare link is the first thing in its text. A PNG unless
    /// <paramref name="image"/> says otherwise.
    /// </summary>
    public PostBuilder WithImageAndThenText(string markdown, MediaAsset? image = null)
    {
        var uploaded = UploadedMedia.Upload(world, image ?? MediaAsset.Png);
        Post.Media[uploaded.Id] = uploaded;
        return WithText($"{RedditMarkdown.UploadedImageUrl(world.BaseUrl, uploaded)}\n\n{markdown}");
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

    /// <summary>Given Reddit's Silver <paramref name="count"/> times: an award, with its icon in the media store.</summary>
    public PostBuilder WithSilver(int count)
    {
        Post.Awards.Add(Award.Silver(world, count));
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
    /// v.redd.it serves it (<see cref="RedditWorld.AddRedditVideo"/>).
    /// </summary>
    public CommentBuilder WithVideo()
    {
        var id = world.NewId() + "e2evideo";
        var playlist = world.AddRedditVideo(id);
        Comment.Media[id] = new UploadedMedia(id, MediaAsset.DashVideo.ContentType, playlist, MediaAsset.DashVideo.Width, MediaAsset.DashVideo.Height);
        return Add($"https://reddit.com/link/{Comment.Id}/video/{id}/player");
    }

    /// <summary>
    /// A bare link to an image file the fake serves, <c>&lt;baseUrl&gt;/_media/example.com/&lt;id&gt;.jpg</c>, posted on
    /// its own line: a JPEG unless <paramref name="image"/> says otherwise.
    /// </summary>
    public CommentBuilder LinkingToAnImage(MediaAsset? image = null) => LinkingTo(image ?? MediaAsset.Jpeg);

    /// <summary>
    /// <paramref name="markdown"/>, in a paragraph of its own after what the body says already: the text after an image
    /// or a GIF, when the comment starts with it.
    /// </summary>
    public CommentBuilder ThenSaying(string markdown) => Add(markdown);

    /// <summary>
    /// A bare link to a video file the fake serves, <c>&lt;baseUrl&gt;/_media/example.com/&lt;id&gt;.mp4</c>, posted on
    /// its own line: ten seconds long unless <paramref name="video"/> says otherwise.
    /// </summary>
    public CommentBuilder LinkingToAVideo(MediaAsset? video = null) => LinkingTo(video ?? MediaAsset.LongMp4);

    /// <summary>
    /// The Snoomoji <paramref name="name"/> (Reddit's own emote, as <c>grin</c>) after what the body says, on its line:
    /// <c>![img](emote|free_emotes_pack|&lt;name&gt;)</c>, sent as Reddit sends every emote (<see cref="RedditEmotes"/>).
    /// The fake serves its GIF.
    /// </summary>
    public CommentBuilder WithSnoomoji(string name) => WithEmote($"emote|free_emotes_pack|{name}", name);

    /// <summary>
    /// An emote of the comment's subreddit after what the body says, on its line:
    /// <c>![img](emote|t5_&lt;subreddit id&gt;|&lt;number&gt;)</c>, sent as Reddit sends every emote
    /// (<see cref="RedditEmotes"/>).
    /// </summary>
    public CommentBuilder WithSubredditEmote() =>
        WithEmote($"emote|t5_{Comment.Post.Subreddit.Id}|{4258 + Comment.Media.Count}", null);

    /// <summary>Its score.</summary>
    public CommentBuilder WithScore(int score)
    {
        Comment.Score = score;
        return this;
    }

    /// <summary>Given Reddit's Silver <paramref name="count"/> times: an award, with its icon in the media store.</summary>
    public CommentBuilder WithSilver(int count)
    {
        Comment.Awards.Add(Award.Silver(world, count));
        return this;
    }

    private CommentBuilder WithMedia(string kind, MediaAsset asset)
    {
        var uploaded = UploadedMedia.Upload(world, asset);
        Comment.Media[uploaded.Id] = uploaded;
        return Add($"![{kind}]({uploaded.Id})");
    }

    private CommentBuilder WithEmote(string id, string? snoomoji)
    {
        Comment.Media[id] = RedditEmotes.Add(world, id, snoomoji);
        var separator = Comment.Body.Length == 0 ? "" : " ";
        Comment.Body += $"{separator}![img]({id})";
        return this;
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
