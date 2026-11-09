// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Collections.Immutable;
using System.Text.RegularExpressions;

namespace BaconReader.FakeReddit.World;

/// <summary>
/// Everything the fake Reddit knows, in memory: accounts, subreddits, posts and their comments, media files, and what
/// the app sent (requests, actions, logins, and the requests the fake couldn't answer). A test builds exactly the Reddit
/// data it needs with the Add… members and their builders, and reads what the app sent from the logs.
/// <see cref="Reset"/> empties it. Ids are base-36 and deterministic: a counter per world.
/// </summary>
public sealed class RedditWorld
{
    private readonly List<Account> accounts = [];
    private readonly List<Subreddit> subreddits = [];
    private readonly List<Post> posts = [];
    private readonly Dictionary<string, MediaFile> media = new(StringComparer.Ordinal);
    private readonly Dictionary<string, Account> tokens = new(StringComparer.Ordinal);
    private readonly Dictionary<string, Account> codes = new(StringComparer.Ordinal);
    private readonly List<RecordedRequest> requests = [];
    private readonly List<RecordedRequest> unhandled = [];
    private readonly List<RecordedAction> actions = [];
    private readonly List<LoginSeen> logins = [];
    private readonly List<RequestTrouble> troubles = [];
    private readonly Dictionary<string, (string User, string Path)> avatars = new(StringComparer.OrdinalIgnoreCase);
    private readonly Dictionary<RequestTrouble, int> troubleHits = new(ReferenceEqualityComparer.Instance);
    private readonly Dictionary<string, string> shareLinks = new(StringComparer.Ordinal);
    private long nextId;
    private long nextOrder;

    internal RedditWorld(string baseUrl)
    {
        BaseUrl = baseUrl.TrimEnd('/');
        Imgur = new Imgur(this);
        RedGifs = new RedGifs(this);
        YouTube = new YouTube(this);
        X = new X(this);
        Bluesky = new Bluesky(this);
        Imgflip = new Imgflip(this);
        Chat = new ChatPage(this);
        Reset();
    }

    /// <summary>The fake's URL as the phone reaches it, which media URLs in the JSON start with.</summary>
    public string BaseUrl { get; }

    /// <summary>Imgur, which "E2E fake Reddit" moves here too: its albums and the uploads the app sent.</summary>
    public Imgur Imgur { get; }

    /// <summary>RedGIFs, which "E2E fake Reddit" moves here too: its videos, the tokens it gave and what the app asked.</summary>
    public RedGifs RedGifs { get; }

    /// <summary>YouTube, which "E2E fake Reddit" moves here too: its videos' titles and thumbnails.</summary>
    public YouTube YouTube { get; }

    /// <summary>X, which "E2E fake Reddit" moves here too: its posts, as its embed service sends them.</summary>
    public X X { get; }

    /// <summary>Bluesky, which "E2E fake Reddit" moves here too: its posts, as its public API sends them.</summary>
    public Bluesky Bluesky { get; }

    /// <summary>Imgflip, which "E2E fake Reddit" moves here too: the meme templates "Fix meme templates" shows.</summary>
    public Imgflip Imgflip { get; }

    /// <summary>Reddit's chat, which the fake answers with a plain page of its own: its links.</summary>
    public ChatPage Chat { get; }

    /// <summary>Guards the world: the server answers on its own threads while a test builds.</summary>
    internal object Sync { get; } = new();

    /// <summary>How the login page looks.</summary>
    public LoginPageOptions LoginPage { get; private set; } = new();

    // The account "E2E fake Reddit" hands the app at its next start (LogInAtStart), until the app asks.
    private Account? loginAtStart;

    /// <summary>
    /// Refuses Reddit's API to a logged-out app, as Reddit does to BaconReader: <c>403 Blocked</c>, whatever its
    /// client (on by default). The login, BaconReader's own server and media still answer.
    /// </summary>
    public bool BlocksLoggedOut { get; set; } = true;

    /// <summary>
    /// Refuses "load more comments" (<c>api/morechildren</c>), as Reddit does to apps since October 2026: <c>403
    /// Blocked</c>, with its "You've been blocked by network security." page (off by default). A post's and a comment's
    /// threads still answer.
    /// </summary>
    public bool BlocksMoreChildren { get; set; }

    /// <summary>The accounts, in the order they were made.</summary>
    public ImmutableArray<Account> Accounts => Read(() => accounts.ToImmutableArray());

    /// <summary>The subreddits, in the order they were made.</summary>
    public ImmutableArray<Subreddit> Subreddits => Read(() => subreddits.ToImmutableArray());

    /// <summary>The posts, in the order they were made.</summary>
    public ImmutableArray<Post> Posts => Read(() => posts.ToImmutableArray());

    /// <summary>The file the media store holds at <paramref name="path"/> (<c>i.redd.it/x.gif</c>), or null.</summary>
    public MediaFile? Media(string path) => Read(() => FindMedia(path));

    /// <summary>Every request the fake received, but those under <c>/_fake/</c>.</summary>
    public ImmutableArray<RecordedRequest> Requests => Read(() => requests.ToImmutableArray());

    /// <summary>The requests no endpoint answers: the fake said 404. A scenario should end with none.</summary>
    public ImmutableArray<RecordedRequest> Unhandled => Read(() => unhandled.ToImmutableArray());

    /// <summary>The actions the app sent (votes, saves, comments, subscriptions…).</summary>
    public ImmutableArray<RecordedAction> Actions => Read(() => actions.ToImmutableArray());

    /// <summary>What the login saw of the app: its client ID, redirect URI and User-Agent, at each step.</summary>
    public ImmutableArray<LoginSeen> Logins => Read(() => logins.ToImmutableArray());

    /// <summary>Empties the world: no account, no subreddit, no post, no media, empty logs, ids from the start.</summary>
    public void Reset()
    {
        lock (Sync)
        {
            accounts.Clear();
            subreddits.Clear();
            posts.Clear();
            media.Clear();
            tokens.Clear();
            codes.Clear();
            requests.Clear();
            unhandled.Clear();
            actions.Clear();
            logins.Clear();
            troubles.Clear();
            troubleHits.Clear();
            avatars.Clear();
            shareLinks.Clear();
            Imgur.Reset();
            RedGifs.Reset();
            YouTube.Reset();
            X.Reset();
            Bluesky.Reset();
            Imgflip.Reset();
            Chat.Reset();
            LoginPage = new LoginPageOptions();
            loginAtStart = null;
            BlocksLoggedOut = true;
            BlocksMoreChildren = false;
            // Reddit's ids are base 36; starting at 36^4 makes them five characters, like an old post's.
            nextId = 36L * 36 * 36 * 36;
            nextOrder = 0;
        }
    }

    /// <summary>
    /// Adds an account that logs in with <paramref name="name"/> and <paramref name="password"/>. It was made 400 days
    /// ago, never today's day of the year, so BaconReader doesn't show "Happy Cake Day!".
    /// </summary>
    public Account AddAccount(string name, string password)
    {
        lock (Sync)
        {
            if (FindAccount(name) is not null)
            {
                throw new InvalidOperationException($"The fake Reddit already has an account \"{name}\".");
            }

            var account = new Account(NewId(), name, password, DateTimeOffset.UtcNow.AddDays(-400));
            accounts.Add(account);
            return account;
        }
    }

    /// <summary>
    /// Hands the app a login of the account <paramref name="name"/> at its next start, as if it had logged in through the
    /// login screens: "E2E fake Reddit" asks at the app's start (<c>GET /_e2e/login</c>), and the app starts logged in,
    /// with a token and a refresh token of the account. Once: the start after that is the app's own.
    /// </summary>
    public void LogInAtStart(string name)
    {
        lock (Sync)
        {
            loginAtStart = FindAccount(name) ?? throw new InvalidOperationException($"The fake Reddit has no account \"{name}\".");
        }
    }

    // The account to hand the app at its start, if any, once.
    internal Account? TakeLoginAtStart()
    {
        var account = loginAtStart;
        loginAtStart = null;
        return account;
    }

    /// <summary>The subreddit named <paramref name="name"/> (without "r/"), made as a default subreddit if it's new.</summary>
    public Subreddit Subreddit(string name)
    {
        lock (Sync)
        {
            var bare = BareSubreddit(name);
            if (FindSubreddit(bare) is { } found)
            {
                return found;
            }

            var subreddit = new Subreddit(NewId(), bare, DateTimeOffset.UtcNow.AddYears(-5));
            subreddits.Add(subreddit);
            return subreddit;
        }
    }

    /// <summary>Subscribes <paramref name="account"/> to <paramref name="subreddit"/>: its Front Page shows its posts.</summary>
    public void Subscribe(Account account, string subreddit)
    {
        lock (Sync)
        {
            var name = Subreddit(subreddit).Name;
            if (!account.Subscriptions.Contains(name, StringComparer.OrdinalIgnoreCase))
            {
                account.Subscriptions.Add(name);
            }
        }
    }

    /// <summary>
    /// Adds a post titled <paramref name="title"/> to <paramref name="subreddit"/> (made if new), by "e2e_poster", posted
    /// now: a text post with no text, unless <paramref name="build"/> says otherwise.
    /// </summary>
    public Post AddPost(string subreddit, string title, Action<PostBuilder>? build = null)
    {
        lock (Sync)
        {
            var post = new Post(NewId(), Subreddit(subreddit), title, "e2e_poster", DateTimeOffset.UtcNow, nextOrder++);
            build?.Invoke(new PostBuilder(this, post));
            posts.Add(post);
            return post;
        }
    }

    /// <summary>Adds a top-level comment to <paramref name="post"/>, with Markdown <paramref name="markdown"/>.</summary>
    public Comment AddComment(Post post, string markdown, Action<CommentBuilder>? build = null)
    {
        lock (Sync)
        {
            var comment = new Comment(NewId(), post, null, "e2e_commenter", markdown, DateTimeOffset.UtcNow);
            build?.Invoke(new CommentBuilder(this, comment));
            post.Comments.Add(comment);
            return comment;
        }
    }

    /// <summary>Adds a reply to <paramref name="parent"/>, with Markdown <paramref name="markdown"/>.</summary>
    public Comment AddReply(Comment parent, string markdown, Action<CommentBuilder>? build = null)
    {
        lock (Sync)
        {
            var reply = new Comment(NewId(), parent.Post, parent, "e2e_commenter", markdown, DateTimeOffset.UtcNow);
            build?.Invoke(new CommentBuilder(this, reply));
            parent.Replies.Add(reply);
            // As Reddit does, a reply to an account's comment goes to its inbox, unread: a comment reply.
            if (FindAccount(parent.Author) is { } account && !string.Equals(reply.Author, account.Name, StringComparison.OrdinalIgnoreCase))
            {
                account.Inbox.Insert(0, new Message(reply.Id, account, reply.Author, "comment reply", reply.Body, reply.Created) { Reply = reply });
            }

            return reply;
        }
    }

    /// <summary>
    /// Sends <paramref name="to"/> a private message from <paramref name="author"/>, now, unread: the newest of its inbox.
    /// </summary>
    public Message AddMessage(Account to, string subject, string body, string author = "e2e_sender")
    {
        lock (Sync)
        {
            var message = new Message(NewId(), to, author, subject, body, DateTimeOffset.UtcNow);
            to.Inbox.Insert(0, message);
            return message;
        }
    }

    /// <summary>
    /// Records <paramref name="from"/>'s reply to the private message <paramref name="message"/>, as <c>api/comment</c>
    /// on its t4 sends it: a message back to its author, which no inbox of the fake's holds.
    /// </summary>
    public Message ReplyToMessage(Message message, Account from, string body)
    {
        lock (Sync)
        {
            var reply = new Message(NewId(), from, from.Name, "re: " + message.Subject, body, DateTimeOffset.UtcNow) { IsNew = false };
            message.SentReplies.Add(reply);
            return reply;
        }
    }

    /// <summary>
    /// Makes the requests <paramref name="trouble"/> matches wait, or fail, until the world is reset: the first trouble
    /// added that matches a request is the one it gets.
    /// </summary>
    public void AddTrouble(RequestTrouble trouble)
    {
        lock (Sync)
        {
            troubles.Add(trouble);
        }
    }

    /// <summary>
    /// The requests for <paramref name="post"/>'s comments, as BaconReader asks for them:
    /// <c>/r/&lt;sub&gt;/comments/&lt;id&gt;/…</c> or <c>/comments/&lt;id&gt;</c>.
    /// </summary>
    public static Func<string, string, bool> CommentsOf(Post post) =>
        (method, path) => method == "GET" && (path.StartsWith($"/comments/{post.Id}", StringComparison.OrdinalIgnoreCase) || path.StartsWith($"/r/{post.Subreddit.Name}/comments/{post.Id}", StringComparison.OrdinalIgnoreCase));

    /// <summary>The requests for r/<paramref name="subreddit"/>'s posts, in any sort.</summary>
    public static Func<string, string, bool> PostsOf(string subreddit) =>
        (method, path) => method == "GET" && Regex.IsMatch(
            path, $"^/r/{Regex.Escape(BareSubreddit(subreddit))}(/(best|hot|new|top|rising|controversial))?$", RegexOptions.IgnoreCase);

    /// <summary>
    /// Adds a share link that leads to <paramref name="target"/> (a path, <c>/r/e2e/comments/…</c>) and returns its path:
    /// <c>/&lt;owner&gt;/s/&lt;code&gt;</c>, with <paramref name="owner"/> <c>r/&lt;subreddit&gt;</c> or
    /// <c>u/&lt;user&gt;</c>, as Reddit's share button makes them.
    /// </summary>
    public string AddShareLink(string owner, string target)
    {
        lock (Sync)
        {
            var path = $"/{owner}/s/Share{NewId()}";
            shareLinks[path] = target;
            return path;
        }
    }

    /// <summary>Where the share link at <paramref name="path"/> leads, or null when the world has no such link.</summary>
    public string? ShareLinkTarget(string path)
    {
        lock (Sync)
        {
            return shareLinks.GetValueOrDefault(path);
        }
    }

    internal RequestTrouble? TroubleOf(string method, string path)
    {
        lock (Sync)
        {
            var trouble = troubles.FirstOrDefault(trouble => trouble.Matches(method, path) && (trouble.Times is null || troubleHits.GetValueOrDefault(trouble) < trouble.Times));
            if (trouble is not null)
            {
                troubleHits[trouble] = troubleHits.GetValueOrDefault(trouble) + 1;
            }

            return trouble;
        }
    }

    internal Message? FindMessage(string id) =>
        accounts.SelectMany(account => account.Inbox).FirstOrDefault(message => message.Reply is null && string.Equals(message.Id, id, StringComparison.OrdinalIgnoreCase));

    /// <summary>The inbox entry of a fullname: a private message (t4_) or a comment reply (t1_).</summary>
    internal Message? FindInboxEntry(string fullName) =>
        accounts.SelectMany(account => account.Inbox).FirstOrDefault(message => string.Equals(message.FullName, fullName, StringComparison.OrdinalIgnoreCase));

    /// <summary>
    /// Serves <paramref name="bytes"/> at <c>/_media/&lt;path&gt;</c> (<c>i.redd.it/x.gif</c>) and returns its URL, as the
    /// JSON names it: under <see cref="BaseUrl"/>, where "E2E fake Reddit" moves Reddit's media hosts.
    /// </summary>
    public string AddMedia(string path, string contentType, byte[] bytes)
    {
        lock (Sync)
        {
            media[path.TrimStart('/')] = new MediaFile(contentType, bytes);
            return MediaUrl(path);
        }
    }

    /// <summary>
    /// A video uploaded to v.redd.it that no post has (<see cref="AddRedditVideo"/>), as one removed from its post. Returns
    /// its id.
    /// </summary>
    public string AddVideoWithoutPost()
    {
        var id = NewId() + "e2evideo";
        AddRedditVideo(id);
        return id;
    }

    /// <summary>
    /// Serves a video as v.redd.it serves one uploaded to Reddit, under <c>v.redd.it/&lt;id&gt;/</c>: its DASH playlist,
    /// <c>DASHPlaylist.mpd</c>, and the renditions it names next to it, <c>DASH_240.mp4</c> and <c>DASH_AUDIO_128.mp4</c>
    /// (<see cref="MediaAsset.DashPlaylist"/>), and the same as HLS, <c>HLSPlaylist.m3u8</c> (<see cref="MediaAsset.HlsPlaylist"/>);
    /// without a sound track unless <paramref name="withSound"/>. Returns the DASH playlist's path.
    /// </summary>
    public string AddRedditVideo(string id, bool withSound = true)
    {
        var playlist = $"v.redd.it/{id}/DASHPlaylist.mpd";
        var dash = withSound ? MediaAsset.DashPlaylist : MediaAsset.SilentDashPlaylist;
        var hls = withSound ? MediaAsset.HlsPlaylist : MediaAsset.SilentHlsPlaylist;
        AddMedia(playlist, dash.ContentType, dash.Bytes);
        AddMedia($"v.redd.it/{id}/DASH_240.mp4", MediaAsset.DashVideo.ContentType, MediaAsset.DashVideo.Bytes);
        AddMedia($"v.redd.it/{id}/HLSPlaylist.m3u8", hls.ContentType, hls.Bytes);
        AddMedia($"v.redd.it/{id}/HLS_240.m3u8", MediaAsset.HlsVideo.ContentType, MediaAsset.HlsVideo.Bytes);
        if (withSound)
        {
            AddMedia($"v.redd.it/{id}/DASH_AUDIO_128.mp4", MediaAsset.DashAudio.ContentType, MediaAsset.DashAudio.Bytes);
            AddMedia($"v.redd.it/{id}/HLS_AUDIO_128.m3u8", MediaAsset.HlsAudio.ContentType, MediaAsset.HlsAudio.Bytes);
        }

        return playlist;
    }

    /// <summary>The URL a media path is served at: <c>&lt;base&gt;/_media/&lt;path&gt;</c>.</summary>
    public string MediaUrl(string path) => $"{BaseUrl}/_media/{path.TrimStart('/')}";

    internal string NewId()
    {
        lock (Sync)
        {
            return ToBase36(nextId++);
        }
    }

    internal IReadOnlyList<Account> AccountsUnlocked => accounts;

    internal IReadOnlyList<Subreddit> SubredditsUnlocked => subreddits;

    internal IReadOnlyList<Post> PostsUnlocked => posts;

    /// <summary>
    /// A user's fullname, <c>t2_&lt;id&gt;</c>, as the JSON sends it in <c>author_fullname</c>: an account's own, or for
    /// an author without an account (most of them), a stable one made from the name.
    /// </summary>
    public string UserFullName(string name)
    {
        lock (Sync)
        {
            return FindAccount(name)?.FullName ?? "t2_" + name.ToLowerInvariant();
        }
    }

    /// <summary>
    /// Gives <paramref name="user"/> an avatar, a PNG the fake serves, which <c>api/user_data_by_account_ids</c> names
    /// in its <c>profile_img</c>: a picture, or one that is all see-through (<paramref name="seeThrough"/>). Returns the
    /// avatar's path.
    /// </summary>
    public string GiveAvatar(string user, bool seeThrough = false)
    {
        lock (Sync)
        {
            var path = $"styles.redditmedia.com/{NewId()}e2eavatar.png";
            var image = seeThrough ? MediaAsset.SeeThroughPng : MediaAsset.Png;
            AddMedia(path, image.ContentType, image.Bytes);
            avatars[UserFullName(user)] = (user, path);
            return path;
        }
    }

    /// <summary>The user and the avatar's path of a user fullname that has one, or null.</summary>
    internal (string User, string Path)? AvatarOf(string fullName) =>
        avatars.TryGetValue(fullName, out var avatar) ? avatar : null;

    internal Account? FindAccount(string name) =>
        accounts.FirstOrDefault(account => string.Equals(account.Name, name, StringComparison.OrdinalIgnoreCase));

    internal Subreddit? FindSubreddit(string name) =>
        subreddits.FirstOrDefault(subreddit => string.Equals(subreddit.Name, BareSubreddit(name), StringComparison.OrdinalIgnoreCase));

    internal Post? FindPost(string id) =>
        posts.FirstOrDefault(post => string.Equals(post.Id, id, StringComparison.OrdinalIgnoreCase));

    internal Comment? FindComment(string id) =>
        posts.SelectMany(post => Flatten(post.Comments)).FirstOrDefault(comment => string.Equals(comment.Id, id, StringComparison.OrdinalIgnoreCase));

    internal MediaFile? FindMedia(string path) => media.GetValueOrDefault(path);

    internal Account? AccountOfToken(string token) => tokens.GetValueOrDefault(token);

    internal string IssueCode(Account account)
    {
        var code = "code_" + NewId();
        codes[code] = account;
        return code;
    }

    internal Account? RedeemCode(string code) => codes.Remove(code, out var account) ? account : null;

    internal string IssueToken(Account account, string prefix)
    {
        var token = $"{prefix}_{account.Name}_{NewId()}";
        tokens[token] = account;
        return token;
    }

    internal void Record(RecordedRequest request, bool handled)
    {
        lock (Sync)
        {
            requests.Add(request);
            if (!handled)
            {
                unhandled.Add(request);
            }
        }
    }

    internal void Record(RecordedAction action)
    {
        lock (Sync)
        {
            actions.Add(action);
        }
    }

    internal void Record(LoginSeen login)
    {
        lock (Sync)
        {
            logins.Add(login);
        }
    }

    internal static IEnumerable<Comment> Flatten(IEnumerable<Comment> comments) =>
        comments.SelectMany(comment => Flatten(comment.Replies).Prepend(comment));

    private T Read<T>(Func<T> read)
    {
        lock (Sync)
        {
            return read();
        }
    }

    private static string BareSubreddit(string name) =>
        name.StartsWith("/r/", StringComparison.OrdinalIgnoreCase) ? name[3..]
        : name.StartsWith("r/", StringComparison.OrdinalIgnoreCase) ? name[2..]
        : name;

    private static string ToBase36(long value)
    {
        const string Digits = "0123456789abcdefghijklmnopqrstuvwxyz";
        var text = "";
        do
        {
            text = Digits[(int)(value % 36)] + text;
            value /= 36;
        }
        while (value > 0);
        return text;
    }
}
