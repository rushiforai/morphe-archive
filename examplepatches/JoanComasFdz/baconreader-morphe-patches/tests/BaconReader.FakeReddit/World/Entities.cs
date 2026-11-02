// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

namespace BaconReader.FakeReddit.World;

/// <summary>A Reddit account: its name and password log in on the fake login page.</summary>
public sealed class Account
{
    internal Account(string id, string name, string password, DateTimeOffset created)
    {
        Id = id;
        Name = name;
        Password = password;
        Created = created;
    }

    /// <summary>The base-36 id, without Reddit's "t2_".</summary>
    public string Id { get; }

    public string Name { get; }

    public string Password { get; }

    /// <summary>When the account was made: BaconReader shows "Happy Cake Day!" on its day of the year.</summary>
    public DateTimeOffset Created { get; set; }

    /// <summary>The subreddits it is subscribed to, by name, in the order it subscribed.</summary>
    public List<string> Subscriptions { get; } = [];

    /// <summary>What <c>/api/v1/me/prefs</c> answers, <c>{}</c> unless a test sets some.</summary>
    public Dictionary<string, object?> Prefs { get; } = [];

    /// <summary>The private messages sent to it, newest first: its inbox.</summary>
    public List<Message> Inbox { get; } = [];

    /// <summary>Whether a message of its inbox is unread: <c>has_mail</c> in <c>/api/v1/me</c>.</summary>
    public bool HasMail => Inbox.Any(message => message.IsNew);

    public string FullName => "t2_" + Id;
}

/// <summary>A subreddit. Created on first use, as a default subreddit unless a test says otherwise.</summary>
public sealed class Subreddit
{
    internal Subreddit(string id, string name, DateTimeOffset created)
    {
        Id = id;
        Name = name;
        Created = created;
    }

    public string Id { get; }

    /// <summary>The name without "r/", as written when it was made: Reddit's <c>display_name</c>.</summary>
    public string Name { get; }

    public DateTimeOffset Created { get; }

    /// <summary>One of the default subreddits: a logged-out Front Page shows its posts, and BaconReader lists it.</summary>
    public bool IsDefault { get; set; } = true;

    public string Description { get; set; } = "";

    public int Subscribers { get; set; } = 1000;

    public string FullName => "t5_" + Id;
}

/// <summary>A post (Reddit's t3, BaconReader's Link) and its comments.</summary>
public sealed class Post
{
    internal Post(string id, Subreddit subreddit, string title, string author, DateTimeOffset created, long order)
    {
        Id = id;
        Subreddit = subreddit;
        Title = title;
        Author = author;
        Created = created;
        Order = order;
    }

    public string Id { get; }

    public Subreddit Subreddit { get; }

    public string Title { get; set; }

    public string Author { get; set; }

    public DateTimeOffset Created { get; set; }

    /// <summary>The order it was made in, which breaks ties between posts made in the same second.</summary>
    internal long Order { get; }

    /// <summary>A text post's Markdown; null for a link post.</summary>
    public string? Text { get; set; }

    /// <summary>A link post's URL; null for a text post, whose URL is its permalink.</summary>
    public string? Url { get; set; }

    /// <summary>The image the feed row shows, a URL; null shows none ("self" or "default").</summary>
    public string? Thumbnail { get; set; }

    /// <summary>The preview images (<c>preview.images[].source.url</c>), URLs.</summary>
    public List<string> PreviewImages { get; } = [];

    /// <summary>The media a text post's text shows (<c>![img](id)</c>), by id: Reddit's <c>media_metadata</c>.</summary>
    public Dictionary<string, UploadedMedia> Media { get; } = [];

    public int Score { get; set; } = 1;

    public bool IsNsfw { get; set; }

    public bool IsStickied { get; set; }

    public bool IsLocked { get; set; }

    public string? Flair { get; set; }

    /// <summary>The top-level comments, oldest first; each holds its replies.</summary>
    public List<Comment> Comments { get; } = [];

    /// <summary>Each account's vote: 1, -1; no entry is no vote.</summary>
    public Dictionary<string, int> Votes { get; } = new(StringComparer.OrdinalIgnoreCase);

    /// <summary>The accounts that saved it, by name.</summary>
    public HashSet<string> SavedBy { get; } = new(StringComparer.OrdinalIgnoreCase);

    /// <summary>The accounts that hid it, by name: their listings leave it out.</summary>
    public HashSet<string> HiddenBy { get; } = new(StringComparer.OrdinalIgnoreCase);

    public string FullName => "t3_" + Id;

    /// <summary>Reddit's permalink: <c>/r/&lt;sub&gt;/comments/&lt;id&gt;/&lt;slug&gt;/</c>.</summary>
    public string Permalink => $"/r/{Subreddit.Name}/comments/{Id}/{Slug(Title)}/";

    public int CommentCount => Comments.Sum(comment => 1 + comment.ReplyCount);

    // Reddit's slug: the title's first words, lowercase, joined by "_".
    private static string Slug(string title)
    {
        var words = new string([.. title.ToLowerInvariant().Select(c => char.IsLetterOrDigit(c) ? c : ' ')])
            .Split(' ', StringSplitOptions.RemoveEmptyEntries)
            .Take(8);
        var slug = string.Join('_', words);
        return slug.Length == 0 ? "_" : slug;
    }
}

/// <summary>A comment (Reddit's t1) on a post, or a reply to one.</summary>
public sealed class Comment
{
    internal Comment(string id, Post post, Comment? parent, string author, string body, DateTimeOffset created)
    {
        Id = id;
        Post = post;
        Parent = parent;
        Author = author;
        Body = body;
        Created = created;
    }

    public string Id { get; }

    public Post Post { get; }

    /// <summary>The comment it replies to; null for a top-level comment.</summary>
    public Comment? Parent { get; }

    public string Author { get; set; }

    /// <summary>The Markdown, as Reddit's <c>body</c> holds it.</summary>
    public string Body { get; set; }

    public DateTimeOffset Created { get; set; }

    public int Score { get; set; } = 1;

    /// <summary>The media the body shows (<c>![gif](id)</c>), by id: Reddit's <c>media_metadata</c>.</summary>
    public Dictionary<string, UploadedMedia> Media { get; } = [];

    public List<Comment> Replies { get; } = [];

    public Dictionary<string, int> Votes { get; } = new(StringComparer.OrdinalIgnoreCase);

    public HashSet<string> SavedBy { get; } = new(StringComparer.OrdinalIgnoreCase);

    public string FullName => "t1_" + Id;

    /// <summary>How deep it is: 0 for a top-level comment.</summary>
    public int Depth => Parent is null ? 0 : Parent.Depth + 1;

    internal int ReplyCount => Replies.Sum(reply => 1 + reply.ReplyCount);
}

/// <summary>A private message (Reddit's t4) in an account's inbox.</summary>
public sealed class Message
{
    internal Message(string id, Account to, string author, string subject, string body, DateTimeOffset created)
    {
        Id = id;
        To = to;
        Author = author;
        Subject = subject;
        Body = body;
        Created = created;
    }

    public string Id { get; }

    /// <summary>The account it was sent to: whose inbox holds it.</summary>
    public Account To { get; }

    public string Author { get; }

    public string Subject { get; }

    /// <summary>The Markdown, as Reddit's <c>body</c> holds it.</summary>
    public string Body { get; }

    public DateTimeOffset Created { get; }

    /// <summary>Unread: Reddit's <c>new</c>. <c>api/read_message</c> and <c>api/read_all_messages</c> clear it.</summary>
    public bool IsNew { get; set; } = true;

    public string FullName => "t4_" + Id;
}

/// <summary>
/// An image, GIF or video uploaded to Reddit in a comment or a post's text: one entry of its <c>media_metadata</c>.
/// </summary>
/// <param name="Id">The id the Markdown names: <c>![gif](&lt;id&gt;)</c>.</param>
/// <param name="ContentType">Its type, <c>image/gif</c>, <c>image/png</c> or <c>video/mp4</c>…</param>
/// <param name="Path">
/// Where the media store holds it: <c>i.redd.it/&lt;id&gt;.gif</c>, <c>preview.redd.it/&lt;id&gt;.png</c>, or a video's
/// DASH playlist, <c>v.redd.it/&lt;id&gt;/DASHPlaylist.mpd</c>.
/// </param>
public sealed record UploadedMedia(string Id, string ContentType, string Path, int Width, int Height)
{
    public bool IsAnimated => ContentType == "image/gif";

    public bool IsVideo => ContentType.StartsWith("video/", StringComparison.Ordinal);

    /// <summary>
    /// An image or GIF uploaded to Reddit, in <paramref name="world"/>'s media store: a GIF at
    /// <c>i.redd.it/&lt;id&gt;.gif</c>, an image at its preview, <c>preview.redd.it/&lt;id&gt;.png</c>.
    /// </summary>
    internal static UploadedMedia Upload(RedditWorld world, MediaAsset asset)
    {
        var id = world.NewId() + "e2emedia";
        var host = asset.ContentType == "image/gif" ? "i.redd.it" : "preview.redd.it";
        var path = $"{host}/{id}.{asset.Extension}";
        world.AddMedia(path, asset.ContentType, asset.Bytes);
        return new UploadedMedia(id, asset.ContentType, path, asset.Width, asset.Height);
    }
}

/// <summary>A file the fake serves under <c>/_media/</c>.</summary>
public sealed record MediaFile(string ContentType, byte[] Bytes);
