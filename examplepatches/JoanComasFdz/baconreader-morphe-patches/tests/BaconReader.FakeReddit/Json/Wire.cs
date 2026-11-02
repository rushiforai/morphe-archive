// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Text.Encodings.Web;
using System.Text.Json;
using System.Text.Json.Serialization;

namespace BaconReader.FakeReddit.Json;

// What the fake sends, field by field as Reddit does. BaconReader parses it with Jackson, which needs every Thing to be
// exactly {"kind": …, "data": …}, kind first and nothing else, and some fields always there (over_18, is_self, saved,
// hidden, author…): a missing one arrives as null and crashes the app. So every record holds every field Reddit sends,
// with Reddit's defaults, in Reddit's names (snake_case; a few with a digit are named by hand).

/// <summary>The JSON options every answer is written with.</summary>
public static class RedditJson
{
    public static JsonSerializerOptions Options { get; } = new()
    {
        PropertyNamingPolicy = JsonNamingPolicy.SnakeCaseLower,
        DefaultIgnoreCondition = JsonIgnoreCondition.Never,
        // Reddit doesn't escape < > & ' in JSON strings; nor does the fake, so its answers read like Reddit's.
        Encoder = JavaScriptEncoder.UnsafeRelaxedJsonEscaping,
    };

    public static string Serialize<T>(T value) => JsonSerializer.Serialize(value, Options);
}

/// <summary>A Reddit thing: its kind (t1, t3, t5, Listing…) and its data, in that order.</summary>
public sealed record Thing(string Kind, object Data);

/// <summary>A Listing's data: a page of things, and the fullnames that page before and after it.</summary>
public sealed record ListingData(string? After, int Dist, string Modhash, object? GeoFilter, IReadOnlyList<Thing> Children, string? Before)
{
    public static Thing Listing(IReadOnlyList<Thing> children, string? after = null, string? before = null) =>
        new("Listing", new ListingData(after, children.Count, "", null, children, before));
}

/// <summary>A post (t3), as Reddit's listings send it.</summary>
public sealed record LinkData
{
    public object? ApprovedAtUtc { get; init; }
    public string Subreddit { get; init; } = "";
    public string Selftext { get; init; } = "";
    public string AuthorFullname { get; init; } = "";
    public bool Saved { get; init; }
    public object? ModReasonTitle { get; init; }
    public int Gilded { get; init; }
    public bool Clicked { get; init; }
    public string Title { get; init; } = "";
    public object[] LinkFlairRichtext { get; init; } = [];
    public string SubredditNamePrefixed { get; init; } = "";
    public bool Hidden { get; init; }
    public object? Pwls { get; init; }
    public string? LinkFlairCssClass { get; init; }
    public int Downs { get; init; }
    public int? ThumbnailHeight { get; init; }
    public object? TopAwardedType { get; init; }
    public bool HideScore { get; init; }
    public string Name { get; init; } = "";
    public bool Quarantine { get; init; }
    public string LinkFlairTextColor { get; init; } = "dark";
    public double UpvoteRatio { get; init; } = 1.0;
    public object? AuthorFlairBackgroundColor { get; init; }
    public string SubredditType { get; init; } = "public";
    public int Ups { get; init; }
    public int TotalAwardsReceived { get; init; }
    public Dictionary<string, object> MediaEmbed { get; init; } = [];
    public int? ThumbnailWidth { get; init; }
    public object? AuthorFlairTemplateId { get; init; }
    public bool IsOriginalContent { get; init; }
    public object[] UserReports { get; init; } = [];
    public object? SecureMedia { get; init; }
    public bool IsRedditMediaDomain { get; init; }
    public bool IsMeta { get; init; }
    public object? Category { get; init; }
    public Dictionary<string, object> SecureMediaEmbed { get; init; } = [];
    public string? LinkFlairText { get; init; }
    public bool CanModPost { get; init; }
    public int Score { get; init; }
    public object? ApprovedBy { get; init; }
    public bool IsCreatedFromAdsUi { get; init; }
    public bool AuthorPremium { get; init; }
    public string Thumbnail { get; init; } = "self";
    public object Edited { get; init; } = false;
    public object? AuthorFlairCssClass { get; init; }
    public object[] AuthorFlairRichtext { get; init; } = [];
    public Dictionary<string, object> Gildings { get; init; } = [];
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? PostHint { get; init; }
    public object? ContentCategories { get; init; }
    public bool IsSelf { get; init; }
    public object? ModNote { get; init; }
    public double Created { get; init; }
    public string LinkFlairType { get; init; } = "text";
    public object? Wls { get; init; }
    public object? RemovedByCategory { get; init; }
    public object? BannedBy { get; init; }
    public string AuthorFlairType { get; init; } = "text";
    public string Domain { get; init; } = "";
    public bool AllowLiveComments { get; init; }
    public string? SelftextHtml { get; init; }
    public bool? Likes { get; init; }
    public object? SuggestedSort { get; init; }
    public object? BannedAtUtc { get; init; }
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? UrlOverriddenByDest { get; init; }
    public object? ViewCount { get; init; }
    public bool Archived { get; init; }
    public bool NoFollow { get; init; }
    public bool IsCrosspostable { get; init; } = true;
    public bool Pinned { get; init; }
    [JsonPropertyName("over_18")]
    public bool Over18 { get; init; }
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public Preview? Preview { get; init; }
    public object[] AllAwardings { get; init; } = [];
    public object[] Awarders { get; init; } = [];
    public bool MediaOnly { get; init; }
    public bool CanGild { get; init; }
    public bool Spoiler { get; init; }
    public bool Locked { get; init; }
    public object? AuthorFlairText { get; init; }
    public object[] TreatmentTags { get; init; } = [];
    public bool Visited { get; init; }
    public object? RemovedBy { get; init; }
    public object? NumReports { get; init; }
    public object? Distinguished { get; init; }
    public string SubredditId { get; init; } = "";
    public bool AuthorIsBlocked { get; init; }
    public object? ModReasonBy { get; init; }
    public object? RemovalReason { get; init; }
    public string LinkFlairBackgroundColor { get; init; } = "";
    public string Id { get; init; } = "";
    public bool IsRobotIndexable { get; init; } = true;
    public object? ReportReasons { get; init; }
    public string Author { get; init; } = "";
    public object? DiscussionType { get; init; }
    public int NumComments { get; init; }
    public bool SendReplies { get; init; } = true;
    public string WhitelistStatus { get; init; } = "all_ads";
    public bool ContestMode { get; init; }
    public object[] ModReports { get; init; } = [];
    public bool AuthorPatreonFlair { get; init; }
    public string? AuthorFlairTextColor { get; init; }
    public string Permalink { get; init; } = "";
    public string ParentWhitelistStatus { get; init; } = "all_ads";
    public bool Stickied { get; init; }
    public string Url { get; init; } = "";
    public int SubredditSubscribers { get; init; }
    public double CreatedUtc { get; init; }
    public int NumCrossposts { get; init; }
    public object? Media { get; init; }
    public bool IsVideo { get; init; }
    public bool IsGallery { get; init; }
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public Dictionary<string, MediaMetadata>? MediaMetadata { get; init; }
}

/// <summary>A post's <c>preview</c>: its images, each with its source and smaller resolutions.</summary>
public sealed record Preview(IReadOnlyList<PreviewImage> Images, bool Enabled = true);

public sealed record PreviewImage(PreviewSource Source, IReadOnlyList<PreviewSource> Resolutions, Dictionary<string, object> Variants, string Id);

public sealed record PreviewSource(string Url, int Width, int Height);

/// <summary>A comment (t1), as Reddit's comment trees send it.</summary>
public sealed record CommentData
{
    public string SubredditId { get; init; } = "";
    public object? ApprovedAtUtc { get; init; }
    public bool AuthorIsBlocked { get; init; }
    public object? CommentType { get; init; }
    public object[] Awarders { get; init; } = [];
    public object[] ModReasonBy { get; init; } = [];
    public object? BannedBy { get; init; }
    public string AuthorFlairType { get; init; } = "text";
    public int TotalAwardsReceived { get; init; }
    public string Subreddit { get; init; } = "";
    public object? AuthorFlairTemplateId { get; init; }
    public bool? Likes { get; init; }
    [JsonConverter(typeof(RepliesConverter))]
    public Thing? Replies { get; init; }
    public object[] UserReports { get; init; } = [];
    public bool Saved { get; init; }
    public string Id { get; init; } = "";
    public object? BannedAtUtc { get; init; }
    public object? ModReasonTitle { get; init; }
    public int Gilded { get; init; }
    public bool Archived { get; init; }
    public object? CollapsedReasonCode { get; init; }
    public bool NoFollow { get; init; }
    public string Author { get; init; } = "";
    public bool CanModPost { get; init; }
    public double CreatedUtc { get; init; }
    public bool SendReplies { get; init; } = true;
    public string ParentId { get; init; } = "";
    public int Score { get; init; }
    public string AuthorFullname { get; init; } = "";
    public object? ApprovedBy { get; init; }
    public object? ModNote { get; init; }
    public object[] AllAwardings { get; init; } = [];
    public bool Collapsed { get; init; }
    public string Body { get; init; } = "";
    public object Edited { get; init; } = false;
    public object? TopAwardedType { get; init; }
    public object? AuthorFlairCssClass { get; init; }
    public string Name { get; init; } = "";
    public bool IsSubmitter { get; init; }
    public int Downs { get; init; }
    public object[] AuthorFlairRichtext { get; init; } = [];
    public bool AuthorPatreonFlair { get; init; }
    public string BodyHtml { get; init; } = "";
    public object? RemovalReason { get; init; }
    public object? CollapsedReason { get; init; }
    public object? Distinguished { get; init; }
    public object? AssociatedAward { get; init; }
    public bool Stickied { get; init; }
    public bool AuthorPremium { get; init; }
    public bool CanGild { get; init; }
    public Dictionary<string, object> Gildings { get; init; } = [];
    public bool Unrepliable { get; init; }
    public object? AuthorFlairTextColor { get; init; }
    public bool ScoreHidden { get; init; }
    public string Permalink { get; init; } = "";
    public string SubredditType { get; init; } = "public";
    public bool Locked { get; init; }
    public object? ReportReasons { get; init; }
    public double Created { get; init; }
    public object? AuthorFlairText { get; init; }
    public object[] TreatmentTags { get; init; } = [];
    public string LinkId { get; init; } = "";
    public string SubredditNamePrefixed { get; init; } = "";
    public int Controversiality { get; init; }
    public int Depth { get; init; }
    public object? AuthorFlairBackgroundColor { get; init; }
    public object? CollapsedBecauseCrowdControl { get; init; }
    public object[] ModReports { get; init; } = [];
    public object? NumReports { get; init; }
    public int Ups { get; init; }
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public Dictionary<string, MediaMetadata>? MediaMetadata { get; init; }
}

/// <summary>
/// A "load more comments" (kind <c>more</c>): the comments of one parent a comment tree leaves out, by their ids
/// (<c>children</c>), and how many comments they hold with their replies (<c>count</c>). Named by its first child.
/// </summary>
public sealed record MoreData(int Count, string Name, string Id, string ParentId, int Depth, IReadOnlyList<string> Children);

/// <summary>What <c>api/morechildren</c> answers (<c>api_type=json</c>): the comments asked for, flat.</summary>
public sealed record MoreChildrenAnswer(MoreChildrenJson Json);

/// <summary>The <c>json</c> of <see cref="MoreChildrenAnswer"/>.</summary>
public sealed record MoreChildrenJson(IReadOnlyList<object> Errors, MoreChildrenData Data);

/// <summary>The <c>data</c> of <see cref="MoreChildrenJson"/>.</summary>
public sealed record MoreChildrenData(IReadOnlyList<Thing> Things);

/// <summary>A private message (t4), as Reddit's inbox sends it.</summary>
public sealed record MessageData
{
    public object? FirstMessage { get; init; }
    public object? FirstMessageName { get; init; }
    public object? Subreddit { get; init; }
    public object? Likes { get; init; }
    [JsonConverter(typeof(RepliesConverter))]
    public Thing? Replies { get; init; }
    public string AuthorFullname { get; init; } = "";
    public string Id { get; init; } = "";
    public string Subject { get; init; } = "";
    public object? AssociatedAwardingId { get; init; }
    public int Score { get; init; }
    public string Author { get; init; } = "";
    public object? NumComments { get; init; }
    public object? ParentId { get; init; }
    public object? SubredditNamePrefixed { get; init; }
    public bool New { get; init; }
    public string Type { get; init; } = "unknown";
    public string Body { get; init; } = "";
    public string Dest { get; init; } = "";
    public bool WasComment { get; init; }
    public string BodyHtml { get; init; } = "";
    public string Name { get; init; } = "";
    public double Created { get; init; }
    public double CreatedUtc { get; init; }
    public string Context { get; init; } = "";
    public object? Distinguished { get; init; }
}

/// <summary>
/// One entry of a comment's or a text post's <c>media_metadata</c>: an uploaded image or GIF, whose <c>s</c> holds its
/// full size (and a GIF's MP4), or a video (<c>RedditVideo</c>), with its playlists and size instead.
/// </summary>
public sealed record MediaMetadata(string Status, string E, string Id)
{
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? M { get; init; }

    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public IReadOnlyList<MediaSize>? P { get; init; }

    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public MediaSize? S { get; init; }

    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public int? X { get; init; }

    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public int? Y { get; init; }

    [JsonPropertyName("dashUrl"), JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? DashUrl { get; init; }

    [JsonPropertyName("hlsUrl"), JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? HlsUrl { get; init; }

    [JsonPropertyName("isGif"), JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public bool? IsGif { get; init; }
}

/// <summary>A size of an uploaded image: its URL (<c>u</c>, or <c>gif</c> and <c>mp4</c> for a GIF), width and height.</summary>
public sealed record MediaSize(int Y, int X)
{
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? U { get; init; }

    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? Gif { get; init; }

    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? Mp4 { get; init; }
}

/// <summary>A subreddit (t5).</summary>
public sealed record SubredditData
{
    public object? UserFlairBackgroundColor { get; init; }
    public object? SubmitTextHtml { get; init; }
    public bool RestrictPosting { get; init; } = true;
    public bool? UserIsBanned { get; init; }
    public string DisplayName { get; init; } = "";
    public string HeaderImg { get; init; } = "";
    public string Title { get; init; } = "";
    public string PrimaryColor { get; init; } = "";
    public int? ActiveUserCount { get; init; }
    public string IconImg { get; init; } = "";
    public string DisplayNamePrefixed { get; init; } = "";
    public int? AccountsActive { get; init; }
    public string PublicTraffic { get; init; } = "false";
    public int Subscribers { get; init; }
    public string Name { get; init; } = "";
    public bool Quarantine { get; init; }
    public bool HideAds { get; init; }
    public string PublicDescription { get; init; } = "";
    public string CommunityIcon { get; init; } = "";
    public bool UserIsModerator { get; init; }
    public bool? UserIsSubscriber { get; init; }
    [JsonPropertyName("over18")]
    public bool Over18 { get; init; }
    public string? DescriptionHtml { get; init; }
    public string? PublicDescriptionHtml { get; init; }
    public string Description { get; init; } = "";
    public double Created { get; init; }
    public double CreatedUtc { get; init; }
    public string SubredditType { get; init; } = "public";
    public string Id { get; init; } = "";
    public string Url { get; init; } = "";
    public string Lang { get; init; } = "en";
    public string AdvertiserCategory { get; init; } = "";
}

/// <summary>An account (t2), as <c>/api/v1/me</c> and <c>/user/&lt;name&gt;/about</c> send it.</summary>
public sealed record UserData
{
    public bool IsEmployee { get; init; }
    public bool HasVisitedNewProfile { get; init; }
    public bool IsFriend { get; init; }
    public bool PrefNoProfanity { get; init; } = true;
    public bool HasExternalAccount { get; init; }
    public bool PrefGeopopular { get; init; }
    public bool IsSponsor { get; init; }
    public int GoldCreddits { get; init; }
    public object? GoldExpiration { get; init; }
    public bool HasGoldSubscription { get; init; }
    public int NumFriends { get; init; }
    public bool HasAndroidSubscription { get; init; }
    public bool Verified { get; init; } = true;
    public bool HasPaypalSubscription { get; init; }
    public bool HasSubscribedToPremium { get; init; }
    public string Id { get; init; } = "";
    public bool CanCreateSubreddit { get; init; } = true;
    [JsonPropertyName("over_18")]
    public bool Over18 { get; init; }
    public bool IsGold { get; init; }
    public bool IsMod { get; init; }
    public int AwarderKarma { get; init; }
    public bool HasVerifiedEmail { get; init; } = true;
    public string IconImg { get; init; } = "";
    public bool HideFromRobots { get; init; }
    public int LinkKarma { get; init; } = 1;
    public bool PrefShowTrending { get; init; } = true;
    public int TotalKarma { get; init; } = 2;
    public bool PrefNightmode { get; init; }
    public int AwardeeKarma { get; init; }
    public double Created { get; init; }
    public double CreatedUtc { get; init; }
    public bool InBeta { get; init; }
    public int CommentKarma { get; init; } = 1;
    public bool AcceptFollowers { get; init; } = true;
    public bool HasSubscribed { get; init; } = true;
    public bool HasMail { get; init; }
    public bool HasModMail { get; init; }
    public int InboxCount { get; init; }
    public string Name { get; init; } = "";
    public bool IsBlocked { get; init; }
}

/// <summary>Reddit's <c>replies</c>: a Listing of the replies, or <c>""</c> when a comment has none.</summary>
public sealed class RepliesConverter : JsonConverter<Thing?>
{
    public override bool HandleNull => true;

    public override Thing? Read(ref Utf8JsonReader reader, Type typeToConvert, JsonSerializerOptions options) =>
        reader.TokenType == JsonTokenType.String ? null : JsonSerializer.Deserialize<Thing>(ref reader, options);

    public override void Write(Utf8JsonWriter writer, Thing? value, JsonSerializerOptions options)
    {
        if (value is null)
        {
            writer.WriteStringValue("");
        }
        else
        {
            JsonSerializer.Serialize(writer, value, options);
        }
    }
}
