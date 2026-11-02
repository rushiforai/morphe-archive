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
            LinkFlairCssClass = post.Flair is null ? null : "",
            Name = post.FullName,
            Ups = post.Score + vote,
            ThumbnailWidth = post.Thumbnail is null ? null : 140,
            ThumbnailHeight = post.Thumbnail is null ? null : 105,
            Score = post.Score + vote,
            Thumbnail = post.Thumbnail ?? (self ? "self" : "default"),
            PostHint = post.PreviewImages.Count > 0 ? "image" : self ? null : "link",
            IsSelf = self,
            Created = created,
            Domain = self ? "self." + post.Subreddit.Name : Domain(url),
            SelftextHtml = RedditMarkdown.ToEscapedSelfTextHtml(post.Text, world.BaseUrl, post.Media),
            Likes = vote switch { 1 => true, -1 => false, _ => null },
            UrlOverriddenByDest = self ? null : url,
            Over18 = post.IsNsfw,
            Preview = post.PreviewImages.Count == 0
                ? null
                : new Preview([.. post.PreviewImages.Select((image, index) => new PreviewImage(new PreviewSource(image, 320, 240), [], [], $"{post.Id}preview{index}"))]),
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
            MediaMetadata = MediaMetadataOf(post.Media),
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

    /// <summary>A private message (t4), as Reddit's inbox sends it.</summary>
    public Thing Message(Message message)
    {
        var created = Seconds(message.Created);
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

    private Dictionary<string, MediaMetadata>? MediaMetadataOf(Dictionary<string, UploadedMedia> media) =>
        media.Count == 0 ? null : media.Values.ToDictionary(found => found.Id, Metadata);

    private MediaMetadata Metadata(UploadedMedia media)
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

        var full = media.IsAnimated
            ? new MediaSize(media.Height, media.Width) { Gif = url, Mp4 = url }
            : new MediaSize(media.Height, media.Width) { U = RedditMarkdown.UploadedImageUrl(world.BaseUrl, media) };
        return new MediaMetadata("valid", media.IsAnimated ? "AnimatedImage" : "Image", media.Id) { M = media.ContentType, P = [], S = full };
    }

    // The fake has no account behind most authors; Reddit's fullname is "t2_" and an id, and a stable one will do.
    private string AuthorFullName(string author) =>
        world.FindAccount(author)?.FullName ?? "t2_" + author.ToLowerInvariant();

    private static string Domain(string url) => Uri.TryCreate(url, UriKind.Absolute, out var uri) ? uri.Host : "";

    private static double Seconds(DateTimeOffset at) => at.ToUnixTimeSeconds();
}
