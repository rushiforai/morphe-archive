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
    private long nextId;
    private long nextOrder;

    internal RedditWorld(string baseUrl)
    {
        BaseUrl = baseUrl.TrimEnd('/');
        Reset();
    }

    /// <summary>The fake's URL as the phone reaches it, which media URLs in the JSON start with.</summary>
    public string BaseUrl { get; }

    /// <summary>Guards the world: the server answers on its own threads while a test builds.</summary>
    internal object Sync { get; } = new();

    /// <summary>How the login page looks.</summary>
    public LoginPageOptions LoginPage { get; private set; } = new();

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
            LoginPage = new LoginPageOptions();
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

    internal RequestTrouble? TroubleOf(string method, string path)
    {
        lock (Sync)
        {
            return troubles.FirstOrDefault(trouble => trouble.Matches(method, path));
        }
    }

    internal Message? FindMessage(string id) =>
        accounts.SelectMany(account => account.Inbox).FirstOrDefault(message => string.Equals(message.Id, id, StringComparison.OrdinalIgnoreCase));

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
