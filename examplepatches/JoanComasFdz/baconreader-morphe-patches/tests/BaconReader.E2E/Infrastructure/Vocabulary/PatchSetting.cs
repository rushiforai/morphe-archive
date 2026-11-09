// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using Dunet;

namespace BaconReader.E2E.Infrastructure.Vocabulary;

/// <summary>A setting of the patches, as their settings name it. A case is added when a test needs it.</summary>
[Union]
public partial record PatchSetting
{
    public partial record ShowImages;

    public partial record FullWidthByDefault;

    public partial record LongPressToDownload;

    public partial record LoadImagesOnlyOnWiFi;

    public partial record LoadImagesOnlyWhenTapped;

    public partial record PlayVideosInComments;
    public partial record CommentsToLoad;
    public partial record AutoLoadLoadMoreComments;
    public partial record JavaScriptInLinkPosts;
    public partial record BlockedSites;
    public partial record AllowedSites;
    public partial record ShowUserAvatars;
    public partial record AvatarSize;
    public partial record AvatarBackground;
    public partial record AutoplayVideosInDetailView;
    public partial record PreviewWhileLoading;
    public partial record ShowYouTubeVideoTitles;
    public partial record ShowYouTubeThumbnails;
    public partial record ShowXPosts;
    public partial record ShowBlueskyPosts;

    /// <summary>"Reddit chat" keeps Reddit's copies of chat messages out of the inbox and counts them next to Chat.</summary>
    public partial record ChatMessagesApartFromTheInbox;

    /// <summary>"Account colors"' one setting, in its section of the same title: the circles and the line.</summary>
    public partial record AccountColors;

    /// <summary>What the app shows that no case names yet: a failing assertion names it as the app shows it.</summary>
    public partial record Unlisted(string Shown);
}

/// <summary>What the app shows for each <see cref="PatchSetting"/>: the only place those strings live.</summary>
public static class PatchSettingShowing
{
    /// <summary>Every setting a case names.</summary>
    public static IReadOnlyList<PatchSetting> Listed { get; } =
    [
        new PatchSetting.ShowImages(),
        new PatchSetting.FullWidthByDefault(),
        new PatchSetting.LongPressToDownload(),
        new PatchSetting.LoadImagesOnlyOnWiFi(),
        new PatchSetting.LoadImagesOnlyWhenTapped(),
        new PatchSetting.PlayVideosInComments(),
        new PatchSetting.CommentsToLoad(),
        new PatchSetting.AutoLoadLoadMoreComments(),
        new PatchSetting.JavaScriptInLinkPosts(),
        new PatchSetting.BlockedSites(),
        new PatchSetting.AllowedSites(),
        new PatchSetting.ShowUserAvatars(),
        new PatchSetting.AvatarSize(),
        new PatchSetting.AvatarBackground(),
        new PatchSetting.AutoplayVideosInDetailView(),
        new PatchSetting.PreviewWhileLoading(),
        new PatchSetting.ShowYouTubeVideoTitles(),
        new PatchSetting.ShowYouTubeThumbnails(),
        new PatchSetting.ShowXPosts(),
        new PatchSetting.ShowBlueskyPosts(),
        new PatchSetting.ChatMessagesApartFromTheInbox(),
        new PatchSetting.AccountColors(),
    ];

    /// <summary>What the app shows for <paramref name="value"/>.</summary>
    public static string ToShownText(this PatchSetting value) =>
        value.Match(
            showImages => "Show images",
            fullWidthByDefault => "Full width by default",
            longPressToDownload => "Long press to download",
            loadImagesOnlyOnWiFi => "Load images only on Wi-Fi",
            loadImagesOnlyWhenTapped => "Load images only when tapped",
            playVideosInComments => "Play videos in comments",
            commentsToLoad => "Comments to load",
            autoLoadLoadMoreComments => "Auto-load \"load more comments\"",
            javaScriptInLinkPosts => "JavaScript in link posts",
            blockedSites => "Blocked sites",
            allowedSites => "Allowed sites",
            showUserAvatars => "Show user avatars",
            avatarSize => "Avatar size",
            avatarBackground => "Avatar background",
            autoplayVideosInDetailView => "Autoplay videos in Detail View",
            previewWhileLoading => "Preview while loading",
            showYouTubeVideoTitles => "Show YouTube video titles",
            showYouTubeThumbnails => "Show YouTube thumbnails",
            showXPosts => "Show X posts",
            showBlueskyPosts => "Show Bluesky posts",
            chatMessagesApartFromTheInbox => "Chat messages apart from the inbox",
            accountColors => "Account colors",
            unlisted => unlisted.Shown);

    /// <summary>The case the app's <paramref name="shown"/> text names, or <see cref="PatchSetting.Unlisted"/>.</summary>
    public static PatchSetting ReadPatchSetting(string shown) =>
        Listed.FirstOrDefault(value => value.ToShownText() == shown) ?? new PatchSetting.Unlisted(shown);
}
