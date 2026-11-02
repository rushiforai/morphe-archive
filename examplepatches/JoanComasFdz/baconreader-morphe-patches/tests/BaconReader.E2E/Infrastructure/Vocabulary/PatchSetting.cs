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

    public partial record PlayVideosInComments;
    public partial record CommentsToLoad;
    public partial record AutoLoadLoadMoreComments;

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
        new PatchSetting.PlayVideosInComments(),
        new PatchSetting.CommentsToLoad(),
        new PatchSetting.AutoLoadLoadMoreComments(),
    ];

    /// <summary>What the app shows for <paramref name="value"/>.</summary>
    public static string ToShownText(this PatchSetting value) =>
        value.Match(
            showImages => "Show images",
            fullWidthByDefault => "Full width by default",
            longPressToDownload => "Long press to download",
            loadImagesOnlyOnWiFi => "Load images only on Wi-Fi",
            playVideosInComments => "Play videos in comments",
            commentsToLoad => "Comments to load",
            autoLoadLoadMoreComments => "Auto-load \"load more comments\"",
            unlisted => unlisted.Shown);

    /// <summary>The case the app's <paramref name="shown"/> text names, or <see cref="PatchSetting.Unlisted"/>.</summary>
    public static PatchSetting ReadPatchSetting(string shown) =>
        Listed.FirstOrDefault(value => value.ToShownText() == shown) ?? new PatchSetting.Unlisted(shown);
}
