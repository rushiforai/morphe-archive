// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.FakeReddit.World;

namespace BaconReader.FakeReddit.Json;

/// <summary>The world's posts, comments, subreddits and accounts as the things Reddit sends, seen by <c>viewer</c> (null logged out).</summary>
internal sealed class Things(RedditWorld world)
{
    public Thing Link(Post post, Account? viewer)
    {
        var self = post.Url is null;
        var url = post.Url ?? "https://www.reddit.com" + post.Permalink;
        var vote = viewer is not null && post.Votes.TryGetValue(viewer.Name, out var direction) ? direction : 0;
        var created = Seconds(post.Created);
        return new Thing("t3", new LinkData
        {
            Subreddit = post.Subreddit.Name,
            Selftext = post.Text ?? "",
            AuthorFullname = AuthorFullName(post.Author),
            Saved = viewer is not null && post.SavedBy.Contains(viewer.Name),
            Title = post.Title,
            SubredditNamePrefixed = "r/" + post.Subreddit.Name,
            Hidden = viewer is not null && post.HiddenBy.Contains(viewer.Name),
            LinkFlairCssClass = post.Flair is null ? null : FlairCssClass(post.Flair),
            LinkFlairRichtext = post.Flair is null ? [] : [new FlairRichtext("text", post.Flair)],
            LinkFlairType = post.Flair is null ? "text" : "richtext",
            AllAwardings = Awardings(post.Awards),
            TotalAwardsReceived = post.Awards.Sum(award => award.Count),
            Gildings = Gildings(post.Awards),
            Gilded = post.Awards.Where(IsGilding).Sum(award => award.Count),
            Name = post.FullName,
            Ups = post.Score + vote,
            ThumbnailWidth = post.Thumbnail is null && post.PreviewImages.Count == 0 ? null : 140,
            ThumbnailHeight = post.Thumbnail is null && post.PreviewImages.Count == 0 ? null : 105,
            Score = post.Score + vote,
            // Reddit names a spoiler's and an NSFW post's thumbnail instead of linking it.
            Thumbnail = post.IsSpoiler ? "spoiler" : post.IsNsfw ? "nsfw" : post.Thumbnail ?? (self ? "self" : "default"),
            PostHint = post.PreviewImages.Count > 0 ? "image" : self ? null : "link",
            IsSelf = self,
            Created = created,
            Domain = self ? "self." + post.Subreddit.Name : post.VideoId is null ? Domain(url) : "v.redd.it",
            SelftextHtml = RedditMarkdown.ToEscapedSelfTextHtml(post.Text, world.BaseUrl, post.Media),
            Likes = vote switch { 1 => true, -1 => false, _ => null },
            UrlOverriddenByDest = self ? null : url,
            Over18 = post.IsNsfw,
            Spoiler = post.IsSpoiler,
            CrosspostParent = post.CrosspostOf?.FullName,
            CrosspostParentList = post.CrosspostOf is null ? null : [Link(post.CrosspostOf, viewer).Data],
            Preview = post.PreviewImages.Count == 0
                ? null
                : new Preview([.. post.PreviewImages.Select((image, index) => new PreviewImage(new PreviewSource(image, 320, 240), [], Variants(index == 0 ? post.PreviewGif : null), $"{post.Id}preview{index}"))]),
            Locked = post.IsLocked,
            SubredditId = post.Subreddit.FullName,
            LinkFlairText = post.Flair,
            Id = post.Id,
            Author = post.Author,
            NumComments = post.CommentCount,
            Permalink = post.Permalink,
            Stickied = post.IsStickied,
            Pinned = false,
            Url = url,
            SubredditSubscribers = post.Subreddit.Subscribers,
            CreatedUtc = created,
            IsRedditMediaDomain = url.Contains("/_media/", StringComparison.Ordinal),
            Media = post.VideoId is null ? null : new MediaData(RedditVideo(post.VideoId, post.VideoHasSound)),
            SecureMedia = post.VideoId is null ? null : new MediaData(RedditVideo(post.VideoId, post.VideoHasSound)),
            IsVideo = post.VideoId is not null,
            IsGallery = post.IsGallery,
            GalleryData = post.IsGallery
                ? new GalleryData([.. post.Media.Values.Select((media, index) => new GalleryItem(media.Id, index + 1))])
                : null,
            MediaMetadata = MediaMetadataOf(post.Media, post.IsGallery),
        });
    }

    /// <summary>A comment and, recursively, its replies.</summary>
    public Thing Comment(Comment comment, Account? viewer) => Comment(comment, viewer, CommentTree.Whole);

    /// <summary>
    /// A comment and, recursively, the replies <paramref name="tree"/> shows, the rest behind a "load more comments"
    /// (<see cref="More"/>); with <see cref="CommentTree.Flat"/>, none, as <c>api/morechildren</c> sends comments.
    /// </summary>
    public Thing Comment(Comment comment, Account? viewer, CommentTree tree)
    {
        var vote = viewer is not null && comment.Votes.TryGetValue(viewer.Name, out var direction) ? direction : 0;
        var created = Seconds(comment.Created);
        var replies = Children(comment.Replies, comment.FullName, comment.Depth + 1, viewer, tree);
        return new Thing("t1", new CommentData
        {
            SubredditId = comment.Post.Subreddit.FullName,
            Subreddit = comment.Post.Subreddit.Name,
            Likes = vote switch { 1 => true, -1 => false, _ => null },
            Replies = replies.Count == 0 ? null : ListingData.Listing(replies),
            Saved = viewer is not null && comment.SavedBy.Contains(viewer.Name),
            Id = comment.Id,
            Author = comment.Author,
            CreatedUtc = created,
            ParentId = comment.Parent?.FullName ?? comment.Post.FullName,
            Score = comment.Score + vote,
            AuthorFullname = AuthorFullName(comment.Author),
            Body = comment.Body,
            Name = comment.FullName,
            IsSubmitter = string.Equals(comment.Author, comment.Post.Author, StringComparison.OrdinalIgnoreCase),
            BodyHtml = RedditMarkdown.ToEscapedHtml(comment.Body, world.BaseUrl, comment.Media),
            Permalink = $"{comment.Post.Permalink}{comment.Id}/",
            Created = created,
            LinkId = comment.Post.FullName,
            SubredditNamePrefixed = "r/" + comment.Post.Subreddit.Name,
            Depth = comment.Depth,
            Ups = comment.Score + vote,
            MediaMetadata = MediaMetadataOf(comment.Media),
            AllAwardings = Awardings(comment.Awards),
            TotalAwardsReceived = comment.Awards.Sum(award => award.Count),
            Gildings = Gildings(comment.Awards),
            Gilded = comment.Awards.Where(IsGilding).Sum(award => award.Count),
        });
    }

    /// <summary>
    /// The things of <paramref name="comments"/>, the children of <paramref name="parent"/> (a post's or a comment's
    /// fullname), that <paramref name="tree"/> shows, then one <c>more</c> for those it leaves out, as Reddit sends them.
    /// </summary>
    public List<Thing> Children(IEnumerable<Comment> comments, string parent, int depth, Account? viewer, CommentTree tree)
    {
        if (tree.IsFlat)
        {
            return [];
        }

        var all = tree.InOrder(comments).ToList();
        var things = all.Where(tree.Shows).Select(comment => Comment(comment, viewer, tree)).ToList();
        var left = all.Where(comment => !tree.Shows(comment)).ToList();
        if (left.Count > 0)
        {
            things.Add(More(left, parent, depth));
        }

        return things;
    }

    /// <summary>A "load more comments" for <paramref name="left"/>, children of <paramref name="parent"/>.</summary>
    public static Thing More(IReadOnlyList<Comment> left, string parent, int depth) =>
        new("more", new MoreData(
            left.Sum(comment => 1 + comment.ReplyCount),
            left[0].FullName,
            left[0].Id,
            parent,
            depth,
            [.. left.Select(comment => comment.Id)]));

    public Thing Subreddit(Subreddit subreddit, Account? viewer)
    {
        var created = Seconds(subreddit.Created);
        var description = subreddit.Description.Length == 0 ? null : RedditMarkdown.ToEscapedHtml(subreddit.Description, world.BaseUrl);
        return new Thing("t5", new SubredditData
        {
            UserIsBanned = viewer is null ? null : false,
            DisplayName = subreddit.Name,
            Title = subreddit.Name,
            DisplayNamePrefixed = "r/" + subreddit.Name,
            Subscribers = subreddit.Subscribers,
            Name = subreddit.FullName,
            PublicDescription = subreddit.Description,
            UserIsSubscriber = viewer is null ? null : viewer.Subscriptions.Contains(subreddit.Name, StringComparer.OrdinalIgnoreCase),
            DescriptionHtml = description,
            PublicDescriptionHtml = description,
            Description = subreddit.Description,
            Created = created,
            CreatedUtc = created,
            Id = subreddit.Id,
            Url = $"/r/{subreddit.Name}/",
        });
    }

    public static UserData User(Account account)
    {
        var created = Seconds(account.Created);
        return new UserData
        {
            Id = account.Id,
            Name = account.Name,
            Created = created,
            CreatedUtc = created,
            HasMail = account.HasMail,
            InboxCount = account.Inbox.Count(message => message.IsNew),
        };
    }

    /// <summary>
    /// An inbox entry, as Reddit's inbox sends it: a private message (t4), or a comment reply (t1, <c>was_comment</c>,
    /// with its post's subreddit, title and context).
    /// </summary>
    public Thing Message(Message message)
    {
        var created = Seconds(message.Created);
        if (message.Reply is { } reply)
        {
            var post = reply.Post;
            return new Thing("t1", new MessageData
            {
                AuthorFullname = AuthorFullName(message.Author),
                Id = reply.Id,
                Subject = message.Subject,
                Author = message.Author,
                New = message.IsNew,
                Body = message.Body,
                Dest = message.To.Name,
                WasComment = true,
                Type = "comment_reply",
                Subreddit = post.Subreddit.Name,
                SubredditNamePrefixed = "r/" + post.Subreddit.Name,
                ParentId = reply.Parent?.FullName ?? post.FullName,
                LinkTitle = post.Title,
                Context = $"{post.Permalink}{reply.Id}/?context=3",
                BodyHtml = RedditMarkdown.ToEscapedHtml(message.Body, world.BaseUrl),
                Name = message.FullName,
                Created = created,
                CreatedUtc = created,
            });
        }

        return new Thing("t4", new MessageData
        {
            AuthorFullname = AuthorFullName(message.Author),
            Id = message.Id,
            Subject = message.Subject,
            Author = message.Author,
            New = message.IsNew,
            Body = message.Body,
            Dest = message.To.Name,
            BodyHtml = RedditMarkdown.ToEscapedHtml(message.Body, world.BaseUrl),
            Name = message.FullName,
            Created = created,
            CreatedUtc = created,
        });
    }

    /// <summary>A subreddit's post flairs, as <c>api/link_flair</c> lists them.</summary>
    public static LinkFlairData[] LinkFlairs(IEnumerable<string> flairs) =>
        [.. flairs.Select((flair, index) => new LinkFlairData(flair, false, $"e2eflair{index}", FlairCssClass(flair)))];

    // Reddit's CSS class of a flair is the moderators' choice; its words in lower case, joined by "-", will do.
    private static string FlairCssClass(string flair) =>
        string.Join('-', flair.ToLowerInvariant().Split(' ', StringSplitOptions.RemoveEmptyEntries));

    private object[] Awardings(IEnumerable<Award> awards) =>
        [.. awards.Select(award => new AwardingData
        {
            Id = award.Id,
            Name = award.Name,
            Description = $"Shows the {award.Name} Award.",
            Count = award.Count,
            IconUrl = world.MediaUrl(award.IconPath),
            StaticIconUrl = world.MediaUrl(award.IconPath),
        })];

    private static Dictionary<string, object> Gildings(IEnumerable<Award> awards) =>
        awards.Where(IsGilding).ToDictionary(award => award.Id, award => (object)award.Count);

    private static bool IsGilding(Award award) => award.Id.StartsWith("gid_", StringComparison.Ordinal);

    private Dictionary<string, MediaMetadata>? MediaMetadataOf(Dictionary<string, UploadedMedia> media, bool gallery = false) =>
        media.Count == 0 ? null : media.Values.ToDictionary(found => found.Id, found => Metadata(found, gallery));

    // A gallery's images have Reddit's smaller previews in p, as signed preview.redd.it URLs, HTML-escaped as Reddit
    // sends them without raw_json; an image uploaded in a comment or a text post has none, as in Reddit's API.
    private MediaMetadata Metadata(UploadedMedia media, bool gallery)
    {
        var url = world.MediaUrl(media.Path);
        if (media.IsVideo)
        {
            return new MediaMetadata("valid", "RedditVideo", media.Id)
            {
                X = media.Width,
                Y = media.Height,
                DashUrl = url,
                HlsUrl = url.Replace("DASHPlaylist.mpd", "HLSPlaylist.m3u8", StringComparison.Ordinal),
                IsGif = false,
            };
        }

        // An emote: Reddit's placeholder GIF, with no MP4 and no previews.
        if (media.IsEmote)
        {
            return new MediaMetadata("valid", "AnimatedImage", media.Id)
            {
                M = media.ContentType,
                S = new MediaSize(media.Height, media.Width) { Gif = url },
                T = "sticker",
            };
        }

        var full = media.IsAnimated
            ? new MediaSize(media.Height, media.Width) { Gif = url, Mp4 = url }
            : new MediaSize(media.Height, media.Width) { U = RedditMarkdown.UploadedImageUrl(world.BaseUrl, media) };
        IReadOnlyList<MediaSize> previews = gallery && !media.IsAnimated
            ? [.. GalleryPreviewWidths.Select(width => new MediaSize(media.Height * width / media.Width, width) { U = GalleryPreviewUrl(media, width) })]
            : [];
        return new MediaMetadata("valid", media.IsAnimated ? "AnimatedImage" : "Image", media.Id) { M = media.ContentType, P = previews, S = full };
    }

    // A GIF post's first preview names the GIF in variants.gif, as Reddit sends it; other previews have none.
    private static Dictionary<string, object> Variants(string? gif) =>
        gif is null ? [] : new() { ["gif"] = new { source = new PreviewSource(gif, 240, 180), resolutions = Array.Empty<PreviewSource>() } };

    private static readonly int[] GalleryPreviewWidths = [108, 216, 320];

    /// <summary>The preview of a gallery image <paramref name="width"/> pixels wide, as its <c>media_metadata</c>'s <c>p</c> names it, escaped.</summary>
    public string GalleryPreviewUrl(UploadedMedia media, int width) =>
        $"{world.BaseUrl}/_media/{media.Path}?width={width}&amp;crop=smart&amp;auto=webp&amp;s=e2e{width}";

    // The fake has no account behind most authors; Reddit's fullname is "t2_" and an id, and a stable one will do.
    private string AuthorFullName(string author) => world.UserFullName(author);

    // A video post's media.reddit_video, as Reddit sends one uploaded to v.redd.it.
    private RedditVideoData RedditVideo(string id, bool hasSound) => new(
        HasAudio: hasSound,
        FallbackUrl: world.MediaUrl($"v.redd.it/{id}/DASH_240.mp4?source=fallback"),
        Height: MediaAsset.DashVideo.Height,
        Width: MediaAsset.DashVideo.Width,
        ScrubberMediaUrl: world.MediaUrl($"v.redd.it/{id}/DASH_96.mp4"),
        DashUrl: world.MediaUrl($"v.redd.it/{id}/DASHPlaylist.mpd?a=e2e&amp;v=1&amp;f=sd"),
        Duration: 10,
        HlsUrl: world.MediaUrl($"v.redd.it/{id}/HLSPlaylist.m3u8?a=e2e&amp;v=1&amp;f=sd"),
        IsGif: false,
        TranscodingStatus: "completed");

    private static string Domain(string url) => Uri.TryCreate(url, UriKind.Absolute, out var uri) ? uri.Host : "";

    private static double Seconds(DateTimeOffset at) => at.ToUnixTimeSeconds();
}
